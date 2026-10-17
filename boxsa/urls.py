from django.urls import path
from ordenes import views

urlpatterns = [
    path("", views.index),
    path("api/clientes", views.clientes),
    path("api/vendedores", views.vendedores),
    path("api/productos", views.productos),
    path("api/ovs", views.ovs),
    path("api/ovdet", views.ovdet),
    path("api/guardar", views.guardar),
    path("api/eliminar", views.eliminar),
]
