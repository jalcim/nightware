all:
	nasm -f bin -o boot_night boot_night.s
	nasm -f bin -o nightware nightware.s
	cat boot_night nightware /dev/zero | dd of=floppyA bs=512 count=2880
	qemu-system-x86_64 -boot a -fda floppyA
