https://wiki.archlinux.org/index.php/libvirt
https://wiki.manjaro.org/index.php/Virt-manager

$ sudo pacman -S virt-manager qemu vde2 ebtables dnsmasq bridge-utils openbsd-netcat  
$ sudo systemctl enable libvirtd.service  
$ sudo systemctl start libvirtd.service  

Change location of storage  
https://serverfault.com/questions/840519/how-to-change-the-default-storage-pool-from-libvirt


