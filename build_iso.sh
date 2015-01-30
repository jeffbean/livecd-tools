#!/bin/bash
rm -f ../ubuntu-14.04.1-mini-amd64-custom.iso

./umount_chroot.sh

echo "Changing write permissions on manifest"
sudo chmod a+w extract-cd/casper/filesystem.manifest

echo "Adding pkg info to manifest"
sudo chroot edit dpkg-query -W --showformat='${Package} ${Version}\n' > extract-cd/casper/filesystem.manifest
echo "copy manifest to desktop manifest"
sudo cp extract-cd/casper/filesystem.manifest extract-cd/casper/filesystem.manifest-desktop
sudo sed -i '/ubiquity/d' extract-cd/casper/filesystem.manifest-desktop
sudo sed -i '/casper/d' extract-cd/casper/filesystem.manifest-desktop

echo "remove old squashfs"
sudo rm extract-cd/casper/filesystem.squashfs

echo "make new squashfs"
sudo mksquashfs edit extract-cd/casper/filesystem.squashfs #-comp xz -e edit/boot

echo "change filesystem size file"
sudo chmod a+w extract-cd/casper/filesystem.size
printf $(sudo du -sx --block-size=1 edit | cut -f1) > extract-cd/casper/filesystem.size


echo "adding md5 text file"
cd extract-cd
sudo rm md5sum.txt
find -type f -print0 | sudo xargs -0 md5sum | grep -v isolinux/boot.cat | sudo tee md5sum.txt

echo "make the iso"
sudo mkisofs -D -r -V "$IMAGE_NAME" -cache-inodes -J -l -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -o ../ubuntu-14.04.1-mini-amd64-custom.iso .

