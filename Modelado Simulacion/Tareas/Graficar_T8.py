import matplotlib.pyplot as plt
import csv

generaciones = []
porcentaje_aciertos = []

with open('C:/Users/nieto/Downloads/generaciones.csv', mode='r') as archivo:
    lector = csv.reader(archivo)
    for fila in lector:
        generaciones.append(fila)
with open('C:/Users/nieto/Downloads/porcentajes_aciertos.csv', mode='r') as archivo:
    lector = csv.reader(archivo)
    for fila in lector:
        porcentaje_aciertos.append(fila)       

generaciones = generaciones[0]
porcentaje_aciertos = porcentaje_aciertos[0]

## Graficar los resultados
plt.figure(figsize=(15, 11))
plt.plot(generaciones, porcentaje_aciertos, label='Porcentaje aciertos')
plt.xlabel("Generacion")
plt.ylabel("Porcentaje de aciertos")
#plt.grid(True)
#plt.legend()
plt.show()
