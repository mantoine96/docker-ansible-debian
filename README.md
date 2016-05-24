# Introduction

This container is aimed to unit test Ansible roles / playbooks. It is aimed to be run by a CI tool (Jenkins, Gitlab CI, etc...)

It contains everything for a proper Ansible install (just `pip install ansible` in your CI), plus Ruby and Serverspec to allow you to run tests.

This container depends on thehunt33r/ansible-on-debian which is a Debian container ready for Ansible testing, but without Serverspec. The Dockerfile from thehunt33r/ansible-on-debian is taken from ansible/ansible:ubuntu1404 but adapted to Debian.
