# garfetch
![20241012_00:52:21_screenshot](https://github.com/user-attachments/assets/1973f652-a187-4d0e-a2d0-6078b11f198e)

## Dependencies
The only dependency is `glxinfo`. The package is called `mesa-utils` on most distros.

## Installation
`git clone https://github.com/yazoink/garfetch`     
`cd garfetch`     
`chmod +x garfetch` and copy it so somewhere in your `$PATH` or just run `./garfetch`     

## Configuration
The script looks for `garfetch.conf` in `~/.config/garfetch` or in the same directory as the script.
The default config looks like this:
```bash
# path to ascii art
ASCII="ascii/garfield2.txt"

# decorations
SEPARATOR="|"
ARROW="->"
COLOR_SAMPLE="-*-"

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

## Credits
The ascii art was taken from [here](https://www.asciiart.eu/comics/garfield).
