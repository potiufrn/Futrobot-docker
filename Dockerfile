FROM ubuntu:20.04

# Dependencias
ENV TZ=America/Recife
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

WORKDIR /

RUN apt-get update && apt-get install -y \
    tzdata \
    build-essential \
    cmake \
    git \
    qt5-default \
    sudo \
    protobuf-compiler \
    libbluetooth-dev \
    && apt-get clean
    
RUN git clone -b latest --single-branch https://github.com/potiufrn/Futrobot.git

WORKDIR /Futrobot

RUN make 
