from django.http import HttpResponse
from django.template import Template, Context
from django.shortcuts import render, redirect
from django.core.serializers import serialize
from proyectoADSO.models import Empleado, Cargo, Producto, Factura, FacturahashProducto
from django.db import connection
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login, logout
from datetime import datetime, date
import json

#region Cargo


def mostrarIndex(request):
    
    if request.user.is_authenticated:
        
        user = request.user.get_full_name()
        return render(request, 'Cargos/index.html', {'user': user})


def insertarCargo(request):
    if request.user.is_authenticated:
        if request.method=="POST":
            if request.POST.get('nombre') and request.POST.get('salario') and request.POST.get('turno_laboral') and request.POST.get('rotacion_laboral') and request.POST.get('descripcion'):
                cargos = Cargo()
                cargos.nombre = request.POST.get('nombre')
                cargos.salario = request.POST.get('salario')
                cargos.turno_laboral = request.POST.get('turno_laboral')
                cargos.rotacion_laboral = request.POST.get('rotacion_laboral')
                cargos.descripcion = request.POST.get('descripcion')
                cargos.save()
                # return redireccion
                return redirect("/Cargo/Listado/")
        else:
            return render(request, 'Cargos/insertar_cargo.html')
    else:
        return redirect('/Usuario/Ingreso/')
    
def listadoCargos(request):
    
    if request.user.is_authenticated:
        
        cargos = Cargo.objects.all()
    
        return render(request,'Cargos/listado_cargo.html', {'cargos': cargos})

    else:
        
        return redirect('/Usuario/Ingreso/')



"""
ACTUALMENTE DESHABILITADOS PARA EVITAR CAMBIOS EN LAS FACTURAS.

def borrarCargo(request, id):
    
    if request.user.is_authenticated:
        
        cargos = Cargo.objects.get(id=id)
    
        cargos.delete()
    
        return redirect("/Cargo/Listado/")

    else:
        
        return redirect('/Usuario/Ingreso/')


def edicionCargo(request, id):
    
    if request.user.is_authenticated:
        
        if request.method=="POST":
            if request.POST.get('nombre') and request.POST.get('salario') and request.POST.get('turno_laboral') and request.POST.get('rotacion_laboral') and request.POST.get('descripcion'):
                cargos = Cargo.objects.get(id=id)
                cargos.nombre = request.POST.get('nombre')
                cargos.salario = request.POST.get('salario')
                cargos.turno_laboral = request.POST.get('turno_laboral')
                cargos.rotacion_laboral = request.POST.get('rotacion_laboral')
                cargos.descripcion = request.POST.get('descripcion')
                cargos.save()
        
            return redirect('/Cargo/Listado/')
            
        else:
            
            uncargo=Cargo.objects.filter(id=id)
            return render(request, 'Cargos/actualizar_cargo.html',{'uncargo':uncargo})

    else:
        
        return redirect('/Usuario/Ingreso/')

"""

#endregion


#region Empleados

    
def insertarEmpleado(request):
    
    if request.user.is_authenticated:
        
        if request.method=="POST":
            if request.POST.get('nombre_emp') and request.POST.get('apellido_emp') and request.POST.get('genero_emp') and request.POST.get('celular_emp') and request.POST.get('correo_emp') and request.POST.get('departamento') and request.POST.get('documento_emp') and request.POST.get('cuenta_bancaria') and request.POST.get('tipo_cuenta') and request.POST.get('cargo_id'):
                insertar = connection.cursor()
                insertar.execute("call insertarEmpleado('"+ request.POST.get('nombre_emp') +"','"+ request.POST.get('apellido_emp') +"','" + request.POST.get('genero_emp') +"','"+ request.POST.get('celular_emp') +"','"+ request.POST.get('correo_emp') +"','"+ request.POST.get('departamento') +"','"+ request.POST.get('documento_emp') +"','"+ request.POST.get('cuenta_bancaria') +"','"+ request.POST.get('tipo_cuenta') +"','"+ request.POST.get('cargo_id')+"')")
            return redirect('/Empleado/Listado/')
        else:
            cargos = Cargo.objects.all()
            return render(request, 'Empleado/insertar.html',{'cargos':cargos})
        
    else:
        
        return redirect('/Usuario/Ingreso/')


def listadoEmpleados(request):
    
    if request.user.is_authenticated:
        
        consultar = connection.cursor()
        consultar.execute("call cargarEmpleados")
    
        return render(request,'Empleado/listado_empleados.html', {'empleados': consultar})

    else:
        
        return redirect('/Usuario/Ingreso/')


"""
ACTUALMENTE DESHABILITADOS PARA EVITAR CAMBIOS EN LAS FACTURAS.

def borrarEmpleados(request, idempleado):
    
    if request.user.is_authenticated:
        
        borrar = connection.cursor()
        borrar.execute("call borrarEmpleado('"+str(idempleado)+"')")
        return redirect("/Empleado/Listado/")
        
    else:
        
        return redirect('/Usuario/Ingreso/')


def edicionEmpleados(request, id):
    
    if request.user.is_authenticated:
        
        if request.method=="POST":
            if request.POST.get('id') and request.POST.get('nombre_emp') and request.POST.get('apellido_emp') and request.POST.get('dias_trabajados') and request.POST.get('salario_esperado') and request.POST.get('genero_emp') and request.POST.get('celular_emp') and request.POST.get('correo_emp') and request.POST.get('departamento') and request.POST.get('documento_emp') and request.POST.get('cuenta_bancaria') and request.POST.get('tipo_cuenta') and request.POST.get('cargo_id'):
                insertar = connection.cursor()
                insertar.execute("call actualizarEmpleados('"+ request.POST.get('id') +"','"+ request.POST.get('nombre_emp') +"','"+ request.POST.get('apellido_emp') +"','"+ request.POST.get('dias_trabajados') +"','"+ request.POST.get('salario_esperado') +"','"+ request.POST.get('genero_emp') +"','"+ request.POST.get('celular_emp') +"','"+ request.POST.get('correo_emp') +"','"+ request.POST.get('departamento') +"','"+ request.POST.get('documento_emp') +"','"+ request.POST.get('cuenta_bancaria') +"','"+ request.POST.get('tipo_cuenta') +"','"+ request.POST.get('cargo_id')+"')")
                return redirect('/Empleado/Listado/')
        
            return redirect('/Empleado/Listado/')
            
        else:
            
            uncargo=Cargo.objects.all()
            unempleado=Empleado.objects.filter(id=id)
            return render(request, 'Empleado/actualizar_empleados.html',{'unempleado':unempleado, 'uncargo':uncargo})

    else:
        
        return redirect('/Usuario/Ingreso/')

"""

#endregion


#region Usuario

def insertarUsuario(request):
    if request.method=="POST":
        if request.POST.get('first_name') and request.POST.get('last_name') and request.POST.get('username') and request.POST.get('email') and request.POST.get('password'):
            usuario = User.objects.create_user(request.POST.get('username'),request.POST.get('email'),request.POST.get('password'))
            usuario.first_name = request.POST.get('first_name')
            usuario.last_name = request.POST.get('last_name')
            usuario.save()
            return redirect('/')
    else:
        return render(request, 'Usuarios/insertar.html')
    
def ingresoUsuario(request):
    if request.method =="POST":
        user = authenticate(username=request.POST.get('username'), password=request.POST.get('password'))
        print(user)
        if user is not None:
            login(request,user)
            return redirect('/')
        else:
            mensaje = "Usuario o Contraseña Incorrectos."
            return render(request, 'Usuarios/login.html',{'mensaje': mensaje})
    mensaje = ""
    return render(request, 'Usuarios/login.html',{'mensaje': mensaje})

def logoutUsuario(request):
    logout(request)
    return redirect('/Usuario/Ingreso/')

#endregion


#region Producto

def insertarProducto(request):
    
    
    if request.user.is_authenticated:
        
        if request.method=="POST":
            
            if request.POST.get('nombre') and request.POST.get('precio'):
                
                producto = Producto()
                producto.nombre = request.POST.get('nombre')
                producto.precio = request.POST.get('precio')
                producto.save()
            
                return redirect("/Productos/Listado/")
            
        else:
                
            return render(request, 'Productos/insertar_productos.html')

    else:
        
        return redirect('/Usuario/Ingreso/')
    
    
    
def listadoProductos(request):
    
    if request.user.is_authenticated:   
    
        productos = Producto.objects.all()
    
        return render(request,'Productos/listado_productos.html', {'productos': productos})
    
    else:
        
        return redirect('/Usuario/Ingreso/')


"""
ACTUALMENTE DESHABILITADOS PARA EVITAR CAMBIOS EN LAS FACTURAS.

def borrarProductos(request, id):
    
    productos = Producto.objects.get(id=id)
    productos.delete()
    return redirect("/Productos/Listado/")


def edicionProductos(request, id):
    
    if request.method=="POST":
        if request.POST.get('nombre') and request.POST.get('precio'):
            producto = Producto.objects.get(id=id)
            producto.nombre = request.POST.get('nombre')
            producto.precio = request.POST.get('precio')
            producto.save()
        
        return redirect('/Productos/Listado/')
            
    else:
        unproducto=Producto.objects.filter(id=id)
        return render(request, 'Productos/actualizar_productos.html',{'unproducto':unproducto})
        
"""

#endregion

#region Factura

def insertarFactura(request):
    
    if request.user.is_authenticated:
    
        if request.method=="POST":
        
            if request.POST.get('documento_emp') and request.POST.get('cantidadProducto[]') and request.POST.get('prod_id[]'):
            
                cantidad= request.POST.getlist('cantidadProducto[]')
                productoID = request.POST.getlist('prod_id[]')
                fecha = date.today()
            
                factura = Factura()
                idemp = request.POST.get('documento_emp')
                factura.empleado = Empleado.objects.get(documento_emp=idemp)
                factura.fecha = fecha
                factura.total = request.POST.get('totalFactura')
                factura.save()
                idfactura = Factura.objects.all().last()
            
                for p in range(0, len(productoID), 1):
                    facturahashproducto = FacturahashProducto()
                    facturahashproducto.cantidad = cantidad[p]
                    facturahashproducto.producto = Producto.objects.get(id=productoID[p])
                    facturahashproducto.factura = Factura.objects.get(id=idfactura.id)
                    facturahashproducto.save()
                
            return redirect('/')
                
            

        else:
        
            productos = Producto.objects.all()
        
            return render(request, 'Factura/insertar_factura.html', {'productos': productos})
        
    else:
        
        return redirect('/Usuario/Ingreso/')


def empleadoAPI(request, cedula):
    empleado = Empleado.objects.filter(documento_emp = cedula)
    empleadojson = serialize('json', empleado)
    return HttpResponse(empleadojson, content_type="application/json")

#endregion


#region Reportes

def menuReportes(request):
    
    if request.user.is_authenticated:
            
        return render(request, 'Reporte/menu_reportes.html')
    
    else:
        
        return redirect('/Usuario/Ingreso/')


def reporteDiario(request):
    
    if request.user.is_authenticated:
            
        return render(request, 'Reporte/reporte_diario.html')
    
    else:
        
        return redirect('/Usuario/Ingreso/')
    

def reporteMensual(request):
    
    if request.user.is_authenticated:
            
        return render(request, 'Reporte/reporte_mensual.html')
    
    else:
        
        return redirect('/Usuario/Ingreso/')
    

def reporteAnual(request):
    
    if request.user.is_authenticated:
            
        return render(request, 'Reporte/reporte_anual.html')
    
    else:
        
        return redirect('/Usuario/Ingreso/')
    

def reporteM_API(request, fecha_factura_mes, fecha_factura_año):

    info_empleado = FacturahashProducto.objects.filter(factura_id__fecha__month=fecha_factura_mes, factura_id__fecha__year=fecha_factura_año).select_related("factura_id__empleado_id")
    info_empleado_json = list(info_empleado.values("factura_id", "factura_id__empleado_id__nombre_emp", "factura_id__empleado_id__apellido_emp", "factura_id__empleado_id__documento_emp", "factura_id__empleado_id__correo_emp", "factura_id__empleado_id__cargo_id__nombre"))

    info_factura = FacturahashProducto.objects.filter(factura_id__fecha__month=fecha_factura_mes, factura_id__fecha__year=fecha_factura_año).select_related("factura_id")
    info_factura_json = list(info_factura.values("factura_id", "factura_id__total"))

    info_detalle = FacturahashProducto.objects.filter(factura_id__fecha__month=fecha_factura_mes, factura_id__fecha__year=fecha_factura_año).select_related("producto_id")
    info_detalle_json = list(info_detalle.values("factura_id", "producto_id__nombre", "producto_id__precio","cantidad"))

    resultados = {
        "empleado": info_empleado_json,
        "factura": info_factura_json,
        "detalle": info_detalle_json,
    }

    return HttpResponse(json.dumps(resultados), content_type="application/json")


def reporteA_API(request, fecha_fac):

    info_empleado = FacturahashProducto.objects.filter(factura_id__fecha__year=fecha_fac).select_related("factura_id__empleado_id")
    info_empleado_json = list(info_empleado.values("factura_id", "factura_id__empleado_id__nombre_emp", "factura_id__empleado_id__apellido_emp", "factura_id__empleado_id__documento_emp", "factura_id__empleado_id__correo_emp", "factura_id__empleado_id__cargo_id__nombre"))

    info_factura = FacturahashProducto.objects.filter(factura_id__fecha__year=fecha_fac).select_related("factura_id")
    info_factura_json = list(info_factura.values("factura_id", "factura_id__total"))

    info_detalle = FacturahashProducto.objects.filter(factura_id__fecha__year=fecha_fac).select_related("producto_id")
    info_detalle_json = list(info_detalle.values("factura_id", "producto_id__nombre", "producto_id__precio","cantidad"))

    resultados = {
        "empleado": info_empleado_json,
        "factura": info_factura_json,
        "detalle": info_detalle_json,
    }

    return HttpResponse(json.dumps(resultados), content_type="application/json")

    
    
def reporteGeneral(request):
    
    if request.user.is_authenticated:
        
        facturas = FacturahashProducto.objects.all()
            
        return render(request,'Reporte/reporte_general.html', {'facturas': facturas})
    
    else:
        
        return redirect('/Usuario/Ingreso/')


def reporteD_API(request, fecha_factura):

    facturas = FacturahashProducto.objects.filter(factura_id__fecha=fecha_factura).select_related("factura_id__empleado_id")

    facturas_json = list(facturas.values("factura_id", "factura_id__total", "factura_id__empleado_id__nombre_emp", "factura_id__empleado_id__apellido_emp", "factura_id__empleado_id__documento_emp", "factura_id__empleado_id__correo_emp", "factura_id__empleado_id__cargo_id__nombre"))

    resultados = {
        "facturas": facturas_json,
    }

    return HttpResponse(json.dumps(resultados), content_type="application/json")


def reporteD_DETALLE_API(request, f_id):

    info_detalle = FacturahashProducto.objects.filter(factura_id=f_id).select_related("producto_id")
    info_detalle_json = list(info_detalle.values("factura_id", "factura_id__total", "producto_id__nombre", "producto_id__precio","cantidad"))

    resultados = {
        "detalle": info_detalle_json,
    }

    return HttpResponse(json.dumps(resultados), content_type="application/json")



def consultarFactura(request):
    
    if request.user.is_authenticated:
            
        return render(request, 'Reporte/consultar_facturas.html')
    
    else:
        
        return redirect('/Usuario/Ingreso/')
    

def consultar_factura_API(request, f_id):
    
    info_empleado = FacturahashProducto.objects.filter(factura_id=f_id).select_related("factura_id__empleado_id")
    info_empleado_json = list(info_empleado.values("factura_id", "factura_id__empleado_id__nombre_emp", "factura_id__empleado_id__apellido_emp", "factura_id__empleado_id__documento_emp", "factura_id__empleado_id__cargo_id__nombre"))
    
    info_factura = FacturahashProducto.objects.filter(factura_id=f_id).select_related("factura_id")
    info_factura_json = list(info_factura.values("factura_id", "factura_id__total"))
    
    info_detalle = FacturahashProducto.objects.filter(factura_id=f_id).select_related("producto_id")
    info_detalle_json = list(info_detalle.values("factura_id", "producto_id__nombre", "producto_id__precio","cantidad"))
    
    resultados = {
        "empleado": info_empleado_json,
        "factura": info_factura_json,
        "detalle": info_detalle_json,
    }
    
    return HttpResponse(json.dumps(resultados), content_type="application/json")



#endregion