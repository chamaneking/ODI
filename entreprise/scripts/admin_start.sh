#!/bin/bash
. /progiciel/oracle/scripts/odi_env.sh
nohup $DOMAIN_HOME/bin/startWebLogic.sh > $LOG_DIR/adminserver.out 2>&1 &
wait_ready http://${ADMIN_HOST}:${ADMIN_PORT}/weblogic/ready 600 \
  || { echo "AdminServer non RUNNING"; exit 1; }
echo "AdminServer RUNNING"
