#!/usr/bin/env bash

if [ -z "$1" ]; then
	echo "Usage: $0 raw.file"
	exit 1
fi

SIZE=$(stat -f "%08Xz" $1)

cat dummy.hdr $1 >$1.elf
echo "${SIZE:6:2}${SIZE:4:2}${SIZE:2:2}${SIZE:0:2}" | xxd -r -p | dd bs=1 count=4 of=$1.elf conv=notrunc seek=$((0x98))
