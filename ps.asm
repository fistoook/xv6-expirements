
_ps:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	e8 6d 02 00 00       	call   278 <ps>
   b:	e8 c8 01 00 00       	call   1d8 <exit>

00000010 <strcpy>:
  10:	55                   	push   %ebp
  11:	89 e5                	mov    %esp,%ebp
  13:	53                   	push   %ebx
  14:	8b 4d 08             	mov    0x8(%ebp),%ecx
  17:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  1a:	b8 00 00 00 00       	mov    $0x0,%eax
  1f:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  23:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  26:	83 c0 01             	add    $0x1,%eax
  29:	84 d2                	test   %dl,%dl
  2b:	75 f2                	jne    1f <strcpy+0xf>
  2d:	89 c8                	mov    %ecx,%eax
  2f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  32:	c9                   	leave
  33:	c3                   	ret

00000034 <strcmp>:
  34:	55                   	push   %ebp
  35:	89 e5                	mov    %esp,%ebp
  37:	8b 4d 08             	mov    0x8(%ebp),%ecx
  3a:	8b 55 0c             	mov    0xc(%ebp),%edx
  3d:	0f b6 01             	movzbl (%ecx),%eax
  40:	84 c0                	test   %al,%al
  42:	74 11                	je     55 <strcmp+0x21>
  44:	38 02                	cmp    %al,(%edx)
  46:	75 0d                	jne    55 <strcmp+0x21>
  48:	83 c1 01             	add    $0x1,%ecx
  4b:	83 c2 01             	add    $0x1,%edx
  4e:	0f b6 01             	movzbl (%ecx),%eax
  51:	84 c0                	test   %al,%al
  53:	75 ef                	jne    44 <strcmp+0x10>
  55:	0f b6 c0             	movzbl %al,%eax
  58:	0f b6 12             	movzbl (%edx),%edx
  5b:	29 d0                	sub    %edx,%eax
  5d:	5d                   	pop    %ebp
  5e:	c3                   	ret

0000005f <strlen>:
  5f:	55                   	push   %ebp
  60:	89 e5                	mov    %esp,%ebp
  62:	8b 55 08             	mov    0x8(%ebp),%edx
  65:	80 3a 00             	cmpb   $0x0,(%edx)
  68:	74 14                	je     7e <strlen+0x1f>
  6a:	b8 00 00 00 00       	mov    $0x0,%eax
  6f:	83 c0 01             	add    $0x1,%eax
  72:	89 c1                	mov    %eax,%ecx
  74:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  78:	75 f5                	jne    6f <strlen+0x10>
  7a:	89 c8                	mov    %ecx,%eax
  7c:	5d                   	pop    %ebp
  7d:	c3                   	ret
  7e:	b9 00 00 00 00       	mov    $0x0,%ecx
  83:	eb f5                	jmp    7a <strlen+0x1b>

00000085 <memset>:
  85:	55                   	push   %ebp
  86:	89 e5                	mov    %esp,%ebp
  88:	57                   	push   %edi
  89:	8b 55 08             	mov    0x8(%ebp),%edx
  8c:	89 d7                	mov    %edx,%edi
  8e:	8b 4d 10             	mov    0x10(%ebp),%ecx
  91:	8b 45 0c             	mov    0xc(%ebp),%eax
  94:	fc                   	cld
  95:	f3 aa                	rep stos %al,%es:(%edi)
  97:	89 d0                	mov    %edx,%eax
  99:	8b 7d fc             	mov    -0x4(%ebp),%edi
  9c:	c9                   	leave
  9d:	c3                   	ret

0000009e <strchr>:
  9e:	55                   	push   %ebp
  9f:	89 e5                	mov    %esp,%ebp
  a1:	8b 45 08             	mov    0x8(%ebp),%eax
  a4:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  a8:	0f b6 10             	movzbl (%eax),%edx
  ab:	84 d2                	test   %dl,%dl
  ad:	74 15                	je     c4 <strchr+0x26>
  af:	38 d1                	cmp    %dl,%cl
  b1:	74 0f                	je     c2 <strchr+0x24>
  b3:	83 c0 01             	add    $0x1,%eax
  b6:	0f b6 10             	movzbl (%eax),%edx
  b9:	84 d2                	test   %dl,%dl
  bb:	75 f2                	jne    af <strchr+0x11>
  bd:	b8 00 00 00 00       	mov    $0x0,%eax
  c2:	5d                   	pop    %ebp
  c3:	c3                   	ret
  c4:	b8 00 00 00 00       	mov    $0x0,%eax
  c9:	eb f7                	jmp    c2 <strchr+0x24>

000000cb <gets>:
  cb:	55                   	push   %ebp
  cc:	89 e5                	mov    %esp,%ebp
  ce:	57                   	push   %edi
  cf:	56                   	push   %esi
  d0:	53                   	push   %ebx
  d1:	83 ec 2c             	sub    $0x2c,%esp
  d4:	8b 75 08             	mov    0x8(%ebp),%esi
  d7:	bb 00 00 00 00       	mov    $0x0,%ebx
  dc:	8d 7d e7             	lea    -0x19(%ebp),%edi
  df:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
  e2:	83 c3 01             	add    $0x1,%ebx
  e5:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
  e8:	7d 27                	jge    111 <gets+0x46>
  ea:	83 ec 04             	sub    $0x4,%esp
  ed:	6a 01                	push   $0x1
  ef:	57                   	push   %edi
  f0:	6a 00                	push   $0x0
  f2:	e8 f9 00 00 00       	call   1f0 <read>
  f7:	83 c4 10             	add    $0x10,%esp
  fa:	85 c0                	test   %eax,%eax
  fc:	7e 13                	jle    111 <gets+0x46>
  fe:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 102:	88 44 1e ff          	mov    %al,-0x1(%esi,%ebx,1)
 106:	3c 0a                	cmp    $0xa,%al
 108:	74 04                	je     10e <gets+0x43>
 10a:	3c 0d                	cmp    $0xd,%al
 10c:	75 d1                	jne    df <gets+0x14>
 10e:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 111:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 114:	c6 04 06 00          	movb   $0x0,(%esi,%eax,1)
 118:	89 f0                	mov    %esi,%eax
 11a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 11d:	5b                   	pop    %ebx
 11e:	5e                   	pop    %esi
 11f:	5f                   	pop    %edi
 120:	5d                   	pop    %ebp
 121:	c3                   	ret

00000122 <stat>:
 122:	55                   	push   %ebp
 123:	89 e5                	mov    %esp,%ebp
 125:	56                   	push   %esi
 126:	53                   	push   %ebx
 127:	83 ec 08             	sub    $0x8,%esp
 12a:	6a 00                	push   $0x0
 12c:	ff 75 08             	push   0x8(%ebp)
 12f:	e8 e4 00 00 00       	call   218 <open>
 134:	83 c4 10             	add    $0x10,%esp
 137:	85 c0                	test   %eax,%eax
 139:	78 24                	js     15f <stat+0x3d>
 13b:	89 c3                	mov    %eax,%ebx
 13d:	83 ec 08             	sub    $0x8,%esp
 140:	ff 75 0c             	push   0xc(%ebp)
 143:	50                   	push   %eax
 144:	e8 e7 00 00 00       	call   230 <fstat>
 149:	89 c6                	mov    %eax,%esi
 14b:	89 1c 24             	mov    %ebx,(%esp)
 14e:	e8 ad 00 00 00       	call   200 <close>
 153:	83 c4 10             	add    $0x10,%esp
 156:	89 f0                	mov    %esi,%eax
 158:	8d 65 f8             	lea    -0x8(%ebp),%esp
 15b:	5b                   	pop    %ebx
 15c:	5e                   	pop    %esi
 15d:	5d                   	pop    %ebp
 15e:	c3                   	ret
 15f:	be ff ff ff ff       	mov    $0xffffffff,%esi
 164:	eb f0                	jmp    156 <stat+0x34>

00000166 <atoi>:
 166:	55                   	push   %ebp
 167:	89 e5                	mov    %esp,%ebp
 169:	53                   	push   %ebx
 16a:	8b 55 08             	mov    0x8(%ebp),%edx
 16d:	0f b6 02             	movzbl (%edx),%eax
 170:	8d 48 d0             	lea    -0x30(%eax),%ecx
 173:	80 f9 09             	cmp    $0x9,%cl
 176:	77 24                	ja     19c <atoi+0x36>
 178:	b9 00 00 00 00       	mov    $0x0,%ecx
 17d:	83 c2 01             	add    $0x1,%edx
 180:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 183:	0f be c0             	movsbl %al,%eax
 186:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
 18a:	0f b6 02             	movzbl (%edx),%eax
 18d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 190:	80 fb 09             	cmp    $0x9,%bl
 193:	76 e8                	jbe    17d <atoi+0x17>
 195:	89 c8                	mov    %ecx,%eax
 197:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 19a:	c9                   	leave
 19b:	c3                   	ret
 19c:	b9 00 00 00 00       	mov    $0x0,%ecx
 1a1:	eb f2                	jmp    195 <atoi+0x2f>

000001a3 <memmove>:
 1a3:	55                   	push   %ebp
 1a4:	89 e5                	mov    %esp,%ebp
 1a6:	56                   	push   %esi
 1a7:	53                   	push   %ebx
 1a8:	8b 75 08             	mov    0x8(%ebp),%esi
 1ab:	8b 55 0c             	mov    0xc(%ebp),%edx
 1ae:	8b 5d 10             	mov    0x10(%ebp),%ebx
 1b1:	85 db                	test   %ebx,%ebx
 1b3:	7e 15                	jle    1ca <memmove+0x27>
 1b5:	01 f3                	add    %esi,%ebx
 1b7:	89 f0                	mov    %esi,%eax
 1b9:	83 c2 01             	add    $0x1,%edx
 1bc:	83 c0 01             	add    $0x1,%eax
 1bf:	0f b6 4a ff          	movzbl -0x1(%edx),%ecx
 1c3:	88 48 ff             	mov    %cl,-0x1(%eax)
 1c6:	39 c3                	cmp    %eax,%ebx
 1c8:	75 ef                	jne    1b9 <memmove+0x16>
 1ca:	89 f0                	mov    %esi,%eax
 1cc:	5b                   	pop    %ebx
 1cd:	5e                   	pop    %esi
 1ce:	5d                   	pop    %ebp
 1cf:	c3                   	ret

000001d0 <fork>:
  name: \
    movl $1, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALLFORK(fork) //instead of SYSCALL(fork) !!!
 1d0:	b8 01 00 00 00       	mov    $0x1,%eax
 1d5:	cd 40                	int    $0x40
 1d7:	c3                   	ret

000001d8 <exit>:
//SYSCALL(fork)
SYSCALL(exit)
 1d8:	b8 02 00 00 00       	mov    $0x2,%eax
 1dd:	cd 40                	int    $0x40
 1df:	c3                   	ret

000001e0 <wait>:
SYSCALL(wait)
 1e0:	b8 03 00 00 00       	mov    $0x3,%eax
 1e5:	cd 40                	int    $0x40
 1e7:	c3                   	ret

000001e8 <pipe>:
SYSCALL(pipe)
 1e8:	b8 04 00 00 00       	mov    $0x4,%eax
 1ed:	cd 40                	int    $0x40
 1ef:	c3                   	ret

000001f0 <read>:
SYSCALL(read)
 1f0:	b8 05 00 00 00       	mov    $0x5,%eax
 1f5:	cd 40                	int    $0x40
 1f7:	c3                   	ret

000001f8 <write>:
SYSCALL(write)
 1f8:	b8 10 00 00 00       	mov    $0x10,%eax
 1fd:	cd 40                	int    $0x40
 1ff:	c3                   	ret

00000200 <close>:
SYSCALL(close)
 200:	b8 15 00 00 00       	mov    $0x15,%eax
 205:	cd 40                	int    $0x40
 207:	c3                   	ret

00000208 <kill>:
SYSCALL(kill)
 208:	b8 06 00 00 00       	mov    $0x6,%eax
 20d:	cd 40                	int    $0x40
 20f:	c3                   	ret

00000210 <exec>:
SYSCALL(exec)
 210:	b8 07 00 00 00       	mov    $0x7,%eax
 215:	cd 40                	int    $0x40
 217:	c3                   	ret

00000218 <open>:
SYSCALL(open)
 218:	b8 0f 00 00 00       	mov    $0xf,%eax
 21d:	cd 40                	int    $0x40
 21f:	c3                   	ret

00000220 <mknod>:
SYSCALL(mknod)
 220:	b8 11 00 00 00       	mov    $0x11,%eax
 225:	cd 40                	int    $0x40
 227:	c3                   	ret

00000228 <unlink>:
SYSCALL(unlink)
 228:	b8 12 00 00 00       	mov    $0x12,%eax
 22d:	cd 40                	int    $0x40
 22f:	c3                   	ret

00000230 <fstat>:
SYSCALL(fstat)
 230:	b8 08 00 00 00       	mov    $0x8,%eax
 235:	cd 40                	int    $0x40
 237:	c3                   	ret

00000238 <link>:
SYSCALL(link)
 238:	b8 13 00 00 00       	mov    $0x13,%eax
 23d:	cd 40                	int    $0x40
 23f:	c3                   	ret

00000240 <mkdir>:
SYSCALL(mkdir)
 240:	b8 14 00 00 00       	mov    $0x14,%eax
 245:	cd 40                	int    $0x40
 247:	c3                   	ret

00000248 <chdir>:
SYSCALL(chdir)
 248:	b8 09 00 00 00       	mov    $0x9,%eax
 24d:	cd 40                	int    $0x40
 24f:	c3                   	ret

00000250 <dup>:
SYSCALL(dup)
 250:	b8 0a 00 00 00       	mov    $0xa,%eax
 255:	cd 40                	int    $0x40
 257:	c3                   	ret

00000258 <getpid>:
SYSCALL(getpid)
 258:	b8 0b 00 00 00       	mov    $0xb,%eax
 25d:	cd 40                	int    $0x40
 25f:	c3                   	ret

00000260 <sbrk>:
SYSCALL(sbrk)
 260:	b8 0c 00 00 00       	mov    $0xc,%eax
 265:	cd 40                	int    $0x40
 267:	c3                   	ret

00000268 <sleep>:
SYSCALL(sleep)
 268:	b8 0d 00 00 00       	mov    $0xd,%eax
 26d:	cd 40                	int    $0x40
 26f:	c3                   	ret

00000270 <uptime>:
SYSCALL(uptime)
 270:	b8 0e 00 00 00       	mov    $0xe,%eax
 275:	cd 40                	int    $0x40
 277:	c3                   	ret

00000278 <ps>:
SYSCALL(ps)
 278:	b8 16 00 00 00       	mov    $0x16,%eax
 27d:	cd 40                	int    $0x40
 27f:	c3                   	ret

00000280 <printint>:
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	57                   	push   %edi
 284:	56                   	push   %esi
 285:	53                   	push   %ebx
 286:	83 ec 3c             	sub    $0x3c,%esp
 289:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 28c:	89 ce                	mov    %ecx,%esi
 28e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 292:	74 79                	je     30d <printint+0x8d>
 294:	85 d2                	test   %edx,%edx
 296:	79 75                	jns    30d <printint+0x8d>
 298:	89 d1                	mov    %edx,%ecx
 29a:	f7 d9                	neg    %ecx
 29c:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
 2a3:	bb 00 00 00 00       	mov    $0x0,%ebx
 2a8:	89 df                	mov    %ebx,%edi
 2aa:	83 c3 01             	add    $0x1,%ebx
 2ad:	89 c8                	mov    %ecx,%eax
 2af:	ba 00 00 00 00       	mov    $0x0,%edx
 2b4:	f7 f6                	div    %esi
 2b6:	0f b6 92 70 06 00 00 	movzbl 0x670(%edx),%edx
 2bd:	88 54 1d d7          	mov    %dl,-0x29(%ebp,%ebx,1)
 2c1:	89 ca                	mov    %ecx,%edx
 2c3:	89 c1                	mov    %eax,%ecx
 2c5:	39 f2                	cmp    %esi,%edx
 2c7:	73 df                	jae    2a8 <printint+0x28>
 2c9:	83 7d c0 00          	cmpl   $0x0,-0x40(%ebp)
 2cd:	74 08                	je     2d7 <printint+0x57>
 2cf:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 2d4:	8d 5f 02             	lea    0x2(%edi),%ebx
 2d7:	85 db                	test   %ebx,%ebx
 2d9:	7e 2a                	jle    305 <printint+0x85>
 2db:	8d 75 d8             	lea    -0x28(%ebp),%esi
 2de:	8d 5c 1d d7          	lea    -0x29(%ebp,%ebx,1),%ebx
 2e2:	8d 7d d7             	lea    -0x29(%ebp),%edi
 2e5:	0f b6 03             	movzbl (%ebx),%eax
 2e8:	88 45 d7             	mov    %al,-0x29(%ebp)
 2eb:	83 ec 04             	sub    $0x4,%esp
 2ee:	6a 01                	push   $0x1
 2f0:	57                   	push   %edi
 2f1:	ff 75 c4             	push   -0x3c(%ebp)
 2f4:	e8 ff fe ff ff       	call   1f8 <write>
 2f9:	89 d8                	mov    %ebx,%eax
 2fb:	83 eb 01             	sub    $0x1,%ebx
 2fe:	83 c4 10             	add    $0x10,%esp
 301:	39 f0                	cmp    %esi,%eax
 303:	75 e0                	jne    2e5 <printint+0x65>
 305:	8d 65 f4             	lea    -0xc(%ebp),%esp
 308:	5b                   	pop    %ebx
 309:	5e                   	pop    %esi
 30a:	5f                   	pop    %edi
 30b:	5d                   	pop    %ebp
 30c:	c3                   	ret
 30d:	89 d1                	mov    %edx,%ecx
 30f:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
 316:	eb 8b                	jmp    2a3 <printint+0x23>

00000318 <printf>:
 318:	55                   	push   %ebp
 319:	89 e5                	mov    %esp,%ebp
 31b:	57                   	push   %edi
 31c:	56                   	push   %esi
 31d:	53                   	push   %ebx
 31e:	83 ec 2c             	sub    $0x2c,%esp
 321:	8b 75 0c             	mov    0xc(%ebp),%esi
 324:	0f b6 1e             	movzbl (%esi),%ebx
 327:	84 db                	test   %bl,%bl
 329:	0f 84 9e 01 00 00    	je     4cd <printf+0x1b5>
 32f:	83 c6 01             	add    $0x1,%esi
 332:	8d 45 10             	lea    0x10(%ebp),%eax
 335:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 338:	bf 00 00 00 00       	mov    $0x0,%edi
 33d:	eb 2d                	jmp    36c <printf+0x54>
 33f:	88 5d e7             	mov    %bl,-0x19(%ebp)
 342:	83 ec 04             	sub    $0x4,%esp
 345:	6a 01                	push   $0x1
 347:	8d 45 e7             	lea    -0x19(%ebp),%eax
 34a:	50                   	push   %eax
 34b:	ff 75 08             	push   0x8(%ebp)
 34e:	e8 a5 fe ff ff       	call   1f8 <write>
 353:	83 c4 10             	add    $0x10,%esp
 356:	eb 05                	jmp    35d <printf+0x45>
 358:	83 ff 25             	cmp    $0x25,%edi
 35b:	74 1f                	je     37c <printf+0x64>
 35d:	83 c6 01             	add    $0x1,%esi
 360:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 364:	84 db                	test   %bl,%bl
 366:	0f 84 61 01 00 00    	je     4cd <printf+0x1b5>
 36c:	0f b6 c3             	movzbl %bl,%eax
 36f:	85 ff                	test   %edi,%edi
 371:	75 e5                	jne    358 <printf+0x40>
 373:	83 f8 25             	cmp    $0x25,%eax
 376:	75 c7                	jne    33f <printf+0x27>
 378:	89 c7                	mov    %eax,%edi
 37a:	eb e1                	jmp    35d <printf+0x45>
 37c:	83 f8 25             	cmp    $0x25,%eax
 37f:	0f 84 f4 00 00 00    	je     479 <printf+0x161>
 385:	8d 50 9d             	lea    -0x63(%eax),%edx
 388:	83 fa 15             	cmp    $0x15,%edx
 38b:	0f 87 09 01 00 00    	ja     49a <printf+0x182>
 391:	0f 87 03 01 00 00    	ja     49a <printf+0x182>
 397:	ff 24 95 18 06 00 00 	jmp    *0x618(,%edx,4)
 39e:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 3a1:	8b 17                	mov    (%edi),%edx
 3a3:	83 ec 0c             	sub    $0xc,%esp
 3a6:	6a 01                	push   $0x1
 3a8:	b9 0a 00 00 00       	mov    $0xa,%ecx
 3ad:	8b 45 08             	mov    0x8(%ebp),%eax
 3b0:	e8 cb fe ff ff       	call   280 <printint>
 3b5:	83 c7 04             	add    $0x4,%edi
 3b8:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 3bb:	83 c4 10             	add    $0x10,%esp
 3be:	bf 00 00 00 00       	mov    $0x0,%edi
 3c3:	eb 98                	jmp    35d <printf+0x45>
 3c5:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 3c8:	8b 17                	mov    (%edi),%edx
 3ca:	83 ec 0c             	sub    $0xc,%esp
 3cd:	6a 00                	push   $0x0
 3cf:	b9 10 00 00 00       	mov    $0x10,%ecx
 3d4:	8b 45 08             	mov    0x8(%ebp),%eax
 3d7:	e8 a4 fe ff ff       	call   280 <printint>
 3dc:	83 c7 04             	add    $0x4,%edi
 3df:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 3e2:	83 c4 10             	add    $0x10,%esp
 3e5:	bf 00 00 00 00       	mov    $0x0,%edi
 3ea:	e9 6e ff ff ff       	jmp    35d <printf+0x45>
 3ef:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
 3f2:	8b 01                	mov    (%ecx),%eax
 3f4:	83 c1 04             	add    $0x4,%ecx
 3f7:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 3fa:	85 c0                	test   %eax,%eax
 3fc:	74 13                	je     411 <printf+0xf9>
 3fe:	89 c3                	mov    %eax,%ebx
 400:	0f b6 00             	movzbl (%eax),%eax
 403:	bf 00 00 00 00       	mov    $0x0,%edi
 408:	84 c0                	test   %al,%al
 40a:	75 0f                	jne    41b <printf+0x103>
 40c:	e9 4c ff ff ff       	jmp    35d <printf+0x45>
 411:	bb 10 06 00 00       	mov    $0x610,%ebx
 416:	b8 28 00 00 00       	mov    $0x28,%eax
 41b:	8d 7d e7             	lea    -0x19(%ebp),%edi
 41e:	89 75 d0             	mov    %esi,-0x30(%ebp)
 421:	8b 75 08             	mov    0x8(%ebp),%esi
 424:	88 45 e7             	mov    %al,-0x19(%ebp)
 427:	83 ec 04             	sub    $0x4,%esp
 42a:	6a 01                	push   $0x1
 42c:	57                   	push   %edi
 42d:	56                   	push   %esi
 42e:	e8 c5 fd ff ff       	call   1f8 <write>
 433:	83 c3 01             	add    $0x1,%ebx
 436:	0f b6 03             	movzbl (%ebx),%eax
 439:	83 c4 10             	add    $0x10,%esp
 43c:	84 c0                	test   %al,%al
 43e:	75 e4                	jne    424 <printf+0x10c>
 440:	8b 75 d0             	mov    -0x30(%ebp),%esi
 443:	bf 00 00 00 00       	mov    $0x0,%edi
 448:	e9 10 ff ff ff       	jmp    35d <printf+0x45>
 44d:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 450:	8b 07                	mov    (%edi),%eax
 452:	88 45 e7             	mov    %al,-0x19(%ebp)
 455:	83 ec 04             	sub    $0x4,%esp
 458:	6a 01                	push   $0x1
 45a:	8d 45 e7             	lea    -0x19(%ebp),%eax
 45d:	50                   	push   %eax
 45e:	ff 75 08             	push   0x8(%ebp)
 461:	e8 92 fd ff ff       	call   1f8 <write>
 466:	83 c7 04             	add    $0x4,%edi
 469:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 46c:	83 c4 10             	add    $0x10,%esp
 46f:	bf 00 00 00 00       	mov    $0x0,%edi
 474:	e9 e4 fe ff ff       	jmp    35d <printf+0x45>
 479:	88 5d e7             	mov    %bl,-0x19(%ebp)
 47c:	83 ec 04             	sub    $0x4,%esp
 47f:	6a 01                	push   $0x1
 481:	8d 45 e7             	lea    -0x19(%ebp),%eax
 484:	50                   	push   %eax
 485:	ff 75 08             	push   0x8(%ebp)
 488:	e8 6b fd ff ff       	call   1f8 <write>
 48d:	83 c4 10             	add    $0x10,%esp
 490:	bf 00 00 00 00       	mov    $0x0,%edi
 495:	e9 c3 fe ff ff       	jmp    35d <printf+0x45>
 49a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 49e:	83 ec 04             	sub    $0x4,%esp
 4a1:	6a 01                	push   $0x1
 4a3:	8d 7d e7             	lea    -0x19(%ebp),%edi
 4a6:	57                   	push   %edi
 4a7:	ff 75 08             	push   0x8(%ebp)
 4aa:	e8 49 fd ff ff       	call   1f8 <write>
 4af:	88 5d e7             	mov    %bl,-0x19(%ebp)
 4b2:	83 c4 0c             	add    $0xc,%esp
 4b5:	6a 01                	push   $0x1
 4b7:	57                   	push   %edi
 4b8:	ff 75 08             	push   0x8(%ebp)
 4bb:	e8 38 fd ff ff       	call   1f8 <write>
 4c0:	83 c4 10             	add    $0x10,%esp
 4c3:	bf 00 00 00 00       	mov    $0x0,%edi
 4c8:	e9 90 fe ff ff       	jmp    35d <printf+0x45>
 4cd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4d0:	5b                   	pop    %ebx
 4d1:	5e                   	pop    %esi
 4d2:	5f                   	pop    %edi
 4d3:	5d                   	pop    %ebp
 4d4:	c3                   	ret

000004d5 <free>:
 4d5:	55                   	push   %ebp
 4d6:	89 e5                	mov    %esp,%ebp
 4d8:	57                   	push   %edi
 4d9:	56                   	push   %esi
 4da:	53                   	push   %ebx
 4db:	8b 5d 08             	mov    0x8(%ebp),%ebx
 4de:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 4e1:	a1 d0 08 00 00       	mov    0x8d0,%eax
 4e6:	eb 0c                	jmp    4f4 <free+0x1f>
 4e8:	8b 10                	mov    (%eax),%edx
 4ea:	39 d0                	cmp    %edx,%eax
 4ec:	72 04                	jb     4f2 <free+0x1d>
 4ee:	39 d1                	cmp    %edx,%ecx
 4f0:	72 10                	jb     502 <free+0x2d>
 4f2:	89 d0                	mov    %edx,%eax
 4f4:	39 c8                	cmp    %ecx,%eax
 4f6:	73 f0                	jae    4e8 <free+0x13>
 4f8:	8b 10                	mov    (%eax),%edx
 4fa:	39 d1                	cmp    %edx,%ecx
 4fc:	72 04                	jb     502 <free+0x2d>
 4fe:	39 d0                	cmp    %edx,%eax
 500:	72 f0                	jb     4f2 <free+0x1d>
 502:	8b 73 fc             	mov    -0x4(%ebx),%esi
 505:	8b 10                	mov    (%eax),%edx
 507:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 50a:	39 fa                	cmp    %edi,%edx
 50c:	74 19                	je     527 <free+0x52>
 50e:	89 53 f8             	mov    %edx,-0x8(%ebx)
 511:	8b 50 04             	mov    0x4(%eax),%edx
 514:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 517:	39 f1                	cmp    %esi,%ecx
 519:	74 18                	je     533 <free+0x5e>
 51b:	89 08                	mov    %ecx,(%eax)
 51d:	a3 d0 08 00 00       	mov    %eax,0x8d0
 522:	5b                   	pop    %ebx
 523:	5e                   	pop    %esi
 524:	5f                   	pop    %edi
 525:	5d                   	pop    %ebp
 526:	c3                   	ret
 527:	03 72 04             	add    0x4(%edx),%esi
 52a:	89 73 fc             	mov    %esi,-0x4(%ebx)
 52d:	8b 10                	mov    (%eax),%edx
 52f:	8b 12                	mov    (%edx),%edx
 531:	eb db                	jmp    50e <free+0x39>
 533:	03 53 fc             	add    -0x4(%ebx),%edx
 536:	89 50 04             	mov    %edx,0x4(%eax)
 539:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 53c:	eb dd                	jmp    51b <free+0x46>

0000053e <malloc>:
 53e:	55                   	push   %ebp
 53f:	89 e5                	mov    %esp,%ebp
 541:	57                   	push   %edi
 542:	56                   	push   %esi
 543:	53                   	push   %ebx
 544:	83 ec 0c             	sub    $0xc,%esp
 547:	8b 45 08             	mov    0x8(%ebp),%eax
 54a:	8d 58 07             	lea    0x7(%eax),%ebx
 54d:	c1 eb 03             	shr    $0x3,%ebx
 550:	83 c3 01             	add    $0x1,%ebx
 553:	8b 15 d0 08 00 00    	mov    0x8d0,%edx
 559:	85 d2                	test   %edx,%edx
 55b:	74 1c                	je     579 <malloc+0x3b>
 55d:	8b 02                	mov    (%edx),%eax
 55f:	8b 48 04             	mov    0x4(%eax),%ecx
 562:	39 d9                	cmp    %ebx,%ecx
 564:	73 38                	jae    59e <malloc+0x60>
 566:	be 00 10 00 00       	mov    $0x1000,%esi
 56b:	39 f3                	cmp    %esi,%ebx
 56d:	0f 43 f3             	cmovae %ebx,%esi
 570:	8d 3c f5 00 00 00 00 	lea    0x0(,%esi,8),%edi
 577:	eb 72                	jmp    5eb <malloc+0xad>
 579:	c7 05 d0 08 00 00 d4 	movl   $0x8d4,0x8d0
 580:	08 00 00 
 583:	c7 05 d4 08 00 00 d4 	movl   $0x8d4,0x8d4
 58a:	08 00 00 
 58d:	c7 05 d8 08 00 00 00 	movl   $0x0,0x8d8
 594:	00 00 00 
 597:	b8 d4 08 00 00       	mov    $0x8d4,%eax
 59c:	eb c8                	jmp    566 <malloc+0x28>
 59e:	39 cb                	cmp    %ecx,%ebx
 5a0:	74 1e                	je     5c0 <malloc+0x82>
 5a2:	29 d9                	sub    %ebx,%ecx
 5a4:	89 48 04             	mov    %ecx,0x4(%eax)
 5a7:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 5aa:	89 58 04             	mov    %ebx,0x4(%eax)
 5ad:	89 15 d0 08 00 00    	mov    %edx,0x8d0
 5b3:	8d 50 08             	lea    0x8(%eax),%edx
 5b6:	89 d0                	mov    %edx,%eax
 5b8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5bb:	5b                   	pop    %ebx
 5bc:	5e                   	pop    %esi
 5bd:	5f                   	pop    %edi
 5be:	5d                   	pop    %ebp
 5bf:	c3                   	ret
 5c0:	8b 08                	mov    (%eax),%ecx
 5c2:	89 0a                	mov    %ecx,(%edx)
 5c4:	eb e7                	jmp    5ad <malloc+0x6f>
 5c6:	89 70 04             	mov    %esi,0x4(%eax)
 5c9:	83 ec 0c             	sub    $0xc,%esp
 5cc:	83 c0 08             	add    $0x8,%eax
 5cf:	50                   	push   %eax
 5d0:	e8 00 ff ff ff       	call   4d5 <free>
 5d5:	8b 15 d0 08 00 00    	mov    0x8d0,%edx
 5db:	83 c4 10             	add    $0x10,%esp
 5de:	85 d2                	test   %edx,%edx
 5e0:	74 d4                	je     5b6 <malloc+0x78>
 5e2:	8b 02                	mov    (%edx),%eax
 5e4:	8b 48 04             	mov    0x4(%eax),%ecx
 5e7:	39 d9                	cmp    %ebx,%ecx
 5e9:	73 b3                	jae    59e <malloc+0x60>
 5eb:	89 c2                	mov    %eax,%edx
 5ed:	39 05 d0 08 00 00    	cmp    %eax,0x8d0
 5f3:	75 ed                	jne    5e2 <malloc+0xa4>
 5f5:	83 ec 0c             	sub    $0xc,%esp
 5f8:	57                   	push   %edi
 5f9:	e8 62 fc ff ff       	call   260 <sbrk>
 5fe:	83 c4 10             	add    $0x10,%esp
 601:	83 f8 ff             	cmp    $0xffffffff,%eax
 604:	75 c0                	jne    5c6 <malloc+0x88>
 606:	ba 00 00 00 00       	mov    $0x0,%edx
 60b:	eb a9                	jmp    5b6 <malloc+0x78>
