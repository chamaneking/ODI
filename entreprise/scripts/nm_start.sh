#!/bin/bash
. /progiciel/oracle/scripts/odi_env.sh
nohup $DOMAIN_HOME/bin/startNodeManager.sh > $LOG_DIR/nodemanager.out 2>&1 &
wait_port localhost $NM_PORT 120 || { echo "NodeManager KO"; exit 1; }
echo "NodeManager demarre"
