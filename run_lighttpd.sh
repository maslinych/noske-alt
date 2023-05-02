#!/usr/bin/env bash
if [ ! "$(ls -A /usr/lib/python3.6/dist-packages/bonito)" ];
then cp -R /usr/lib/python3.6/site-packages/bonito.init/* /usr/lib/python3.6/dist-packages/bonito
fi
if [ ! "$(ls -A /var/www/crystal)" ];
then cp -R /var/www/crystal.init/* /var/www/crystal
     sed -i "s~URL_BONITO: \"http://localhost/~URL_SKE_LI: \"about:blank\", URL_CA: \"about:blank\", URL_BONITO: \"${BROWSER_URL_BONITO:-}/~g" /var/www/crystal/config.js
fi
for corp in $CORPLIST
do path=$(grep -h ^PATH $MANATEE_REGISTRY/$corp | sed -e 's/^PATH[^"]*"\(.*\)"$/\1/g')
if [ ! -d $path ] || [ ! "$(ls -A $path)" ]
  then mkdir -p $path; compilecorp --no-ske --no-alignsizes $corp
  fi
done
for corp in $CORPLIST
do 
	compilecorp --no-ske --recompile-sizes $corp
done
exec 3>&1
exec /usr/sbin/lighttpd -f /etc/lighttpd/lighttpd.conf -D
