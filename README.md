# Introduction

This container is aimed to unit test Ansible roles / playbooks. It is aimed to be run by a CI tool (Jenkins, Gitlab CI, etc...)

It contains everything for a proper Ansible install (just `pip install ansible` in your CI)

This container depends on Debian:jessie. The Dockerfile was adapted from ansible/ansible:ubuntu1404 but for Debian.

