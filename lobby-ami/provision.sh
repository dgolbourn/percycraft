#!/bin/bash -xe
echo Provision lobby started >&2

dnf update -y
mkdir -p /opt/lazymc
sudo curl -fsSL -o /opt/lazymc/lazymc https://github.com/timvisee/lazymc/releases/download/v0.2.10/lazymc-v0.2.10-linux-aarch64
chmod +x /opt/lazymc/lazymc
cp /tmp/percycraft/lobby-ami/server.properties /opt/lazymc
cp /tmp/percycraft/lobby-ami/lazymc.toml /opt/lazymc
cp /tmp/percycraft/lobby-ami/server-icon.png /opt/lazymc
cp /tmp/percycraft/lobby-ami/lobby.service /etc/systemd/system/lobby.service
mkdir -p /opt/lobby
cp /tmp/percycraft/lobby-ami/start-command.sh /opt/lobby/
chmod +x /opt/lobby/start-command.sh
cp /tmp/percycraft/lobby-ami/userdata.sh /opt/lobby/userdata.sh
chmod +x /opt/lobby/userdata.sh

echo Provision lobby complete >&2
