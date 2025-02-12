FROM python:3.12-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    curl \
    gettext \
    && rm -rf /var/lib/apt/lists/*

# Install pip
RUN pip install --upgrade pip

COPY requirements.txt .

COPY . .

# Copy SSL certificates and Nginx configuration
COPY ./certs /etc/nginx/certs
COPY ./nginx.conf /etc/nginx/conf.d/default.conf

RUN pip install -r requirements.txt

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]