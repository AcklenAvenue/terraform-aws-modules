#!/bin/bash

function install_docker(){
    export DEBIAN_FRONTEND=noninteractive

    sudo apt-get update

    sudo apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        software-properties-common

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

    sudo apt-key fingerprint 0EBFCD88

    sudo add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) \
        stable"

    sudo apt-get update

    sudo apt-get -y install docker-ce
}

function run_consul_server(){
    docker run -d --net host \
        --name consul \
        -e CONSUL_BIND_INTERFACE=eth0 \
        consul:latest  \
            agent -ui -server -client=0.0.0.0 \
            -bootstrap-expect=1 \
            -log-level=TRACE \
            -datacenter="${DATACENTER}" \
            -retry-join=provider="aws tag_key=Name tag_value=${CONSUL_CLUSTER_TAG} \
            access_key_id=${AWS_ACCESS_KEY_ID} \
            secret_access_key=${AWS_SECRET_ACCESS_KEY} \
            region=${AWS_REGION}"
}

function run_nginx(){
    docker run -d \
        --restart always \
        --net host \
        --name nginx \
        -e SERVICE_NAME=nginx \
        hndoss/ecs-nginx-reverse-proxy:latest
}

function main() {
    install_docker
    run_consul_server
    run_nginx
}

main