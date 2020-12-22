### mount & umount iso
MOUNT:

`
sudo mkdir -p /run/media/"$(whoami)"/iso </br>
sudo mount "$FILE" /run/media/"$(whoami)"/iso </br>
`

UMOUNT:

`
sudo umount /run/media/pulsar/iso </br>
sudo rmdir /run/media/"$(whoami)"/iso </br>
`
