### mount & umount iso
MOUNT:
`
sudo mkdir -p /run/media/"$(whoami)"/iso
sudo mount "$FILE" /run/media/"$(whoami)"/iso
`

UMOUNT:
`
sudo umount /run/media/pulsar/iso
sudo rmdir /run/media/"$(whoami)"/iso 
`
