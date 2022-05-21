#!/bin/bash

source ./hosts/hosts.txt

# Init test env
docker compose down deploy-test

# Test after-bench.sh
docker compose up -d deploy-test

sleep 5

bash ./deploy/sync-settings.sh


for ((host_idx=0; host_idx<${FRONTEND_HOSTS_NUMS}; host_idx++));
do
    ssh -p ${FRONTEND_HOSTS_SSH_PORT[host_idx]} -i ${FRONTEND_HOSTS_SSH_PUB_KEY[host_idx]} ${FRONTEND_HOSTS_SSH_USER[host_idx]}@${FRONTEND_HOSTS[host_idx]} 'cat /etc/nginx/nginx.conf' | diff -s - ./configs/nginx.conf
    if [ $? -eq 0 ]; then
        echo "Success to sync nginx.cnf."
    elif [ $? -eq 1 ]; then
        echo "Script error detected. to sync nginx.cnf"
        exit 1
    fi
done

for ((host_idx=0; host_idx<${DB_HOSTS_NUMS}; host_idx++));
do
    ssh -p ${DB_HOSTS_SSH_PORT[host_idx]} -i ${DB_HOSTS_SSH_PUB_KEY[host_idx]} ${DB_HOSTS_SSH_USER[host_idx]}@${DB_HOSTS[host_idx]} 'cat /etc/mysql/my.cnf' | diff -s - ./configs/my.cnf
    if [ $? -eq 0 ]; then
        echo "Success to sync my.cnf."
    elif [ $? -eq 1 ]; then
        echo "Script error detected. to sync my.cnf"
        exit 1
    fi
done