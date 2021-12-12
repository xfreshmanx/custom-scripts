#### Fedora Silverblue/Kinoite Setup Guide

Check system update and upgrade
```
rpm-ostree status
rpm-ostree upgrade --check
rpm-ostree upgrade
```
reboot to updated system.

add the Flathub repository. add the Fedora Flatpaks repository (built in Fedora). add flathub beta
```
flatpak update
flatpak update --appstream
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --if-not-exists flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo
flatpak remote-add --if-not-exists fedora oci+https://registry.fedoraproject.org
flatpak remote-add --if-not-exists kdeapps --from https://distribute.kde.org/kdeapps.flatpakrepo
```
reboot to integrate flatpak.

flatpak apps examples:
```
flatpak install org.codeblocks.codeblocks
flatpak install flathub org.kde.elisa
flatpak install flathub org.kde.kdenlive
flatpak install flathub org.kde.haruna
flatpak install flathub org.gimp.GIMP
flatpak install flathub com.vscodium.codium
flatpak install flathub org.munadi.Munadi
flatpak install flathub com.github.tchx84.Flatseal
flatpak install flathub io.mpv.Mpv
flatpak install flathub com.dropbox.Client
flatpak install flathub net.cozic.joplin_desktop
flatpak install flathub org.keepassxc.KeePassXC
flatpak install flathub com.github.unrud.VideoDownloader
flatpak install flathub org.qbittorrent.qBittorrent
flatpak install flathub org.gabmus.hydrapaper
flatpak install flathub org.chromium.Chromium
flatpak install flathub org.mozilla.Thunderbird
flatpak install flathub io.lbry.lbry-app
flatpak install flathub com.github.micahflee.torbrowser-launcher
flatpak install flathub org.telegram.desktop
flatpak install flathub com.adobe.Flash-Player-Projector
flatpak install flathub de.haeckerfelix.Shortwave
flatpak install flathub com.discordapp.Discord
flatpak install flathub com.endlessm.photos
flatpak install flathub org.libreoffice.LibreOffice
flatpak install flathub com.dropbox.Client
flatpak install flathub io.gitlab.librewolf-community
flatpak install flathub net.jami.Jami
```
beta
```
flatpak install com.microsoft.Edge
flatpak install com.google.Chrome
```

**Upgrading between major versions**
```
ostree remote refs fedora
rpm-ostree rebase fedora:fedora/35/x86_64/silverblue
or
rpm-ostree rebase fedora:fedora/35/x86_64/kinoite
(Change release number. ==> 35)
```
**rollback**
```
rpm-ostree rollback
```
**toolbox**
```
toolbox create
toolbox enter
podman stop $container_name
```

Nvidia Drivers
```
sudo rpm-ostree install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```
reboot
```
sudo rpm-ostree install akmod-nvidia xorg-x11-drv-nvidia
sudo rpm-ostree install akmod-nvidia xorg-x11-drv-nvidia-cuda #optional if using nvidia-smi or cuda
sudo rpm-ostree kargs --append=rd.driver.blacklist=nouveau --append=modprobe.blacklist=nouveau --append=nvidia-drm.modeset=1 # this might not be needed at some point when silverblue will support the standard way to specify this.
```

**Gaming**
```
flatpak install flathub org.freedesktop.Platform.VulkanLayer.MangoHud
flatpak install flathub-beta net.lutris.Lutris//beta
flatpak install flathub org.gnome.Platform.Compat.i386 org.freedesktop.Platform.GL32.default org.freedesktop.Platform.GL.default
flatpak install flathub io.github.arunsivaramanneo.GPUViewer
flatpak install org.srb2.SRB2Kart
```















