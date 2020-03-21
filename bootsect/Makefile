.PHONY: clean bootsect.bin bootsect.img run
clean:
	@rm -f *.bin
	@rm -f *.log
bootsect.bin:
	@nasm bootsect.asm -o bootsect.bin
bootsect.img: bootsect.bin
	@dd if=bootsect.bin of=bootsect.img bs=512 count=1 conv=notrunc
run: bootsect.img bootsect.bin
	@bochs -f bochsrc 
