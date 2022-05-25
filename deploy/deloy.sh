#!/bin/bash
set -e
# This scripts is used to 
# - send bin and init SQL files to host with rsync

echo "Start to deploy apps"

# source ./hosts/hosts.txt

echo "Deploy to ${APP_HOSTS[host_idx]}:${APP_HOSTS_SSH_PORT[host_idx]}"
rsync -r -av ./webapp/golang/isucon /home/kitakou/kayac-isucon/code/kayac-isucon-2022-main/webapp/golang/
rsync -r -av ./webapp/sql /home/kitakou/kayac-isucon/code/kayac-isucon-2022-main/

echo "Finish to deploy apps"