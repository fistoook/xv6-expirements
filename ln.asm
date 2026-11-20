
_ln:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
   f:	8b 59 04             	mov    0x4(%ecx),%ebx
  12:	83 39 03             	cmpl   $0x3,(%ecx)
  15:	74 14                	je     2b <main+0x2b>
  17:	83 ec 08             	sub    $0x8,%esp
  1a:	68 5c 06 00 00       	push   $0x65c
  1f:	6a 02                	push   $0x2
  21:	e8 3e 03 00 00       	call   364 <printf>
  26:	e8 f9 01 00 00       	call   224 <exit>
  2b:	83 ec 08             	sub    $0x8,%esp
  2e:	ff 73 08             	push   0x8(%ebx)
  31:	ff 73 04             	push   0x4(%ebx)
  34:	e8 4b 02 00 00       	call   284 <link>
  39:	83 c4 10             	add    $0x10,%esp
  3c:	85 c0                	test   %eax,%eax
  3e:	78 05                	js     45 <main+0x45>
  40:	e8 df 01 00 00       	call   224 <exit>
  45:	ff 73 08             	push   0x8(%ebx)
  48:	ff 73 04             	push   0x4(%ebx)
  4b:	68 6f 06 00 00       	push   $0x66f
  50:	6a 02                	push   $0x2
  52:	e8 0d 03 00 00       	call   364 <printf>
  57:	83 c4 10             	add    $0x10,%esp
  5a:	eb e4                	jmp    40 <main+0x40>

0000005c <strcpy>:
  5c:	55                   	push   %ebp
  5d:	89 e5                	mov    %esp,%ebp
  5f:	53                   	push   %ebx
  60:	8b 4d 08             	mov    0x8(%ebp),%ecx
  63:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  66:	b8 00 00 00 00       	mov    $0x0,%eax
  6b:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  6f:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  72:	83 c0 01             	add    $0x1,%eax
  75:	84 d2                	test   %dl,%dl
  77:	75 f2                	jne    6b <strcpy+0xf>
  79:	89 c8                	mov    %ecx,%eax
  7b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  7e:	c9                   	leave
  7f:	c3                   	ret

00000080 <strcmp>:
  80:	55                   	push   %ebp
  81:	89 e5                	mov    %esp,%ebp
  83:	8b 4d 08             	mov    0x8(%ebp),%ecx
  86:	8b 55 0c             	mov    0xc(%ebp),%edx
  89:	0f b6 01             	movzbl (%ecx),%eax
  8c:	84 c0                	test   %al,%al
  8e:	74 11                	je     a1 <strcmp+0x21>
  90:	38 02                	cmp    %al,(%edx)
  92:	75 0d                	jne    a1 <strcmp+0x21>
  94:	83 c1 01             	add    $0x1,%ecx
  97:	83 c2 01             	add    $0x1,%edx
  9a:	0f b6 01             	movzbl (%ecx),%eax
  9d:	84 c0                	test   %al,%al
  9f:	75 ef                	jne    90 <strcmp+0x10>
  a1:	0f b6 c0             	movzbl %al,%eax
  a4:	0f b6 12             	movzbl (%edx),%edx
  a7:	29 d0                	sub    %edx,%eax
  a9:	5d                   	pop    %ebp
  aa:	c3                   	ret

000000ab <strlen>:
  ab:	55                   	push   %ebp
  ac:	89 e5                	mov    %esp,%ebp
  ae:	8b 55 08             	mov    0x8(%ebp),%edx
  b1:	80 3a 00             	cmpb   $0x0,(%edx)
  b4:	74 14                	je     ca <strlen+0x1f>
  b6:	b8 00 00 00 00       	mov    $0x0,%eax
  bb:	83 c0 01             	add    $0x1,%eax
  be:	89 c1                	mov    %eax,%ecx
  c0:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  c4:	75 f5                	jne    bb <strlen+0x10>
  c6:	89 c8                	mov    %ecx,%eax
  c8:	5d                   	pop    %ebp
  c9:	c3                   	ret
  ca:	b9 00 00 00 00       	mov    $0x0,%ecx
  cf:	eb f5                	jmp    c6 <strlen+0x1b>

000000d1 <memset>:
  d1:	55                   	push   %ebp
  d2:	89 e5                	mov    %esp,%ebp
  d4:	57                   	push   %edi
  d5:	8b 55 08             	mov    0x8(%ebp),%edx
  d8:	89 d7                	mov    %edx,%edi
  da:	8b 4d 10             	mov    0x10(%ebp),%ecx
  dd:	8b 45 0c             	mov    0xc(%ebp),%eax
  e0:	fc                   	cld
  e1:	f3 aa                	rep stos %al,%es:(%edi)
  e3:	89 d0                	mov    %edx,%eax
  e5:	8b 7d fc             	mov    -0x4(%ebp),%edi
  e8:	c9                   	leave
  e9:	c3                   	ret

000000ea <strchr>:
  ea:	55                   	push   %ebp
  eb:	89 e5                	mov    %esp,%ebp
  ed:	8b 45 08             	mov    0x8(%ebp),%eax
  f0:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  f4:	0f b6 10             	movzbl (%eax),%edx
  f7:	84 d2                	test   %dl,%dl
  f9:	74 15                	je     110 <strchr+0x26>
  fb:	38 d1                	cmp    %dl,%cl
  fd:	74 0f                	je     10e <strchr+0x24>
  ff:	83 c0 01             	add    $0x1,%eax
 102:	0f b6 10             	movzbl (%eax),%edx
 105:	84 d2                	test   %dl,%dl
 107:	75 f2                	jne    fb <strchr+0x11>
 109:	b8 00 00 00 00       	mov    $0x0,%eax
 10e:	5d                   	pop    %ebp
 10f:	c3                   	ret
 110:	b8 00 00 00 00       	mov    $0x0,%eax
 115:	eb f7                	jmp    10e <strchr+0x24>

00000117 <gets>:
 117:	55                   	push   %ebp
 118:	89 e5                	mov    %esp,%ebp
 11a:	57                   	push   %edi
 11b:	56                   	push   %esi
 11c:	53                   	push   %ebx
 11d:	83 ec 2c             	sub    $0x2c,%esp
 120:	8b 75 08             	mov    0x8(%ebp),%esi
 123:	bb 00 00 00 00       	mov    $0x0,%ebx
 128:	8d 7d e7             	lea    -0x19(%ebp),%edi
 12b:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 12e:	83 c3 01             	add    $0x1,%ebx
 131:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 134:	7d 27                	jge    15d <gets+0x46>
 136:	83 ec 04             	sub    $0x4,%esp
 139:	6a 01                	push   $0x1
 13b:	57                   	push   %edi
 13c:	6a 00                	push   $0x0
 13e:	e8 f9 00 00 00       	call   23c <read>
 143:	83 c4 10             	add    $0x10,%esp
 146:	85 c0                	test   %eax,%eax
 148:	7e 13                	jle    15d <gets+0x46>
 14a:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 14e:	88 44 1e ff          	mov    %al,-0x1(%esi,%ebx,1)
 152:	3c 0a                	cmp    $0xa,%al
 154:	74 04                	je     15a <gets+0x43>
 156:	3c 0d                	cmp    $0xd,%al
 158:	75 d1                	jne    12b <gets+0x14>
 15a:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 15d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 160:	c6 04 06 00          	movb   $0x0,(%esi,%eax,1)
 164:	89 f0                	mov    %esi,%eax
 166:	8d 65 f4             	lea    -0xc(%ebp),%esp
 169:	5b                   	pop    %ebx
 16a:	5e                   	pop    %esi
 16b:	5f                   	pop    %edi
 16c:	5d                   	pop    %ebp
 16d:	c3                   	ret

0000016e <stat>:
 16e:	55                   	push   %ebp
 16f:	89 e5                	mov    %esp,%ebp
 171:	56                   	push   %esi
 172:	53                   	push   %ebx
 173:	83 ec 08             	sub    $0x8,%esp
 176:	6a 00                	push   $0x0
 178:	ff 75 08             	push   0x8(%ebp)
 17b:	e8 e4 00 00 00       	call   264 <open>
 180:	83 c4 10             	add    $0x10,%esp
 183:	85 c0                	test   %eax,%eax
 185:	78 24                	js     1ab <stat+0x3d>
 187:	89 c3                	mov    %eax,%ebx
 189:	83 ec 08             	sub    $0x8,%esp
 18c:	ff 75 0c             	push   0xc(%ebp)
 18f:	50                   	push   %eax
 190:	e8 e7 00 00 00       	call   27c <fstat>
 195:	89 c6                	mov    %eax,%esi
 197:	89 1c 24             	mov    %ebx,(%esp)
 19a:	e8 ad 00 00 00       	call   24c <close>
 19f:	83 c4 10             	add    $0x10,%esp
 1a2:	89 f0                	mov    %esi,%eax
 1a4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1a7:	5b                   	pop    %ebx
 1a8:	5e                   	pop    %esi
 1a9:	5d                   	pop    %ebp
 1aa:	c3                   	ret
 1ab:	be ff ff ff ff       	mov    $0xffffffff,%esi
 1b0:	eb f0                	jmp    1a2 <stat+0x34>

000001b2 <atoi>:
 1b2:	55                   	push   %ebp
 1b3:	89 e5                	mov    %esp,%ebp
 1b5:	53                   	push   %ebx
 1b6:	8b 55 08             	mov    0x8(%ebp),%edx
 1b9:	0f b6 02             	movzbl (%edx),%eax
 1bc:	8d 48 d0             	lea    -0x30(%eax),%ecx
 1bf:	80 f9 09             	cmp    $0x9,%cl
 1c2:	77 24                	ja     1e8 <atoi+0x36>
 1c4:	b9 00 00 00 00       	mov    $0x0,%ecx
 1c9:	83 c2 01             	add    $0x1,%edx
 1cc:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 1cf:	0f be c0             	movsbl %al,%eax
 1d2:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
 1d6:	0f b6 02             	movzbl (%edx),%eax
 1d9:	8d 58 d0             	lea    -0x30(%eax),%ebx
 1dc:	80 fb 09             	cmp    $0x9,%bl
 1df:	76 e8                	jbe    1c9 <atoi+0x17>
 1e1:	89 c8                	mov    %ecx,%eax
 1e3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1e6:	c9                   	leave
 1e7:	c3                   	ret
 1e8:	b9 00 00 00 00       	mov    $0x0,%ecx
 1ed:	eb f2                	jmp    1e1 <atoi+0x2f>

000001ef <memmove>:
 1ef:	55                   	push   %ebp
 1f0:	89 e5                	mov    %esp,%ebp
 1f2:	56                   	push   %esi
 1f3:	53                   	push   %ebx
 1f4:	8b 75 08             	mov    0x8(%ebp),%esi
 1f7:	8b 55 0c             	mov    0xc(%ebp),%edx
 1fa:	8b 5d 10             	mov    0x10(%ebp),%ebx
 1fd:	85 db                	test   %ebx,%ebx
 1ff:	7e 15                	jle    216 <memmove+0x27>
 201:	01 f3                	add    %esi,%ebx
 203:	89 f0                	mov    %esi,%eax
 205:	83 c2 01             	add    $0x1,%edx
 208:	83 c0 01             	add    $0x1,%eax
 20b:	0f b6 4a ff          	movzbl -0x1(%edx),%ecx
 20f:	88 48 ff             	mov    %cl,-0x1(%eax)
 212:	39 c3                	cmp    %eax,%ebx
 214:	75 ef                	jne    205 <memmove+0x16>
 216:	89 f0                	mov    %esi,%eax
 218:	5b                   	pop    %ebx
 219:	5e                   	pop    %esi
 21a:	5d                   	pop    %ebp
 21b:	c3                   	ret

0000021c <fork>:
  name: \
    movl $1, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALLFORK(fork) //instead of SYSCALL(fork) !!!
 21c:	b8 01 00 00 00       	mov    $0x1,%eax
 221:	cd 40                	int    $0x40
 223:	c3                   	ret

00000224 <exit>:
//SYSCALL(fork)
SYSCALL(exit)
 224:	b8 02 00 00 00       	mov    $0x2,%eax
 229:	cd 40                	int    $0x40
 22b:	c3                   	ret

0000022c <wait>:
SYSCALL(wait)
 22c:	b8 03 00 00 00       	mov    $0x3,%eax
 231:	cd 40                	int    $0x40
 233:	c3                   	ret

00000234 <pipe>:
SYSCALL(pipe)
 234:	b8 04 00 00 00       	mov    $0x4,%eax
 239:	cd 40                	int    $0x40
 23b:	c3                   	ret

0000023c <read>:
SYSCALL(read)
 23c:	b8 05 00 00 00       	mov    $0x5,%eax
 241:	cd 40                	int    $0x40
 243:	c3                   	ret

00000244 <write>:
SYSCALL(write)
 244:	b8 10 00 00 00       	mov    $0x10,%eax
 249:	cd 40                	int    $0x40
 24b:	c3                   	ret

0000024c <close>:
SYSCALL(close)
 24c:	b8 15 00 00 00       	mov    $0x15,%eax
 251:	cd 40                	int    $0x40
 253:	c3                   	ret

00000254 <kill>:
SYSCALL(kill)
 254:	b8 06 00 00 00       	mov    $0x6,%eax
 259:	cd 40                	int    $0x40
 25b:	c3                   	ret

0000025c <exec>:
SYSCALL(exec)
 25c:	b8 07 00 00 00       	mov    $0x7,%eax
 261:	cd 40                	int    $0x40
 263:	c3                   	ret

00000264 <open>:
SYSCALL(open)
 264:	b8 0f 00 00 00       	mov    $0xf,%eax
 269:	cd 40                	int    $0x40
 26b:	c3                   	ret

0000026c <mknod>:
SYSCALL(mknod)
 26c:	b8 11 00 00 00       	mov    $0x11,%eax
 271:	cd 40                	int    $0x40
 273:	c3                   	ret

00000274 <unlink>:
SYSCALL(unlink)
 274:	b8 12 00 00 00       	mov    $0x12,%eax
 279:	cd 40                	int    $0x40
 27b:	c3                   	ret

0000027c <fstat>:
SYSCALL(fstat)
 27c:	b8 08 00 00 00       	mov    $0x8,%eax
 281:	cd 40                	int    $0x40
 283:	c3                   	ret

00000284 <link>:
SYSCALL(link)
 284:	b8 13 00 00 00       	mov    $0x13,%eax
 289:	cd 40                	int    $0x40
 28b:	c3                   	ret

0000028c <mkdir>:
SYSCALL(mkdir)
 28c:	b8 14 00 00 00       	mov    $0x14,%eax
 291:	cd 40                	int    $0x40
 293:	c3                   	ret

00000294 <chdir>:
SYSCALL(chdir)
 294:	b8 09 00 00 00       	mov    $0x9,%eax
 299:	cd 40                	int    $0x40
 29b:	c3                   	ret

0000029c <dup>:
SYSCALL(dup)
 29c:	b8 0a 00 00 00       	mov    $0xa,%eax
 2a1:	cd 40                	int    $0x40
 2a3:	c3                   	ret

000002a4 <getpid>:
SYSCALL(getpid)
 2a4:	b8 0b 00 00 00       	mov    $0xb,%eax
 2a9:	cd 40                	int    $0x40
 2ab:	c3                   	ret

000002ac <sbrk>:
SYSCALL(sbrk)
 2ac:	b8 0c 00 00 00       	mov    $0xc,%eax
 2b1:	cd 40                	int    $0x40
 2b3:	c3                   	ret

000002b4 <sleep>:
SYSCALL(sleep)
 2b4:	b8 0d 00 00 00       	mov    $0xd,%eax
 2b9:	cd 40                	int    $0x40
 2bb:	c3                   	ret

000002bc <uptime>:
SYSCALL(uptime)
 2bc:	b8 0e 00 00 00       	mov    $0xe,%eax
 2c1:	cd 40                	int    $0x40
 2c3:	c3                   	ret

000002c4 <ps>:
SYSCALL(ps)
 2c4:	b8 16 00 00 00       	mov    $0x16,%eax
 2c9:	cd 40                	int    $0x40
 2cb:	c3                   	ret

000002cc <printint>:
 2cc:	55                   	push   %ebp
 2cd:	89 e5                	mov    %esp,%ebp
 2cf:	57                   	push   %edi
 2d0:	56                   	push   %esi
 2d1:	53                   	push   %ebx
 2d2:	83 ec 3c             	sub    $0x3c,%esp
 2d5:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 2d8:	89 ce                	mov    %ecx,%esi
 2da:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 2de:	74 79                	je     359 <printint+0x8d>
 2e0:	85 d2                	test   %edx,%edx
 2e2:	79 75                	jns    359 <printint+0x8d>
 2e4:	89 d1                	mov    %edx,%ecx
 2e6:	f7 d9                	neg    %ecx
 2e8:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
 2ef:	bb 00 00 00 00       	mov    $0x0,%ebx
 2f4:	89 df                	mov    %ebx,%edi
 2f6:	83 c3 01             	add    $0x1,%ebx
 2f9:	89 c8                	mov    %ecx,%eax
 2fb:	ba 00 00 00 00       	mov    $0x0,%edx
 300:	f7 f6                	div    %esi
 302:	0f b6 92 e4 06 00 00 	movzbl 0x6e4(%edx),%edx
 309:	88 54 1d d7          	mov    %dl,-0x29(%ebp,%ebx,1)
 30d:	89 ca                	mov    %ecx,%edx
 30f:	89 c1                	mov    %eax,%ecx
 311:	39 f2                	cmp    %esi,%edx
 313:	73 df                	jae    2f4 <printint+0x28>
 315:	83 7d c0 00          	cmpl   $0x0,-0x40(%ebp)
 319:	74 08                	je     323 <printint+0x57>
 31b:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 320:	8d 5f 02             	lea    0x2(%edi),%ebx
 323:	85 db                	test   %ebx,%ebx
 325:	7e 2a                	jle    351 <printint+0x85>
 327:	8d 75 d8             	lea    -0x28(%ebp),%esi
 32a:	8d 5c 1d d7          	lea    -0x29(%ebp,%ebx,1),%ebx
 32e:	8d 7d d7             	lea    -0x29(%ebp),%edi
 331:	0f b6 03             	movzbl (%ebx),%eax
 334:	88 45 d7             	mov    %al,-0x29(%ebp)
 337:	83 ec 04             	sub    $0x4,%esp
 33a:	6a 01                	push   $0x1
 33c:	57                   	push   %edi
 33d:	ff 75 c4             	push   -0x3c(%ebp)
 340:	e8 ff fe ff ff       	call   244 <write>
 345:	89 d8                	mov    %ebx,%eax
 347:	83 eb 01             	sub    $0x1,%ebx
 34a:	83 c4 10             	add    $0x10,%esp
 34d:	39 f0                	cmp    %esi,%eax
 34f:	75 e0                	jne    331 <printint+0x65>
 351:	8d 65 f4             	lea    -0xc(%ebp),%esp
 354:	5b                   	pop    %ebx
 355:	5e                   	pop    %esi
 356:	5f                   	pop    %edi
 357:	5d                   	pop    %ebp
 358:	c3                   	ret
 359:	89 d1                	mov    %edx,%ecx
 35b:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
 362:	eb 8b                	jmp    2ef <printint+0x23>

00000364 <printf>:
 364:	55                   	push   %ebp
 365:	89 e5                	mov    %esp,%ebp
 367:	57                   	push   %edi
 368:	56                   	push   %esi
 369:	53                   	push   %ebx
 36a:	83 ec 2c             	sub    $0x2c,%esp
 36d:	8b 75 0c             	mov    0xc(%ebp),%esi
 370:	0f b6 1e             	movzbl (%esi),%ebx
 373:	84 db                	test   %bl,%bl
 375:	0f 84 9e 01 00 00    	je     519 <printf+0x1b5>
 37b:	83 c6 01             	add    $0x1,%esi
 37e:	8d 45 10             	lea    0x10(%ebp),%eax
 381:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 384:	bf 00 00 00 00       	mov    $0x0,%edi
 389:	eb 2d                	jmp    3b8 <printf+0x54>
 38b:	88 5d e7             	mov    %bl,-0x19(%ebp)
 38e:	83 ec 04             	sub    $0x4,%esp
 391:	6a 01                	push   $0x1
 393:	8d 45 e7             	lea    -0x19(%ebp),%eax
 396:	50                   	push   %eax
 397:	ff 75 08             	push   0x8(%ebp)
 39a:	e8 a5 fe ff ff       	call   244 <write>
 39f:	83 c4 10             	add    $0x10,%esp
 3a2:	eb 05                	jmp    3a9 <printf+0x45>
 3a4:	83 ff 25             	cmp    $0x25,%edi
 3a7:	74 1f                	je     3c8 <printf+0x64>
 3a9:	83 c6 01             	add    $0x1,%esi
 3ac:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 3b0:	84 db                	test   %bl,%bl
 3b2:	0f 84 61 01 00 00    	je     519 <printf+0x1b5>
 3b8:	0f b6 c3             	movzbl %bl,%eax
 3bb:	85 ff                	test   %edi,%edi
 3bd:	75 e5                	jne    3a4 <printf+0x40>
 3bf:	83 f8 25             	cmp    $0x25,%eax
 3c2:	75 c7                	jne    38b <printf+0x27>
 3c4:	89 c7                	mov    %eax,%edi
 3c6:	eb e1                	jmp    3a9 <printf+0x45>
 3c8:	83 f8 25             	cmp    $0x25,%eax
 3cb:	0f 84 f4 00 00 00    	je     4c5 <printf+0x161>
 3d1:	8d 50 9d             	lea    -0x63(%eax),%edx
 3d4:	83 fa 15             	cmp    $0x15,%edx
 3d7:	0f 87 09 01 00 00    	ja     4e6 <printf+0x182>
 3dd:	0f 87 03 01 00 00    	ja     4e6 <printf+0x182>
 3e3:	ff 24 95 8c 06 00 00 	jmp    *0x68c(,%edx,4)
 3ea:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 3ed:	8b 17                	mov    (%edi),%edx
 3ef:	83 ec 0c             	sub    $0xc,%esp
 3f2:	6a 01                	push   $0x1
 3f4:	b9 0a 00 00 00       	mov    $0xa,%ecx
 3f9:	8b 45 08             	mov    0x8(%ebp),%eax
 3fc:	e8 cb fe ff ff       	call   2cc <printint>
 401:	83 c7 04             	add    $0x4,%edi
 404:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 407:	83 c4 10             	add    $0x10,%esp
 40a:	bf 00 00 00 00       	mov    $0x0,%edi
 40f:	eb 98                	jmp    3a9 <printf+0x45>
 411:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 414:	8b 17                	mov    (%edi),%edx
 416:	83 ec 0c             	sub    $0xc,%esp
 419:	6a 00                	push   $0x0
 41b:	b9 10 00 00 00       	mov    $0x10,%ecx
 420:	8b 45 08             	mov    0x8(%ebp),%eax
 423:	e8 a4 fe ff ff       	call   2cc <printint>
 428:	83 c7 04             	add    $0x4,%edi
 42b:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 42e:	83 c4 10             	add    $0x10,%esp
 431:	bf 00 00 00 00       	mov    $0x0,%edi
 436:	e9 6e ff ff ff       	jmp    3a9 <printf+0x45>
 43b:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
 43e:	8b 01                	mov    (%ecx),%eax
 440:	83 c1 04             	add    $0x4,%ecx
 443:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 446:	85 c0                	test   %eax,%eax
 448:	74 13                	je     45d <printf+0xf9>
 44a:	89 c3                	mov    %eax,%ebx
 44c:	0f b6 00             	movzbl (%eax),%eax
 44f:	bf 00 00 00 00       	mov    $0x0,%edi
 454:	84 c0                	test   %al,%al
 456:	75 0f                	jne    467 <printf+0x103>
 458:	e9 4c ff ff ff       	jmp    3a9 <printf+0x45>
 45d:	bb 83 06 00 00       	mov    $0x683,%ebx
 462:	b8 28 00 00 00       	mov    $0x28,%eax
 467:	8d 7d e7             	lea    -0x19(%ebp),%edi
 46a:	89 75 d0             	mov    %esi,-0x30(%ebp)
 46d:	8b 75 08             	mov    0x8(%ebp),%esi
 470:	88 45 e7             	mov    %al,-0x19(%ebp)
 473:	83 ec 04             	sub    $0x4,%esp
 476:	6a 01                	push   $0x1
 478:	57                   	push   %edi
 479:	56                   	push   %esi
 47a:	e8 c5 fd ff ff       	call   244 <write>
 47f:	83 c3 01             	add    $0x1,%ebx
 482:	0f b6 03             	movzbl (%ebx),%eax
 485:	83 c4 10             	add    $0x10,%esp
 488:	84 c0                	test   %al,%al
 48a:	75 e4                	jne    470 <printf+0x10c>
 48c:	8b 75 d0             	mov    -0x30(%ebp),%esi
 48f:	bf 00 00 00 00       	mov    $0x0,%edi
 494:	e9 10 ff ff ff       	jmp    3a9 <printf+0x45>
 499:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 49c:	8b 07                	mov    (%edi),%eax
 49e:	88 45 e7             	mov    %al,-0x19(%ebp)
 4a1:	83 ec 04             	sub    $0x4,%esp
 4a4:	6a 01                	push   $0x1
 4a6:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4a9:	50                   	push   %eax
 4aa:	ff 75 08             	push   0x8(%ebp)
 4ad:	e8 92 fd ff ff       	call   244 <write>
 4b2:	83 c7 04             	add    $0x4,%edi
 4b5:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 4b8:	83 c4 10             	add    $0x10,%esp
 4bb:	bf 00 00 00 00       	mov    $0x0,%edi
 4c0:	e9 e4 fe ff ff       	jmp    3a9 <printf+0x45>
 4c5:	88 5d e7             	mov    %bl,-0x19(%ebp)
 4c8:	83 ec 04             	sub    $0x4,%esp
 4cb:	6a 01                	push   $0x1
 4cd:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4d0:	50                   	push   %eax
 4d1:	ff 75 08             	push   0x8(%ebp)
 4d4:	e8 6b fd ff ff       	call   244 <write>
 4d9:	83 c4 10             	add    $0x10,%esp
 4dc:	bf 00 00 00 00       	mov    $0x0,%edi
 4e1:	e9 c3 fe ff ff       	jmp    3a9 <printf+0x45>
 4e6:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 4ea:	83 ec 04             	sub    $0x4,%esp
 4ed:	6a 01                	push   $0x1
 4ef:	8d 7d e7             	lea    -0x19(%ebp),%edi
 4f2:	57                   	push   %edi
 4f3:	ff 75 08             	push   0x8(%ebp)
 4f6:	e8 49 fd ff ff       	call   244 <write>
 4fb:	88 5d e7             	mov    %bl,-0x19(%ebp)
 4fe:	83 c4 0c             	add    $0xc,%esp
 501:	6a 01                	push   $0x1
 503:	57                   	push   %edi
 504:	ff 75 08             	push   0x8(%ebp)
 507:	e8 38 fd ff ff       	call   244 <write>
 50c:	83 c4 10             	add    $0x10,%esp
 50f:	bf 00 00 00 00       	mov    $0x0,%edi
 514:	e9 90 fe ff ff       	jmp    3a9 <printf+0x45>
 519:	8d 65 f4             	lea    -0xc(%ebp),%esp
 51c:	5b                   	pop    %ebx
 51d:	5e                   	pop    %esi
 51e:	5f                   	pop    %edi
 51f:	5d                   	pop    %ebp
 520:	c3                   	ret

00000521 <free>:
 521:	55                   	push   %ebp
 522:	89 e5                	mov    %esp,%ebp
 524:	57                   	push   %edi
 525:	56                   	push   %esi
 526:	53                   	push   %ebx
 527:	8b 5d 08             	mov    0x8(%ebp),%ebx
 52a:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 52d:	a1 50 09 00 00       	mov    0x950,%eax
 532:	eb 0c                	jmp    540 <free+0x1f>
 534:	8b 10                	mov    (%eax),%edx
 536:	39 d0                	cmp    %edx,%eax
 538:	72 04                	jb     53e <free+0x1d>
 53a:	39 d1                	cmp    %edx,%ecx
 53c:	72 10                	jb     54e <free+0x2d>
 53e:	89 d0                	mov    %edx,%eax
 540:	39 c8                	cmp    %ecx,%eax
 542:	73 f0                	jae    534 <free+0x13>
 544:	8b 10                	mov    (%eax),%edx
 546:	39 d1                	cmp    %edx,%ecx
 548:	72 04                	jb     54e <free+0x2d>
 54a:	39 d0                	cmp    %edx,%eax
 54c:	72 f0                	jb     53e <free+0x1d>
 54e:	8b 73 fc             	mov    -0x4(%ebx),%esi
 551:	8b 10                	mov    (%eax),%edx
 553:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 556:	39 fa                	cmp    %edi,%edx
 558:	74 19                	je     573 <free+0x52>
 55a:	89 53 f8             	mov    %edx,-0x8(%ebx)
 55d:	8b 50 04             	mov    0x4(%eax),%edx
 560:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 563:	39 f1                	cmp    %esi,%ecx
 565:	74 18                	je     57f <free+0x5e>
 567:	89 08                	mov    %ecx,(%eax)
 569:	a3 50 09 00 00       	mov    %eax,0x950
 56e:	5b                   	pop    %ebx
 56f:	5e                   	pop    %esi
 570:	5f                   	pop    %edi
 571:	5d                   	pop    %ebp
 572:	c3                   	ret
 573:	03 72 04             	add    0x4(%edx),%esi
 576:	89 73 fc             	mov    %esi,-0x4(%ebx)
 579:	8b 10                	mov    (%eax),%edx
 57b:	8b 12                	mov    (%edx),%edx
 57d:	eb db                	jmp    55a <free+0x39>
 57f:	03 53 fc             	add    -0x4(%ebx),%edx
 582:	89 50 04             	mov    %edx,0x4(%eax)
 585:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 588:	eb dd                	jmp    567 <free+0x46>

0000058a <malloc>:
 58a:	55                   	push   %ebp
 58b:	89 e5                	mov    %esp,%ebp
 58d:	57                   	push   %edi
 58e:	56                   	push   %esi
 58f:	53                   	push   %ebx
 590:	83 ec 0c             	sub    $0xc,%esp
 593:	8b 45 08             	mov    0x8(%ebp),%eax
 596:	8d 58 07             	lea    0x7(%eax),%ebx
 599:	c1 eb 03             	shr    $0x3,%ebx
 59c:	83 c3 01             	add    $0x1,%ebx
 59f:	8b 15 50 09 00 00    	mov    0x950,%edx
 5a5:	85 d2                	test   %edx,%edx
 5a7:	74 1c                	je     5c5 <malloc+0x3b>
 5a9:	8b 02                	mov    (%edx),%eax
 5ab:	8b 48 04             	mov    0x4(%eax),%ecx
 5ae:	39 d9                	cmp    %ebx,%ecx
 5b0:	73 38                	jae    5ea <malloc+0x60>
 5b2:	be 00 10 00 00       	mov    $0x1000,%esi
 5b7:	39 f3                	cmp    %esi,%ebx
 5b9:	0f 43 f3             	cmovae %ebx,%esi
 5bc:	8d 3c f5 00 00 00 00 	lea    0x0(,%esi,8),%edi
 5c3:	eb 72                	jmp    637 <malloc+0xad>
 5c5:	c7 05 50 09 00 00 54 	movl   $0x954,0x950
 5cc:	09 00 00 
 5cf:	c7 05 54 09 00 00 54 	movl   $0x954,0x954
 5d6:	09 00 00 
 5d9:	c7 05 58 09 00 00 00 	movl   $0x0,0x958
 5e0:	00 00 00 
 5e3:	b8 54 09 00 00       	mov    $0x954,%eax
 5e8:	eb c8                	jmp    5b2 <malloc+0x28>
 5ea:	39 cb                	cmp    %ecx,%ebx
 5ec:	74 1e                	je     60c <malloc+0x82>
 5ee:	29 d9                	sub    %ebx,%ecx
 5f0:	89 48 04             	mov    %ecx,0x4(%eax)
 5f3:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 5f6:	89 58 04             	mov    %ebx,0x4(%eax)
 5f9:	89 15 50 09 00 00    	mov    %edx,0x950
 5ff:	8d 50 08             	lea    0x8(%eax),%edx
 602:	89 d0                	mov    %edx,%eax
 604:	8d 65 f4             	lea    -0xc(%ebp),%esp
 607:	5b                   	pop    %ebx
 608:	5e                   	pop    %esi
 609:	5f                   	pop    %edi
 60a:	5d                   	pop    %ebp
 60b:	c3                   	ret
 60c:	8b 08                	mov    (%eax),%ecx
 60e:	89 0a                	mov    %ecx,(%edx)
 610:	eb e7                	jmp    5f9 <malloc+0x6f>
 612:	89 70 04             	mov    %esi,0x4(%eax)
 615:	83 ec 0c             	sub    $0xc,%esp
 618:	83 c0 08             	add    $0x8,%eax
 61b:	50                   	push   %eax
 61c:	e8 00 ff ff ff       	call   521 <free>
 621:	8b 15 50 09 00 00    	mov    0x950,%edx
 627:	83 c4 10             	add    $0x10,%esp
 62a:	85 d2                	test   %edx,%edx
 62c:	74 d4                	je     602 <malloc+0x78>
 62e:	8b 02                	mov    (%edx),%eax
 630:	8b 48 04             	mov    0x4(%eax),%ecx
 633:	39 d9                	cmp    %ebx,%ecx
 635:	73 b3                	jae    5ea <malloc+0x60>
 637:	89 c2                	mov    %eax,%edx
 639:	39 05 50 09 00 00    	cmp    %eax,0x950
 63f:	75 ed                	jne    62e <malloc+0xa4>
 641:	83 ec 0c             	sub    $0xc,%esp
 644:	57                   	push   %edi
 645:	e8 62 fc ff ff       	call   2ac <sbrk>
 64a:	83 c4 10             	add    $0x10,%esp
 64d:	83 f8 ff             	cmp    $0xffffffff,%eax
 650:	75 c0                	jne    612 <malloc+0x88>
 652:	ba 00 00 00 00       	mov    $0x0,%edx
 657:	eb a9                	jmp    602 <malloc+0x78>
