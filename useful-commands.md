
Mount ISO/IMG -
```
mount -o loop /ISOLATION.iso /MOUNTLOCATION
```
Umount ISO/IMG -
```
udisksctl loop-delete -b /dev/loop1
```
Check which gpu active
```
glxinfo | grep render
prime-run glxinfo | grep render
```
Fix KDE shortcuts
```   
balooctl purge
```
Reload Application launcher in KDE Plasma
```
sudo update-desktop-database
```
list local package without source/origin. Use synaptic or 
```
apt list --installed | grep -F "$(gettext 'apt' '[installed,local]')"
```
check / size
```
ncdu / --exclude /home --exclude /media --exclude /storage --exclude /run/timeshift
```
