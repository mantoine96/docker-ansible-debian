FROM debian:jessie

RUN apt-get update && apt-get install -y python python-pip

RUN pip install ansible
