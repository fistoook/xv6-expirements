
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
   f:	83 ec 08             	sub    $0x8,%esp
  12:	6a 02                	push   $0x2
  14:	68 dc 06 00 00       	push   $0x6dc
  19:	e8 c7 02 00 00       	call   2e5 <open>
  1e:	83 c4 10             	add    $0x10,%esp
  21:	85 c0                	test   %eax,%eax
  23:	78 59                	js     7e <main+0x7e>
  25:	83 ec 0c             	sub    $0xc,%esp
  28:	6a 00                	push   $0x0
  2a:	e8 ee 02 00 00       	call   31d <dup>
  2f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  36:	e8 e2 02 00 00       	call   31d <dup>
  3b:	83 c4 10             	add    $0x10,%esp
  3e:	83 ec 08             	sub    $0x8,%esp
  41:	68 e4 06 00 00       	push   $0x6e4
  46:	6a 01                	push   $0x1
  48:	e8 98 03 00 00       	call   3e5 <printf>
  4d:	e8 4b 02 00 00       	call   29d <fork>
  52:	89 c3                	mov    %eax,%ebx
  54:	83 c4 10             	add    $0x10,%esp
  57:	85 c0                	test   %eax,%eax
  59:	78 48                	js     a3 <main+0xa3>
  5b:	74 5a                	je     b7 <main+0xb7>
  5d:	e8 4b 02 00 00       	call   2ad <wait>
  62:	39 c3                	cmp    %eax,%ebx
  64:	74 d8                	je     3e <main+0x3e>
  66:	85 c0                	test   %eax,%eax
  68:	78 d4                	js     3e <main+0x3e>
  6a:	83 ec 08             	sub    $0x8,%esp
  6d:	68 23 07 00 00       	push   $0x723
  72:	6a 01                	push   $0x1
  74:	e8 6c 03 00 00       	call   3e5 <printf>
  79:	83 c4 10             	add    $0x10,%esp
  7c:	eb df                	jmp    5d <main+0x5d>
  7e:	83 ec 04             	sub    $0x4,%esp
  81:	6a 01                	push   $0x1
  83:	6a 01                	push   $0x1
  85:	68 dc 06 00 00       	push   $0x6dc
  8a:	e8 5e 02 00 00       	call   2ed <mknod>
  8f:	83 c4 08             	add    $0x8,%esp
  92:	6a 02                	push   $0x2
  94:	68 dc 06 00 00       	push   $0x6dc
  99:	e8 47 02 00 00       	call   2e5 <open>
  9e:	83 c4 10             	add    $0x10,%esp
  a1:	eb 82                	jmp    25 <main+0x25>
  a3:	83 ec 08             	sub    $0x8,%esp
  a6:	68 f7 06 00 00       	push   $0x6f7
  ab:	6a 01                	push   $0x1
  ad:	e8 33 03 00 00       	call   3e5 <printf>
  b2:	e8 ee 01 00 00       	call   2a5 <exit>
  b7:	83 ec 08             	sub    $0x8,%esp
  ba:	68 f8 09 00 00       	push   $0x9f8
  bf:	68 0a 07 00 00       	push   $0x70a
  c4:	e8 14 02 00 00       	call   2dd <exec>
  c9:	83 c4 08             	add    $0x8,%esp
  cc:	68 0d 07 00 00       	push   $0x70d
  d1:	6a 01                	push   $0x1
  d3:	e8 0d 03 00 00       	call   3e5 <printf>
  d8:	e8 c8 01 00 00       	call   2a5 <exit>

000000dd <strcpy>:
  dd:	55                   	push   %ebp
  de:	89 e5                	mov    %esp,%ebp
  e0:	53                   	push   %ebx
  e1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  e4:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  e7:	b8 00 00 00 00       	mov    $0x0,%eax
  ec:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  f0:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  f3:	83 c0 01             	add    $0x1,%eax
  f6:	84 d2                	test   %dl,%dl
  f8:	75 f2                	jne    ec <strcpy+0xf>
  fa:	89 c8                	mov    %ecx,%eax
  fc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  ff:	c9                   	leave
 100:	c3                   	ret

00000101 <strcmp>:
 101:	55                   	push   %ebp
 102:	89 e5                	mov    %esp,%ebp
 104:	8b 4d 08             	mov    0x8(%ebp),%ecx
 107:	8b 55 0c             	mov    0xc(%ebp),%edx
 10a:	0f b6 01             	movzbl (%ecx),%eax
 10d:	84 c0                	test   %al,%al
 10f:	74 11                	je     122 <strcmp+0x21>
 111:	38 02                	cmp    %al,(%edx)
 113:	75 0d                	jne    122 <strcmp+0x21>
 115:	83 c1 01             	add    $0x1,%ecx
 118:	83 c2 01             	add    $0x1,%edx
 11b:	0f b6 01             	movzbl (%ecx),%eax
 11e:	84 c0                	test   %al,%al
 120:	75 ef                	jne    111 <strcmp+0x10>
 122:	0f b6 c0             	movzbl %al,%eax
 125:	0f b6 12             	movzbl (%edx),%edx
 128:	29 d0                	sub    %edx,%eax
 12a:	5d                   	pop    %ebp
 12b:	c3                   	ret

0000012c <strlen>:
 12c:	55                   	push   %ebp
 12d:	89 e5                	mov    %esp,%ebp
 12f:	8b 55 08             	mov    0x8(%ebp),%edx
 132:	80 3a 00             	cmpb   $0x0,(%edx)
 135:	74 14                	je     14b <strlen+0x1f>
 137:	b8 00 00 00 00       	mov    $0x0,%eax
 13c:	83 c0 01             	add    $0x1,%eax
 13f:	89 c1                	mov    %eax,%ecx
 141:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 145:	75 f5                	jne    13c <strlen+0x10>
 147:	89 c8                	mov    %ecx,%eax
 149:	5d                   	pop    %ebp
 14a:	c3                   	ret
 14b:	b9 00 00 00 00       	mov    $0x0,%ecx
 150:	eb f5                	jmp    147 <strlen+0x1b>

00000152 <memset>:
 152:	55                   	push   %ebp
 153:	89 e5                	mov    %esp,%ebp
 155:	57                   	push   %edi
 156:	8b 55 08             	mov    0x8(%ebp),%edx
 159:	89 d7                	mov    %edx,%edi
 15b:	8b 4d 10             	mov    0x10(%ebp),%ecx
 15e:	8b 45 0c             	mov    0xc(%ebp),%eax
 161:	fc                   	cld
 162:	f3 aa                	rep stos %al,%es:(%edi)
 164:	89 d0                	mov    %edx,%eax
 166:	8b 7d fc             	mov    -0x4(%ebp),%edi
 169:	c9                   	leave
 16a:	c3                   	ret

0000016b <strchr>:
 16b:	55                   	push   %ebp
 16c:	89 e5                	mov    %esp,%ebp
 16e:	8b 45 08             	mov    0x8(%ebp),%eax
 171:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
 175:	0f b6 10             	movzbl (%eax),%edx
 178:	84 d2                	test   %dl,%dl
 17a:	74 15                	je     191 <strchr+0x26>
 17c:	38 d1                	cmp    %dl,%cl
 17e:	74 0f                	je     18f <strchr+0x24>
 180:	83 c0 01             	add    $0x1,%eax
 183:	0f b6 10             	movzbl (%eax),%edx
 186:	84 d2                	test   %dl,%dl
 188:	75 f2                	jne    17c <strchr+0x11>
 18a:	b8 00 00 00 00       	mov    $0x0,%eax
 18f:	5d                   	pop    %ebp
 190:	c3                   	ret
 191:	b8 00 00 00 00       	mov    $0x0,%eax
 196:	eb f7                	jmp    18f <strchr+0x24>

00000198 <gets>:
 198:	55                   	push   %ebp
 199:	89 e5                	mov    %esp,%ebp
 19b:	57                   	push   %edi
 19c:	56                   	push   %esi
 19d:	53                   	push   %ebx
 19e:	83 ec 2c             	sub    $0x2c,%esp
 1a1:	8b 75 08             	mov    0x8(%ebp),%esi
 1a4:	bb 00 00 00 00       	mov    $0x0,%ebx
 1a9:	8d 7d e7             	lea    -0x19(%ebp),%edi
 1ac:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 1af:	83 c3 01             	add    $0x1,%ebx
 1b2:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1b5:	7d 27                	jge    1de <gets+0x46>
 1b7:	83 ec 04             	sub    $0x4,%esp
 1ba:	6a 01                	push   $0x1
 1bc:	57                   	push   %edi
 1bd:	6a 00                	push   $0x0
 1bf:	e8 f9 00 00 00       	call   2bd <read>
 1c4:	83 c4 10             	add    $0x10,%esp
 1c7:	85 c0                	test   %eax,%eax
 1c9:	7e 13                	jle    1de <gets+0x46>
 1cb:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1cf:	88 44 1e ff          	mov    %al,-0x1(%esi,%ebx,1)
 1d3:	3c 0a                	cmp    $0xa,%al
 1d5:	74 04                	je     1db <gets+0x43>
 1d7:	3c 0d                	cmp    $0xd,%al
 1d9:	75 d1                	jne    1ac <gets+0x14>
 1db:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 1de:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 1e1:	c6 04 06 00          	movb   $0x0,(%esi,%eax,1)
 1e5:	89 f0                	mov    %esi,%eax
 1e7:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1ea:	5b                   	pop    %ebx
 1eb:	5e                   	pop    %esi
 1ec:	5f                   	pop    %edi
 1ed:	5d                   	pop    %ebp
 1ee:	c3                   	ret

000001ef <stat>:
 1ef:	55                   	push   %ebp
 1f0:	89 e5                	mov    %esp,%ebp
 1f2:	56                   	push   %esi
 1f3:	53                   	push   %ebx
 1f4:	83 ec 08             	sub    $0x8,%esp
 1f7:	6a 00                	push   $0x0
 1f9:	ff 75 08             	push   0x8(%ebp)
 1fc:	e8 e4 00 00 00       	call   2e5 <open>
 201:	83 c4 10             	add    $0x10,%esp
 204:	85 c0                	test   %eax,%eax
 206:	78 24                	js     22c <stat+0x3d>
 208:	89 c3                	mov    %eax,%ebx
 20a:	83 ec 08             	sub    $0x8,%esp
 20d:	ff 75 0c             	push   0xc(%ebp)
 210:	50                   	push   %eax
 211:	e8 e7 00 00 00       	call   2fd <fstat>
 216:	89 c6                	mov    %eax,%esi
 218:	89 1c 24             	mov    %ebx,(%esp)
 21b:	e8 ad 00 00 00       	call   2cd <close>
 220:	83 c4 10             	add    $0x10,%esp
 223:	89 f0                	mov    %esi,%eax
 225:	8d 65 f8             	lea    -0x8(%ebp),%esp
 228:	5b                   	pop    %ebx
 229:	5e                   	pop    %esi
 22a:	5d                   	pop    %ebp
 22b:	c3                   	ret
 22c:	be ff ff ff ff       	mov    $0xffffffff,%esi
 231:	eb f0                	jmp    223 <stat+0x34>

00000233 <atoi>:
 233:	55                   	push   %ebp
 234:	89 e5                	mov    %esp,%ebp
 236:	53                   	push   %ebx
 237:	8b 55 08             	mov    0x8(%ebp),%edx
 23a:	0f b6 02             	movzbl (%edx),%eax
 23d:	8d 48 d0             	lea    -0x30(%eax),%ecx
 240:	80 f9 09             	cmp    $0x9,%cl
 243:	77 24                	ja     269 <atoi+0x36>
 245:	b9 00 00 00 00       	mov    $0x0,%ecx
 24a:	83 c2 01             	add    $0x1,%edx
 24d:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 250:	0f be c0             	movsbl %al,%eax
 253:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
 257:	0f b6 02             	movzbl (%edx),%eax
 25a:	8d 58 d0             	lea    -0x30(%eax),%ebx
 25d:	80 fb 09             	cmp    $0x9,%bl
 260:	76 e8                	jbe    24a <atoi+0x17>
 262:	89 c8                	mov    %ecx,%eax
 264:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 267:	c9                   	leave
 268:	c3                   	ret
 269:	b9 00 00 00 00       	mov    $0x0,%ecx
 26e:	eb f2                	jmp    262 <atoi+0x2f>

00000270 <memmove>:
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	56                   	push   %esi
 274:	53                   	push   %ebx
 275:	8b 75 08             	mov    0x8(%ebp),%esi
 278:	8b 55 0c             	mov    0xc(%ebp),%edx
 27b:	8b 5d 10             	mov    0x10(%ebp),%ebx
 27e:	85 db                	test   %ebx,%ebx
 280:	7e 15                	jle    297 <memmove+0x27>
 282:	01 f3                	add    %esi,%ebx
 284:	89 f0                	mov    %esi,%eax
 286:	83 c2 01             	add    $0x1,%edx
 289:	83 c0 01             	add    $0x1,%eax
 28c:	0f b6 4a ff          	movzbl -0x1(%edx),%ecx
 290:	88 48 ff             	mov    %cl,-0x1(%eax)
 293:	39 c3                	cmp    %eax,%ebx
 295:	75 ef                	jne    286 <memmove+0x16>
 297:	89 f0                	mov    %esi,%eax
 299:	5b                   	pop    %ebx
 29a:	5e                   	pop    %esi
 29b:	5d                   	pop    %ebp
 29c:	c3                   	ret

0000029d <fork>:
  name: \
    movl $1, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALLFORK(fork) //instead of SYSCALL(fork) !!!
 29d:	b8 01 00 00 00       	mov    $0x1,%eax
 2a2:	cd 40                	int    $0x40
 2a4:	c3                   	ret

000002a5 <exit>:
//SYSCALL(fork)
SYSCALL(exit)
 2a5:	b8 02 00 00 00       	mov    $0x2,%eax
 2aa:	cd 40                	int    $0x40
 2ac:	c3                   	ret

000002ad <wait>:
SYSCALL(wait)
 2ad:	b8 03 00 00 00       	mov    $0x3,%eax
 2b2:	cd 40                	int    $0x40
 2b4:	c3                   	ret

000002b5 <pipe>:
SYSCALL(pipe)
 2b5:	b8 04 00 00 00       	mov    $0x4,%eax
 2ba:	cd 40                	int    $0x40
 2bc:	c3                   	ret

000002bd <read>:
SYSCALL(read)
 2bd:	b8 05 00 00 00       	mov    $0x5,%eax
 2c2:	cd 40                	int    $0x40
 2c4:	c3                   	ret

000002c5 <write>:
SYSCALL(write)
 2c5:	b8 10 00 00 00       	mov    $0x10,%eax
 2ca:	cd 40                	int    $0x40
 2cc:	c3                   	ret

000002cd <close>:
SYSCALL(close)
 2cd:	b8 15 00 00 00       	mov    $0x15,%eax
 2d2:	cd 40                	int    $0x40
 2d4:	c3                   	ret

000002d5 <kill>:
SYSCALL(kill)
 2d5:	b8 06 00 00 00       	mov    $0x6,%eax
 2da:	cd 40                	int    $0x40
 2dc:	c3                   	ret

000002dd <exec>:
SYSCALL(exec)
 2dd:	b8 07 00 00 00       	mov    $0x7,%eax
 2e2:	cd 40                	int    $0x40
 2e4:	c3                   	ret

000002e5 <open>:
SYSCALL(open)
 2e5:	b8 0f 00 00 00       	mov    $0xf,%eax
 2ea:	cd 40                	int    $0x40
 2ec:	c3                   	ret

000002ed <mknod>:
SYSCALL(mknod)
 2ed:	b8 11 00 00 00       	mov    $0x11,%eax
 2f2:	cd 40                	int    $0x40
 2f4:	c3                   	ret

000002f5 <unlink>:
SYSCALL(unlink)
 2f5:	b8 12 00 00 00       	mov    $0x12,%eax
 2fa:	cd 40                	int    $0x40
 2fc:	c3                   	ret

000002fd <fstat>:
SYSCALL(fstat)
 2fd:	b8 08 00 00 00       	mov    $0x8,%eax
 302:	cd 40                	int    $0x40
 304:	c3                   	ret

00000305 <link>:
SYSCALL(link)
 305:	b8 13 00 00 00       	mov    $0x13,%eax
 30a:	cd 40                	int    $0x40
 30c:	c3                   	ret

0000030d <mkdir>:
SYSCALL(mkdir)
 30d:	b8 14 00 00 00       	mov    $0x14,%eax
 312:	cd 40                	int    $0x40
 314:	c3                   	ret

00000315 <chdir>:
SYSCALL(chdir)
 315:	b8 09 00 00 00       	mov    $0x9,%eax
 31a:	cd 40                	int    $0x40
 31c:	c3                   	ret

0000031d <dup>:
SYSCALL(dup)
 31d:	b8 0a 00 00 00       	mov    $0xa,%eax
 322:	cd 40                	int    $0x40
 324:	c3                   	ret

00000325 <getpid>:
SYSCALL(getpid)
 325:	b8 0b 00 00 00       	mov    $0xb,%eax
 32a:	cd 40                	int    $0x40
 32c:	c3                   	ret

0000032d <sbrk>:
SYSCALL(sbrk)
 32d:	b8 0c 00 00 00       	mov    $0xc,%eax
 332:	cd 40                	int    $0x40
 334:	c3                   	ret

00000335 <sleep>:
SYSCALL(sleep)
 335:	b8 0d 00 00 00       	mov    $0xd,%eax
 33a:	cd 40                	int    $0x40
 33c:	c3                   	ret

0000033d <uptime>:
SYSCALL(uptime)
 33d:	b8 0e 00 00 00       	mov    $0xe,%eax
 342:	cd 40                	int    $0x40
 344:	c3                   	ret

00000345 <ps>:
SYSCALL(ps)
 345:	b8 16 00 00 00       	mov    $0x16,%eax
 34a:	cd 40                	int    $0x40
 34c:	c3                   	ret

0000034d <printint>:
 34d:	55                   	push   %ebp
 34e:	89 e5                	mov    %esp,%ebp
 350:	57                   	push   %edi
 351:	56                   	push   %esi
 352:	53                   	push   %ebx
 353:	83 ec 3c             	sub    $0x3c,%esp
 356:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 359:	89 ce                	mov    %ecx,%esi
 35b:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 35f:	74 79                	je     3da <printint+0x8d>
 361:	85 d2                	test   %edx,%edx
 363:	79 75                	jns    3da <printint+0x8d>
 365:	89 d1                	mov    %edx,%ecx
 367:	f7 d9                	neg    %ecx
 369:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
 370:	bb 00 00 00 00       	mov    $0x0,%ebx
 375:	89 df                	mov    %ebx,%edi
 377:	83 c3 01             	add    $0x1,%ebx
 37a:	89 c8                	mov    %ecx,%eax
 37c:	ba 00 00 00 00       	mov    $0x0,%edx
 381:	f7 f6                	div    %esi
 383:	0f b6 92 8c 07 00 00 	movzbl 0x78c(%edx),%edx
 38a:	88 54 1d d7          	mov    %dl,-0x29(%ebp,%ebx,1)
 38e:	89 ca                	mov    %ecx,%edx
 390:	89 c1                	mov    %eax,%ecx
 392:	39 f2                	cmp    %esi,%edx
 394:	73 df                	jae    375 <printint+0x28>
 396:	83 7d c0 00          	cmpl   $0x0,-0x40(%ebp)
 39a:	74 08                	je     3a4 <printint+0x57>
 39c:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 3a1:	8d 5f 02             	lea    0x2(%edi),%ebx
 3a4:	85 db                	test   %ebx,%ebx
 3a6:	7e 2a                	jle    3d2 <printint+0x85>
 3a8:	8d 75 d8             	lea    -0x28(%ebp),%esi
 3ab:	8d 5c 1d d7          	lea    -0x29(%ebp,%ebx,1),%ebx
 3af:	8d 7d d7             	lea    -0x29(%ebp),%edi
 3b2:	0f b6 03             	movzbl (%ebx),%eax
 3b5:	88 45 d7             	mov    %al,-0x29(%ebp)
 3b8:	83 ec 04             	sub    $0x4,%esp
 3bb:	6a 01                	push   $0x1
 3bd:	57                   	push   %edi
 3be:	ff 75 c4             	push   -0x3c(%ebp)
 3c1:	e8 ff fe ff ff       	call   2c5 <write>
 3c6:	89 d8                	mov    %ebx,%eax
 3c8:	83 eb 01             	sub    $0x1,%ebx
 3cb:	83 c4 10             	add    $0x10,%esp
 3ce:	39 f0                	cmp    %esi,%eax
 3d0:	75 e0                	jne    3b2 <printint+0x65>
 3d2:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3d5:	5b                   	pop    %ebx
 3d6:	5e                   	pop    %esi
 3d7:	5f                   	pop    %edi
 3d8:	5d                   	pop    %ebp
 3d9:	c3                   	ret
 3da:	89 d1                	mov    %edx,%ecx
 3dc:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
 3e3:	eb 8b                	jmp    370 <printint+0x23>

000003e5 <printf>:
 3e5:	55                   	push   %ebp
 3e6:	89 e5                	mov    %esp,%ebp
 3e8:	57                   	push   %edi
 3e9:	56                   	push   %esi
 3ea:	53                   	push   %ebx
 3eb:	83 ec 2c             	sub    $0x2c,%esp
 3ee:	8b 75 0c             	mov    0xc(%ebp),%esi
 3f1:	0f b6 1e             	movzbl (%esi),%ebx
 3f4:	84 db                	test   %bl,%bl
 3f6:	0f 84 9e 01 00 00    	je     59a <printf+0x1b5>
 3fc:	83 c6 01             	add    $0x1,%esi
 3ff:	8d 45 10             	lea    0x10(%ebp),%eax
 402:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 405:	bf 00 00 00 00       	mov    $0x0,%edi
 40a:	eb 2d                	jmp    439 <printf+0x54>
 40c:	88 5d e7             	mov    %bl,-0x19(%ebp)
 40f:	83 ec 04             	sub    $0x4,%esp
 412:	6a 01                	push   $0x1
 414:	8d 45 e7             	lea    -0x19(%ebp),%eax
 417:	50                   	push   %eax
 418:	ff 75 08             	push   0x8(%ebp)
 41b:	e8 a5 fe ff ff       	call   2c5 <write>
 420:	83 c4 10             	add    $0x10,%esp
 423:	eb 05                	jmp    42a <printf+0x45>
 425:	83 ff 25             	cmp    $0x25,%edi
 428:	74 1f                	je     449 <printf+0x64>
 42a:	83 c6 01             	add    $0x1,%esi
 42d:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 431:	84 db                	test   %bl,%bl
 433:	0f 84 61 01 00 00    	je     59a <printf+0x1b5>
 439:	0f b6 c3             	movzbl %bl,%eax
 43c:	85 ff                	test   %edi,%edi
 43e:	75 e5                	jne    425 <printf+0x40>
 440:	83 f8 25             	cmp    $0x25,%eax
 443:	75 c7                	jne    40c <printf+0x27>
 445:	89 c7                	mov    %eax,%edi
 447:	eb e1                	jmp    42a <printf+0x45>
 449:	83 f8 25             	cmp    $0x25,%eax
 44c:	0f 84 f4 00 00 00    	je     546 <printf+0x161>
 452:	8d 50 9d             	lea    -0x63(%eax),%edx
 455:	83 fa 15             	cmp    $0x15,%edx
 458:	0f 87 09 01 00 00    	ja     567 <printf+0x182>
 45e:	0f 87 03 01 00 00    	ja     567 <printf+0x182>
 464:	ff 24 95 34 07 00 00 	jmp    *0x734(,%edx,4)
 46b:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 46e:	8b 17                	mov    (%edi),%edx
 470:	83 ec 0c             	sub    $0xc,%esp
 473:	6a 01                	push   $0x1
 475:	b9 0a 00 00 00       	mov    $0xa,%ecx
 47a:	8b 45 08             	mov    0x8(%ebp),%eax
 47d:	e8 cb fe ff ff       	call   34d <printint>
 482:	83 c7 04             	add    $0x4,%edi
 485:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 488:	83 c4 10             	add    $0x10,%esp
 48b:	bf 00 00 00 00       	mov    $0x0,%edi
 490:	eb 98                	jmp    42a <printf+0x45>
 492:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 495:	8b 17                	mov    (%edi),%edx
 497:	83 ec 0c             	sub    $0xc,%esp
 49a:	6a 00                	push   $0x0
 49c:	b9 10 00 00 00       	mov    $0x10,%ecx
 4a1:	8b 45 08             	mov    0x8(%ebp),%eax
 4a4:	e8 a4 fe ff ff       	call   34d <printint>
 4a9:	83 c7 04             	add    $0x4,%edi
 4ac:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 4af:	83 c4 10             	add    $0x10,%esp
 4b2:	bf 00 00 00 00       	mov    $0x0,%edi
 4b7:	e9 6e ff ff ff       	jmp    42a <printf+0x45>
 4bc:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
 4bf:	8b 01                	mov    (%ecx),%eax
 4c1:	83 c1 04             	add    $0x4,%ecx
 4c4:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 4c7:	85 c0                	test   %eax,%eax
 4c9:	74 13                	je     4de <printf+0xf9>
 4cb:	89 c3                	mov    %eax,%ebx
 4cd:	0f b6 00             	movzbl (%eax),%eax
 4d0:	bf 00 00 00 00       	mov    $0x0,%edi
 4d5:	84 c0                	test   %al,%al
 4d7:	75 0f                	jne    4e8 <printf+0x103>
 4d9:	e9 4c ff ff ff       	jmp    42a <printf+0x45>
 4de:	bb 2c 07 00 00       	mov    $0x72c,%ebx
 4e3:	b8 28 00 00 00       	mov    $0x28,%eax
 4e8:	8d 7d e7             	lea    -0x19(%ebp),%edi
 4eb:	89 75 d0             	mov    %esi,-0x30(%ebp)
 4ee:	8b 75 08             	mov    0x8(%ebp),%esi
 4f1:	88 45 e7             	mov    %al,-0x19(%ebp)
 4f4:	83 ec 04             	sub    $0x4,%esp
 4f7:	6a 01                	push   $0x1
 4f9:	57                   	push   %edi
 4fa:	56                   	push   %esi
 4fb:	e8 c5 fd ff ff       	call   2c5 <write>
 500:	83 c3 01             	add    $0x1,%ebx
 503:	0f b6 03             	movzbl (%ebx),%eax
 506:	83 c4 10             	add    $0x10,%esp
 509:	84 c0                	test   %al,%al
 50b:	75 e4                	jne    4f1 <printf+0x10c>
 50d:	8b 75 d0             	mov    -0x30(%ebp),%esi
 510:	bf 00 00 00 00       	mov    $0x0,%edi
 515:	e9 10 ff ff ff       	jmp    42a <printf+0x45>
 51a:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 51d:	8b 07                	mov    (%edi),%eax
 51f:	88 45 e7             	mov    %al,-0x19(%ebp)
 522:	83 ec 04             	sub    $0x4,%esp
 525:	6a 01                	push   $0x1
 527:	8d 45 e7             	lea    -0x19(%ebp),%eax
 52a:	50                   	push   %eax
 52b:	ff 75 08             	push   0x8(%ebp)
 52e:	e8 92 fd ff ff       	call   2c5 <write>
 533:	83 c7 04             	add    $0x4,%edi
 536:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 539:	83 c4 10             	add    $0x10,%esp
 53c:	bf 00 00 00 00       	mov    $0x0,%edi
 541:	e9 e4 fe ff ff       	jmp    42a <printf+0x45>
 546:	88 5d e7             	mov    %bl,-0x19(%ebp)
 549:	83 ec 04             	sub    $0x4,%esp
 54c:	6a 01                	push   $0x1
 54e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 551:	50                   	push   %eax
 552:	ff 75 08             	push   0x8(%ebp)
 555:	e8 6b fd ff ff       	call   2c5 <write>
 55a:	83 c4 10             	add    $0x10,%esp
 55d:	bf 00 00 00 00       	mov    $0x0,%edi
 562:	e9 c3 fe ff ff       	jmp    42a <printf+0x45>
 567:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 56b:	83 ec 04             	sub    $0x4,%esp
 56e:	6a 01                	push   $0x1
 570:	8d 7d e7             	lea    -0x19(%ebp),%edi
 573:	57                   	push   %edi
 574:	ff 75 08             	push   0x8(%ebp)
 577:	e8 49 fd ff ff       	call   2c5 <write>
 57c:	88 5d e7             	mov    %bl,-0x19(%ebp)
 57f:	83 c4 0c             	add    $0xc,%esp
 582:	6a 01                	push   $0x1
 584:	57                   	push   %edi
 585:	ff 75 08             	push   0x8(%ebp)
 588:	e8 38 fd ff ff       	call   2c5 <write>
 58d:	83 c4 10             	add    $0x10,%esp
 590:	bf 00 00 00 00       	mov    $0x0,%edi
 595:	e9 90 fe ff ff       	jmp    42a <printf+0x45>
 59a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 59d:	5b                   	pop    %ebx
 59e:	5e                   	pop    %esi
 59f:	5f                   	pop    %edi
 5a0:	5d                   	pop    %ebp
 5a1:	c3                   	ret

000005a2 <free>:
 5a2:	55                   	push   %ebp
 5a3:	89 e5                	mov    %esp,%ebp
 5a5:	57                   	push   %edi
 5a6:	56                   	push   %esi
 5a7:	53                   	push   %ebx
 5a8:	8b 5d 08             	mov    0x8(%ebp),%ebx
 5ab:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 5ae:	a1 00 0a 00 00       	mov    0xa00,%eax
 5b3:	eb 0c                	jmp    5c1 <free+0x1f>
 5b5:	8b 10                	mov    (%eax),%edx
 5b7:	39 d0                	cmp    %edx,%eax
 5b9:	72 04                	jb     5bf <free+0x1d>
 5bb:	39 d1                	cmp    %edx,%ecx
 5bd:	72 10                	jb     5cf <free+0x2d>
 5bf:	89 d0                	mov    %edx,%eax
 5c1:	39 c8                	cmp    %ecx,%eax
 5c3:	73 f0                	jae    5b5 <free+0x13>
 5c5:	8b 10                	mov    (%eax),%edx
 5c7:	39 d1                	cmp    %edx,%ecx
 5c9:	72 04                	jb     5cf <free+0x2d>
 5cb:	39 d0                	cmp    %edx,%eax
 5cd:	72 f0                	jb     5bf <free+0x1d>
 5cf:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5d2:	8b 10                	mov    (%eax),%edx
 5d4:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5d7:	39 fa                	cmp    %edi,%edx
 5d9:	74 19                	je     5f4 <free+0x52>
 5db:	89 53 f8             	mov    %edx,-0x8(%ebx)
 5de:	8b 50 04             	mov    0x4(%eax),%edx
 5e1:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5e4:	39 f1                	cmp    %esi,%ecx
 5e6:	74 18                	je     600 <free+0x5e>
 5e8:	89 08                	mov    %ecx,(%eax)
 5ea:	a3 00 0a 00 00       	mov    %eax,0xa00
 5ef:	5b                   	pop    %ebx
 5f0:	5e                   	pop    %esi
 5f1:	5f                   	pop    %edi
 5f2:	5d                   	pop    %ebp
 5f3:	c3                   	ret
 5f4:	03 72 04             	add    0x4(%edx),%esi
 5f7:	89 73 fc             	mov    %esi,-0x4(%ebx)
 5fa:	8b 10                	mov    (%eax),%edx
 5fc:	8b 12                	mov    (%edx),%edx
 5fe:	eb db                	jmp    5db <free+0x39>
 600:	03 53 fc             	add    -0x4(%ebx),%edx
 603:	89 50 04             	mov    %edx,0x4(%eax)
 606:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 609:	eb dd                	jmp    5e8 <free+0x46>

0000060b <malloc>:
 60b:	55                   	push   %ebp
 60c:	89 e5                	mov    %esp,%ebp
 60e:	57                   	push   %edi
 60f:	56                   	push   %esi
 610:	53                   	push   %ebx
 611:	83 ec 0c             	sub    $0xc,%esp
 614:	8b 45 08             	mov    0x8(%ebp),%eax
 617:	8d 58 07             	lea    0x7(%eax),%ebx
 61a:	c1 eb 03             	shr    $0x3,%ebx
 61d:	83 c3 01             	add    $0x1,%ebx
 620:	8b 15 00 0a 00 00    	mov    0xa00,%edx
 626:	85 d2                	test   %edx,%edx
 628:	74 1c                	je     646 <malloc+0x3b>
 62a:	8b 02                	mov    (%edx),%eax
 62c:	8b 48 04             	mov    0x4(%eax),%ecx
 62f:	39 d9                	cmp    %ebx,%ecx
 631:	73 38                	jae    66b <malloc+0x60>
 633:	be 00 10 00 00       	mov    $0x1000,%esi
 638:	39 f3                	cmp    %esi,%ebx
 63a:	0f 43 f3             	cmovae %ebx,%esi
 63d:	8d 3c f5 00 00 00 00 	lea    0x0(,%esi,8),%edi
 644:	eb 72                	jmp    6b8 <malloc+0xad>
 646:	c7 05 00 0a 00 00 04 	movl   $0xa04,0xa00
 64d:	0a 00 00 
 650:	c7 05 04 0a 00 00 04 	movl   $0xa04,0xa04
 657:	0a 00 00 
 65a:	c7 05 08 0a 00 00 00 	movl   $0x0,0xa08
 661:	00 00 00 
 664:	b8 04 0a 00 00       	mov    $0xa04,%eax
 669:	eb c8                	jmp    633 <malloc+0x28>
 66b:	39 cb                	cmp    %ecx,%ebx
 66d:	74 1e                	je     68d <malloc+0x82>
 66f:	29 d9                	sub    %ebx,%ecx
 671:	89 48 04             	mov    %ecx,0x4(%eax)
 674:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 677:	89 58 04             	mov    %ebx,0x4(%eax)
 67a:	89 15 00 0a 00 00    	mov    %edx,0xa00
 680:	8d 50 08             	lea    0x8(%eax),%edx
 683:	89 d0                	mov    %edx,%eax
 685:	8d 65 f4             	lea    -0xc(%ebp),%esp
 688:	5b                   	pop    %ebx
 689:	5e                   	pop    %esi
 68a:	5f                   	pop    %edi
 68b:	5d                   	pop    %ebp
 68c:	c3                   	ret
 68d:	8b 08                	mov    (%eax),%ecx
 68f:	89 0a                	mov    %ecx,(%edx)
 691:	eb e7                	jmp    67a <malloc+0x6f>
 693:	89 70 04             	mov    %esi,0x4(%eax)
 696:	83 ec 0c             	sub    $0xc,%esp
 699:	83 c0 08             	add    $0x8,%eax
 69c:	50                   	push   %eax
 69d:	e8 00 ff ff ff       	call   5a2 <free>
 6a2:	8b 15 00 0a 00 00    	mov    0xa00,%edx
 6a8:	83 c4 10             	add    $0x10,%esp
 6ab:	85 d2                	test   %edx,%edx
 6ad:	74 d4                	je     683 <malloc+0x78>
 6af:	8b 02                	mov    (%edx),%eax
 6b1:	8b 48 04             	mov    0x4(%eax),%ecx
 6b4:	39 d9                	cmp    %ebx,%ecx
 6b6:	73 b3                	jae    66b <malloc+0x60>
 6b8:	89 c2                	mov    %eax,%edx
 6ba:	39 05 00 0a 00 00    	cmp    %eax,0xa00
 6c0:	75 ed                	jne    6af <malloc+0xa4>
 6c2:	83 ec 0c             	sub    $0xc,%esp
 6c5:	57                   	push   %edi
 6c6:	e8 62 fc ff ff       	call   32d <sbrk>
 6cb:	83 c4 10             	add    $0x10,%esp
 6ce:	83 f8 ff             	cmp    $0xffffffff,%eax
 6d1:	75 c0                	jne    693 <malloc+0x88>
 6d3:	ba 00 00 00 00       	mov    $0x0,%edx
 6d8:	eb a9                	jmp    683 <malloc+0x78>
