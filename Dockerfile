#https://github.com/ljay79/docker-awscli-boto
# syntax = docker/dockerfile:1.2

FROM python:3.8-slim-buster

RUN --mount=type=secret,id=.env,dst=/.env cat /.env

WORKDIR /home/workspace/

