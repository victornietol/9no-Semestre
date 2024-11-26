import random
import pov
import matplotlib.pyplot as plt

'''
estado:
  0 Sano   verde
  1 enfermo rojo
  2 recuperado  azul
  3 vacunado  blanco
  4 muerto  negro

'''
class Persona:
    estado = 0
    contactos =[]
    diaContagio = 0
    def __init__(self, e, c, dc):
        self.estado = e        
        self.contactos = c
        self.diaContagio = dc
              
def creaPobInicial(n):
    poblacion = []
    for c1 in range(n):
        a=[]
        for c2 in range(n):
            contactos = []
            for cc in range(10): #contador de contactos
                alex=random.randint(-3,3)
                aley=random.randint(-3,3)
                if (alex!=0) and (aley!=0): 
                    contactos.append([(c1+alex)%n, (c2+aley)%n])
            alex=random.randint(0,n-1)
            aley=random.randint(0,n-1)
            if (alex!=c1) and (aley!=c2): 
                    contactos.append([alex, aley])
            a.append(Persona(0,contactos, 0))
        poblacion.append(a)
    return poblacion

def pob2pov(pob):
    cad = pov.povBasico()
    cad += pov.povLuz (1000, 1000, 1000, 1,1,1)
    cad += pov.povCamara (n//2, n//2, n*1.2, n//2,n//2,0)    
    for c1 in range(n):
        for c2 in range(n):
            x = c2
            y = c1
            z = 0
            perso=pob[c1][c2]
            if (perso.estado==0):
                textura = "texture{pigment{color rgb <0,1,0>}}"
            elif (perso.estado==1):
                textura = "texture{pigment{color rgb <1,0,0>}}"
            elif (perso.estado==2):
                textura = "texture{pigment{color rgb <0,0,1>}}"
            elif (perso.estado==3):
                textura = "texture{pigment{color rgb <1,1,1>}}"
            elif (perso.estado==4):
                textura = "texture{pigment{color rgb <0,0,0>}}"
            cad = cad + pov.povEsfera(x,y,z,"0.5", textura)
    return cad

def evoluciona(p, t):
    p2 = []
    for r in p:
        p2.append(r)
    R0 = 2 # <--------------------------- Nivel de contagio
    inicio = 7    
    for i in range(n):
        for j in range(n):
            a = t - p[i][j].diaContagio
            if (p[i][j].estado==1):
                if (a>=inicio) and (a<inicio+R0):
                    malaSuerte = random.choice(p[i][j].contactos)
                    x =malaSuerte[0]
                    y = malaSuerte[1]
                    if (p2[x][y].estado==0):
                        p2[x][y].estado = 1
                        p2[x][y].diaContagio = t
                elif (a>20 and p[i][j].estado==1):  # <-------------- Periodo incubacion
                    ale = random.random()
                    if (ale<1): # <-------------- indice mortailidad
                        p2[i][j].estado=2
                    else:
                        p2[i][j].estado=4
    '''                    
    if (t>40):#empiezan a vacunar el dia 40
        for c in range(1000): #numero de personas que se vacunan por dia
            alex = random.randint(0, n-1)
            aley = random.randint(0, n-1)
            p2[alex][aley].estado = 3   '''
    return (p2)

def cuenta(p, valor):
    cont = 0
    for i in range(n):
        for j in range(n):
            if (p[i][j].estado==valor):
                cont = cont + 1
    return cont

 
n = 200
datos = []
p = creaPobInicial(n)
alex = random.randint(0,n-1)
aley = random.randint(0,n-1) # seleccionamos las coordenadas x, y del primer enfermo aleatoriamente
p[alex][aley].estado=1
for t in range(200):    
    p = evoluciona(p, t)
    enfermos = cuenta(p, 1)   
    sanos = cuenta(p, 0)
    recuperados = cuenta(p, 2)
    muertos = cuenta(p, 4)
    #cad = pob2pov(p)
    num = str(t)
    #archivo = open("C:/Victor/Trabajos Fes/9no Semestre/Modelado y Simulacion/Tareas/Tarea4/E6/E6_salida"+num+".pov", "w")
    #archivo.write(cad)
    #archivo.close()
    #datos.append(enfermos+recuperados+muertos)
    if t==50 or t==100 or t==150 or t==199:
        print("dia: ",t, " ",enfermos, ":enfermos", " ",sanos, ":sanos"
            ,recuperados, ":recuperados",muertos, ":muertos")
'''
salida = open("salida.csv", "w")
for v in datos:
    salida.write(str(v)+"\n")
salida.close()
'''
#plt.plot(datos)
#plt.show()
      
      
    



