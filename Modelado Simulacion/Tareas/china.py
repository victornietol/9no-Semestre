import matplotlib.pyplot as plt
# Datos de población por edad y género
poblacion = {
    "0-4": {"M": 32318569, "F": 28826052},
    "05-09": {"M": 47383460, "F": 41333615},
    "10-14": {"M": 48174207, "F": 41305036},
    "15-19": {"M": 44185169, "F": 37675535},
    "20-24": {"M": 42752184, "F": 36683449},
    "25-29": {"M": 46002635, "F": 40232687},
    "30-34": {"M": 59129589, "F": 53395144},
    "35-39": {"M": 58979445, "F": 54848838},
    "40-44": {"M": 51128552, "F": 48550099},
    "45-49": {"M": 50073949, "F": 48295878},
    "50-54": {"M": 61710010, "F": 60666383},
    "55-59": {"M": 56752851, "F": 57199238},
    "60-64": {"M": 36656033, "F": 38017746},
    "65-69": {"M": 36253701, "F": 39813049},
    "70-74": {"M": 26850709, "F": 31682096},
    "75-79": {"M": 15120451, "F": 18452294},
    "80-84": {"M": 8451478, "F": 11610011},
    "85-89": {"M": 3999237, "F": 6746941},
    "90-94": {"M": 1112028, "F": 2584086},
    "95-99": {"M": 134381, "F": 532052},
    "100+": {"M": 4165, "F": 48312}
}

# Función para simular la evolución de la población por un año
def simular_evolucion(poblacion):
    nueva_poblacion = {grupo: {"M": 0, "F": 0} for grupo in poblacion}
    
    # Mover el 25% de cada grupo de edad al siguiente
    grupos_edad = list(poblacion.keys())
    for i in range(len(grupos_edad) - 1):
        grupo_actual = grupos_edad[i]
        siguiente_grupo = grupos_edad[i + 1]
        nueva_poblacion[siguiente_grupo]["M"] += int(poblacion[grupo_actual]["M"] * 0.25)
        nueva_poblacion[siguiente_grupo]["F"] += int(poblacion[grupo_actual]["F"] * 0.25)
        nueva_poblacion[grupo_actual]["M"] += int(poblacion[grupo_actual]["M"] * 0.75)
        nueva_poblacion[grupo_actual]["F"] += int(poblacion[grupo_actual]["F"] * 0.75)
    
    # Simular nacimientos
    nacimientos = 0
    for grupo in ["20-24", "25-29", "30-34"]:
        nacimientos += int(poblacion[grupo]["F"] * 0.09375)  # 25% de las mujeres tienen un hijo -----------------------------
    
    nueva_poblacion["0-4"]["M"] += nacimientos // 2
    nueva_poblacion["0-4"]["F"] += nacimientos // 2
    
    # Simular muertes de ancianos
    for grupo in ["65-69", "70-74", "75-79", "80-84", "85-89", "90-94", "95-99", "100+"]:
        muertes_m = int(poblacion[grupo]["M"] * 0.025)  # 5% de mortalidad anual ----------------------
        muertes_f = int(poblacion[grupo]["F"] * 0.025)
        nueva_poblacion[grupo]["M"] -= muertes_m
        nueva_poblacion[grupo]["F"] -= muertes_f
    
    return nueva_poblacion

# Número de años a simular
años_a_simular = 50
poblacion_tot = []

# Ciclo principal del programa
for año in range(años_a_simular):
    poblacion = simular_evolucion(poblacion)
    total_poblacion = sum(grupo["M"] + grupo["F"] for grupo in poblacion.values())
    poblacion_tot.append(total_poblacion)
    print(f"Año {año + 1}: Población total = {total_poblacion}")

# Imprimir la población futura
for grupo_edad, datos in poblacion.items():
    print(f"{grupo_edad}: M={datos['M']}, F={datos['F']}")

plt.plot(poblacion_tot)
plt.show()
