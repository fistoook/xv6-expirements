
_kill:     file format elf32-i386


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
  19:	bb 01 00 00 00       	mov    $0x1,%ebx
  1e:	83 fe 01             	cmp    $0x1,%esi
  21:	7e 22                	jle    45 <main+0x45>
  23:	83 ec 0c             	sub    $0xc,%esp
  26:	ff 34 9f             	push   (%edi,%ebx,4)
  29:	e8 81 01 00 00       	call   1af <atoi>
  2e:	89 04 24             	mov    %eax,(%esp)
  31:	e8 1b 02 00 00       	call   251 <kill>
  36:	83 c3 01             	add    $0x1,%ebx
  39:	83 c4 10             	add    $0x10,%esp
  3c:	39 de                	cmp    %ebx,%esi
  3e:	75 e3                	jne    23 <main+0x23>
  40:	e8 dc 01 00 00       	call   221 <exit>
  45:	83 ec 08             	sub    $0x8,%esp
  48:	68 58 06 00 00       	push   $0x658
  4d:	6a 02                	push   $0x2
  4f:	e8 0d 03 00 00       	call   361 <printf>
  54:	e8 c8 01 00 00       	call   221 <exit>

00000059 <strcpy>:
  59:	55                   	push   %ebp
  5a:	89 e5                	mov    %esp,%ebp
  5c:	53                   	push   %ebx
  5d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  60:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  63:	b8 00 00 00 00       	mov    $0x0,%eax
  68:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  6c:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  6f:	83 c0 01             	add    $0x1,%eax
  72:	84 d2                	test   %dl,%dl
  74:	75 f2                	jne    68 <strcpy+0xf>
  76:	89 c8                	mov    %ecx,%eax
  78:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  7b:	c9                   	leave
  7c:	c3                   	ret

0000007d <strcmp>:
  7d:	55                   	push   %ebp
  7e:	89 e5                	mov    %esp,%ebp
  80:	8b 4d 08             	mov    0x8(%ebp),%ecx
  83:	8b 55 0c             	mov    0xc(%ebp),%edx
  86:	0f b6 01             	movzbl (%ecx),%eax
  89:	84 c0                	test   %al,%al
  8b:	74 11                	je     9e <strcmp+0x21>
  8d:	38 02                	cmp    %al,(%edx)
  8f:	75 0d                	jne    9e <strcmp+0x21>
  91:	83 c1 01             	add    $0x1,%ecx
  94:	83 c2 01             	add    $0x1,%edx
  97:	0f b6 01             	movzbl (%ecx),%eax
  9a:	84 c0                	test   %al,%al
  9c:	75 ef                	jne    8d <strcmp+0x10>
  9e:	0f b6 c0             	movzbl %al,%eax
  a1:	0f b6 12             	movzbl (%edx),%edx
  a4:	29 d0                	sub    %edx,%eax
  a6:	5d                   	pop    %ebp
  a7:	c3                   	ret

000000a8 <strlen>:
  a8:	55                   	push   %ebp
  a9:	89 e5                	mov    %esp,%ebp
  ab:	8b 55 08             	mov    0x8(%ebp),%edx
  ae:	80 3a 00             	cmpb   $0x0,(%edx)
  b1:	74 14                	je     c7 <strlen+0x1f>
  b3:	b8 00 00 00 00       	mov    $0x0,%eax
  b8:	83 c0 01             	add    $0x1,%eax
  bb:	89 c1                	mov    %eax,%ecx
  bd:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  c1:	75 f5                	jne    b8 <strlen+0x10>
  c3:	89 c8                	mov    %ecx,%eax
  c5:	5d                   	pop    %ebp
  c6:	c3                   	ret
  c7:	b9 00 00 00 00       	mov    $0x0,%ecx
  cc:	eb f5                	jmp    c3 <strlen+0x1b>

000000ce <memset>:
  ce:	55                   	push   %ebp
  cf:	89 e5                	mov    %esp,%ebp
  d1:	57                   	push   %edi
  d2:	8b 55 08             	mov    0x8(%ebp),%edx
  d5:	89 d7                	mov    %edx,%edi
  d7:	8b 4d 10             	mov    0x10(%ebp),%ecx
  da:	8b 45 0c             	mov    0xc(%ebp),%eax
  dd:	fc                   	cld
  de:	f3 aa                	rep stos %al,%es:(%edi)
  e0:	89 d0                	mov    %edx,%eax
  e2:	8b 7d fc             	mov    -0x4(%ebp),%edi
  e5:	c9                   	leave
  e6:	c3                   	ret

000000e7 <strchr>:
  e7:	55                   	push   %ebp
  e8:	89 e5                	mov    %esp,%ebp
  ea:	8b 45 08             	mov    0x8(%ebp),%eax
  ed:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  f1:	0f b6 10             	movzbl (%eax),%edx
  f4:	84 d2                	test   %dl,%dl
  f6:	74 15                	je     10d <strchr+0x26>
  f8:	38 d1                	cmp    %dl,%cl
  fa:	74 0f                	je     10b <strchr+0x24>
  fc:	83 c0 01             	add    $0x1,%eax
  ff:	0f b6 10             	movzbl (%eax),%edx
 102:	84 d2                	test   %dl,%dl
 104:	75 f2                	jne    f8 <strchr+0x11>
 106:	b8 00 00 00 00       	mov    $0x0,%eax
 10b:	5d                   	pop    %ebp
 10c:	c3                   	ret
 10d:	b8 00 00 00 00       	mov    $0x0,%eax
 112:	eb f7                	jmp    10b <strchr+0x24>

00000114 <gets>:
 114:	55                   	push   %ebp
 115:	89 e5                	mov    %esp,%ebp
 117:	57                   	push   %edi
 118:	56                   	push   %esi
 119:	53                   	push   %ebx
 11a:	83 ec 2c             	sub    $0x2c,%esp
 11d:	8b 75 08             	mov    0x8(%ebp),%esi
 120:	bb 00 00 00 00       	mov    $0x0,%ebx
 125:	8d 7d e7             	lea    -0x19(%ebp),%edi
 128:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 12b:	83 c3 01             	add    $0x1,%ebx
 12e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 131:	7d 27                	jge    15a <gets+0x46>
 133:	83 ec 04             	sub    $0x4,%esp
 136:	6a 01                	push   $0x1
 138:	57                   	push   %edi
 139:	6a 00                	push   $0x0
 13b:	e8 f9 00 00 00       	call   239 <read>
 140:	83 c4 10             	add    $0x10,%esp
 143:	85 c0                	test   %eax,%eax
 145:	7e 13                	jle    15a <gets+0x46>
 147:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 14b:	88 44 1e ff          	mov    %al,-0x1(%esi,%ebx,1)
 14f:	3c 0a                	cmp    $0xa,%al
 151:	74 04                	je     157 <gets+0x43>
 153:	3c 0d                	cmp    $0xd,%al
 155:	75 d1                	jne    128 <gets+0x14>
 157:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 15a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 15d:	c6 04 06 00          	movb   $0x0,(%esi,%eax,1)
 161:	89 f0                	mov    %esi,%eax
 163:	8d 65 f4             	lea    -0xc(%ebp),%esp
 166:	5b                   	pop    %ebx
 167:	5e                   	pop    %esi
 168:	5f                   	pop    %edi
 169:	5d                   	pop    %ebp
 16a:	c3                   	ret

0000016b <stat>:
 16b:	55                   	push   %ebp
 16c:	89 e5                	mov    %esp,%ebp
 16e:	56                   	push   %esi
 16f:	53                   	push   %ebx
 170:	83 ec 08             	sub    $0x8,%esp
 173:	6a 00                	push   $0x0
 175:	ff 75 08             	push   0x8(%ebp)
 178:	e8 e4 00 00 00       	call   261 <open>
 17d:	83 c4 10             	add    $0x10,%esp
 180:	85 c0                	test   %eax,%eax
 182:	78 24                	js     1a8 <stat+0x3d>
 184:	89 c3                	mov    %eax,%ebx
 186:	83 ec 08             	sub    $0x8,%esp
 189:	ff 75 0c             	push   0xc(%ebp)
 18c:	50                   	push   %eax
 18d:	e8 e7 00 00 00       	call   279 <fstat>
 192:	89 c6                	mov    %eax,%esi
 194:	89 1c 24             	mov    %ebx,(%esp)
 197:	e8 ad 00 00 00       	call   249 <close>
 19c:	83 c4 10             	add    $0x10,%esp
 19f:	89 f0                	mov    %esi,%eax
 1a1:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1a4:	5b                   	pop    %ebx
 1a5:	5e                   	pop    %esi
 1a6:	5d                   	pop    %ebp
 1a7:	c3                   	ret
 1a8:	be ff ff ff ff       	mov    $0xffffffff,%esi
 1ad:	eb f0                	jmp    19f <stat+0x34>

000001af <atoi>:
 1af:	55                   	push   %ebp
 1b0:	89 e5                	mov    %esp,%ebp
 1b2:	53                   	push   %ebx
 1b3:	8b 55 08             	mov    0x8(%ebp),%edx
 1b6:	0f b6 02             	movzbl (%edx),%eax
 1b9:	8d 48 d0             	lea    -0x30(%eax),%ecx
 1bc:	80 f9 09             	cmp    $0x9,%cl
 1bf:	77 24                	ja     1e5 <atoi+0x36>
 1c1:	b9 00 00 00 00       	mov    $0x0,%ecx
 1c6:	83 c2 01             	add    $0x1,%edx
 1c9:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 1cc:	0f be c0             	movsbl %al,%eax
 1cf:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
 1d3:	0f b6 02             	movzbl (%edx),%eax
 1d6:	8d 58 d0             	lea    -0x30(%eax),%ebx
 1d9:	80 fb 09             	cmp    $0x9,%bl
 1dc:	76 e8                	jbe    1c6 <atoi+0x17>
 1de:	89 c8                	mov    %ecx,%eax
 1e0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1e3:	c9                   	leave
 1e4:	c3                   	ret
 1e5:	b9 00 00 00 00       	mov    $0x0,%ecx
 1ea:	eb f2                	jmp    1de <atoi+0x2f>

000001ec <memmove>:
 1ec:	55                   	push   %ebp
 1ed:	89 e5                	mov    %esp,%ebp
 1ef:	56                   	push   %esi
 1f0:	53                   	push   %ebx
 1f1:	8b 75 08             	mov    0x8(%ebp),%esi
 1f4:	8b 55 0c             	mov    0xc(%ebp),%edx
 1f7:	8b 5d 10             	mov    0x10(%ebp),%ebx
 1fa:	85 db                	test   %ebx,%ebx
 1fc:	7e 15                	jle    213 <memmove+0x27>
 1fe:	01 f3                	add    %esi,%ebx
 200:	89 f0                	mov    %esi,%eax
 202:	83 c2 01             	add    $0x1,%edx
 205:	83 c0 01             	add    $0x1,%eax
 208:	0f b6 4a ff          	movzbl -0x1(%edx),%ecx
 20c:	88 48 ff             	mov    %cl,-0x1(%eax)
 20f:	39 c3                	cmp    %eax,%ebx
 211:	75 ef                	jne    202 <memmove+0x16>
 213:	89 f0                	mov    %esi,%eax
 215:	5b                   	pop    %ebx
 216:	5e                   	pop    %esi
 217:	5d                   	pop    %ebp
 218:	c3                   	ret

00000219 <fork>:
  name: \
    movl $1, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALLFORK(fork) //instead of SYSCALL(fork) !!!
 219:	b8 01 00 00 00       	mov    $0x1,%eax
 21e:	cd 40                	int    $0x40
 220:	c3                   	ret

00000221 <exit>:
//SYSCALL(fork)
SYSCALL(exit)
 221:	b8 02 00 00 00       	mov    $0x2,%eax
 226:	cd 40                	int    $0x40
 228:	c3                   	ret

00000229 <wait>:
SYSCALL(wait)
 229:	b8 03 00 00 00       	mov    $0x3,%eax
 22e:	cd 40                	int    $0x40
 230:	c3                   	ret

00000231 <pipe>:
SYSCALL(pipe)
 231:	b8 04 00 00 00       	mov    $0x4,%eax
 236:	cd 40                	int    $0x40
 238:	c3                   	ret

00000239 <read>:
SYSCALL(read)
 239:	b8 05 00 00 00       	mov    $0x5,%eax
 23e:	cd 40                	int    $0x40
 240:	c3                   	ret

00000241 <write>:
SYSCALL(write)
 241:	b8 10 00 00 00       	mov    $0x10,%eax
 246:	cd 40                	int    $0x40
 248:	c3                   	ret

00000249 <close>:
SYSCALL(close)
 249:	b8 15 00 00 00       	mov    $0x15,%eax
 24e:	cd 40                	int    $0x40
 250:	c3                   	ret

00000251 <kill>:
SYSCALL(kill)
 251:	b8 06 00 00 00       	mov    $0x6,%eax
 256:	cd 40                	int    $0x40
 258:	c3                   	ret

00000259 <exec>:
SYSCALL(exec)
 259:	b8 07 00 00 00       	mov    $0x7,%eax
 25e:	cd 40                	int    $0x40
 260:	c3                   	ret

00000261 <open>:
SYSCALL(open)
 261:	b8 0f 00 00 00       	mov    $0xf,%eax
 266:	cd 40                	int    $0x40
 268:	c3                   	ret

00000269 <mknod>:
SYSCALL(mknod)
 269:	b8 11 00 00 00       	mov    $0x11,%eax
 26e:	cd 40                	int    $0x40
 270:	c3                   	ret

00000271 <unlink>:
SYSCALL(unlink)
 271:	b8 12 00 00 00       	mov    $0x12,%eax
 276:	cd 40                	int    $0x40
 278:	c3                   	ret

00000279 <fstat>:
SYSCALL(fstat)
 279:	b8 08 00 00 00       	mov    $0x8,%eax
 27e:	cd 40                	int    $0x40
 280:	c3                   	ret

00000281 <link>:
SYSCALL(link)
 281:	b8 13 00 00 00       	mov    $0x13,%eax
 286:	cd 40                	int    $0x40
 288:	c3                   	ret

00000289 <mkdir>:
SYSCALL(mkdir)
 289:	b8 14 00 00 00       	mov    $0x14,%eax
 28e:	cd 40                	int    $0x40
 290:	c3                   	ret

00000291 <chdir>:
SYSCALL(chdir)
 291:	b8 09 00 00 00       	mov    $0x9,%eax
 296:	cd 40                	int    $0x40
 298:	c3                   	ret

00000299 <dup>:
SYSCALL(dup)
 299:	b8 0a 00 00 00       	mov    $0xa,%eax
 29e:	cd 40                	int    $0x40
 2a0:	c3                   	ret

000002a1 <getpid>:
SYSCALL(getpid)
 2a1:	b8 0b 00 00 00       	mov    $0xb,%eax
 2a6:	cd 40                	int    $0x40
 2a8:	c3                   	ret

000002a9 <sbrk>:
SYSCALL(sbrk)
 2a9:	b8 0c 00 00 00       	mov    $0xc,%eax
 2ae:	cd 40                	int    $0x40
 2b0:	c3                   	ret

000002b1 <sleep>:
SYSCALL(sleep)
 2b1:	b8 0d 00 00 00       	mov    $0xd,%eax
 2b6:	cd 40                	int    $0x40
 2b8:	c3                   	ret

000002b9 <uptime>:
SYSCALL(uptime)
 2b9:	b8 0e 00 00 00       	mov    $0xe,%eax
 2be:	cd 40                	int    $0x40
 2c0:	c3                   	ret

000002c1 <ps>:
SYSCALL(ps)
 2c1:	b8 16 00 00 00       	mov    $0x16,%eax
 2c6:	cd 40                	int    $0x40
 2c8:	c3                   	ret

000002c9 <printint>:
 2c9:	55                   	push   %ebp
 2ca:	89 e5                	mov    %esp,%ebp
 2cc:	57                   	push   %edi
 2cd:	56                   	push   %esi
 2ce:	53                   	push   %ebx
 2cf:	83 ec 3c             	sub    $0x3c,%esp
 2d2:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 2d5:	89 ce                	mov    %ecx,%esi
 2d7:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 2db:	74 79                	je     356 <printint+0x8d>
 2dd:	85 d2                	test   %edx,%edx
 2df:	79 75                	jns    356 <printint+0x8d>
 2e1:	89 d1                	mov    %edx,%ecx
 2e3:	f7 d9                	neg    %ecx
 2e5:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
 2ec:	bb 00 00 00 00       	mov    $0x0,%ebx
 2f1:	89 df                	mov    %ebx,%edi
 2f3:	83 c3 01             	add    $0x1,%ebx
 2f6:	89 c8                	mov    %ecx,%eax
 2f8:	ba 00 00 00 00       	mov    $0x0,%edx
 2fd:	f7 f6                	div    %esi
 2ff:	0f b6 92 cc 06 00 00 	movzbl 0x6cc(%edx),%edx
 306:	88 54 1d d7          	mov    %dl,-0x29(%ebp,%ebx,1)
 30a:	89 ca                	mov    %ecx,%edx
 30c:	89 c1                	mov    %eax,%ecx
 30e:	39 f2                	cmp    %esi,%edx
 310:	73 df                	jae    2f1 <printint+0x28>
 312:	83 7d c0 00          	cmpl   $0x0,-0x40(%ebp)
 316:	74 08                	je     320 <printint+0x57>
 318:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 31d:	8d 5f 02             	lea    0x2(%edi),%ebx
 320:	85 db                	test   %ebx,%ebx
 322:	7e 2a                	jle    34e <printint+0x85>
 324:	8d 75 d8             	lea    -0x28(%ebp),%esi
 327:	8d 5c 1d d7          	lea    -0x29(%ebp,%ebx,1),%ebx
 32b:	8d 7d d7             	lea    -0x29(%ebp),%edi
 32e:	0f b6 03             	movzbl (%ebx),%eax
 331:	88 45 d7             	mov    %al,-0x29(%ebp)
 334:	83 ec 04             	sub    $0x4,%esp
 337:	6a 01                	push   $0x1
 339:	57                   	push   %edi
 33a:	ff 75 c4             	push   -0x3c(%ebp)
 33d:	e8 ff fe ff ff       	call   241 <write>
 342:	89 d8                	mov    %ebx,%eax
 344:	83 eb 01             	sub    $0x1,%ebx
 347:	83 c4 10             	add    $0x10,%esp
 34a:	39 f0                	cmp    %esi,%eax
 34c:	75 e0                	jne    32e <printint+0x65>
 34e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 351:	5b                   	pop    %ebx
 352:	5e                   	pop    %esi
 353:	5f                   	pop    %edi
 354:	5d                   	pop    %ebp
 355:	c3                   	ret
 356:	89 d1                	mov    %edx,%ecx
 358:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
 35f:	eb 8b                	jmp    2ec <printint+0x23>

00000361 <printf>:
 361:	55                   	push   %ebp
 362:	89 e5                	mov    %esp,%ebp
 364:	57                   	push   %edi
 365:	56                   	push   %esi
 366:	53                   	push   %ebx
 367:	83 ec 2c             	sub    $0x2c,%esp
 36a:	8b 75 0c             	mov    0xc(%ebp),%esi
 36d:	0f b6 1e             	movzbl (%esi),%ebx
 370:	84 db                	test   %bl,%bl
 372:	0f 84 9e 01 00 00    	je     516 <printf+0x1b5>
 378:	83 c6 01             	add    $0x1,%esi
 37b:	8d 45 10             	lea    0x10(%ebp),%eax
 37e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 381:	bf 00 00 00 00       	mov    $0x0,%edi
 386:	eb 2d                	jmp    3b5 <printf+0x54>
 388:	88 5d e7             	mov    %bl,-0x19(%ebp)
 38b:	83 ec 04             	sub    $0x4,%esp
 38e:	6a 01                	push   $0x1
 390:	8d 45 e7             	lea    -0x19(%ebp),%eax
 393:	50                   	push   %eax
 394:	ff 75 08             	push   0x8(%ebp)
 397:	e8 a5 fe ff ff       	call   241 <write>
 39c:	83 c4 10             	add    $0x10,%esp
 39f:	eb 05                	jmp    3a6 <printf+0x45>
 3a1:	83 ff 25             	cmp    $0x25,%edi
 3a4:	74 1f                	je     3c5 <printf+0x64>
 3a6:	83 c6 01             	add    $0x1,%esi
 3a9:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 3ad:	84 db                	test   %bl,%bl
 3af:	0f 84 61 01 00 00    	je     516 <printf+0x1b5>
 3b5:	0f b6 c3             	movzbl %bl,%eax
 3b8:	85 ff                	test   %edi,%edi
 3ba:	75 e5                	jne    3a1 <printf+0x40>
 3bc:	83 f8 25             	cmp    $0x25,%eax
 3bf:	75 c7                	jne    388 <printf+0x27>
 3c1:	89 c7                	mov    %eax,%edi
 3c3:	eb e1                	jmp    3a6 <printf+0x45>
 3c5:	83 f8 25             	cmp    $0x25,%eax
 3c8:	0f 84 f4 00 00 00    	je     4c2 <printf+0x161>
 3ce:	8d 50 9d             	lea    -0x63(%eax),%edx
 3d1:	83 fa 15             	cmp    $0x15,%edx
 3d4:	0f 87 09 01 00 00    	ja     4e3 <printf+0x182>
 3da:	0f 87 03 01 00 00    	ja     4e3 <printf+0x182>
 3e0:	ff 24 95 74 06 00 00 	jmp    *0x674(,%edx,4)
 3e7:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 3ea:	8b 17                	mov    (%edi),%edx
 3ec:	83 ec 0c             	sub    $0xc,%esp
 3ef:	6a 01                	push   $0x1
 3f1:	b9 0a 00 00 00       	mov    $0xa,%ecx
 3f6:	8b 45 08             	mov    0x8(%ebp),%eax
 3f9:	e8 cb fe ff ff       	call   2c9 <printint>
 3fe:	83 c7 04             	add    $0x4,%edi
 401:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 404:	83 c4 10             	add    $0x10,%esp
 407:	bf 00 00 00 00       	mov    $0x0,%edi
 40c:	eb 98                	jmp    3a6 <printf+0x45>
 40e:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 411:	8b 17                	mov    (%edi),%edx
 413:	83 ec 0c             	sub    $0xc,%esp
 416:	6a 00                	push   $0x0
 418:	b9 10 00 00 00       	mov    $0x10,%ecx
 41d:	8b 45 08             	mov    0x8(%ebp),%eax
 420:	e8 a4 fe ff ff       	call   2c9 <printint>
 425:	83 c7 04             	add    $0x4,%edi
 428:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 42b:	83 c4 10             	add    $0x10,%esp
 42e:	bf 00 00 00 00       	mov    $0x0,%edi
 433:	e9 6e ff ff ff       	jmp    3a6 <printf+0x45>
 438:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
 43b:	8b 01                	mov    (%ecx),%eax
 43d:	83 c1 04             	add    $0x4,%ecx
 440:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 443:	85 c0                	test   %eax,%eax
 445:	74 13                	je     45a <printf+0xf9>
 447:	89 c3                	mov    %eax,%ebx
 449:	0f b6 00             	movzbl (%eax),%eax
 44c:	bf 00 00 00 00       	mov    $0x0,%edi
 451:	84 c0                	test   %al,%al
 453:	75 0f                	jne    464 <printf+0x103>
 455:	e9 4c ff ff ff       	jmp    3a6 <printf+0x45>
 45a:	bb 6c 06 00 00       	mov    $0x66c,%ebx
 45f:	b8 28 00 00 00       	mov    $0x28,%eax
 464:	8d 7d e7             	lea    -0x19(%ebp),%edi
 467:	89 75 d0             	mov    %esi,-0x30(%ebp)
 46a:	8b 75 08             	mov    0x8(%ebp),%esi
 46d:	88 45 e7             	mov    %al,-0x19(%ebp)
 470:	83 ec 04             	sub    $0x4,%esp
 473:	6a 01                	push   $0x1
 475:	57                   	push   %edi
 476:	56                   	push   %esi
 477:	e8 c5 fd ff ff       	call   241 <write>
 47c:	83 c3 01             	add    $0x1,%ebx
 47f:	0f b6 03             	movzbl (%ebx),%eax
 482:	83 c4 10             	add    $0x10,%esp
 485:	84 c0                	test   %al,%al
 487:	75 e4                	jne    46d <printf+0x10c>
 489:	8b 75 d0             	mov    -0x30(%ebp),%esi
 48c:	bf 00 00 00 00       	mov    $0x0,%edi
 491:	e9 10 ff ff ff       	jmp    3a6 <printf+0x45>
 496:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 499:	8b 07                	mov    (%edi),%eax
 49b:	88 45 e7             	mov    %al,-0x19(%ebp)
 49e:	83 ec 04             	sub    $0x4,%esp
 4a1:	6a 01                	push   $0x1
 4a3:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4a6:	50                   	push   %eax
 4a7:	ff 75 08             	push   0x8(%ebp)
 4aa:	e8 92 fd ff ff       	call   241 <write>
 4af:	83 c7 04             	add    $0x4,%edi
 4b2:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 4b5:	83 c4 10             	add    $0x10,%esp
 4b8:	bf 00 00 00 00       	mov    $0x0,%edi
 4bd:	e9 e4 fe ff ff       	jmp    3a6 <printf+0x45>
 4c2:	88 5d e7             	mov    %bl,-0x19(%ebp)
 4c5:	83 ec 04             	sub    $0x4,%esp
 4c8:	6a 01                	push   $0x1
 4ca:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4cd:	50                   	push   %eax
 4ce:	ff 75 08             	push   0x8(%ebp)
 4d1:	e8 6b fd ff ff       	call   241 <write>
 4d6:	83 c4 10             	add    $0x10,%esp
 4d9:	bf 00 00 00 00       	mov    $0x0,%edi
 4de:	e9 c3 fe ff ff       	jmp    3a6 <printf+0x45>
 4e3:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 4e7:	83 ec 04             	sub    $0x4,%esp
 4ea:	6a 01                	push   $0x1
 4ec:	8d 7d e7             	lea    -0x19(%ebp),%edi
 4ef:	57                   	push   %edi
 4f0:	ff 75 08             	push   0x8(%ebp)
 4f3:	e8 49 fd ff ff       	call   241 <write>
 4f8:	88 5d e7             	mov    %bl,-0x19(%ebp)
 4fb:	83 c4 0c             	add    $0xc,%esp
 4fe:	6a 01                	push   $0x1
 500:	57                   	push   %edi
 501:	ff 75 08             	push   0x8(%ebp)
 504:	e8 38 fd ff ff       	call   241 <write>
 509:	83 c4 10             	add    $0x10,%esp
 50c:	bf 00 00 00 00       	mov    $0x0,%edi
 511:	e9 90 fe ff ff       	jmp    3a6 <printf+0x45>
 516:	8d 65 f4             	lea    -0xc(%ebp),%esp
 519:	5b                   	pop    %ebx
 51a:	5e                   	pop    %esi
 51b:	5f                   	pop    %edi
 51c:	5d                   	pop    %ebp
 51d:	c3                   	ret

0000051e <free>:
 51e:	55                   	push   %ebp
 51f:	89 e5                	mov    %esp,%ebp
 521:	57                   	push   %edi
 522:	56                   	push   %esi
 523:	53                   	push   %ebx
 524:	8b 5d 08             	mov    0x8(%ebp),%ebx
 527:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 52a:	a1 40 09 00 00       	mov    0x940,%eax
 52f:	eb 0c                	jmp    53d <free+0x1f>
 531:	8b 10                	mov    (%eax),%edx
 533:	39 d0                	cmp    %edx,%eax
 535:	72 04                	jb     53b <free+0x1d>
 537:	39 d1                	cmp    %edx,%ecx
 539:	72 10                	jb     54b <free+0x2d>
 53b:	89 d0                	mov    %edx,%eax
 53d:	39 c8                	cmp    %ecx,%eax
 53f:	73 f0                	jae    531 <free+0x13>
 541:	8b 10                	mov    (%eax),%edx
 543:	39 d1                	cmp    %edx,%ecx
 545:	72 04                	jb     54b <free+0x2d>
 547:	39 d0                	cmp    %edx,%eax
 549:	72 f0                	jb     53b <free+0x1d>
 54b:	8b 73 fc             	mov    -0x4(%ebx),%esi
 54e:	8b 10                	mov    (%eax),%edx
 550:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 553:	39 fa                	cmp    %edi,%edx
 555:	74 19                	je     570 <free+0x52>
 557:	89 53 f8             	mov    %edx,-0x8(%ebx)
 55a:	8b 50 04             	mov    0x4(%eax),%edx
 55d:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 560:	39 f1                	cmp    %esi,%ecx
 562:	74 18                	je     57c <free+0x5e>
 564:	89 08                	mov    %ecx,(%eax)
 566:	a3 40 09 00 00       	mov    %eax,0x940
 56b:	5b                   	pop    %ebx
 56c:	5e                   	pop    %esi
 56d:	5f                   	pop    %edi
 56e:	5d                   	pop    %ebp
 56f:	c3                   	ret
 570:	03 72 04             	add    0x4(%edx),%esi
 573:	89 73 fc             	mov    %esi,-0x4(%ebx)
 576:	8b 10                	mov    (%eax),%edx
 578:	8b 12                	mov    (%edx),%edx
 57a:	eb db                	jmp    557 <free+0x39>
 57c:	03 53 fc             	add    -0x4(%ebx),%edx
 57f:	89 50 04             	mov    %edx,0x4(%eax)
 582:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 585:	eb dd                	jmp    564 <free+0x46>

00000587 <malloc>:
 587:	55                   	push   %ebp
 588:	89 e5                	mov    %esp,%ebp
 58a:	57                   	push   %edi
 58b:	56                   	push   %esi
 58c:	53                   	push   %ebx
 58d:	83 ec 0c             	sub    $0xc,%esp
 590:	8b 45 08             	mov    0x8(%ebp),%eax
 593:	8d 58 07             	lea    0x7(%eax),%ebx
 596:	c1 eb 03             	shr    $0x3,%ebx
 599:	83 c3 01             	add    $0x1,%ebx
 59c:	8b 15 40 09 00 00    	mov    0x940,%edx
 5a2:	85 d2                	test   %edx,%edx
 5a4:	74 1c                	je     5c2 <malloc+0x3b>
 5a6:	8b 02                	mov    (%edx),%eax
 5a8:	8b 48 04             	mov    0x4(%eax),%ecx
 5ab:	39 d9                	cmp    %ebx,%ecx
 5ad:	73 38                	jae    5e7 <malloc+0x60>
 5af:	be 00 10 00 00       	mov    $0x1000,%esi
 5b4:	39 f3                	cmp    %esi,%ebx
 5b6:	0f 43 f3             	cmovae %ebx,%esi
 5b9:	8d 3c f5 00 00 00 00 	lea    0x0(,%esi,8),%edi
 5c0:	eb 72                	jmp    634 <malloc+0xad>
 5c2:	c7 05 40 09 00 00 44 	movl   $0x944,0x940
 5c9:	09 00 00 
 5cc:	c7 05 44 09 00 00 44 	movl   $0x944,0x944
 5d3:	09 00 00 
 5d6:	c7 05 48 09 00 00 00 	movl   $0x0,0x948
 5dd:	00 00 00 
 5e0:	b8 44 09 00 00       	mov    $0x944,%eax
 5e5:	eb c8                	jmp    5af <malloc+0x28>
 5e7:	39 cb                	cmp    %ecx,%ebx
 5e9:	74 1e                	je     609 <malloc+0x82>
 5eb:	29 d9                	sub    %ebx,%ecx
 5ed:	89 48 04             	mov    %ecx,0x4(%eax)
 5f0:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 5f3:	89 58 04             	mov    %ebx,0x4(%eax)
 5f6:	89 15 40 09 00 00    	mov    %edx,0x940
 5fc:	8d 50 08             	lea    0x8(%eax),%edx
 5ff:	89 d0                	mov    %edx,%eax
 601:	8d 65 f4             	lea    -0xc(%ebp),%esp
 604:	5b                   	pop    %ebx
 605:	5e                   	pop    %esi
 606:	5f                   	pop    %edi
 607:	5d                   	pop    %ebp
 608:	c3                   	ret
 609:	8b 08                	mov    (%eax),%ecx
 60b:	89 0a                	mov    %ecx,(%edx)
 60d:	eb e7                	jmp    5f6 <malloc+0x6f>
 60f:	89 70 04             	mov    %esi,0x4(%eax)
 612:	83 ec 0c             	sub    $0xc,%esp
 615:	83 c0 08             	add    $0x8,%eax
 618:	50                   	push   %eax
 619:	e8 00 ff ff ff       	call   51e <free>
 61e:	8b 15 40 09 00 00    	mov    0x940,%edx
 624:	83 c4 10             	add    $0x10,%esp
 627:	85 d2                	test   %edx,%edx
 629:	74 d4                	je     5ff <malloc+0x78>
 62b:	8b 02                	mov    (%edx),%eax
 62d:	8b 48 04             	mov    0x4(%eax),%ecx
 630:	39 d9                	cmp    %ebx,%ecx
 632:	73 b3                	jae    5e7 <malloc+0x60>
 634:	89 c2                	mov    %eax,%edx
 636:	39 05 40 09 00 00    	cmp    %eax,0x940
 63c:	75 ed                	jne    62b <malloc+0xa4>
 63e:	83 ec 0c             	sub    $0xc,%esp
 641:	57                   	push   %edi
 642:	e8 62 fc ff ff       	call   2a9 <sbrk>
 647:	83 c4 10             	add    $0x10,%esp
 64a:	83 f8 ff             	cmp    $0xffffffff,%eax
 64d:	75 c0                	jne    60f <malloc+0x88>
 64f:	ba 00 00 00 00       	mov    $0x0,%edx
 654:	eb a9                	jmp    5ff <malloc+0x78>
