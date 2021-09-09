# syntax=docker/dockerfile:1
FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -qq && \
    apt-get install -yq \
        curl \
        git \
        gnupg \
        make \
        software-properties-common \
        unzip && \
    curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - && \
    apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
    apt-get update -qq && \
    apt-get install -yq \
        terraform=1.0.6 \
        vault=1.8.2 && \
    setcap cap_ipc_lock= /usr/bin/vault && \
    curl -Lo kops https://github.com/kubernetes/kops/releases/download/v1.21.1/kops-linux-amd64 && \
        chmod +x /kops && \
        mv kops /usr/local/bin/kops && \
    curl -LO https://dl.k8s.io/release/v1.22.1/bin/linux/amd64/kubectl && \
        install kubectl /usr/local/bin/kubectl && \
    curl -LO https://get.helm.sh/helm-v3.6.3-linux-amd64.tar.gz && \
        tar -zxvf helm-v3.6.3-linux-amd64.tar.gz && \
        mv linux-amd64/helm /usr/local/bin/helm && \
    curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip && \
        unzip awscliv2.zip && \
        ./aws/install && \
    apt-get clean && \
    rm -rf aws/ awscliv2.zip helm-v3.6.3-linux-amd64.tar.gz kubectl linux-amd64/ /var/lib/apt/lists/*

RUN echo "alias k='kubectl'" >> ~/.bashrc
