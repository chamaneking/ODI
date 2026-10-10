#!/bin/bash
. /progiciel/oracle/scripts/odi_env.sh
nohup $DOMAIN_HOME/bin/startManagedWebLogic.sh $MS_NAME $ADMIN_URL \
      > $LOG_DIR/${MS_NAME}.out 2>&1 &
wait_ready http://${MS_HOST}:${MS_PORT}/weblogic/ready 900 \
  || { echo "$MS_NAME non RUNNING"; exit 1; }
echo "$MS_NAME RUNNING"
