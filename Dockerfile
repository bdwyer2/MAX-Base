FROM continuumio/miniconda3:4.5.4

RUN apt-get update && apt-get install golang-go -y
RUN wget https://dist.ipfs.io/go-ipfs/v0.4.20/go-ipfs_v0.4.20_linux-386.tar.gz &&\
 tar xvfz go-ipfs_v0.4.20_linux-386.tar.gz && rm go-ipfs_v0.4.20_linux-386.tar.gz
RUN mv go-ipfs/ipfs /usr/local/bin/ipfs
RUN ipfs init

WORKDIR /workspace
RUN mkdir assets

COPY requirements.txt /workspace
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY . /workspace
