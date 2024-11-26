'''
    Clase 04-11-2024
    Algoritmos geneticos

    Problema. Obtener el mayor numero posible con 3 numeros del 0 al 7

        x + y + z = max

        x -> 0-7
        y -> 0-7
        x -> 0-7

        Cada numero (x,y o z) es representado por un numero binario de 3 bits para poder representar del 0 al 7

 

    * individuo = posible solucion
    * gen = cada numero binario (x, y, z)

        individuo -> 011 + 100 + 100
                    |     |     | 
                        genes

        1. Se genera una poblacion de individuos y se califican
           011 + 100 + 100 = 11
           011 + 101 + 011 = 11
           101 + 010 + 011 = 10
           010 + 100 + 010 = 8

        2. Despues de reproducen aplicando "torneo" o "aleatoriamente".
            Si es por torneo se comparan por parejas y se selecciona el mejor. 
            Si es aleatoriamente es random.

            011 + 100 + 100 = 11 -> es el mejor (cualquiera de los dos)
            011 + 101 + 011 = 11

            101 + 010 + 011 = 10 -> es el mejor
            010 + 100 + 010 = 8

        3. Se reproducen los seleccionados, estableciendo un punto de cruza. 
           En este caso, se elige un punto de cruza apartir del segundo numero : x y | z  (individuo1 | individuo2)
           
           011 + 100 + 100  X  101 + 010 + 011   =   011 + 100 + 011 -> resultado de la reproduccion
                 |                    |
            individuo 1          individuo 2

        4. Se aplica una mutacion estableciendo un punto (un bit en especifico en este caso)
                    
'''
import random

class Individuo:
    def __init__(self, genes, cal):
        self.genes = genes
        self.cal = cal

def crea_poblacion(n):
    poblacion = []
    # Crear n individuos
    for ci in range(n):
        genes = ''
        ind = Individuo('',0)
        for cont_genes in range(9): # Cada individuo tiene 9 genes
            genes += random.choice(['0','1'])
        ind.genes = genes
        poblacion.append(ind)
    return poblacion

def califica_poblacion(poblacion):
    for i in poblacion:
        x = int(i.genes[0:3], 2)  # Casteando el numero binario a un int (010), se pone [0:3] para elegir el primer numero de la cadena que contiene todo el numero completo
        y = int(i.genes[3:6], 2)
        z = int(i.genes[6:], 2)
        i.cal = x+y+z
    pass

def ordena_poblacion(pob):
    return sorted(pob, key=lambda ind: ind.cal, reverse = True)

def torneo(oponente1, oponente2):
    return oponente1 if oponente1.cal>oponente2.cal else oponente2

def cruza_1_punto(padre, madre, punto_de_cruza):
    hijo_genes = padre.genes[:punto_de_cruza]+madre.genes[punto_de_cruza:]
    return Individuo(hijo_genes,0)

def reproduce(pob):
    seleccionados = random.sample(pob, 4)
    ganador1= torneo(seleccionados[0], seleccionados[1])
    ganador2= torneo(seleccionados[2], seleccionados[3])

    punto_de_cruza = random.randint(1, 8)
    hijo = cruza_1_punto(ganador1, ganador2, punto_de_cruza)
    return hijo



# Ejecucion
num_generaciones = 10
poblacion = crea_poblacion(20)
califica_poblacion(poblacion)
for generacion in range(num_generaciones):
    #print(f"Generacion {generacion+1}: ")
    califica_poblacion(poblacion)
    poblacion = ordena_poblacion(poblacion)
    mejor_individuo = poblacion[0]
    print(f"Generacion: {generacion}, Mejor individuo: Genes: {mejor_individuo.genes}, Calificacion = {mejor_individuo.cal}")
    nueva_poblacion = []
    nueva_poblacion.append(mejor_individuo)
    for _ in range(len(poblacion)-1):
        nuevo_individuo = reproduce(poblacion)
        nueva_poblacion.append(nuevo_individuo)
    poblacion = nueva_poblacion

poblacion = ordena_poblacion(poblacion)
mejor_individuo_final = poblacion[0]
print("Mejor individuo final: ", mejor_individuo_final.genes, "Calificacion: ", mejor_individuo_final.cal)


'''
    Redes neuronales
    Se ajustan los pesos para valorarlo segun un umbral

    I_1 * W_1 + I_2 * W_2 > U     (U -> Umbral, valor de salida de la neurona), (I -> Entrada), (W -> Peso)
'''