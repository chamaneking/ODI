#!/bin/bash
# A lancer UNE fois, en tant que oracle, AdminServer demarre.
# Le mot de passe est saisi a l'invite (jamais ecrit dans un fichier).
. /progiciel/oracle/scripts/odi_env.sh
mkdir -p $WLST_SEC && chmod 700 $WLST_SEC
cat > /tmp/store_cred.py <<PY
import getpass
u = raw_input('Utilisateur WebLogic [weblogic] : ') or 'weblogic'
p = getpass.getpass('Mot de passe : ')
connect(u, p, '$ADMIN_URL')
storeUserConfig('$WLST_SEC/odi_user.sec', '$WLST_SEC/odi_key.sec')
disconnect()
exit()
PY
$MW_HOME/oracle_common/common/bin/wlst.sh /tmp/store_cred.py
rm -f /tmp/store_cred.py
chmod 600 $WLST_SEC/odi_*.sec
ls -l $WLST_SEC
