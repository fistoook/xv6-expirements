
_grep:     file format elf32-i386


Disassembly of section .text:

00000000 <matchstar>:
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	57                   	push   %edi
   4:	56                   	push   %esi
   5:	53                   	push   %ebx
   6:	83 ec 0c             	sub    $0xc,%esp
   9:	8b 75 08             	mov    0x8(%ebp),%esi
   c:	8b 7d 0c             	mov    0xc(%ebp),%edi
   f:	8b 5d 10             	mov    0x10(%ebp),%ebx
  12:	83 ec 08             	sub    $0x8,%esp
  15:	53                   	push   %ebx
  16:	57                   	push   %edi
  17:	e8 2c 00 00 00       	call   48 <matchhere>
  1c:	83 c4 10             	add    $0x10,%esp
  1f:	85 c0                	test   %eax,%eax
  21:	75 18                	jne    3b <matchstar+0x3b>
  23:	0f b6 13             	movzbl (%ebx),%edx
  26:	84 d2                	test   %dl,%dl
  28:	74 16                	je     40 <matchstar+0x40>
  2a:	83 c3 01             	add    $0x1,%ebx
  2d:	83 fe 2e             	cmp    $0x2e,%esi
  30:	74 e0                	je     12 <matchstar+0x12>
  32:	0f be d2             	movsbl %dl,%edx
  35:	39 f2                	cmp    %esi,%edx
  37:	74 d9                	je     12 <matchstar+0x12>
  39:	eb 05                	jmp    40 <matchstar+0x40>
  3b:	b8 01 00 00 00       	mov    $0x1,%eax
  40:	8d 65 f4             	lea    -0xc(%ebp),%esp
  43:	5b                   	pop    %ebx
  44:	5e                   	pop    %esi
  45:	5f                   	pop    %edi
  46:	5d                   	pop    %ebp
  47:	c3                   	ret

00000048 <matchhere>:
  48:	55                   	push   %ebp
  49:	89 e5                	mov    %esp,%ebp
  4b:	53                   	push   %ebx
  4c:	83 ec 04             	sub    $0x4,%esp
  4f:	8b 55 08             	mov    0x8(%ebp),%edx
  52:	0f b6 0a             	movzbl (%edx),%ecx
  55:	b8 01 00 00 00       	mov    $0x1,%eax
  5a:	84 c9                	test   %cl,%cl
  5c:	74 29                	je     87 <matchhere+0x3f>
  5e:	0f b6 42 01          	movzbl 0x1(%edx),%eax
  62:	3c 2a                	cmp    $0x2a,%al
  64:	74 26                	je     8c <matchhere+0x44>
  66:	84 c0                	test   %al,%al
  68:	75 05                	jne    6f <matchhere+0x27>
  6a:	80 f9 24             	cmp    $0x24,%cl
  6d:	74 35                	je     a4 <matchhere+0x5c>
  6f:	8b 45 0c             	mov    0xc(%ebp),%eax
  72:	0f b6 18             	movzbl (%eax),%ebx
  75:	b8 00 00 00 00       	mov    $0x0,%eax
  7a:	84 db                	test   %bl,%bl
  7c:	74 09                	je     87 <matchhere+0x3f>
  7e:	38 d9                	cmp    %bl,%cl
  80:	74 30                	je     b2 <matchhere+0x6a>
  82:	80 f9 2e             	cmp    $0x2e,%cl
  85:	74 2b                	je     b2 <matchhere+0x6a>
  87:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8a:	c9                   	leave
  8b:	c3                   	ret
  8c:	83 ec 04             	sub    $0x4,%esp
  8f:	ff 75 0c             	push   0xc(%ebp)
  92:	83 c2 02             	add    $0x2,%edx
  95:	52                   	push   %edx
  96:	0f be c9             	movsbl %cl,%ecx
  99:	51                   	push   %ecx
  9a:	e8 61 ff ff ff       	call   0 <matchstar>
  9f:	83 c4 10             	add    $0x10,%esp
  a2:	eb e3                	jmp    87 <matchhere+0x3f>
  a4:	8b 45 0c             	mov    0xc(%ebp),%eax
  a7:	80 38 00             	cmpb   $0x0,(%eax)
  aa:	0f 94 c0             	sete   %al
  ad:	0f b6 c0             	movzbl %al,%eax
  b0:	eb d5                	jmp    87 <matchhere+0x3f>
  b2:	83 ec 08             	sub    $0x8,%esp
  b5:	8b 45 0c             	mov    0xc(%ebp),%eax
  b8:	83 c0 01             	add    $0x1,%eax
  bb:	50                   	push   %eax
  bc:	83 c2 01             	add    $0x1,%edx
  bf:	52                   	push   %edx
  c0:	e8 83 ff ff ff       	call   48 <matchhere>
  c5:	83 c4 10             	add    $0x10,%esp
  c8:	eb bd                	jmp    87 <matchhere+0x3f>

000000ca <match>:
  ca:	55                   	push   %ebp
  cb:	89 e5                	mov    %esp,%ebp
  cd:	56                   	push   %esi
  ce:	53                   	push   %ebx
  cf:	8b 75 08             	mov    0x8(%ebp),%esi
  d2:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  d5:	80 3e 5e             	cmpb   $0x5e,(%esi)
  d8:	74 1c                	je     f6 <match+0x2c>
  da:	83 ec 08             	sub    $0x8,%esp
  dd:	53                   	push   %ebx
  de:	56                   	push   %esi
  df:	e8 64 ff ff ff       	call   48 <matchhere>
  e4:	83 c4 10             	add    $0x10,%esp
  e7:	85 c0                	test   %eax,%eax
  e9:	75 1d                	jne    108 <match+0x3e>
  eb:	83 c3 01             	add    $0x1,%ebx
  ee:	80 7b ff 00          	cmpb   $0x0,-0x1(%ebx)
  f2:	75 e6                	jne    da <match+0x10>
  f4:	eb 17                	jmp    10d <match+0x43>
  f6:	83 ec 08             	sub    $0x8,%esp
  f9:	53                   	push   %ebx
  fa:	83 c6 01             	add    $0x1,%esi
  fd:	56                   	push   %esi
  fe:	e8 45 ff ff ff       	call   48 <matchhere>
 103:	83 c4 10             	add    $0x10,%esp
 106:	eb 05                	jmp    10d <match+0x43>
 108:	b8 01 00 00 00       	mov    $0x1,%eax
 10d:	8d 65 f8             	lea    -0x8(%ebp),%esp
 110:	5b                   	pop    %ebx
 111:	5e                   	pop    %esi
 112:	5d                   	pop    %ebp
 113:	c3                   	ret

00000114 <grep>:
 114:	55                   	push   %ebp
 115:	89 e5                	mov    %esp,%ebp
 117:	57                   	push   %edi
 118:	56                   	push   %esi
 119:	53                   	push   %ebx
 11a:	83 ec 1c             	sub    $0x1c,%esp
 11d:	8b 7d 08             	mov    0x8(%ebp),%edi
 120:	bb 00 00 00 00       	mov    $0x0,%ebx
 125:	eb 53                	jmp    17a <grep+0x66>
 127:	8d 73 01             	lea    0x1(%ebx),%esi
 12a:	83 ec 08             	sub    $0x8,%esp
 12d:	6a 0a                	push   $0xa
 12f:	56                   	push   %esi
 130:	e8 e1 01 00 00       	call   316 <strchr>
 135:	89 c3                	mov    %eax,%ebx
 137:	83 c4 10             	add    $0x10,%esp
 13a:	85 c0                	test   %eax,%eax
 13c:	74 2d                	je     16b <grep+0x57>
 13e:	c6 03 00             	movb   $0x0,(%ebx)
 141:	83 ec 08             	sub    $0x8,%esp
 144:	56                   	push   %esi
 145:	57                   	push   %edi
 146:	e8 7f ff ff ff       	call   ca <match>
 14b:	83 c4 10             	add    $0x10,%esp
 14e:	85 c0                	test   %eax,%eax
 150:	74 d5                	je     127 <grep+0x13>
 152:	c6 03 0a             	movb   $0xa,(%ebx)
 155:	83 ec 04             	sub    $0x4,%esp
 158:	8d 43 01             	lea    0x1(%ebx),%eax
 15b:	29 f0                	sub    %esi,%eax
 15d:	50                   	push   %eax
 15e:	56                   	push   %esi
 15f:	6a 01                	push   $0x1
 161:	e8 0a 03 00 00       	call   470 <write>
 166:	83 c4 10             	add    $0x10,%esp
 169:	eb bc                	jmp    127 <grep+0x13>
 16b:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
 16e:	81 fe 40 0c 00 00    	cmp    $0xc40,%esi
 174:	74 3b                	je     1b1 <grep+0x9d>
 176:	85 db                	test   %ebx,%ebx
 178:	7f 3e                	jg     1b8 <grep+0xa4>
 17a:	83 ec 04             	sub    $0x4,%esp
 17d:	b8 ff 03 00 00       	mov    $0x3ff,%eax
 182:	29 d8                	sub    %ebx,%eax
 184:	50                   	push   %eax
 185:	8d 83 40 0c 00 00    	lea    0xc40(%ebx),%eax
 18b:	50                   	push   %eax
 18c:	ff 75 0c             	push   0xc(%ebp)
 18f:	e8 d4 02 00 00       	call   468 <read>
 194:	83 c4 10             	add    $0x10,%esp
 197:	85 c0                	test   %eax,%eax
 199:	7e 3a                	jle    1d5 <grep+0xc1>
 19b:	01 c3                	add    %eax,%ebx
 19d:	c6 83 40 0c 00 00 00 	movb   $0x0,0xc40(%ebx)
 1a4:	be 40 0c 00 00       	mov    $0xc40,%esi
 1a9:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
 1ac:	e9 79 ff ff ff       	jmp    12a <grep+0x16>
 1b1:	bb 00 00 00 00       	mov    $0x0,%ebx
 1b6:	eb c2                	jmp    17a <grep+0x66>
 1b8:	89 f0                	mov    %esi,%eax
 1ba:	2d 40 0c 00 00       	sub    $0xc40,%eax
 1bf:	29 c3                	sub    %eax,%ebx
 1c1:	83 ec 04             	sub    $0x4,%esp
 1c4:	53                   	push   %ebx
 1c5:	56                   	push   %esi
 1c6:	68 40 0c 00 00       	push   $0xc40
 1cb:	e8 4b 02 00 00       	call   41b <memmove>
 1d0:	83 c4 10             	add    $0x10,%esp
 1d3:	eb a5                	jmp    17a <grep+0x66>
 1d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1d8:	5b                   	pop    %ebx
 1d9:	5e                   	pop    %esi
 1da:	5f                   	pop    %edi
 1db:	5d                   	pop    %ebp
 1dc:	c3                   	ret

000001dd <main>:
 1dd:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 1e1:	83 e4 f0             	and    $0xfffffff0,%esp
 1e4:	ff 71 fc             	push   -0x4(%ecx)
 1e7:	55                   	push   %ebp
 1e8:	89 e5                	mov    %esp,%ebp
 1ea:	57                   	push   %edi
 1eb:	56                   	push   %esi
 1ec:	53                   	push   %ebx
 1ed:	51                   	push   %ecx
 1ee:	83 ec 18             	sub    $0x18,%esp
 1f1:	8b 01                	mov    (%ecx),%eax
 1f3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 1f6:	8b 71 04             	mov    0x4(%ecx),%esi
 1f9:	83 f8 01             	cmp    $0x1,%eax
 1fc:	7e 50                	jle    24e <main+0x71>
 1fe:	8b 46 04             	mov    0x4(%esi),%eax
 201:	89 45 e0             	mov    %eax,-0x20(%ebp)
 204:	83 c6 08             	add    $0x8,%esi
 207:	bf 02 00 00 00       	mov    $0x2,%edi
 20c:	83 7d e4 02          	cmpl   $0x2,-0x1c(%ebp)
 210:	7e 50                	jle    262 <main+0x85>
 212:	83 ec 08             	sub    $0x8,%esp
 215:	6a 00                	push   $0x0
 217:	ff 36                	push   (%esi)
 219:	e8 72 02 00 00       	call   490 <open>
 21e:	89 c3                	mov    %eax,%ebx
 220:	83 c4 10             	add    $0x10,%esp
 223:	85 c0                	test   %eax,%eax
 225:	78 4b                	js     272 <main+0x95>
 227:	83 ec 08             	sub    $0x8,%esp
 22a:	50                   	push   %eax
 22b:	ff 75 e0             	push   -0x20(%ebp)
 22e:	e8 e1 fe ff ff       	call   114 <grep>
 233:	89 1c 24             	mov    %ebx,(%esp)
 236:	e8 3d 02 00 00       	call   478 <close>
 23b:	83 c7 01             	add    $0x1,%edi
 23e:	83 c6 04             	add    $0x4,%esi
 241:	83 c4 10             	add    $0x10,%esp
 244:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
 247:	75 c9                	jne    212 <main+0x35>
 249:	e8 02 02 00 00       	call   450 <exit>
 24e:	83 ec 08             	sub    $0x8,%esp
 251:	68 88 08 00 00       	push   $0x888
 256:	6a 02                	push   $0x2
 258:	e8 33 03 00 00       	call   590 <printf>
 25d:	e8 ee 01 00 00       	call   450 <exit>
 262:	83 ec 08             	sub    $0x8,%esp
 265:	6a 00                	push   $0x0
 267:	50                   	push   %eax
 268:	e8 a7 fe ff ff       	call   114 <grep>
 26d:	e8 de 01 00 00       	call   450 <exit>
 272:	83 ec 04             	sub    $0x4,%esp
 275:	ff 36                	push   (%esi)
 277:	68 a8 08 00 00       	push   $0x8a8
 27c:	6a 01                	push   $0x1
 27e:	e8 0d 03 00 00       	call   590 <printf>
 283:	e8 c8 01 00 00       	call   450 <exit>

00000288 <strcpy>:
 288:	55                   	push   %ebp
 289:	89 e5                	mov    %esp,%ebp
 28b:	53                   	push   %ebx
 28c:	8b 4d 08             	mov    0x8(%ebp),%ecx
 28f:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 292:	b8 00 00 00 00       	mov    $0x0,%eax
 297:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 29b:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 29e:	83 c0 01             	add    $0x1,%eax
 2a1:	84 d2                	test   %dl,%dl
 2a3:	75 f2                	jne    297 <strcpy+0xf>
 2a5:	89 c8                	mov    %ecx,%eax
 2a7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2aa:	c9                   	leave
 2ab:	c3                   	ret

000002ac <strcmp>:
 2ac:	55                   	push   %ebp
 2ad:	89 e5                	mov    %esp,%ebp
 2af:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2b2:	8b 55 0c             	mov    0xc(%ebp),%edx
 2b5:	0f b6 01             	movzbl (%ecx),%eax
 2b8:	84 c0                	test   %al,%al
 2ba:	74 11                	je     2cd <strcmp+0x21>
 2bc:	38 02                	cmp    %al,(%edx)
 2be:	75 0d                	jne    2cd <strcmp+0x21>
 2c0:	83 c1 01             	add    $0x1,%ecx
 2c3:	83 c2 01             	add    $0x1,%edx
 2c6:	0f b6 01             	movzbl (%ecx),%eax
 2c9:	84 c0                	test   %al,%al
 2cb:	75 ef                	jne    2bc <strcmp+0x10>
 2cd:	0f b6 c0             	movzbl %al,%eax
 2d0:	0f b6 12             	movzbl (%edx),%edx
 2d3:	29 d0                	sub    %edx,%eax
 2d5:	5d                   	pop    %ebp
 2d6:	c3                   	ret

000002d7 <strlen>:
 2d7:	55                   	push   %ebp
 2d8:	89 e5                	mov    %esp,%ebp
 2da:	8b 55 08             	mov    0x8(%ebp),%edx
 2dd:	80 3a 00             	cmpb   $0x0,(%edx)
 2e0:	74 14                	je     2f6 <strlen+0x1f>
 2e2:	b8 00 00 00 00       	mov    $0x0,%eax
 2e7:	83 c0 01             	add    $0x1,%eax
 2ea:	89 c1                	mov    %eax,%ecx
 2ec:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 2f0:	75 f5                	jne    2e7 <strlen+0x10>
 2f2:	89 c8                	mov    %ecx,%eax
 2f4:	5d                   	pop    %ebp
 2f5:	c3                   	ret
 2f6:	b9 00 00 00 00       	mov    $0x0,%ecx
 2fb:	eb f5                	jmp    2f2 <strlen+0x1b>

000002fd <memset>:
 2fd:	55                   	push   %ebp
 2fe:	89 e5                	mov    %esp,%ebp
 300:	57                   	push   %edi
 301:	8b 55 08             	mov    0x8(%ebp),%edx
 304:	89 d7                	mov    %edx,%edi
 306:	8b 4d 10             	mov    0x10(%ebp),%ecx
 309:	8b 45 0c             	mov    0xc(%ebp),%eax
 30c:	fc                   	cld
 30d:	f3 aa                	rep stos %al,%es:(%edi)
 30f:	89 d0                	mov    %edx,%eax
 311:	8b 7d fc             	mov    -0x4(%ebp),%edi
 314:	c9                   	leave
 315:	c3                   	ret

00000316 <strchr>:
 316:	55                   	push   %ebp
 317:	89 e5                	mov    %esp,%ebp
 319:	8b 45 08             	mov    0x8(%ebp),%eax
 31c:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
 320:	0f b6 10             	movzbl (%eax),%edx
 323:	84 d2                	test   %dl,%dl
 325:	74 15                	je     33c <strchr+0x26>
 327:	38 d1                	cmp    %dl,%cl
 329:	74 0f                	je     33a <strchr+0x24>
 32b:	83 c0 01             	add    $0x1,%eax
 32e:	0f b6 10             	movzbl (%eax),%edx
 331:	84 d2                	test   %dl,%dl
 333:	75 f2                	jne    327 <strchr+0x11>
 335:	b8 00 00 00 00       	mov    $0x0,%eax
 33a:	5d                   	pop    %ebp
 33b:	c3                   	ret
 33c:	b8 00 00 00 00       	mov    $0x0,%eax
 341:	eb f7                	jmp    33a <strchr+0x24>

00000343 <gets>:
 343:	55                   	push   %ebp
 344:	89 e5                	mov    %esp,%ebp
 346:	57                   	push   %edi
 347:	56                   	push   %esi
 348:	53                   	push   %ebx
 349:	83 ec 2c             	sub    $0x2c,%esp
 34c:	8b 75 08             	mov    0x8(%ebp),%esi
 34f:	bb 00 00 00 00       	mov    $0x0,%ebx
 354:	8d 7d e7             	lea    -0x19(%ebp),%edi
 357:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 35a:	83 c3 01             	add    $0x1,%ebx
 35d:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 360:	7d 27                	jge    389 <gets+0x46>
 362:	83 ec 04             	sub    $0x4,%esp
 365:	6a 01                	push   $0x1
 367:	57                   	push   %edi
 368:	6a 00                	push   $0x0
 36a:	e8 f9 00 00 00       	call   468 <read>
 36f:	83 c4 10             	add    $0x10,%esp
 372:	85 c0                	test   %eax,%eax
 374:	7e 13                	jle    389 <gets+0x46>
 376:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 37a:	88 44 1e ff          	mov    %al,-0x1(%esi,%ebx,1)
 37e:	3c 0a                	cmp    $0xa,%al
 380:	74 04                	je     386 <gets+0x43>
 382:	3c 0d                	cmp    $0xd,%al
 384:	75 d1                	jne    357 <gets+0x14>
 386:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 389:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 38c:	c6 04 06 00          	movb   $0x0,(%esi,%eax,1)
 390:	89 f0                	mov    %esi,%eax
 392:	8d 65 f4             	lea    -0xc(%ebp),%esp
 395:	5b                   	pop    %ebx
 396:	5e                   	pop    %esi
 397:	5f                   	pop    %edi
 398:	5d                   	pop    %ebp
 399:	c3                   	ret

0000039a <stat>:
 39a:	55                   	push   %ebp
 39b:	89 e5                	mov    %esp,%ebp
 39d:	56                   	push   %esi
 39e:	53                   	push   %ebx
 39f:	83 ec 08             	sub    $0x8,%esp
 3a2:	6a 00                	push   $0x0
 3a4:	ff 75 08             	push   0x8(%ebp)
 3a7:	e8 e4 00 00 00       	call   490 <open>
 3ac:	83 c4 10             	add    $0x10,%esp
 3af:	85 c0                	test   %eax,%eax
 3b1:	78 24                	js     3d7 <stat+0x3d>
 3b3:	89 c3                	mov    %eax,%ebx
 3b5:	83 ec 08             	sub    $0x8,%esp
 3b8:	ff 75 0c             	push   0xc(%ebp)
 3bb:	50                   	push   %eax
 3bc:	e8 e7 00 00 00       	call   4a8 <fstat>
 3c1:	89 c6                	mov    %eax,%esi
 3c3:	89 1c 24             	mov    %ebx,(%esp)
 3c6:	e8 ad 00 00 00       	call   478 <close>
 3cb:	83 c4 10             	add    $0x10,%esp
 3ce:	89 f0                	mov    %esi,%eax
 3d0:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3d3:	5b                   	pop    %ebx
 3d4:	5e                   	pop    %esi
 3d5:	5d                   	pop    %ebp
 3d6:	c3                   	ret
 3d7:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3dc:	eb f0                	jmp    3ce <stat+0x34>

000003de <atoi>:
 3de:	55                   	push   %ebp
 3df:	89 e5                	mov    %esp,%ebp
 3e1:	53                   	push   %ebx
 3e2:	8b 55 08             	mov    0x8(%ebp),%edx
 3e5:	0f b6 02             	movzbl (%edx),%eax
 3e8:	8d 48 d0             	lea    -0x30(%eax),%ecx
 3eb:	80 f9 09             	cmp    $0x9,%cl
 3ee:	77 24                	ja     414 <atoi+0x36>
 3f0:	b9 00 00 00 00       	mov    $0x0,%ecx
 3f5:	83 c2 01             	add    $0x1,%edx
 3f8:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 3fb:	0f be c0             	movsbl %al,%eax
 3fe:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
 402:	0f b6 02             	movzbl (%edx),%eax
 405:	8d 58 d0             	lea    -0x30(%eax),%ebx
 408:	80 fb 09             	cmp    $0x9,%bl
 40b:	76 e8                	jbe    3f5 <atoi+0x17>
 40d:	89 c8                	mov    %ecx,%eax
 40f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 412:	c9                   	leave
 413:	c3                   	ret
 414:	b9 00 00 00 00       	mov    $0x0,%ecx
 419:	eb f2                	jmp    40d <atoi+0x2f>

0000041b <memmove>:
 41b:	55                   	push   %ebp
 41c:	89 e5                	mov    %esp,%ebp
 41e:	56                   	push   %esi
 41f:	53                   	push   %ebx
 420:	8b 75 08             	mov    0x8(%ebp),%esi
 423:	8b 55 0c             	mov    0xc(%ebp),%edx
 426:	8b 5d 10             	mov    0x10(%ebp),%ebx
 429:	85 db                	test   %ebx,%ebx
 42b:	7e 15                	jle    442 <memmove+0x27>
 42d:	01 f3                	add    %esi,%ebx
 42f:	89 f0                	mov    %esi,%eax
 431:	83 c2 01             	add    $0x1,%edx
 434:	83 c0 01             	add    $0x1,%eax
 437:	0f b6 4a ff          	movzbl -0x1(%edx),%ecx
 43b:	88 48 ff             	mov    %cl,-0x1(%eax)
 43e:	39 c3                	cmp    %eax,%ebx
 440:	75 ef                	jne    431 <memmove+0x16>
 442:	89 f0                	mov    %esi,%eax
 444:	5b                   	pop    %ebx
 445:	5e                   	pop    %esi
 446:	5d                   	pop    %ebp
 447:	c3                   	ret

00000448 <fork>:
  name: \
    movl $1, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALLFORK(fork) //instead of SYSCALL(fork) !!!
 448:	b8 01 00 00 00       	mov    $0x1,%eax
 44d:	cd 40                	int    $0x40
 44f:	c3                   	ret

00000450 <exit>:
//SYSCALL(fork)
SYSCALL(exit)
 450:	b8 02 00 00 00       	mov    $0x2,%eax
 455:	cd 40                	int    $0x40
 457:	c3                   	ret

00000458 <wait>:
SYSCALL(wait)
 458:	b8 03 00 00 00       	mov    $0x3,%eax
 45d:	cd 40                	int    $0x40
 45f:	c3                   	ret

00000460 <pipe>:
SYSCALL(pipe)
 460:	b8 04 00 00 00       	mov    $0x4,%eax
 465:	cd 40                	int    $0x40
 467:	c3                   	ret

00000468 <read>:
SYSCALL(read)
 468:	b8 05 00 00 00       	mov    $0x5,%eax
 46d:	cd 40                	int    $0x40
 46f:	c3                   	ret

00000470 <write>:
SYSCALL(write)
 470:	b8 10 00 00 00       	mov    $0x10,%eax
 475:	cd 40                	int    $0x40
 477:	c3                   	ret

00000478 <close>:
SYSCALL(close)
 478:	b8 15 00 00 00       	mov    $0x15,%eax
 47d:	cd 40                	int    $0x40
 47f:	c3                   	ret

00000480 <kill>:
SYSCALL(kill)
 480:	b8 06 00 00 00       	mov    $0x6,%eax
 485:	cd 40                	int    $0x40
 487:	c3                   	ret

00000488 <exec>:
SYSCALL(exec)
 488:	b8 07 00 00 00       	mov    $0x7,%eax
 48d:	cd 40                	int    $0x40
 48f:	c3                   	ret

00000490 <open>:
SYSCALL(open)
 490:	b8 0f 00 00 00       	mov    $0xf,%eax
 495:	cd 40                	int    $0x40
 497:	c3                   	ret

00000498 <mknod>:
SYSCALL(mknod)
 498:	b8 11 00 00 00       	mov    $0x11,%eax
 49d:	cd 40                	int    $0x40
 49f:	c3                   	ret

000004a0 <unlink>:
SYSCALL(unlink)
 4a0:	b8 12 00 00 00       	mov    $0x12,%eax
 4a5:	cd 40                	int    $0x40
 4a7:	c3                   	ret

000004a8 <fstat>:
SYSCALL(fstat)
 4a8:	b8 08 00 00 00       	mov    $0x8,%eax
 4ad:	cd 40                	int    $0x40
 4af:	c3                   	ret

000004b0 <link>:
SYSCALL(link)
 4b0:	b8 13 00 00 00       	mov    $0x13,%eax
 4b5:	cd 40                	int    $0x40
 4b7:	c3                   	ret

000004b8 <mkdir>:
SYSCALL(mkdir)
 4b8:	b8 14 00 00 00       	mov    $0x14,%eax
 4bd:	cd 40                	int    $0x40
 4bf:	c3                   	ret

000004c0 <chdir>:
SYSCALL(chdir)
 4c0:	b8 09 00 00 00       	mov    $0x9,%eax
 4c5:	cd 40                	int    $0x40
 4c7:	c3                   	ret

000004c8 <dup>:
SYSCALL(dup)
 4c8:	b8 0a 00 00 00       	mov    $0xa,%eax
 4cd:	cd 40                	int    $0x40
 4cf:	c3                   	ret

000004d0 <getpid>:
SYSCALL(getpid)
 4d0:	b8 0b 00 00 00       	mov    $0xb,%eax
 4d5:	cd 40                	int    $0x40
 4d7:	c3                   	ret

000004d8 <sbrk>:
SYSCALL(sbrk)
 4d8:	b8 0c 00 00 00       	mov    $0xc,%eax
 4dd:	cd 40                	int    $0x40
 4df:	c3                   	ret

000004e0 <sleep>:
SYSCALL(sleep)
 4e0:	b8 0d 00 00 00       	mov    $0xd,%eax
 4e5:	cd 40                	int    $0x40
 4e7:	c3                   	ret

000004e8 <uptime>:
SYSCALL(uptime)
 4e8:	b8 0e 00 00 00       	mov    $0xe,%eax
 4ed:	cd 40                	int    $0x40
 4ef:	c3                   	ret

000004f0 <ps>:
SYSCALL(ps)
 4f0:	b8 16 00 00 00       	mov    $0x16,%eax
 4f5:	cd 40                	int    $0x40
 4f7:	c3                   	ret

000004f8 <printint>:
 4f8:	55                   	push   %ebp
 4f9:	89 e5                	mov    %esp,%ebp
 4fb:	57                   	push   %edi
 4fc:	56                   	push   %esi
 4fd:	53                   	push   %ebx
 4fe:	83 ec 3c             	sub    $0x3c,%esp
 501:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 504:	89 ce                	mov    %ecx,%esi
 506:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 50a:	74 79                	je     585 <printint+0x8d>
 50c:	85 d2                	test   %edx,%edx
 50e:	79 75                	jns    585 <printint+0x8d>
 510:	89 d1                	mov    %edx,%ecx
 512:	f7 d9                	neg    %ecx
 514:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
 51b:	bb 00 00 00 00       	mov    $0x0,%ebx
 520:	89 df                	mov    %ebx,%edi
 522:	83 c3 01             	add    $0x1,%ebx
 525:	89 c8                	mov    %ecx,%eax
 527:	ba 00 00 00 00       	mov    $0x0,%edx
 52c:	f7 f6                	div    %esi
 52e:	0f b6 92 20 09 00 00 	movzbl 0x920(%edx),%edx
 535:	88 54 1d d7          	mov    %dl,-0x29(%ebp,%ebx,1)
 539:	89 ca                	mov    %ecx,%edx
 53b:	89 c1                	mov    %eax,%ecx
 53d:	39 f2                	cmp    %esi,%edx
 53f:	73 df                	jae    520 <printint+0x28>
 541:	83 7d c0 00          	cmpl   $0x0,-0x40(%ebp)
 545:	74 08                	je     54f <printint+0x57>
 547:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 54c:	8d 5f 02             	lea    0x2(%edi),%ebx
 54f:	85 db                	test   %ebx,%ebx
 551:	7e 2a                	jle    57d <printint+0x85>
 553:	8d 75 d8             	lea    -0x28(%ebp),%esi
 556:	8d 5c 1d d7          	lea    -0x29(%ebp,%ebx,1),%ebx
 55a:	8d 7d d7             	lea    -0x29(%ebp),%edi
 55d:	0f b6 03             	movzbl (%ebx),%eax
 560:	88 45 d7             	mov    %al,-0x29(%ebp)
 563:	83 ec 04             	sub    $0x4,%esp
 566:	6a 01                	push   $0x1
 568:	57                   	push   %edi
 569:	ff 75 c4             	push   -0x3c(%ebp)
 56c:	e8 ff fe ff ff       	call   470 <write>
 571:	89 d8                	mov    %ebx,%eax
 573:	83 eb 01             	sub    $0x1,%ebx
 576:	83 c4 10             	add    $0x10,%esp
 579:	39 f0                	cmp    %esi,%eax
 57b:	75 e0                	jne    55d <printint+0x65>
 57d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 580:	5b                   	pop    %ebx
 581:	5e                   	pop    %esi
 582:	5f                   	pop    %edi
 583:	5d                   	pop    %ebp
 584:	c3                   	ret
 585:	89 d1                	mov    %edx,%ecx
 587:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
 58e:	eb 8b                	jmp    51b <printint+0x23>

00000590 <printf>:
 590:	55                   	push   %ebp
 591:	89 e5                	mov    %esp,%ebp
 593:	57                   	push   %edi
 594:	56                   	push   %esi
 595:	53                   	push   %ebx
 596:	83 ec 2c             	sub    $0x2c,%esp
 599:	8b 75 0c             	mov    0xc(%ebp),%esi
 59c:	0f b6 1e             	movzbl (%esi),%ebx
 59f:	84 db                	test   %bl,%bl
 5a1:	0f 84 9e 01 00 00    	je     745 <printf+0x1b5>
 5a7:	83 c6 01             	add    $0x1,%esi
 5aa:	8d 45 10             	lea    0x10(%ebp),%eax
 5ad:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 5b0:	bf 00 00 00 00       	mov    $0x0,%edi
 5b5:	eb 2d                	jmp    5e4 <printf+0x54>
 5b7:	88 5d e7             	mov    %bl,-0x19(%ebp)
 5ba:	83 ec 04             	sub    $0x4,%esp
 5bd:	6a 01                	push   $0x1
 5bf:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5c2:	50                   	push   %eax
 5c3:	ff 75 08             	push   0x8(%ebp)
 5c6:	e8 a5 fe ff ff       	call   470 <write>
 5cb:	83 c4 10             	add    $0x10,%esp
 5ce:	eb 05                	jmp    5d5 <printf+0x45>
 5d0:	83 ff 25             	cmp    $0x25,%edi
 5d3:	74 1f                	je     5f4 <printf+0x64>
 5d5:	83 c6 01             	add    $0x1,%esi
 5d8:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 5dc:	84 db                	test   %bl,%bl
 5de:	0f 84 61 01 00 00    	je     745 <printf+0x1b5>
 5e4:	0f b6 c3             	movzbl %bl,%eax
 5e7:	85 ff                	test   %edi,%edi
 5e9:	75 e5                	jne    5d0 <printf+0x40>
 5eb:	83 f8 25             	cmp    $0x25,%eax
 5ee:	75 c7                	jne    5b7 <printf+0x27>
 5f0:	89 c7                	mov    %eax,%edi
 5f2:	eb e1                	jmp    5d5 <printf+0x45>
 5f4:	83 f8 25             	cmp    $0x25,%eax
 5f7:	0f 84 f4 00 00 00    	je     6f1 <printf+0x161>
 5fd:	8d 50 9d             	lea    -0x63(%eax),%edx
 600:	83 fa 15             	cmp    $0x15,%edx
 603:	0f 87 09 01 00 00    	ja     712 <printf+0x182>
 609:	0f 87 03 01 00 00    	ja     712 <printf+0x182>
 60f:	ff 24 95 c8 08 00 00 	jmp    *0x8c8(,%edx,4)
 616:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 619:	8b 17                	mov    (%edi),%edx
 61b:	83 ec 0c             	sub    $0xc,%esp
 61e:	6a 01                	push   $0x1
 620:	b9 0a 00 00 00       	mov    $0xa,%ecx
 625:	8b 45 08             	mov    0x8(%ebp),%eax
 628:	e8 cb fe ff ff       	call   4f8 <printint>
 62d:	83 c7 04             	add    $0x4,%edi
 630:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 633:	83 c4 10             	add    $0x10,%esp
 636:	bf 00 00 00 00       	mov    $0x0,%edi
 63b:	eb 98                	jmp    5d5 <printf+0x45>
 63d:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 640:	8b 17                	mov    (%edi),%edx
 642:	83 ec 0c             	sub    $0xc,%esp
 645:	6a 00                	push   $0x0
 647:	b9 10 00 00 00       	mov    $0x10,%ecx
 64c:	8b 45 08             	mov    0x8(%ebp),%eax
 64f:	e8 a4 fe ff ff       	call   4f8 <printint>
 654:	83 c7 04             	add    $0x4,%edi
 657:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 65a:	83 c4 10             	add    $0x10,%esp
 65d:	bf 00 00 00 00       	mov    $0x0,%edi
 662:	e9 6e ff ff ff       	jmp    5d5 <printf+0x45>
 667:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
 66a:	8b 01                	mov    (%ecx),%eax
 66c:	83 c1 04             	add    $0x4,%ecx
 66f:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 672:	85 c0                	test   %eax,%eax
 674:	74 13                	je     689 <printf+0xf9>
 676:	89 c3                	mov    %eax,%ebx
 678:	0f b6 00             	movzbl (%eax),%eax
 67b:	bf 00 00 00 00       	mov    $0x0,%edi
 680:	84 c0                	test   %al,%al
 682:	75 0f                	jne    693 <printf+0x103>
 684:	e9 4c ff ff ff       	jmp    5d5 <printf+0x45>
 689:	bb be 08 00 00       	mov    $0x8be,%ebx
 68e:	b8 28 00 00 00       	mov    $0x28,%eax
 693:	8d 7d e7             	lea    -0x19(%ebp),%edi
 696:	89 75 d0             	mov    %esi,-0x30(%ebp)
 699:	8b 75 08             	mov    0x8(%ebp),%esi
 69c:	88 45 e7             	mov    %al,-0x19(%ebp)
 69f:	83 ec 04             	sub    $0x4,%esp
 6a2:	6a 01                	push   $0x1
 6a4:	57                   	push   %edi
 6a5:	56                   	push   %esi
 6a6:	e8 c5 fd ff ff       	call   470 <write>
 6ab:	83 c3 01             	add    $0x1,%ebx
 6ae:	0f b6 03             	movzbl (%ebx),%eax
 6b1:	83 c4 10             	add    $0x10,%esp
 6b4:	84 c0                	test   %al,%al
 6b6:	75 e4                	jne    69c <printf+0x10c>
 6b8:	8b 75 d0             	mov    -0x30(%ebp),%esi
 6bb:	bf 00 00 00 00       	mov    $0x0,%edi
 6c0:	e9 10 ff ff ff       	jmp    5d5 <printf+0x45>
 6c5:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 6c8:	8b 07                	mov    (%edi),%eax
 6ca:	88 45 e7             	mov    %al,-0x19(%ebp)
 6cd:	83 ec 04             	sub    $0x4,%esp
 6d0:	6a 01                	push   $0x1
 6d2:	8d 45 e7             	lea    -0x19(%ebp),%eax
 6d5:	50                   	push   %eax
 6d6:	ff 75 08             	push   0x8(%ebp)
 6d9:	e8 92 fd ff ff       	call   470 <write>
 6de:	83 c7 04             	add    $0x4,%edi
 6e1:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 6e4:	83 c4 10             	add    $0x10,%esp
 6e7:	bf 00 00 00 00       	mov    $0x0,%edi
 6ec:	e9 e4 fe ff ff       	jmp    5d5 <printf+0x45>
 6f1:	88 5d e7             	mov    %bl,-0x19(%ebp)
 6f4:	83 ec 04             	sub    $0x4,%esp
 6f7:	6a 01                	push   $0x1
 6f9:	8d 45 e7             	lea    -0x19(%ebp),%eax
 6fc:	50                   	push   %eax
 6fd:	ff 75 08             	push   0x8(%ebp)
 700:	e8 6b fd ff ff       	call   470 <write>
 705:	83 c4 10             	add    $0x10,%esp
 708:	bf 00 00 00 00       	mov    $0x0,%edi
 70d:	e9 c3 fe ff ff       	jmp    5d5 <printf+0x45>
 712:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 716:	83 ec 04             	sub    $0x4,%esp
 719:	6a 01                	push   $0x1
 71b:	8d 7d e7             	lea    -0x19(%ebp),%edi
 71e:	57                   	push   %edi
 71f:	ff 75 08             	push   0x8(%ebp)
 722:	e8 49 fd ff ff       	call   470 <write>
 727:	88 5d e7             	mov    %bl,-0x19(%ebp)
 72a:	83 c4 0c             	add    $0xc,%esp
 72d:	6a 01                	push   $0x1
 72f:	57                   	push   %edi
 730:	ff 75 08             	push   0x8(%ebp)
 733:	e8 38 fd ff ff       	call   470 <write>
 738:	83 c4 10             	add    $0x10,%esp
 73b:	bf 00 00 00 00       	mov    $0x0,%edi
 740:	e9 90 fe ff ff       	jmp    5d5 <printf+0x45>
 745:	8d 65 f4             	lea    -0xc(%ebp),%esp
 748:	5b                   	pop    %ebx
 749:	5e                   	pop    %esi
 74a:	5f                   	pop    %edi
 74b:	5d                   	pop    %ebp
 74c:	c3                   	ret

0000074d <free>:
 74d:	55                   	push   %ebp
 74e:	89 e5                	mov    %esp,%ebp
 750:	57                   	push   %edi
 751:	56                   	push   %esi
 752:	53                   	push   %ebx
 753:	8b 5d 08             	mov    0x8(%ebp),%ebx
 756:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 759:	a1 40 10 00 00       	mov    0x1040,%eax
 75e:	eb 0c                	jmp    76c <free+0x1f>
 760:	8b 10                	mov    (%eax),%edx
 762:	39 d0                	cmp    %edx,%eax
 764:	72 04                	jb     76a <free+0x1d>
 766:	39 d1                	cmp    %edx,%ecx
 768:	72 10                	jb     77a <free+0x2d>
 76a:	89 d0                	mov    %edx,%eax
 76c:	39 c8                	cmp    %ecx,%eax
 76e:	73 f0                	jae    760 <free+0x13>
 770:	8b 10                	mov    (%eax),%edx
 772:	39 d1                	cmp    %edx,%ecx
 774:	72 04                	jb     77a <free+0x2d>
 776:	39 d0                	cmp    %edx,%eax
 778:	72 f0                	jb     76a <free+0x1d>
 77a:	8b 73 fc             	mov    -0x4(%ebx),%esi
 77d:	8b 10                	mov    (%eax),%edx
 77f:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 782:	39 fa                	cmp    %edi,%edx
 784:	74 19                	je     79f <free+0x52>
 786:	89 53 f8             	mov    %edx,-0x8(%ebx)
 789:	8b 50 04             	mov    0x4(%eax),%edx
 78c:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 78f:	39 f1                	cmp    %esi,%ecx
 791:	74 18                	je     7ab <free+0x5e>
 793:	89 08                	mov    %ecx,(%eax)
 795:	a3 40 10 00 00       	mov    %eax,0x1040
 79a:	5b                   	pop    %ebx
 79b:	5e                   	pop    %esi
 79c:	5f                   	pop    %edi
 79d:	5d                   	pop    %ebp
 79e:	c3                   	ret
 79f:	03 72 04             	add    0x4(%edx),%esi
 7a2:	89 73 fc             	mov    %esi,-0x4(%ebx)
 7a5:	8b 10                	mov    (%eax),%edx
 7a7:	8b 12                	mov    (%edx),%edx
 7a9:	eb db                	jmp    786 <free+0x39>
 7ab:	03 53 fc             	add    -0x4(%ebx),%edx
 7ae:	89 50 04             	mov    %edx,0x4(%eax)
 7b1:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 7b4:	eb dd                	jmp    793 <free+0x46>

000007b6 <malloc>:
 7b6:	55                   	push   %ebp
 7b7:	89 e5                	mov    %esp,%ebp
 7b9:	57                   	push   %edi
 7ba:	56                   	push   %esi
 7bb:	53                   	push   %ebx
 7bc:	83 ec 0c             	sub    $0xc,%esp
 7bf:	8b 45 08             	mov    0x8(%ebp),%eax
 7c2:	8d 58 07             	lea    0x7(%eax),%ebx
 7c5:	c1 eb 03             	shr    $0x3,%ebx
 7c8:	83 c3 01             	add    $0x1,%ebx
 7cb:	8b 15 40 10 00 00    	mov    0x1040,%edx
 7d1:	85 d2                	test   %edx,%edx
 7d3:	74 1c                	je     7f1 <malloc+0x3b>
 7d5:	8b 02                	mov    (%edx),%eax
 7d7:	8b 48 04             	mov    0x4(%eax),%ecx
 7da:	39 d9                	cmp    %ebx,%ecx
 7dc:	73 38                	jae    816 <malloc+0x60>
 7de:	be 00 10 00 00       	mov    $0x1000,%esi
 7e3:	39 f3                	cmp    %esi,%ebx
 7e5:	0f 43 f3             	cmovae %ebx,%esi
 7e8:	8d 3c f5 00 00 00 00 	lea    0x0(,%esi,8),%edi
 7ef:	eb 72                	jmp    863 <malloc+0xad>
 7f1:	c7 05 40 10 00 00 44 	movl   $0x1044,0x1040
 7f8:	10 00 00 
 7fb:	c7 05 44 10 00 00 44 	movl   $0x1044,0x1044
 802:	10 00 00 
 805:	c7 05 48 10 00 00 00 	movl   $0x0,0x1048
 80c:	00 00 00 
 80f:	b8 44 10 00 00       	mov    $0x1044,%eax
 814:	eb c8                	jmp    7de <malloc+0x28>
 816:	39 cb                	cmp    %ecx,%ebx
 818:	74 1e                	je     838 <malloc+0x82>
 81a:	29 d9                	sub    %ebx,%ecx
 81c:	89 48 04             	mov    %ecx,0x4(%eax)
 81f:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 822:	89 58 04             	mov    %ebx,0x4(%eax)
 825:	89 15 40 10 00 00    	mov    %edx,0x1040
 82b:	8d 50 08             	lea    0x8(%eax),%edx
 82e:	89 d0                	mov    %edx,%eax
 830:	8d 65 f4             	lea    -0xc(%ebp),%esp
 833:	5b                   	pop    %ebx
 834:	5e                   	pop    %esi
 835:	5f                   	pop    %edi
 836:	5d                   	pop    %ebp
 837:	c3                   	ret
 838:	8b 08                	mov    (%eax),%ecx
 83a:	89 0a                	mov    %ecx,(%edx)
 83c:	eb e7                	jmp    825 <malloc+0x6f>
 83e:	89 70 04             	mov    %esi,0x4(%eax)
 841:	83 ec 0c             	sub    $0xc,%esp
 844:	83 c0 08             	add    $0x8,%eax
 847:	50                   	push   %eax
 848:	e8 00 ff ff ff       	call   74d <free>
 84d:	8b 15 40 10 00 00    	mov    0x1040,%edx
 853:	83 c4 10             	add    $0x10,%esp
 856:	85 d2                	test   %edx,%edx
 858:	74 d4                	je     82e <malloc+0x78>
 85a:	8b 02                	mov    (%edx),%eax
 85c:	8b 48 04             	mov    0x4(%eax),%ecx
 85f:	39 d9                	cmp    %ebx,%ecx
 861:	73 b3                	jae    816 <malloc+0x60>
 863:	89 c2                	mov    %eax,%edx
 865:	39 05 40 10 00 00    	cmp    %eax,0x1040
 86b:	75 ed                	jne    85a <malloc+0xa4>
 86d:	83 ec 0c             	sub    $0xc,%esp
 870:	57                   	push   %edi
 871:	e8 62 fc ff ff       	call   4d8 <sbrk>
 876:	83 c4 10             	add    $0x10,%esp
 879:	83 f8 ff             	cmp    $0xffffffff,%eax
 87c:	75 c0                	jne    83e <malloc+0x88>
 87e:	ba 00 00 00 00       	mov    $0x0,%edx
 883:	eb a9                	jmp    82e <malloc+0x78>
