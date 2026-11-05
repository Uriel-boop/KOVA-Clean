FROM python:3.10-slim

WORKDIR /app

# Instalar dependencias del sistema necesarias para algunas librerías de Python (como mysqlclient o rembg)
RUN apt-get update && apt-get install -y \
    gcc \
    default-libmysqlclient-dev \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000

# Comando para ejecutar Flask
CMD ["python", "app.py"]