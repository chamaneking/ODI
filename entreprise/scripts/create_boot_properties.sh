#!/bin/bash
# A lancer UNE fois, en tant que oracle, AVANT le premier demarrage.
# WebLogic chiffre le fichier au premier demarrage.
. /progiciel/oracle/scripts/odi_env.sh
read -p "Utilisateur WebLogic [weblogic] : " U; U=${U:-weblogic}
read -s -p "Mot de passe : " P; echo
for S in AdminServer $MS_NAME; do
  mkdir -p $DOMAIN_HOME/servers/$S/security
  printf 'username=%s\npassword=%s\n' "$U" "$P" > $DOMAIN_HOME/servers/$S/security/boot.properties
  chmod 600 $DOMAIN_HOME/servers/$S/security/boot.properties
done
unset P
echo "boot.properties crees pour AdminServer et $MS_NAME"
