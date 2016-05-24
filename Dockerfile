FROM debian:jessie

RUN apt-get clean


RUN apt-get update

RUN apt-get install -y python python-pip

RUN pip install ansible
