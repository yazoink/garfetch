#!/bin/bash

# dependencies: glxinfo

CONFIG="garfetch.conf"
ASCII="ascii/garfield2.txt"
OPERATING_SYSTEM=true
KERNEL=true
DESKTOP=true
CPU=true
GPU=true
RAM=true
[ -f "$CONFIG" ] && . "$CONFIG"

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
  systemInfo[lastSystemInfoIndex]+="@$(getHostname)" && ((lastSystemInfoIndex++))
  [ "$OPERATING_SYSTEM" == true ] \
    && { systemInfo[lastSystemInfoIndex]="Operating System: $(getOperatingSystem)" \
      && ((lastSystemInfoIndex++)); }
  [ "$KERNEL" == true ] \
    &&  { systemInfo[lastSystemInfoIndex]="Kernel: $(getKernel)" \
      && ((lastSystemInfoIndex++)); }
  [ "$DESKTOP" == true ] \
    && { systemInfo[lastSystemInfoIndex]="Desktop: $(getDesktop)" \
      && ((lastSystemInfoIndex++)); }
  [ "$CPU" == true ] \
    && { systemInfo[lastSystemInfoIndex]="CPU: $(getCPU)" \
      && ((lastSystemInfoIndex++)); }
  [ "$GPU" == true ] \
    && { systemInfo[lastSystemInfoIndex]="GPU: $(getGPU)" \
      && ((lastSystemInfoIndex++)); }
  [ "$RAM" == true ] \
    && { systemInfo[lastSystemInfoIndex]="Memory: $(getRAM)" \
      && ((lastSystemInfoIndex++)); }

  for ((i = 0; i < ${#asciiArray[@]}; i++)); do
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

function getCPU() {
  cpu="$(grep "model name" /proc/cpuinfo | sed 's/.*: //' | head -n 1 || echo "Unknown")"
  echo "$cpu"
}

function getDesktop() {
  [ -n "$XDG_CURRENT_DESKTOP" ] \
    && { echo "$XDG_CURRENT_DESKTOP" \
    || { [ -n "$DESKTOP_SESSION" ] \
      && echo "$DESKTOP_SESSION"; } \
      || echo "Unknown"; }
}

function getGPU() {
  gpu="$(glxinfo | grep "OpenGL renderer string" | sed 's/OpenGL renderer string: //; s/ (.*//' \
    || echo "Unknown")"
  echo "$gpu"
}

function getHostname() {
  hostName=$(hostname || cat /etc/hostname || echo "Unknown")
  echo "$hostName"
}

function getKernel() {
  name="$(uname -s)"
  release="$(uname -r)"
  echo "$name $release"
}

function getRAM() {
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
  username="$(whoami || id -un || logname || echo "Unknown")"
  echo "$username"
}

main
