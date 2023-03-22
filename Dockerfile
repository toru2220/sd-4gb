FROM python:3.9.16-slim-buster


RUN apt update && \
    apt install -y --no-install-recommends git wget

WORKDIR /content/

RUN git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui

WORKDIR /content/stable-diffusion-webui/models/Stable-diffusion/

RUN wget https://civitai.com/api/download/models/11745 -O Chilloutmix-Ni-pruned-fp32-fix.safetensors && \
    wget https://civitai.com/api/download/models/16793 -O Tifa_meenow.safetensors

WORKDIR /content/stable-diffusion-webui/

ENV COMMANDLINE_ARGS="--medvram --opt-split-attention"

EXPOSE 7860

ENTRYPOINT ["usr/local/bin/python","launch.py","--enable-insecure-extension-access"]