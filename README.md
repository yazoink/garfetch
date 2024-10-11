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
# path to ascii art
ASCII="ascii/garfield2.txt"

# decorations
SEPARATOR="|"
ARROW="-> "
COLOR_SAMPLE="-*-"
COLOR_SAMPLE_BEFORE="\`"
COLOR_SAMPLE_AFTER=""
USER_AT_HOST_BEFORE=" _-{"
USER_AT_HOST_AFTER="}-_"

# which information to print
OPERATING_SYSTEM=true
KERNEL=true
DESKTOP=true
TERMINAL=true
TERMINAL_SHELL=true
CPU=true
GPU=true
RAM=true
```

It's pretty self-explanatory.
Look at the screenshot if you're confused about any of the decorations.

## To-Do
NixOS module.

## Credits
The ascii art was taken from [here](https://www.asciiart.eu/comics/garfield).
