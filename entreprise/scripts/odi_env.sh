#!/bin/bash
# Environnement commun - serveur ODI Enterprise (sfuprl18491)
export MW_HOME=/progiciel/oracle/product/middlewareODI12R21
export JAVA_HOME=/progiciel/oracle/product/jdk/jdk1.8.0_202
export DOMAIN_HOME=$MW_HOME/user_projects/domains/base_domain
export ADMIN_HOST=sfxxxxxxx
export ADMIN_PORT=7001
export ADMIN_URL=t3://${ADMIN_HOST}:${ADMIN_PORT}
export MS_NAME=ODI_server1
export MS_HOST=sfuprl18491
export MS_PORT=8001
export NM_PORT=5556
export WLST_SEC=/home/oracle/.wlst
export LOG_DIR=/progiciel/oracle/logs
export SCRIPT_DIR=/progiciel/oracle/scripts
export PATH=$JAVA_HOME/bin:$PATH

. $DOMAIN_HOME/bin/setDomainEnv.sh > /dev/null 2>&1

# wait_port host port timeout_sec
wait_port() {
  local t=0
  until (echo > /dev/tcp/$1/$2) 2>/dev/null; do
    sleep 3; t=$((t+3)); [ $t -ge $3 ] && return 1
  done
  return 0
}

# wait_ready url timeout_sec  (attend HTTP 200 sur /weblogic/ready)
wait_ready() {
  local t=0
  until [ "$(curl -s --noproxy '*' -o /dev/null -w '%{http_code}' "$1")" = "200" ]; do
    sleep 5; t=$((t+5)); [ $t -ge $2 ] && return 1
  done
  return 0
}
