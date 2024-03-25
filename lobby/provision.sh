#!/bin/bash
echo Provision lobby started >&2
source /opt/.env

allowlist() {
    echo "[" > /opt/lazymc/whitelist.json
    ALLOW=""
    for i in ${PLAYERLIST//,/ }
    do
        PERSON=$(curl https://api.mojang.com/users/profiles/minecraft/$i)
        ALLOW+=$PERSON,
    done
    echo ${ALLOW%,*} >> /opt/lazymc/whitelist.json
    echo "]" >> /opt/lazymc/whitelist.json
    sed -i "s/\"id\"/\"uuid\"/g" /opt/lazymc/whitelist.json
}

lazymc() {
    mkdir -p /opt/lazymc
    sudo curl -fsSL -o /opt/lazymc/lazymc https://github.com/timvisee/lazymc/releases/download/v0.2.10/lazymc-v0.2.10-linux-aarch64
    chmod +x /opt/lazymc/lazymc
}

lobby() {
    lazymc
    allowlist
    cp /opt/percycraft/lobby/server.sh /opt/lazymc
    cp /opt/percycraft/lobby/server.properties /opt/lazymc
    cp /opt/percycraft/lobby/lazymc.toml /opt/lazymc
    cp /opt/percycraft/lobby/server-icon.png /opt/lazymc
    chmod +x /opt/lazymc/server.sh    
    cp /opt/percycraft/lobby/lobby.service /etc/systemd/system/lobby.service
    systemctl enable lobby.service
    systemctl start lobby.service
}

lobby
echo Provision lobby complete >&2
