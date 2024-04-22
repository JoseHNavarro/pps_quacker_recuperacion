# Fase 1: Instalación de dependencias
FROM python:3.11-slim AS builder

# Directorio de trabajo
WORKDIR /app

# Copia el archivo de requerimientos
COPY requirements.txt .

# Instala las dependencias
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install flask
# Copia la aplicación
COPY . .

# Fase 2: Ejecución de la aplicación
FROM builder AS fase2

# Directorio de trabajo
WORKDIR /app

# Copia los archivos de la fase anterior
COPY --from=builder /app /app

# Expone el puerto necesario (por ejemplo, 8000)
EXPOSE 8000

# Establece las variables de entorno
ENV MONGO_IP=mimongo
ENV MONGO_PORT=27017

# Comando para ejecutar la aplicación (ajústalo según tus necesidades)
CMD ["python", "app.py"]
