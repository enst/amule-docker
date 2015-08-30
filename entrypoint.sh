#!/bin/bash

[ -e /root/.aMule/amule.conf ] || ( amuled && sleep 5 )

sed -i "/AcceptExternalConnections/s/=.*/=1/" /root/.aMule/amule.conf \
     && sed -i "/^ECPassword/s/=.*/=$(echo -n ${PASSWORD} | md5sum | cut -d ' ' -f 1)/" /root/.aMule/amule.conf \
     && sed -i "/^Password=$/s/=.*/=${PASSWORD}/" /root/.aMule/amule.conf

amuled &
sleep 5
amuleweb -P $PASSWORD -A $PASSWORD


