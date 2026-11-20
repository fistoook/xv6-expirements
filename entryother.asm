
bootblockother.o:     file format elf32-i386


Disassembly of section .text:

00007000 <start>:
    7000:	fa                   	cli
    7001:	31 c0                	xor    %eax,%eax
    7003:	8e d8                	mov    %eax,%ds
    7005:	8e c0                	mov    %eax,%es
    7007:	8e d0                	mov    %eax,%ss
    7009:	0f 01 16             	lgdtl  (%esi)
    700c:	84 70 0f             	test   %dh,0xf(%eax)
    700f:	20 c0                	and    %al,%al
    7011:	66 83 c8 01          	or     $0x1,%ax
    7015:	0f 22 c0             	mov    %eax,%cr0
    7018:	66 ea 20 70 00 00    	ljmpw  $0x0,$0x7020
    701e:	08 00                	or     %al,(%eax)

00007020 <start32>:
    7020:	66 b8 10 00          	mov    $0x10,%ax
    7024:	8e d8                	mov    %eax,%ds
    7026:	8e c0                	mov    %eax,%es
    7028:	8e d0                	mov    %eax,%ss
    702a:	66 b8 00 00          	mov    $0x0,%ax
    702e:	8e e0                	mov    %eax,%fs
    7030:	8e e8                	mov    %eax,%gs
    7032:	0f 20 e0             	mov    %cr4,%eax
    7035:	83 c8 10             	or     $0x10,%eax
    7038:	0f 22 e0             	mov    %eax,%cr4
    703b:	a1 f4 6f 00 00       	mov    0x6ff4,%eax
    7040:	0f 22 d8             	mov    %eax,%cr3
    7043:	0f 20 c0             	mov    %cr0,%eax
    7046:	0d 01 00 01 80       	or     $0x80010001,%eax
    704b:	0f 22 c0             	mov    %eax,%cr0
    704e:	8b 25 fc 6f 00 00    	mov    0x6ffc,%esp
    7054:	ff 15 f8 6f 00 00    	call   *0x6ff8
    705a:	66 b8 00 8a          	mov    $0x8a00,%ax
    705e:	66 89 c2             	mov    %ax,%dx
    7061:	66 ef                	out    %ax,(%dx)
    7063:	66 b8 e0 8a          	mov    $0x8ae0,%ax
    7067:	66 ef                	out    %ax,(%dx)

00007069 <spin>:
    7069:	eb fe                	jmp    7069 <spin>
    706b:	90                   	nop

0000706c <gdt>:
	...
    7074:	ff                   	(bad)
    7075:	ff 00                	incl   (%eax)
    7077:	00 00                	add    %al,(%eax)
    7079:	9a cf 00 ff ff 00 00 	lcall  $0x0,$0xffff00cf
    7080:	00                   	.byte 0
    7081:	92                   	xchg   %eax,%edx
    7082:	cf                   	iret
	...

00007084 <gdtdesc>:
    7084:	17                   	pop    %ss
    7085:	00 6c 70 00          	add    %ch,0x0(%eax,%esi,2)
	...
