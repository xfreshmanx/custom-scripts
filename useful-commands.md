
Mount ISO/IMG -
```
$ mount -o loop /ISOLATION.iso /MOUNTLOCATION
```
Umount ISO/IMG -
```
$ udisksctl loop-delete -b /dev/loop1
```
Check which gpu active
```
$ glxinfo | grep render
$ prime-run glxinfo | grep render
```
Fix KDE shortcuts
```   
$ balooctl purge
```
Reload Application launcher in KDE Plasma
```
sudo update-desktop-database
```
