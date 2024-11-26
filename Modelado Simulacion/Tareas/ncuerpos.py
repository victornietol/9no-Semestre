import math
import random

class Objeto:
    def __init__(self, masa, x, y, z, vx, vy, vz):
        self.masa = masa
        self.x = x
        self.y = y
        self.z = z
        self.vx = vx
        self.vy = vy
        self.vz = vz

def distancia3D(x1, y1, z1, x2, y2, z2):
    dx = x2 - x1
    dy = y2 - y1
    dz = z2 - z1
    return math.sqrt(dx*dx + dy*dy + dz*dz)

def calcular_fuerza(objeto1, objeto2):
    G = 6.67430e-11  # Constante gravitacional    
    distancia = distancia3D(objeto1.x, objeto1.y, objeto1.z, objeto2.x, objeto2.y, objeto2.z)
    if distancia <1e7:
        distancia = 1e7
    fuerza = G * objeto1.masa * objeto2.masa / (distancia * distancia)
    return fuerza

def crear_objetos(n, masa, xmin, ymin, zmin, xmax, ymax, zmax):
    objetos = []
    for i in range(n):
        x = random.uniform(xmin, xmax)
        y = random.uniform(ymin, ymax)
        z = random.uniform(zmin, zmax)
        objeto = Objeto(masa, x, y, z, 0, 0 ,0)
        objetos.append(objeto)
    return objetos

def actualizar_objetos(objetos, t):
    # Calcular las fuerzas entre todos los objetos
    for i in range(len(objetos)):
        objeto1 = objetos[i]
        fx = 0
        fy = 0
        fz = 0
        for j in range(len(objetos)):
            if i == j:
                continue
            objeto2 = objetos[j]
            distancia = distancia3D(objeto1.x, objeto1.y, objeto1.z, objeto2.x, objeto2.y, objeto2.z)
            fuerza = calcular_fuerza(objeto1, objeto2)
            dx = objeto2.x - objeto1.x
            dy = objeto2.y - objeto1.y
            dz = objeto2.z - objeto1.z
            fx += fuerza * dx / distancia
            fy += fuerza * dy / distancia
            fz += fuerza * dz / distancia

        # Actualizar la velocidad del objeto1
        ax = fx / objeto1.masa
        ay = fy / objeto1.masa
        az = fz / objeto1.masa
        objeto1.vx += ax * t
        objeto1.vy += ay * t
        objeto1.vz += az * t

    # Actualizar las posiciones de todos los objetos
    for objeto in objetos:
        objeto.x += objeto.vx * t
        objeto.y += objeto.vy * t
        objeto.z += objeto.vz * t

def exportar_objetos_povray(nombre_archivo, objetos):
    with open(nombre_archivo, 'w') as f:
        f.write('// Archivo generado por el programa de simulación de n cuerpos\n')
        f.write('#version 3.6;\n')
        f.write('global_settings { assumed_gamma 1.0 }\n')
        f.write('camera { location <1e4, 1e4, 1e4> look_at <0, 0, 0> }\n')
        f.write('light_source { <2e6, 2e6, 2e6> color rgb <1, 1, 1> }\n')
        for objeto in objetos:
            f.write('sphere { <%f, %f, %f>, 2e2 pigment { color rgb <1, 0, 0> } }\n' % (objeto.x/1e7, objeto.y/1e7, objeto.z/1e7))


# Crear una lista de objetos
n = 3  # Número de objetos
masa = 10e23  # Masa de cada objeto
xmin = ymin = zmin = -2e10  # Límites inferiores del espacio
xmax = ymax = zmax = 2e10  # Límites superiores del espacio
objetos = crear_objetos(n, masa, xmin, ymin, zmin, xmax, ymax, zmax)
objetos[0].masa = 1e24
#objetos[14].masa = 1e26
#objetos[29].masa = 1e26

# Simular el movimiento de los objetos en el tiempo
t_total = 3600 * 24 * 365 * 100  # Tiempo total de la simulación (100 años)
dt = 3600 * 24  # Incremento de tiempo (1 día)

cont = 0
for t in range(0, t_total, dt):
    actualizar_objetos(objetos, dt)
    if (t % (dt*100))==0:  #se graba un cuadro cada 10 días
        print(f"Cargando... {round((t*100)/t_total,2)}%")
        nombre = "C:/Victor/Trabajos Fes/9no Semestre\Modelado y Simulacion/Tareas/Tarea2/E2/final"+str(cont).zfill(3)+".pov"
        cont = cont + 1
        exportar_objetos_povray(nombre, objetos)



print("Completado")
