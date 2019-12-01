debug:
	gdb-multiarch factorial

gcc:
	/home/starea/gcc-arm-none-eabi-*/bin/arm-none-eabi-gcc --specs=rdimon.specs -o factorial factorial.s

server:
	qemu-arm -g 1234 ./factorial