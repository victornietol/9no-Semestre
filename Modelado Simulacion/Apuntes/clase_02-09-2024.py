from pov import *

'''
# Crear archivo pov
povEsfera(0,0,0,1)  # Los primeros tres requerimientos son de posicion y el ultimo es el radio

# Para usar povBasico : Explica todo lo que necesita
cad = povBasico() # Este es el encabezado
cad += povLuz(1000,1000,1000,1,1,1)
cad += povCamara(3,3,1,0,0,0)
cad += povEsfera(0,0,0,1)

arch = open("C:/Victor/Trabajos Fes/9no Semestre/Modelado y Simulacion/Apuntes/salida.pov","w")
arch.write(cad)
arch.close()

# Mostrar la cadena que se realizo
print(cad)
'''

# Hacer el tiro parabolico con pov
import math
theta = 45
v = 100

vx = math.cos(math.radians(theta))
vy = math.sin(math.radians(theta))

cad = povBasico() # Este es el encabezado
cad += povLuz(1000,1000,1000,1,1,1)
cad += povCamara(2000,100,100,200,100,0)


for t in range(20):
    x = vx*t
    y = vy*t - 4.9 *t*t
    cad += povEsfera(x,y,0,20)

arch = open("C:/Victor/Trabajos Fes/9no Semestre/Modelado y Simulacion/Apuntes/salida_TParabolico.pov","w")
arch.write(cad)
arch.close()

#print(cad)