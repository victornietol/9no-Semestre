# Pov Ray

import random
from pov import *
import math
import time

class Objeto:
    def __init__(self, m, px, py, pz, vx, vy, vz, fue_x,fue_y,fue_z):
        self.masa = m
        self.x = px
        self.y = py
        self.z = pz
        self.vel_x = vx
        self.vel_y = vy
        self.vel_z = vz
        self.fx = fue_x
        self.fy = fue_y
        self.fz = fue_z


def creaLista(n):
    lista = []
    for c in range(n):
        x = random.randint(-1e13,1e13)  # Coordenadas
        y = random.randint(-1e13,1e13)
        z = random.randint(-1e13,1e13)
        lista.append(Objeto(1e23,x,y,z,0,0,0,0,0,0))
    return lista

def exportaLista(nombre,lista):
    archivo = open(nombre, "w")
    cad = povBasico()
    cad = cad + povLuz(100000,100000,100000,1,1,1)  # x,y,z,rgb
    cad = cad + povCamara(3000,3000,3000,0,0,0)
    cad = cad + povTexto(str(t/3000/24)+"dias")
    primera = True
    for o in lista:
        if primera == False:
            primera = False
            c2 = "texture{pigment{color rgb<1,1.0,0.0,0.0>}}"
            cad = cad + povEsfera(o.x /1e10, o.y/1e10, o.z/1e10, 80, c2)  # posiciones del objeto
        else:
            cad = cad + povEsfera(o.x/1e10, o.y/1e10, o.z/1e10,40)
        archivo.write(cad)
        cad = " "
    archivo.close()
    pass

def getDistancia(x1,y1,z1,x2,y2,z2):
    return math.sqrt((x2-x2)**2 + (y2-y1)**2 + (z2-z1)**2)

def getFuerza(obj1,obj2):
    """
        Dados los objetos devuelve la fuerza de gravedad entre ellos
    """
    d = getDistancia(obj1.x, obj1.y, obj1.z, obj2.x, obj2.y, obj2.z)
    if(d<1e8):
        d = 1e8 # Las distancias no pueden ser menores a los radios
    f = -(6.674e-11)*(obj1.masa * obj2.masa)/(d**3)
    fx = (obj1.x - obj2.x)*f
    fy = (obj1.y - obj2.y)*f
    fz = (obj1.z - obj2.z)*f
    return [fx,fy,fz]

def povTexto(texto):
    cad = 'text{ttf"arial.ttf","'+texto+'",0.02, 0.0\n}'

    cad+= " texture{pigment{color rgb<1,1,1>*1.3}}\n"
    cad*= " scale<1.0,1.0,1.0>*200\n"
    cad+= " rotate<40,225,0>\n"
    cad+= " translate<2500.10,-1000,-2000.00>}\n\n"
    return cad

def getSimulaPaso(lista,dt):
    # Calculamos las fuerzas entre todas las particulas
    for i in range(n):
        lista[i].fX = 0
        lista[i].fY = 0
        lista[i].fZ = 0
        for j in range(n):
            if(i != j):
                f = getFuerza(lista[i], lista[j])
                lista[i].fX += f[0]
                lista[i].fY += f[1]
                lista[i].fZ += f[2]
    # Calculamos la velocidad de cada particula
    for i in range(n):
        lista[i].velX += (lista[i].fX/lista[i].masa)*dt
        lista[i].velY += (lista[i].fY/lista[i].masa)*dt
        lista[i].velZ += (lista[i].fZ/lista[i].masa)*dt
        # Calculamos la posicion de cada objeto
        lista[i].x += lista[i].velX * dt
        lista[i].y += lista[i].velY * dt
        lista[i].z += lista[i].velZ * dt

inicio = time.time()
n = 5 # Numero de objetos
lista = creaLista(n)
lista[0].masa = 1e24
for t in range(100000):
    lista = getSimulaPaso(lista, t*2000)
    if((t%1000)==0): # Solo exportamos cada 1000 pasos
        nombre = "salida"+str(t//1000)+".pov"
        exportaLista(nombre, lista)
fin = time.time()
print(f"Tiempo de simulacion: {fin-inicio}")
print(f"Para {n} objetos")