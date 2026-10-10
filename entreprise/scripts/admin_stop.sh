#!/bin/bash
. /progiciel/oracle/scripts/odi_env.sh
$MW_HOME/oracle_common/common/bin/wlst.sh $SCRIPT_DIR/wls_shutdown.py \
   $ADMIN_URL AdminServer > $LOG_DIR/adminserver_stop.out 2>&1
exit 0
