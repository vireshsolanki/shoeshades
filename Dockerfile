FROM python:3.8-slim-buster

ENV PYTHONUNBUFFERED=1

RUN mkdir /data

WORKDIR /data

WORKDIR /website

COPY requirements.txt requirements.txt

RUN pip3 install -r requirements.txt 

COPY .  .

EXPOSE 8000

CMD  python manage.py runserver 0.0.0.0:8000

