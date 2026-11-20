
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <wc>:
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	57                   	push   %edi
   4:	56                   	push   %esi
   5:	53                   	push   %ebx
   6:	83 ec 1c             	sub    $0x1c,%esp
   9:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  10:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  17:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  1e:	be 00 00 00 00       	mov    $0x0,%esi
  23:	eb 4d                	jmp    72 <wc+0x72>
  25:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  2c:	83 c3 01             	add    $0x1,%ebx
  2f:	39 df                	cmp    %ebx,%edi
  31:	74 3c                	je     6f <wc+0x6f>
  33:	0f b6 83 a0 0a 00 00 	movzbl 0xaa0(%ebx),%eax
  3a:	3c 0a                	cmp    $0xa,%al
  3c:	0f 94 c2             	sete   %dl
  3f:	0f b6 d2             	movzbl %dl,%edx
  42:	01 d6                	add    %edx,%esi
  44:	83 ec 08             	sub    $0x8,%esp
  47:	0f be c0             	movsbl %al,%eax
  4a:	50                   	push   %eax
  4b:	68 5c 07 00 00       	push   $0x75c
  50:	e8 98 01 00 00       	call   1ed <strchr>
  55:	83 c4 10             	add    $0x10,%esp
  58:	85 c0                	test   %eax,%eax
  5a:	75 c9                	jne    25 <wc+0x25>
  5c:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  60:	75 ca                	jne    2c <wc+0x2c>
  62:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
  66:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
  6d:	eb bd                	jmp    2c <wc+0x2c>
  6f:	01 5d dc             	add    %ebx,-0x24(%ebp)
  72:	83 ec 04             	sub    $0x4,%esp
  75:	68 00 02 00 00       	push   $0x200
  7a:	68 a0 0a 00 00       	push   $0xaa0
  7f:	ff 75 08             	push   0x8(%ebp)
  82:	e8 b8 02 00 00       	call   33f <read>
  87:	89 c7                	mov    %eax,%edi
  89:	83 c4 10             	add    $0x10,%esp
  8c:	85 c0                	test   %eax,%eax
  8e:	7e 07                	jle    97 <wc+0x97>
  90:	bb 00 00 00 00       	mov    $0x0,%ebx
  95:	eb 9c                	jmp    33 <wc+0x33>
  97:	78 24                	js     bd <wc+0xbd>
  99:	83 ec 08             	sub    $0x8,%esp
  9c:	ff 75 0c             	push   0xc(%ebp)
  9f:	ff 75 dc             	push   -0x24(%ebp)
  a2:	ff 75 e0             	push   -0x20(%ebp)
  a5:	56                   	push   %esi
  a6:	68 72 07 00 00       	push   $0x772
  ab:	6a 01                	push   $0x1
  ad:	e8 b5 03 00 00       	call   467 <printf>
  b2:	83 c4 20             	add    $0x20,%esp
  b5:	8d 65 f4             	lea    -0xc(%ebp),%esp
  b8:	5b                   	pop    %ebx
  b9:	5e                   	pop    %esi
  ba:	5f                   	pop    %edi
  bb:	5d                   	pop    %ebp
  bc:	c3                   	ret
  bd:	83 ec 08             	sub    $0x8,%esp
  c0:	68 62 07 00 00       	push   $0x762
  c5:	6a 01                	push   $0x1
  c7:	e8 9b 03 00 00       	call   467 <printf>
  cc:	e8 56 02 00 00       	call   327 <exit>

000000d1 <main>:
  d1:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  d5:	83 e4 f0             	and    $0xfffffff0,%esp
  d8:	ff 71 fc             	push   -0x4(%ecx)
  db:	55                   	push   %ebp
  dc:	89 e5                	mov    %esp,%ebp
  de:	57                   	push   %edi
  df:	56                   	push   %esi
  e0:	53                   	push   %ebx
  e1:	51                   	push   %ecx
  e2:	83 ec 18             	sub    $0x18,%esp
  e5:	8b 01                	mov    (%ecx),%eax
  e7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  ea:	8b 71 04             	mov    0x4(%ecx),%esi
  ed:	83 c6 04             	add    $0x4,%esi
  f0:	bf 01 00 00 00       	mov    $0x1,%edi
  f5:	83 f8 01             	cmp    $0x1,%eax
  f8:	7e 3b                	jle    135 <main+0x64>
  fa:	83 ec 08             	sub    $0x8,%esp
  fd:	6a 00                	push   $0x0
  ff:	ff 36                	push   (%esi)
 101:	e8 61 02 00 00       	call   367 <open>
 106:	89 c3                	mov    %eax,%ebx
 108:	83 c4 10             	add    $0x10,%esp
 10b:	85 c0                	test   %eax,%eax
 10d:	78 3a                	js     149 <main+0x78>
 10f:	83 ec 08             	sub    $0x8,%esp
 112:	ff 36                	push   (%esi)
 114:	50                   	push   %eax
 115:	e8 e6 fe ff ff       	call   0 <wc>
 11a:	89 1c 24             	mov    %ebx,(%esp)
 11d:	e8 2d 02 00 00       	call   34f <close>
 122:	83 c7 01             	add    $0x1,%edi
 125:	83 c6 04             	add    $0x4,%esi
 128:	83 c4 10             	add    $0x10,%esp
 12b:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
 12e:	75 ca                	jne    fa <main+0x29>
 130:	e8 f2 01 00 00       	call   327 <exit>
 135:	83 ec 08             	sub    $0x8,%esp
 138:	68 71 07 00 00       	push   $0x771
 13d:	6a 00                	push   $0x0
 13f:	e8 bc fe ff ff       	call   0 <wc>
 144:	e8 de 01 00 00       	call   327 <exit>
 149:	83 ec 04             	sub    $0x4,%esp
 14c:	ff 36                	push   (%esi)
 14e:	68 7f 07 00 00       	push   $0x77f
 153:	6a 01                	push   $0x1
 155:	e8 0d 03 00 00       	call   467 <printf>
 15a:	e8 c8 01 00 00       	call   327 <exit>

0000015f <strcpy>:
 15f:	55                   	push   %ebp
 160:	89 e5                	mov    %esp,%ebp
 162:	53                   	push   %ebx
 163:	8b 4d 08             	mov    0x8(%ebp),%ecx
 166:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 169:	b8 00 00 00 00       	mov    $0x0,%eax
 16e:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 172:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 175:	83 c0 01             	add    $0x1,%eax
 178:	84 d2                	test   %dl,%dl
 17a:	75 f2                	jne    16e <strcpy+0xf>
 17c:	89 c8                	mov    %ecx,%eax
 17e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 181:	c9                   	leave
 182:	c3                   	ret

00000183 <strcmp>:
 183:	55                   	push   %ebp
 184:	89 e5                	mov    %esp,%ebp
 186:	8b 4d 08             	mov    0x8(%ebp),%ecx
 189:	8b 55 0c             	mov    0xc(%ebp),%edx
 18c:	0f b6 01             	movzbl (%ecx),%eax
 18f:	84 c0                	test   %al,%al
 191:	74 11                	je     1a4 <strcmp+0x21>
 193:	38 02                	cmp    %al,(%edx)
 195:	75 0d                	jne    1a4 <strcmp+0x21>
 197:	83 c1 01             	add    $0x1,%ecx
 19a:	83 c2 01             	add    $0x1,%edx
 19d:	0f b6 01             	movzbl (%ecx),%eax
 1a0:	84 c0                	test   %al,%al
 1a2:	75 ef                	jne    193 <strcmp+0x10>
 1a4:	0f b6 c0             	movzbl %al,%eax
 1a7:	0f b6 12             	movzbl (%edx),%edx
 1aa:	29 d0                	sub    %edx,%eax
 1ac:	5d                   	pop    %ebp
 1ad:	c3                   	ret

000001ae <strlen>:
 1ae:	55                   	push   %ebp
 1af:	89 e5                	mov    %esp,%ebp
 1b1:	8b 55 08             	mov    0x8(%ebp),%edx
 1b4:	80 3a 00             	cmpb   $0x0,(%edx)
 1b7:	74 14                	je     1cd <strlen+0x1f>
 1b9:	b8 00 00 00 00       	mov    $0x0,%eax
 1be:	83 c0 01             	add    $0x1,%eax
 1c1:	89 c1                	mov    %eax,%ecx
 1c3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 1c7:	75 f5                	jne    1be <strlen+0x10>
 1c9:	89 c8                	mov    %ecx,%eax
 1cb:	5d                   	pop    %ebp
 1cc:	c3                   	ret
 1cd:	b9 00 00 00 00       	mov    $0x0,%ecx
 1d2:	eb f5                	jmp    1c9 <strlen+0x1b>

000001d4 <memset>:
 1d4:	55                   	push   %ebp
 1d5:	89 e5                	mov    %esp,%ebp
 1d7:	57                   	push   %edi
 1d8:	8b 55 08             	mov    0x8(%ebp),%edx
 1db:	89 d7                	mov    %edx,%edi
 1dd:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1e0:	8b 45 0c             	mov    0xc(%ebp),%eax
 1e3:	fc                   	cld
 1e4:	f3 aa                	rep stos %al,%es:(%edi)
 1e6:	89 d0                	mov    %edx,%eax
 1e8:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1eb:	c9                   	leave
 1ec:	c3                   	ret

000001ed <strchr>:
 1ed:	55                   	push   %ebp
 1ee:	89 e5                	mov    %esp,%ebp
 1f0:	8b 45 08             	mov    0x8(%ebp),%eax
 1f3:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
 1f7:	0f b6 10             	movzbl (%eax),%edx
 1fa:	84 d2                	test   %dl,%dl
 1fc:	74 15                	je     213 <strchr+0x26>
 1fe:	38 d1                	cmp    %dl,%cl
 200:	74 0f                	je     211 <strchr+0x24>
 202:	83 c0 01             	add    $0x1,%eax
 205:	0f b6 10             	movzbl (%eax),%edx
 208:	84 d2                	test   %dl,%dl
 20a:	75 f2                	jne    1fe <strchr+0x11>
 20c:	b8 00 00 00 00       	mov    $0x0,%eax
 211:	5d                   	pop    %ebp
 212:	c3                   	ret
 213:	b8 00 00 00 00       	mov    $0x0,%eax
 218:	eb f7                	jmp    211 <strchr+0x24>

0000021a <gets>:
 21a:	55                   	push   %ebp
 21b:	89 e5                	mov    %esp,%ebp
 21d:	57                   	push   %edi
 21e:	56                   	push   %esi
 21f:	53                   	push   %ebx
 220:	83 ec 2c             	sub    $0x2c,%esp
 223:	8b 75 08             	mov    0x8(%ebp),%esi
 226:	bb 00 00 00 00       	mov    $0x0,%ebx
 22b:	8d 7d e7             	lea    -0x19(%ebp),%edi
 22e:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 231:	83 c3 01             	add    $0x1,%ebx
 234:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 237:	7d 27                	jge    260 <gets+0x46>
 239:	83 ec 04             	sub    $0x4,%esp
 23c:	6a 01                	push   $0x1
 23e:	57                   	push   %edi
 23f:	6a 00                	push   $0x0
 241:	e8 f9 00 00 00       	call   33f <read>
 246:	83 c4 10             	add    $0x10,%esp
 249:	85 c0                	test   %eax,%eax
 24b:	7e 13                	jle    260 <gets+0x46>
 24d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 251:	88 44 1e ff          	mov    %al,-0x1(%esi,%ebx,1)
 255:	3c 0a                	cmp    $0xa,%al
 257:	74 04                	je     25d <gets+0x43>
 259:	3c 0d                	cmp    $0xd,%al
 25b:	75 d1                	jne    22e <gets+0x14>
 25d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 260:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 263:	c6 04 06 00          	movb   $0x0,(%esi,%eax,1)
 267:	89 f0                	mov    %esi,%eax
 269:	8d 65 f4             	lea    -0xc(%ebp),%esp
 26c:	5b                   	pop    %ebx
 26d:	5e                   	pop    %esi
 26e:	5f                   	pop    %edi
 26f:	5d                   	pop    %ebp
 270:	c3                   	ret

00000271 <stat>:
 271:	55                   	push   %ebp
 272:	89 e5                	mov    %esp,%ebp
 274:	56                   	push   %esi
 275:	53                   	push   %ebx
 276:	83 ec 08             	sub    $0x8,%esp
 279:	6a 00                	push   $0x0
 27b:	ff 75 08             	push   0x8(%ebp)
 27e:	e8 e4 00 00 00       	call   367 <open>
 283:	83 c4 10             	add    $0x10,%esp
 286:	85 c0                	test   %eax,%eax
 288:	78 24                	js     2ae <stat+0x3d>
 28a:	89 c3                	mov    %eax,%ebx
 28c:	83 ec 08             	sub    $0x8,%esp
 28f:	ff 75 0c             	push   0xc(%ebp)
 292:	50                   	push   %eax
 293:	e8 e7 00 00 00       	call   37f <fstat>
 298:	89 c6                	mov    %eax,%esi
 29a:	89 1c 24             	mov    %ebx,(%esp)
 29d:	e8 ad 00 00 00       	call   34f <close>
 2a2:	83 c4 10             	add    $0x10,%esp
 2a5:	89 f0                	mov    %esi,%eax
 2a7:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2aa:	5b                   	pop    %ebx
 2ab:	5e                   	pop    %esi
 2ac:	5d                   	pop    %ebp
 2ad:	c3                   	ret
 2ae:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2b3:	eb f0                	jmp    2a5 <stat+0x34>

000002b5 <atoi>:
 2b5:	55                   	push   %ebp
 2b6:	89 e5                	mov    %esp,%ebp
 2b8:	53                   	push   %ebx
 2b9:	8b 55 08             	mov    0x8(%ebp),%edx
 2bc:	0f b6 02             	movzbl (%edx),%eax
 2bf:	8d 48 d0             	lea    -0x30(%eax),%ecx
 2c2:	80 f9 09             	cmp    $0x9,%cl
 2c5:	77 24                	ja     2eb <atoi+0x36>
 2c7:	b9 00 00 00 00       	mov    $0x0,%ecx
 2cc:	83 c2 01             	add    $0x1,%edx
 2cf:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 2d2:	0f be c0             	movsbl %al,%eax
 2d5:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
 2d9:	0f b6 02             	movzbl (%edx),%eax
 2dc:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2df:	80 fb 09             	cmp    $0x9,%bl
 2e2:	76 e8                	jbe    2cc <atoi+0x17>
 2e4:	89 c8                	mov    %ecx,%eax
 2e6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2e9:	c9                   	leave
 2ea:	c3                   	ret
 2eb:	b9 00 00 00 00       	mov    $0x0,%ecx
 2f0:	eb f2                	jmp    2e4 <atoi+0x2f>

000002f2 <memmove>:
 2f2:	55                   	push   %ebp
 2f3:	89 e5                	mov    %esp,%ebp
 2f5:	56                   	push   %esi
 2f6:	53                   	push   %ebx
 2f7:	8b 75 08             	mov    0x8(%ebp),%esi
 2fa:	8b 55 0c             	mov    0xc(%ebp),%edx
 2fd:	8b 5d 10             	mov    0x10(%ebp),%ebx
 300:	85 db                	test   %ebx,%ebx
 302:	7e 15                	jle    319 <memmove+0x27>
 304:	01 f3                	add    %esi,%ebx
 306:	89 f0                	mov    %esi,%eax
 308:	83 c2 01             	add    $0x1,%edx
 30b:	83 c0 01             	add    $0x1,%eax
 30e:	0f b6 4a ff          	movzbl -0x1(%edx),%ecx
 312:	88 48 ff             	mov    %cl,-0x1(%eax)
 315:	39 c3                	cmp    %eax,%ebx
 317:	75 ef                	jne    308 <memmove+0x16>
 319:	89 f0                	mov    %esi,%eax
 31b:	5b                   	pop    %ebx
 31c:	5e                   	pop    %esi
 31d:	5d                   	pop    %ebp
 31e:	c3                   	ret

0000031f <fork>:
  name: \
    movl $1, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALLFORK(fork) //instead of SYSCALL(fork) !!!
 31f:	b8 01 00 00 00       	mov    $0x1,%eax
 324:	cd 40                	int    $0x40
 326:	c3                   	ret

00000327 <exit>:
//SYSCALL(fork)
SYSCALL(exit)
 327:	b8 02 00 00 00       	mov    $0x2,%eax
 32c:	cd 40                	int    $0x40
 32e:	c3                   	ret

0000032f <wait>:
SYSCALL(wait)
 32f:	b8 03 00 00 00       	mov    $0x3,%eax
 334:	cd 40                	int    $0x40
 336:	c3                   	ret

00000337 <pipe>:
SYSCALL(pipe)
 337:	b8 04 00 00 00       	mov    $0x4,%eax
 33c:	cd 40                	int    $0x40
 33e:	c3                   	ret

0000033f <read>:
SYSCALL(read)
 33f:	b8 05 00 00 00       	mov    $0x5,%eax
 344:	cd 40                	int    $0x40
 346:	c3                   	ret

00000347 <write>:
SYSCALL(write)
 347:	b8 10 00 00 00       	mov    $0x10,%eax
 34c:	cd 40                	int    $0x40
 34e:	c3                   	ret

0000034f <close>:
SYSCALL(close)
 34f:	b8 15 00 00 00       	mov    $0x15,%eax
 354:	cd 40                	int    $0x40
 356:	c3                   	ret

00000357 <kill>:
SYSCALL(kill)
 357:	b8 06 00 00 00       	mov    $0x6,%eax
 35c:	cd 40                	int    $0x40
 35e:	c3                   	ret

0000035f <exec>:
SYSCALL(exec)
 35f:	b8 07 00 00 00       	mov    $0x7,%eax
 364:	cd 40                	int    $0x40
 366:	c3                   	ret

00000367 <open>:
SYSCALL(open)
 367:	b8 0f 00 00 00       	mov    $0xf,%eax
 36c:	cd 40                	int    $0x40
 36e:	c3                   	ret

0000036f <mknod>:
SYSCALL(mknod)
 36f:	b8 11 00 00 00       	mov    $0x11,%eax
 374:	cd 40                	int    $0x40
 376:	c3                   	ret

00000377 <unlink>:
SYSCALL(unlink)
 377:	b8 12 00 00 00       	mov    $0x12,%eax
 37c:	cd 40                	int    $0x40
 37e:	c3                   	ret

0000037f <fstat>:
SYSCALL(fstat)
 37f:	b8 08 00 00 00       	mov    $0x8,%eax
 384:	cd 40                	int    $0x40
 386:	c3                   	ret

00000387 <link>:
SYSCALL(link)
 387:	b8 13 00 00 00       	mov    $0x13,%eax
 38c:	cd 40                	int    $0x40
 38e:	c3                   	ret

0000038f <mkdir>:
SYSCALL(mkdir)
 38f:	b8 14 00 00 00       	mov    $0x14,%eax
 394:	cd 40                	int    $0x40
 396:	c3                   	ret

00000397 <chdir>:
SYSCALL(chdir)
 397:	b8 09 00 00 00       	mov    $0x9,%eax
 39c:	cd 40                	int    $0x40
 39e:	c3                   	ret

0000039f <dup>:
SYSCALL(dup)
 39f:	b8 0a 00 00 00       	mov    $0xa,%eax
 3a4:	cd 40                	int    $0x40
 3a6:	c3                   	ret

000003a7 <getpid>:
SYSCALL(getpid)
 3a7:	b8 0b 00 00 00       	mov    $0xb,%eax
 3ac:	cd 40                	int    $0x40
 3ae:	c3                   	ret

000003af <sbrk>:
SYSCALL(sbrk)
 3af:	b8 0c 00 00 00       	mov    $0xc,%eax
 3b4:	cd 40                	int    $0x40
 3b6:	c3                   	ret

000003b7 <sleep>:
SYSCALL(sleep)
 3b7:	b8 0d 00 00 00       	mov    $0xd,%eax
 3bc:	cd 40                	int    $0x40
 3be:	c3                   	ret

000003bf <uptime>:
SYSCALL(uptime)
 3bf:	b8 0e 00 00 00       	mov    $0xe,%eax
 3c4:	cd 40                	int    $0x40
 3c6:	c3                   	ret

000003c7 <ps>:
SYSCALL(ps)
 3c7:	b8 16 00 00 00       	mov    $0x16,%eax
 3cc:	cd 40                	int    $0x40
 3ce:	c3                   	ret

000003cf <printint>:
 3cf:	55                   	push   %ebp
 3d0:	89 e5                	mov    %esp,%ebp
 3d2:	57                   	push   %edi
 3d3:	56                   	push   %esi
 3d4:	53                   	push   %ebx
 3d5:	83 ec 3c             	sub    $0x3c,%esp
 3d8:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 3db:	89 ce                	mov    %ecx,%esi
 3dd:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 3e1:	74 79                	je     45c <printint+0x8d>
 3e3:	85 d2                	test   %edx,%edx
 3e5:	79 75                	jns    45c <printint+0x8d>
 3e7:	89 d1                	mov    %edx,%ecx
 3e9:	f7 d9                	neg    %ecx
 3eb:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
 3f2:	bb 00 00 00 00       	mov    $0x0,%ebx
 3f7:	89 df                	mov    %ebx,%edi
 3f9:	83 c3 01             	add    $0x1,%ebx
 3fc:	89 c8                	mov    %ecx,%eax
 3fe:	ba 00 00 00 00       	mov    $0x0,%edx
 403:	f7 f6                	div    %esi
 405:	0f b6 92 f4 07 00 00 	movzbl 0x7f4(%edx),%edx
 40c:	88 54 1d d7          	mov    %dl,-0x29(%ebp,%ebx,1)
 410:	89 ca                	mov    %ecx,%edx
 412:	89 c1                	mov    %eax,%ecx
 414:	39 f2                	cmp    %esi,%edx
 416:	73 df                	jae    3f7 <printint+0x28>
 418:	83 7d c0 00          	cmpl   $0x0,-0x40(%ebp)
 41c:	74 08                	je     426 <printint+0x57>
 41e:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 423:	8d 5f 02             	lea    0x2(%edi),%ebx
 426:	85 db                	test   %ebx,%ebx
 428:	7e 2a                	jle    454 <printint+0x85>
 42a:	8d 75 d8             	lea    -0x28(%ebp),%esi
 42d:	8d 5c 1d d7          	lea    -0x29(%ebp,%ebx,1),%ebx
 431:	8d 7d d7             	lea    -0x29(%ebp),%edi
 434:	0f b6 03             	movzbl (%ebx),%eax
 437:	88 45 d7             	mov    %al,-0x29(%ebp)
 43a:	83 ec 04             	sub    $0x4,%esp
 43d:	6a 01                	push   $0x1
 43f:	57                   	push   %edi
 440:	ff 75 c4             	push   -0x3c(%ebp)
 443:	e8 ff fe ff ff       	call   347 <write>
 448:	89 d8                	mov    %ebx,%eax
 44a:	83 eb 01             	sub    $0x1,%ebx
 44d:	83 c4 10             	add    $0x10,%esp
 450:	39 f0                	cmp    %esi,%eax
 452:	75 e0                	jne    434 <printint+0x65>
 454:	8d 65 f4             	lea    -0xc(%ebp),%esp
 457:	5b                   	pop    %ebx
 458:	5e                   	pop    %esi
 459:	5f                   	pop    %edi
 45a:	5d                   	pop    %ebp
 45b:	c3                   	ret
 45c:	89 d1                	mov    %edx,%ecx
 45e:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
 465:	eb 8b                	jmp    3f2 <printint+0x23>

00000467 <printf>:
 467:	55                   	push   %ebp
 468:	89 e5                	mov    %esp,%ebp
 46a:	57                   	push   %edi
 46b:	56                   	push   %esi
 46c:	53                   	push   %ebx
 46d:	83 ec 2c             	sub    $0x2c,%esp
 470:	8b 75 0c             	mov    0xc(%ebp),%esi
 473:	0f b6 1e             	movzbl (%esi),%ebx
 476:	84 db                	test   %bl,%bl
 478:	0f 84 9e 01 00 00    	je     61c <printf+0x1b5>
 47e:	83 c6 01             	add    $0x1,%esi
 481:	8d 45 10             	lea    0x10(%ebp),%eax
 484:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 487:	bf 00 00 00 00       	mov    $0x0,%edi
 48c:	eb 2d                	jmp    4bb <printf+0x54>
 48e:	88 5d e7             	mov    %bl,-0x19(%ebp)
 491:	83 ec 04             	sub    $0x4,%esp
 494:	6a 01                	push   $0x1
 496:	8d 45 e7             	lea    -0x19(%ebp),%eax
 499:	50                   	push   %eax
 49a:	ff 75 08             	push   0x8(%ebp)
 49d:	e8 a5 fe ff ff       	call   347 <write>
 4a2:	83 c4 10             	add    $0x10,%esp
 4a5:	eb 05                	jmp    4ac <printf+0x45>
 4a7:	83 ff 25             	cmp    $0x25,%edi
 4aa:	74 1f                	je     4cb <printf+0x64>
 4ac:	83 c6 01             	add    $0x1,%esi
 4af:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 4b3:	84 db                	test   %bl,%bl
 4b5:	0f 84 61 01 00 00    	je     61c <printf+0x1b5>
 4bb:	0f b6 c3             	movzbl %bl,%eax
 4be:	85 ff                	test   %edi,%edi
 4c0:	75 e5                	jne    4a7 <printf+0x40>
 4c2:	83 f8 25             	cmp    $0x25,%eax
 4c5:	75 c7                	jne    48e <printf+0x27>
 4c7:	89 c7                	mov    %eax,%edi
 4c9:	eb e1                	jmp    4ac <printf+0x45>
 4cb:	83 f8 25             	cmp    $0x25,%eax
 4ce:	0f 84 f4 00 00 00    	je     5c8 <printf+0x161>
 4d4:	8d 50 9d             	lea    -0x63(%eax),%edx
 4d7:	83 fa 15             	cmp    $0x15,%edx
 4da:	0f 87 09 01 00 00    	ja     5e9 <printf+0x182>
 4e0:	0f 87 03 01 00 00    	ja     5e9 <printf+0x182>
 4e6:	ff 24 95 9c 07 00 00 	jmp    *0x79c(,%edx,4)
 4ed:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 4f0:	8b 17                	mov    (%edi),%edx
 4f2:	83 ec 0c             	sub    $0xc,%esp
 4f5:	6a 01                	push   $0x1
 4f7:	b9 0a 00 00 00       	mov    $0xa,%ecx
 4fc:	8b 45 08             	mov    0x8(%ebp),%eax
 4ff:	e8 cb fe ff ff       	call   3cf <printint>
 504:	83 c7 04             	add    $0x4,%edi
 507:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 50a:	83 c4 10             	add    $0x10,%esp
 50d:	bf 00 00 00 00       	mov    $0x0,%edi
 512:	eb 98                	jmp    4ac <printf+0x45>
 514:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 517:	8b 17                	mov    (%edi),%edx
 519:	83 ec 0c             	sub    $0xc,%esp
 51c:	6a 00                	push   $0x0
 51e:	b9 10 00 00 00       	mov    $0x10,%ecx
 523:	8b 45 08             	mov    0x8(%ebp),%eax
 526:	e8 a4 fe ff ff       	call   3cf <printint>
 52b:	83 c7 04             	add    $0x4,%edi
 52e:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 531:	83 c4 10             	add    $0x10,%esp
 534:	bf 00 00 00 00       	mov    $0x0,%edi
 539:	e9 6e ff ff ff       	jmp    4ac <printf+0x45>
 53e:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
 541:	8b 01                	mov    (%ecx),%eax
 543:	83 c1 04             	add    $0x4,%ecx
 546:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 549:	85 c0                	test   %eax,%eax
 54b:	74 13                	je     560 <printf+0xf9>
 54d:	89 c3                	mov    %eax,%ebx
 54f:	0f b6 00             	movzbl (%eax),%eax
 552:	bf 00 00 00 00       	mov    $0x0,%edi
 557:	84 c0                	test   %al,%al
 559:	75 0f                	jne    56a <printf+0x103>
 55b:	e9 4c ff ff ff       	jmp    4ac <printf+0x45>
 560:	bb 93 07 00 00       	mov    $0x793,%ebx
 565:	b8 28 00 00 00       	mov    $0x28,%eax
 56a:	8d 7d e7             	lea    -0x19(%ebp),%edi
 56d:	89 75 d0             	mov    %esi,-0x30(%ebp)
 570:	8b 75 08             	mov    0x8(%ebp),%esi
 573:	88 45 e7             	mov    %al,-0x19(%ebp)
 576:	83 ec 04             	sub    $0x4,%esp
 579:	6a 01                	push   $0x1
 57b:	57                   	push   %edi
 57c:	56                   	push   %esi
 57d:	e8 c5 fd ff ff       	call   347 <write>
 582:	83 c3 01             	add    $0x1,%ebx
 585:	0f b6 03             	movzbl (%ebx),%eax
 588:	83 c4 10             	add    $0x10,%esp
 58b:	84 c0                	test   %al,%al
 58d:	75 e4                	jne    573 <printf+0x10c>
 58f:	8b 75 d0             	mov    -0x30(%ebp),%esi
 592:	bf 00 00 00 00       	mov    $0x0,%edi
 597:	e9 10 ff ff ff       	jmp    4ac <printf+0x45>
 59c:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 59f:	8b 07                	mov    (%edi),%eax
 5a1:	88 45 e7             	mov    %al,-0x19(%ebp)
 5a4:	83 ec 04             	sub    $0x4,%esp
 5a7:	6a 01                	push   $0x1
 5a9:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5ac:	50                   	push   %eax
 5ad:	ff 75 08             	push   0x8(%ebp)
 5b0:	e8 92 fd ff ff       	call   347 <write>
 5b5:	83 c7 04             	add    $0x4,%edi
 5b8:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 5bb:	83 c4 10             	add    $0x10,%esp
 5be:	bf 00 00 00 00       	mov    $0x0,%edi
 5c3:	e9 e4 fe ff ff       	jmp    4ac <printf+0x45>
 5c8:	88 5d e7             	mov    %bl,-0x19(%ebp)
 5cb:	83 ec 04             	sub    $0x4,%esp
 5ce:	6a 01                	push   $0x1
 5d0:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5d3:	50                   	push   %eax
 5d4:	ff 75 08             	push   0x8(%ebp)
 5d7:	e8 6b fd ff ff       	call   347 <write>
 5dc:	83 c4 10             	add    $0x10,%esp
 5df:	bf 00 00 00 00       	mov    $0x0,%edi
 5e4:	e9 c3 fe ff ff       	jmp    4ac <printf+0x45>
 5e9:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 5ed:	83 ec 04             	sub    $0x4,%esp
 5f0:	6a 01                	push   $0x1
 5f2:	8d 7d e7             	lea    -0x19(%ebp),%edi
 5f5:	57                   	push   %edi
 5f6:	ff 75 08             	push   0x8(%ebp)
 5f9:	e8 49 fd ff ff       	call   347 <write>
 5fe:	88 5d e7             	mov    %bl,-0x19(%ebp)
 601:	83 c4 0c             	add    $0xc,%esp
 604:	6a 01                	push   $0x1
 606:	57                   	push   %edi
 607:	ff 75 08             	push   0x8(%ebp)
 60a:	e8 38 fd ff ff       	call   347 <write>
 60f:	83 c4 10             	add    $0x10,%esp
 612:	bf 00 00 00 00       	mov    $0x0,%edi
 617:	e9 90 fe ff ff       	jmp    4ac <printf+0x45>
 61c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 61f:	5b                   	pop    %ebx
 620:	5e                   	pop    %esi
 621:	5f                   	pop    %edi
 622:	5d                   	pop    %ebp
 623:	c3                   	ret

00000624 <free>:
 624:	55                   	push   %ebp
 625:	89 e5                	mov    %esp,%ebp
 627:	57                   	push   %edi
 628:	56                   	push   %esi
 629:	53                   	push   %ebx
 62a:	8b 5d 08             	mov    0x8(%ebp),%ebx
 62d:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 630:	a1 a0 0c 00 00       	mov    0xca0,%eax
 635:	eb 0c                	jmp    643 <free+0x1f>
 637:	8b 10                	mov    (%eax),%edx
 639:	39 d0                	cmp    %edx,%eax
 63b:	72 04                	jb     641 <free+0x1d>
 63d:	39 d1                	cmp    %edx,%ecx
 63f:	72 10                	jb     651 <free+0x2d>
 641:	89 d0                	mov    %edx,%eax
 643:	39 c8                	cmp    %ecx,%eax
 645:	73 f0                	jae    637 <free+0x13>
 647:	8b 10                	mov    (%eax),%edx
 649:	39 d1                	cmp    %edx,%ecx
 64b:	72 04                	jb     651 <free+0x2d>
 64d:	39 d0                	cmp    %edx,%eax
 64f:	72 f0                	jb     641 <free+0x1d>
 651:	8b 73 fc             	mov    -0x4(%ebx),%esi
 654:	8b 10                	mov    (%eax),%edx
 656:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 659:	39 fa                	cmp    %edi,%edx
 65b:	74 19                	je     676 <free+0x52>
 65d:	89 53 f8             	mov    %edx,-0x8(%ebx)
 660:	8b 50 04             	mov    0x4(%eax),%edx
 663:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 666:	39 f1                	cmp    %esi,%ecx
 668:	74 18                	je     682 <free+0x5e>
 66a:	89 08                	mov    %ecx,(%eax)
 66c:	a3 a0 0c 00 00       	mov    %eax,0xca0
 671:	5b                   	pop    %ebx
 672:	5e                   	pop    %esi
 673:	5f                   	pop    %edi
 674:	5d                   	pop    %ebp
 675:	c3                   	ret
 676:	03 72 04             	add    0x4(%edx),%esi
 679:	89 73 fc             	mov    %esi,-0x4(%ebx)
 67c:	8b 10                	mov    (%eax),%edx
 67e:	8b 12                	mov    (%edx),%edx
 680:	eb db                	jmp    65d <free+0x39>
 682:	03 53 fc             	add    -0x4(%ebx),%edx
 685:	89 50 04             	mov    %edx,0x4(%eax)
 688:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 68b:	eb dd                	jmp    66a <free+0x46>

0000068d <malloc>:
 68d:	55                   	push   %ebp
 68e:	89 e5                	mov    %esp,%ebp
 690:	57                   	push   %edi
 691:	56                   	push   %esi
 692:	53                   	push   %ebx
 693:	83 ec 0c             	sub    $0xc,%esp
 696:	8b 45 08             	mov    0x8(%ebp),%eax
 699:	8d 58 07             	lea    0x7(%eax),%ebx
 69c:	c1 eb 03             	shr    $0x3,%ebx
 69f:	83 c3 01             	add    $0x1,%ebx
 6a2:	8b 15 a0 0c 00 00    	mov    0xca0,%edx
 6a8:	85 d2                	test   %edx,%edx
 6aa:	74 1c                	je     6c8 <malloc+0x3b>
 6ac:	8b 02                	mov    (%edx),%eax
 6ae:	8b 48 04             	mov    0x4(%eax),%ecx
 6b1:	39 d9                	cmp    %ebx,%ecx
 6b3:	73 38                	jae    6ed <malloc+0x60>
 6b5:	be 00 10 00 00       	mov    $0x1000,%esi
 6ba:	39 f3                	cmp    %esi,%ebx
 6bc:	0f 43 f3             	cmovae %ebx,%esi
 6bf:	8d 3c f5 00 00 00 00 	lea    0x0(,%esi,8),%edi
 6c6:	eb 72                	jmp    73a <malloc+0xad>
 6c8:	c7 05 a0 0c 00 00 a4 	movl   $0xca4,0xca0
 6cf:	0c 00 00 
 6d2:	c7 05 a4 0c 00 00 a4 	movl   $0xca4,0xca4
 6d9:	0c 00 00 
 6dc:	c7 05 a8 0c 00 00 00 	movl   $0x0,0xca8
 6e3:	00 00 00 
 6e6:	b8 a4 0c 00 00       	mov    $0xca4,%eax
 6eb:	eb c8                	jmp    6b5 <malloc+0x28>
 6ed:	39 cb                	cmp    %ecx,%ebx
 6ef:	74 1e                	je     70f <malloc+0x82>
 6f1:	29 d9                	sub    %ebx,%ecx
 6f3:	89 48 04             	mov    %ecx,0x4(%eax)
 6f6:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 6f9:	89 58 04             	mov    %ebx,0x4(%eax)
 6fc:	89 15 a0 0c 00 00    	mov    %edx,0xca0
 702:	8d 50 08             	lea    0x8(%eax),%edx
 705:	89 d0                	mov    %edx,%eax
 707:	8d 65 f4             	lea    -0xc(%ebp),%esp
 70a:	5b                   	pop    %ebx
 70b:	5e                   	pop    %esi
 70c:	5f                   	pop    %edi
 70d:	5d                   	pop    %ebp
 70e:	c3                   	ret
 70f:	8b 08                	mov    (%eax),%ecx
 711:	89 0a                	mov    %ecx,(%edx)
 713:	eb e7                	jmp    6fc <malloc+0x6f>
 715:	89 70 04             	mov    %esi,0x4(%eax)
 718:	83 ec 0c             	sub    $0xc,%esp
 71b:	83 c0 08             	add    $0x8,%eax
 71e:	50                   	push   %eax
 71f:	e8 00 ff ff ff       	call   624 <free>
 724:	8b 15 a0 0c 00 00    	mov    0xca0,%edx
 72a:	83 c4 10             	add    $0x10,%esp
 72d:	85 d2                	test   %edx,%edx
 72f:	74 d4                	je     705 <malloc+0x78>
 731:	8b 02                	mov    (%edx),%eax
 733:	8b 48 04             	mov    0x4(%eax),%ecx
 736:	39 d9                	cmp    %ebx,%ecx
 738:	73 b3                	jae    6ed <malloc+0x60>
 73a:	89 c2                	mov    %eax,%edx
 73c:	39 05 a0 0c 00 00    	cmp    %eax,0xca0
 742:	75 ed                	jne    731 <malloc+0xa4>
 744:	83 ec 0c             	sub    $0xc,%esp
 747:	57                   	push   %edi
 748:	e8 62 fc ff ff       	call   3af <sbrk>
 74d:	83 c4 10             	add    $0x10,%esp
 750:	83 f8 ff             	cmp    $0xffffffff,%eax
 753:	75 c0                	jne    715 <malloc+0x88>
 755:	ba 00 00 00 00       	mov    $0x0,%edx
 75a:	eb a9                	jmp    705 <malloc+0x78>
