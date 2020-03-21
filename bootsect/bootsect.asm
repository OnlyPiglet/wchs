org 07c00h ;bios 自检后 会查找0面 0磁道 1扇区 以55aa结尾的 512 字节的 bootloader，并将 磁盘内容 加载到内存 0000:7c00h 位置，并将cpu控制权 从bios 转到 07c00h 位置 此行告诉编译器 这段程序会被加载到0x7c00处
mov ax,cs
mov ds,ax
mov es,ax
;cs ds es 内容相同
call ClearDis
call DisProductor
jmp $
DisProductor:
	mov ax,BootMsg
	mov bp,ax
	mov cx,27
	mov ax,01301h
	mov bx,000fh
	mov dl,0
	int 10h
	ret
ClearDis:
	mov ah,15
	int 10h
	mov ah,0
	int 10h
	;mov
	;mov 
	;int 1013h
	ret
BootMsg:	db "A TOUR OF OPERATION SYSTEM!"
times 510-($-$$) db 0
dw 0xaa55
