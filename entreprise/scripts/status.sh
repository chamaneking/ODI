#!/bin/bash
. /progiciel/oracle/scripts/odi_env.sh
echo -n "NodeManager (port $NM_PORT) : "; wait_port localhost $NM_PORT 3 && echo OK || echo KO
echo -n "AdminServer (HTTP)          : "; curl -s --noproxy '*' -o /dev/null -w '%{http_code}\n' http://${ADMIN_HOST}:${ADMIN_PORT}/weblogic/ready
echo -n "$MS_NAME (HTTP)         : "; curl -s --noproxy '*' -o /dev/null -w '%{http_code}\n' http://${MS_HOST}:${MS_PORT}/weblogic/ready
echo "(200 = RUNNING)"
