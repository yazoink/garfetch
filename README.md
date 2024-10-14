# garfetch
A simple and fairly customizable system fetch written in BASH, featuring Garfield.
![20241012_02:16:32_screenshot](https://github.com/user-attachments/assets/96df7f36-8bf5-46d3-b1c2-0dd28931e004)
![20241012_13:29:55_screenshot](https://github.com/user-attachments/assets/1ceac294-ab93-49d1-820e-1a0e7a750cac)



## Dependencies
The only dependency is `glxinfo`. The package is called `mesa-utils` on most distros.

## Installation
### Quick
`git clone https://github.com/yazoink/garfetch`     
`cd garfetch`  
`bash install.sh`    

and to uninstall, run `bash install.sh --remove`

### Manual
`git clone https://github.com/yazoink/garfetch`     
`cd garfetch`     
`chmod +x garfetch` and copy it so somewhere in your `$PATH` (make sure to configure the path to the ascii art correctly) or just run `./garfetch`     

## Configuration
The script looks for `garfetch.conf` in `~/.config/garfetch` or in the same directory as the script.
The default config looks like this:
```bash
# ----- APPEARANCE -----
# --- BOOLEANS ---
# the options below only accept "true" and "false" as values
#
# - "PRINT_USER_AT_HOST" toggles the user@host line up the top
# - "PRINT_COLOR_SAMPLE" toggles the line at the bottom displaying
#   the colors in your terminal colorscheme
#   (it looks like "-*--*--*--*--*--*-" by default)
PRINT_USER_AT_HOST=true
PRINT_COLOR_SAMPLE=true

# --- STRINGS ---
# these options will accept any string of characters inside double or
# single quotes. Special BASH characters such as "#", ";", "&", "`", etc
# must be escaped with a backslash. for example:
# if you want to use the "`" character, you must enter it as "\`".
#
# "ASCII" sets path to ascii art.
# if you move the script into a directory which does not also contain the
# "ascii/" directory, you must set "ASCII" to either the absolute path to the
# art you are using or the new relative path.
#
# for example:
# if you have moved the "garfetch" file to "~/.local/bin/garfetch" and you
# have moved the "ascii/" directory to "~/.config/garfetch/ascii", you can
# set "ASCII" to either
# "/home/<yourusername>/.config/garfetch/ascii/garfield2.txt" or
# "../../.config/garfetch/ascii/garfield2.txt" (although I would
# heavily discourage the latter).
#
# the default available options are:
# - ascii/garfield1.txt
# - ascii/garfield2.txt
# - ascii/garfield3.txt
ASCII="ascii/garfield2.txt"

# any of the following options can be disabled with "", although
# "COLOR_SAMPLE" and "USER_AT_HOST" will still reserve blank lines. to disable
# the lines, you must set "COLOR_SAMPLE=false"/"USER_AT_HOST=false".
#
# - "SEPARATOR" is the character separating the art from the fetch
#   info (it looks like "|" by default). tt can be disabled by setting it to "".
# - "ARROW" is the bit between the separator and the text ("-> " by default).
# - "COLOR_SAMPLE" sets the character(s) used to display your terminal
#   colorscheme ("-*-" by default).
# - "COLOR_SAMPLE_BEFORE" sets the character(s) before the color sample.
#   (default is "\`", displaying as "`" because it's a special character)
# - "COLOR_SAMPLE_AFTER" sets the character(s) displayed after the color sample.
#   it's set to blank by default.
# - "USER_AT HOST_BEFORE" sets the character(s) displayed before "user@host"
#   ("_-{" by default).
# - "USER_AT HOST_AFTER" sets the character(s) displayed after "user@host"
#   ("}-_" by default).
SEPARATOR="|"
ARROW="-> "
COLOR_SAMPLE="-*-"
COLOR_SAMPLE_BEFORE="\`"
COLOR_SAMPLE_AFTER=""
USER_AT_HOST_BEFORE=" _-{"
USER_AT_HOST_AFTER="}-_"

# ----- MODULES -----
# "MODULE_LIST" sets which modules/information to print.
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

## To-Do
NixOS module.

## Credits
The ascii art was taken from [here](https://www.asciiart.eu/comics/garfield).
