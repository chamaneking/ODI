#!/bin/bash
. /progiciel/oracle/scripts/agent_env.sh
$DOMAIN_HOME/bin/startComponent.sh $AGENT_NAME > $LOG_DIR/${AGENT_NAME}_start.out 2>&1
rc=$?
[ $rc -ne 0 ] && { echo "Echec demarrage agent (voir $LOG_DIR/${AGENT_NAME}_start.out)"; exit $rc; }
echo "$AGENT_NAME demarre"
