#!/bin/sh
set -eu
umask 077

if ! getent group norris >/dev/null; then
    groupadd --gid 1000 norris
fi
if ! id -u norris >/dev/null 2>&1; then
    useradd --uid 1000 --gid norris --no-create-home \
        --home-dir /home/norris --shell /bin/bash --password '*' norris
fi

install -d -m 0700 -o norris -g norris /var/lib/devbox/home
ln -sfn /var/lib/devbox/home /home/norris
install -d -m 0700 -o root -g root /var/lib/devbox/ssh
install -d -m 0755 /run/sshd

host_key=/var/lib/devbox/ssh/ssh_host_ed25519_key
if [ ! -f "$host_key" ]; then
    ssh-keygen -q -t ed25519 -N '' -f "$host_key"
fi

exec /usr/sbin/sshd -D -e -f /etc/devbox/startup/sshd_config
