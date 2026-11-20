
_echo:     file format elf32-i386


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
  14:	8b 31                	mov    (%ecx),%esi
  16:	8b 79 04             	mov    0x4(%ecx),%edi
  19:	83 fe 01             	cmp    $0x1,%esi
  1c:	7e 3f                	jle    5d <main+0x5d>
  1e:	b8 01 00 00 00       	mov    $0x1,%eax
  23:	eb 1a                	jmp    3f <main+0x3f>
  25:	68 60 06 00 00       	push   $0x660
  2a:	ff 74 9f fc          	push   -0x4(%edi,%ebx,4)
  2e:	68 62 06 00 00       	push   $0x662
  33:	6a 01                	push   $0x1
  35:	e8 30 03 00 00       	call   36a <printf>
  3a:	83 c4 10             	add    $0x10,%esp
  3d:	89 d8                	mov    %ebx,%eax
  3f:	8d 58 01             	lea    0x1(%eax),%ebx
  42:	39 f3                	cmp    %esi,%ebx
  44:	75 df                	jne    25 <main+0x25>
  46:	68 67 06 00 00       	push   $0x667
  4b:	ff 34 87             	push   (%edi,%eax,4)
  4e:	68 62 06 00 00       	push   $0x662
  53:	6a 01                	push   $0x1
  55:	e8 10 03 00 00       	call   36a <printf>
  5a:	83 c4 10             	add    $0x10,%esp
  5d:	e8 c8 01 00 00       	call   22a <exit>

00000062 <strcpy>:
  62:	55                   	push   %ebp
  63:	89 e5                	mov    %esp,%ebp
  65:	53                   	push   %ebx
  66:	8b 4d 08             	mov    0x8(%ebp),%ecx
  69:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  6c:	b8 00 00 00 00       	mov    $0x0,%eax
  71:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  75:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  78:	83 c0 01             	add    $0x1,%eax
  7b:	84 d2                	test   %dl,%dl
  7d:	75 f2                	jne    71 <strcpy+0xf>
  7f:	89 c8                	mov    %ecx,%eax
  81:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  84:	c9                   	leave
  85:	c3                   	ret

00000086 <strcmp>:
  86:	55                   	push   %ebp
  87:	89 e5                	mov    %esp,%ebp
  89:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8c:	8b 55 0c             	mov    0xc(%ebp),%edx
  8f:	0f b6 01             	movzbl (%ecx),%eax
  92:	84 c0                	test   %al,%al
  94:	74 11                	je     a7 <strcmp+0x21>
  96:	38 02                	cmp    %al,(%edx)
  98:	75 0d                	jne    a7 <strcmp+0x21>
  9a:	83 c1 01             	add    $0x1,%ecx
  9d:	83 c2 01             	add    $0x1,%edx
  a0:	0f b6 01             	movzbl (%ecx),%eax
  a3:	84 c0                	test   %al,%al
  a5:	75 ef                	jne    96 <strcmp+0x10>
  a7:	0f b6 c0             	movzbl %al,%eax
  aa:	0f b6 12             	movzbl (%edx),%edx
  ad:	29 d0                	sub    %edx,%eax
  af:	5d                   	pop    %ebp
  b0:	c3                   	ret

000000b1 <strlen>:
  b1:	55                   	push   %ebp
  b2:	89 e5                	mov    %esp,%ebp
  b4:	8b 55 08             	mov    0x8(%ebp),%edx
  b7:	80 3a 00             	cmpb   $0x0,(%edx)
  ba:	74 14                	je     d0 <strlen+0x1f>
  bc:	b8 00 00 00 00       	mov    $0x0,%eax
  c1:	83 c0 01             	add    $0x1,%eax
  c4:	89 c1                	mov    %eax,%ecx
  c6:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  ca:	75 f5                	jne    c1 <strlen+0x10>
  cc:	89 c8                	mov    %ecx,%eax
  ce:	5d                   	pop    %ebp
  cf:	c3                   	ret
  d0:	b9 00 00 00 00       	mov    $0x0,%ecx
  d5:	eb f5                	jmp    cc <strlen+0x1b>

000000d7 <memset>:
  d7:	55                   	push   %ebp
  d8:	89 e5                	mov    %esp,%ebp
  da:	57                   	push   %edi
  db:	8b 55 08             	mov    0x8(%ebp),%edx
  de:	89 d7                	mov    %edx,%edi
  e0:	8b 4d 10             	mov    0x10(%ebp),%ecx
  e3:	8b 45 0c             	mov    0xc(%ebp),%eax
  e6:	fc                   	cld
  e7:	f3 aa                	rep stos %al,%es:(%edi)
  e9:	89 d0                	mov    %edx,%eax
  eb:	8b 7d fc             	mov    -0x4(%ebp),%edi
  ee:	c9                   	leave
  ef:	c3                   	ret

000000f0 <strchr>:
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	8b 45 08             	mov    0x8(%ebp),%eax
  f6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  fa:	0f b6 10             	movzbl (%eax),%edx
  fd:	84 d2                	test   %dl,%dl
  ff:	74 15                	je     116 <strchr+0x26>
 101:	38 d1                	cmp    %dl,%cl
 103:	74 0f                	je     114 <strchr+0x24>
 105:	83 c0 01             	add    $0x1,%eax
 108:	0f b6 10             	movzbl (%eax),%edx
 10b:	84 d2                	test   %dl,%dl
 10d:	75 f2                	jne    101 <strchr+0x11>
 10f:	b8 00 00 00 00       	mov    $0x0,%eax
 114:	5d                   	pop    %ebp
 115:	c3                   	ret
 116:	b8 00 00 00 00       	mov    $0x0,%eax
 11b:	eb f7                	jmp    114 <strchr+0x24>

0000011d <gets>:
 11d:	55                   	push   %ebp
 11e:	89 e5                	mov    %esp,%ebp
 120:	57                   	push   %edi
 121:	56                   	push   %esi
 122:	53                   	push   %ebx
 123:	83 ec 2c             	sub    $0x2c,%esp
 126:	8b 75 08             	mov    0x8(%ebp),%esi
 129:	bb 00 00 00 00       	mov    $0x0,%ebx
 12e:	8d 7d e7             	lea    -0x19(%ebp),%edi
 131:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 134:	83 c3 01             	add    $0x1,%ebx
 137:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 13a:	7d 27                	jge    163 <gets+0x46>
 13c:	83 ec 04             	sub    $0x4,%esp
 13f:	6a 01                	push   $0x1
 141:	57                   	push   %edi
 142:	6a 00                	push   $0x0
 144:	e8 f9 00 00 00       	call   242 <read>
 149:	83 c4 10             	add    $0x10,%esp
 14c:	85 c0                	test   %eax,%eax
 14e:	7e 13                	jle    163 <gets+0x46>
 150:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 154:	88 44 1e ff          	mov    %al,-0x1(%esi,%ebx,1)
 158:	3c 0a                	cmp    $0xa,%al
 15a:	74 04                	je     160 <gets+0x43>
 15c:	3c 0d                	cmp    $0xd,%al
 15e:	75 d1                	jne    131 <gets+0x14>
 160:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 163:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 166:	c6 04 06 00          	movb   $0x0,(%esi,%eax,1)
 16a:	89 f0                	mov    %esi,%eax
 16c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 16f:	5b                   	pop    %ebx
 170:	5e                   	pop    %esi
 171:	5f                   	pop    %edi
 172:	5d                   	pop    %ebp
 173:	c3                   	ret

00000174 <stat>:
 174:	55                   	push   %ebp
 175:	89 e5                	mov    %esp,%ebp
 177:	56                   	push   %esi
 178:	53                   	push   %ebx
 179:	83 ec 08             	sub    $0x8,%esp
 17c:	6a 00                	push   $0x0
 17e:	ff 75 08             	push   0x8(%ebp)
 181:	e8 e4 00 00 00       	call   26a <open>
 186:	83 c4 10             	add    $0x10,%esp
 189:	85 c0                	test   %eax,%eax
 18b:	78 24                	js     1b1 <stat+0x3d>
 18d:	89 c3                	mov    %eax,%ebx
 18f:	83 ec 08             	sub    $0x8,%esp
 192:	ff 75 0c             	push   0xc(%ebp)
 195:	50                   	push   %eax
 196:	e8 e7 00 00 00       	call   282 <fstat>
 19b:	89 c6                	mov    %eax,%esi
 19d:	89 1c 24             	mov    %ebx,(%esp)
 1a0:	e8 ad 00 00 00       	call   252 <close>
 1a5:	83 c4 10             	add    $0x10,%esp
 1a8:	89 f0                	mov    %esi,%eax
 1aa:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1ad:	5b                   	pop    %ebx
 1ae:	5e                   	pop    %esi
 1af:	5d                   	pop    %ebp
 1b0:	c3                   	ret
 1b1:	be ff ff ff ff       	mov    $0xffffffff,%esi
 1b6:	eb f0                	jmp    1a8 <stat+0x34>

000001b8 <atoi>:
 1b8:	55                   	push   %ebp
 1b9:	89 e5                	mov    %esp,%ebp
 1bb:	53                   	push   %ebx
 1bc:	8b 55 08             	mov    0x8(%ebp),%edx
 1bf:	0f b6 02             	movzbl (%edx),%eax
 1c2:	8d 48 d0             	lea    -0x30(%eax),%ecx
 1c5:	80 f9 09             	cmp    $0x9,%cl
 1c8:	77 24                	ja     1ee <atoi+0x36>
 1ca:	b9 00 00 00 00       	mov    $0x0,%ecx
 1cf:	83 c2 01             	add    $0x1,%edx
 1d2:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 1d5:	0f be c0             	movsbl %al,%eax
 1d8:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
 1dc:	0f b6 02             	movzbl (%edx),%eax
 1df:	8d 58 d0             	lea    -0x30(%eax),%ebx
 1e2:	80 fb 09             	cmp    $0x9,%bl
 1e5:	76 e8                	jbe    1cf <atoi+0x17>
 1e7:	89 c8                	mov    %ecx,%eax
 1e9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1ec:	c9                   	leave
 1ed:	c3                   	ret
 1ee:	b9 00 00 00 00       	mov    $0x0,%ecx
 1f3:	eb f2                	jmp    1e7 <atoi+0x2f>

000001f5 <memmove>:
 1f5:	55                   	push   %ebp
 1f6:	89 e5                	mov    %esp,%ebp
 1f8:	56                   	push   %esi
 1f9:	53                   	push   %ebx
 1fa:	8b 75 08             	mov    0x8(%ebp),%esi
 1fd:	8b 55 0c             	mov    0xc(%ebp),%edx
 200:	8b 5d 10             	mov    0x10(%ebp),%ebx
 203:	85 db                	test   %ebx,%ebx
 205:	7e 15                	jle    21c <memmove+0x27>
 207:	01 f3                	add    %esi,%ebx
 209:	89 f0                	mov    %esi,%eax
 20b:	83 c2 01             	add    $0x1,%edx
 20e:	83 c0 01             	add    $0x1,%eax
 211:	0f b6 4a ff          	movzbl -0x1(%edx),%ecx
 215:	88 48 ff             	mov    %cl,-0x1(%eax)
 218:	39 c3                	cmp    %eax,%ebx
 21a:	75 ef                	jne    20b <memmove+0x16>
 21c:	89 f0                	mov    %esi,%eax
 21e:	5b                   	pop    %ebx
 21f:	5e                   	pop    %esi
 220:	5d                   	pop    %ebp
 221:	c3                   	ret

00000222 <fork>:
  name: \
    movl $1, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALLFORK(fork) //instead of SYSCALL(fork) !!!
 222:	b8 01 00 00 00       	mov    $0x1,%eax
 227:	cd 40                	int    $0x40
 229:	c3                   	ret

0000022a <exit>:
//SYSCALL(fork)
SYSCALL(exit)
 22a:	b8 02 00 00 00       	mov    $0x2,%eax
 22f:	cd 40                	int    $0x40
 231:	c3                   	ret

00000232 <wait>:
SYSCALL(wait)
 232:	b8 03 00 00 00       	mov    $0x3,%eax
 237:	cd 40                	int    $0x40
 239:	c3                   	ret

0000023a <pipe>:
SYSCALL(pipe)
 23a:	b8 04 00 00 00       	mov    $0x4,%eax
 23f:	cd 40                	int    $0x40
 241:	c3                   	ret

00000242 <read>:
SYSCALL(read)
 242:	b8 05 00 00 00       	mov    $0x5,%eax
 247:	cd 40                	int    $0x40
 249:	c3                   	ret

0000024a <write>:
SYSCALL(write)
 24a:	b8 10 00 00 00       	mov    $0x10,%eax
 24f:	cd 40                	int    $0x40
 251:	c3                   	ret

00000252 <close>:
SYSCALL(close)
 252:	b8 15 00 00 00       	mov    $0x15,%eax
 257:	cd 40                	int    $0x40
 259:	c3                   	ret

0000025a <kill>:
SYSCALL(kill)
 25a:	b8 06 00 00 00       	mov    $0x6,%eax
 25f:	cd 40                	int    $0x40
 261:	c3                   	ret

00000262 <exec>:
SYSCALL(exec)
 262:	b8 07 00 00 00       	mov    $0x7,%eax
 267:	cd 40                	int    $0x40
 269:	c3                   	ret

0000026a <open>:
SYSCALL(open)
 26a:	b8 0f 00 00 00       	mov    $0xf,%eax
 26f:	cd 40                	int    $0x40
 271:	c3                   	ret

00000272 <mknod>:
SYSCALL(mknod)
 272:	b8 11 00 00 00       	mov    $0x11,%eax
 277:	cd 40                	int    $0x40
 279:	c3                   	ret

0000027a <unlink>:
SYSCALL(unlink)
 27a:	b8 12 00 00 00       	mov    $0x12,%eax
 27f:	cd 40                	int    $0x40
 281:	c3                   	ret

00000282 <fstat>:
SYSCALL(fstat)
 282:	b8 08 00 00 00       	mov    $0x8,%eax
 287:	cd 40                	int    $0x40
 289:	c3                   	ret

0000028a <link>:
SYSCALL(link)
 28a:	b8 13 00 00 00       	mov    $0x13,%eax
 28f:	cd 40                	int    $0x40
 291:	c3                   	ret

00000292 <mkdir>:
SYSCALL(mkdir)
 292:	b8 14 00 00 00       	mov    $0x14,%eax
 297:	cd 40                	int    $0x40
 299:	c3                   	ret

0000029a <chdir>:
SYSCALL(chdir)
 29a:	b8 09 00 00 00       	mov    $0x9,%eax
 29f:	cd 40                	int    $0x40
 2a1:	c3                   	ret

000002a2 <dup>:
SYSCALL(dup)
 2a2:	b8 0a 00 00 00       	mov    $0xa,%eax
 2a7:	cd 40                	int    $0x40
 2a9:	c3                   	ret

000002aa <getpid>:
SYSCALL(getpid)
 2aa:	b8 0b 00 00 00       	mov    $0xb,%eax
 2af:	cd 40                	int    $0x40
 2b1:	c3                   	ret

000002b2 <sbrk>:
SYSCALL(sbrk)
 2b2:	b8 0c 00 00 00       	mov    $0xc,%eax
 2b7:	cd 40                	int    $0x40
 2b9:	c3                   	ret

000002ba <sleep>:
SYSCALL(sleep)
 2ba:	b8 0d 00 00 00       	mov    $0xd,%eax
 2bf:	cd 40                	int    $0x40
 2c1:	c3                   	ret

000002c2 <uptime>:
SYSCALL(uptime)
 2c2:	b8 0e 00 00 00       	mov    $0xe,%eax
 2c7:	cd 40                	int    $0x40
 2c9:	c3                   	ret

000002ca <ps>:
SYSCALL(ps)
 2ca:	b8 16 00 00 00       	mov    $0x16,%eax
 2cf:	cd 40                	int    $0x40
 2d1:	c3                   	ret

000002d2 <printint>:
 2d2:	55                   	push   %ebp
 2d3:	89 e5                	mov    %esp,%ebp
 2d5:	57                   	push   %edi
 2d6:	56                   	push   %esi
 2d7:	53                   	push   %ebx
 2d8:	83 ec 3c             	sub    $0x3c,%esp
 2db:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 2de:	89 ce                	mov    %ecx,%esi
 2e0:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 2e4:	74 79                	je     35f <printint+0x8d>
 2e6:	85 d2                	test   %edx,%edx
 2e8:	79 75                	jns    35f <printint+0x8d>
 2ea:	89 d1                	mov    %edx,%ecx
 2ec:	f7 d9                	neg    %ecx
 2ee:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
 2f5:	bb 00 00 00 00       	mov    $0x0,%ebx
 2fa:	89 df                	mov    %ebx,%edi
 2fc:	83 c3 01             	add    $0x1,%ebx
 2ff:	89 c8                	mov    %ecx,%eax
 301:	ba 00 00 00 00       	mov    $0x0,%edx
 306:	f7 f6                	div    %esi
 308:	0f b6 92 c8 06 00 00 	movzbl 0x6c8(%edx),%edx
 30f:	88 54 1d d7          	mov    %dl,-0x29(%ebp,%ebx,1)
 313:	89 ca                	mov    %ecx,%edx
 315:	89 c1                	mov    %eax,%ecx
 317:	39 f2                	cmp    %esi,%edx
 319:	73 df                	jae    2fa <printint+0x28>
 31b:	83 7d c0 00          	cmpl   $0x0,-0x40(%ebp)
 31f:	74 08                	je     329 <printint+0x57>
 321:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 326:	8d 5f 02             	lea    0x2(%edi),%ebx
 329:	85 db                	test   %ebx,%ebx
 32b:	7e 2a                	jle    357 <printint+0x85>
 32d:	8d 75 d8             	lea    -0x28(%ebp),%esi
 330:	8d 5c 1d d7          	lea    -0x29(%ebp,%ebx,1),%ebx
 334:	8d 7d d7             	lea    -0x29(%ebp),%edi
 337:	0f b6 03             	movzbl (%ebx),%eax
 33a:	88 45 d7             	mov    %al,-0x29(%ebp)
 33d:	83 ec 04             	sub    $0x4,%esp
 340:	6a 01                	push   $0x1
 342:	57                   	push   %edi
 343:	ff 75 c4             	push   -0x3c(%ebp)
 346:	e8 ff fe ff ff       	call   24a <write>
 34b:	89 d8                	mov    %ebx,%eax
 34d:	83 eb 01             	sub    $0x1,%ebx
 350:	83 c4 10             	add    $0x10,%esp
 353:	39 f0                	cmp    %esi,%eax
 355:	75 e0                	jne    337 <printint+0x65>
 357:	8d 65 f4             	lea    -0xc(%ebp),%esp
 35a:	5b                   	pop    %ebx
 35b:	5e                   	pop    %esi
 35c:	5f                   	pop    %edi
 35d:	5d                   	pop    %ebp
 35e:	c3                   	ret
 35f:	89 d1                	mov    %edx,%ecx
 361:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
 368:	eb 8b                	jmp    2f5 <printint+0x23>

0000036a <printf>:
 36a:	55                   	push   %ebp
 36b:	89 e5                	mov    %esp,%ebp
 36d:	57                   	push   %edi
 36e:	56                   	push   %esi
 36f:	53                   	push   %ebx
 370:	83 ec 2c             	sub    $0x2c,%esp
 373:	8b 75 0c             	mov    0xc(%ebp),%esi
 376:	0f b6 1e             	movzbl (%esi),%ebx
 379:	84 db                	test   %bl,%bl
 37b:	0f 84 9e 01 00 00    	je     51f <printf+0x1b5>
 381:	83 c6 01             	add    $0x1,%esi
 384:	8d 45 10             	lea    0x10(%ebp),%eax
 387:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 38a:	bf 00 00 00 00       	mov    $0x0,%edi
 38f:	eb 2d                	jmp    3be <printf+0x54>
 391:	88 5d e7             	mov    %bl,-0x19(%ebp)
 394:	83 ec 04             	sub    $0x4,%esp
 397:	6a 01                	push   $0x1
 399:	8d 45 e7             	lea    -0x19(%ebp),%eax
 39c:	50                   	push   %eax
 39d:	ff 75 08             	push   0x8(%ebp)
 3a0:	e8 a5 fe ff ff       	call   24a <write>
 3a5:	83 c4 10             	add    $0x10,%esp
 3a8:	eb 05                	jmp    3af <printf+0x45>
 3aa:	83 ff 25             	cmp    $0x25,%edi
 3ad:	74 1f                	je     3ce <printf+0x64>
 3af:	83 c6 01             	add    $0x1,%esi
 3b2:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 3b6:	84 db                	test   %bl,%bl
 3b8:	0f 84 61 01 00 00    	je     51f <printf+0x1b5>
 3be:	0f b6 c3             	movzbl %bl,%eax
 3c1:	85 ff                	test   %edi,%edi
 3c3:	75 e5                	jne    3aa <printf+0x40>
 3c5:	83 f8 25             	cmp    $0x25,%eax
 3c8:	75 c7                	jne    391 <printf+0x27>
 3ca:	89 c7                	mov    %eax,%edi
 3cc:	eb e1                	jmp    3af <printf+0x45>
 3ce:	83 f8 25             	cmp    $0x25,%eax
 3d1:	0f 84 f4 00 00 00    	je     4cb <printf+0x161>
 3d7:	8d 50 9d             	lea    -0x63(%eax),%edx
 3da:	83 fa 15             	cmp    $0x15,%edx
 3dd:	0f 87 09 01 00 00    	ja     4ec <printf+0x182>
 3e3:	0f 87 03 01 00 00    	ja     4ec <printf+0x182>
 3e9:	ff 24 95 70 06 00 00 	jmp    *0x670(,%edx,4)
 3f0:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 3f3:	8b 17                	mov    (%edi),%edx
 3f5:	83 ec 0c             	sub    $0xc,%esp
 3f8:	6a 01                	push   $0x1
 3fa:	b9 0a 00 00 00       	mov    $0xa,%ecx
 3ff:	8b 45 08             	mov    0x8(%ebp),%eax
 402:	e8 cb fe ff ff       	call   2d2 <printint>
 407:	83 c7 04             	add    $0x4,%edi
 40a:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 40d:	83 c4 10             	add    $0x10,%esp
 410:	bf 00 00 00 00       	mov    $0x0,%edi
 415:	eb 98                	jmp    3af <printf+0x45>
 417:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 41a:	8b 17                	mov    (%edi),%edx
 41c:	83 ec 0c             	sub    $0xc,%esp
 41f:	6a 00                	push   $0x0
 421:	b9 10 00 00 00       	mov    $0x10,%ecx
 426:	8b 45 08             	mov    0x8(%ebp),%eax
 429:	e8 a4 fe ff ff       	call   2d2 <printint>
 42e:	83 c7 04             	add    $0x4,%edi
 431:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 434:	83 c4 10             	add    $0x10,%esp
 437:	bf 00 00 00 00       	mov    $0x0,%edi
 43c:	e9 6e ff ff ff       	jmp    3af <printf+0x45>
 441:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
 444:	8b 01                	mov    (%ecx),%eax
 446:	83 c1 04             	add    $0x4,%ecx
 449:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 44c:	85 c0                	test   %eax,%eax
 44e:	74 13                	je     463 <printf+0xf9>
 450:	89 c3                	mov    %eax,%ebx
 452:	0f b6 00             	movzbl (%eax),%eax
 455:	bf 00 00 00 00       	mov    $0x0,%edi
 45a:	84 c0                	test   %al,%al
 45c:	75 0f                	jne    46d <printf+0x103>
 45e:	e9 4c ff ff ff       	jmp    3af <printf+0x45>
 463:	bb 69 06 00 00       	mov    $0x669,%ebx
 468:	b8 28 00 00 00       	mov    $0x28,%eax
 46d:	8d 7d e7             	lea    -0x19(%ebp),%edi
 470:	89 75 d0             	mov    %esi,-0x30(%ebp)
 473:	8b 75 08             	mov    0x8(%ebp),%esi
 476:	88 45 e7             	mov    %al,-0x19(%ebp)
 479:	83 ec 04             	sub    $0x4,%esp
 47c:	6a 01                	push   $0x1
 47e:	57                   	push   %edi
 47f:	56                   	push   %esi
 480:	e8 c5 fd ff ff       	call   24a <write>
 485:	83 c3 01             	add    $0x1,%ebx
 488:	0f b6 03             	movzbl (%ebx),%eax
 48b:	83 c4 10             	add    $0x10,%esp
 48e:	84 c0                	test   %al,%al
 490:	75 e4                	jne    476 <printf+0x10c>
 492:	8b 75 d0             	mov    -0x30(%ebp),%esi
 495:	bf 00 00 00 00       	mov    $0x0,%edi
 49a:	e9 10 ff ff ff       	jmp    3af <printf+0x45>
 49f:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 4a2:	8b 07                	mov    (%edi),%eax
 4a4:	88 45 e7             	mov    %al,-0x19(%ebp)
 4a7:	83 ec 04             	sub    $0x4,%esp
 4aa:	6a 01                	push   $0x1
 4ac:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4af:	50                   	push   %eax
 4b0:	ff 75 08             	push   0x8(%ebp)
 4b3:	e8 92 fd ff ff       	call   24a <write>
 4b8:	83 c7 04             	add    $0x4,%edi
 4bb:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 4be:	83 c4 10             	add    $0x10,%esp
 4c1:	bf 00 00 00 00       	mov    $0x0,%edi
 4c6:	e9 e4 fe ff ff       	jmp    3af <printf+0x45>
 4cb:	88 5d e7             	mov    %bl,-0x19(%ebp)
 4ce:	83 ec 04             	sub    $0x4,%esp
 4d1:	6a 01                	push   $0x1
 4d3:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4d6:	50                   	push   %eax
 4d7:	ff 75 08             	push   0x8(%ebp)
 4da:	e8 6b fd ff ff       	call   24a <write>
 4df:	83 c4 10             	add    $0x10,%esp
 4e2:	bf 00 00 00 00       	mov    $0x0,%edi
 4e7:	e9 c3 fe ff ff       	jmp    3af <printf+0x45>
 4ec:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 4f0:	83 ec 04             	sub    $0x4,%esp
 4f3:	6a 01                	push   $0x1
 4f5:	8d 7d e7             	lea    -0x19(%ebp),%edi
 4f8:	57                   	push   %edi
 4f9:	ff 75 08             	push   0x8(%ebp)
 4fc:	e8 49 fd ff ff       	call   24a <write>
 501:	88 5d e7             	mov    %bl,-0x19(%ebp)
 504:	83 c4 0c             	add    $0xc,%esp
 507:	6a 01                	push   $0x1
 509:	57                   	push   %edi
 50a:	ff 75 08             	push   0x8(%ebp)
 50d:	e8 38 fd ff ff       	call   24a <write>
 512:	83 c4 10             	add    $0x10,%esp
 515:	bf 00 00 00 00       	mov    $0x0,%edi
 51a:	e9 90 fe ff ff       	jmp    3af <printf+0x45>
 51f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 522:	5b                   	pop    %ebx
 523:	5e                   	pop    %esi
 524:	5f                   	pop    %edi
 525:	5d                   	pop    %ebp
 526:	c3                   	ret

00000527 <free>:
 527:	55                   	push   %ebp
 528:	89 e5                	mov    %esp,%ebp
 52a:	57                   	push   %edi
 52b:	56                   	push   %esi
 52c:	53                   	push   %ebx
 52d:	8b 5d 08             	mov    0x8(%ebp),%ebx
 530:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 533:	a1 3c 09 00 00       	mov    0x93c,%eax
 538:	eb 0c                	jmp    546 <free+0x1f>
 53a:	8b 10                	mov    (%eax),%edx
 53c:	39 d0                	cmp    %edx,%eax
 53e:	72 04                	jb     544 <free+0x1d>
 540:	39 d1                	cmp    %edx,%ecx
 542:	72 10                	jb     554 <free+0x2d>
 544:	89 d0                	mov    %edx,%eax
 546:	39 c8                	cmp    %ecx,%eax
 548:	73 f0                	jae    53a <free+0x13>
 54a:	8b 10                	mov    (%eax),%edx
 54c:	39 d1                	cmp    %edx,%ecx
 54e:	72 04                	jb     554 <free+0x2d>
 550:	39 d0                	cmp    %edx,%eax
 552:	72 f0                	jb     544 <free+0x1d>
 554:	8b 73 fc             	mov    -0x4(%ebx),%esi
 557:	8b 10                	mov    (%eax),%edx
 559:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 55c:	39 fa                	cmp    %edi,%edx
 55e:	74 19                	je     579 <free+0x52>
 560:	89 53 f8             	mov    %edx,-0x8(%ebx)
 563:	8b 50 04             	mov    0x4(%eax),%edx
 566:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 569:	39 f1                	cmp    %esi,%ecx
 56b:	74 18                	je     585 <free+0x5e>
 56d:	89 08                	mov    %ecx,(%eax)
 56f:	a3 3c 09 00 00       	mov    %eax,0x93c
 574:	5b                   	pop    %ebx
 575:	5e                   	pop    %esi
 576:	5f                   	pop    %edi
 577:	5d                   	pop    %ebp
 578:	c3                   	ret
 579:	03 72 04             	add    0x4(%edx),%esi
 57c:	89 73 fc             	mov    %esi,-0x4(%ebx)
 57f:	8b 10                	mov    (%eax),%edx
 581:	8b 12                	mov    (%edx),%edx
 583:	eb db                	jmp    560 <free+0x39>
 585:	03 53 fc             	add    -0x4(%ebx),%edx
 588:	89 50 04             	mov    %edx,0x4(%eax)
 58b:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 58e:	eb dd                	jmp    56d <free+0x46>

00000590 <malloc>:
 590:	55                   	push   %ebp
 591:	89 e5                	mov    %esp,%ebp
 593:	57                   	push   %edi
 594:	56                   	push   %esi
 595:	53                   	push   %ebx
 596:	83 ec 0c             	sub    $0xc,%esp
 599:	8b 45 08             	mov    0x8(%ebp),%eax
 59c:	8d 58 07             	lea    0x7(%eax),%ebx
 59f:	c1 eb 03             	shr    $0x3,%ebx
 5a2:	83 c3 01             	add    $0x1,%ebx
 5a5:	8b 15 3c 09 00 00    	mov    0x93c,%edx
 5ab:	85 d2                	test   %edx,%edx
 5ad:	74 1c                	je     5cb <malloc+0x3b>
 5af:	8b 02                	mov    (%edx),%eax
 5b1:	8b 48 04             	mov    0x4(%eax),%ecx
 5b4:	39 d9                	cmp    %ebx,%ecx
 5b6:	73 38                	jae    5f0 <malloc+0x60>
 5b8:	be 00 10 00 00       	mov    $0x1000,%esi
 5bd:	39 f3                	cmp    %esi,%ebx
 5bf:	0f 43 f3             	cmovae %ebx,%esi
 5c2:	8d 3c f5 00 00 00 00 	lea    0x0(,%esi,8),%edi
 5c9:	eb 72                	jmp    63d <malloc+0xad>
 5cb:	c7 05 3c 09 00 00 40 	movl   $0x940,0x93c
 5d2:	09 00 00 
 5d5:	c7 05 40 09 00 00 40 	movl   $0x940,0x940
 5dc:	09 00 00 
 5df:	c7 05 44 09 00 00 00 	movl   $0x0,0x944
 5e6:	00 00 00 
 5e9:	b8 40 09 00 00       	mov    $0x940,%eax
 5ee:	eb c8                	jmp    5b8 <malloc+0x28>
 5f0:	39 cb                	cmp    %ecx,%ebx
 5f2:	74 1e                	je     612 <malloc+0x82>
 5f4:	29 d9                	sub    %ebx,%ecx
 5f6:	89 48 04             	mov    %ecx,0x4(%eax)
 5f9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 5fc:	89 58 04             	mov    %ebx,0x4(%eax)
 5ff:	89 15 3c 09 00 00    	mov    %edx,0x93c
 605:	8d 50 08             	lea    0x8(%eax),%edx
 608:	89 d0                	mov    %edx,%eax
 60a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 60d:	5b                   	pop    %ebx
 60e:	5e                   	pop    %esi
 60f:	5f                   	pop    %edi
 610:	5d                   	pop    %ebp
 611:	c3                   	ret
 612:	8b 08                	mov    (%eax),%ecx
 614:	89 0a                	mov    %ecx,(%edx)
 616:	eb e7                	jmp    5ff <malloc+0x6f>
 618:	89 70 04             	mov    %esi,0x4(%eax)
 61b:	83 ec 0c             	sub    $0xc,%esp
 61e:	83 c0 08             	add    $0x8,%eax
 621:	50                   	push   %eax
 622:	e8 00 ff ff ff       	call   527 <free>
 627:	8b 15 3c 09 00 00    	mov    0x93c,%edx
 62d:	83 c4 10             	add    $0x10,%esp
 630:	85 d2                	test   %edx,%edx
 632:	74 d4                	je     608 <malloc+0x78>
 634:	8b 02                	mov    (%edx),%eax
 636:	8b 48 04             	mov    0x4(%eax),%ecx
 639:	39 d9                	cmp    %ebx,%ecx
 63b:	73 b3                	jae    5f0 <malloc+0x60>
 63d:	89 c2                	mov    %eax,%edx
 63f:	39 05 3c 09 00 00    	cmp    %eax,0x93c
 645:	75 ed                	jne    634 <malloc+0xa4>
 647:	83 ec 0c             	sub    $0xc,%esp
 64a:	57                   	push   %edi
 64b:	e8 62 fc ff ff       	call   2b2 <sbrk>
 650:	83 c4 10             	add    $0x10,%esp
 653:	83 f8 ff             	cmp    $0xffffffff,%eax
 656:	75 c0                	jne    618 <malloc+0x88>
 658:	ba 00 00 00 00       	mov    $0x0,%edx
 65d:	eb a9                	jmp    608 <malloc+0x78>
