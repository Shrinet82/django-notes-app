FROM python:3.9

WORKDIR /app/backend

ENV PYTHONUNBUFFERED 1

COPY requirements.txt /app/backend
RUN apt-get update \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Install app dependencies
RUN pip install mysqlclient
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app/backend

EXPOSE 8000

# CRITICAL FIX: You must tell the container to start the server.
# We use 0.0.0.0 to ensure it listens to requests from outside the container.
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
