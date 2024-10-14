INSTALL_PATH="/usr/bin/garfetch"
CONFIG_PATH="/home/$USER/.config/garfetch"

function install() {
  chmod +x garfetch
  [ -f $INSTALL_PATH ] && sudo rm "$INSTALL_PATH"
  sudo cp garfetch "$INSTALL_PATH"
  [ -d "$CONFIG_PATH" ] && rm -rf "$CONFIG_PATH"
  mkdir -p "$CONFIG_PATH"
  cp -r ascii "$CONFIG_PATH/ascii"
  sed -i 's/ASCII=\".*\"/ASCII=\"~\/.config\/ascii\/garfield2.txt/\"' garfetch.conf
  cp garfetch.conf "$CONFIG_PATH/garfetch.conf"
  echo "installed garfetch."
}

function usage() {
  echo "Usage: ./install.sh [option]"
  echo "Options:"
  echo "    --install | -i: install script"
  echo "    --remove | -r: remove script"
  echo "    --help | -h: help"
}

case "$1" in
  "-i" | "--install" | "") install ;;
  "-r" | "--remove") remove ;;
  "-h" | "--help") usage ;;
  *) usage && exit 1;;
esac
