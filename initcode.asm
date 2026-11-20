
initcode.o:     file format elf32-i386


Disassembly of section .text:

00000000 <start>:
   0:	68 24 00 00 00       	push   $0x24
   5:	68 1c 00 00 00       	push   $0x1c
   a:	6a 00                	push   $0x0
   c:	b8 07 00 00 00       	mov    $0x7,%eax
  11:	cd 40                	int    $0x40

00000013 <exit>:
  13:	b8 02 00 00 00       	mov    $0x2,%eax
  18:	cd 40                	int    $0x40
  1a:	eb f7                	jmp    13 <exit>

0000001c <init>:
  1c:	2f                   	das
  1d:	69 6e 69 74 00 00 90 	imul   $0x90000074,0x69(%esi),%ebp

00000024 <argv>:
  24:	1c 00                	sbb    $0x0,%al
  26:	00 00                	add    %al,(%eax)
  28:	00 00                	add    %al,(%eax)
	...
