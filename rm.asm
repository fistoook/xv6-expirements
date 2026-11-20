
_rm:     file format elf32-i386


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
  11:	83 ec 08             	sub    $0x8,%esp
  14:	8b 39                	mov    (%ecx),%edi
  16:	8b 59 04             	mov    0x4(%ecx),%ebx
  19:	83 c3 04             	add    $0x4,%ebx
  1c:	be 01 00 00 00       	mov    $0x1,%esi
  21:	83 ff 01             	cmp    $0x1,%edi
  24:	7e 1d                	jle    43 <main+0x43>
  26:	83 ec 0c             	sub    $0xc,%esp
  29:	ff 33                	push   (%ebx)
  2b:	e8 58 02 00 00       	call   288 <unlink>
  30:	83 c4 10             	add    $0x10,%esp
  33:	85 c0                	test   %eax,%eax
  35:	78 20                	js     57 <main+0x57>
  37:	83 c6 01             	add    $0x1,%esi
  3a:	83 c3 04             	add    $0x4,%ebx
  3d:	39 f7                	cmp    %esi,%edi
  3f:	75 e5                	jne    26 <main+0x26>
  41:	eb 28                	jmp    6b <main+0x6b>
  43:	83 ec 08             	sub    $0x8,%esp
  46:	68 70 06 00 00       	push   $0x670
  4b:	6a 02                	push   $0x2
  4d:	e8 26 03 00 00       	call   378 <printf>
  52:	e8 e1 01 00 00       	call   238 <exit>
  57:	83 ec 04             	sub    $0x4,%esp
  5a:	ff 33                	push   (%ebx)
  5c:	68 84 06 00 00       	push   $0x684
  61:	6a 02                	push   $0x2
  63:	e8 10 03 00 00       	call   378 <printf>
  68:	83 c4 10             	add    $0x10,%esp
  6b:	e8 c8 01 00 00       	call   238 <exit>

00000070 <strcpy>:
  70:	55                   	push   %ebp
  71:	89 e5                	mov    %esp,%ebp
  73:	53                   	push   %ebx
  74:	8b 4d 08             	mov    0x8(%ebp),%ecx
  77:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  7a:	b8 00 00 00 00       	mov    $0x0,%eax
  7f:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  83:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  86:	83 c0 01             	add    $0x1,%eax
  89:	84 d2                	test   %dl,%dl
  8b:	75 f2                	jne    7f <strcpy+0xf>
  8d:	89 c8                	mov    %ecx,%eax
  8f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  92:	c9                   	leave
  93:	c3                   	ret

00000094 <strcmp>:
  94:	55                   	push   %ebp
  95:	89 e5                	mov    %esp,%ebp
  97:	8b 4d 08             	mov    0x8(%ebp),%ecx
  9a:	8b 55 0c             	mov    0xc(%ebp),%edx
  9d:	0f b6 01             	movzbl (%ecx),%eax
  a0:	84 c0                	test   %al,%al
  a2:	74 11                	je     b5 <strcmp+0x21>
  a4:	38 02                	cmp    %al,(%edx)
  a6:	75 0d                	jne    b5 <strcmp+0x21>
  a8:	83 c1 01             	add    $0x1,%ecx
  ab:	83 c2 01             	add    $0x1,%edx
  ae:	0f b6 01             	movzbl (%ecx),%eax
  b1:	84 c0                	test   %al,%al
  b3:	75 ef                	jne    a4 <strcmp+0x10>
  b5:	0f b6 c0             	movzbl %al,%eax
  b8:	0f b6 12             	movzbl (%edx),%edx
  bb:	29 d0                	sub    %edx,%eax
  bd:	5d                   	pop    %ebp
  be:	c3                   	ret

000000bf <strlen>:
  bf:	55                   	push   %ebp
  c0:	89 e5                	mov    %esp,%ebp
  c2:	8b 55 08             	mov    0x8(%ebp),%edx
  c5:	80 3a 00             	cmpb   $0x0,(%edx)
  c8:	74 14                	je     de <strlen+0x1f>
  ca:	b8 00 00 00 00       	mov    $0x0,%eax
  cf:	83 c0 01             	add    $0x1,%eax
  d2:	89 c1                	mov    %eax,%ecx
  d4:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  d8:	75 f5                	jne    cf <strlen+0x10>
  da:	89 c8                	mov    %ecx,%eax
  dc:	5d                   	pop    %ebp
  dd:	c3                   	ret
  de:	b9 00 00 00 00       	mov    $0x0,%ecx
  e3:	eb f5                	jmp    da <strlen+0x1b>

000000e5 <memset>:
  e5:	55                   	push   %ebp
  e6:	89 e5                	mov    %esp,%ebp
  e8:	57                   	push   %edi
  e9:	8b 55 08             	mov    0x8(%ebp),%edx
  ec:	89 d7                	mov    %edx,%edi
  ee:	8b 4d 10             	mov    0x10(%ebp),%ecx
  f1:	8b 45 0c             	mov    0xc(%ebp),%eax
  f4:	fc                   	cld
  f5:	f3 aa                	rep stos %al,%es:(%edi)
  f7:	89 d0                	mov    %edx,%eax
  f9:	8b 7d fc             	mov    -0x4(%ebp),%edi
  fc:	c9                   	leave
  fd:	c3                   	ret

000000fe <strchr>:
  fe:	55                   	push   %ebp
  ff:	89 e5                	mov    %esp,%ebp
 101:	8b 45 08             	mov    0x8(%ebp),%eax
 104:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
 108:	0f b6 10             	movzbl (%eax),%edx
 10b:	84 d2                	test   %dl,%dl
 10d:	74 15                	je     124 <strchr+0x26>
 10f:	38 d1                	cmp    %dl,%cl
 111:	74 0f                	je     122 <strchr+0x24>
 113:	83 c0 01             	add    $0x1,%eax
 116:	0f b6 10             	movzbl (%eax),%edx
 119:	84 d2                	test   %dl,%dl
 11b:	75 f2                	jne    10f <strchr+0x11>
 11d:	b8 00 00 00 00       	mov    $0x0,%eax
 122:	5d                   	pop    %ebp
 123:	c3                   	ret
 124:	b8 00 00 00 00       	mov    $0x0,%eax
 129:	eb f7                	jmp    122 <strchr+0x24>

0000012b <gets>:
 12b:	55                   	push   %ebp
 12c:	89 e5                	mov    %esp,%ebp
 12e:	57                   	push   %edi
 12f:	56                   	push   %esi
 130:	53                   	push   %ebx
 131:	83 ec 2c             	sub    $0x2c,%esp
 134:	8b 75 08             	mov    0x8(%ebp),%esi
 137:	bb 00 00 00 00       	mov    $0x0,%ebx
 13c:	8d 7d e7             	lea    -0x19(%ebp),%edi
 13f:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 142:	83 c3 01             	add    $0x1,%ebx
 145:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 148:	7d 27                	jge    171 <gets+0x46>
 14a:	83 ec 04             	sub    $0x4,%esp
 14d:	6a 01                	push   $0x1
 14f:	57                   	push   %edi
 150:	6a 00                	push   $0x0
 152:	e8 f9 00 00 00       	call   250 <read>
 157:	83 c4 10             	add    $0x10,%esp
 15a:	85 c0                	test   %eax,%eax
 15c:	7e 13                	jle    171 <gets+0x46>
 15e:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 162:	88 44 1e ff          	mov    %al,-0x1(%esi,%ebx,1)
 166:	3c 0a                	cmp    $0xa,%al
 168:	74 04                	je     16e <gets+0x43>
 16a:	3c 0d                	cmp    $0xd,%al
 16c:	75 d1                	jne    13f <gets+0x14>
 16e:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 171:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 174:	c6 04 06 00          	movb   $0x0,(%esi,%eax,1)
 178:	89 f0                	mov    %esi,%eax
 17a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 17d:	5b                   	pop    %ebx
 17e:	5e                   	pop    %esi
 17f:	5f                   	pop    %edi
 180:	5d                   	pop    %ebp
 181:	c3                   	ret

00000182 <stat>:
 182:	55                   	push   %ebp
 183:	89 e5                	mov    %esp,%ebp
 185:	56                   	push   %esi
 186:	53                   	push   %ebx
 187:	83 ec 08             	sub    $0x8,%esp
 18a:	6a 00                	push   $0x0
 18c:	ff 75 08             	push   0x8(%ebp)
 18f:	e8 e4 00 00 00       	call   278 <open>
 194:	83 c4 10             	add    $0x10,%esp
 197:	85 c0                	test   %eax,%eax
 199:	78 24                	js     1bf <stat+0x3d>
 19b:	89 c3                	mov    %eax,%ebx
 19d:	83 ec 08             	sub    $0x8,%esp
 1a0:	ff 75 0c             	push   0xc(%ebp)
 1a3:	50                   	push   %eax
 1a4:	e8 e7 00 00 00       	call   290 <fstat>
 1a9:	89 c6                	mov    %eax,%esi
 1ab:	89 1c 24             	mov    %ebx,(%esp)
 1ae:	e8 ad 00 00 00       	call   260 <close>
 1b3:	83 c4 10             	add    $0x10,%esp
 1b6:	89 f0                	mov    %esi,%eax
 1b8:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1bb:	5b                   	pop    %ebx
 1bc:	5e                   	pop    %esi
 1bd:	5d                   	pop    %ebp
 1be:	c3                   	ret
 1bf:	be ff ff ff ff       	mov    $0xffffffff,%esi
 1c4:	eb f0                	jmp    1b6 <stat+0x34>

000001c6 <atoi>:
 1c6:	55                   	push   %ebp
 1c7:	89 e5                	mov    %esp,%ebp
 1c9:	53                   	push   %ebx
 1ca:	8b 55 08             	mov    0x8(%ebp),%edx
 1cd:	0f b6 02             	movzbl (%edx),%eax
 1d0:	8d 48 d0             	lea    -0x30(%eax),%ecx
 1d3:	80 f9 09             	cmp    $0x9,%cl
 1d6:	77 24                	ja     1fc <atoi+0x36>
 1d8:	b9 00 00 00 00       	mov    $0x0,%ecx
 1dd:	83 c2 01             	add    $0x1,%edx
 1e0:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 1e3:	0f be c0             	movsbl %al,%eax
 1e6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
 1ea:	0f b6 02             	movzbl (%edx),%eax
 1ed:	8d 58 d0             	lea    -0x30(%eax),%ebx
 1f0:	80 fb 09             	cmp    $0x9,%bl
 1f3:	76 e8                	jbe    1dd <atoi+0x17>
 1f5:	89 c8                	mov    %ecx,%eax
 1f7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1fa:	c9                   	leave
 1fb:	c3                   	ret
 1fc:	b9 00 00 00 00       	mov    $0x0,%ecx
 201:	eb f2                	jmp    1f5 <atoi+0x2f>

00000203 <memmove>:
 203:	55                   	push   %ebp
 204:	89 e5                	mov    %esp,%ebp
 206:	56                   	push   %esi
 207:	53                   	push   %ebx
 208:	8b 75 08             	mov    0x8(%ebp),%esi
 20b:	8b 55 0c             	mov    0xc(%ebp),%edx
 20e:	8b 5d 10             	mov    0x10(%ebp),%ebx
 211:	85 db                	test   %ebx,%ebx
 213:	7e 15                	jle    22a <memmove+0x27>
 215:	01 f3                	add    %esi,%ebx
 217:	89 f0                	mov    %esi,%eax
 219:	83 c2 01             	add    $0x1,%edx
 21c:	83 c0 01             	add    $0x1,%eax
 21f:	0f b6 4a ff          	movzbl -0x1(%edx),%ecx
 223:	88 48 ff             	mov    %cl,-0x1(%eax)
 226:	39 c3                	cmp    %eax,%ebx
 228:	75 ef                	jne    219 <memmove+0x16>
 22a:	89 f0                	mov    %esi,%eax
 22c:	5b                   	pop    %ebx
 22d:	5e                   	pop    %esi
 22e:	5d                   	pop    %ebp
 22f:	c3                   	ret

00000230 <fork>:
  name: \
    movl $1, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALLFORK(fork) //instead of SYSCALL(fork) !!!
 230:	b8 01 00 00 00       	mov    $0x1,%eax
 235:	cd 40                	int    $0x40
 237:	c3                   	ret

00000238 <exit>:
//SYSCALL(fork)
SYSCALL(exit)
 238:	b8 02 00 00 00       	mov    $0x2,%eax
 23d:	cd 40                	int    $0x40
 23f:	c3                   	ret

00000240 <wait>:
SYSCALL(wait)
 240:	b8 03 00 00 00       	mov    $0x3,%eax
 245:	cd 40                	int    $0x40
 247:	c3                   	ret

00000248 <pipe>:
SYSCALL(pipe)
 248:	b8 04 00 00 00       	mov    $0x4,%eax
 24d:	cd 40                	int    $0x40
 24f:	c3                   	ret

00000250 <read>:
SYSCALL(read)
 250:	b8 05 00 00 00       	mov    $0x5,%eax
 255:	cd 40                	int    $0x40
 257:	c3                   	ret

00000258 <write>:
SYSCALL(write)
 258:	b8 10 00 00 00       	mov    $0x10,%eax
 25d:	cd 40                	int    $0x40
 25f:	c3                   	ret

00000260 <close>:
SYSCALL(close)
 260:	b8 15 00 00 00       	mov    $0x15,%eax
 265:	cd 40                	int    $0x40
 267:	c3                   	ret

00000268 <kill>:
SYSCALL(kill)
 268:	b8 06 00 00 00       	mov    $0x6,%eax
 26d:	cd 40                	int    $0x40
 26f:	c3                   	ret

00000270 <exec>:
SYSCALL(exec)
 270:	b8 07 00 00 00       	mov    $0x7,%eax
 275:	cd 40                	int    $0x40
 277:	c3                   	ret

00000278 <open>:
SYSCALL(open)
 278:	b8 0f 00 00 00       	mov    $0xf,%eax
 27d:	cd 40                	int    $0x40
 27f:	c3                   	ret

00000280 <mknod>:
SYSCALL(mknod)
 280:	b8 11 00 00 00       	mov    $0x11,%eax
 285:	cd 40                	int    $0x40
 287:	c3                   	ret

00000288 <unlink>:
SYSCALL(unlink)
 288:	b8 12 00 00 00       	mov    $0x12,%eax
 28d:	cd 40                	int    $0x40
 28f:	c3                   	ret

00000290 <fstat>:
SYSCALL(fstat)
 290:	b8 08 00 00 00       	mov    $0x8,%eax
 295:	cd 40                	int    $0x40
 297:	c3                   	ret

00000298 <link>:
SYSCALL(link)
 298:	b8 13 00 00 00       	mov    $0x13,%eax
 29d:	cd 40                	int    $0x40
 29f:	c3                   	ret

000002a0 <mkdir>:
SYSCALL(mkdir)
 2a0:	b8 14 00 00 00       	mov    $0x14,%eax
 2a5:	cd 40                	int    $0x40
 2a7:	c3                   	ret

000002a8 <chdir>:
SYSCALL(chdir)
 2a8:	b8 09 00 00 00       	mov    $0x9,%eax
 2ad:	cd 40                	int    $0x40
 2af:	c3                   	ret

000002b0 <dup>:
SYSCALL(dup)
 2b0:	b8 0a 00 00 00       	mov    $0xa,%eax
 2b5:	cd 40                	int    $0x40
 2b7:	c3                   	ret

000002b8 <getpid>:
SYSCALL(getpid)
 2b8:	b8 0b 00 00 00       	mov    $0xb,%eax
 2bd:	cd 40                	int    $0x40
 2bf:	c3                   	ret

000002c0 <sbrk>:
SYSCALL(sbrk)
 2c0:	b8 0c 00 00 00       	mov    $0xc,%eax
 2c5:	cd 40                	int    $0x40
 2c7:	c3                   	ret

000002c8 <sleep>:
SYSCALL(sleep)
 2c8:	b8 0d 00 00 00       	mov    $0xd,%eax
 2cd:	cd 40                	int    $0x40
 2cf:	c3                   	ret

000002d0 <uptime>:
SYSCALL(uptime)
 2d0:	b8 0e 00 00 00       	mov    $0xe,%eax
 2d5:	cd 40                	int    $0x40
 2d7:	c3                   	ret

000002d8 <ps>:
SYSCALL(ps)
 2d8:	b8 16 00 00 00       	mov    $0x16,%eax
 2dd:	cd 40                	int    $0x40
 2df:	c3                   	ret

000002e0 <printint>:
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	57                   	push   %edi
 2e4:	56                   	push   %esi
 2e5:	53                   	push   %ebx
 2e6:	83 ec 3c             	sub    $0x3c,%esp
 2e9:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 2ec:	89 ce                	mov    %ecx,%esi
 2ee:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 2f2:	74 79                	je     36d <printint+0x8d>
 2f4:	85 d2                	test   %edx,%edx
 2f6:	79 75                	jns    36d <printint+0x8d>
 2f8:	89 d1                	mov    %edx,%ecx
 2fa:	f7 d9                	neg    %ecx
 2fc:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
 303:	bb 00 00 00 00       	mov    $0x0,%ebx
 308:	89 df                	mov    %ebx,%edi
 30a:	83 c3 01             	add    $0x1,%ebx
 30d:	89 c8                	mov    %ecx,%eax
 30f:	ba 00 00 00 00       	mov    $0x0,%edx
 314:	f7 f6                	div    %esi
 316:	0f b6 92 fc 06 00 00 	movzbl 0x6fc(%edx),%edx
 31d:	88 54 1d d7          	mov    %dl,-0x29(%ebp,%ebx,1)
 321:	89 ca                	mov    %ecx,%edx
 323:	89 c1                	mov    %eax,%ecx
 325:	39 f2                	cmp    %esi,%edx
 327:	73 df                	jae    308 <printint+0x28>
 329:	83 7d c0 00          	cmpl   $0x0,-0x40(%ebp)
 32d:	74 08                	je     337 <printint+0x57>
 32f:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 334:	8d 5f 02             	lea    0x2(%edi),%ebx
 337:	85 db                	test   %ebx,%ebx
 339:	7e 2a                	jle    365 <printint+0x85>
 33b:	8d 75 d8             	lea    -0x28(%ebp),%esi
 33e:	8d 5c 1d d7          	lea    -0x29(%ebp,%ebx,1),%ebx
 342:	8d 7d d7             	lea    -0x29(%ebp),%edi
 345:	0f b6 03             	movzbl (%ebx),%eax
 348:	88 45 d7             	mov    %al,-0x29(%ebp)
 34b:	83 ec 04             	sub    $0x4,%esp
 34e:	6a 01                	push   $0x1
 350:	57                   	push   %edi
 351:	ff 75 c4             	push   -0x3c(%ebp)
 354:	e8 ff fe ff ff       	call   258 <write>
 359:	89 d8                	mov    %ebx,%eax
 35b:	83 eb 01             	sub    $0x1,%ebx
 35e:	83 c4 10             	add    $0x10,%esp
 361:	39 f0                	cmp    %esi,%eax
 363:	75 e0                	jne    345 <printint+0x65>
 365:	8d 65 f4             	lea    -0xc(%ebp),%esp
 368:	5b                   	pop    %ebx
 369:	5e                   	pop    %esi
 36a:	5f                   	pop    %edi
 36b:	5d                   	pop    %ebp
 36c:	c3                   	ret
 36d:	89 d1                	mov    %edx,%ecx
 36f:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
 376:	eb 8b                	jmp    303 <printint+0x23>

00000378 <printf>:
 378:	55                   	push   %ebp
 379:	89 e5                	mov    %esp,%ebp
 37b:	57                   	push   %edi
 37c:	56                   	push   %esi
 37d:	53                   	push   %ebx
 37e:	83 ec 2c             	sub    $0x2c,%esp
 381:	8b 75 0c             	mov    0xc(%ebp),%esi
 384:	0f b6 1e             	movzbl (%esi),%ebx
 387:	84 db                	test   %bl,%bl
 389:	0f 84 9e 01 00 00    	je     52d <printf+0x1b5>
 38f:	83 c6 01             	add    $0x1,%esi
 392:	8d 45 10             	lea    0x10(%ebp),%eax
 395:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 398:	bf 00 00 00 00       	mov    $0x0,%edi
 39d:	eb 2d                	jmp    3cc <printf+0x54>
 39f:	88 5d e7             	mov    %bl,-0x19(%ebp)
 3a2:	83 ec 04             	sub    $0x4,%esp
 3a5:	6a 01                	push   $0x1
 3a7:	8d 45 e7             	lea    -0x19(%ebp),%eax
 3aa:	50                   	push   %eax
 3ab:	ff 75 08             	push   0x8(%ebp)
 3ae:	e8 a5 fe ff ff       	call   258 <write>
 3b3:	83 c4 10             	add    $0x10,%esp
 3b6:	eb 05                	jmp    3bd <printf+0x45>
 3b8:	83 ff 25             	cmp    $0x25,%edi
 3bb:	74 1f                	je     3dc <printf+0x64>
 3bd:	83 c6 01             	add    $0x1,%esi
 3c0:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 3c4:	84 db                	test   %bl,%bl
 3c6:	0f 84 61 01 00 00    	je     52d <printf+0x1b5>
 3cc:	0f b6 c3             	movzbl %bl,%eax
 3cf:	85 ff                	test   %edi,%edi
 3d1:	75 e5                	jne    3b8 <printf+0x40>
 3d3:	83 f8 25             	cmp    $0x25,%eax
 3d6:	75 c7                	jne    39f <printf+0x27>
 3d8:	89 c7                	mov    %eax,%edi
 3da:	eb e1                	jmp    3bd <printf+0x45>
 3dc:	83 f8 25             	cmp    $0x25,%eax
 3df:	0f 84 f4 00 00 00    	je     4d9 <printf+0x161>
 3e5:	8d 50 9d             	lea    -0x63(%eax),%edx
 3e8:	83 fa 15             	cmp    $0x15,%edx
 3eb:	0f 87 09 01 00 00    	ja     4fa <printf+0x182>
 3f1:	0f 87 03 01 00 00    	ja     4fa <printf+0x182>
 3f7:	ff 24 95 a4 06 00 00 	jmp    *0x6a4(,%edx,4)
 3fe:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 401:	8b 17                	mov    (%edi),%edx
 403:	83 ec 0c             	sub    $0xc,%esp
 406:	6a 01                	push   $0x1
 408:	b9 0a 00 00 00       	mov    $0xa,%ecx
 40d:	8b 45 08             	mov    0x8(%ebp),%eax
 410:	e8 cb fe ff ff       	call   2e0 <printint>
 415:	83 c7 04             	add    $0x4,%edi
 418:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 41b:	83 c4 10             	add    $0x10,%esp
 41e:	bf 00 00 00 00       	mov    $0x0,%edi
 423:	eb 98                	jmp    3bd <printf+0x45>
 425:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 428:	8b 17                	mov    (%edi),%edx
 42a:	83 ec 0c             	sub    $0xc,%esp
 42d:	6a 00                	push   $0x0
 42f:	b9 10 00 00 00       	mov    $0x10,%ecx
 434:	8b 45 08             	mov    0x8(%ebp),%eax
 437:	e8 a4 fe ff ff       	call   2e0 <printint>
 43c:	83 c7 04             	add    $0x4,%edi
 43f:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 442:	83 c4 10             	add    $0x10,%esp
 445:	bf 00 00 00 00       	mov    $0x0,%edi
 44a:	e9 6e ff ff ff       	jmp    3bd <printf+0x45>
 44f:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
 452:	8b 01                	mov    (%ecx),%eax
 454:	83 c1 04             	add    $0x4,%ecx
 457:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 45a:	85 c0                	test   %eax,%eax
 45c:	74 13                	je     471 <printf+0xf9>
 45e:	89 c3                	mov    %eax,%ebx
 460:	0f b6 00             	movzbl (%eax),%eax
 463:	bf 00 00 00 00       	mov    $0x0,%edi
 468:	84 c0                	test   %al,%al
 46a:	75 0f                	jne    47b <printf+0x103>
 46c:	e9 4c ff ff ff       	jmp    3bd <printf+0x45>
 471:	bb 9d 06 00 00       	mov    $0x69d,%ebx
 476:	b8 28 00 00 00       	mov    $0x28,%eax
 47b:	8d 7d e7             	lea    -0x19(%ebp),%edi
 47e:	89 75 d0             	mov    %esi,-0x30(%ebp)
 481:	8b 75 08             	mov    0x8(%ebp),%esi
 484:	88 45 e7             	mov    %al,-0x19(%ebp)
 487:	83 ec 04             	sub    $0x4,%esp
 48a:	6a 01                	push   $0x1
 48c:	57                   	push   %edi
 48d:	56                   	push   %esi
 48e:	e8 c5 fd ff ff       	call   258 <write>
 493:	83 c3 01             	add    $0x1,%ebx
 496:	0f b6 03             	movzbl (%ebx),%eax
 499:	83 c4 10             	add    $0x10,%esp
 49c:	84 c0                	test   %al,%al
 49e:	75 e4                	jne    484 <printf+0x10c>
 4a0:	8b 75 d0             	mov    -0x30(%ebp),%esi
 4a3:	bf 00 00 00 00       	mov    $0x0,%edi
 4a8:	e9 10 ff ff ff       	jmp    3bd <printf+0x45>
 4ad:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 4b0:	8b 07                	mov    (%edi),%eax
 4b2:	88 45 e7             	mov    %al,-0x19(%ebp)
 4b5:	83 ec 04             	sub    $0x4,%esp
 4b8:	6a 01                	push   $0x1
 4ba:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4bd:	50                   	push   %eax
 4be:	ff 75 08             	push   0x8(%ebp)
 4c1:	e8 92 fd ff ff       	call   258 <write>
 4c6:	83 c7 04             	add    $0x4,%edi
 4c9:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 4cc:	83 c4 10             	add    $0x10,%esp
 4cf:	bf 00 00 00 00       	mov    $0x0,%edi
 4d4:	e9 e4 fe ff ff       	jmp    3bd <printf+0x45>
 4d9:	88 5d e7             	mov    %bl,-0x19(%ebp)
 4dc:	83 ec 04             	sub    $0x4,%esp
 4df:	6a 01                	push   $0x1
 4e1:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4e4:	50                   	push   %eax
 4e5:	ff 75 08             	push   0x8(%ebp)
 4e8:	e8 6b fd ff ff       	call   258 <write>
 4ed:	83 c4 10             	add    $0x10,%esp
 4f0:	bf 00 00 00 00       	mov    $0x0,%edi
 4f5:	e9 c3 fe ff ff       	jmp    3bd <printf+0x45>
 4fa:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 4fe:	83 ec 04             	sub    $0x4,%esp
 501:	6a 01                	push   $0x1
 503:	8d 7d e7             	lea    -0x19(%ebp),%edi
 506:	57                   	push   %edi
 507:	ff 75 08             	push   0x8(%ebp)
 50a:	e8 49 fd ff ff       	call   258 <write>
 50f:	88 5d e7             	mov    %bl,-0x19(%ebp)
 512:	83 c4 0c             	add    $0xc,%esp
 515:	6a 01                	push   $0x1
 517:	57                   	push   %edi
 518:	ff 75 08             	push   0x8(%ebp)
 51b:	e8 38 fd ff ff       	call   258 <write>
 520:	83 c4 10             	add    $0x10,%esp
 523:	bf 00 00 00 00       	mov    $0x0,%edi
 528:	e9 90 fe ff ff       	jmp    3bd <printf+0x45>
 52d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 530:	5b                   	pop    %ebx
 531:	5e                   	pop    %esi
 532:	5f                   	pop    %edi
 533:	5d                   	pop    %ebp
 534:	c3                   	ret

00000535 <free>:
 535:	55                   	push   %ebp
 536:	89 e5                	mov    %esp,%ebp
 538:	57                   	push   %edi
 539:	56                   	push   %esi
 53a:	53                   	push   %ebx
 53b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 53e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 541:	a1 70 09 00 00       	mov    0x970,%eax
 546:	eb 0c                	jmp    554 <free+0x1f>
 548:	8b 10                	mov    (%eax),%edx
 54a:	39 d0                	cmp    %edx,%eax
 54c:	72 04                	jb     552 <free+0x1d>
 54e:	39 d1                	cmp    %edx,%ecx
 550:	72 10                	jb     562 <free+0x2d>
 552:	89 d0                	mov    %edx,%eax
 554:	39 c8                	cmp    %ecx,%eax
 556:	73 f0                	jae    548 <free+0x13>
 558:	8b 10                	mov    (%eax),%edx
 55a:	39 d1                	cmp    %edx,%ecx
 55c:	72 04                	jb     562 <free+0x2d>
 55e:	39 d0                	cmp    %edx,%eax
 560:	72 f0                	jb     552 <free+0x1d>
 562:	8b 73 fc             	mov    -0x4(%ebx),%esi
 565:	8b 10                	mov    (%eax),%edx
 567:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 56a:	39 fa                	cmp    %edi,%edx
 56c:	74 19                	je     587 <free+0x52>
 56e:	89 53 f8             	mov    %edx,-0x8(%ebx)
 571:	8b 50 04             	mov    0x4(%eax),%edx
 574:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 577:	39 f1                	cmp    %esi,%ecx
 579:	74 18                	je     593 <free+0x5e>
 57b:	89 08                	mov    %ecx,(%eax)
 57d:	a3 70 09 00 00       	mov    %eax,0x970
 582:	5b                   	pop    %ebx
 583:	5e                   	pop    %esi
 584:	5f                   	pop    %edi
 585:	5d                   	pop    %ebp
 586:	c3                   	ret
 587:	03 72 04             	add    0x4(%edx),%esi
 58a:	89 73 fc             	mov    %esi,-0x4(%ebx)
 58d:	8b 10                	mov    (%eax),%edx
 58f:	8b 12                	mov    (%edx),%edx
 591:	eb db                	jmp    56e <free+0x39>
 593:	03 53 fc             	add    -0x4(%ebx),%edx
 596:	89 50 04             	mov    %edx,0x4(%eax)
 599:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 59c:	eb dd                	jmp    57b <free+0x46>

0000059e <malloc>:
 59e:	55                   	push   %ebp
 59f:	89 e5                	mov    %esp,%ebp
 5a1:	57                   	push   %edi
 5a2:	56                   	push   %esi
 5a3:	53                   	push   %ebx
 5a4:	83 ec 0c             	sub    $0xc,%esp
 5a7:	8b 45 08             	mov    0x8(%ebp),%eax
 5aa:	8d 58 07             	lea    0x7(%eax),%ebx
 5ad:	c1 eb 03             	shr    $0x3,%ebx
 5b0:	83 c3 01             	add    $0x1,%ebx
 5b3:	8b 15 70 09 00 00    	mov    0x970,%edx
 5b9:	85 d2                	test   %edx,%edx
 5bb:	74 1c                	je     5d9 <malloc+0x3b>
 5bd:	8b 02                	mov    (%edx),%eax
 5bf:	8b 48 04             	mov    0x4(%eax),%ecx
 5c2:	39 d9                	cmp    %ebx,%ecx
 5c4:	73 38                	jae    5fe <malloc+0x60>
 5c6:	be 00 10 00 00       	mov    $0x1000,%esi
 5cb:	39 f3                	cmp    %esi,%ebx
 5cd:	0f 43 f3             	cmovae %ebx,%esi
 5d0:	8d 3c f5 00 00 00 00 	lea    0x0(,%esi,8),%edi
 5d7:	eb 72                	jmp    64b <malloc+0xad>
 5d9:	c7 05 70 09 00 00 74 	movl   $0x974,0x970
 5e0:	09 00 00 
 5e3:	c7 05 74 09 00 00 74 	movl   $0x974,0x974
 5ea:	09 00 00 
 5ed:	c7 05 78 09 00 00 00 	movl   $0x0,0x978
 5f4:	00 00 00 
 5f7:	b8 74 09 00 00       	mov    $0x974,%eax
 5fc:	eb c8                	jmp    5c6 <malloc+0x28>
 5fe:	39 cb                	cmp    %ecx,%ebx
 600:	74 1e                	je     620 <malloc+0x82>
 602:	29 d9                	sub    %ebx,%ecx
 604:	89 48 04             	mov    %ecx,0x4(%eax)
 607:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 60a:	89 58 04             	mov    %ebx,0x4(%eax)
 60d:	89 15 70 09 00 00    	mov    %edx,0x970
 613:	8d 50 08             	lea    0x8(%eax),%edx
 616:	89 d0                	mov    %edx,%eax
 618:	8d 65 f4             	lea    -0xc(%ebp),%esp
 61b:	5b                   	pop    %ebx
 61c:	5e                   	pop    %esi
 61d:	5f                   	pop    %edi
 61e:	5d                   	pop    %ebp
 61f:	c3                   	ret
 620:	8b 08                	mov    (%eax),%ecx
 622:	89 0a                	mov    %ecx,(%edx)
 624:	eb e7                	jmp    60d <malloc+0x6f>
 626:	89 70 04             	mov    %esi,0x4(%eax)
 629:	83 ec 0c             	sub    $0xc,%esp
 62c:	83 c0 08             	add    $0x8,%eax
 62f:	50                   	push   %eax
 630:	e8 00 ff ff ff       	call   535 <free>
 635:	8b 15 70 09 00 00    	mov    0x970,%edx
 63b:	83 c4 10             	add    $0x10,%esp
 63e:	85 d2                	test   %edx,%edx
 640:	74 d4                	je     616 <malloc+0x78>
 642:	8b 02                	mov    (%edx),%eax
 644:	8b 48 04             	mov    0x4(%eax),%ecx
 647:	39 d9                	cmp    %ebx,%ecx
 649:	73 b3                	jae    5fe <malloc+0x60>
 64b:	89 c2                	mov    %eax,%edx
 64d:	39 05 70 09 00 00    	cmp    %eax,0x970
 653:	75 ed                	jne    642 <malloc+0xa4>
 655:	83 ec 0c             	sub    $0xc,%esp
 658:	57                   	push   %edi
 659:	e8 62 fc ff ff       	call   2c0 <sbrk>
 65e:	83 c4 10             	add    $0x10,%esp
 661:	83 f8 ff             	cmp    $0xffffffff,%eax
 664:	75 c0                	jne    626 <malloc+0x88>
 666:	ba 00 00 00 00       	mov    $0x0,%edx
 66b:	eb a9                	jmp    616 <malloc+0x78>
