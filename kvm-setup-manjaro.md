https://wiki.archlinux.org/index.php/libvirt
https://wiki.manjaro.org/index.php/Virt-manager

$ sudo pacman -S virt-manager qemu vde2 ebtables dnsmasq bridge-utils openbsd-netcat  
$ sudo systemctl enable libvirtd.service  
$ sudo systemctl start libvirtd.service  

Change location of storage  
https://dwaves.de/2015/07/20/linux-kvm-how-to-change-default-location-where-libvirt-vm-images-are-saved/

$ virsh pool-dumpxml default > pool.xml 

Open this XML file with a text editor, and change <path> element from /var/lib/libvirt/images to a new location.  
Remove the current default pool.  
  
$ virsh pool-destroy default  
Pool default destroyed 

Now create a new storage pool based on the updated XML file.  
$ virsh pool-create pool.xml  

Pool default created from pool.xml  
At this point, a default pool has been changed to a new location, and is ready for use.  
