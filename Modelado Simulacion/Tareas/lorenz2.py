import pov

def lorenz(x, y, z, a=10, b=28, c=1.667):
    x2 = x + dt*(a*(y - x))
    y2 = y + dt*(x*(b-z)-y)
    z2 = z + dt*(x*y-c*z) 
    return x2, y2, z2

nombre = "C:\\Victor\\Trabajos Fes\\9no Semestre\\Modelado y Simulacion\\Tareas\\Tarea3\\Tarea3_6.pov"
cad = pov.povBasico("// Lorenz julio 2018\n")
cad += pov.povCamara(90.0, -20.0, 30.0, 10.0, 0.0, 30.0)
cad += pov.povLuz( 100.0, 100.0, 100.0, 1.0, 1.0, 1.0)
cad += pov.povLuz( -100.0, 100.0, 100.0, 1.0, 1.0, 1.0)
cad += pov.povLuz( 100.0, 100.0, -100.0, 1.0, 1.0, 1.0)

salida = open (nombre, "w")
salida.write(cad)
salida.close()
dt = 0.005
tot = 20000
x = 1.1
y= 0.0
z = 0.0
c_e = 0
cad = ""
for c in range(tot):
    if ((c_e % 1000) == 0):
        salida = open (nombre, "a")
        salida.write(cad)
        salida.close()
        print ("grabando...")
        cad = ""
        c_e = 0
    c_e += 1
    x,y,z = lorenz(x,y,z)    
    r = 1-((c+1)/tot)
    g = 0.00
    b = (c+1)/tot
    textura = "texture{pigment{color <"+str(r)+","+str(g)+","+str(b)+">}}"
    cad += pov.povEsfera(x, y, z, 0.5, textura)
salida = open (nombre, "a")
salida.write(cad)
salida.close()
    
    



