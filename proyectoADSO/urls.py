"""
URL configuration for proyectoADSO project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from proyectoADSO.views import mostrarIndex, insertarCargo, listadoCargos, insertarEmpleado, listadoEmpleados, insertarUsuario, ingresoUsuario, logoutUsuario, insertarFactura, insertarProducto, listadoProductos, empleadoAPI, menuReportes, consultarFactura, consultar_factura_API, reporteDiario, reporteD_API, reporteD_DETALLE_API, reporteGeneral, reporteMensual, reporteM_API, reporteAnual, reporteA_API

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', mostrarIndex),
    path('Cargo/Insertar/', insertarCargo),
    path('Cargo/Listado/', listadoCargos),
    #path('Cargo/Listado/Borrar/<int:id>', borrarCargo), ACTUALMENTE DESHABILITADOS PARA EVITAR CAMBIOS EN LAS FACTURAS
    #path('Cargo/Listado/Edicion/<int:id>', edicionCargo), ACTUALMENTE DESHABILITADOS PARA EVITAR CAMBIOS EN LAS FACTURAS
    path('Empleado/Insertar/', insertarEmpleado),
    path('Empleado/Listado/', listadoEmpleados),
    #path('Empleado/Listado/Borrar/<int:idempleado>', borrarEmpleados), ACTUALMENTE DESHABILITADOS PARA EVITAR CAMBIOS EN LAS FACTURAS
    #path('Empleado/Listado/Edicion/<int:id>', edicionEmpleados), ACTUALMENTE DESHABILITADOS PARA EVITAR CAMBIOS EN LAS FACTURAS
    path('Productos/Insertar/', insertarProducto),
    path('Productos/Listado/', listadoProductos),
    #path('Productos/Borrar/<int:id>', borrarProductos), ACTUALMENTE DESHABILITADOS PARA EVITAR CAMBIOS EN LAS FACTURAS
    #path('Productos/Edicion/<int:id>', edicionProductos), ACTUALMENTE DESHABILITADOS PARA EVITAR CAMBIOS EN LAS FACTURAS
    path('Usuario/Insertar/', insertarUsuario),
    path('Usuario/Ingreso/', ingresoUsuario),
    path('Usuario/Logout/', logoutUsuario),
    path('Factura/Insertar/', insertarFactura),
    path('Empleado/API/<int:cedula>', empleadoAPI),
    path('Reportes/Generar/', menuReportes),
    path('Reportes/Consultar/Factura/', consultarFactura),
    path('Reportes/Consultar/Factura/<int:f_id>', consultar_factura_API),
    path('Reportes/Generar/Diario/', reporteDiario),
    path('Reportes/Generar/Diario/<str:fecha_factura>', reporteD_API),
    path('Reportes/Generar/Diario/Detalle/<int:f_id>', reporteD_DETALLE_API),
    path('Reportes/Generar/General/', reporteGeneral),
    path('Reportes/Generar/Mensual/', reporteMensual),
    path('Reportes/Generar/Mensual/<str:fecha_factura_mes>/<str:fecha_factura_año>', reporteM_API),
    path('Reportes/Generar/Anual/', reporteAnual),
    path('Reportes/Generar/Anual/<str:fecha_fac>', reporteA_API),
]
