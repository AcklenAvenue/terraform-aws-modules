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

function start_service_registrator() {
    docker run -d \
        --name=registrator \
        --restart always \
        --net=host \
        --volume=/var/run/docker.sock:/tmp/docker.sock \
        gliderlabs/registrator:latest \
        consul://localhost:8500
}

function start_consul_client_mode() {
    docker run -d \
        --name consul-client \
        --restart always \
        --net=host \
        -e CONSUL_LOCAL_CONFIG='{"leave_on_terminate": true}' \
        -e CONSUL_BIND_INTERFACE="eth0" \
        consul agent -ui \
        -client=0.0.0.0 \
        -datacenter="${DATACENTER}" \
        -retry-join="provider=aws \
            tag_key=Name \
            tag_value=${CONSUL_CLUSTER_TAG} \
            access_key_id=${AWS_ACCESS_KEY_ID} \
            secret_access_key=${AWS_SECRET_ACCESS_KEY} \
            region=${AWS_REGION}"
}

function main() {
    install_docker
    start_consul_client_mode
    start_service_registrator    
}

main