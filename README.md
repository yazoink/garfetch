# garfetch
A simple and fairly customizable system fetch written in bash, featuring Garfield.
![20241012_02:16:32_screenshot](https://github.com/user-attachments/assets/96df7f36-8bf5-46d3-b1c2-0dd28931e004)
![20241015_00:27:42_screenshot](https://github.com/user-attachments/assets/dd10f9ca-1f22-4327-abd5-7ed346af44ba)

## Dependencies
The GPU module requires the `lspci` command from `pciutils` and the MPD module requires `mpc`.

## Installation
### Quick
`git clone https://github.com/yazoink/garfetch`     
`cd garfetch`    
`bash install.sh`    

and to uninstall, run `bash install.sh --remove`.     
To see all the options for the installer script, run `bash install.sh -h`.

### Manual
`git clone https://github.com/yazoink/garfetch`     
`cd garfetch`     
`chmod +x garfetch`     
`sudo cp garfetch /usr/bin`     
`sudo mkdir -p /etc/garfetch`     
`sudo cp -r garfetch.conf ascii /etc/garfetch`     
#### optional    
`mkdir -p ~/.config/garfetch`     
`cp garfetch.conf ~/.config/garfetch`

## Configuration
The script looks for `garfetch.conf` in `~/.config/garfetch` or `/etc/garfetch`.
The [default config](https://github.com/yazoink/garfetch/blob/main/garfetch.conf) contains documentation for all of the options.

## To-Do
NixOS module.

## Credits
The ascii art from `garfield1.txt`, `garfield2.txt` and `garfield2.txt` was taken from [here](https://www.asciiart.eu/comics/garfield) and `garfies.txt` is an official ascii [Garfies](https://x.com/GARFIES_).
