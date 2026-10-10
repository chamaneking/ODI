#!/bin/bash
. /progiciel/oracle/scripts/agent_env.sh
$DOMAIN_HOME/bin/stopComponent.sh $AGENT_NAME > $LOG_DIR/${AGENT_NAME}_stop.out 2>&1
exit 0
