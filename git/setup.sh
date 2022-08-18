#!/bin/bash
_log "Git setup"

cat << EOF | sudo tee $(pwd)/git/.gitconfig
[user]
    name = $GIT_USER
    email = $GIT_EMAIL
EOF

_log "User: $GIT_USER"
_log "Email: $GIT_EMAIL"
_log "Config file created in $(pwd)/git/.gitconfig"

_log "Git finished"
