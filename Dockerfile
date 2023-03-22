FROM pytorch/pytorch:2.0.0-cuda11.7-cudnn8-runtime

RUN apt update && \
    apt install -y --no-install-recommends git wget

WORKDIR /content/

RUN git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui

WORKDIR /content/stable-diffusion-webui/

ENV COMMANDLINE_ARGS="--medvram --opt-split-attention"

EXPOSE 7860

# dry run
RUN which python

ENTRYPOINT ["/usr/local/bin/python","launch.py","--enable-insecure-extension-access"]