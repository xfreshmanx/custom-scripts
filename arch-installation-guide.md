
## SIMPLE ARCH LINUX INSTALLATION GUIDE

[Arch Wiki](https://wiki.archlinux.org/index.php/installation_guide)  
[itsfoss.com guide arch linux installation](https://itsfoss.com/install-arch-linux/)  
[averagelinuxuser.com guide arch linux installation](https://averagelinuxuser.com/a-step-by-step-arch-linux-installation-guide)  

   
    ls /sys/firmware/efi/efivars
    ping archlinux.org -c 3
    timedatectl set-ntp true
    # timedatectl status
    cfdisk
    lsblk
    nano /etc/pacman.d/mirrorlist

    ## Bangladesh
    # Server = http://mirror.xeonbd.com/archlinux/$repo/os/$archlinux
    
    # hint: nano copy [ctrl+k], nano paste[ctrl+u]
    # OR 
    # reflector -c "BD" -f 12 -l 10 -n 12 --save /etc/pacman.d/mirrorlist
    mkfs.fat -F32 /dev/boot_partition 
    mkfs.ext4 /dev/root_partition

    # mount root volume
    mount /dev/root_partition /mnt
    pacstrap /mnt base linux linux-firmware vim nano sudo
    genfstab -U /mnt >> /mnt/etc/fstab
    
    arch-chroot /mnt
    ln -sf /usr/share/zoneinfo/Asia/Dhaka /etc/localtime
    hwclock --systohc
    nano /etc/locale.gen
    # en_US.UTF-8 UTF-8
    locale-gen
    nano /etc/locale.conf
    # LANG=en_US.UTF-8
    nano /etc/hostname
    # HOSTNAME
    nano /etc/hosts
    127.0.0.1	localhost
    ::1		localhost
    127.0.1.1	HOSTNAME.localdomain	HOSTNAME
    mkinitcpio -P
    passwd
    useradd -m -G wheel -s /bin/bash USERNAME
    passwd USERNAME
    EDITOR=nano visudo

    ## Uncomment to allow members of group wheel to execute any command
    %wheel ALL=(ALL) ALL
    
    pacman -S grub efibootmgr
    mkdir /boot/efi
    mount /dev/sda1 /boot/efi
    grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/efi
    grub-mkconfig -o /boot/grub/grub.cfg
    pacman -S xorg

## Desktop Environment

#### Gnome

    pacman -S gnome
    echo "exec gnome-session" > ~/.xinitrc
    systemctl start gdm.service
    systemctl enable gdm.service
    systemctl enable NetworkManager.service


#### XFCE

    pacman -S xfce4 lightdm lightdm-gtk-greeter
    echo "exec startxfce4" > ~/.xinitrc
    systemctl enable lightdm
    
#### KDE Plasma

    pacman -S plasma sddm
    echo "exec startkde" > ~/.xinitrc
    systemctl enable sddm

#### Cinnamon

    echo "exec cinnamon-session" > ~/.xinitrc
    sudo pacman -S cinnamon mdm
    systemctl enable mdm

#### Mate

    echo "exec mate-session" > ~/.xinitrc
    sudo pacman -S mate lightdm lightdm-gtk-greeter
    systemctl enable lightdm
#### Budgie
```
echo "export XDG_CURRENT_DESKTOP=Budgie:GNOME" > ~/.xinitrc
echo "exec budgie-desktop" >> ~/.xinitrc
sudo pacman -S budgie-desktop lightdm lightdm-gtk-greeter
systemctl enable lightdm
```
#### Openbox
```
echo "exec openbox-session" > ~/.xinitrc
sudo pacman -S openbox lightdm lightdm-gtk-greeter
systemctl enable lightdm
```
#### i3
```
echo "exec i3"  > ~/.xinitrc
pacman -S i3 rxvt-unicode dmenu
```
#### Awesome
```
echo "exec awesome"  > ~/.xinitrc
sudo pacman -S awesome
```
**Deepin**
```
echo "exec startdde"  > ~/.xinitrc
sudo pacman -S deepin
# Also, edit the file `/etc/lightdm/lightdm.conf` to have this line:

greeter-session=lightdm-deepin-greeter
```
**LXDE**
```
echo "exec startlxde"  > ~/.xinitrc
sudo pacman -S lxdm-gtk3 lxdm
```

### Start GUI
To test whether your graphical environment works, run:
```
startx
```

### FOR KVM
[Tutorial](https://forum.proxmox.com/threads/getting-qemu-agent-to-start-at-boot.70380/https://forum.proxmox.com/threads/getting-qemu-agent-to-start-at-boot.70380/)  https://forum.proxmox.com/threads/getting-qemu-agent-to-start-at-boot.70380/
    sudo pacman -S qemu-guest-agent
    qemu-ga -D >> /etc/qemu/qemu-ga.conf































