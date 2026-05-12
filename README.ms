ARG BASE_IMAGE=python:3.12-slim
FROM ${BASE_IMAGE}

ARG SJP_VERSION=0.1.1

WORKDIR /StaticJinjaPlus

ADD https://github.com/staticjinja/staticjinjaplus/archive/refs/tags/${SJP_VERSION}.tar.gz source.tar.gz

RUN tar -xzf source.tar.gz --strip-components=1

RUN python -m venv venv && \
    venv/bin/pip install -r requirements.txt



# StaticJinjaPlus Docker Port

Docker-порт для сборки образов StaticJinjaPlus без хранения исходников проекта в репозитории.

## Что находится в репозитории

- Dockerfile
- README.md

Исходный код StaticJinjaPlus скачивается во время сборки Docker-образа.

---

## Сборка latest

```bash
docker build -t static-jinja-plus:latest .
```

---

## Сборка slim

```bash
docker build \
  --build-arg BASE_IMAGE=python:3.12-slim \
  -t static-jinja-plus:slim .
```

---

## Сборка Ubuntu-версии

```bash
docker build \
  --build-arg BASE_IMAGE=ubuntu:24.04 \
  -t static-jinja-plus:ubuntu .
```

---

## Сборка версии 0.1.0

```bash
docker build \
  --build-arg SJP_VERSION=0.1.0 \
  -t static-jinja-plus:0.1.0 .
```

---

## Сборка версии 0.1.1

```bash
docker build \
  --build-arg SJP_VERSION=0.1.1 \
  -t static-jinja-plus:0.1.1 .
```

---

## Сборка develop

```bash
docker build \
  --build-arg SJP_VERSION=develop \
  -t static-jinja-plus:develop .
```

---

## Запуск контейнера

```bash
docker run -it static-jinja-plus:latest bash
```

---

## Сборка сайта

```bash
cd /StaticJinjaPlus
venv/bin/python main.py
```

---

## Проверка результата

```bash
ls rendered_pages
```

---
