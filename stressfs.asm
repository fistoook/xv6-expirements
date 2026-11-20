
_stressfs:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	81 ec 20 02 00 00    	sub    $0x220,%esp
  17:	c7 45 de 73 74 72 65 	movl   $0x65727473,-0x22(%ebp)
  1e:	c7 45 e2 73 73 66 73 	movl   $0x73667373,-0x1e(%ebp)
  25:	66 c7 45 e6 30 00    	movw   $0x30,-0x1a(%ebp)
  2b:	68 10 07 00 00       	push   $0x710
  30:	6a 01                	push   $0x1
  32:	e8 e2 03 00 00       	call   419 <printf>
  37:	83 c4 0c             	add    $0xc,%esp
  3a:	68 00 02 00 00       	push   $0x200
  3f:	6a 61                	push   $0x61
  41:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  47:	50                   	push   %eax
  48:	e8 39 01 00 00       	call   186 <memset>
  4d:	83 c4 10             	add    $0x10,%esp
  50:	bb 00 00 00 00       	mov    $0x0,%ebx
  55:	e8 77 02 00 00       	call   2d1 <fork>
  5a:	85 c0                	test   %eax,%eax
  5c:	7f 08                	jg     66 <main+0x66>
  5e:	83 c3 01             	add    $0x1,%ebx
  61:	83 fb 04             	cmp    $0x4,%ebx
  64:	75 ef                	jne    55 <main+0x55>
  66:	83 ec 04             	sub    $0x4,%esp
  69:	53                   	push   %ebx
  6a:	68 23 07 00 00       	push   $0x723
  6f:	6a 01                	push   $0x1
  71:	e8 a3 03 00 00       	call   419 <printf>
  76:	00 5d e6             	add    %bl,-0x1a(%ebp)
  79:	83 c4 08             	add    $0x8,%esp
  7c:	68 02 02 00 00       	push   $0x202
  81:	8d 45 de             	lea    -0x22(%ebp),%eax
  84:	50                   	push   %eax
  85:	e8 8f 02 00 00       	call   319 <open>
  8a:	89 c6                	mov    %eax,%esi
  8c:	83 c4 10             	add    $0x10,%esp
  8f:	bb 14 00 00 00       	mov    $0x14,%ebx
  94:	8d bd de fd ff ff    	lea    -0x222(%ebp),%edi
  9a:	83 ec 04             	sub    $0x4,%esp
  9d:	68 00 02 00 00       	push   $0x200
  a2:	57                   	push   %edi
  a3:	56                   	push   %esi
  a4:	e8 50 02 00 00       	call   2f9 <write>
  a9:	83 c4 10             	add    $0x10,%esp
  ac:	83 eb 01             	sub    $0x1,%ebx
  af:	75 e9                	jne    9a <main+0x9a>
  b1:	83 ec 0c             	sub    $0xc,%esp
  b4:	56                   	push   %esi
  b5:	e8 47 02 00 00       	call   301 <close>
  ba:	83 c4 08             	add    $0x8,%esp
  bd:	68 2d 07 00 00       	push   $0x72d
  c2:	6a 01                	push   $0x1
  c4:	e8 50 03 00 00       	call   419 <printf>
  c9:	83 c4 08             	add    $0x8,%esp
  cc:	6a 00                	push   $0x0
  ce:	8d 45 de             	lea    -0x22(%ebp),%eax
  d1:	50                   	push   %eax
  d2:	e8 42 02 00 00       	call   319 <open>
  d7:	89 c6                	mov    %eax,%esi
  d9:	83 c4 10             	add    $0x10,%esp
  dc:	bb 14 00 00 00       	mov    $0x14,%ebx
  e1:	8d bd de fd ff ff    	lea    -0x222(%ebp),%edi
  e7:	83 ec 04             	sub    $0x4,%esp
  ea:	68 00 02 00 00       	push   $0x200
  ef:	57                   	push   %edi
  f0:	56                   	push   %esi
  f1:	e8 fb 01 00 00       	call   2f1 <read>
  f6:	83 c4 10             	add    $0x10,%esp
  f9:	83 eb 01             	sub    $0x1,%ebx
  fc:	75 e9                	jne    e7 <main+0xe7>
  fe:	83 ec 0c             	sub    $0xc,%esp
 101:	56                   	push   %esi
 102:	e8 fa 01 00 00       	call   301 <close>
 107:	e8 d5 01 00 00       	call   2e1 <wait>
 10c:	e8 c8 01 00 00       	call   2d9 <exit>

00000111 <strcpy>:
 111:	55                   	push   %ebp
 112:	89 e5                	mov    %esp,%ebp
 114:	53                   	push   %ebx
 115:	8b 4d 08             	mov    0x8(%ebp),%ecx
 118:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 11b:	b8 00 00 00 00       	mov    $0x0,%eax
 120:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 124:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 127:	83 c0 01             	add    $0x1,%eax
 12a:	84 d2                	test   %dl,%dl
 12c:	75 f2                	jne    120 <strcpy+0xf>
 12e:	89 c8                	mov    %ecx,%eax
 130:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 133:	c9                   	leave
 134:	c3                   	ret

00000135 <strcmp>:
 135:	55                   	push   %ebp
 136:	89 e5                	mov    %esp,%ebp
 138:	8b 4d 08             	mov    0x8(%ebp),%ecx
 13b:	8b 55 0c             	mov    0xc(%ebp),%edx
 13e:	0f b6 01             	movzbl (%ecx),%eax
 141:	84 c0                	test   %al,%al
 143:	74 11                	je     156 <strcmp+0x21>
 145:	38 02                	cmp    %al,(%edx)
 147:	75 0d                	jne    156 <strcmp+0x21>
 149:	83 c1 01             	add    $0x1,%ecx
 14c:	83 c2 01             	add    $0x1,%edx
 14f:	0f b6 01             	movzbl (%ecx),%eax
 152:	84 c0                	test   %al,%al
 154:	75 ef                	jne    145 <strcmp+0x10>
 156:	0f b6 c0             	movzbl %al,%eax
 159:	0f b6 12             	movzbl (%edx),%edx
 15c:	29 d0                	sub    %edx,%eax
 15e:	5d                   	pop    %ebp
 15f:	c3                   	ret

00000160 <strlen>:
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	8b 55 08             	mov    0x8(%ebp),%edx
 166:	80 3a 00             	cmpb   $0x0,(%edx)
 169:	74 14                	je     17f <strlen+0x1f>
 16b:	b8 00 00 00 00       	mov    $0x0,%eax
 170:	83 c0 01             	add    $0x1,%eax
 173:	89 c1                	mov    %eax,%ecx
 175:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 179:	75 f5                	jne    170 <strlen+0x10>
 17b:	89 c8                	mov    %ecx,%eax
 17d:	5d                   	pop    %ebp
 17e:	c3                   	ret
 17f:	b9 00 00 00 00       	mov    $0x0,%ecx
 184:	eb f5                	jmp    17b <strlen+0x1b>

00000186 <memset>:
 186:	55                   	push   %ebp
 187:	89 e5                	mov    %esp,%ebp
 189:	57                   	push   %edi
 18a:	8b 55 08             	mov    0x8(%ebp),%edx
 18d:	89 d7                	mov    %edx,%edi
 18f:	8b 4d 10             	mov    0x10(%ebp),%ecx
 192:	8b 45 0c             	mov    0xc(%ebp),%eax
 195:	fc                   	cld
 196:	f3 aa                	rep stos %al,%es:(%edi)
 198:	89 d0                	mov    %edx,%eax
 19a:	8b 7d fc             	mov    -0x4(%ebp),%edi
 19d:	c9                   	leave
 19e:	c3                   	ret

0000019f <strchr>:
 19f:	55                   	push   %ebp
 1a0:	89 e5                	mov    %esp,%ebp
 1a2:	8b 45 08             	mov    0x8(%ebp),%eax
 1a5:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
 1a9:	0f b6 10             	movzbl (%eax),%edx
 1ac:	84 d2                	test   %dl,%dl
 1ae:	74 15                	je     1c5 <strchr+0x26>
 1b0:	38 d1                	cmp    %dl,%cl
 1b2:	74 0f                	je     1c3 <strchr+0x24>
 1b4:	83 c0 01             	add    $0x1,%eax
 1b7:	0f b6 10             	movzbl (%eax),%edx
 1ba:	84 d2                	test   %dl,%dl
 1bc:	75 f2                	jne    1b0 <strchr+0x11>
 1be:	b8 00 00 00 00       	mov    $0x0,%eax
 1c3:	5d                   	pop    %ebp
 1c4:	c3                   	ret
 1c5:	b8 00 00 00 00       	mov    $0x0,%eax
 1ca:	eb f7                	jmp    1c3 <strchr+0x24>

000001cc <gets>:
 1cc:	55                   	push   %ebp
 1cd:	89 e5                	mov    %esp,%ebp
 1cf:	57                   	push   %edi
 1d0:	56                   	push   %esi
 1d1:	53                   	push   %ebx
 1d2:	83 ec 2c             	sub    $0x2c,%esp
 1d5:	8b 75 08             	mov    0x8(%ebp),%esi
 1d8:	bb 00 00 00 00       	mov    $0x0,%ebx
 1dd:	8d 7d e7             	lea    -0x19(%ebp),%edi
 1e0:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 1e3:	83 c3 01             	add    $0x1,%ebx
 1e6:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1e9:	7d 27                	jge    212 <gets+0x46>
 1eb:	83 ec 04             	sub    $0x4,%esp
 1ee:	6a 01                	push   $0x1
 1f0:	57                   	push   %edi
 1f1:	6a 00                	push   $0x0
 1f3:	e8 f9 00 00 00       	call   2f1 <read>
 1f8:	83 c4 10             	add    $0x10,%esp
 1fb:	85 c0                	test   %eax,%eax
 1fd:	7e 13                	jle    212 <gets+0x46>
 1ff:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 203:	88 44 1e ff          	mov    %al,-0x1(%esi,%ebx,1)
 207:	3c 0a                	cmp    $0xa,%al
 209:	74 04                	je     20f <gets+0x43>
 20b:	3c 0d                	cmp    $0xd,%al
 20d:	75 d1                	jne    1e0 <gets+0x14>
 20f:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 212:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 215:	c6 04 06 00          	movb   $0x0,(%esi,%eax,1)
 219:	89 f0                	mov    %esi,%eax
 21b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 21e:	5b                   	pop    %ebx
 21f:	5e                   	pop    %esi
 220:	5f                   	pop    %edi
 221:	5d                   	pop    %ebp
 222:	c3                   	ret

00000223 <stat>:
 223:	55                   	push   %ebp
 224:	89 e5                	mov    %esp,%ebp
 226:	56                   	push   %esi
 227:	53                   	push   %ebx
 228:	83 ec 08             	sub    $0x8,%esp
 22b:	6a 00                	push   $0x0
 22d:	ff 75 08             	push   0x8(%ebp)
 230:	e8 e4 00 00 00       	call   319 <open>
 235:	83 c4 10             	add    $0x10,%esp
 238:	85 c0                	test   %eax,%eax
 23a:	78 24                	js     260 <stat+0x3d>
 23c:	89 c3                	mov    %eax,%ebx
 23e:	83 ec 08             	sub    $0x8,%esp
 241:	ff 75 0c             	push   0xc(%ebp)
 244:	50                   	push   %eax
 245:	e8 e7 00 00 00       	call   331 <fstat>
 24a:	89 c6                	mov    %eax,%esi
 24c:	89 1c 24             	mov    %ebx,(%esp)
 24f:	e8 ad 00 00 00       	call   301 <close>
 254:	83 c4 10             	add    $0x10,%esp
 257:	89 f0                	mov    %esi,%eax
 259:	8d 65 f8             	lea    -0x8(%ebp),%esp
 25c:	5b                   	pop    %ebx
 25d:	5e                   	pop    %esi
 25e:	5d                   	pop    %ebp
 25f:	c3                   	ret
 260:	be ff ff ff ff       	mov    $0xffffffff,%esi
 265:	eb f0                	jmp    257 <stat+0x34>

00000267 <atoi>:
 267:	55                   	push   %ebp
 268:	89 e5                	mov    %esp,%ebp
 26a:	53                   	push   %ebx
 26b:	8b 55 08             	mov    0x8(%ebp),%edx
 26e:	0f b6 02             	movzbl (%edx),%eax
 271:	8d 48 d0             	lea    -0x30(%eax),%ecx
 274:	80 f9 09             	cmp    $0x9,%cl
 277:	77 24                	ja     29d <atoi+0x36>
 279:	b9 00 00 00 00       	mov    $0x0,%ecx
 27e:	83 c2 01             	add    $0x1,%edx
 281:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 284:	0f be c0             	movsbl %al,%eax
 287:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
 28b:	0f b6 02             	movzbl (%edx),%eax
 28e:	8d 58 d0             	lea    -0x30(%eax),%ebx
 291:	80 fb 09             	cmp    $0x9,%bl
 294:	76 e8                	jbe    27e <atoi+0x17>
 296:	89 c8                	mov    %ecx,%eax
 298:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 29b:	c9                   	leave
 29c:	c3                   	ret
 29d:	b9 00 00 00 00       	mov    $0x0,%ecx
 2a2:	eb f2                	jmp    296 <atoi+0x2f>

000002a4 <memmove>:
 2a4:	55                   	push   %ebp
 2a5:	89 e5                	mov    %esp,%ebp
 2a7:	56                   	push   %esi
 2a8:	53                   	push   %ebx
 2a9:	8b 75 08             	mov    0x8(%ebp),%esi
 2ac:	8b 55 0c             	mov    0xc(%ebp),%edx
 2af:	8b 5d 10             	mov    0x10(%ebp),%ebx
 2b2:	85 db                	test   %ebx,%ebx
 2b4:	7e 15                	jle    2cb <memmove+0x27>
 2b6:	01 f3                	add    %esi,%ebx
 2b8:	89 f0                	mov    %esi,%eax
 2ba:	83 c2 01             	add    $0x1,%edx
 2bd:	83 c0 01             	add    $0x1,%eax
 2c0:	0f b6 4a ff          	movzbl -0x1(%edx),%ecx
 2c4:	88 48 ff             	mov    %cl,-0x1(%eax)
 2c7:	39 c3                	cmp    %eax,%ebx
 2c9:	75 ef                	jne    2ba <memmove+0x16>
 2cb:	89 f0                	mov    %esi,%eax
 2cd:	5b                   	pop    %ebx
 2ce:	5e                   	pop    %esi
 2cf:	5d                   	pop    %ebp
 2d0:	c3                   	ret

000002d1 <fork>:
  name: \
    movl $1, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALLFORK(fork) //instead of SYSCALL(fork) !!!
 2d1:	b8 01 00 00 00       	mov    $0x1,%eax
 2d6:	cd 40                	int    $0x40
 2d8:	c3                   	ret

000002d9 <exit>:
//SYSCALL(fork)
SYSCALL(exit)
 2d9:	b8 02 00 00 00       	mov    $0x2,%eax
 2de:	cd 40                	int    $0x40
 2e0:	c3                   	ret

000002e1 <wait>:
SYSCALL(wait)
 2e1:	b8 03 00 00 00       	mov    $0x3,%eax
 2e6:	cd 40                	int    $0x40
 2e8:	c3                   	ret

000002e9 <pipe>:
SYSCALL(pipe)
 2e9:	b8 04 00 00 00       	mov    $0x4,%eax
 2ee:	cd 40                	int    $0x40
 2f0:	c3                   	ret

000002f1 <read>:
SYSCALL(read)
 2f1:	b8 05 00 00 00       	mov    $0x5,%eax
 2f6:	cd 40                	int    $0x40
 2f8:	c3                   	ret

000002f9 <write>:
SYSCALL(write)
 2f9:	b8 10 00 00 00       	mov    $0x10,%eax
 2fe:	cd 40                	int    $0x40
 300:	c3                   	ret

00000301 <close>:
SYSCALL(close)
 301:	b8 15 00 00 00       	mov    $0x15,%eax
 306:	cd 40                	int    $0x40
 308:	c3                   	ret

00000309 <kill>:
SYSCALL(kill)
 309:	b8 06 00 00 00       	mov    $0x6,%eax
 30e:	cd 40                	int    $0x40
 310:	c3                   	ret

00000311 <exec>:
SYSCALL(exec)
 311:	b8 07 00 00 00       	mov    $0x7,%eax
 316:	cd 40                	int    $0x40
 318:	c3                   	ret

00000319 <open>:
SYSCALL(open)
 319:	b8 0f 00 00 00       	mov    $0xf,%eax
 31e:	cd 40                	int    $0x40
 320:	c3                   	ret

00000321 <mknod>:
SYSCALL(mknod)
 321:	b8 11 00 00 00       	mov    $0x11,%eax
 326:	cd 40                	int    $0x40
 328:	c3                   	ret

00000329 <unlink>:
SYSCALL(unlink)
 329:	b8 12 00 00 00       	mov    $0x12,%eax
 32e:	cd 40                	int    $0x40
 330:	c3                   	ret

00000331 <fstat>:
SYSCALL(fstat)
 331:	b8 08 00 00 00       	mov    $0x8,%eax
 336:	cd 40                	int    $0x40
 338:	c3                   	ret

00000339 <link>:
SYSCALL(link)
 339:	b8 13 00 00 00       	mov    $0x13,%eax
 33e:	cd 40                	int    $0x40
 340:	c3                   	ret

00000341 <mkdir>:
SYSCALL(mkdir)
 341:	b8 14 00 00 00       	mov    $0x14,%eax
 346:	cd 40                	int    $0x40
 348:	c3                   	ret

00000349 <chdir>:
SYSCALL(chdir)
 349:	b8 09 00 00 00       	mov    $0x9,%eax
 34e:	cd 40                	int    $0x40
 350:	c3                   	ret

00000351 <dup>:
SYSCALL(dup)
 351:	b8 0a 00 00 00       	mov    $0xa,%eax
 356:	cd 40                	int    $0x40
 358:	c3                   	ret

00000359 <getpid>:
SYSCALL(getpid)
 359:	b8 0b 00 00 00       	mov    $0xb,%eax
 35e:	cd 40                	int    $0x40
 360:	c3                   	ret

00000361 <sbrk>:
SYSCALL(sbrk)
 361:	b8 0c 00 00 00       	mov    $0xc,%eax
 366:	cd 40                	int    $0x40
 368:	c3                   	ret

00000369 <sleep>:
SYSCALL(sleep)
 369:	b8 0d 00 00 00       	mov    $0xd,%eax
 36e:	cd 40                	int    $0x40
 370:	c3                   	ret

00000371 <uptime>:
SYSCALL(uptime)
 371:	b8 0e 00 00 00       	mov    $0xe,%eax
 376:	cd 40                	int    $0x40
 378:	c3                   	ret

00000379 <ps>:
SYSCALL(ps)
 379:	b8 16 00 00 00       	mov    $0x16,%eax
 37e:	cd 40                	int    $0x40
 380:	c3                   	ret

00000381 <printint>:
 381:	55                   	push   %ebp
 382:	89 e5                	mov    %esp,%ebp
 384:	57                   	push   %edi
 385:	56                   	push   %esi
 386:	53                   	push   %ebx
 387:	83 ec 3c             	sub    $0x3c,%esp
 38a:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 38d:	89 ce                	mov    %ecx,%esi
 38f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 393:	74 79                	je     40e <printint+0x8d>
 395:	85 d2                	test   %edx,%edx
 397:	79 75                	jns    40e <printint+0x8d>
 399:	89 d1                	mov    %edx,%ecx
 39b:	f7 d9                	neg    %ecx
 39d:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
 3a4:	bb 00 00 00 00       	mov    $0x0,%ebx
 3a9:	89 df                	mov    %ebx,%edi
 3ab:	83 c3 01             	add    $0x1,%ebx
 3ae:	89 c8                	mov    %ecx,%eax
 3b0:	ba 00 00 00 00       	mov    $0x0,%edx
 3b5:	f7 f6                	div    %esi
 3b7:	0f b6 92 94 07 00 00 	movzbl 0x794(%edx),%edx
 3be:	88 54 1d d7          	mov    %dl,-0x29(%ebp,%ebx,1)
 3c2:	89 ca                	mov    %ecx,%edx
 3c4:	89 c1                	mov    %eax,%ecx
 3c6:	39 f2                	cmp    %esi,%edx
 3c8:	73 df                	jae    3a9 <printint+0x28>
 3ca:	83 7d c0 00          	cmpl   $0x0,-0x40(%ebp)
 3ce:	74 08                	je     3d8 <printint+0x57>
 3d0:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 3d5:	8d 5f 02             	lea    0x2(%edi),%ebx
 3d8:	85 db                	test   %ebx,%ebx
 3da:	7e 2a                	jle    406 <printint+0x85>
 3dc:	8d 75 d8             	lea    -0x28(%ebp),%esi
 3df:	8d 5c 1d d7          	lea    -0x29(%ebp,%ebx,1),%ebx
 3e3:	8d 7d d7             	lea    -0x29(%ebp),%edi
 3e6:	0f b6 03             	movzbl (%ebx),%eax
 3e9:	88 45 d7             	mov    %al,-0x29(%ebp)
 3ec:	83 ec 04             	sub    $0x4,%esp
 3ef:	6a 01                	push   $0x1
 3f1:	57                   	push   %edi
 3f2:	ff 75 c4             	push   -0x3c(%ebp)
 3f5:	e8 ff fe ff ff       	call   2f9 <write>
 3fa:	89 d8                	mov    %ebx,%eax
 3fc:	83 eb 01             	sub    $0x1,%ebx
 3ff:	83 c4 10             	add    $0x10,%esp
 402:	39 f0                	cmp    %esi,%eax
 404:	75 e0                	jne    3e6 <printint+0x65>
 406:	8d 65 f4             	lea    -0xc(%ebp),%esp
 409:	5b                   	pop    %ebx
 40a:	5e                   	pop    %esi
 40b:	5f                   	pop    %edi
 40c:	5d                   	pop    %ebp
 40d:	c3                   	ret
 40e:	89 d1                	mov    %edx,%ecx
 410:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
 417:	eb 8b                	jmp    3a4 <printint+0x23>

00000419 <printf>:
 419:	55                   	push   %ebp
 41a:	89 e5                	mov    %esp,%ebp
 41c:	57                   	push   %edi
 41d:	56                   	push   %esi
 41e:	53                   	push   %ebx
 41f:	83 ec 2c             	sub    $0x2c,%esp
 422:	8b 75 0c             	mov    0xc(%ebp),%esi
 425:	0f b6 1e             	movzbl (%esi),%ebx
 428:	84 db                	test   %bl,%bl
 42a:	0f 84 9e 01 00 00    	je     5ce <printf+0x1b5>
 430:	83 c6 01             	add    $0x1,%esi
 433:	8d 45 10             	lea    0x10(%ebp),%eax
 436:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 439:	bf 00 00 00 00       	mov    $0x0,%edi
 43e:	eb 2d                	jmp    46d <printf+0x54>
 440:	88 5d e7             	mov    %bl,-0x19(%ebp)
 443:	83 ec 04             	sub    $0x4,%esp
 446:	6a 01                	push   $0x1
 448:	8d 45 e7             	lea    -0x19(%ebp),%eax
 44b:	50                   	push   %eax
 44c:	ff 75 08             	push   0x8(%ebp)
 44f:	e8 a5 fe ff ff       	call   2f9 <write>
 454:	83 c4 10             	add    $0x10,%esp
 457:	eb 05                	jmp    45e <printf+0x45>
 459:	83 ff 25             	cmp    $0x25,%edi
 45c:	74 1f                	je     47d <printf+0x64>
 45e:	83 c6 01             	add    $0x1,%esi
 461:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 465:	84 db                	test   %bl,%bl
 467:	0f 84 61 01 00 00    	je     5ce <printf+0x1b5>
 46d:	0f b6 c3             	movzbl %bl,%eax
 470:	85 ff                	test   %edi,%edi
 472:	75 e5                	jne    459 <printf+0x40>
 474:	83 f8 25             	cmp    $0x25,%eax
 477:	75 c7                	jne    440 <printf+0x27>
 479:	89 c7                	mov    %eax,%edi
 47b:	eb e1                	jmp    45e <printf+0x45>
 47d:	83 f8 25             	cmp    $0x25,%eax
 480:	0f 84 f4 00 00 00    	je     57a <printf+0x161>
 486:	8d 50 9d             	lea    -0x63(%eax),%edx
 489:	83 fa 15             	cmp    $0x15,%edx
 48c:	0f 87 09 01 00 00    	ja     59b <printf+0x182>
 492:	0f 87 03 01 00 00    	ja     59b <printf+0x182>
 498:	ff 24 95 3c 07 00 00 	jmp    *0x73c(,%edx,4)
 49f:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 4a2:	8b 17                	mov    (%edi),%edx
 4a4:	83 ec 0c             	sub    $0xc,%esp
 4a7:	6a 01                	push   $0x1
 4a9:	b9 0a 00 00 00       	mov    $0xa,%ecx
 4ae:	8b 45 08             	mov    0x8(%ebp),%eax
 4b1:	e8 cb fe ff ff       	call   381 <printint>
 4b6:	83 c7 04             	add    $0x4,%edi
 4b9:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 4bc:	83 c4 10             	add    $0x10,%esp
 4bf:	bf 00 00 00 00       	mov    $0x0,%edi
 4c4:	eb 98                	jmp    45e <printf+0x45>
 4c6:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 4c9:	8b 17                	mov    (%edi),%edx
 4cb:	83 ec 0c             	sub    $0xc,%esp
 4ce:	6a 00                	push   $0x0
 4d0:	b9 10 00 00 00       	mov    $0x10,%ecx
 4d5:	8b 45 08             	mov    0x8(%ebp),%eax
 4d8:	e8 a4 fe ff ff       	call   381 <printint>
 4dd:	83 c7 04             	add    $0x4,%edi
 4e0:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 4e3:	83 c4 10             	add    $0x10,%esp
 4e6:	bf 00 00 00 00       	mov    $0x0,%edi
 4eb:	e9 6e ff ff ff       	jmp    45e <printf+0x45>
 4f0:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
 4f3:	8b 01                	mov    (%ecx),%eax
 4f5:	83 c1 04             	add    $0x4,%ecx
 4f8:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 4fb:	85 c0                	test   %eax,%eax
 4fd:	74 13                	je     512 <printf+0xf9>
 4ff:	89 c3                	mov    %eax,%ebx
 501:	0f b6 00             	movzbl (%eax),%eax
 504:	bf 00 00 00 00       	mov    $0x0,%edi
 509:	84 c0                	test   %al,%al
 50b:	75 0f                	jne    51c <printf+0x103>
 50d:	e9 4c ff ff ff       	jmp    45e <printf+0x45>
 512:	bb 33 07 00 00       	mov    $0x733,%ebx
 517:	b8 28 00 00 00       	mov    $0x28,%eax
 51c:	8d 7d e7             	lea    -0x19(%ebp),%edi
 51f:	89 75 d0             	mov    %esi,-0x30(%ebp)
 522:	8b 75 08             	mov    0x8(%ebp),%esi
 525:	88 45 e7             	mov    %al,-0x19(%ebp)
 528:	83 ec 04             	sub    $0x4,%esp
 52b:	6a 01                	push   $0x1
 52d:	57                   	push   %edi
 52e:	56                   	push   %esi
 52f:	e8 c5 fd ff ff       	call   2f9 <write>
 534:	83 c3 01             	add    $0x1,%ebx
 537:	0f b6 03             	movzbl (%ebx),%eax
 53a:	83 c4 10             	add    $0x10,%esp
 53d:	84 c0                	test   %al,%al
 53f:	75 e4                	jne    525 <printf+0x10c>
 541:	8b 75 d0             	mov    -0x30(%ebp),%esi
 544:	bf 00 00 00 00       	mov    $0x0,%edi
 549:	e9 10 ff ff ff       	jmp    45e <printf+0x45>
 54e:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 551:	8b 07                	mov    (%edi),%eax
 553:	88 45 e7             	mov    %al,-0x19(%ebp)
 556:	83 ec 04             	sub    $0x4,%esp
 559:	6a 01                	push   $0x1
 55b:	8d 45 e7             	lea    -0x19(%ebp),%eax
 55e:	50                   	push   %eax
 55f:	ff 75 08             	push   0x8(%ebp)
 562:	e8 92 fd ff ff       	call   2f9 <write>
 567:	83 c7 04             	add    $0x4,%edi
 56a:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 56d:	83 c4 10             	add    $0x10,%esp
 570:	bf 00 00 00 00       	mov    $0x0,%edi
 575:	e9 e4 fe ff ff       	jmp    45e <printf+0x45>
 57a:	88 5d e7             	mov    %bl,-0x19(%ebp)
 57d:	83 ec 04             	sub    $0x4,%esp
 580:	6a 01                	push   $0x1
 582:	8d 45 e7             	lea    -0x19(%ebp),%eax
 585:	50                   	push   %eax
 586:	ff 75 08             	push   0x8(%ebp)
 589:	e8 6b fd ff ff       	call   2f9 <write>
 58e:	83 c4 10             	add    $0x10,%esp
 591:	bf 00 00 00 00       	mov    $0x0,%edi
 596:	e9 c3 fe ff ff       	jmp    45e <printf+0x45>
 59b:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 59f:	83 ec 04             	sub    $0x4,%esp
 5a2:	6a 01                	push   $0x1
 5a4:	8d 7d e7             	lea    -0x19(%ebp),%edi
 5a7:	57                   	push   %edi
 5a8:	ff 75 08             	push   0x8(%ebp)
 5ab:	e8 49 fd ff ff       	call   2f9 <write>
 5b0:	88 5d e7             	mov    %bl,-0x19(%ebp)
 5b3:	83 c4 0c             	add    $0xc,%esp
 5b6:	6a 01                	push   $0x1
 5b8:	57                   	push   %edi
 5b9:	ff 75 08             	push   0x8(%ebp)
 5bc:	e8 38 fd ff ff       	call   2f9 <write>
 5c1:	83 c4 10             	add    $0x10,%esp
 5c4:	bf 00 00 00 00       	mov    $0x0,%edi
 5c9:	e9 90 fe ff ff       	jmp    45e <printf+0x45>
 5ce:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5d1:	5b                   	pop    %ebx
 5d2:	5e                   	pop    %esi
 5d3:	5f                   	pop    %edi
 5d4:	5d                   	pop    %ebp
 5d5:	c3                   	ret

000005d6 <free>:
 5d6:	55                   	push   %ebp
 5d7:	89 e5                	mov    %esp,%ebp
 5d9:	57                   	push   %edi
 5da:	56                   	push   %esi
 5db:	53                   	push   %ebx
 5dc:	8b 5d 08             	mov    0x8(%ebp),%ebx
 5df:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 5e2:	a1 08 0a 00 00       	mov    0xa08,%eax
 5e7:	eb 0c                	jmp    5f5 <free+0x1f>
 5e9:	8b 10                	mov    (%eax),%edx
 5eb:	39 d0                	cmp    %edx,%eax
 5ed:	72 04                	jb     5f3 <free+0x1d>
 5ef:	39 d1                	cmp    %edx,%ecx
 5f1:	72 10                	jb     603 <free+0x2d>
 5f3:	89 d0                	mov    %edx,%eax
 5f5:	39 c8                	cmp    %ecx,%eax
 5f7:	73 f0                	jae    5e9 <free+0x13>
 5f9:	8b 10                	mov    (%eax),%edx
 5fb:	39 d1                	cmp    %edx,%ecx
 5fd:	72 04                	jb     603 <free+0x2d>
 5ff:	39 d0                	cmp    %edx,%eax
 601:	72 f0                	jb     5f3 <free+0x1d>
 603:	8b 73 fc             	mov    -0x4(%ebx),%esi
 606:	8b 10                	mov    (%eax),%edx
 608:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 60b:	39 fa                	cmp    %edi,%edx
 60d:	74 19                	je     628 <free+0x52>
 60f:	89 53 f8             	mov    %edx,-0x8(%ebx)
 612:	8b 50 04             	mov    0x4(%eax),%edx
 615:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 618:	39 f1                	cmp    %esi,%ecx
 61a:	74 18                	je     634 <free+0x5e>
 61c:	89 08                	mov    %ecx,(%eax)
 61e:	a3 08 0a 00 00       	mov    %eax,0xa08
 623:	5b                   	pop    %ebx
 624:	5e                   	pop    %esi
 625:	5f                   	pop    %edi
 626:	5d                   	pop    %ebp
 627:	c3                   	ret
 628:	03 72 04             	add    0x4(%edx),%esi
 62b:	89 73 fc             	mov    %esi,-0x4(%ebx)
 62e:	8b 10                	mov    (%eax),%edx
 630:	8b 12                	mov    (%edx),%edx
 632:	eb db                	jmp    60f <free+0x39>
 634:	03 53 fc             	add    -0x4(%ebx),%edx
 637:	89 50 04             	mov    %edx,0x4(%eax)
 63a:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 63d:	eb dd                	jmp    61c <free+0x46>

0000063f <malloc>:
 63f:	55                   	push   %ebp
 640:	89 e5                	mov    %esp,%ebp
 642:	57                   	push   %edi
 643:	56                   	push   %esi
 644:	53                   	push   %ebx
 645:	83 ec 0c             	sub    $0xc,%esp
 648:	8b 45 08             	mov    0x8(%ebp),%eax
 64b:	8d 58 07             	lea    0x7(%eax),%ebx
 64e:	c1 eb 03             	shr    $0x3,%ebx
 651:	83 c3 01             	add    $0x1,%ebx
 654:	8b 15 08 0a 00 00    	mov    0xa08,%edx
 65a:	85 d2                	test   %edx,%edx
 65c:	74 1c                	je     67a <malloc+0x3b>
 65e:	8b 02                	mov    (%edx),%eax
 660:	8b 48 04             	mov    0x4(%eax),%ecx
 663:	39 d9                	cmp    %ebx,%ecx
 665:	73 38                	jae    69f <malloc+0x60>
 667:	be 00 10 00 00       	mov    $0x1000,%esi
 66c:	39 f3                	cmp    %esi,%ebx
 66e:	0f 43 f3             	cmovae %ebx,%esi
 671:	8d 3c f5 00 00 00 00 	lea    0x0(,%esi,8),%edi
 678:	eb 72                	jmp    6ec <malloc+0xad>
 67a:	c7 05 08 0a 00 00 0c 	movl   $0xa0c,0xa08
 681:	0a 00 00 
 684:	c7 05 0c 0a 00 00 0c 	movl   $0xa0c,0xa0c
 68b:	0a 00 00 
 68e:	c7 05 10 0a 00 00 00 	movl   $0x0,0xa10
 695:	00 00 00 
 698:	b8 0c 0a 00 00       	mov    $0xa0c,%eax
 69d:	eb c8                	jmp    667 <malloc+0x28>
 69f:	39 cb                	cmp    %ecx,%ebx
 6a1:	74 1e                	je     6c1 <malloc+0x82>
 6a3:	29 d9                	sub    %ebx,%ecx
 6a5:	89 48 04             	mov    %ecx,0x4(%eax)
 6a8:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 6ab:	89 58 04             	mov    %ebx,0x4(%eax)
 6ae:	89 15 08 0a 00 00    	mov    %edx,0xa08
 6b4:	8d 50 08             	lea    0x8(%eax),%edx
 6b7:	89 d0                	mov    %edx,%eax
 6b9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6bc:	5b                   	pop    %ebx
 6bd:	5e                   	pop    %esi
 6be:	5f                   	pop    %edi
 6bf:	5d                   	pop    %ebp
 6c0:	c3                   	ret
 6c1:	8b 08                	mov    (%eax),%ecx
 6c3:	89 0a                	mov    %ecx,(%edx)
 6c5:	eb e7                	jmp    6ae <malloc+0x6f>
 6c7:	89 70 04             	mov    %esi,0x4(%eax)
 6ca:	83 ec 0c             	sub    $0xc,%esp
 6cd:	83 c0 08             	add    $0x8,%eax
 6d0:	50                   	push   %eax
 6d1:	e8 00 ff ff ff       	call   5d6 <free>
 6d6:	8b 15 08 0a 00 00    	mov    0xa08,%edx
 6dc:	83 c4 10             	add    $0x10,%esp
 6df:	85 d2                	test   %edx,%edx
 6e1:	74 d4                	je     6b7 <malloc+0x78>
 6e3:	8b 02                	mov    (%edx),%eax
 6e5:	8b 48 04             	mov    0x4(%eax),%ecx
 6e8:	39 d9                	cmp    %ebx,%ecx
 6ea:	73 b3                	jae    69f <malloc+0x60>
 6ec:	89 c2                	mov    %eax,%edx
 6ee:	39 05 08 0a 00 00    	cmp    %eax,0xa08
 6f4:	75 ed                	jne    6e3 <malloc+0xa4>
 6f6:	83 ec 0c             	sub    $0xc,%esp
 6f9:	57                   	push   %edi
 6fa:	e8 62 fc ff ff       	call   361 <sbrk>
 6ff:	83 c4 10             	add    $0x10,%esp
 702:	83 f8 ff             	cmp    $0xffffffff,%eax
 705:	75 c0                	jne    6c7 <malloc+0x88>
 707:	ba 00 00 00 00       	mov    $0x0,%edx
 70c:	eb a9                	jmp    6b7 <malloc+0x78>
