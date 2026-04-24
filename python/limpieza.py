import pandas as pd

# Cargar dataset desde Excel
df = pd.read_excel('C:\Users\Nicolas Pozo\analisis-videojuegos\python')

# Ver primeras filas
print("Primeras filas:")
print(df.head())

# Información general
print("\nInformación del dataset:")
print(df.info())

# Revisar valores nulos
print("\nValores nulos por columna:")
print(df.isnull().sum())

# Eliminar filas con nulos
df = df.dropna()

# Si existe columna Year, convertirla
if 'Year' in df.columns:
    df['Year'] = df['Year'].astype(int)

    # Crear columna década
    df['Decade'] = (df['Year'] // 10) * 10

# Guardar dataset limpio en CSV
df.to_csv('../data/videojuegos_limpio.csv', index=False)

print("\nDataset limpio guardado correctamente.")