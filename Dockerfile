
# Use the Python 3.8 slim-buster base image
FROM python:3.8-alpine

# Set environment variables
ENV PYTHONUNBUFFERED=1

# Install system dependencies (including pkg-config and the MySQL client library development package)
RUN apt-get update && apt-get install -y \
    pkg-config \
    default-libmysqlclient-dev \
    build-essential \
    python3-dev \
    libmysqlclient-dev
# Create directories for your project and set the working directory
RUN mkdir /website
WORKDIR /website

# Copy the requirements file and install dependencies
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install mysqlclient

# Copy the rest of your project files
COPY . .

# Expose the port on which your Django application will run (change if needed)
EXPOSE 8000


CMD  python manage.py runserver 0.0.0.0:8000

