# Clase 28-08-2024

import random 
# Crear numeros aleatorios
print(f"Numero random: {random.randint(1,100)}")


# Trabaja con angulos
import math
# Aqui esta en grados
print(f"Cos: {math.cos(60)}, Tan: {math.tan(45)}")
# Aqui en radianes
print(f"Cos: {(math.cos(math.radians(60)))}, Tan: {math.tan(math.radians(45))}")

# tiro parabolico
v = 130
theta = 45
vx = v*math.cos(math.radians(theta))
vy = v*math.sin(math.radians(theta))
xs = []
ys = []
for t in range(20):
    x = vx* t
    y = (vy*t) - (4.9) * t**2
    xs.append(x)
    ys.append(y)

# Utilizand matplotlib
import matplotlib.pyplot as plt
plt.plot(xs,ys,marker="o")
plt.xlabel("Valores de x")
plt.ylabel("Valores de y")
plt.grid(True)
plt.show()

'''
Ejemplo de usar PovRay

// Declarar una textura para usarla despues
#declare t_verde = texture{
        pigment {color rgb <0,1,0>} // Color verde
    }

// Fuente de luz
ligth_source{
    <100,100,100>  // posicion
    color rgb<1.0,1.0,1.0>} //Color de luz

// Camara
camera{
    location<4,4,4> // posicion
    look_at <0.0,0.0,0.0>   // A donde ve
}
//sphere{<0.0,0.0,0.0> texture{pigment{color rgb <1.0,0.0,0.0>}}}

// Plano
plane{
    <0,1,0>, 0 // normal del plano y distancia al origen
    texture{
        pigment{color rgb<0.5,0.5,0.5>} // color gris
    }
}

// Esfera
sphere {
    <2,1,0>, 1 // Centro y radio de la esfera
    texture{
        pigment {color rgb <1,0,0>}
    }
}

// otra esfera
sphere {
    <0,1,0>, 2 // <Centro>, radio de la esfera
    texture{t_verde}
}
'''