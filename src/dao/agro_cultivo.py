
with open('datos.txt', 'r') as archivo:
    for linea in archivo:
        # Suponiendo que cada línea tiene dos valores separados por una coma
        nombre, edad = linea.strip().split(',')
        print(f"Nombre: {nombre}, Edad: {edad}")