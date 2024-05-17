#!/bin/bash

sudo unminimize

if [ ! -f /workspaces/bootdev.yaml ]; then
    echo "Creating /workspaces/bootdev.yaml"
    touch /workspaces/bootdev.yaml
fi

if [ ! -L $HOME/.bootdev.yaml ]; then
    echo "Creating symbolic link from /workspaces/bootdev.yaml to $HOME/.bootdev.yaml"
    ln -s /workspaces/bootdev.yaml $HOME/.bootdev.yaml
fi

if ! command -v bootdev &> /dev/null; then
    echo "Installing bootdev"
    go install github.com/bootdotdev/bootdev@latest
fi
