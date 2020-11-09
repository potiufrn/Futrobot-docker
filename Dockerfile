FROM ubuntu:20.04

# Dependencias
ENV TZ=America/Recife
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    qt5-default \
    vim \
    net-tools \
    sudo \
    protobuf-compiler \
    libbluetooth-dev \
    && apt-get clean
    
RUN cd /home && \
    git clone -b latest --single-branch https://github.com/potiufrn/Futrobot.git && \
    cd Futrobot && \
    make

ENV PATH=/home:$PATH
COPY poti.sh /home/

WORKDIR /home
