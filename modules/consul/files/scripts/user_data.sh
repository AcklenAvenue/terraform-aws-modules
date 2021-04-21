#!/bin/bash

function configure_consul(){
    EC2_PRIVATE_IP=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)
    
    cat > /opt/bitnami/consul/conf/consul.json << EOF
{
    "serf_lan": "$${EC2_PRIVATE_IP}",
    "datacenter": "${DATACENTER}",
    "domain": "consul",
    "data_dir": "/opt/bitnami/consul/data",
    "pid_file": "/opt/bitnami/consul/tmp/consul.pid",
    "server": true,
    "bind_addr": "$${EC2_PRIVATE_IP}",
    "client_addr": "0.0.0.0",
    "bootstrap_expect": 2,
    "ui_config": {
        "enabled": true
    },
    "performance": {
        "raft_multiplier": 1
    },
    "addresses": {
        "http": "127.0.0.1",
        "http": "$${EC2_PRIVATE_IP}"
    },
    "retry_join": [
        "provider=aws tag_key=Name tag_value=${EC2_NAME}"
    ],
    "ports": {
        "http": 8500,
        "dns": 8600,
        "serf_lan": 8301,
        "server": 8300
    }
}
EOF
}

function reload_consul(){
    killall consul
    /opt/bitnami/ctlscript.sh start consul
}

function add_new_encryption_key(){
    cat > payload.json << EOF
{
  "Key": "${ENCRYPTION_KEY}"
}
EOF
    
    curl \
    --request POST \
    --data @payload.json \
    http://$${EC2_PRIVATE_IP}:8500/v1/operator/keyring
    
    curl \
    --request PUT \
    --data @payload.json \
    http://$${EC2_PRIVATE_IP}:8500/v1/operator/keyring
}

function clean(){
    rm payload.json
}

function tag_eni(){
    INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
    NETWORK_INTERFACE_ID=$(aws ec2 describe-instances --instance-ids $${INSTANCE_ID} \
        --query 'Reservations[*].Instances[*].NetworkInterfaces[*].NetworkInterfaceId' \
        --region ${AWS_REGION} --output text
    )
    
    aws ec2 create-tags \
    --resources "$${NETWORK_INTERFACE_ID}" --tags '${TAGS}' --region ${AWS_REGION}
}

function main(){
    configure_consul
    reload_consul
    
    while ! nc -z "$${EC2_PRIVATE_IP}" 8500; do
        sleep 0.1
    done
    
    add_new_encryption_key
    tag_eni
    clean
    reload_consul
}

main "$${@}"