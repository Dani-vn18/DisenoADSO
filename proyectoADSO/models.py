from django.db import models
        
class Cargo(models.Model):
    
    nombre = models.CharField(max_length=255)
    salario = models.IntegerField()
    turno_laboral = models.CharField(max_length=150)
    rotacion_laboral = models.CharField(max_length=150)
    descripcion = models.CharField(max_length=150)
    
    class Meta:
        db_table = 'cargo'
        

class Producto(models.Model):
    nombre = models.CharField(max_length=250)
    precio = models.FloatField()
    
    class Meta:
        db_table = 'producto'



class Empleado(models.Model):
    nombre_emp = models.CharField(max_length=150)
    apellido_emp = models.CharField(max_length=150)
    dias_trabajados = models.IntegerField()
    salario_esperado = models.IntegerField()
    genero_emp = models.CharField(max_length=20)
    celular_emp = models.CharField(max_length=20)
    correo_emp = models.CharField(max_length=100)
    departamento = models.CharField(max_length=100)
    documento_emp = models.CharField(max_length=100)
    cuenta_bancaria = models.CharField(max_length=80)
    tipo_cuenta = models.CharField(max_length=20)
    
    cargo = models.ForeignKey(Cargo,on_delete=models.PROTECT)
    
    class Meta:
        db_table = 'empleado'
        
        
class Factura(models.Model):
    fecha = models.DateField()
    total = models.CharField(max_length=255)
    
    empleado = models.ForeignKey(Empleado, on_delete=models.PROTECT)
    
    class Meta:
        db_table = 'factura'
        

class FacturahashProducto(models.Model):
    
    cantidad = models.CharField(max_length=255)
    factura = models.ForeignKey(Factura, on_delete=models.PROTECT)
    producto = models.ForeignKey(Producto, on_delete=models.PROTECT)
    class Meta:
        db_table = 'facturahashproducto'
        
        
"""       
class Formulario(models.Model):
    
    pregunta = models.CharField(max_length=255)
    score = models.IntegerField()
    puntuacion_final = models.IntegerField()
    
    class Meta:
        db_table = 'Formulario'
"""