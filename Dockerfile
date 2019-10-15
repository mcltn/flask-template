FROM python:3.6-jessie

RUN mkdir -p /deploy
RUN apt update

WORKDIR /deploy
ADD requirements.txt /deploy/requirements.txt
RUN pip install -r /deploy/requirements.txt
ADD . /deploy/

EXPOSE 5000

CMD ["gunicorn", "--config", "/deploy/gunicorn.cfg", "server:app"]