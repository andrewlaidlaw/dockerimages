FROM nvidia/cuda-ppc64le:10.2-cudnn8-devel-ubuntu18.04

SHELL ["/bin/bash", "-c"]
ENV DEBIAN_FRONTEND=noninteractive

ENV HTTP_PROXY=http://9.196.148.19:3128
ENV HTTPS_PROXY=http://9.196.148.19:3128

RUN echo 'Acquire::http::Proxy "http://9.196.148.19:3128";' > /etc/apt/apt.conf

RUN apt update && apt install --no-install-recommends -y git
RUN cd / && git clone https://github.com/pytorch/pytorch.git

RUN apt update && apt install --no-install-recommends -y cmake openmpi-bin libopenmpi-dev libopenblas-dev python3 ninja-build python3-pip python3-setuptools python3-dev nano build-essential flex bison zlib1g-dev libboost-system-dev libboost-thread-dev libreadline-dev libxt-dev libfl-dev ssh mpi-default-bin mpi-default-dev libgmp-dev libmpfr-dev libmpc-dev
RUN pip3 install six future requests dataclasses pyyaml typing_extensions cython numpy
RUN cd /pytorch && git submodule update --init --recursive
RUN cd /pytorch && python3 setup.py install

RUN cd / && git clone https://github.com/OpenFOAM/OpenFOAM-8 && git clone https://github.com/OpenFOAM/ThirdParty-8
RUN mkdir --parents /OpenFOAM-8/platforms/linuxPPC64leGccDPInt32OptSYSTEMOPENMPI/src/Pstream/mpi/ && mkdir --parents /OpenFOAM-8/platforms/linuxPPC64leGccDPInt32OptSYSTEMOPENMPI/src/parallel/decompose/ptscotchDecomp/
RUN source /OpenFOAM-8/etc/bashrc && cd /OpenFOAM-8 && ./Allwmake -j -s -q
RUN echo ". /OpenFOAM-8/etc/bashrc" >> ~/.bashrc
RUN echo "export TORCH_LIBRARIES=\$(python3 -c \"import torch; print(torch.__file__.strip('__init__.py'))\")" >> ~/.bashrc
