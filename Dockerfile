ARG BASE_IMAGE=python:3.12-slim
FROM ${BASE_IMAGE}

ARG SJP_VERSION=0.1.1

WORKDIR /StaticJinjaPlus

ADD https://github.com/staticjinja/staticjinjaplus/archive/refs/tags/${SJP_VERSION}.tar.gz source.tar.gz

RUN tar -xzf source.tar.gz --strip-components=1

RUN python -m venv venv && \
    venv/bin/pip install -r requirements.txt
