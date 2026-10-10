#!/bin/bash
# Environnement commun - serveur Agent standalone (SFUPAG)
export MW_HOME=/progiciel/oracle/product/middlewareODI12R21
export JAVA_HOME=/progiciel/oracle/product/jdk/jdk1.8.0_202
export DOMAIN_HOME=$MW_HOME/user_projects/domains/base_domain
export AGENT_NAME=OracleDIAgent1
export NM_PORT=5556
export LOG_DIR=/progiciel/oracle/logs
export PATH=$JAVA_HOME/bin:$PATH

. $DOMAIN_HOME/bin/setDomainEnv.sh > /dev/null 2>&1

wait_port() {
  local t=0
  until (echo > /dev/tcp/$1/$2) 2>/dev/null; do
    sleep 3; t=$((t+3)); [ $t -ge $3 ] && return 1
  done
  return 0
}
