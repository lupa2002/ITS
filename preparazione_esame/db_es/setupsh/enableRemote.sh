#!/bin/bash
systemctl stop docker
cat <<EOF >/etc/docker/daemon.json
{
    "hosts": ["unix:///var/run/docker.sock", "tcp://0.0.0.0:2375"]
}
EOF
mkdir -p /etc/systemd/system/docker.service.d/
cat <<EOF >/etc/systemd/system/docker.service.d/override.conf
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd
EOF
systemctl daemon-reload
sleep 5
systemctl start docker
systemctl status docker
