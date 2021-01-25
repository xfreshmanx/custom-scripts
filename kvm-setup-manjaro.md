
https://wiki.archlinux.org/index.php/libvirt
https://wiki.manjaro.org/index.php/Virt-manager

    $ sudo pacman -S virt-manager qemu vde2 ebtables dnsmasq bridge-utils openbsd-netcat edk2-ovmf  
    $ sudo systemctl enable libvirtd.service  
    $ sudo systemctl start libvirtd.service

  

Change location of storage  
https://serverfault.com/a/840520

*Before following the steps, be sure that you are running these commands as normal user and that your user belongs to the group `libvirtd` (on some systems `libvirt`).*

Here are the following commands which I used:

**Listing current pools:**

```
$ virsh pool-list
    
Name                 State      Autostart 
-------------------------------------------
default              active     yes 
```

**Destroying pool:**

```
$ virsh pool-destroy default
Pool default destroyed
```

**Undefine pool:**

```
$ virsh pool-undefine default
Pool default has been undefined
```

**Creating a directory to host the new pool (if it does not exist):**

```
$ sudo mkdir /media/work/kvm
```

**Defining a new pool with name "default":**

```
$ virsh pool-define-as --name default --type dir --target /media/work/kvm
Pool default defined
```

**Set pool to be started when libvirt daemons starts:**

```
$ virsh pool-autostart default
Pool default marked as autostarted
```

**Start pool:**

```
$ virsh pool-start default
Pool default started
```

**Checking pool state:**

```
$ virsh pool-list
Name                 State      Autostart 
-------------------------------------------
default              active     yes 
```

From now, when creating virtual machines, Virtual Machine Manager will inform you that the *.img file (virtual disk of your VM), will be saved at /media/work/kvm.

