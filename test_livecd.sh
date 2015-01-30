#!/bin/bash

VM_NAME='livecd-test-tmp'
#vboxmanage createvm --name ${VM_NAME} --ostype "Ubuntu_64" --register
#vboxmanage storagectl ${VM_NAME} --name "IDE Controller" --add ide
#vboxmanage storageattach $VM_NAME --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium ubuntu-14.04.1-mini-amd64-custom.iso
#vboxmanage startvm ${VM_NAME}

#vboxmanage controlvm ${VM_NAME} poweroff
#vboxmanage unregistervm ${VM_NAME} --delete

qemu-system-x86_64 -cdrom ubuntu-14.04.1-mini-amd64-custom.iso -smp 2 -m 2048
