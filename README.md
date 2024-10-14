# garfetch
A simple and fairly customizable system fetch written in BASH, featuring Garfield.
![20241012_02:16:32_screenshot](https://github.com/user-attachments/assets/96df7f36-8bf5-46d3-b1c2-0dd28931e004)
![20241012_13:29:55_screenshot](https://github.com/user-attachments/assets/1ceac294-ab93-49d1-820e-1a0e7a750cac)



## Dependencies
The GPU module requires the `lspci` command from `pciutils` and the MPD module requires `mpc`.

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
The [default config](https://github.com/yazoink/garfetch/blob/main/garfetch.conf) contains documentation for all of the options.

## To-Do
NixOS module.

## Credits
The ascii art was taken from [here](https://www.asciiart.eu/comics/garfield).
