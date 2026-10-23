import math
from django.db import connection, transaction
from django.http import JsonResponse
from django.shortcuts import render
from django.views.decorators.http import require_POST


class ErrorOV(Exception):
    pass


def consultar(sql, params=()):
    with connection.cursor() as cursor:
        cursor.execute(sql, params)
        columnas = [c[0] for c in cursor.description]
        return [dict(zip(columnas, fila)) for fila in cursor.fetchall()]


def ejecutar(sql, params=()):
    with connection.cursor() as cursor:
        cursor.execute(sql, params)
        return cursor.lastrowid


def existe(sql, params):
    return len(consultar(sql, params)) > 0


def a_entero(valor):
    try:
        return int(valor)
    except (TypeError, ValueError):
        return 0


def procesada(id_ov):
    return existe("SELECT 1 FROM avance_produccion WHERE idordenventa = %s", [id_ov])


def stock(id_articulo):
    filas = consultar(
        "SELECT COALESCE(SUM(CASE WHEN tipo_movimiento IN ('Ingreso','Liberacion','Ajuste') "
        "THEN cantidad ELSE -cantidad END), 0) AS total FROM stock_movimientos WHERE idarticulo = %s",
        [id_articulo])
    return int(filas[0]["total"])


def movimiento(id_articulo, cantidad, tipo, referencia, id_usr):
    ejecutar(
        "INSERT INTO stock_movimientos (idarticulo, fecha_hora, cantidad, tipo_movimiento, referencia, idusuario) "
        "VALUES (%s, NOW(), %s, %s, %s, %s)",
        [id_articulo, cantidad, tipo, referencia, id_usr])


def precio(id_producto):
    filas = consultar(
        "SELECT COALESCE(p.precio_unit, a.valor, 0) AS precio FROM productos_detalle p "
        "JOIN articulos a ON a.idarticulo = p.idproducto WHERE p.idproducto = %s",
        [id_producto])
    return float(filas[0]["precio"])


def reservar(id_ov, id_producto, cantidad, id_usr):
    receta = consultar("SELECT idmaterial, cantidad FROM recetas_materiales WHERE idarticulo = %s", [id_producto])
    for fila in receta:
        material = fila["idmaterial"]
        necesario = math.ceil(float(fila["cantidad"]) * cantidad)
        disponible = stock(material)
        if disponible < necesario:
            raise ErrorOV("Stock insuficiente del material %s (necesario %s, disponible %s)"
                          % (material, necesario, disponible))
        ejecutar("INSERT INTO reservas_materiales (idordenventa, idarticulo, cantidad_reservada) VALUES (%s, %s, %s)",
                 [id_ov, material, necesario])
        movimiento(material, necesario, "Reserva", "OV %s" % id_ov, id_usr)


def liberar(id_ov, id_usr):
    reservas = consultar("SELECT idarticulo, cantidad_reservada FROM reservas_materiales WHERE idordenventa = %s", [id_ov])
    for fila in reservas:
        movimiento(fila["idarticulo"], fila["cantidad_reservada"], "Liberacion", "OV %s" % id_ov, id_usr)
    ejecutar("DELETE FROM reservas_materiales WHERE idordenventa = %s", [id_ov])


def agregar_items(id_ov, id_cliente, id_usr, items):
    subtotal = 0
    cargados = 0
    for token in items.split(","):
        if token == "":
            continue
        partes = token.split(":")
        id_producto = a_entero(partes[0])
        cantidad = a_entero(partes[1]) if len(partes) > 1 else 0
        if cantidad <= 0:
            raise ErrorOV("Cantidad invalida")
        if not existe("SELECT 1 FROM productos_detalle WHERE idproducto = %s AND idcliente = %s", [id_producto, id_cliente]):
            raise ErrorOV("El producto %s no corresponde al cliente" % id_producto)
        if existe("SELECT 1 FROM ordenes_venta_det WHERE idordenventa = %s AND idarticulo = %s", [id_ov, id_producto]):
            raise ErrorOV("El producto %s esta repetido" % id_producto)
        valor = precio(id_producto)
        ejecutar("INSERT INTO ordenes_venta_det (idordenventa, idarticulo, cantidad, precio_unitario) VALUES (%s, %s, %s, %s)",
                 [id_ov, id_producto, cantidad, valor])
        reservar(id_ov, id_producto, cantidad, id_usr)
        subtotal += valor * cantidad
        cargados += 1
    if cargados == 0:
        raise ErrorOV("La OV debe tener al menos un producto")
    ejecutar("UPDATE ordenes_venta_cab SET subtotal = %s WHERE idordenventa = %s", [subtotal, id_ov])


def respuesta(sql, params=()):
    return JsonResponse(consultar(sql, params), safe=False)


def index(request):
    return render(request, "ordenes/index.html")


def clientes(request):
    # Se devuelve tambien el vendedor de cada cliente para filtrar los clientes por vendedor.
    return respuesta("SELECT idcliente AS id, razsoc AS nombre, idusr AS idvendedor FROM clientes ORDER BY razsoc")


def vendedores(request):
    return respuesta("SELECT idusr AS id, CONCAT(nombre, ' ', apellido) AS nombre FROM usuarios WHERE sector = 'VTA'")


def productos(request):
    id_cliente = a_entero(request.GET.get("cliente"))
    id_ov = a_entero(request.GET.get("ov"))
    return respuesta(
        "SELECT p.idproducto AS id, p.proddetalle AS nombre, COALESCE(p.precio_unit, a.valor, 0) AS precio, "
        "COALESCE((SELECT MIN(FLOOR((COALESCE(s.stock, 0) + COALESCE((SELECT SUM(rm.cantidad_reservada) "
        "FROM reservas_materiales rm WHERE rm.idordenventa = %s AND rm.idarticulo = r.idmaterial), 0)) / r.cantidad)) "
        "FROM recetas_materiales r LEFT JOIN (SELECT idarticulo, SUM(CASE WHEN tipo_movimiento IN ('Ingreso','Liberacion','Ajuste') "
        "THEN cantidad ELSE -cantidad END) AS stock FROM stock_movimientos GROUP BY idarticulo) s "
        "ON s.idarticulo = r.idmaterial WHERE r.idarticulo = p.idproducto), 'sin receta') AS disp "
        "FROM productos_detalle p JOIN articulos a ON a.idarticulo = p.idproducto WHERE p.idcliente = %s",
        [id_ov, id_cliente])


def recetas(request):
    id_cliente = a_entero(request.GET.get("cliente"))
    id_ov = a_entero(request.GET.get("ov"))
    return respuesta(
        "SELECT r.idarticulo AS producto, r.idmaterial AS material, r.cantidad AS receta, "
        "COALESCE((SELECT SUM(CASE WHEN m.tipo_movimiento IN ('Ingreso','Liberacion','Ajuste') "
        "THEN m.cantidad ELSE -m.cantidad END) FROM stock_movimientos m WHERE m.idarticulo = r.idmaterial), 0) "
        "+ COALESCE((SELECT SUM(rm.cantidad_reservada) FROM reservas_materiales rm "
        "WHERE rm.idordenventa = %s AND rm.idarticulo = r.idmaterial), 0) AS disponible "
        "FROM recetas_materiales r JOIN productos_detalle p ON p.idproducto = r.idarticulo "
        "WHERE p.idcliente = %s",
        [id_ov, id_cliente])


def ovs(request):
    return respuesta(
        "SELECT o.idordenventa AS id, c.razsoc AS cliente, o.fecha_pedido AS fecha, o.subtotal, "
        "IF(EXISTS (SELECT 1 FROM avance_produccion a WHERE a.idordenventa = o.idordenventa), 'Procesada', 'Pendiente') AS estado, "
        "(SELECT GROUP_CONCAT(CONCAT(p.proddetalle, ' x', d.cantidad) SEPARATOR ', ') FROM ordenes_venta_det d "
        "JOIN productos_detalle p ON p.idproducto = d.idarticulo WHERE d.idordenventa = o.idordenventa) AS detalle "
        "FROM ordenes_venta_cab o JOIN clientes c ON c.idcliente = o.idcliente ORDER BY o.idordenventa DESC")


def ovdet(request):
    return respuesta(
        "SELECT o.idcliente, o.idvendedor, d.idarticulo, d.cantidad FROM ordenes_venta_cab o "
        "JOIN ordenes_venta_det d ON d.idordenventa = o.idordenventa WHERE o.idordenventa = %s",
        [a_entero(request.GET.get("id"))])


@require_POST
def guardar(request):
    id_ov = a_entero(request.GET.get("id"))
    id_cliente = a_entero(request.GET.get("cliente"))
    id_vendedor = a_entero(request.GET.get("vendedor"))
    items = request.GET.get("items", "")
    try:
        with transaction.atomic():
            if id_ov == 0:
                if not existe("SELECT 1 FROM clientes WHERE idcliente = %s", [id_cliente]):
                    raise ErrorOV("Cliente inexistente")
                if not existe("SELECT 1 FROM usuarios WHERE idusr = %s AND sector = 'VTA'", [id_vendedor]):
                    raise ErrorOV("Vendedor inexistente")
                if not existe("SELECT 1 FROM clientes WHERE idcliente = %s AND idusr = %s", [id_cliente, id_vendedor]):
                    raise ErrorOV("El cliente no pertenece a ese vendedor")
                id_ov = ejecutar("INSERT INTO ordenes_venta_cab (idcliente, fecha_pedido, idvendedor) VALUES (%s, CURDATE(), %s)",
                                 [id_cliente, id_vendedor])
            else:
                cabecera = consultar("SELECT idcliente, idvendedor FROM ordenes_venta_cab WHERE idordenventa = %s", [id_ov])
                if len(cabecera) == 0:
                    raise ErrorOV("La OV no existe")
                if procesada(id_ov):
                    raise ErrorOV("La OV esta procesada, no se puede modificar")
                id_cliente = cabecera[0]["idcliente"]
                id_vendedor = cabecera[0]["idvendedor"]
                liberar(id_ov, id_vendedor)
                ejecutar("DELETE FROM ordenes_venta_det WHERE idordenventa = %s", [id_ov])
            agregar_items(id_ov, id_cliente, id_vendedor, items)
        return JsonResponse({"ok": True, "id": id_ov})
    except ErrorOV as e:
        return JsonResponse({"ok": False, "error": str(e)})
    except Exception as e:
        return JsonResponse({"ok": False, "error": "Error de base de datos: %s" % e})


@require_POST
def eliminar(request):
    id_ov = a_entero(request.GET.get("id"))
    try:
        with transaction.atomic():
            cabecera = consultar("SELECT idvendedor FROM ordenes_venta_cab WHERE idordenventa = %s", [id_ov])
            if len(cabecera) == 0:
                raise ErrorOV("La OV no existe")
            if procesada(id_ov):
                raise ErrorOV("La OV esta procesada, no se puede eliminar")
            liberar(id_ov, cabecera[0]["idvendedor"])
            ejecutar("DELETE FROM ordenes_venta_cab WHERE idordenventa = %s", [id_ov])
        return JsonResponse({"ok": True})
    except ErrorOV as e:
        return JsonResponse({"ok": False, "error": str(e)})
    except Exception as e:
        return JsonResponse({"ok": False, "error": "Error de base de datos: %s" % e})