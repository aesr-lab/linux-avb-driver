FROM ubuntu:jammy

ENV KVERSION=5.15.0-84-generic

# dependencies
RUN apt-get update && apt-get install build-essential git linux-virtual -yy

# build
COPY . /linux-avb-driver
RUN cd linux-avb-driver && make KVERSION=$KVERSION && make install KVERSION=$KVERSION

# load
RUN modprobe -S $KVERSION snd-avb

