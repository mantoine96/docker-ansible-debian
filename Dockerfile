FROM debian:jessie

RUN apt-get clean


RUN apt-get update

RUN apt-get install -y python python-pip python-dev build-essential libffi-dev

RUN pip install cffi setuptools ansible
