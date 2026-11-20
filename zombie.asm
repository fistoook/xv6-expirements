
_zombie:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 04             	sub    $0x4,%esp
  11:	e8 d8 01 00 00       	call   1ee <fork>
  16:	85 c0                	test   %eax,%eax
  18:	7f 05                	jg     1f <main+0x1f>
  1a:	e8 d7 01 00 00       	call   1f6 <exit>
  1f:	83 ec 0c             	sub    $0xc,%esp
  22:	6a 05                	push   $0x5
  24:	e8 5d 02 00 00       	call   286 <sleep>
  29:	83 c4 10             	add    $0x10,%esp
  2c:	eb ec                	jmp    1a <main+0x1a>

0000002e <strcpy>:
  2e:	55                   	push   %ebp
  2f:	89 e5                	mov    %esp,%ebp
  31:	53                   	push   %ebx
  32:	8b 4d 08             	mov    0x8(%ebp),%ecx
  35:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  38:	b8 00 00 00 00       	mov    $0x0,%eax
  3d:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  41:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  44:	83 c0 01             	add    $0x1,%eax
  47:	84 d2                	test   %dl,%dl
  49:	75 f2                	jne    3d <strcpy+0xf>
  4b:	89 c8                	mov    %ecx,%eax
  4d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  50:	c9                   	leave
  51:	c3                   	ret

00000052 <strcmp>:
  52:	55                   	push   %ebp
  53:	89 e5                	mov    %esp,%ebp
  55:	8b 4d 08             	mov    0x8(%ebp),%ecx
  58:	8b 55 0c             	mov    0xc(%ebp),%edx
  5b:	0f b6 01             	movzbl (%ecx),%eax
  5e:	84 c0                	test   %al,%al
  60:	74 11                	je     73 <strcmp+0x21>
  62:	38 02                	cmp    %al,(%edx)
  64:	75 0d                	jne    73 <strcmp+0x21>
  66:	83 c1 01             	add    $0x1,%ecx
  69:	83 c2 01             	add    $0x1,%edx
  6c:	0f b6 01             	movzbl (%ecx),%eax
  6f:	84 c0                	test   %al,%al
  71:	75 ef                	jne    62 <strcmp+0x10>
  73:	0f b6 c0             	movzbl %al,%eax
  76:	0f b6 12             	movzbl (%edx),%edx
  79:	29 d0                	sub    %edx,%eax
  7b:	5d                   	pop    %ebp
  7c:	c3                   	ret

0000007d <strlen>:
  7d:	55                   	push   %ebp
  7e:	89 e5                	mov    %esp,%ebp
  80:	8b 55 08             	mov    0x8(%ebp),%edx
  83:	80 3a 00             	cmpb   $0x0,(%edx)
  86:	74 14                	je     9c <strlen+0x1f>
  88:	b8 00 00 00 00       	mov    $0x0,%eax
  8d:	83 c0 01             	add    $0x1,%eax
  90:	89 c1                	mov    %eax,%ecx
  92:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  96:	75 f5                	jne    8d <strlen+0x10>
  98:	89 c8                	mov    %ecx,%eax
  9a:	5d                   	pop    %ebp
  9b:	c3                   	ret
  9c:	b9 00 00 00 00       	mov    $0x0,%ecx
  a1:	eb f5                	jmp    98 <strlen+0x1b>

000000a3 <memset>:
  a3:	55                   	push   %ebp
  a4:	89 e5                	mov    %esp,%ebp
  a6:	57                   	push   %edi
  a7:	8b 55 08             	mov    0x8(%ebp),%edx
  aa:	89 d7                	mov    %edx,%edi
  ac:	8b 4d 10             	mov    0x10(%ebp),%ecx
  af:	8b 45 0c             	mov    0xc(%ebp),%eax
  b2:	fc                   	cld
  b3:	f3 aa                	rep stos %al,%es:(%edi)
  b5:	89 d0                	mov    %edx,%eax
  b7:	8b 7d fc             	mov    -0x4(%ebp),%edi
  ba:	c9                   	leave
  bb:	c3                   	ret

000000bc <strchr>:
  bc:	55                   	push   %ebp
  bd:	89 e5                	mov    %esp,%ebp
  bf:	8b 45 08             	mov    0x8(%ebp),%eax
  c2:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  c6:	0f b6 10             	movzbl (%eax),%edx
  c9:	84 d2                	test   %dl,%dl
  cb:	74 15                	je     e2 <strchr+0x26>
  cd:	38 d1                	cmp    %dl,%cl
  cf:	74 0f                	je     e0 <strchr+0x24>
  d1:	83 c0 01             	add    $0x1,%eax
  d4:	0f b6 10             	movzbl (%eax),%edx
  d7:	84 d2                	test   %dl,%dl
  d9:	75 f2                	jne    cd <strchr+0x11>
  db:	b8 00 00 00 00       	mov    $0x0,%eax
  e0:	5d                   	pop    %ebp
  e1:	c3                   	ret
  e2:	b8 00 00 00 00       	mov    $0x0,%eax
  e7:	eb f7                	jmp    e0 <strchr+0x24>

000000e9 <gets>:
  e9:	55                   	push   %ebp
  ea:	89 e5                	mov    %esp,%ebp
  ec:	57                   	push   %edi
  ed:	56                   	push   %esi
  ee:	53                   	push   %ebx
  ef:	83 ec 2c             	sub    $0x2c,%esp
  f2:	8b 75 08             	mov    0x8(%ebp),%esi
  f5:	bb 00 00 00 00       	mov    $0x0,%ebx
  fa:	8d 7d e7             	lea    -0x19(%ebp),%edi
  fd:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 100:	83 c3 01             	add    $0x1,%ebx
 103:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 106:	7d 27                	jge    12f <gets+0x46>
 108:	83 ec 04             	sub    $0x4,%esp
 10b:	6a 01                	push   $0x1
 10d:	57                   	push   %edi
 10e:	6a 00                	push   $0x0
 110:	e8 f9 00 00 00       	call   20e <read>
 115:	83 c4 10             	add    $0x10,%esp
 118:	85 c0                	test   %eax,%eax
 11a:	7e 13                	jle    12f <gets+0x46>
 11c:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 120:	88 44 1e ff          	mov    %al,-0x1(%esi,%ebx,1)
 124:	3c 0a                	cmp    $0xa,%al
 126:	74 04                	je     12c <gets+0x43>
 128:	3c 0d                	cmp    $0xd,%al
 12a:	75 d1                	jne    fd <gets+0x14>
 12c:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 12f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 132:	c6 04 06 00          	movb   $0x0,(%esi,%eax,1)
 136:	89 f0                	mov    %esi,%eax
 138:	8d 65 f4             	lea    -0xc(%ebp),%esp
 13b:	5b                   	pop    %ebx
 13c:	5e                   	pop    %esi
 13d:	5f                   	pop    %edi
 13e:	5d                   	pop    %ebp
 13f:	c3                   	ret

00000140 <stat>:
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	56                   	push   %esi
 144:	53                   	push   %ebx
 145:	83 ec 08             	sub    $0x8,%esp
 148:	6a 00                	push   $0x0
 14a:	ff 75 08             	push   0x8(%ebp)
 14d:	e8 e4 00 00 00       	call   236 <open>
 152:	83 c4 10             	add    $0x10,%esp
 155:	85 c0                	test   %eax,%eax
 157:	78 24                	js     17d <stat+0x3d>
 159:	89 c3                	mov    %eax,%ebx
 15b:	83 ec 08             	sub    $0x8,%esp
 15e:	ff 75 0c             	push   0xc(%ebp)
 161:	50                   	push   %eax
 162:	e8 e7 00 00 00       	call   24e <fstat>
 167:	89 c6                	mov    %eax,%esi
 169:	89 1c 24             	mov    %ebx,(%esp)
 16c:	e8 ad 00 00 00       	call   21e <close>
 171:	83 c4 10             	add    $0x10,%esp
 174:	89 f0                	mov    %esi,%eax
 176:	8d 65 f8             	lea    -0x8(%ebp),%esp
 179:	5b                   	pop    %ebx
 17a:	5e                   	pop    %esi
 17b:	5d                   	pop    %ebp
 17c:	c3                   	ret
 17d:	be ff ff ff ff       	mov    $0xffffffff,%esi
 182:	eb f0                	jmp    174 <stat+0x34>

00000184 <atoi>:
 184:	55                   	push   %ebp
 185:	89 e5                	mov    %esp,%ebp
 187:	53                   	push   %ebx
 188:	8b 55 08             	mov    0x8(%ebp),%edx
 18b:	0f b6 02             	movzbl (%edx),%eax
 18e:	8d 48 d0             	lea    -0x30(%eax),%ecx
 191:	80 f9 09             	cmp    $0x9,%cl
 194:	77 24                	ja     1ba <atoi+0x36>
 196:	b9 00 00 00 00       	mov    $0x0,%ecx
 19b:	83 c2 01             	add    $0x1,%edx
 19e:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 1a1:	0f be c0             	movsbl %al,%eax
 1a4:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
 1a8:	0f b6 02             	movzbl (%edx),%eax
 1ab:	8d 58 d0             	lea    -0x30(%eax),%ebx
 1ae:	80 fb 09             	cmp    $0x9,%bl
 1b1:	76 e8                	jbe    19b <atoi+0x17>
 1b3:	89 c8                	mov    %ecx,%eax
 1b5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1b8:	c9                   	leave
 1b9:	c3                   	ret
 1ba:	b9 00 00 00 00       	mov    $0x0,%ecx
 1bf:	eb f2                	jmp    1b3 <atoi+0x2f>

000001c1 <memmove>:
 1c1:	55                   	push   %ebp
 1c2:	89 e5                	mov    %esp,%ebp
 1c4:	56                   	push   %esi
 1c5:	53                   	push   %ebx
 1c6:	8b 75 08             	mov    0x8(%ebp),%esi
 1c9:	8b 55 0c             	mov    0xc(%ebp),%edx
 1cc:	8b 5d 10             	mov    0x10(%ebp),%ebx
 1cf:	85 db                	test   %ebx,%ebx
 1d1:	7e 15                	jle    1e8 <memmove+0x27>
 1d3:	01 f3                	add    %esi,%ebx
 1d5:	89 f0                	mov    %esi,%eax
 1d7:	83 c2 01             	add    $0x1,%edx
 1da:	83 c0 01             	add    $0x1,%eax
 1dd:	0f b6 4a ff          	movzbl -0x1(%edx),%ecx
 1e1:	88 48 ff             	mov    %cl,-0x1(%eax)
 1e4:	39 c3                	cmp    %eax,%ebx
 1e6:	75 ef                	jne    1d7 <memmove+0x16>
 1e8:	89 f0                	mov    %esi,%eax
 1ea:	5b                   	pop    %ebx
 1eb:	5e                   	pop    %esi
 1ec:	5d                   	pop    %ebp
 1ed:	c3                   	ret

000001ee <fork>:
  name: \
    movl $1, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALLFORK(fork) //instead of SYSCALL(fork) !!!
 1ee:	b8 01 00 00 00       	mov    $0x1,%eax
 1f3:	cd 40                	int    $0x40
 1f5:	c3                   	ret

000001f6 <exit>:
//SYSCALL(fork)
SYSCALL(exit)
 1f6:	b8 02 00 00 00       	mov    $0x2,%eax
 1fb:	cd 40                	int    $0x40
 1fd:	c3                   	ret

000001fe <wait>:
SYSCALL(wait)
 1fe:	b8 03 00 00 00       	mov    $0x3,%eax
 203:	cd 40                	int    $0x40
 205:	c3                   	ret

00000206 <pipe>:
SYSCALL(pipe)
 206:	b8 04 00 00 00       	mov    $0x4,%eax
 20b:	cd 40                	int    $0x40
 20d:	c3                   	ret

0000020e <read>:
SYSCALL(read)
 20e:	b8 05 00 00 00       	mov    $0x5,%eax
 213:	cd 40                	int    $0x40
 215:	c3                   	ret

00000216 <write>:
SYSCALL(write)
 216:	b8 10 00 00 00       	mov    $0x10,%eax
 21b:	cd 40                	int    $0x40
 21d:	c3                   	ret

0000021e <close>:
SYSCALL(close)
 21e:	b8 15 00 00 00       	mov    $0x15,%eax
 223:	cd 40                	int    $0x40
 225:	c3                   	ret

00000226 <kill>:
SYSCALL(kill)
 226:	b8 06 00 00 00       	mov    $0x6,%eax
 22b:	cd 40                	int    $0x40
 22d:	c3                   	ret

0000022e <exec>:
SYSCALL(exec)
 22e:	b8 07 00 00 00       	mov    $0x7,%eax
 233:	cd 40                	int    $0x40
 235:	c3                   	ret

00000236 <open>:
SYSCALL(open)
 236:	b8 0f 00 00 00       	mov    $0xf,%eax
 23b:	cd 40                	int    $0x40
 23d:	c3                   	ret

0000023e <mknod>:
SYSCALL(mknod)
 23e:	b8 11 00 00 00       	mov    $0x11,%eax
 243:	cd 40                	int    $0x40
 245:	c3                   	ret

00000246 <unlink>:
SYSCALL(unlink)
 246:	b8 12 00 00 00       	mov    $0x12,%eax
 24b:	cd 40                	int    $0x40
 24d:	c3                   	ret

0000024e <fstat>:
SYSCALL(fstat)
 24e:	b8 08 00 00 00       	mov    $0x8,%eax
 253:	cd 40                	int    $0x40
 255:	c3                   	ret

00000256 <link>:
SYSCALL(link)
 256:	b8 13 00 00 00       	mov    $0x13,%eax
 25b:	cd 40                	int    $0x40
 25d:	c3                   	ret

0000025e <mkdir>:
SYSCALL(mkdir)
 25e:	b8 14 00 00 00       	mov    $0x14,%eax
 263:	cd 40                	int    $0x40
 265:	c3                   	ret

00000266 <chdir>:
SYSCALL(chdir)
 266:	b8 09 00 00 00       	mov    $0x9,%eax
 26b:	cd 40                	int    $0x40
 26d:	c3                   	ret

0000026e <dup>:
SYSCALL(dup)
 26e:	b8 0a 00 00 00       	mov    $0xa,%eax
 273:	cd 40                	int    $0x40
 275:	c3                   	ret

00000276 <getpid>:
SYSCALL(getpid)
 276:	b8 0b 00 00 00       	mov    $0xb,%eax
 27b:	cd 40                	int    $0x40
 27d:	c3                   	ret

0000027e <sbrk>:
SYSCALL(sbrk)
 27e:	b8 0c 00 00 00       	mov    $0xc,%eax
 283:	cd 40                	int    $0x40
 285:	c3                   	ret

00000286 <sleep>:
SYSCALL(sleep)
 286:	b8 0d 00 00 00       	mov    $0xd,%eax
 28b:	cd 40                	int    $0x40
 28d:	c3                   	ret

0000028e <uptime>:
SYSCALL(uptime)
 28e:	b8 0e 00 00 00       	mov    $0xe,%eax
 293:	cd 40                	int    $0x40
 295:	c3                   	ret

00000296 <ps>:
SYSCALL(ps)
 296:	b8 16 00 00 00       	mov    $0x16,%eax
 29b:	cd 40                	int    $0x40
 29d:	c3                   	ret

0000029e <printint>:
 29e:	55                   	push   %ebp
 29f:	89 e5                	mov    %esp,%ebp
 2a1:	57                   	push   %edi
 2a2:	56                   	push   %esi
 2a3:	53                   	push   %ebx
 2a4:	83 ec 3c             	sub    $0x3c,%esp
 2a7:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 2aa:	89 ce                	mov    %ecx,%esi
 2ac:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 2b0:	74 79                	je     32b <printint+0x8d>
 2b2:	85 d2                	test   %edx,%edx
 2b4:	79 75                	jns    32b <printint+0x8d>
 2b6:	89 d1                	mov    %edx,%ecx
 2b8:	f7 d9                	neg    %ecx
 2ba:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
 2c1:	bb 00 00 00 00       	mov    $0x0,%ebx
 2c6:	89 df                	mov    %ebx,%edi
 2c8:	83 c3 01             	add    $0x1,%ebx
 2cb:	89 c8                	mov    %ecx,%eax
 2cd:	ba 00 00 00 00       	mov    $0x0,%edx
 2d2:	f7 f6                	div    %esi
 2d4:	0f b6 92 8c 06 00 00 	movzbl 0x68c(%edx),%edx
 2db:	88 54 1d d7          	mov    %dl,-0x29(%ebp,%ebx,1)
 2df:	89 ca                	mov    %ecx,%edx
 2e1:	89 c1                	mov    %eax,%ecx
 2e3:	39 f2                	cmp    %esi,%edx
 2e5:	73 df                	jae    2c6 <printint+0x28>
 2e7:	83 7d c0 00          	cmpl   $0x0,-0x40(%ebp)
 2eb:	74 08                	je     2f5 <printint+0x57>
 2ed:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 2f2:	8d 5f 02             	lea    0x2(%edi),%ebx
 2f5:	85 db                	test   %ebx,%ebx
 2f7:	7e 2a                	jle    323 <printint+0x85>
 2f9:	8d 75 d8             	lea    -0x28(%ebp),%esi
 2fc:	8d 5c 1d d7          	lea    -0x29(%ebp,%ebx,1),%ebx
 300:	8d 7d d7             	lea    -0x29(%ebp),%edi
 303:	0f b6 03             	movzbl (%ebx),%eax
 306:	88 45 d7             	mov    %al,-0x29(%ebp)
 309:	83 ec 04             	sub    $0x4,%esp
 30c:	6a 01                	push   $0x1
 30e:	57                   	push   %edi
 30f:	ff 75 c4             	push   -0x3c(%ebp)
 312:	e8 ff fe ff ff       	call   216 <write>
 317:	89 d8                	mov    %ebx,%eax
 319:	83 eb 01             	sub    $0x1,%ebx
 31c:	83 c4 10             	add    $0x10,%esp
 31f:	39 f0                	cmp    %esi,%eax
 321:	75 e0                	jne    303 <printint+0x65>
 323:	8d 65 f4             	lea    -0xc(%ebp),%esp
 326:	5b                   	pop    %ebx
 327:	5e                   	pop    %esi
 328:	5f                   	pop    %edi
 329:	5d                   	pop    %ebp
 32a:	c3                   	ret
 32b:	89 d1                	mov    %edx,%ecx
 32d:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
 334:	eb 8b                	jmp    2c1 <printint+0x23>

00000336 <printf>:
 336:	55                   	push   %ebp
 337:	89 e5                	mov    %esp,%ebp
 339:	57                   	push   %edi
 33a:	56                   	push   %esi
 33b:	53                   	push   %ebx
 33c:	83 ec 2c             	sub    $0x2c,%esp
 33f:	8b 75 0c             	mov    0xc(%ebp),%esi
 342:	0f b6 1e             	movzbl (%esi),%ebx
 345:	84 db                	test   %bl,%bl
 347:	0f 84 9e 01 00 00    	je     4eb <printf+0x1b5>
 34d:	83 c6 01             	add    $0x1,%esi
 350:	8d 45 10             	lea    0x10(%ebp),%eax
 353:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 356:	bf 00 00 00 00       	mov    $0x0,%edi
 35b:	eb 2d                	jmp    38a <printf+0x54>
 35d:	88 5d e7             	mov    %bl,-0x19(%ebp)
 360:	83 ec 04             	sub    $0x4,%esp
 363:	6a 01                	push   $0x1
 365:	8d 45 e7             	lea    -0x19(%ebp),%eax
 368:	50                   	push   %eax
 369:	ff 75 08             	push   0x8(%ebp)
 36c:	e8 a5 fe ff ff       	call   216 <write>
 371:	83 c4 10             	add    $0x10,%esp
 374:	eb 05                	jmp    37b <printf+0x45>
 376:	83 ff 25             	cmp    $0x25,%edi
 379:	74 1f                	je     39a <printf+0x64>
 37b:	83 c6 01             	add    $0x1,%esi
 37e:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 382:	84 db                	test   %bl,%bl
 384:	0f 84 61 01 00 00    	je     4eb <printf+0x1b5>
 38a:	0f b6 c3             	movzbl %bl,%eax
 38d:	85 ff                	test   %edi,%edi
 38f:	75 e5                	jne    376 <printf+0x40>
 391:	83 f8 25             	cmp    $0x25,%eax
 394:	75 c7                	jne    35d <printf+0x27>
 396:	89 c7                	mov    %eax,%edi
 398:	eb e1                	jmp    37b <printf+0x45>
 39a:	83 f8 25             	cmp    $0x25,%eax
 39d:	0f 84 f4 00 00 00    	je     497 <printf+0x161>
 3a3:	8d 50 9d             	lea    -0x63(%eax),%edx
 3a6:	83 fa 15             	cmp    $0x15,%edx
 3a9:	0f 87 09 01 00 00    	ja     4b8 <printf+0x182>
 3af:	0f 87 03 01 00 00    	ja     4b8 <printf+0x182>
 3b5:	ff 24 95 34 06 00 00 	jmp    *0x634(,%edx,4)
 3bc:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 3bf:	8b 17                	mov    (%edi),%edx
 3c1:	83 ec 0c             	sub    $0xc,%esp
 3c4:	6a 01                	push   $0x1
 3c6:	b9 0a 00 00 00       	mov    $0xa,%ecx
 3cb:	8b 45 08             	mov    0x8(%ebp),%eax
 3ce:	e8 cb fe ff ff       	call   29e <printint>
 3d3:	83 c7 04             	add    $0x4,%edi
 3d6:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 3d9:	83 c4 10             	add    $0x10,%esp
 3dc:	bf 00 00 00 00       	mov    $0x0,%edi
 3e1:	eb 98                	jmp    37b <printf+0x45>
 3e3:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 3e6:	8b 17                	mov    (%edi),%edx
 3e8:	83 ec 0c             	sub    $0xc,%esp
 3eb:	6a 00                	push   $0x0
 3ed:	b9 10 00 00 00       	mov    $0x10,%ecx
 3f2:	8b 45 08             	mov    0x8(%ebp),%eax
 3f5:	e8 a4 fe ff ff       	call   29e <printint>
 3fa:	83 c7 04             	add    $0x4,%edi
 3fd:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 400:	83 c4 10             	add    $0x10,%esp
 403:	bf 00 00 00 00       	mov    $0x0,%edi
 408:	e9 6e ff ff ff       	jmp    37b <printf+0x45>
 40d:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
 410:	8b 01                	mov    (%ecx),%eax
 412:	83 c1 04             	add    $0x4,%ecx
 415:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 418:	85 c0                	test   %eax,%eax
 41a:	74 13                	je     42f <printf+0xf9>
 41c:	89 c3                	mov    %eax,%ebx
 41e:	0f b6 00             	movzbl (%eax),%eax
 421:	bf 00 00 00 00       	mov    $0x0,%edi
 426:	84 c0                	test   %al,%al
 428:	75 0f                	jne    439 <printf+0x103>
 42a:	e9 4c ff ff ff       	jmp    37b <printf+0x45>
 42f:	bb 2c 06 00 00       	mov    $0x62c,%ebx
 434:	b8 28 00 00 00       	mov    $0x28,%eax
 439:	8d 7d e7             	lea    -0x19(%ebp),%edi
 43c:	89 75 d0             	mov    %esi,-0x30(%ebp)
 43f:	8b 75 08             	mov    0x8(%ebp),%esi
 442:	88 45 e7             	mov    %al,-0x19(%ebp)
 445:	83 ec 04             	sub    $0x4,%esp
 448:	6a 01                	push   $0x1
 44a:	57                   	push   %edi
 44b:	56                   	push   %esi
 44c:	e8 c5 fd ff ff       	call   216 <write>
 451:	83 c3 01             	add    $0x1,%ebx
 454:	0f b6 03             	movzbl (%ebx),%eax
 457:	83 c4 10             	add    $0x10,%esp
 45a:	84 c0                	test   %al,%al
 45c:	75 e4                	jne    442 <printf+0x10c>
 45e:	8b 75 d0             	mov    -0x30(%ebp),%esi
 461:	bf 00 00 00 00       	mov    $0x0,%edi
 466:	e9 10 ff ff ff       	jmp    37b <printf+0x45>
 46b:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 46e:	8b 07                	mov    (%edi),%eax
 470:	88 45 e7             	mov    %al,-0x19(%ebp)
 473:	83 ec 04             	sub    $0x4,%esp
 476:	6a 01                	push   $0x1
 478:	8d 45 e7             	lea    -0x19(%ebp),%eax
 47b:	50                   	push   %eax
 47c:	ff 75 08             	push   0x8(%ebp)
 47f:	e8 92 fd ff ff       	call   216 <write>
 484:	83 c7 04             	add    $0x4,%edi
 487:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 48a:	83 c4 10             	add    $0x10,%esp
 48d:	bf 00 00 00 00       	mov    $0x0,%edi
 492:	e9 e4 fe ff ff       	jmp    37b <printf+0x45>
 497:	88 5d e7             	mov    %bl,-0x19(%ebp)
 49a:	83 ec 04             	sub    $0x4,%esp
 49d:	6a 01                	push   $0x1
 49f:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4a2:	50                   	push   %eax
 4a3:	ff 75 08             	push   0x8(%ebp)
 4a6:	e8 6b fd ff ff       	call   216 <write>
 4ab:	83 c4 10             	add    $0x10,%esp
 4ae:	bf 00 00 00 00       	mov    $0x0,%edi
 4b3:	e9 c3 fe ff ff       	jmp    37b <printf+0x45>
 4b8:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 4bc:	83 ec 04             	sub    $0x4,%esp
 4bf:	6a 01                	push   $0x1
 4c1:	8d 7d e7             	lea    -0x19(%ebp),%edi
 4c4:	57                   	push   %edi
 4c5:	ff 75 08             	push   0x8(%ebp)
 4c8:	e8 49 fd ff ff       	call   216 <write>
 4cd:	88 5d e7             	mov    %bl,-0x19(%ebp)
 4d0:	83 c4 0c             	add    $0xc,%esp
 4d3:	6a 01                	push   $0x1
 4d5:	57                   	push   %edi
 4d6:	ff 75 08             	push   0x8(%ebp)
 4d9:	e8 38 fd ff ff       	call   216 <write>
 4de:	83 c4 10             	add    $0x10,%esp
 4e1:	bf 00 00 00 00       	mov    $0x0,%edi
 4e6:	e9 90 fe ff ff       	jmp    37b <printf+0x45>
 4eb:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4ee:	5b                   	pop    %ebx
 4ef:	5e                   	pop    %esi
 4f0:	5f                   	pop    %edi
 4f1:	5d                   	pop    %ebp
 4f2:	c3                   	ret

000004f3 <free>:
 4f3:	55                   	push   %ebp
 4f4:	89 e5                	mov    %esp,%ebp
 4f6:	57                   	push   %edi
 4f7:	56                   	push   %esi
 4f8:	53                   	push   %ebx
 4f9:	8b 5d 08             	mov    0x8(%ebp),%ebx
 4fc:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 4ff:	a1 f4 08 00 00       	mov    0x8f4,%eax
 504:	eb 0c                	jmp    512 <free+0x1f>
 506:	8b 10                	mov    (%eax),%edx
 508:	39 d0                	cmp    %edx,%eax
 50a:	72 04                	jb     510 <free+0x1d>
 50c:	39 d1                	cmp    %edx,%ecx
 50e:	72 10                	jb     520 <free+0x2d>
 510:	89 d0                	mov    %edx,%eax
 512:	39 c8                	cmp    %ecx,%eax
 514:	73 f0                	jae    506 <free+0x13>
 516:	8b 10                	mov    (%eax),%edx
 518:	39 d1                	cmp    %edx,%ecx
 51a:	72 04                	jb     520 <free+0x2d>
 51c:	39 d0                	cmp    %edx,%eax
 51e:	72 f0                	jb     510 <free+0x1d>
 520:	8b 73 fc             	mov    -0x4(%ebx),%esi
 523:	8b 10                	mov    (%eax),%edx
 525:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 528:	39 fa                	cmp    %edi,%edx
 52a:	74 19                	je     545 <free+0x52>
 52c:	89 53 f8             	mov    %edx,-0x8(%ebx)
 52f:	8b 50 04             	mov    0x4(%eax),%edx
 532:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 535:	39 f1                	cmp    %esi,%ecx
 537:	74 18                	je     551 <free+0x5e>
 539:	89 08                	mov    %ecx,(%eax)
 53b:	a3 f4 08 00 00       	mov    %eax,0x8f4
 540:	5b                   	pop    %ebx
 541:	5e                   	pop    %esi
 542:	5f                   	pop    %edi
 543:	5d                   	pop    %ebp
 544:	c3                   	ret
 545:	03 72 04             	add    0x4(%edx),%esi
 548:	89 73 fc             	mov    %esi,-0x4(%ebx)
 54b:	8b 10                	mov    (%eax),%edx
 54d:	8b 12                	mov    (%edx),%edx
 54f:	eb db                	jmp    52c <free+0x39>
 551:	03 53 fc             	add    -0x4(%ebx),%edx
 554:	89 50 04             	mov    %edx,0x4(%eax)
 557:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 55a:	eb dd                	jmp    539 <free+0x46>

0000055c <malloc>:
 55c:	55                   	push   %ebp
 55d:	89 e5                	mov    %esp,%ebp
 55f:	57                   	push   %edi
 560:	56                   	push   %esi
 561:	53                   	push   %ebx
 562:	83 ec 0c             	sub    $0xc,%esp
 565:	8b 45 08             	mov    0x8(%ebp),%eax
 568:	8d 58 07             	lea    0x7(%eax),%ebx
 56b:	c1 eb 03             	shr    $0x3,%ebx
 56e:	83 c3 01             	add    $0x1,%ebx
 571:	8b 15 f4 08 00 00    	mov    0x8f4,%edx
 577:	85 d2                	test   %edx,%edx
 579:	74 1c                	je     597 <malloc+0x3b>
 57b:	8b 02                	mov    (%edx),%eax
 57d:	8b 48 04             	mov    0x4(%eax),%ecx
 580:	39 d9                	cmp    %ebx,%ecx
 582:	73 38                	jae    5bc <malloc+0x60>
 584:	be 00 10 00 00       	mov    $0x1000,%esi
 589:	39 f3                	cmp    %esi,%ebx
 58b:	0f 43 f3             	cmovae %ebx,%esi
 58e:	8d 3c f5 00 00 00 00 	lea    0x0(,%esi,8),%edi
 595:	eb 72                	jmp    609 <malloc+0xad>
 597:	c7 05 f4 08 00 00 f8 	movl   $0x8f8,0x8f4
 59e:	08 00 00 
 5a1:	c7 05 f8 08 00 00 f8 	movl   $0x8f8,0x8f8
 5a8:	08 00 00 
 5ab:	c7 05 fc 08 00 00 00 	movl   $0x0,0x8fc
 5b2:	00 00 00 
 5b5:	b8 f8 08 00 00       	mov    $0x8f8,%eax
 5ba:	eb c8                	jmp    584 <malloc+0x28>
 5bc:	39 cb                	cmp    %ecx,%ebx
 5be:	74 1e                	je     5de <malloc+0x82>
 5c0:	29 d9                	sub    %ebx,%ecx
 5c2:	89 48 04             	mov    %ecx,0x4(%eax)
 5c5:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 5c8:	89 58 04             	mov    %ebx,0x4(%eax)
 5cb:	89 15 f4 08 00 00    	mov    %edx,0x8f4
 5d1:	8d 50 08             	lea    0x8(%eax),%edx
 5d4:	89 d0                	mov    %edx,%eax
 5d6:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5d9:	5b                   	pop    %ebx
 5da:	5e                   	pop    %esi
 5db:	5f                   	pop    %edi
 5dc:	5d                   	pop    %ebp
 5dd:	c3                   	ret
 5de:	8b 08                	mov    (%eax),%ecx
 5e0:	89 0a                	mov    %ecx,(%edx)
 5e2:	eb e7                	jmp    5cb <malloc+0x6f>
 5e4:	89 70 04             	mov    %esi,0x4(%eax)
 5e7:	83 ec 0c             	sub    $0xc,%esp
 5ea:	83 c0 08             	add    $0x8,%eax
 5ed:	50                   	push   %eax
 5ee:	e8 00 ff ff ff       	call   4f3 <free>
 5f3:	8b 15 f4 08 00 00    	mov    0x8f4,%edx
 5f9:	83 c4 10             	add    $0x10,%esp
 5fc:	85 d2                	test   %edx,%edx
 5fe:	74 d4                	je     5d4 <malloc+0x78>
 600:	8b 02                	mov    (%edx),%eax
 602:	8b 48 04             	mov    0x4(%eax),%ecx
 605:	39 d9                	cmp    %ebx,%ecx
 607:	73 b3                	jae    5bc <malloc+0x60>
 609:	89 c2                	mov    %eax,%edx
 60b:	39 05 f4 08 00 00    	cmp    %eax,0x8f4
 611:	75 ed                	jne    600 <malloc+0xa4>
 613:	83 ec 0c             	sub    $0xc,%esp
 616:	57                   	push   %edi
 617:	e8 62 fc ff ff       	call   27e <sbrk>
 61c:	83 c4 10             	add    $0x10,%esp
 61f:	83 f8 ff             	cmp    $0xffffffff,%eax
 622:	75 c0                	jne    5e4 <malloc+0x88>
 624:	ba 00 00 00 00       	mov    $0x0,%edx
 629:	eb a9                	jmp    5d4 <malloc+0x78>
