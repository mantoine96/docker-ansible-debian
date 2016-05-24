FROM debian:jessie

RUN apt-get clean
y

RUN apt-get update

RUN apt-get install -y python python-pip

RUN pip install ansible
