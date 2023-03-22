FROM pytorch/pytorch:2.0.0-cuda11.7-cudnn8-runtime

RUN apt-get update && apt-get install -y --no-install-recommends tzdata

# timezone setting
ENV TZ=Asia/Tokyo 

RUN apt install -y --no-install-recommends git wget libgl1-mesa-dev libglib2.0-0 libopencv-dev 

WORKDIR /content/

RUN git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui

WORKDIR /content/stable-diffusion-webui/

ENV COMMANDLINE_ARGS="--medvram --opt-split-attention"

EXPOSE 7860

# install requirements
RUN /opt/conda/bin/python -m pip install -r "requirements_versions.txt" --prefer-binary

ENTRYPOINT ["/opt/conda/bin/python","launch.py","--enable-insecure-extension-access"]