ARG BASE_IMAGE=python:3.12-slim
FROM python:3.12-slim@sha256:401f6e1a67dad31a1bd78e9ad22d0ee0a3b52154e6bd30e90be696bb6a3d7461

ARG SJP_VERSION=master

WORKDIR /StaticJinjaPlus

RUN if command -v apt-get >/dev/null; then \
        apt-get update && apt-get install -y python3 python3-venv python3-pip curl; \
    fi

RUN if [ "$SJP_VERSION" = "master" ]; then \
        curl -L https://github.com/MrDave/StaticJinjaPlus/archive/refs/heads/master.tar.gz -o source.tar.gz; \
    else \
        curl -L https://github.com/MrDave/StaticJinjaPlus/archive/refs/tags/${SJP_VERSION}.tar.gz -o source.tar.gz; \
    fi && \
    tar -xzf source.tar.gz --strip-components=1 -C /StaticJinjaPlus && \
    rm source.tar.gz && \
    python3 -m venv venv && \
    venv/bin/pip install --no-cache-dir -r requirements.txt

CMD ["bash"]
