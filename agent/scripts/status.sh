#!/bin/bash
. /progiciel/oracle/scripts/agent_env.sh
echo -n "NodeManager (port $NM_PORT) : "; wait_port localhost $NM_PORT 3 && echo OK || echo KO
echo -n "Agent : "; pgrep -f "OracleDIAgent1" > /dev/null && echo "processus present" || echo "processus absent"
