#!/bin/bash

INSTALL_PATH="/usr/bin/garfetch"
CONFIG_PATH="/home/$USER/.config/garfetch"

function clean() {
  [ -d "$CONFIG_PATH" ] && rm -rf "$CONFIG_PATH"
}

function install() {
  chmod +x garfetch
  [ -f $INSTALL_PATH ] && sudo rm "$INSTALL_PATH"
  sudo cp garfetch "$INSTALL_PATH"
  [ ! -d "$CONFIG_PATH" ] && mkdir -p "$CONFIG_PATH"
  [ ! -d "$CONFIG_PATH/ascii" ] && cp -r ascii "$CONFIG_PATH/ascii"
  [ ! -f "$CONFIG_PATH/garfetch.conf" ] \
    && cp garfetch.conf "$CONFIG_PATH/garfetch.conf"
  sed -i "s|ASCII=\".*\"|ASCII=\"$CONFIG_PATH\/ascii\/garfield2.txt\"|" \
    "$CONFIG_PATH/garfetch.conf"
  echo "installed garfetch."
}

function remove() {
  sudo rm "$INSTALL_PATH"
  echo "uninstalled garfetch"
}

function usage() {
  echo "Usage: ./install.sh [option]"
  echo "Options:"
  echo "    --install | -i: install script"
  echo "    --clean-install | -ci: install script and overwrite old configs"
  echo "    --remove | -r: remove script"
  echo "    --clean-remove | -cr: remove script and delete old configs"
  echo "    --help | -h: help"
}

case "$1" in
  "-i" | "--install" | "") install ;;
  "-ci" | "--clean-install") clean; install ;;
  "-r" | "--remove") remove ;;
  "-cr" | "--clean-remove") clean; remove ;;
  "-h" | "--help") usage ;;
  *) usage && exit 1;;
esac
