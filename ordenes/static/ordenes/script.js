var ordenes = [];
var editId = 0;
var clientesLista = [];
var vendedoresLista = [];
var recetas = {};
var stockMat = {};

function token() {
    return document.querySelector("[name=csrfmiddlewaretoken]").value;
}

function $(id) {
    return document.getElementById(id);
}

function pesos(n) {
    return "$ " + Number(n || 0).toLocaleString("es-AR", {minimumFractionDigits: 2, maximumFractionDigits: 2});
}

function limpiar(texto) {
    var div = document.createElement("div");
    div.textContent = texto == null ? "" : texto;
    return div.innerHTML;
}

function mostrarAviso(texto) {
    var aviso = $("aviso");
    aviso.textContent = texto;
    aviso.style.display = "block";
    setTimeout(function () {
        aviso.style.display = "none";
    }, 3000);
}

function mostrarError(texto) {
    var caja = $("mensajeError");
    caja.textContent = texto;
    caja.style.display = texto ? "block" : "none";
}

function cargarOrdenes() {
    fetch("/api/ovs")
        .then(function (r) { return r.json(); })
        .then(function (datos) {
            ordenes = datos;
            dibujarOrdenes();
            actualizarResumen();
        });
}

function actualizarResumen() {
    var pendientes = 0;
    var monto = 0;
    for (var i = 0; i < ordenes.length; i++) {
        if (ordenes[i].estado == "Pendiente") pendientes++;
        monto += Number(ordenes[i].subtotal || 0);
    }
    $("totalOrdenes").textContent = ordenes.length;
    $("totalPendientes").textContent = pendientes;
    $("totalProcesadas").textContent = ordenes.length - pendientes;
    $("montoTotal").textContent = pesos(monto);
}

function dibujarOrdenes() {
    var texto = $("buscar").value.toLowerCase();
    var filtro = $("filtro").value;
    var html = "";
    for (var i = 0; i < ordenes.length; i++) {
        var o = ordenes[i];
        if (filtro != "todas" && o.estado != filtro) continue;
        if (texto != "" && (o.cliente + " " + o.id).toLowerCase().indexOf(texto) == -1) continue;
        var pendiente = o.estado == "Pendiente";
        var bloqueo = pendiente ? "" : "disabled";
        html += "<tr>" +
            "<td><strong>#" + o.id + "</strong></td>" +
            "<td>" + limpiar(o.cliente) + "</td>" +
            "<td>" + limpiar(o.fecha) + "</td>" +
            "<td>" + limpiar(o.detalle) + "</td>" +
            "<td>" + pesos(o.subtotal) + "</td>" +
            "<td><span class='estado " + (pendiente ? "estado-pendiente" : "estado-procesada") + "'>" + o.estado + "</span></td>" +
            "<td><button class='boton boton-gris boton-chico' " + bloqueo + " onclick='abrirVentana(" + o.id + ")'>Modificar</button>" +
            "<button class='boton boton-peligro boton-chico' " + bloqueo + " onclick='eliminarOrden(" + o.id + ")'>Eliminar</button></td>" +
            "</tr>";
    }
    if (html == "") {
        html = "<tr><td colspan='7' class='vacio'>No hay órdenes para mostrar.</td></tr>";
    }
    $("listaOrdenes").innerHTML = html;
}

function llenarSelect(select, filas, elegido) {
    var html = "";
    for (var i = 0; i < filas.length; i++) {
        html += "<option value='" + filas[i].id + "'>" + limpiar(filas[i].nombre) + "</option>";
    }
    select.innerHTML = html;
    if (elegido) select.value = elegido;
}

function mostrarClientes(idVendedor, elegido) {
    var filas = [];
    for (var i = 0; i < clientesLista.length; i++) {
        if (clientesLista[i].idvendedor == idVendedor) filas.push(clientesLista[i]);
    }
    llenarSelect($("cliente"), filas, elegido);
}

function cambioVendedor() {
    mostrarClientes($("vendedor").value, 0);
    cargarProductos({});
}

async function abrirVentana(id) {
    editId = id;
    mostrarError("");
    $("tituloVentana").textContent = id ? "Modificar OV #" + id : "Nueva orden de venta";
    clientesLista = await (await fetch("/api/clientes")).json();
    vendedoresLista = await (await fetch("/api/vendedores")).json();
    var previas = {};
    var idCliente = 0;
    var idVendedor = 0;
    if (id) {
        var detalle = await (await fetch("/api/ovdet?id=" + id)).json();
        idCliente = detalle[0].idcliente;
        idVendedor = detalle[0].idvendedor;
        for (var i = 0; i < detalle.length; i++) {
            previas[detalle[i].idarticulo] = detalle[i].cantidad;
        }
    }
    llenarSelect($("vendedor"), vendedoresLista, id ? idVendedor : 0);
    mostrarClientes($("vendedor").value, id ? idCliente : 0);
    $("vendedor").disabled = id > 0;
    $("cliente").disabled = id > 0;
    await cargarProductos(previas);
    $("ventana").classList.add("abierto");
}

function cerrarVentana() {
    $("ventana").classList.remove("abierto");
}

function clickFondo(evento) {
    if (evento.target == $("ventana")) cerrarVentana();
}

document.addEventListener("keydown", function (e) {
    if (e.key == "Escape") cerrarVentana();
});

async function cargarProductos(previas) {
    var idCliente = $("cliente").value;
    var productos = await (await fetch("/api/productos?cliente=" + idCliente + "&ov=" + editId)).json();
    var filasReceta = await (await fetch("/api/recetas?cliente=" + idCliente + "&ov=" + editId)).json();

    recetas = {};
    stockMat = {};
    for (var j = 0; j < filasReceta.length; j++) {
        var f = filasReceta[j];
        if (!recetas[f.producto]) recetas[f.producto] = [];
        recetas[f.producto].push({material: f.material, receta: Number(f.receta)});
        stockMat[f.material] = Number(f.disponible);
    }

    var html = "";
    for (var i = 0; i < productos.length; i++) {
        var p = productos[i];
        var valor = previas[p.id] || 0;
        html += "<tr>" +
            "<td>" + limpiar(p.nombre) + "</td>" +
            "<td>" + pesos(p.precio) + "</td>" +
            "<td><span class='estado' id='stock-" + p.id + "'></span></td>" +
            "<td><input type='number' class='cantidad' min='0' step='1' value='" + valor + "'" +
            " data-id='" + p.id + "' data-precio='" + p.precio + "' data-max='' oninput='validar()'>" +
            "<div class='maximo'></div></td>" +
            "</tr>";
    }
    if (html == "") {
        html = "<tr><td colspan='4' class='vacio'>Este cliente no tiene productos.</td></tr>";
    }
    $("listaProductos").innerHTML = html;
    validar();
}

function usoMaterial(receta, cantidad) {
    return Math.ceil(receta * cantidad);
}

function maximoConMaterial(receta, restante) {
    if (receta <= 0) return Infinity;
    var n = Math.max(0, Math.floor(restante / receta));
    while (usoMaterial(receta, n + 1) <= restante) n++;
    while (n > 0 && usoMaterial(receta, n) > restante) n--;
    return n;
}

function validar() {
    var campos = document.querySelectorAll("input.cantidad");
    var total = 0;
    var hayError = false;

    var consumo = {};
    var usoTotal = {};
    for (var i = 0; i < campos.length; i++) {
        var id = campos[i].dataset.id;
        var cant = Math.max(0, Math.floor(Number(campos[i].value || 0)));
        var lista = recetas[id] || [];
        consumo[id] = {};
        for (var k = 0; k < lista.length; k++) {
            var m = lista[k].material;
            var usado = usoMaterial(lista[k].receta, cant);
            consumo[id][m] = usado;
            usoTotal[m] = (usoTotal[m] || 0) + usado;
        }
    }

    for (var i = 0; i < campos.length; i++) {
        var c = campos[i];
        var id = c.dataset.id;
        var lista = recetas[id] || [];
        var cantidad = Number(c.value || 0);
        var maximo = Infinity;
        for (var k = 0; k < lista.length; k++) {
            var m = lista[k].material;
            var restante = stockMat[m] - (usoTotal[m] - consumo[id][m]);
            maximo = Math.min(maximo, maximoConMaterial(lista[k].receta, restante));
        }
        var sinLimite = !isFinite(maximo);

        var insignia = $("stock-" + id);
        var aviso = c.nextElementSibling;
        if (sinLimite) {
            insignia.textContent = "Sin receta";
            insignia.className = "estado estado-neutro";
            aviso.textContent = "sin límite";
            c.dataset.max = "";
        } else {
            insignia.textContent = maximo + " u.";
            insignia.className = "estado " + (maximo > 0 ? "estado-procesada" : "estado-agotado");
            aviso.textContent = "máx. " + maximo;
            c.dataset.max = maximo;
        }

        var pasado = cantidad < 0 || (!sinLimite && cantidad > maximo);
        c.classList.toggle("invalido", pasado);
        aviso.classList.toggle("rojo", pasado);
        if (pasado) hayError = true;
        total += cantidad * Number(c.dataset.precio);
    }

    $("subtotal").textContent = pesos(total);
    $("botonGuardar").disabled = hayError;
    mostrarError(hayError ? "Hay cantidades que superan el stock disponible. Corregilas para poder guardar." : "");
}

async function guardarOrden() {
    var campos = document.querySelectorAll("input.cantidad");
    var items = "";
    for (var i = 0; i < campos.length; i++) {
        var cantidad = Math.floor(Number(campos[i].value || 0));
        if (cantidad > 0) {
            if (items != "") items += ",";
            items += campos[i].dataset.id + ":" + cantidad;
        }
    }
    if (items == "") {
        mostrarError("Cargá al menos un producto con cantidad mayor a 0.");
        return;
    }
    $("botonGuardar").disabled = true;
    var url = "/api/guardar?id=" + editId + "&cliente=" + $("cliente").value + "&vendedor=" + $("vendedor").value + "&items=" + items;
    var r = await (await fetch(url, {method: "POST", headers: {"X-CSRFToken": token()}})).json();
    $("botonGuardar").disabled = false;
    if (!r.ok) {
        mostrarError(r.error);
        return;
    }
    cerrarVentana();
    mostrarAviso(editId ? "OV #" + r.id + " modificada" : "OV generada. Número: " + r.id);
    cargarOrdenes();
}

async function eliminarOrden(id) {
    if (!confirm("¿Eliminar la OV #" + id + "? Se liberan los materiales reservados.")) return;
    var r = await (await fetch("/api/eliminar?id=" + id, {method: "POST", headers: {"X-CSRFToken": token()}})).json();
    mostrarAviso(r.ok ? "OV #" + id + " eliminada" : r.error);
    cargarOrdenes();
}

cargarOrdenes();