#!/bin/bash

sudo mkdir /mnt/Lemon
sudo qemu-nbd -c /dev/nbd0 Disks/Lemon.vhd

if sudo [ ! -b /dev/nbd0p2 ]; then
	sleep 0.5 # Wait half a second if does not exist
fi

if sudo [ ! -b /dev/nbd0p2 ]; then
	>&2 echo "error mounting disk image"
	exit 1
fi

sudo mount /dev/nbd0p2 /mnt/Lemon
