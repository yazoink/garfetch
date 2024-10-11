#!/bin/bash

# dependencies: glxinfo

CONFIG="garfetch.conf"
ASCII="ascii/garfield2.txt"
OPERATING_SYSTEM=true
KERNEL=true
CPU=true
GPU=true
RAM=true
. "$CONFIG"

function main() {
  [ -f "$ASCII" ] \
    || { echo "Error: Ascii art not found. Make sure to include the correct path to it in $CONFIG"
      exit 1; }

  readarray -t asciiArray < "$ASCII"

  longestLineLength=0
  for line in "${asciiArray[@]}"; do
    currentLineLength=${#line}
    [ $currentLineLength -gt $longestLineLength ] && longestLineLength=$currentLineLength
  done

  declare -a systemInfo

  lastSystemInfoIndex=0
  systemInfo[lastSystemInfoIndex]="$(getUsername)"
  systemInfo[lastSystemInfoIndex]+="@$(getHostName)" && ((lastSystemInfoIndex++))
  [ "$OPERATING_SYSTEM" == true ] \
    && { systemInfo[lastSystemInfoIndex]="Operating System: $(getOperatingSystem)" && ((lastSystemInfoIndex++)); }
  [ "$KERNEL" == true ] \
    &&  { systemInfo[lastSystemInfoIndex]="Kernel: $(getKernel)" && ((lastSystemInfoIndex++)); }
  [ "$CPU" == true ] \
    && { systemInfo[lastSystemInfoIndex]="CPU: $(getCpu)" && ((lastSystemInfoIndex++)); }
  [ "$GPU" == true ] \
    && { systemInfo[lastSystemInfoIndex]="GPU: $(getGpu)" && ((lastSystemInfoIndex++)); }
  [ "$RAM" == true ] \
    && { systemInfo[lastSystemInfoIndex]="Memory: $(getRam)" && ((lastSystemInfoIndex++)); }

  for ((i = 0; i < ${#systemInfo[@]}; i++)) do
    echo "$i: ${systemInfo[i]}"
  done

  for ((i = 0; i < ${#asciiArray[@]}; i++)); do # for number of ascii lines to print
    line="${asciiArray[$i]}" 

    spaces=$((longestLineLength - ${#line}))
    for ((j = 0; j < spaces; j++)); do
      line+=" "
    done

    [ $i -gt 0 ] \
      && [ $i -lt $((${#systemInfo[@]} + 1)) ] && line+="    |" \
      && { [ -n "${systemInfo[i - 1]}" ] && line+=" ${systemInfo[i - 1]}"; }
    echo "$line"
  done
}

function getCpu() {
  cpu="$(grep "model name" /proc/cpuinfo | sed 's/.*: //' | head -n 1 || echo "Unknown")"
  echo "$cpu"
}

function getGpu() {
  gpu="$(glxinfo | grep "OpenGL renderer string" | sed 's/OpenGL renderer string: //; s/ (.*//' \
    || echo "Unknown")"
  echo "$gpu"
}

function getHostName() {
  hostName=$(hostname || cat /etc/hostname || echo "Unknown")
  echo "$hostName"
}

function getKernel() {
  name="$(uname -s)"
  release="$(uname -r)"
  echo "$name $release"
}

function getRam() {
  ram=$(free -h | awk '/^Mem:/ {print $2}' || echo "Unknown")
  echo "$ram"
}

function getOperatingSystem() {
  if . /etc/os-release; then
    echo "$PRETTY_NAME"
  elif . /etc/lsb-release; then
    echo "$DISTRIB_DESCRIPTION"
  else
    operatingSystem="$(uname -o || echo "Unknown")"
    echo "$operatingSystem"
  fi
}

function getUsername() {
  username="$(whoami || id -un || echo "$USER" || logname || echo "Unknown")"
  echo "$username"
}

main
