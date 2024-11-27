import pandas as pd
import tkinter as tk
from tkinter import Canvas, Entry, Button

# Cargar el conjunto de datos MNIST desde un archivo CSV local
data = pd.read_csv('C:/Users/nieto/Downloads/train.csv')

# Función para mostrar la imagen de una fila específica en el conjunto de datos
def display_image(row_number):
    # Obtener los datos de la fila
    row_data = data.iloc[row_number, 1:].values.reshape(28, 28)
    
    # Limpiar el canvas
    canvas.delete("all")
    
    # Mostrar la imagen en el canvas
    for i in range(28):
        for j in range(28):
            color = int(row_data[i, j])
            canvas.create_rectangle(j*10, i*10, (j+1)*10, (i+1)*10, fill=f'#{color:02x}{color:02x}{color:02x}', outline="")

# Función para manejar el evento del botón
def on_button_click():
    row_number = int(entry.get())
    display_image(row_number)

# Crear la ventana principal
root = tk.Tk()
root.title("Visor de MNIST")

# Crear un canvas para mostrar la imagen
canvas = Canvas(root, width=280, height=280)
canvas.pack()

# Crear un widget de entrada para ingresar el número de fila
entry = Entry(root)
entry.pack()

# Crear un botón para mostrar la imagen
button = Button(root, text="Mostrar Imagen", command=on_button_click)
button.pack()

# Ejecutar la aplicación
root.mainloop()
