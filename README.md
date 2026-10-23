# Box SA - Órdenes de Venta

TP SQL N°10 (5° año). Aplicación web para administrar las órdenes de venta (OV) de Box SA, hecha con **Django** y **MySQL**.

## Qué hace

- Crear una OV eligiendo vendedor, cliente y productos.
- Mostrar el stock disponible para fabricar cada producto y limitar las cantidades según los materiales de la receta.
- Reservar los materiales al guardar la OV.
- Modificar o eliminar una OV solo si no está procesada (al hacerlo se liberan los materiales reservados).
- Reporte de OV con buscador y filtro por estado.

## Requisitos

- Python 3
- MySQL 8.0
- Django 5.2 y PyMySQL

## Instalación

1. Importar la base de datos `boxsa.sql` en MySQL (debe quedar creada la base `box_sa`).
2. Instalar las librerías:
   ```
   pip install "django==5.2.*" pymysql
   ```
3. Abrir `boxsa/settings.py` y completar la contraseña de MySQL en `DATABASES`:
   ```python
   "USER": "root",
   "PASSWORD": "tu_contraseña",
   ```
4. Iniciar el servidor (desde la carpeta donde está `manage.py`):
   ```
   python manage.py runserver
   ```
5. Abrir en el navegador: http://127.0.0.1:8000

## Estructura

```
BoxSA/
├── manage.py
├── boxsa/                      configuración (settings, urls)
└── ordenes/
    ├── views.py                lógica y consultas a la base
    ├── templates/ordenes/      index.html
    └── static/ordenes/         estilos.css, script.js
```

## Problemas comunes

- **Access denied for user 'root'**: la contraseña de `settings.py` no coincide con la de tu MySQL.
- **Unknown database 'box_sa'**: falta importar la base.
- **MySQL 8.4 or later is required**: instalá `pip install "django==5.2.*"`.
