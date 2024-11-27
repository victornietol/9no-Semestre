import csv
import random
import time

class Neurona:
    def __init__(self, pesos, umbral):
        self.pesos = pesos
        self.umbral = umbral
        self.salida = 0

class Prueba:
    def __init__(self, datos, valor):
        self.datos = datos
        self.valor = valor

class Individuo:
    def __init__(self, genes, cal):
        self.genes = genes
        self.cal = cal

def cargar_archivo_csv(nombre_archivo):
    lista_pruebas = []
    with open(nombre_archivo, 'r') as archivo_csv:
        lector_csv = csv.reader(archivo_csv)
        for fila in lector_csv:
            if len(fila) == 785:
                datos = [float(valor)/255 for valor in fila[1:]]
                valor = int(fila[0])
                prueba = Prueba(datos, valor)
                lista_pruebas.append(prueba)
    return lista_pruebas

def crea_capa(num_neuronas, tam_pesos, umbral):
    capa_neuronas = []
    for _ in range(num_neuronas):
        pesos = [0.0] * tam_pesos
        nueva_neurona = Neurona(pesos, umbral)
        capa_neuronas.append(nueva_neurona)
    return capa_neuronas
 
def actua_red(prueba, capa_entrada, capa_intermedia1, capa_intermedia2, capa_salida):
    calificacion = 0
    # Propagar las salidas de la capa de entrada a la capa intermedia1   
    for i, neurona in enumerate(capa_entrada):
        inicio = i * 14
        fin = inicio + 14
        subdatos = prueba.datos[inicio:fin]        
        if len(neurona.pesos) == len(subdatos):
            suma_pesos = sum(w * d for w, d in zip(neurona.pesos, subdatos))
            neurona.salida = 1 if suma_pesos > neurona.umbral else 0
        else:
            print(f"La cantidad de pesos de la neurona {i} no coincide con los datos de la prueba.")

    # Propagar las salidas de la capa intermedia1 a la capa intermedia2
    for i, neurona in enumerate(capa_intermedia1):
        entradas_intermedia1 = [neurona.salida for neurona in capa_entrada]
        if len(neurona.pesos) == len(entradas_intermedia1):
            suma_pesos = sum(w * d for w, d in zip(neurona.pesos, entradas_intermedia1))
            neurona.salida = 1 if suma_pesos > neurona.umbral else 0
        else:
            print(f"La cantidad de pesos de la neurona intermedia1 {i} no coincide con las entradas.")

    # Propagar las salidas de la capa intermedia2 a la capa de salida
    for i, neurona in enumerate(capa_intermedia2):
        entradas_intermedia2 = [neurona.salida for neurona in capa_intermedia1]
        if len(neurona.pesos) == len(entradas_intermedia2):
            suma_pesos = sum(w * d for w, d in zip(neurona.pesos, entradas_intermedia2))
            neurona.salida = 1 if suma_pesos > neurona.umbral else 0
        else:
            print(f"La cantidad de pesos de la neurona intermedia2 {i} no coincide con las entradas.")
            
    # Propagar las salidas de la capa salida 
    for i, neurona in enumerate(capa_salida):
        entradas_salida = [neurona.salida for neurona in capa_intermedia2]
        if len(neurona.pesos) == len(entradas_salida):
            suma_pesos = sum(w * d for w, d in zip(neurona.pesos, entradas_salida))
            neurona.salida = 1 if suma_pesos > neurona.umbral else 0
        else:
            print(f"La cantidad de pesos de la neurona salida {i} no coincide con las entradas.")        

    # Calificar el desempeño de la red    
    for i in range(len(capa_salida)):
        if prueba.valor == i:
            if capa_salida[i].salida == 1:
                calificacion += 6
        else:
            if capa_salida[i].salida == 0:
                calificacion += 1
    salida=''
    for n in capa_salida:
        salida += str(n.salida)
    return [calificacion, salida]

def crea_pob_ale(n, tam_genes):
    pob2 = []    
    for c2 in range(n):
        pob = []
        for _ in range(n):
            g = ''
            for _ in range(tam_genes):
                g += random.choice(['0','1'])
            pob.append(Individuo(g, 0))
        califica_pob(pob)
        print('creando ind:',c2)
        pob2.append(get_mejor_ind(pob))
    return pob2

def individuo2pesos(genes, entrada, intermedia1, intermedia2, salida):
    num_genes = len(genes)    
    idx_pesos = 0  # Índice para recorrer la cadena de genes
    
    # Asignar pesos a la capa de entrada
    for neurona in entrada:
        for i in range(len(neurona.pesos)):
            if idx_pesos < num_genes:
                segmento_genes = genes[idx_pesos:idx_pesos+4]  # Tomar 4 caracteres como un segmento
                decimal = int(segmento_genes, 2)  # Convertir el segmento binario a decimal
                valor = (decimal /4.0 ) - 1.0  # Aplicar la transformación inversa
                neurona.pesos[i] = valor
                idx_pesos += 4  # Mover el índice a los próximos 4 caracteres
    
    # Asignar pesos a la capa intermedia1
    for neurona in intermedia1:
        for i in range(len(neurona.pesos)):
            if idx_pesos < num_genes:
                segmento_genes = genes[idx_pesos:idx_pesos+4]  # Tomar 4 caracteres como un segmento
                decimal = int(segmento_genes, 2)  # Convertir el segmento binario a decimal
                valor = (decimal /4.0 ) - 1.0  # Aplicar la transformación inversa
                neurona.pesos[i] = valor
                idx_pesos += 4  # Mover el índice a los próximos 4 caracteres
    # Asignar pesos a la capa intermedia2
    for neurona in intermedia2:
        for i in range(len(neurona.pesos)):
            if idx_pesos < num_genes:
                segmento_genes = genes[idx_pesos:idx_pesos+4]  # Tomar 4 caracteres como un segmento
                decimal = int(segmento_genes, 2)  # Convertir el segmento binario a decimal
                valor = (decimal /4.0 ) - 1.0  # Aplicar la transformación inversa
                neurona.pesos[i] = valor
                idx_pesos += 4  # Mover el índice a los próximos 4 caracteres
    # Asignar pesos a la capa salida
    for neurona in salida:
        for i in range(len(neurona.pesos)):
            if idx_pesos < num_genes:
                segmento_genes = genes[idx_pesos:idx_pesos+4]  # Tomar 4 caracteres como un segmento
                decimal = int(segmento_genes, 2)  # Convertir el segmento binario a decimal
                valor = (decimal /4.0 ) - 2.0  # Aplicar la transformación inversa
                neurona.pesos[i] = valor
                idx_pesos += 4  # Mover el índice a los próximos 4 caracteres


def califica_pob(pob):
    cont = 0
    for i in pob:        
        cont+=1
        individuo2pesos(i.genes, capa_entrada, capa_intermedia1, capa_intermedia2, capa_salida)
        cal_final = 0
        for test in pruebas:
            resultado = actua_red(test, capa_entrada, capa_intermedia1, capa_intermedia2, capa_salida)
            cal = resultado[0]
            cal_final+=cal
        i.cal = cal_final
        
def torneo(pob):
    ale1 = random.randint(0, len(pob) - 1)
    ale2 = random.randint(0, len(pob) - 1)
    if pob[ale1].cal > pob[ale2].cal:
        return ale1
    else:
        return ale2

def get_mejor_ind(pob):
    maximo = 0
    mejor = 0
    for c in range(len(pob)):
        if pob[c].cal > maximo:
            maximo = pob[c].cal
            mejor = c
    return pob[mejor]

def cruza_en_un_punto(pob, padre, madre):
    ale = random.randint(1, len(pob[0].genes) - 2)
    gen = ''
    for c in range(len(pob[0].genes)):
        if c <= ale:
            gen += pob[padre].genes[c]
        else:
            gen += pob[madre].genes[c]
    hijo = Individuo(gen, 0)
    return hijo

def mutacion2(pob, num_bits):
    for cb in range(num_bits):
        for c in range(len(pob)//2, len(pob)-1):
            ale = random.randint(0, tam_genes - 1)
            if pob[c].genes[ale]=='1':
                pob[c].genes=pob[c].genes[:ale]+'0'+pob[c].genes[ale+1:]
            else:
                pob[c].genes=pob[c].genes[:ale]+'1'+pob[c].genes[ale+1:]
            

def mutacion(pob, porcentaje_mutacion):
    num_individuos = len(pob)
    num_individuos_a_mutar = num_individuos - num_individuos // 3  # Evitar la mutación en el primer tercio

    for i in range(num_individuos):
        if i >= num_individuos_a_mutar:
            individuo = pob[i]
            genes_mutados = list(individuo.genes)  # Convierte la cadena de genes en una lista mutable
            for j in range(len(genes_mutados)):
                if random.random() < porcentaje_mutacion / 100:
                    # Cambia el valor del gen si se cumple el porcentaje de mutación
                    genes_mutados[j] = '1' if genes_mutados[j] == '0' else '0'
            individuo.genes = ''.join(genes_mutados)  # Convierte la lista de genes de nuevo en una cadena

def evoluciona(pob):
    pob2 = []
    pob2.append(get_mejor_ind(pob))
    while len(pob2) < len(pob):
        padre = torneo(pob)
        madre = torneo(pob)
        hijo = cruza_en_un_punto(pob, padre, madre)
        pob2.append(hijo)
    mutacion2(pob2, random.randint(1,2))
    return pob2

def salva_pob(pob, ng):
    ind = get_mejor_ind(pob)
    arch = open('C:/Users/nieto/Downloads/mejor.txt', 'w')
    arch.write(str(ng)+'\n')
    arch.write(ind.genes)
    arch.close()

def carga_pob(n, tam_genes):
    pob = []
    arch = open('C:/Users/nieto/Downloads/mejor.txt', 'r')
    ren = arch.readline()
    llevamos = int(ren)
    genes = arch.readline()
    arch.close()
    mejor = Individuo(genes, 0)
    pob.append(mejor)    
    for c in range(1, n):
        g = ''
        for c2 in range(tam_genes):
            g += random.choice(['0','1'])
        pob.append(Individuo(g,0))
    return pob, llevamos
    
# Crear la capa de entrada con 56 neuronas, cada una con 14 pesos
num_neuronas_entrada = 56
tam_pesos_entrada = 14
umbral_entrada = 3.0  
capa_entrada = crea_capa(num_neuronas_entrada, tam_pesos_entrada, umbral_entrada)

# Crear la capa intermedia1 con 20 neuronas, cada una con 56 pesos y umbral de 10
num_neuronas_intermedia1 = 20
tam_pesos_intermedia1 = 56
umbral_intermedia1 = 3.0
capa_intermedia1 = crea_capa(num_neuronas_intermedia1, tam_pesos_intermedia1, umbral_intermedia1)

# Crear la capa intermedia2 con 16 neuronas, cada una con 20 pesos y umbral de 6
num_neuronas_intermedia2 = 16
tam_pesos_intermedia2 = 20
umbral_intermedia2 = 3.0
capa_intermedia2 = crea_capa(num_neuronas_intermedia2, tam_pesos_intermedia2, umbral_intermedia2)

# Crear la capa salida con 10 neuronas, cada una con 16 pesos y umbral de 2
num_neuronas_salida = 10
tam_pesos_salida = 16
umbral_salida = 3.0
capa_salida = crea_capa(num_neuronas_salida, tam_pesos_salida, umbral_salida)

nombre_archivo = 'C:/Users/nieto/Downloads/train.csv'
pruebas = cargar_archivo_csv(nombre_archivo)


n = 20           # Número de individuos en la población
tam_genes = 9536  # Número de bits en cada individuo
porcentaje_mutacion = 5  # Porcentaje de genes que cambiarán de valor

opcion = int(input("1. iniciar \n2. continuar\n"))
num_gen = int(input("cuantas generaciones?:"))
llevamos = 0
if opcion == 1:
    pob = crea_pob_ale(n, tam_genes)
else:
    pob, llevamos = carga_pob(n, tam_genes)
    print('cargando la poblacion con ', str(len(pob)), ' individuos y gen :', llevamos,'\n')


############################ Cambios para graficar ############################
generaciones = []
porcentajes_aciertos = []

mejorCal=0.0
inicio = time.time()
for contGen in range(num_gen):
    califica_pob(pob)  # Califica la población actual
    pob = evoluciona(pob)
    cal = get_mejor_ind(pob).cal

    #### Calcular porcentaje de aciertos
    porcentaje_aciertos = (cal - 900) / 6
    generaciones.append(contGen + llevamos + 1)
    porcentajes_aciertos.append(porcentaje_aciertos)

    # Imprimir cada 200 generaciones
    if (contGen % 200) == 0:
        #salva_pob(pob, contGen+llevamos)
        print(f'Gen {contGen+llevamos + 1}: Mejor calif = {cal} reconocimiento={(cal-900)/6}')
    if (cal>mejorCal):
        print(f'Gen {contGen+llevamos + 1}: Mejor calif = {cal} reconocimiento={(cal-900)/6}')
        mejorCal = cal

fin = time.time()
print('tiempo de ejecucion:', fin - inicio)

### Guardar los datos para graficarlos
with open('C:/Users/nieto/Downloads/generaciones.csv', mode='w', newline="") as archivo:
    escribir = csv.writer(archivo)
    escribir.writerow(generaciones)
with open('C:/Users/nieto/Downloads/porcentajes_aciertos.csv', mode='w', newline="") as archivo:
    escribir = csv.writer(archivo)
    escribir.writerow(porcentajes_aciertos)


        
        
