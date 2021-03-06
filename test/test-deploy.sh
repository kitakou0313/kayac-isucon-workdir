#!/bin/bash
set -e

source ./hosts/hosts.txt

# Init test env
docker compose down deploy-test

# Test after-bench.sh
docker compose up -d deploy-test

sleep 5

bash ./deploy/deloy.sh

for ((host_idx=0; host_idx<${APP_HOSTS_NUMS}; host_idx++));
do
    ssh -p ${APP_HOSTS_SSH_PORT[host_idx]} -i ${APP_HOSTS_SSH_PUB_KEY[host_idx]} ${APP_HOSTS_SSH_USER[host_idx]}@${APP_HOSTS[host_idx]} 'cat /root/webapp/main' | diff -s - ./webapp/sample-webapp/sample
    if [ $? -eq 0 ]; then
        echo "Success to deploy."
    elif [ $? -eq 1 ]; then
        echo "Script error detected. Can't deploy sample web app"
        exit 1
    fi

    ssh -p ${APP_HOSTS_SSH_PORT[host_idx]} -i ${APP_HOSTS_SSH_PUB_KEY[host_idx]} ${APP_HOSTS_SSH_USER[host_idx]}@${APP_HOSTS[host_idx]} 'cat /root/webapp/isucon/sql/0_schema.sql' | diff -s - ./webapp/sample-webapp/sql/0_schema.sql
    if [ $? -eq 0 ]; then
        echo "Success to sql file."
    elif [ $? -eq 1 ]; then
        echo "Script error detected. Can't deploy sql file."
        exit 1
    fi

done