
FROM python:3.8-alpine
ENV PYTHONUNBUFFERED=1
RUN apt-get update && apt-get install -y \
    pkg-config \
    default-libmysqlclient-dev \
    build-essential \
    python3-dev \
    libmysqlclient-dev
RUN mkdir /website
WORKDIR /website
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install mysqlclient
COPY . .

EXPOSE 8000


CMD  python manage.py runserver 0.0.0.0:8000




