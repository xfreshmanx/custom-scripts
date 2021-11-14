#### Debian KDE Bullseye Post Installation

##### Update System
```
sudo apt update && sudo apt upgrade
```

##### KDE bloat removal
```
sudo apt-get remove --purge 'kontrast*', 'k3b*', 'akregator*', 'imagemagick*', 'kmail*', 'apper*', 'dragon*','juk*','contact*','kmousetool*','kmouth*','kwrite*','kmag*','konqueror*','sieveeditor*'
```
##### Flatpak Install
```
sudo apt install flatpak 
sudo apt install gnome-software-plugin-flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

##### Remove *-src from sources
```
sudo vim /etc/apt/sources.list
```

##### Install necessary software
```
sudo apt install synaptic breeze-gtk kde-gtk-config kde-config-gtk-style kde-config-gtk-style-preview vlc kdeconnect vim htop neofetch gstreamer1.0-nice gstreamer1.0-plugins-bad python-is-python3 python3-pip ncdu thunderbird stacer
flatpak install flatseal dropbox joplin qbittorrent 
```
[Setup bootsplash](https://wiki.debian.org/plymouth#Preinstallation "Setup bootsplash")
```
sudo apt install plymouth plymouth-themes plymouth-theme-breeze kde-config-plymouth kde-config-sddm sddm-theme-debian-breeze
sudo vim /etc/default/grub
# GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
sudo update-grub
plymouth-set-default-theme -l
sudo plymouth-set-default-theme -R bgrt
```
##### Mount Drives
```
ls -l /dev/disk/by-uuid
sudo vim /etc/fstab
```

##### Wine 
- wine from wine-hq install [wiki](https://wiki.winehq.org/Debian "wiki")
```
sudo dpkg --add-architecture i386
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key
sudo echo "deb https://dl.winehq.org/wine-builds/debian/ bullseye main" >  /tmp/winehq.list
sudo cp -v /tmp/winehq.list /etc/apt/sources.list.d/
sudo apt update
sudo apt install --install-recommends winehq-stable
```

- wine from Debian
```
sudo dpkg --add-architecture i386 && sudo apt update
sudo apt install wine wine32 wine64 libwine libwine:i386 fonts-wine wine-binfmt
```
###### Mono & Gecko
```
/usr/share/wine/									# put mono and gecko here
```
	- [Mono](https://wiki.winehq.org/Mono#Installing "Mono")
	- [Gecko](https://wiki.winehq.org/Gecko "Gecko")

##### Install Nvidia Drivers
```
sudo apt install nvidia-detect
nvidia-detect
sudo apt install linux-headers-amd64 nvidia-driver firmware-misc-nonfree 
sudo dpkg --add-architecture i386 && sudo apt update
sudo apt install nvidia-driver-libs:i386
sudo reboot
nvidia-smi
watch nvidia-smi
```

##### Debian Gaming
- [Install Lutris](https://lutris.net/downloads/ "Lutris")
- Steam
	`sudo apt install steam`

##### Cloudflare WARP
- [Download](https://pkg.cloudflareclient.com/packages/cloudflare-warp "Download")
```
warp-cli register
warp-cli connect
warp-cli status
warp-cli disconnect
warp-cli set-license 									#backup license
```















