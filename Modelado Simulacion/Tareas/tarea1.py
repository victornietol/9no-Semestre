"""
# Parte 1
import math
import pov

def getXMax(v, ang):
    return (v**2)*math.sin(ang)/9.8

def getYMax(v, ang):
    vy = v*math.sin(ang)
    t = vy/9.8
    return  (vy*t - 0.5*9.8*t**2)

def tiroPara(v, angulo, t):
    vx = v*math.cos(angulo)
    vy = v*math.sin(angulo)    
    x = vx*t
    y = vy*t - 0.5*9.8*t**2
    return [x, y]
    
v = 50
angulo = 45
angulo = math.radians(angulo)
xmax = getXMax(v, angulo)
salida = open("t1_salida_1.pov", "w")
cad = pov.povBasico()
cad = cad + pov.povCamara(xmax/2,30,xmax*1.5, xmax/2,30,0)
cad = cad + pov.povLuz(100,100,100, 1,1,1)
cad = cad + pov.povPiso()
cad = cad + pov.povTextura(1)
cad = cad + pov.povTextura(2)
cad = cad + pov.povTextura(3)
cad = cad + pov.povTextura(4)
for t in range(100):
    pos = tiroPara(v, angulo, t/10)
    cad = cad+pov.povEsfera(pos[0], pos[1], 0, 2, "texture{t4}")
salida.write(cad)
salida.close()
"""

"""
# Parte 2
import math
import random
import pov

def getXMax(v, ang):
    return (v**2)*math.sin(ang)/9.8

def getYMax(v, ang):
    vy = v*math.sin(ang)
    t = vy/9.8
    return  (vy*t - 0.5*9.8*t**2)

def tiroPara(v, angulo, t):
    vx = v*math.cos(angulo)
    vy = v*math.sin(angulo)    
    x = vx*t
    y = vy*t - 0.5*9.8*t**2
    return [x, y]
    
   
v = 50
angulo = 45
angulo = math.radians(angulo)
xmax = getXMax(v, angulo)
salida = open("t1_salida_2.pov", "w")
cad = pov.povBasico()
cad = cad + pov.povCamara(xmax/2,30,xmax*1.5, xmax/2,30,0)
cad = cad + pov.povLuz(100,100,100, 1,1,1)
cad = cad + pov.povPiso()
cad = cad + pov.povTextura(1)
cad = cad + pov.povTextura(2)
cad = cad + pov.povTextura(3)
cad = cad + pov.povTextura(4)
for t in range(100):
    pos = tiroPara(v, angulo, t/10)
    ale = random.random()
    cad = cad+pov.povEsfera(pos[0], pos[1], 0, 2+ale, "texture{t4}")
salida.write(cad)
salida.close()
"""


"""
# Parte 3
import math
import random
import pov

def getXMax(v, ang):
    return (v**2)*math.sin(ang)/9.8

def getYMax(v, ang):
    vy = v*math.sin(ang)
    t = vy/9.8
    return  (vy*t - 0.5*9.8*t**2)

def tiroPara(v, angulo, t):
    vx = v*math.cos(angulo)
    vy = v*math.sin(angulo)    
    x = vx*t
    y = vy*t - 0.5*9.8*t**2
    return [x, y]


v = 50
angulo = 45
angulo = math.radians(angulo)
xmax = getXMax(v, angulo)
salida = open("t1_salida_3-1.pov", "w")
cad = pov.povBasico()
cad = cad + pov.povCamara(xmax/2,30,xmax*1.5, xmax/2,30,0)
cad = cad + pov.povLuz(100,100,100, 1,1,1)
cad = cad + pov.povPiso()
cad = cad + pov.povTextura(1)
cad = cad + pov.povTextura(2)
cad = cad + pov.povTextura(3)
cad = cad + pov.povTextura(4)
nTiros = 10
for c in range(nTiros):  #la cantidad de tiros parabolicos distintos
    aleV = random.randint(0, v//10)  #la velocidad varia hasta en un décimo
    aleAngulo = random.random()/4  #el ángulo puede variar hasta 1/4 de radian
    for t in range(100):
        ale = random.random()
        pos = tiroPara(v+aleV, angulo+aleAngulo, t/10)
        angRot = math.radians(360/(c+1)) # angulo de rotación
        x = pos[0]*math.cos(angRot)
        z = pos[0]*math.sin(angRot)
        y = pos[1]
        cad = cad+pov.povEsfera(x, y, z, 2+ale)
        salida.write(cad)
        cad = ""
salida.close()
"""



# Parte 4
import math
import random
import pov

def getXMax(v, ang):
    return (v**2)*math.sin(ang)/9.8

def getYMax(v, ang):
    vy = v*math.sin(ang)
    t = vy/9.8
    return  (vy*t - 0.5*9.8*t**2)

def tiroPara(v, angulo, t):
    vx = v*math.cos(angulo)
    vy = v*math.sin(angulo)    
    x = vx*t
    y = vy*t - 0.5*9.8*t**2
    return [x, y]

def blobEsfera(x,y,z,r,fuerza):
    texto = "    sphere{<"+str(x)+","
    texto+= str(y)+", "+str(z)+">, "+str(r)
    texto+=", "+str(fuerza)+ "}\n"
    return texto


v = 58  # <--------------------------------
angulo = 147    # <--------------------------------
angulo = math.radians(angulo)
xmax = getXMax(v, angulo)
salida = open("t1_salida_5-10.pov", "w")
cad = pov.povBasico()
cad = cad + pov.povCamara(0,30,xmax*2, 0,30,0)
cad = cad + pov.povLuz(1000,1000,1000, 1,1,1)
cad = cad + pov.povPiso()
cad = cad + pov.povTextura(1)
cad = cad + pov.povTextura(2)
cad = cad + pov.povTextura(3)
cad = cad + pov.povTextura(4)
cad = cad +"blob{\n    threshold 0.6\n"
nTiros = 10
for c in range(nTiros):  #la cantidad de tiros parabolicos distintos
    aleV = random.randint(0, v//10)  #la velocidad varia hasta en un décimo
    aleAngulo = random.random()/4  #el ángulo puede variar hasta 1/4 de radian
    for t in range(95):    # <--------------------------------
        ale = random.random()
        pos = tiroPara(v+aleV, angulo+aleAngulo, t/5)  # <--------------------------------
        angRot = math.radians(360/(c+1)) # angulo de rotación
        x = pos[0]*math.cos(angRot)
        z = pos[0]*math.sin(angRot)
        y = pos[1]
        cad = cad+blobEsfera(x, y, z, 8+ale, 2) # <--------------------------------
        salida.write(cad)
        cad = ""
cad="texture{t4}}\n"
salida.write(cad)
salida.close()
