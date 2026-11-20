
_forktest:     file format elf32-i386


Disassembly of section .text:

00000000 <printf>:
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 ec 10             	sub    $0x10,%esp
   7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
   a:	53                   	push   %ebx
   b:	e8 1b 01 00 00       	call   12b <strlen>
  10:	83 c4 0c             	add    $0xc,%esp
  13:	50                   	push   %eax
  14:	53                   	push   %ebx
  15:	ff 75 08             	push   0x8(%ebp)
  18:	e8 a7 02 00 00       	call   2c4 <write>
  1d:	83 c4 10             	add    $0x10,%esp
  20:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  23:	c9                   	leave
  24:	c3                   	ret

00000025 <forktest>:
  25:	55                   	push   %ebp
  26:	89 e5                	mov    %esp,%ebp
  28:	53                   	push   %ebx
  29:	83 ec 0c             	sub    $0xc,%esp
  2c:	68 4c 03 00 00       	push   $0x34c
  31:	6a 01                	push   $0x1
  33:	e8 c8 ff ff ff       	call   0 <printf>
  38:	83 c4 10             	add    $0x10,%esp
  3b:	bb 00 00 00 00       	mov    $0x0,%ebx
  40:	e8 57 02 00 00       	call   29c <fork>
  45:	85 c0                	test   %eax,%eax
  47:	78 53                	js     9c <forktest+0x77>
  49:	74 24                	je     6f <forktest+0x4a>
  4b:	83 c3 01             	add    $0x1,%ebx
  4e:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
  54:	75 ea                	jne    40 <forktest+0x1b>
  56:	83 ec 04             	sub    $0x4,%esp
  59:	68 e8 03 00 00       	push   $0x3e8
  5e:	68 8c 03 00 00       	push   $0x38c
  63:	6a 01                	push   $0x1
  65:	e8 96 ff ff ff       	call   0 <printf>
  6a:	e8 35 02 00 00       	call   2a4 <exit>
  6f:	e8 30 02 00 00       	call   2a4 <exit>
  74:	83 ec 08             	sub    $0x8,%esp
  77:	68 57 03 00 00       	push   $0x357
  7c:	6a 01                	push   $0x1
  7e:	e8 7d ff ff ff       	call   0 <printf>
  83:	e8 1c 02 00 00       	call   2a4 <exit>
  88:	83 ec 08             	sub    $0x8,%esp
  8b:	68 6b 03 00 00       	push   $0x36b
  90:	6a 01                	push   $0x1
  92:	e8 69 ff ff ff       	call   0 <printf>
  97:	e8 08 02 00 00       	call   2a4 <exit>
  9c:	85 db                	test   %ebx,%ebx
  9e:	7e 0e                	jle    ae <forktest+0x89>
  a0:	e8 07 02 00 00       	call   2ac <wait>
  a5:	85 c0                	test   %eax,%eax
  a7:	78 cb                	js     74 <forktest+0x4f>
  a9:	83 eb 01             	sub    $0x1,%ebx
  ac:	75 f2                	jne    a0 <forktest+0x7b>
  ae:	e8 f9 01 00 00       	call   2ac <wait>
  b3:	83 f8 ff             	cmp    $0xffffffff,%eax
  b6:	75 d0                	jne    88 <forktest+0x63>
  b8:	83 ec 08             	sub    $0x8,%esp
  bb:	68 7e 03 00 00       	push   $0x37e
  c0:	6a 01                	push   $0x1
  c2:	e8 39 ff ff ff       	call   0 <printf>
  c7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  ca:	c9                   	leave
  cb:	c3                   	ret

000000cc <main>:
  cc:	55                   	push   %ebp
  cd:	89 e5                	mov    %esp,%ebp
  cf:	83 e4 f0             	and    $0xfffffff0,%esp
  d2:	e8 4e ff ff ff       	call   25 <forktest>
  d7:	e8 c8 01 00 00       	call   2a4 <exit>

000000dc <strcpy>:
  dc:	55                   	push   %ebp
  dd:	89 e5                	mov    %esp,%ebp
  df:	53                   	push   %ebx
  e0:	8b 4d 08             	mov    0x8(%ebp),%ecx
  e3:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  e6:	b8 00 00 00 00       	mov    $0x0,%eax
  eb:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  ef:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  f2:	83 c0 01             	add    $0x1,%eax
  f5:	84 d2                	test   %dl,%dl
  f7:	75 f2                	jne    eb <strcpy+0xf>
  f9:	89 c8                	mov    %ecx,%eax
  fb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  fe:	c9                   	leave
  ff:	c3                   	ret

00000100 <strcmp>:
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	8b 4d 08             	mov    0x8(%ebp),%ecx
 106:	8b 55 0c             	mov    0xc(%ebp),%edx
 109:	0f b6 01             	movzbl (%ecx),%eax
 10c:	84 c0                	test   %al,%al
 10e:	74 11                	je     121 <strcmp+0x21>
 110:	38 02                	cmp    %al,(%edx)
 112:	75 0d                	jne    121 <strcmp+0x21>
 114:	83 c1 01             	add    $0x1,%ecx
 117:	83 c2 01             	add    $0x1,%edx
 11a:	0f b6 01             	movzbl (%ecx),%eax
 11d:	84 c0                	test   %al,%al
 11f:	75 ef                	jne    110 <strcmp+0x10>
 121:	0f b6 c0             	movzbl %al,%eax
 124:	0f b6 12             	movzbl (%edx),%edx
 127:	29 d0                	sub    %edx,%eax
 129:	5d                   	pop    %ebp
 12a:	c3                   	ret

0000012b <strlen>:
 12b:	55                   	push   %ebp
 12c:	89 e5                	mov    %esp,%ebp
 12e:	8b 55 08             	mov    0x8(%ebp),%edx
 131:	80 3a 00             	cmpb   $0x0,(%edx)
 134:	74 14                	je     14a <strlen+0x1f>
 136:	b8 00 00 00 00       	mov    $0x0,%eax
 13b:	83 c0 01             	add    $0x1,%eax
 13e:	89 c1                	mov    %eax,%ecx
 140:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 144:	75 f5                	jne    13b <strlen+0x10>
 146:	89 c8                	mov    %ecx,%eax
 148:	5d                   	pop    %ebp
 149:	c3                   	ret
 14a:	b9 00 00 00 00       	mov    $0x0,%ecx
 14f:	eb f5                	jmp    146 <strlen+0x1b>

00000151 <memset>:
 151:	55                   	push   %ebp
 152:	89 e5                	mov    %esp,%ebp
 154:	57                   	push   %edi
 155:	8b 55 08             	mov    0x8(%ebp),%edx
 158:	89 d7                	mov    %edx,%edi
 15a:	8b 4d 10             	mov    0x10(%ebp),%ecx
 15d:	8b 45 0c             	mov    0xc(%ebp),%eax
 160:	fc                   	cld
 161:	f3 aa                	rep stos %al,%es:(%edi)
 163:	89 d0                	mov    %edx,%eax
 165:	8b 7d fc             	mov    -0x4(%ebp),%edi
 168:	c9                   	leave
 169:	c3                   	ret

0000016a <strchr>:
 16a:	55                   	push   %ebp
 16b:	89 e5                	mov    %esp,%ebp
 16d:	8b 45 08             	mov    0x8(%ebp),%eax
 170:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
 174:	0f b6 10             	movzbl (%eax),%edx
 177:	84 d2                	test   %dl,%dl
 179:	74 15                	je     190 <strchr+0x26>
 17b:	38 d1                	cmp    %dl,%cl
 17d:	74 0f                	je     18e <strchr+0x24>
 17f:	83 c0 01             	add    $0x1,%eax
 182:	0f b6 10             	movzbl (%eax),%edx
 185:	84 d2                	test   %dl,%dl
 187:	75 f2                	jne    17b <strchr+0x11>
 189:	b8 00 00 00 00       	mov    $0x0,%eax
 18e:	5d                   	pop    %ebp
 18f:	c3                   	ret
 190:	b8 00 00 00 00       	mov    $0x0,%eax
 195:	eb f7                	jmp    18e <strchr+0x24>

00000197 <gets>:
 197:	55                   	push   %ebp
 198:	89 e5                	mov    %esp,%ebp
 19a:	57                   	push   %edi
 19b:	56                   	push   %esi
 19c:	53                   	push   %ebx
 19d:	83 ec 2c             	sub    $0x2c,%esp
 1a0:	8b 75 08             	mov    0x8(%ebp),%esi
 1a3:	bb 00 00 00 00       	mov    $0x0,%ebx
 1a8:	8d 7d e7             	lea    -0x19(%ebp),%edi
 1ab:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 1ae:	83 c3 01             	add    $0x1,%ebx
 1b1:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1b4:	7d 27                	jge    1dd <gets+0x46>
 1b6:	83 ec 04             	sub    $0x4,%esp
 1b9:	6a 01                	push   $0x1
 1bb:	57                   	push   %edi
 1bc:	6a 00                	push   $0x0
 1be:	e8 f9 00 00 00       	call   2bc <read>
 1c3:	83 c4 10             	add    $0x10,%esp
 1c6:	85 c0                	test   %eax,%eax
 1c8:	7e 13                	jle    1dd <gets+0x46>
 1ca:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1ce:	88 44 1e ff          	mov    %al,-0x1(%esi,%ebx,1)
 1d2:	3c 0a                	cmp    $0xa,%al
 1d4:	74 04                	je     1da <gets+0x43>
 1d6:	3c 0d                	cmp    $0xd,%al
 1d8:	75 d1                	jne    1ab <gets+0x14>
 1da:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 1dd:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 1e0:	c6 04 06 00          	movb   $0x0,(%esi,%eax,1)
 1e4:	89 f0                	mov    %esi,%eax
 1e6:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1e9:	5b                   	pop    %ebx
 1ea:	5e                   	pop    %esi
 1eb:	5f                   	pop    %edi
 1ec:	5d                   	pop    %ebp
 1ed:	c3                   	ret

000001ee <stat>:
 1ee:	55                   	push   %ebp
 1ef:	89 e5                	mov    %esp,%ebp
 1f1:	56                   	push   %esi
 1f2:	53                   	push   %ebx
 1f3:	83 ec 08             	sub    $0x8,%esp
 1f6:	6a 00                	push   $0x0
 1f8:	ff 75 08             	push   0x8(%ebp)
 1fb:	e8 e4 00 00 00       	call   2e4 <open>
 200:	83 c4 10             	add    $0x10,%esp
 203:	85 c0                	test   %eax,%eax
 205:	78 24                	js     22b <stat+0x3d>
 207:	89 c3                	mov    %eax,%ebx
 209:	83 ec 08             	sub    $0x8,%esp
 20c:	ff 75 0c             	push   0xc(%ebp)
 20f:	50                   	push   %eax
 210:	e8 e7 00 00 00       	call   2fc <fstat>
 215:	89 c6                	mov    %eax,%esi
 217:	89 1c 24             	mov    %ebx,(%esp)
 21a:	e8 ad 00 00 00       	call   2cc <close>
 21f:	83 c4 10             	add    $0x10,%esp
 222:	89 f0                	mov    %esi,%eax
 224:	8d 65 f8             	lea    -0x8(%ebp),%esp
 227:	5b                   	pop    %ebx
 228:	5e                   	pop    %esi
 229:	5d                   	pop    %ebp
 22a:	c3                   	ret
 22b:	be ff ff ff ff       	mov    $0xffffffff,%esi
 230:	eb f0                	jmp    222 <stat+0x34>

00000232 <atoi>:
 232:	55                   	push   %ebp
 233:	89 e5                	mov    %esp,%ebp
 235:	53                   	push   %ebx
 236:	8b 55 08             	mov    0x8(%ebp),%edx
 239:	0f b6 02             	movzbl (%edx),%eax
 23c:	8d 48 d0             	lea    -0x30(%eax),%ecx
 23f:	80 f9 09             	cmp    $0x9,%cl
 242:	77 24                	ja     268 <atoi+0x36>
 244:	b9 00 00 00 00       	mov    $0x0,%ecx
 249:	83 c2 01             	add    $0x1,%edx
 24c:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 24f:	0f be c0             	movsbl %al,%eax
 252:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
 256:	0f b6 02             	movzbl (%edx),%eax
 259:	8d 58 d0             	lea    -0x30(%eax),%ebx
 25c:	80 fb 09             	cmp    $0x9,%bl
 25f:	76 e8                	jbe    249 <atoi+0x17>
 261:	89 c8                	mov    %ecx,%eax
 263:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 266:	c9                   	leave
 267:	c3                   	ret
 268:	b9 00 00 00 00       	mov    $0x0,%ecx
 26d:	eb f2                	jmp    261 <atoi+0x2f>

0000026f <memmove>:
 26f:	55                   	push   %ebp
 270:	89 e5                	mov    %esp,%ebp
 272:	56                   	push   %esi
 273:	53                   	push   %ebx
 274:	8b 75 08             	mov    0x8(%ebp),%esi
 277:	8b 55 0c             	mov    0xc(%ebp),%edx
 27a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 27d:	85 db                	test   %ebx,%ebx
 27f:	7e 15                	jle    296 <memmove+0x27>
 281:	01 f3                	add    %esi,%ebx
 283:	89 f0                	mov    %esi,%eax
 285:	83 c2 01             	add    $0x1,%edx
 288:	83 c0 01             	add    $0x1,%eax
 28b:	0f b6 4a ff          	movzbl -0x1(%edx),%ecx
 28f:	88 48 ff             	mov    %cl,-0x1(%eax)
 292:	39 c3                	cmp    %eax,%ebx
 294:	75 ef                	jne    285 <memmove+0x16>
 296:	89 f0                	mov    %esi,%eax
 298:	5b                   	pop    %ebx
 299:	5e                   	pop    %esi
 29a:	5d                   	pop    %ebp
 29b:	c3                   	ret

0000029c <fork>:
  name: \
    movl $1, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALLFORK(fork) //instead of SYSCALL(fork) !!!
 29c:	b8 01 00 00 00       	mov    $0x1,%eax
 2a1:	cd 40                	int    $0x40
 2a3:	c3                   	ret

000002a4 <exit>:
//SYSCALL(fork)
SYSCALL(exit)
 2a4:	b8 02 00 00 00       	mov    $0x2,%eax
 2a9:	cd 40                	int    $0x40
 2ab:	c3                   	ret

000002ac <wait>:
SYSCALL(wait)
 2ac:	b8 03 00 00 00       	mov    $0x3,%eax
 2b1:	cd 40                	int    $0x40
 2b3:	c3                   	ret

000002b4 <pipe>:
SYSCALL(pipe)
 2b4:	b8 04 00 00 00       	mov    $0x4,%eax
 2b9:	cd 40                	int    $0x40
 2bb:	c3                   	ret

000002bc <read>:
SYSCALL(read)
 2bc:	b8 05 00 00 00       	mov    $0x5,%eax
 2c1:	cd 40                	int    $0x40
 2c3:	c3                   	ret

000002c4 <write>:
SYSCALL(write)
 2c4:	b8 10 00 00 00       	mov    $0x10,%eax
 2c9:	cd 40                	int    $0x40
 2cb:	c3                   	ret

000002cc <close>:
SYSCALL(close)
 2cc:	b8 15 00 00 00       	mov    $0x15,%eax
 2d1:	cd 40                	int    $0x40
 2d3:	c3                   	ret

000002d4 <kill>:
SYSCALL(kill)
 2d4:	b8 06 00 00 00       	mov    $0x6,%eax
 2d9:	cd 40                	int    $0x40
 2db:	c3                   	ret

000002dc <exec>:
SYSCALL(exec)
 2dc:	b8 07 00 00 00       	mov    $0x7,%eax
 2e1:	cd 40                	int    $0x40
 2e3:	c3                   	ret

000002e4 <open>:
SYSCALL(open)
 2e4:	b8 0f 00 00 00       	mov    $0xf,%eax
 2e9:	cd 40                	int    $0x40
 2eb:	c3                   	ret

000002ec <mknod>:
SYSCALL(mknod)
 2ec:	b8 11 00 00 00       	mov    $0x11,%eax
 2f1:	cd 40                	int    $0x40
 2f3:	c3                   	ret

000002f4 <unlink>:
SYSCALL(unlink)
 2f4:	b8 12 00 00 00       	mov    $0x12,%eax
 2f9:	cd 40                	int    $0x40
 2fb:	c3                   	ret

000002fc <fstat>:
SYSCALL(fstat)
 2fc:	b8 08 00 00 00       	mov    $0x8,%eax
 301:	cd 40                	int    $0x40
 303:	c3                   	ret

00000304 <link>:
SYSCALL(link)
 304:	b8 13 00 00 00       	mov    $0x13,%eax
 309:	cd 40                	int    $0x40
 30b:	c3                   	ret

0000030c <mkdir>:
SYSCALL(mkdir)
 30c:	b8 14 00 00 00       	mov    $0x14,%eax
 311:	cd 40                	int    $0x40
 313:	c3                   	ret

00000314 <chdir>:
SYSCALL(chdir)
 314:	b8 09 00 00 00       	mov    $0x9,%eax
 319:	cd 40                	int    $0x40
 31b:	c3                   	ret

0000031c <dup>:
SYSCALL(dup)
 31c:	b8 0a 00 00 00       	mov    $0xa,%eax
 321:	cd 40                	int    $0x40
 323:	c3                   	ret

00000324 <getpid>:
SYSCALL(getpid)
 324:	b8 0b 00 00 00       	mov    $0xb,%eax
 329:	cd 40                	int    $0x40
 32b:	c3                   	ret

0000032c <sbrk>:
SYSCALL(sbrk)
 32c:	b8 0c 00 00 00       	mov    $0xc,%eax
 331:	cd 40                	int    $0x40
 333:	c3                   	ret

00000334 <sleep>:
SYSCALL(sleep)
 334:	b8 0d 00 00 00       	mov    $0xd,%eax
 339:	cd 40                	int    $0x40
 33b:	c3                   	ret

0000033c <uptime>:
SYSCALL(uptime)
 33c:	b8 0e 00 00 00       	mov    $0xe,%eax
 341:	cd 40                	int    $0x40
 343:	c3                   	ret

00000344 <ps>:
SYSCALL(ps)
 344:	b8 16 00 00 00       	mov    $0x16,%eax
 349:	cd 40                	int    $0x40
 34b:	c3                   	ret
