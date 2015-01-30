#!/bin/bash

echo "Unmount the chroot drives"
sudo chroot edit /bin/bash -c "umount /proc || umount -lf /proc"
sudo chroot edit /bin/bash -c "umount /sys"
sudo chroot edit /bin/bash -c "umount /dev/pts"
echo "Unmount the devfs"
sudo umount edit/dev
