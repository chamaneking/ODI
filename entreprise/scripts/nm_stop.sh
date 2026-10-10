#!/bin/bash
. /progiciel/oracle/scripts/odi_env.sh
if [ -x $DOMAIN_HOME/bin/stopNodeManager.sh ]; then
  $DOMAIN_HOME/bin/stopNodeManager.sh > $LOG_DIR/nodemanager_stop.out 2>&1
fi
sleep 5
pkill -f "weblogic.NodeManager" 2>/dev/null || true
exit 0
