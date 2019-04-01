.code16

.global _bootstart

.equ BOOTSEG, 0x07c0

.text

ljmp $BOOTSEG, $_bootstart

_bootstart:
	#Get cursor position
	#int 10,3
	mov $0x03,%ah
	int $0x10
	
	mov $BOOTSEG,%ax
	mov %ax,%es
	mov $_string,%bp
	mov $0x1301,%ax
	mov $0x0007,%bx
	mov $0x000b,%cx
	
	int $0x10
loop: jmp loop	


_string:
	.ascii "Hello World"

.= 510

signature:
	.word 0xaa55 
