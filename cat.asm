
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <cat>:
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	56                   	push   %esi
   4:	53                   	push   %ebx
   5:	8b 75 08             	mov    0x8(%ebp),%esi
   8:	83 ec 04             	sub    $0x4,%esp
   b:	68 00 02 00 00       	push   $0x200
  10:	68 40 0a 00 00       	push   $0xa40
  15:	56                   	push   %esi
  16:	e8 b8 02 00 00       	call   2d3 <read>
  1b:	89 c3                	mov    %eax,%ebx
  1d:	83 c4 10             	add    $0x10,%esp
  20:	85 c0                	test   %eax,%eax
  22:	7e 2b                	jle    4f <cat+0x4f>
  24:	83 ec 04             	sub    $0x4,%esp
  27:	53                   	push   %ebx
  28:	68 40 0a 00 00       	push   $0xa40
  2d:	6a 01                	push   $0x1
  2f:	e8 a7 02 00 00       	call   2db <write>
  34:	83 c4 10             	add    $0x10,%esp
  37:	39 d8                	cmp    %ebx,%eax
  39:	74 cd                	je     8 <cat+0x8>
  3b:	83 ec 08             	sub    $0x8,%esp
  3e:	68 f0 06 00 00       	push   $0x6f0
  43:	6a 01                	push   $0x1
  45:	e8 b1 03 00 00       	call   3fb <printf>
  4a:	e8 6c 02 00 00       	call   2bb <exit>
  4f:	78 07                	js     58 <cat+0x58>
  51:	8d 65 f8             	lea    -0x8(%ebp),%esp
  54:	5b                   	pop    %ebx
  55:	5e                   	pop    %esi
  56:	5d                   	pop    %ebp
  57:	c3                   	ret
  58:	83 ec 08             	sub    $0x8,%esp
  5b:	68 02 07 00 00       	push   $0x702
  60:	6a 01                	push   $0x1
  62:	e8 94 03 00 00       	call   3fb <printf>
  67:	e8 4f 02 00 00       	call   2bb <exit>

0000006c <main>:
  6c:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  70:	83 e4 f0             	and    $0xfffffff0,%esp
  73:	ff 71 fc             	push   -0x4(%ecx)
  76:	55                   	push   %ebp
  77:	89 e5                	mov    %esp,%ebp
  79:	57                   	push   %edi
  7a:	56                   	push   %esi
  7b:	53                   	push   %ebx
  7c:	51                   	push   %ecx
  7d:	83 ec 18             	sub    $0x18,%esp
  80:	8b 01                	mov    (%ecx),%eax
  82:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  85:	8b 71 04             	mov    0x4(%ecx),%esi
  88:	83 c6 04             	add    $0x4,%esi
  8b:	bf 01 00 00 00       	mov    $0x1,%edi
  90:	83 f8 01             	cmp    $0x1,%eax
  93:	7e 39                	jle    ce <main+0x62>
  95:	83 ec 08             	sub    $0x8,%esp
  98:	6a 00                	push   $0x0
  9a:	ff 36                	push   (%esi)
  9c:	e8 5a 02 00 00       	call   2fb <open>
  a1:	89 c3                	mov    %eax,%ebx
  a3:	83 c4 10             	add    $0x10,%esp
  a6:	85 c0                	test   %eax,%eax
  a8:	78 33                	js     dd <main+0x71>
  aa:	83 ec 0c             	sub    $0xc,%esp
  ad:	50                   	push   %eax
  ae:	e8 4d ff ff ff       	call   0 <cat>
  b3:	89 1c 24             	mov    %ebx,(%esp)
  b6:	e8 28 02 00 00       	call   2e3 <close>
  bb:	83 c7 01             	add    $0x1,%edi
  be:	83 c6 04             	add    $0x4,%esi
  c1:	83 c4 10             	add    $0x10,%esp
  c4:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
  c7:	75 cc                	jne    95 <main+0x29>
  c9:	e8 ed 01 00 00       	call   2bb <exit>
  ce:	83 ec 0c             	sub    $0xc,%esp
  d1:	6a 00                	push   $0x0
  d3:	e8 28 ff ff ff       	call   0 <cat>
  d8:	e8 de 01 00 00       	call   2bb <exit>
  dd:	83 ec 04             	sub    $0x4,%esp
  e0:	ff 36                	push   (%esi)
  e2:	68 13 07 00 00       	push   $0x713
  e7:	6a 01                	push   $0x1
  e9:	e8 0d 03 00 00       	call   3fb <printf>
  ee:	e8 c8 01 00 00       	call   2bb <exit>

000000f3 <strcpy>:
  f3:	55                   	push   %ebp
  f4:	89 e5                	mov    %esp,%ebp
  f6:	53                   	push   %ebx
  f7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  fa:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  fd:	b8 00 00 00 00       	mov    $0x0,%eax
 102:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 106:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 109:	83 c0 01             	add    $0x1,%eax
 10c:	84 d2                	test   %dl,%dl
 10e:	75 f2                	jne    102 <strcpy+0xf>
 110:	89 c8                	mov    %ecx,%eax
 112:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 115:	c9                   	leave
 116:	c3                   	ret

00000117 <strcmp>:
 117:	55                   	push   %ebp
 118:	89 e5                	mov    %esp,%ebp
 11a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 11d:	8b 55 0c             	mov    0xc(%ebp),%edx
 120:	0f b6 01             	movzbl (%ecx),%eax
 123:	84 c0                	test   %al,%al
 125:	74 11                	je     138 <strcmp+0x21>
 127:	38 02                	cmp    %al,(%edx)
 129:	75 0d                	jne    138 <strcmp+0x21>
 12b:	83 c1 01             	add    $0x1,%ecx
 12e:	83 c2 01             	add    $0x1,%edx
 131:	0f b6 01             	movzbl (%ecx),%eax
 134:	84 c0                	test   %al,%al
 136:	75 ef                	jne    127 <strcmp+0x10>
 138:	0f b6 c0             	movzbl %al,%eax
 13b:	0f b6 12             	movzbl (%edx),%edx
 13e:	29 d0                	sub    %edx,%eax
 140:	5d                   	pop    %ebp
 141:	c3                   	ret

00000142 <strlen>:
 142:	55                   	push   %ebp
 143:	89 e5                	mov    %esp,%ebp
 145:	8b 55 08             	mov    0x8(%ebp),%edx
 148:	80 3a 00             	cmpb   $0x0,(%edx)
 14b:	74 14                	je     161 <strlen+0x1f>
 14d:	b8 00 00 00 00       	mov    $0x0,%eax
 152:	83 c0 01             	add    $0x1,%eax
 155:	89 c1                	mov    %eax,%ecx
 157:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 15b:	75 f5                	jne    152 <strlen+0x10>
 15d:	89 c8                	mov    %ecx,%eax
 15f:	5d                   	pop    %ebp
 160:	c3                   	ret
 161:	b9 00 00 00 00       	mov    $0x0,%ecx
 166:	eb f5                	jmp    15d <strlen+0x1b>

00000168 <memset>:
 168:	55                   	push   %ebp
 169:	89 e5                	mov    %esp,%ebp
 16b:	57                   	push   %edi
 16c:	8b 55 08             	mov    0x8(%ebp),%edx
 16f:	89 d7                	mov    %edx,%edi
 171:	8b 4d 10             	mov    0x10(%ebp),%ecx
 174:	8b 45 0c             	mov    0xc(%ebp),%eax
 177:	fc                   	cld
 178:	f3 aa                	rep stos %al,%es:(%edi)
 17a:	89 d0                	mov    %edx,%eax
 17c:	8b 7d fc             	mov    -0x4(%ebp),%edi
 17f:	c9                   	leave
 180:	c3                   	ret

00000181 <strchr>:
 181:	55                   	push   %ebp
 182:	89 e5                	mov    %esp,%ebp
 184:	8b 45 08             	mov    0x8(%ebp),%eax
 187:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
 18b:	0f b6 10             	movzbl (%eax),%edx
 18e:	84 d2                	test   %dl,%dl
 190:	74 15                	je     1a7 <strchr+0x26>
 192:	38 d1                	cmp    %dl,%cl
 194:	74 0f                	je     1a5 <strchr+0x24>
 196:	83 c0 01             	add    $0x1,%eax
 199:	0f b6 10             	movzbl (%eax),%edx
 19c:	84 d2                	test   %dl,%dl
 19e:	75 f2                	jne    192 <strchr+0x11>
 1a0:	b8 00 00 00 00       	mov    $0x0,%eax
 1a5:	5d                   	pop    %ebp
 1a6:	c3                   	ret
 1a7:	b8 00 00 00 00       	mov    $0x0,%eax
 1ac:	eb f7                	jmp    1a5 <strchr+0x24>

000001ae <gets>:
 1ae:	55                   	push   %ebp
 1af:	89 e5                	mov    %esp,%ebp
 1b1:	57                   	push   %edi
 1b2:	56                   	push   %esi
 1b3:	53                   	push   %ebx
 1b4:	83 ec 2c             	sub    $0x2c,%esp
 1b7:	8b 75 08             	mov    0x8(%ebp),%esi
 1ba:	bb 00 00 00 00       	mov    $0x0,%ebx
 1bf:	8d 7d e7             	lea    -0x19(%ebp),%edi
 1c2:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 1c5:	83 c3 01             	add    $0x1,%ebx
 1c8:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1cb:	7d 27                	jge    1f4 <gets+0x46>
 1cd:	83 ec 04             	sub    $0x4,%esp
 1d0:	6a 01                	push   $0x1
 1d2:	57                   	push   %edi
 1d3:	6a 00                	push   $0x0
 1d5:	e8 f9 00 00 00       	call   2d3 <read>
 1da:	83 c4 10             	add    $0x10,%esp
 1dd:	85 c0                	test   %eax,%eax
 1df:	7e 13                	jle    1f4 <gets+0x46>
 1e1:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1e5:	88 44 1e ff          	mov    %al,-0x1(%esi,%ebx,1)
 1e9:	3c 0a                	cmp    $0xa,%al
 1eb:	74 04                	je     1f1 <gets+0x43>
 1ed:	3c 0d                	cmp    $0xd,%al
 1ef:	75 d1                	jne    1c2 <gets+0x14>
 1f1:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 1f4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 1f7:	c6 04 06 00          	movb   $0x0,(%esi,%eax,1)
 1fb:	89 f0                	mov    %esi,%eax
 1fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 200:	5b                   	pop    %ebx
 201:	5e                   	pop    %esi
 202:	5f                   	pop    %edi
 203:	5d                   	pop    %ebp
 204:	c3                   	ret

00000205 <stat>:
 205:	55                   	push   %ebp
 206:	89 e5                	mov    %esp,%ebp
 208:	56                   	push   %esi
 209:	53                   	push   %ebx
 20a:	83 ec 08             	sub    $0x8,%esp
 20d:	6a 00                	push   $0x0
 20f:	ff 75 08             	push   0x8(%ebp)
 212:	e8 e4 00 00 00       	call   2fb <open>
 217:	83 c4 10             	add    $0x10,%esp
 21a:	85 c0                	test   %eax,%eax
 21c:	78 24                	js     242 <stat+0x3d>
 21e:	89 c3                	mov    %eax,%ebx
 220:	83 ec 08             	sub    $0x8,%esp
 223:	ff 75 0c             	push   0xc(%ebp)
 226:	50                   	push   %eax
 227:	e8 e7 00 00 00       	call   313 <fstat>
 22c:	89 c6                	mov    %eax,%esi
 22e:	89 1c 24             	mov    %ebx,(%esp)
 231:	e8 ad 00 00 00       	call   2e3 <close>
 236:	83 c4 10             	add    $0x10,%esp
 239:	89 f0                	mov    %esi,%eax
 23b:	8d 65 f8             	lea    -0x8(%ebp),%esp
 23e:	5b                   	pop    %ebx
 23f:	5e                   	pop    %esi
 240:	5d                   	pop    %ebp
 241:	c3                   	ret
 242:	be ff ff ff ff       	mov    $0xffffffff,%esi
 247:	eb f0                	jmp    239 <stat+0x34>

00000249 <atoi>:
 249:	55                   	push   %ebp
 24a:	89 e5                	mov    %esp,%ebp
 24c:	53                   	push   %ebx
 24d:	8b 55 08             	mov    0x8(%ebp),%edx
 250:	0f b6 02             	movzbl (%edx),%eax
 253:	8d 48 d0             	lea    -0x30(%eax),%ecx
 256:	80 f9 09             	cmp    $0x9,%cl
 259:	77 24                	ja     27f <atoi+0x36>
 25b:	b9 00 00 00 00       	mov    $0x0,%ecx
 260:	83 c2 01             	add    $0x1,%edx
 263:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 266:	0f be c0             	movsbl %al,%eax
 269:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
 26d:	0f b6 02             	movzbl (%edx),%eax
 270:	8d 58 d0             	lea    -0x30(%eax),%ebx
 273:	80 fb 09             	cmp    $0x9,%bl
 276:	76 e8                	jbe    260 <atoi+0x17>
 278:	89 c8                	mov    %ecx,%eax
 27a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 27d:	c9                   	leave
 27e:	c3                   	ret
 27f:	b9 00 00 00 00       	mov    $0x0,%ecx
 284:	eb f2                	jmp    278 <atoi+0x2f>

00000286 <memmove>:
 286:	55                   	push   %ebp
 287:	89 e5                	mov    %esp,%ebp
 289:	56                   	push   %esi
 28a:	53                   	push   %ebx
 28b:	8b 75 08             	mov    0x8(%ebp),%esi
 28e:	8b 55 0c             	mov    0xc(%ebp),%edx
 291:	8b 5d 10             	mov    0x10(%ebp),%ebx
 294:	85 db                	test   %ebx,%ebx
 296:	7e 15                	jle    2ad <memmove+0x27>
 298:	01 f3                	add    %esi,%ebx
 29a:	89 f0                	mov    %esi,%eax
 29c:	83 c2 01             	add    $0x1,%edx
 29f:	83 c0 01             	add    $0x1,%eax
 2a2:	0f b6 4a ff          	movzbl -0x1(%edx),%ecx
 2a6:	88 48 ff             	mov    %cl,-0x1(%eax)
 2a9:	39 c3                	cmp    %eax,%ebx
 2ab:	75 ef                	jne    29c <memmove+0x16>
 2ad:	89 f0                	mov    %esi,%eax
 2af:	5b                   	pop    %ebx
 2b0:	5e                   	pop    %esi
 2b1:	5d                   	pop    %ebp
 2b2:	c3                   	ret

000002b3 <fork>:
  name: \
    movl $1, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALLFORK(fork) //instead of SYSCALL(fork) !!!
 2b3:	b8 01 00 00 00       	mov    $0x1,%eax
 2b8:	cd 40                	int    $0x40
 2ba:	c3                   	ret

000002bb <exit>:
//SYSCALL(fork)
SYSCALL(exit)
 2bb:	b8 02 00 00 00       	mov    $0x2,%eax
 2c0:	cd 40                	int    $0x40
 2c2:	c3                   	ret

000002c3 <wait>:
SYSCALL(wait)
 2c3:	b8 03 00 00 00       	mov    $0x3,%eax
 2c8:	cd 40                	int    $0x40
 2ca:	c3                   	ret

000002cb <pipe>:
SYSCALL(pipe)
 2cb:	b8 04 00 00 00       	mov    $0x4,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret

000002d3 <read>:
SYSCALL(read)
 2d3:	b8 05 00 00 00       	mov    $0x5,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret

000002db <write>:
SYSCALL(write)
 2db:	b8 10 00 00 00       	mov    $0x10,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret

000002e3 <close>:
SYSCALL(close)
 2e3:	b8 15 00 00 00       	mov    $0x15,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret

000002eb <kill>:
SYSCALL(kill)
 2eb:	b8 06 00 00 00       	mov    $0x6,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret

000002f3 <exec>:
SYSCALL(exec)
 2f3:	b8 07 00 00 00       	mov    $0x7,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret

000002fb <open>:
SYSCALL(open)
 2fb:	b8 0f 00 00 00       	mov    $0xf,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret

00000303 <mknod>:
SYSCALL(mknod)
 303:	b8 11 00 00 00       	mov    $0x11,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret

0000030b <unlink>:
SYSCALL(unlink)
 30b:	b8 12 00 00 00       	mov    $0x12,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret

00000313 <fstat>:
SYSCALL(fstat)
 313:	b8 08 00 00 00       	mov    $0x8,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret

0000031b <link>:
SYSCALL(link)
 31b:	b8 13 00 00 00       	mov    $0x13,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret

00000323 <mkdir>:
SYSCALL(mkdir)
 323:	b8 14 00 00 00       	mov    $0x14,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret

0000032b <chdir>:
SYSCALL(chdir)
 32b:	b8 09 00 00 00       	mov    $0x9,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret

00000333 <dup>:
SYSCALL(dup)
 333:	b8 0a 00 00 00       	mov    $0xa,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret

0000033b <getpid>:
SYSCALL(getpid)
 33b:	b8 0b 00 00 00       	mov    $0xb,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret

00000343 <sbrk>:
SYSCALL(sbrk)
 343:	b8 0c 00 00 00       	mov    $0xc,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret

0000034b <sleep>:
SYSCALL(sleep)
 34b:	b8 0d 00 00 00       	mov    $0xd,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret

00000353 <uptime>:
SYSCALL(uptime)
 353:	b8 0e 00 00 00       	mov    $0xe,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret

0000035b <ps>:
SYSCALL(ps)
 35b:	b8 16 00 00 00       	mov    $0x16,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret

00000363 <printint>:
 363:	55                   	push   %ebp
 364:	89 e5                	mov    %esp,%ebp
 366:	57                   	push   %edi
 367:	56                   	push   %esi
 368:	53                   	push   %ebx
 369:	83 ec 3c             	sub    $0x3c,%esp
 36c:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 36f:	89 ce                	mov    %ecx,%esi
 371:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 375:	74 79                	je     3f0 <printint+0x8d>
 377:	85 d2                	test   %edx,%edx
 379:	79 75                	jns    3f0 <printint+0x8d>
 37b:	89 d1                	mov    %edx,%ecx
 37d:	f7 d9                	neg    %ecx
 37f:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
 386:	bb 00 00 00 00       	mov    $0x0,%ebx
 38b:	89 df                	mov    %ebx,%edi
 38d:	83 c3 01             	add    $0x1,%ebx
 390:	89 c8                	mov    %ecx,%eax
 392:	ba 00 00 00 00       	mov    $0x0,%edx
 397:	f7 f6                	div    %esi
 399:	0f b6 92 88 07 00 00 	movzbl 0x788(%edx),%edx
 3a0:	88 54 1d d7          	mov    %dl,-0x29(%ebp,%ebx,1)
 3a4:	89 ca                	mov    %ecx,%edx
 3a6:	89 c1                	mov    %eax,%ecx
 3a8:	39 f2                	cmp    %esi,%edx
 3aa:	73 df                	jae    38b <printint+0x28>
 3ac:	83 7d c0 00          	cmpl   $0x0,-0x40(%ebp)
 3b0:	74 08                	je     3ba <printint+0x57>
 3b2:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 3b7:	8d 5f 02             	lea    0x2(%edi),%ebx
 3ba:	85 db                	test   %ebx,%ebx
 3bc:	7e 2a                	jle    3e8 <printint+0x85>
 3be:	8d 75 d8             	lea    -0x28(%ebp),%esi
 3c1:	8d 5c 1d d7          	lea    -0x29(%ebp,%ebx,1),%ebx
 3c5:	8d 7d d7             	lea    -0x29(%ebp),%edi
 3c8:	0f b6 03             	movzbl (%ebx),%eax
 3cb:	88 45 d7             	mov    %al,-0x29(%ebp)
 3ce:	83 ec 04             	sub    $0x4,%esp
 3d1:	6a 01                	push   $0x1
 3d3:	57                   	push   %edi
 3d4:	ff 75 c4             	push   -0x3c(%ebp)
 3d7:	e8 ff fe ff ff       	call   2db <write>
 3dc:	89 d8                	mov    %ebx,%eax
 3de:	83 eb 01             	sub    $0x1,%ebx
 3e1:	83 c4 10             	add    $0x10,%esp
 3e4:	39 f0                	cmp    %esi,%eax
 3e6:	75 e0                	jne    3c8 <printint+0x65>
 3e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3eb:	5b                   	pop    %ebx
 3ec:	5e                   	pop    %esi
 3ed:	5f                   	pop    %edi
 3ee:	5d                   	pop    %ebp
 3ef:	c3                   	ret
 3f0:	89 d1                	mov    %edx,%ecx
 3f2:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
 3f9:	eb 8b                	jmp    386 <printint+0x23>

000003fb <printf>:
 3fb:	55                   	push   %ebp
 3fc:	89 e5                	mov    %esp,%ebp
 3fe:	57                   	push   %edi
 3ff:	56                   	push   %esi
 400:	53                   	push   %ebx
 401:	83 ec 2c             	sub    $0x2c,%esp
 404:	8b 75 0c             	mov    0xc(%ebp),%esi
 407:	0f b6 1e             	movzbl (%esi),%ebx
 40a:	84 db                	test   %bl,%bl
 40c:	0f 84 9e 01 00 00    	je     5b0 <printf+0x1b5>
 412:	83 c6 01             	add    $0x1,%esi
 415:	8d 45 10             	lea    0x10(%ebp),%eax
 418:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 41b:	bf 00 00 00 00       	mov    $0x0,%edi
 420:	eb 2d                	jmp    44f <printf+0x54>
 422:	88 5d e7             	mov    %bl,-0x19(%ebp)
 425:	83 ec 04             	sub    $0x4,%esp
 428:	6a 01                	push   $0x1
 42a:	8d 45 e7             	lea    -0x19(%ebp),%eax
 42d:	50                   	push   %eax
 42e:	ff 75 08             	push   0x8(%ebp)
 431:	e8 a5 fe ff ff       	call   2db <write>
 436:	83 c4 10             	add    $0x10,%esp
 439:	eb 05                	jmp    440 <printf+0x45>
 43b:	83 ff 25             	cmp    $0x25,%edi
 43e:	74 1f                	je     45f <printf+0x64>
 440:	83 c6 01             	add    $0x1,%esi
 443:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 447:	84 db                	test   %bl,%bl
 449:	0f 84 61 01 00 00    	je     5b0 <printf+0x1b5>
 44f:	0f b6 c3             	movzbl %bl,%eax
 452:	85 ff                	test   %edi,%edi
 454:	75 e5                	jne    43b <printf+0x40>
 456:	83 f8 25             	cmp    $0x25,%eax
 459:	75 c7                	jne    422 <printf+0x27>
 45b:	89 c7                	mov    %eax,%edi
 45d:	eb e1                	jmp    440 <printf+0x45>
 45f:	83 f8 25             	cmp    $0x25,%eax
 462:	0f 84 f4 00 00 00    	je     55c <printf+0x161>
 468:	8d 50 9d             	lea    -0x63(%eax),%edx
 46b:	83 fa 15             	cmp    $0x15,%edx
 46e:	0f 87 09 01 00 00    	ja     57d <printf+0x182>
 474:	0f 87 03 01 00 00    	ja     57d <printf+0x182>
 47a:	ff 24 95 30 07 00 00 	jmp    *0x730(,%edx,4)
 481:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 484:	8b 17                	mov    (%edi),%edx
 486:	83 ec 0c             	sub    $0xc,%esp
 489:	6a 01                	push   $0x1
 48b:	b9 0a 00 00 00       	mov    $0xa,%ecx
 490:	8b 45 08             	mov    0x8(%ebp),%eax
 493:	e8 cb fe ff ff       	call   363 <printint>
 498:	83 c7 04             	add    $0x4,%edi
 49b:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 49e:	83 c4 10             	add    $0x10,%esp
 4a1:	bf 00 00 00 00       	mov    $0x0,%edi
 4a6:	eb 98                	jmp    440 <printf+0x45>
 4a8:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 4ab:	8b 17                	mov    (%edi),%edx
 4ad:	83 ec 0c             	sub    $0xc,%esp
 4b0:	6a 00                	push   $0x0
 4b2:	b9 10 00 00 00       	mov    $0x10,%ecx
 4b7:	8b 45 08             	mov    0x8(%ebp),%eax
 4ba:	e8 a4 fe ff ff       	call   363 <printint>
 4bf:	83 c7 04             	add    $0x4,%edi
 4c2:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 4c5:	83 c4 10             	add    $0x10,%esp
 4c8:	bf 00 00 00 00       	mov    $0x0,%edi
 4cd:	e9 6e ff ff ff       	jmp    440 <printf+0x45>
 4d2:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
 4d5:	8b 01                	mov    (%ecx),%eax
 4d7:	83 c1 04             	add    $0x4,%ecx
 4da:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 4dd:	85 c0                	test   %eax,%eax
 4df:	74 13                	je     4f4 <printf+0xf9>
 4e1:	89 c3                	mov    %eax,%ebx
 4e3:	0f b6 00             	movzbl (%eax),%eax
 4e6:	bf 00 00 00 00       	mov    $0x0,%edi
 4eb:	84 c0                	test   %al,%al
 4ed:	75 0f                	jne    4fe <printf+0x103>
 4ef:	e9 4c ff ff ff       	jmp    440 <printf+0x45>
 4f4:	bb 28 07 00 00       	mov    $0x728,%ebx
 4f9:	b8 28 00 00 00       	mov    $0x28,%eax
 4fe:	8d 7d e7             	lea    -0x19(%ebp),%edi
 501:	89 75 d0             	mov    %esi,-0x30(%ebp)
 504:	8b 75 08             	mov    0x8(%ebp),%esi
 507:	88 45 e7             	mov    %al,-0x19(%ebp)
 50a:	83 ec 04             	sub    $0x4,%esp
 50d:	6a 01                	push   $0x1
 50f:	57                   	push   %edi
 510:	56                   	push   %esi
 511:	e8 c5 fd ff ff       	call   2db <write>
 516:	83 c3 01             	add    $0x1,%ebx
 519:	0f b6 03             	movzbl (%ebx),%eax
 51c:	83 c4 10             	add    $0x10,%esp
 51f:	84 c0                	test   %al,%al
 521:	75 e4                	jne    507 <printf+0x10c>
 523:	8b 75 d0             	mov    -0x30(%ebp),%esi
 526:	bf 00 00 00 00       	mov    $0x0,%edi
 52b:	e9 10 ff ff ff       	jmp    440 <printf+0x45>
 530:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 533:	8b 07                	mov    (%edi),%eax
 535:	88 45 e7             	mov    %al,-0x19(%ebp)
 538:	83 ec 04             	sub    $0x4,%esp
 53b:	6a 01                	push   $0x1
 53d:	8d 45 e7             	lea    -0x19(%ebp),%eax
 540:	50                   	push   %eax
 541:	ff 75 08             	push   0x8(%ebp)
 544:	e8 92 fd ff ff       	call   2db <write>
 549:	83 c7 04             	add    $0x4,%edi
 54c:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 54f:	83 c4 10             	add    $0x10,%esp
 552:	bf 00 00 00 00       	mov    $0x0,%edi
 557:	e9 e4 fe ff ff       	jmp    440 <printf+0x45>
 55c:	88 5d e7             	mov    %bl,-0x19(%ebp)
 55f:	83 ec 04             	sub    $0x4,%esp
 562:	6a 01                	push   $0x1
 564:	8d 45 e7             	lea    -0x19(%ebp),%eax
 567:	50                   	push   %eax
 568:	ff 75 08             	push   0x8(%ebp)
 56b:	e8 6b fd ff ff       	call   2db <write>
 570:	83 c4 10             	add    $0x10,%esp
 573:	bf 00 00 00 00       	mov    $0x0,%edi
 578:	e9 c3 fe ff ff       	jmp    440 <printf+0x45>
 57d:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 581:	83 ec 04             	sub    $0x4,%esp
 584:	6a 01                	push   $0x1
 586:	8d 7d e7             	lea    -0x19(%ebp),%edi
 589:	57                   	push   %edi
 58a:	ff 75 08             	push   0x8(%ebp)
 58d:	e8 49 fd ff ff       	call   2db <write>
 592:	88 5d e7             	mov    %bl,-0x19(%ebp)
 595:	83 c4 0c             	add    $0xc,%esp
 598:	6a 01                	push   $0x1
 59a:	57                   	push   %edi
 59b:	ff 75 08             	push   0x8(%ebp)
 59e:	e8 38 fd ff ff       	call   2db <write>
 5a3:	83 c4 10             	add    $0x10,%esp
 5a6:	bf 00 00 00 00       	mov    $0x0,%edi
 5ab:	e9 90 fe ff ff       	jmp    440 <printf+0x45>
 5b0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5b3:	5b                   	pop    %ebx
 5b4:	5e                   	pop    %esi
 5b5:	5f                   	pop    %edi
 5b6:	5d                   	pop    %ebp
 5b7:	c3                   	ret

000005b8 <free>:
 5b8:	55                   	push   %ebp
 5b9:	89 e5                	mov    %esp,%ebp
 5bb:	57                   	push   %edi
 5bc:	56                   	push   %esi
 5bd:	53                   	push   %ebx
 5be:	8b 5d 08             	mov    0x8(%ebp),%ebx
 5c1:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 5c4:	a1 40 0c 00 00       	mov    0xc40,%eax
 5c9:	eb 0c                	jmp    5d7 <free+0x1f>
 5cb:	8b 10                	mov    (%eax),%edx
 5cd:	39 d0                	cmp    %edx,%eax
 5cf:	72 04                	jb     5d5 <free+0x1d>
 5d1:	39 d1                	cmp    %edx,%ecx
 5d3:	72 10                	jb     5e5 <free+0x2d>
 5d5:	89 d0                	mov    %edx,%eax
 5d7:	39 c8                	cmp    %ecx,%eax
 5d9:	73 f0                	jae    5cb <free+0x13>
 5db:	8b 10                	mov    (%eax),%edx
 5dd:	39 d1                	cmp    %edx,%ecx
 5df:	72 04                	jb     5e5 <free+0x2d>
 5e1:	39 d0                	cmp    %edx,%eax
 5e3:	72 f0                	jb     5d5 <free+0x1d>
 5e5:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5e8:	8b 10                	mov    (%eax),%edx
 5ea:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5ed:	39 fa                	cmp    %edi,%edx
 5ef:	74 19                	je     60a <free+0x52>
 5f1:	89 53 f8             	mov    %edx,-0x8(%ebx)
 5f4:	8b 50 04             	mov    0x4(%eax),%edx
 5f7:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5fa:	39 f1                	cmp    %esi,%ecx
 5fc:	74 18                	je     616 <free+0x5e>
 5fe:	89 08                	mov    %ecx,(%eax)
 600:	a3 40 0c 00 00       	mov    %eax,0xc40
 605:	5b                   	pop    %ebx
 606:	5e                   	pop    %esi
 607:	5f                   	pop    %edi
 608:	5d                   	pop    %ebp
 609:	c3                   	ret
 60a:	03 72 04             	add    0x4(%edx),%esi
 60d:	89 73 fc             	mov    %esi,-0x4(%ebx)
 610:	8b 10                	mov    (%eax),%edx
 612:	8b 12                	mov    (%edx),%edx
 614:	eb db                	jmp    5f1 <free+0x39>
 616:	03 53 fc             	add    -0x4(%ebx),%edx
 619:	89 50 04             	mov    %edx,0x4(%eax)
 61c:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 61f:	eb dd                	jmp    5fe <free+0x46>

00000621 <malloc>:
 621:	55                   	push   %ebp
 622:	89 e5                	mov    %esp,%ebp
 624:	57                   	push   %edi
 625:	56                   	push   %esi
 626:	53                   	push   %ebx
 627:	83 ec 0c             	sub    $0xc,%esp
 62a:	8b 45 08             	mov    0x8(%ebp),%eax
 62d:	8d 58 07             	lea    0x7(%eax),%ebx
 630:	c1 eb 03             	shr    $0x3,%ebx
 633:	83 c3 01             	add    $0x1,%ebx
 636:	8b 15 40 0c 00 00    	mov    0xc40,%edx
 63c:	85 d2                	test   %edx,%edx
 63e:	74 1c                	je     65c <malloc+0x3b>
 640:	8b 02                	mov    (%edx),%eax
 642:	8b 48 04             	mov    0x4(%eax),%ecx
 645:	39 d9                	cmp    %ebx,%ecx
 647:	73 38                	jae    681 <malloc+0x60>
 649:	be 00 10 00 00       	mov    $0x1000,%esi
 64e:	39 f3                	cmp    %esi,%ebx
 650:	0f 43 f3             	cmovae %ebx,%esi
 653:	8d 3c f5 00 00 00 00 	lea    0x0(,%esi,8),%edi
 65a:	eb 72                	jmp    6ce <malloc+0xad>
 65c:	c7 05 40 0c 00 00 44 	movl   $0xc44,0xc40
 663:	0c 00 00 
 666:	c7 05 44 0c 00 00 44 	movl   $0xc44,0xc44
 66d:	0c 00 00 
 670:	c7 05 48 0c 00 00 00 	movl   $0x0,0xc48
 677:	00 00 00 
 67a:	b8 44 0c 00 00       	mov    $0xc44,%eax
 67f:	eb c8                	jmp    649 <malloc+0x28>
 681:	39 cb                	cmp    %ecx,%ebx
 683:	74 1e                	je     6a3 <malloc+0x82>
 685:	29 d9                	sub    %ebx,%ecx
 687:	89 48 04             	mov    %ecx,0x4(%eax)
 68a:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 68d:	89 58 04             	mov    %ebx,0x4(%eax)
 690:	89 15 40 0c 00 00    	mov    %edx,0xc40
 696:	8d 50 08             	lea    0x8(%eax),%edx
 699:	89 d0                	mov    %edx,%eax
 69b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 69e:	5b                   	pop    %ebx
 69f:	5e                   	pop    %esi
 6a0:	5f                   	pop    %edi
 6a1:	5d                   	pop    %ebp
 6a2:	c3                   	ret
 6a3:	8b 08                	mov    (%eax),%ecx
 6a5:	89 0a                	mov    %ecx,(%edx)
 6a7:	eb e7                	jmp    690 <malloc+0x6f>
 6a9:	89 70 04             	mov    %esi,0x4(%eax)
 6ac:	83 ec 0c             	sub    $0xc,%esp
 6af:	83 c0 08             	add    $0x8,%eax
 6b2:	50                   	push   %eax
 6b3:	e8 00 ff ff ff       	call   5b8 <free>
 6b8:	8b 15 40 0c 00 00    	mov    0xc40,%edx
 6be:	83 c4 10             	add    $0x10,%esp
 6c1:	85 d2                	test   %edx,%edx
 6c3:	74 d4                	je     699 <malloc+0x78>
 6c5:	8b 02                	mov    (%edx),%eax
 6c7:	8b 48 04             	mov    0x4(%eax),%ecx
 6ca:	39 d9                	cmp    %ebx,%ecx
 6cc:	73 b3                	jae    681 <malloc+0x60>
 6ce:	89 c2                	mov    %eax,%edx
 6d0:	39 05 40 0c 00 00    	cmp    %eax,0xc40
 6d6:	75 ed                	jne    6c5 <malloc+0xa4>
 6d8:	83 ec 0c             	sub    $0xc,%esp
 6db:	57                   	push   %edi
 6dc:	e8 62 fc ff ff       	call   343 <sbrk>
 6e1:	83 c4 10             	add    $0x10,%esp
 6e4:	83 f8 ff             	cmp    $0xffffffff,%eax
 6e7:	75 c0                	jne    6a9 <malloc+0x88>
 6e9:	ba 00 00 00 00       	mov    $0x0,%edx
 6ee:	eb a9                	jmp    699 <malloc+0x78>
