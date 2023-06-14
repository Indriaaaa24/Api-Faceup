FROM python:3.10.3-slim-buster

WORKDIR /app

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

COPY . .

ENV PYTHONUNBUFFERED=1

CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 main:app