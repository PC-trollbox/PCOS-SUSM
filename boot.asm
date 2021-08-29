[org 0x7c00]
jmp boot
pcos:
	db "PCOS in Assembly", 0
newlinecommandthing:
	db 10, 13, "> ", 0
printstr:
	mov ah, 0eh
loop:
	lodsb 
	cmp al, 0 
	je end 
	int 10h 
	jmp loop 
end:
	ret 
boot:
	mov si, pcos 
	call printstr
	mov si, newlinecommandthing
	call printstr
	jmp shell
shell:
	mov ah, 0
	int 16h
	cmp al, 0Dh
	je newlinestuff
	mov ah, 0eh
	int 10h
	mov al, 0
	jmp shell
newlinestuff:
	mov si, newlinecommandthing
	call printstr
	jmp shell
TIMES 510 - ($-$$) db 0
dw 0aa55h