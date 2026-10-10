#!/bin/bash
# A lancer UNE fois, en tant que oracle, Node Manager demarre (agent_nm_start.sh).
# Le mot de passe du Node Manager est saisi a l'invite.
. /progiciel/oracle/scripts/agent_env.sh
$DOMAIN_HOME/bin/startComponent.sh $AGENT_NAME storeUserConfig
