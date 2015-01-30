#!/bin/bash

if grep -qs 'edit/dev dev' /proc/mounts; then
    echo "It's mounted."
else
    echo "It's not mounted."
    sudo mount --bind /dev/ edit/dev
fi
sudo chroot edit /bin/bash -c "mount -t proc none /proc"
sudo chroot edit /bin/bash -c "mount -t sysfs none /sys"

sudo chroot edit /bin/bash -c "mount -t devpts none /dev/pts"
sudo chroot edit /bin/bash -c "export HOME=/root && export LC_ALL=C"
sudo chroot edit

#echo "remove bash history and tmp files"
#sudo chroot edit /bin/bash -c "rm -rf /tmp/* ~/.bash_history"
#echo "remove machine id from installs"
#sudo chroot edit /bin/bash -c "rm /var/lib/dbus/machine-id"

#./umount_chroot.sh
