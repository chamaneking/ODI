#!/bin/bash
# Usage (root) : ./install.sh enterprise|agent
set -e
ROLE=$1
[ "$ROLE" = "enterprise" ] || [ "$ROLE" = "agent" ] || { echo "Usage: $0 enterprise|agent"; exit 1; }
[ "$(id -u)" -eq 0 ] || { echo "Executer en root"; exit 1; }
HERE=$(cd "$(dirname "$0")" && pwd)

install -d -o oracle -g oinstall -m 750 /progiciel/oracle/scripts /progiciel/oracle/logs
install -d -o oracle -g oinstall -m 700 /home/oracle/.wlst

for f in $HERE/$ROLE/scripts/*; do
  install -o oracle -g oinstall -m 750 "$f" /progiciel/oracle/scripts/
done
for f in $HERE/$ROLE/systemd/*.service; do
  install -o root -g root -m 644 "$f" /etc/systemd/system/
done

systemctl daemon-reload
if [ "$ROLE" = "enterprise" ]; then
  systemctl enable odi-nodemanager odi-adminserver odi-server1
else
  systemctl enable odi-agent-nodemanager odi-agent
fi
echo "Installation $ROLE terminee. Voir README.md pour la suite (credentials, tests)."
