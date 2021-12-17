Use python application without clutters
```
sudo apt install pipx python3-venv
pipx ensurepath
```
```
pipx install glances
pipx run pycowsay moo
pipx install cowsay
```

KDE Connects useful commands
```
MORE: 
https://userbase.kde.org/KDE_Connect/Tutorials/Useful_commands

webcam to phone:
file="$HOME/Pictures/WebcamImage_$(date "+%Y%m%d_%H%M%S").jpg"; ffmpeg -f video4linux2 -s 640x480 -i /dev/video0 -ss 0:0:2 -frames 1 "${file}" && kdeconnect-cli -d $(kdeconnect-cli -a --id-only) --share "${file}"
```
