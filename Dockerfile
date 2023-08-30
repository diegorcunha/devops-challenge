FROM python:3.8-slim-buster

WORKDIR /docker

COPY src/requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY src/ .

CMD [ "gunicorn", "--bind", "0.0.0.0:8888", "wsgi:app"]   
