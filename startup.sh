#!/bin/bash
cd ~/remote/home-manager

nix run home-manager -- switch --flake ~/remote/home-manager

cat "$0"
#alias hm='bash ~/remote/home-manager/startup.sh'
