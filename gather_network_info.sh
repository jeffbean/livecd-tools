#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "Need to run as superuser" 1>&2
    exit 1
fi

VIRT_PLATFORM=$(virt-what)

if [ -n ${VIRT_PLATFORM} ]; then
    echo "Not a VM, we can move forward"
    IDENTIFIER=$(dmidecode -s system-serial-number)
    echo "Found serial nubmer: [${IDENTIFIER}]"
else
    echo "This is a VM, we dont want this network info for now. but we will move forward"
    IDENTIFIER=$VIRT_PLATFORM
    echo "Identifer will be the viratual platform name: [${IDENTIFIER}]"
fi

DMIDECODE_OUTPUT_FILE=/root/dmidecode-${IDENTIFIER}.xml

echo "Gathering Network information.."
lshw -xml > ${DMIDECODE_OUTPUT_FILE}
echo "Finished Gathering Network information to [${DMIDECODE_OUTPUT_FILE}]"

