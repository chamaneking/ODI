# Usage: wlst.sh wls_shutdown.py <url> <nom_serveur>
import sys
url, name = sys.argv[1], sys.argv[2]
sec = '/home/oracle/.wlst/'
connect(userConfigFile=sec+'odi_user.sec', userKeyFile=sec+'odi_key.sec', url=url)
try:
    # ignoreSessions=true, timeout=120s, force=true
    shutdown(name, 'Server', 'true', 120, 'true')
except Exception, e:
    print 'Info : ' + str(e)   # normal quand on arrete l'AdminServer lui-meme
try:
    disconnect()
except:
    pass
exit()
