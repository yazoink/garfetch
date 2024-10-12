# garfetch
![20241012_02:16:32_screenshot](https://github.com/user-attachments/assets/96df7f36-8bf5-46d3-b1c2-0dd28931e004)

## Dependencies
The only dependency is `glxinfo`. The package is called `mesa-utils` on most distros.

## Installation
`git clone https://github.com/yazoink/garfetch`     
`cd garfetch`     
`chmod +x garfetch` and copy it so somewhere in your `$PATH` (make sure to configure the path to the ascii art correctly) or just run `./garfetch`     

## Configuration
The script looks for `garfetch.conf` in `~/.config/garfetch` or in the same directory as the script.
The default config looks like this:
```bash
# path to ascii art (relative to the script's location)
#
# the default available options are:
# - ascii/garfield1.txt
# - ascii/garfield2.txt
# - ascii/garfield3.txt
ASCII="ascii/garfield2.txt"

# decorations
PRINT_USER_AT_HOST=true
PRINT_COLOR_SAMPLE=true
SEPARATOR="|"
ARROW="-> "
COLOR_SAMPLE="-*-"
COLOR_SAMPLE_BEFORE="\`"
COLOR_SAMPLE_AFTER=""
USER_AT_HOST_BEFORE=" _-{"
USER_AT_HOST_AFTER="}-_"

# which modules/information to print
#
# the available options are:
# - Distro
# - Host
# - Kernel
# - Desktop
# - Terminal
# - Shell
# - CPU
# - GPU
# - Memory
#
# the modules will be printed from top-to-bottom order
# from the array below.
MODULE_LIST=(
  "Distro"
  "Host"
  "Kernel"
  "Desktop"
  "Terminal"
  "Shell"
  "CPU"
  "GPU"
  "Memory"
)
```

It's pretty self-explanatory.
Look at the screenshot if you're confused about any of the decorations.

## To-Do
NixOS module.

## Credits
The ascii art was taken from [here](https://www.asciiart.eu/comics/garfield).
