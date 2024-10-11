function main() {
  kernel=''
  gpu=''
  ram=''

  userName=$(getUserName)
  hostName="$(getHostName)"
  operatingSystem=$(getOperatingSystem)
  kernel="$(getKernel)"
  cpu="$(getCpu)"

  echo "$userName@$hostName"
  echo "$operatingSystem"
  echo "$kernel"
  echo "$cpu"
}

function getCpu() {
  grep "model name" /proc/cpuinfo | sed 's/.*: //' | head -n 1
}

function getHostName() {
  hostName=$(hostname || cat /etc/hostname)
  echo "$hostName"
}

function getKernel() {
  name="$(uname -s)"
  release="$(uname -r)"
  echo "$name-$release"
}

function getOperatingSystem() {
  if . /etc/os-release; then
    echo "$PRETTY_NAME"
  elif . /etc/lsb-release; then
    echo "$DISTRIB_DESCRIPTION"
  else
    uname -o
  fi
}

function getUserName() {
  whoami || id -un || echo "$USER" || logname 
}

main
