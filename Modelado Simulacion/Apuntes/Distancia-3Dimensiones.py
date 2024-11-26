import math

# Funcion para obtener la distancia den 3 dimensiones

def get_fuerza_3d(cuerpo1, cuerpo2):
    x = (cuerpo2.x - cuerpo1.x)**2
    y = (cuerpo2.y - cuerpo1.y)**2
    z = (cuerpo2.z - cuerpo1.z)**2

    return math.sqrt(x+y+z)


# Clase Objeto para utlizarla con la funcion anterior
class Cuerpo:
    def __init__(self, x, y, z):
              self.x = x
              self.y = y
              self.z = z


# Ejemplo
cuerpo1 = Cuerpo(1,2,3)
cuerpo2 = Cuerpo(4,2,5)

distancia = get_fuerza_3d(cuerpo1,cuerpo2)
print(distancia)
