#!/bin/bash
set -e
# This scripts is used to 
# - fetch log files(nginx, mysql logs) to analyze in local.
# - fetch pprof output

echo "Start to fetch log file from localhost"

# source ./hosts/hosts.txt

# for ((host_idx=0; host_idx<${FRONTEND_HOSTS_NUMS}; host_idx++));
# do
#   echo "Fetch log from ${FRONTEND_HOSTS[host_idx]}:${FRONTEND_HOSTS_SSH_PORT[host_idx]}"
#   rsync -e "ssh -p ${FRONTEND_HOSTS_SSH_PORT[host_idx]} -i ${FRONTEND_HOSTS_SSH_PUB_KEY[host_idx]}" -av ${FRONTEND_HOSTS_SSH_USER[host_idx]}@${FRONTEND_HOSTS[host_idx]}:/var/log/nginx/access.log ./kataribe/webserver-log/access.log
# done

# for ((host_idx=0; host_idx<${DB_HOSTS_NUMS}; host_idx++));
# do
#   # Fetch mysql slowquery-log
#   echo "Fetch mysql slow query log from ${DB_HOSTS[host_idx]}:${DB_HOSTS_SSH_PORT[host_idx]}"
#   rsync -e "ssh -p ${DB_HOSTS_SSH_PORT[host_idx]} -i ${DB_HOSTS_SSH_PUB_KEY[host_idx]}" -av ${DB_HOSTS_SSH_USER[host_idx]}@${DB_HOSTS[host_idx]}:/var/log/mysql/mysql-slow.log ./mysql-slowquery/mysql-slowquery-log/mysql-slow.log
# done

# for ((host_idx=0; host_idx<${APP_HOSTS_NUMS}; host_idx++));
# do 
#   # Fetch pprof logs
#   echo "Fetch pprof log from ${APP_HOSTS[host_idx]}:${APP_HOSTS_SSH_PORT[host_idx]}"
#   rsync -e "ssh -p ${APP_HOSTS_SSH_PORT[host_idx]} -i ${APP_HOSTS_SSH_PUB_KEY[host_idx]}" -av ${APP_HOSTS_SSH_USER[host_idx]}@${APP_HOSTS[host_idx]}:/root/webapp/cpu.pprof ./pprof/profilefiles/cpu.pprof
# done

curl http://localhost/api/bench/stop
sleep 2

rsync -e -av /home/kitakou/kayac-isucon/code/kayac-isucon-2022-main/webapp/nginx/log/access.log ./kataribe/webserver-log/access.log
rsync -e -av /home/kitakou/kayac-isucon/code/kayac-isucon-2022-main/webapp/mysql/logs/mysql-slow.log ./mysql-slowquery/mysql-slowquery-log/mysql-slow.log
rsync -e -av /home/kitakou/kayac-isucon/code/kayac-isucon-2022-main/webapp/golang/isucon ./pprof/profilefiles/isucon
rsync -e -av /home/kitakou/kayac-isucon/code/kayac-isucon-2022-main/webapp/golang/pprof/cpu.pprof ./pprof/profilefiles/cpu.pprof

echo "Finish to fetch log files"