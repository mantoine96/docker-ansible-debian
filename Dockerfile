FROM debian:jessie

RUN apt-get install -y python 

RUN apt-get install -y python-pip

RUN pip install ansible
