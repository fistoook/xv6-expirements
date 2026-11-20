
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <getcmd>:
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	56                   	push   %esi
   4:	53                   	push   %ebx
   5:	8b 5d 08             	mov    0x8(%ebp),%ebx
   8:	8b 75 0c             	mov    0xc(%ebp),%esi
   b:	83 ec 08             	sub    $0x8,%esp
   e:	68 d8 0f 00 00       	push   $0xfd8
  13:	6a 02                	push   $0x2
  15:	e8 c9 0c 00 00       	call   ce3 <printf>
  1a:	83 c4 0c             	add    $0xc,%esp
  1d:	56                   	push   %esi
  1e:	6a 00                	push   $0x0
  20:	53                   	push   %ebx
  21:	e8 2a 0a 00 00       	call   a50 <memset>
  26:	83 c4 08             	add    $0x8,%esp
  29:	56                   	push   %esi
  2a:	53                   	push   %ebx
  2b:	e8 66 0a 00 00       	call   a96 <gets>
  30:	83 c4 10             	add    $0x10,%esp
  33:	80 3b 01             	cmpb   $0x1,(%ebx)
  36:	19 c0                	sbb    %eax,%eax
  38:	8d 65 f8             	lea    -0x8(%ebp),%esp
  3b:	5b                   	pop    %ebx
  3c:	5e                   	pop    %esi
  3d:	5d                   	pop    %ebp
  3e:	c3                   	ret

0000003f <panic>:
  3f:	55                   	push   %ebp
  40:	89 e5                	mov    %esp,%ebp
  42:	83 ec 0c             	sub    $0xc,%esp
  45:	ff 75 08             	push   0x8(%ebp)
  48:	68 75 10 00 00       	push   $0x1075
  4d:	6a 02                	push   $0x2
  4f:	e8 8f 0c 00 00       	call   ce3 <printf>
  54:	e8 4a 0b 00 00       	call   ba3 <exit>

00000059 <fork1>:
  59:	55                   	push   %ebp
  5a:	89 e5                	mov    %esp,%ebp
  5c:	83 ec 08             	sub    $0x8,%esp
  5f:	e8 37 0b 00 00       	call   b9b <fork>
  64:	83 f8 ff             	cmp    $0xffffffff,%eax
  67:	74 02                	je     6b <fork1+0x12>
  69:	c9                   	leave
  6a:	c3                   	ret
  6b:	83 ec 0c             	sub    $0xc,%esp
  6e:	68 db 0f 00 00       	push   $0xfdb
  73:	e8 c7 ff ff ff       	call   3f <panic>

00000078 <runcmd>:
  78:	55                   	push   %ebp
  79:	89 e5                	mov    %esp,%ebp
  7b:	53                   	push   %ebx
  7c:	83 ec 14             	sub    $0x14,%esp
  7f:	8b 5d 08             	mov    0x8(%ebp),%ebx
  82:	85 db                	test   %ebx,%ebx
  84:	74 0e                	je     94 <runcmd+0x1c>
  86:	83 3b 05             	cmpl   $0x5,(%ebx)
  89:	77 0e                	ja     99 <runcmd+0x21>
  8b:	8b 03                	mov    (%ebx),%eax
  8d:	ff 24 85 98 10 00 00 	jmp    *0x1098(,%eax,4)
  94:	e8 0a 0b 00 00       	call   ba3 <exit>
  99:	83 ec 0c             	sub    $0xc,%esp
  9c:	68 e0 0f 00 00       	push   $0xfe0
  a1:	e8 99 ff ff ff       	call   3f <panic>
  a6:	8b 43 04             	mov    0x4(%ebx),%eax
  a9:	85 c0                	test   %eax,%eax
  ab:	74 27                	je     d4 <runcmd+0x5c>
  ad:	83 ec 08             	sub    $0x8,%esp
  b0:	8d 53 04             	lea    0x4(%ebx),%edx
  b3:	52                   	push   %edx
  b4:	50                   	push   %eax
  b5:	e8 21 0b 00 00       	call   bdb <exec>
  ba:	83 c4 0c             	add    $0xc,%esp
  bd:	ff 73 04             	push   0x4(%ebx)
  c0:	68 e7 0f 00 00       	push   $0xfe7
  c5:	6a 02                	push   $0x2
  c7:	e8 17 0c 00 00       	call   ce3 <printf>
  cc:	83 c4 10             	add    $0x10,%esp
  cf:	e8 cf 0a 00 00       	call   ba3 <exit>
  d4:	e8 ca 0a 00 00       	call   ba3 <exit>
  d9:	83 ec 0c             	sub    $0xc,%esp
  dc:	ff 73 14             	push   0x14(%ebx)
  df:	e8 e7 0a 00 00       	call   bcb <close>
  e4:	83 c4 08             	add    $0x8,%esp
  e7:	ff 73 10             	push   0x10(%ebx)
  ea:	ff 73 08             	push   0x8(%ebx)
  ed:	e8 f1 0a 00 00       	call   be3 <open>
  f2:	83 c4 10             	add    $0x10,%esp
  f5:	85 c0                	test   %eax,%eax
  f7:	78 0b                	js     104 <runcmd+0x8c>
  f9:	83 ec 0c             	sub    $0xc,%esp
  fc:	ff 73 04             	push   0x4(%ebx)
  ff:	e8 74 ff ff ff       	call   78 <runcmd>
 104:	83 ec 04             	sub    $0x4,%esp
 107:	ff 73 08             	push   0x8(%ebx)
 10a:	68 f7 0f 00 00       	push   $0xff7
 10f:	6a 02                	push   $0x2
 111:	e8 cd 0b 00 00       	call   ce3 <printf>
 116:	e8 88 0a 00 00       	call   ba3 <exit>
 11b:	e8 39 ff ff ff       	call   59 <fork1>
 120:	85 c0                	test   %eax,%eax
 122:	75 0b                	jne    12f <runcmd+0xb7>
 124:	83 ec 0c             	sub    $0xc,%esp
 127:	ff 73 04             	push   0x4(%ebx)
 12a:	e8 49 ff ff ff       	call   78 <runcmd>
 12f:	e8 77 0a 00 00       	call   bab <wait>
 134:	83 ec 0c             	sub    $0xc,%esp
 137:	ff 73 08             	push   0x8(%ebx)
 13a:	e8 39 ff ff ff       	call   78 <runcmd>
 13f:	83 ec 0c             	sub    $0xc,%esp
 142:	8d 45 f0             	lea    -0x10(%ebp),%eax
 145:	50                   	push   %eax
 146:	e8 68 0a 00 00       	call   bb3 <pipe>
 14b:	83 c4 10             	add    $0x10,%esp
 14e:	85 c0                	test   %eax,%eax
 150:	78 3f                	js     191 <runcmd+0x119>
 152:	e8 02 ff ff ff       	call   59 <fork1>
 157:	85 c0                	test   %eax,%eax
 159:	75 43                	jne    19e <runcmd+0x126>
 15b:	83 ec 0c             	sub    $0xc,%esp
 15e:	6a 01                	push   $0x1
 160:	e8 66 0a 00 00       	call   bcb <close>
 165:	83 c4 04             	add    $0x4,%esp
 168:	ff 75 f4             	push   -0xc(%ebp)
 16b:	e8 ab 0a 00 00       	call   c1b <dup>
 170:	83 c4 04             	add    $0x4,%esp
 173:	ff 75 f0             	push   -0x10(%ebp)
 176:	e8 50 0a 00 00       	call   bcb <close>
 17b:	83 c4 04             	add    $0x4,%esp
 17e:	ff 75 f4             	push   -0xc(%ebp)
 181:	e8 45 0a 00 00       	call   bcb <close>
 186:	83 c4 04             	add    $0x4,%esp
 189:	ff 73 04             	push   0x4(%ebx)
 18c:	e8 e7 fe ff ff       	call   78 <runcmd>
 191:	83 ec 0c             	sub    $0xc,%esp
 194:	68 07 10 00 00       	push   $0x1007
 199:	e8 a1 fe ff ff       	call   3f <panic>
 19e:	e8 b6 fe ff ff       	call   59 <fork1>
 1a3:	85 c0                	test   %eax,%eax
 1a5:	75 36                	jne    1dd <runcmd+0x165>
 1a7:	83 ec 0c             	sub    $0xc,%esp
 1aa:	6a 00                	push   $0x0
 1ac:	e8 1a 0a 00 00       	call   bcb <close>
 1b1:	83 c4 04             	add    $0x4,%esp
 1b4:	ff 75 f0             	push   -0x10(%ebp)
 1b7:	e8 5f 0a 00 00       	call   c1b <dup>
 1bc:	83 c4 04             	add    $0x4,%esp
 1bf:	ff 75 f0             	push   -0x10(%ebp)
 1c2:	e8 04 0a 00 00       	call   bcb <close>
 1c7:	83 c4 04             	add    $0x4,%esp
 1ca:	ff 75 f4             	push   -0xc(%ebp)
 1cd:	e8 f9 09 00 00       	call   bcb <close>
 1d2:	83 c4 04             	add    $0x4,%esp
 1d5:	ff 73 08             	push   0x8(%ebx)
 1d8:	e8 9b fe ff ff       	call   78 <runcmd>
 1dd:	83 ec 0c             	sub    $0xc,%esp
 1e0:	ff 75 f0             	push   -0x10(%ebp)
 1e3:	e8 e3 09 00 00       	call   bcb <close>
 1e8:	83 c4 04             	add    $0x4,%esp
 1eb:	ff 75 f4             	push   -0xc(%ebp)
 1ee:	e8 d8 09 00 00       	call   bcb <close>
 1f3:	e8 b3 09 00 00       	call   bab <wait>
 1f8:	e8 ae 09 00 00       	call   bab <wait>
 1fd:	83 c4 10             	add    $0x10,%esp
 200:	e9 ca fe ff ff       	jmp    cf <runcmd+0x57>
 205:	e8 4f fe ff ff       	call   59 <fork1>
 20a:	85 c0                	test   %eax,%eax
 20c:	0f 85 bd fe ff ff    	jne    cf <runcmd+0x57>
 212:	83 ec 0c             	sub    $0xc,%esp
 215:	ff 73 04             	push   0x4(%ebx)
 218:	e8 5b fe ff ff       	call   78 <runcmd>

0000021d <execcmd>:
 21d:	55                   	push   %ebp
 21e:	89 e5                	mov    %esp,%ebp
 220:	53                   	push   %ebx
 221:	83 ec 10             	sub    $0x10,%esp
 224:	6a 54                	push   $0x54
 226:	e8 de 0c 00 00       	call   f09 <malloc>
 22b:	89 c3                	mov    %eax,%ebx
 22d:	83 c4 0c             	add    $0xc,%esp
 230:	6a 54                	push   $0x54
 232:	6a 00                	push   $0x0
 234:	50                   	push   %eax
 235:	e8 16 08 00 00       	call   a50 <memset>
 23a:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
 240:	89 d8                	mov    %ebx,%eax
 242:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 245:	c9                   	leave
 246:	c3                   	ret

00000247 <redircmd>:
 247:	55                   	push   %ebp
 248:	89 e5                	mov    %esp,%ebp
 24a:	53                   	push   %ebx
 24b:	83 ec 10             	sub    $0x10,%esp
 24e:	6a 18                	push   $0x18
 250:	e8 b4 0c 00 00       	call   f09 <malloc>
 255:	89 c3                	mov    %eax,%ebx
 257:	83 c4 0c             	add    $0xc,%esp
 25a:	6a 18                	push   $0x18
 25c:	6a 00                	push   $0x0
 25e:	50                   	push   %eax
 25f:	e8 ec 07 00 00       	call   a50 <memset>
 264:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
 26a:	8b 45 08             	mov    0x8(%ebp),%eax
 26d:	89 43 04             	mov    %eax,0x4(%ebx)
 270:	8b 45 0c             	mov    0xc(%ebp),%eax
 273:	89 43 08             	mov    %eax,0x8(%ebx)
 276:	8b 45 10             	mov    0x10(%ebp),%eax
 279:	89 43 0c             	mov    %eax,0xc(%ebx)
 27c:	8b 45 14             	mov    0x14(%ebp),%eax
 27f:	89 43 10             	mov    %eax,0x10(%ebx)
 282:	8b 45 18             	mov    0x18(%ebp),%eax
 285:	89 43 14             	mov    %eax,0x14(%ebx)
 288:	89 d8                	mov    %ebx,%eax
 28a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 28d:	c9                   	leave
 28e:	c3                   	ret

0000028f <pipecmd>:
 28f:	55                   	push   %ebp
 290:	89 e5                	mov    %esp,%ebp
 292:	53                   	push   %ebx
 293:	83 ec 10             	sub    $0x10,%esp
 296:	6a 0c                	push   $0xc
 298:	e8 6c 0c 00 00       	call   f09 <malloc>
 29d:	89 c3                	mov    %eax,%ebx
 29f:	83 c4 0c             	add    $0xc,%esp
 2a2:	6a 0c                	push   $0xc
 2a4:	6a 00                	push   $0x0
 2a6:	50                   	push   %eax
 2a7:	e8 a4 07 00 00       	call   a50 <memset>
 2ac:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
 2b2:	8b 45 08             	mov    0x8(%ebp),%eax
 2b5:	89 43 04             	mov    %eax,0x4(%ebx)
 2b8:	8b 45 0c             	mov    0xc(%ebp),%eax
 2bb:	89 43 08             	mov    %eax,0x8(%ebx)
 2be:	89 d8                	mov    %ebx,%eax
 2c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2c3:	c9                   	leave
 2c4:	c3                   	ret

000002c5 <listcmd>:
 2c5:	55                   	push   %ebp
 2c6:	89 e5                	mov    %esp,%ebp
 2c8:	53                   	push   %ebx
 2c9:	83 ec 10             	sub    $0x10,%esp
 2cc:	6a 0c                	push   $0xc
 2ce:	e8 36 0c 00 00       	call   f09 <malloc>
 2d3:	89 c3                	mov    %eax,%ebx
 2d5:	83 c4 0c             	add    $0xc,%esp
 2d8:	6a 0c                	push   $0xc
 2da:	6a 00                	push   $0x0
 2dc:	50                   	push   %eax
 2dd:	e8 6e 07 00 00       	call   a50 <memset>
 2e2:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
 2e8:	8b 45 08             	mov    0x8(%ebp),%eax
 2eb:	89 43 04             	mov    %eax,0x4(%ebx)
 2ee:	8b 45 0c             	mov    0xc(%ebp),%eax
 2f1:	89 43 08             	mov    %eax,0x8(%ebx)
 2f4:	89 d8                	mov    %ebx,%eax
 2f6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2f9:	c9                   	leave
 2fa:	c3                   	ret

000002fb <backcmd>:
 2fb:	55                   	push   %ebp
 2fc:	89 e5                	mov    %esp,%ebp
 2fe:	53                   	push   %ebx
 2ff:	83 ec 10             	sub    $0x10,%esp
 302:	6a 08                	push   $0x8
 304:	e8 00 0c 00 00       	call   f09 <malloc>
 309:	89 c3                	mov    %eax,%ebx
 30b:	83 c4 0c             	add    $0xc,%esp
 30e:	6a 08                	push   $0x8
 310:	6a 00                	push   $0x0
 312:	50                   	push   %eax
 313:	e8 38 07 00 00       	call   a50 <memset>
 318:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
 31e:	8b 45 08             	mov    0x8(%ebp),%eax
 321:	89 43 04             	mov    %eax,0x4(%ebx)
 324:	89 d8                	mov    %ebx,%eax
 326:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 329:	c9                   	leave
 32a:	c3                   	ret

0000032b <gettoken>:
 32b:	55                   	push   %ebp
 32c:	89 e5                	mov    %esp,%ebp
 32e:	57                   	push   %edi
 32f:	56                   	push   %esi
 330:	53                   	push   %ebx
 331:	83 ec 0c             	sub    $0xc,%esp
 334:	8b 75 0c             	mov    0xc(%ebp),%esi
 337:	8b 7d 10             	mov    0x10(%ebp),%edi
 33a:	8b 45 08             	mov    0x8(%ebp),%eax
 33d:	8b 18                	mov    (%eax),%ebx
 33f:	39 f3                	cmp    %esi,%ebx
 341:	73 21                	jae    364 <gettoken+0x39>
 343:	83 ec 08             	sub    $0x8,%esp
 346:	0f be 03             	movsbl (%ebx),%eax
 349:	50                   	push   %eax
 34a:	68 68 16 00 00       	push   $0x1668
 34f:	e8 15 07 00 00       	call   a69 <strchr>
 354:	83 c4 10             	add    $0x10,%esp
 357:	85 c0                	test   %eax,%eax
 359:	74 09                	je     364 <gettoken+0x39>
 35b:	83 c3 01             	add    $0x1,%ebx
 35e:	39 de                	cmp    %ebx,%esi
 360:	75 e1                	jne    343 <gettoken+0x18>
 362:	89 f3                	mov    %esi,%ebx
 364:	85 ff                	test   %edi,%edi
 366:	74 02                	je     36a <gettoken+0x3f>
 368:	89 1f                	mov    %ebx,(%edi)
 36a:	0f b6 03             	movzbl (%ebx),%eax
 36d:	0f be f8             	movsbl %al,%edi
 370:	3c 3c                	cmp    $0x3c,%al
 372:	7f 57                	jg     3cb <gettoken+0xa0>
 374:	3c 3a                	cmp    $0x3a,%al
 376:	7f 11                	jg     389 <gettoken+0x5e>
 378:	84 c0                	test   %al,%al
 37a:	74 10                	je     38c <gettoken+0x61>
 37c:	78 67                	js     3e5 <gettoken+0xba>
 37e:	3c 26                	cmp    $0x26,%al
 380:	74 07                	je     389 <gettoken+0x5e>
 382:	83 e8 28             	sub    $0x28,%eax
 385:	3c 01                	cmp    $0x1,%al
 387:	77 5c                	ja     3e5 <gettoken+0xba>
 389:	83 c3 01             	add    $0x1,%ebx
 38c:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 390:	74 05                	je     397 <gettoken+0x6c>
 392:	8b 45 14             	mov    0x14(%ebp),%eax
 395:	89 18                	mov    %ebx,(%eax)
 397:	39 f3                	cmp    %esi,%ebx
 399:	73 21                	jae    3bc <gettoken+0x91>
 39b:	83 ec 08             	sub    $0x8,%esp
 39e:	0f be 03             	movsbl (%ebx),%eax
 3a1:	50                   	push   %eax
 3a2:	68 68 16 00 00       	push   $0x1668
 3a7:	e8 bd 06 00 00       	call   a69 <strchr>
 3ac:	83 c4 10             	add    $0x10,%esp
 3af:	85 c0                	test   %eax,%eax
 3b1:	74 09                	je     3bc <gettoken+0x91>
 3b3:	83 c3 01             	add    $0x1,%ebx
 3b6:	39 de                	cmp    %ebx,%esi
 3b8:	75 e1                	jne    39b <gettoken+0x70>
 3ba:	89 f3                	mov    %esi,%ebx
 3bc:	8b 45 08             	mov    0x8(%ebp),%eax
 3bf:	89 18                	mov    %ebx,(%eax)
 3c1:	89 f8                	mov    %edi,%eax
 3c3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3c6:	5b                   	pop    %ebx
 3c7:	5e                   	pop    %esi
 3c8:	5f                   	pop    %edi
 3c9:	5d                   	pop    %ebp
 3ca:	c3                   	ret
 3cb:	3c 3e                	cmp    $0x3e,%al
 3cd:	75 12                	jne    3e1 <gettoken+0xb6>
 3cf:	8d 43 01             	lea    0x1(%ebx),%eax
 3d2:	80 7b 01 3e          	cmpb   $0x3e,0x1(%ebx)
 3d6:	74 5b                	je     433 <gettoken+0x108>
 3d8:	89 c3                	mov    %eax,%ebx
 3da:	bf 3e 00 00 00       	mov    $0x3e,%edi
 3df:	eb ab                	jmp    38c <gettoken+0x61>
 3e1:	3c 7c                	cmp    $0x7c,%al
 3e3:	74 a4                	je     389 <gettoken+0x5e>
 3e5:	39 f3                	cmp    %esi,%ebx
 3e7:	73 6b                	jae    454 <gettoken+0x129>
 3e9:	83 ec 08             	sub    $0x8,%esp
 3ec:	0f be 03             	movsbl (%ebx),%eax
 3ef:	50                   	push   %eax
 3f0:	68 68 16 00 00       	push   $0x1668
 3f5:	e8 6f 06 00 00       	call   a69 <strchr>
 3fa:	83 c4 10             	add    $0x10,%esp
 3fd:	85 c0                	test   %eax,%eax
 3ff:	75 49                	jne    44a <gettoken+0x11f>
 401:	83 ec 08             	sub    $0x8,%esp
 404:	0f be 03             	movsbl (%ebx),%eax
 407:	50                   	push   %eax
 408:	68 60 16 00 00       	push   $0x1660
 40d:	e8 57 06 00 00       	call   a69 <strchr>
 412:	83 c4 10             	add    $0x10,%esp
 415:	85 c0                	test   %eax,%eax
 417:	75 27                	jne    440 <gettoken+0x115>
 419:	83 c3 01             	add    $0x1,%ebx
 41c:	39 de                	cmp    %ebx,%esi
 41e:	75 c9                	jne    3e9 <gettoken+0xbe>
 420:	89 f3                	mov    %esi,%ebx
 422:	bf 61 00 00 00       	mov    $0x61,%edi
 427:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 42b:	0f 85 61 ff ff ff    	jne    392 <gettoken+0x67>
 431:	eb 89                	jmp    3bc <gettoken+0x91>
 433:	83 c3 02             	add    $0x2,%ebx
 436:	bf 2b 00 00 00       	mov    $0x2b,%edi
 43b:	e9 4c ff ff ff       	jmp    38c <gettoken+0x61>
 440:	bf 61 00 00 00       	mov    $0x61,%edi
 445:	e9 42 ff ff ff       	jmp    38c <gettoken+0x61>
 44a:	bf 61 00 00 00       	mov    $0x61,%edi
 44f:	e9 38 ff ff ff       	jmp    38c <gettoken+0x61>
 454:	bf 61 00 00 00       	mov    $0x61,%edi
 459:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 45d:	0f 85 2f ff ff ff    	jne    392 <gettoken+0x67>
 463:	e9 54 ff ff ff       	jmp    3bc <gettoken+0x91>

00000468 <peek>:
 468:	55                   	push   %ebp
 469:	89 e5                	mov    %esp,%ebp
 46b:	57                   	push   %edi
 46c:	56                   	push   %esi
 46d:	53                   	push   %ebx
 46e:	83 ec 0c             	sub    $0xc,%esp
 471:	8b 7d 08             	mov    0x8(%ebp),%edi
 474:	8b 75 0c             	mov    0xc(%ebp),%esi
 477:	8b 1f                	mov    (%edi),%ebx
 479:	39 f3                	cmp    %esi,%ebx
 47b:	73 21                	jae    49e <peek+0x36>
 47d:	83 ec 08             	sub    $0x8,%esp
 480:	0f be 03             	movsbl (%ebx),%eax
 483:	50                   	push   %eax
 484:	68 68 16 00 00       	push   $0x1668
 489:	e8 db 05 00 00       	call   a69 <strchr>
 48e:	83 c4 10             	add    $0x10,%esp
 491:	85 c0                	test   %eax,%eax
 493:	74 09                	je     49e <peek+0x36>
 495:	83 c3 01             	add    $0x1,%ebx
 498:	39 de                	cmp    %ebx,%esi
 49a:	75 e1                	jne    47d <peek+0x15>
 49c:	89 f3                	mov    %esi,%ebx
 49e:	89 1f                	mov    %ebx,(%edi)
 4a0:	0f b6 03             	movzbl (%ebx),%eax
 4a3:	ba 00 00 00 00       	mov    $0x0,%edx
 4a8:	84 c0                	test   %al,%al
 4aa:	75 0a                	jne    4b6 <peek+0x4e>
 4ac:	89 d0                	mov    %edx,%eax
 4ae:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4b1:	5b                   	pop    %ebx
 4b2:	5e                   	pop    %esi
 4b3:	5f                   	pop    %edi
 4b4:	5d                   	pop    %ebp
 4b5:	c3                   	ret
 4b6:	83 ec 08             	sub    $0x8,%esp
 4b9:	0f be c0             	movsbl %al,%eax
 4bc:	50                   	push   %eax
 4bd:	ff 75 10             	push   0x10(%ebp)
 4c0:	e8 a4 05 00 00       	call   a69 <strchr>
 4c5:	83 c4 10             	add    $0x10,%esp
 4c8:	85 c0                	test   %eax,%eax
 4ca:	0f 95 c2             	setne  %dl
 4cd:	0f b6 d2             	movzbl %dl,%edx
 4d0:	eb da                	jmp    4ac <peek+0x44>

000004d2 <parseredirs>:
 4d2:	55                   	push   %ebp
 4d3:	89 e5                	mov    %esp,%ebp
 4d5:	57                   	push   %edi
 4d6:	56                   	push   %esi
 4d7:	53                   	push   %ebx
 4d8:	83 ec 1c             	sub    $0x1c,%esp
 4db:	8b 75 0c             	mov    0xc(%ebp),%esi
 4de:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4e1:	89 df                	mov    %ebx,%edi
 4e3:	eb 28                	jmp    50d <parseredirs+0x3b>
 4e5:	83 ec 0c             	sub    $0xc,%esp
 4e8:	68 0c 10 00 00       	push   $0x100c
 4ed:	e8 4d fb ff ff       	call   3f <panic>
 4f2:	83 ec 0c             	sub    $0xc,%esp
 4f5:	6a 00                	push   $0x0
 4f7:	6a 00                	push   $0x0
 4f9:	ff 75 e0             	push   -0x20(%ebp)
 4fc:	ff 75 e4             	push   -0x1c(%ebp)
 4ff:	ff 75 08             	push   0x8(%ebp)
 502:	e8 40 fd ff ff       	call   247 <redircmd>
 507:	89 45 08             	mov    %eax,0x8(%ebp)
 50a:	83 c4 20             	add    $0x20,%esp
 50d:	83 ec 04             	sub    $0x4,%esp
 510:	68 29 10 00 00       	push   $0x1029
 515:	57                   	push   %edi
 516:	56                   	push   %esi
 517:	e8 4c ff ff ff       	call   468 <peek>
 51c:	83 c4 10             	add    $0x10,%esp
 51f:	85 c0                	test   %eax,%eax
 521:	74 76                	je     599 <parseredirs+0xc7>
 523:	6a 00                	push   $0x0
 525:	6a 00                	push   $0x0
 527:	57                   	push   %edi
 528:	56                   	push   %esi
 529:	e8 fd fd ff ff       	call   32b <gettoken>
 52e:	89 c3                	mov    %eax,%ebx
 530:	8d 45 e0             	lea    -0x20(%ebp),%eax
 533:	50                   	push   %eax
 534:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 537:	50                   	push   %eax
 538:	57                   	push   %edi
 539:	56                   	push   %esi
 53a:	e8 ec fd ff ff       	call   32b <gettoken>
 53f:	83 c4 20             	add    $0x20,%esp
 542:	83 f8 61             	cmp    $0x61,%eax
 545:	75 9e                	jne    4e5 <parseredirs+0x13>
 547:	83 fb 3c             	cmp    $0x3c,%ebx
 54a:	74 a6                	je     4f2 <parseredirs+0x20>
 54c:	83 fb 3e             	cmp    $0x3e,%ebx
 54f:	74 25                	je     576 <parseredirs+0xa4>
 551:	83 fb 2b             	cmp    $0x2b,%ebx
 554:	75 b7                	jne    50d <parseredirs+0x3b>
 556:	83 ec 0c             	sub    $0xc,%esp
 559:	6a 01                	push   $0x1
 55b:	68 01 02 00 00       	push   $0x201
 560:	ff 75 e0             	push   -0x20(%ebp)
 563:	ff 75 e4             	push   -0x1c(%ebp)
 566:	ff 75 08             	push   0x8(%ebp)
 569:	e8 d9 fc ff ff       	call   247 <redircmd>
 56e:	89 45 08             	mov    %eax,0x8(%ebp)
 571:	83 c4 20             	add    $0x20,%esp
 574:	eb 97                	jmp    50d <parseredirs+0x3b>
 576:	83 ec 0c             	sub    $0xc,%esp
 579:	6a 01                	push   $0x1
 57b:	68 01 02 00 00       	push   $0x201
 580:	ff 75 e0             	push   -0x20(%ebp)
 583:	ff 75 e4             	push   -0x1c(%ebp)
 586:	ff 75 08             	push   0x8(%ebp)
 589:	e8 b9 fc ff ff       	call   247 <redircmd>
 58e:	89 45 08             	mov    %eax,0x8(%ebp)
 591:	83 c4 20             	add    $0x20,%esp
 594:	e9 74 ff ff ff       	jmp    50d <parseredirs+0x3b>
 599:	8b 7d 08             	mov    0x8(%ebp),%edi
 59c:	89 f8                	mov    %edi,%eax
 59e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5a1:	5b                   	pop    %ebx
 5a2:	5e                   	pop    %esi
 5a3:	5f                   	pop    %edi
 5a4:	5d                   	pop    %ebp
 5a5:	c3                   	ret

000005a6 <parseexec>:
 5a6:	55                   	push   %ebp
 5a7:	89 e5                	mov    %esp,%ebp
 5a9:	57                   	push   %edi
 5aa:	56                   	push   %esi
 5ab:	53                   	push   %ebx
 5ac:	83 ec 30             	sub    $0x30,%esp
 5af:	8b 75 08             	mov    0x8(%ebp),%esi
 5b2:	8b 7d 0c             	mov    0xc(%ebp),%edi
 5b5:	68 2c 10 00 00       	push   $0x102c
 5ba:	57                   	push   %edi
 5bb:	56                   	push   %esi
 5bc:	e8 a7 fe ff ff       	call   468 <peek>
 5c1:	83 c4 10             	add    $0x10,%esp
 5c4:	85 c0                	test   %eax,%eax
 5c6:	75 1d                	jne    5e5 <parseexec+0x3f>
 5c8:	89 c3                	mov    %eax,%ebx
 5ca:	e8 4e fc ff ff       	call   21d <execcmd>
 5cf:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5d2:	83 ec 04             	sub    $0x4,%esp
 5d5:	57                   	push   %edi
 5d6:	56                   	push   %esi
 5d7:	50                   	push   %eax
 5d8:	e8 f5 fe ff ff       	call   4d2 <parseredirs>
 5dd:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 5e0:	83 c4 10             	add    $0x10,%esp
 5e3:	eb 3b                	jmp    620 <parseexec+0x7a>
 5e5:	83 ec 08             	sub    $0x8,%esp
 5e8:	57                   	push   %edi
 5e9:	56                   	push   %esi
 5ea:	e8 8f 01 00 00       	call   77e <parseblock>
 5ef:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 5f2:	83 c4 10             	add    $0x10,%esp
 5f5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 5f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5fb:	5b                   	pop    %ebx
 5fc:	5e                   	pop    %esi
 5fd:	5f                   	pop    %edi
 5fe:	5d                   	pop    %ebp
 5ff:	c3                   	ret
 600:	83 ec 0c             	sub    $0xc,%esp
 603:	68 2e 10 00 00       	push   $0x102e
 608:	e8 32 fa ff ff       	call   3f <panic>
 60d:	83 ec 04             	sub    $0x4,%esp
 610:	57                   	push   %edi
 611:	56                   	push   %esi
 612:	ff 75 d4             	push   -0x2c(%ebp)
 615:	e8 b8 fe ff ff       	call   4d2 <parseredirs>
 61a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 61d:	83 c4 10             	add    $0x10,%esp
 620:	83 ec 04             	sub    $0x4,%esp
 623:	68 43 10 00 00       	push   $0x1043
 628:	57                   	push   %edi
 629:	56                   	push   %esi
 62a:	e8 39 fe ff ff       	call   468 <peek>
 62f:	83 c4 10             	add    $0x10,%esp
 632:	85 c0                	test   %eax,%eax
 634:	75 41                	jne    677 <parseexec+0xd1>
 636:	8d 45 e0             	lea    -0x20(%ebp),%eax
 639:	50                   	push   %eax
 63a:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 63d:	50                   	push   %eax
 63e:	57                   	push   %edi
 63f:	56                   	push   %esi
 640:	e8 e6 fc ff ff       	call   32b <gettoken>
 645:	83 c4 10             	add    $0x10,%esp
 648:	85 c0                	test   %eax,%eax
 64a:	74 2b                	je     677 <parseexec+0xd1>
 64c:	83 f8 61             	cmp    $0x61,%eax
 64f:	75 af                	jne    600 <parseexec+0x5a>
 651:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 654:	8b 55 d0             	mov    -0x30(%ebp),%edx
 657:	89 44 9a 04          	mov    %eax,0x4(%edx,%ebx,4)
 65b:	8b 45 e0             	mov    -0x20(%ebp),%eax
 65e:	89 44 9a 2c          	mov    %eax,0x2c(%edx,%ebx,4)
 662:	83 c3 01             	add    $0x1,%ebx
 665:	83 fb 0a             	cmp    $0xa,%ebx
 668:	75 a3                	jne    60d <parseexec+0x67>
 66a:	83 ec 0c             	sub    $0xc,%esp
 66d:	68 35 10 00 00       	push   $0x1035
 672:	e8 c8 f9 ff ff       	call   3f <panic>
 677:	8b 45 d0             	mov    -0x30(%ebp),%eax
 67a:	c7 44 98 04 00 00 00 	movl   $0x0,0x4(%eax,%ebx,4)
 681:	00 
 682:	c7 44 98 2c 00 00 00 	movl   $0x0,0x2c(%eax,%ebx,4)
 689:	00 
 68a:	e9 66 ff ff ff       	jmp    5f5 <parseexec+0x4f>

0000068f <parsepipe>:
 68f:	55                   	push   %ebp
 690:	89 e5                	mov    %esp,%ebp
 692:	57                   	push   %edi
 693:	56                   	push   %esi
 694:	53                   	push   %ebx
 695:	83 ec 14             	sub    $0x14,%esp
 698:	8b 75 08             	mov    0x8(%ebp),%esi
 69b:	8b 7d 0c             	mov    0xc(%ebp),%edi
 69e:	57                   	push   %edi
 69f:	56                   	push   %esi
 6a0:	e8 01 ff ff ff       	call   5a6 <parseexec>
 6a5:	89 c3                	mov    %eax,%ebx
 6a7:	83 c4 0c             	add    $0xc,%esp
 6aa:	68 48 10 00 00       	push   $0x1048
 6af:	57                   	push   %edi
 6b0:	56                   	push   %esi
 6b1:	e8 b2 fd ff ff       	call   468 <peek>
 6b6:	83 c4 10             	add    $0x10,%esp
 6b9:	85 c0                	test   %eax,%eax
 6bb:	75 0a                	jne    6c7 <parsepipe+0x38>
 6bd:	89 d8                	mov    %ebx,%eax
 6bf:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6c2:	5b                   	pop    %ebx
 6c3:	5e                   	pop    %esi
 6c4:	5f                   	pop    %edi
 6c5:	5d                   	pop    %ebp
 6c6:	c3                   	ret
 6c7:	6a 00                	push   $0x0
 6c9:	6a 00                	push   $0x0
 6cb:	57                   	push   %edi
 6cc:	56                   	push   %esi
 6cd:	e8 59 fc ff ff       	call   32b <gettoken>
 6d2:	83 c4 08             	add    $0x8,%esp
 6d5:	57                   	push   %edi
 6d6:	56                   	push   %esi
 6d7:	e8 b3 ff ff ff       	call   68f <parsepipe>
 6dc:	83 c4 08             	add    $0x8,%esp
 6df:	50                   	push   %eax
 6e0:	53                   	push   %ebx
 6e1:	e8 a9 fb ff ff       	call   28f <pipecmd>
 6e6:	89 c3                	mov    %eax,%ebx
 6e8:	83 c4 10             	add    $0x10,%esp
 6eb:	eb d0                	jmp    6bd <parsepipe+0x2e>

000006ed <parseline>:
 6ed:	55                   	push   %ebp
 6ee:	89 e5                	mov    %esp,%ebp
 6f0:	57                   	push   %edi
 6f1:	56                   	push   %esi
 6f2:	53                   	push   %ebx
 6f3:	83 ec 14             	sub    $0x14,%esp
 6f6:	8b 75 08             	mov    0x8(%ebp),%esi
 6f9:	8b 7d 0c             	mov    0xc(%ebp),%edi
 6fc:	57                   	push   %edi
 6fd:	56                   	push   %esi
 6fe:	e8 8c ff ff ff       	call   68f <parsepipe>
 703:	89 c3                	mov    %eax,%ebx
 705:	83 c4 10             	add    $0x10,%esp
 708:	eb 18                	jmp    722 <parseline+0x35>
 70a:	6a 00                	push   $0x0
 70c:	6a 00                	push   $0x0
 70e:	57                   	push   %edi
 70f:	56                   	push   %esi
 710:	e8 16 fc ff ff       	call   32b <gettoken>
 715:	89 1c 24             	mov    %ebx,(%esp)
 718:	e8 de fb ff ff       	call   2fb <backcmd>
 71d:	89 c3                	mov    %eax,%ebx
 71f:	83 c4 10             	add    $0x10,%esp
 722:	83 ec 04             	sub    $0x4,%esp
 725:	68 4a 10 00 00       	push   $0x104a
 72a:	57                   	push   %edi
 72b:	56                   	push   %esi
 72c:	e8 37 fd ff ff       	call   468 <peek>
 731:	83 c4 10             	add    $0x10,%esp
 734:	85 c0                	test   %eax,%eax
 736:	75 d2                	jne    70a <parseline+0x1d>
 738:	83 ec 04             	sub    $0x4,%esp
 73b:	68 46 10 00 00       	push   $0x1046
 740:	57                   	push   %edi
 741:	56                   	push   %esi
 742:	e8 21 fd ff ff       	call   468 <peek>
 747:	83 c4 10             	add    $0x10,%esp
 74a:	85 c0                	test   %eax,%eax
 74c:	75 0a                	jne    758 <parseline+0x6b>
 74e:	89 d8                	mov    %ebx,%eax
 750:	8d 65 f4             	lea    -0xc(%ebp),%esp
 753:	5b                   	pop    %ebx
 754:	5e                   	pop    %esi
 755:	5f                   	pop    %edi
 756:	5d                   	pop    %ebp
 757:	c3                   	ret
 758:	6a 00                	push   $0x0
 75a:	6a 00                	push   $0x0
 75c:	57                   	push   %edi
 75d:	56                   	push   %esi
 75e:	e8 c8 fb ff ff       	call   32b <gettoken>
 763:	83 c4 08             	add    $0x8,%esp
 766:	57                   	push   %edi
 767:	56                   	push   %esi
 768:	e8 80 ff ff ff       	call   6ed <parseline>
 76d:	83 c4 08             	add    $0x8,%esp
 770:	50                   	push   %eax
 771:	53                   	push   %ebx
 772:	e8 4e fb ff ff       	call   2c5 <listcmd>
 777:	89 c3                	mov    %eax,%ebx
 779:	83 c4 10             	add    $0x10,%esp
 77c:	eb d0                	jmp    74e <parseline+0x61>

0000077e <parseblock>:
 77e:	55                   	push   %ebp
 77f:	89 e5                	mov    %esp,%ebp
 781:	57                   	push   %edi
 782:	56                   	push   %esi
 783:	53                   	push   %ebx
 784:	83 ec 10             	sub    $0x10,%esp
 787:	8b 5d 08             	mov    0x8(%ebp),%ebx
 78a:	8b 75 0c             	mov    0xc(%ebp),%esi
 78d:	68 2c 10 00 00       	push   $0x102c
 792:	56                   	push   %esi
 793:	53                   	push   %ebx
 794:	e8 cf fc ff ff       	call   468 <peek>
 799:	83 c4 10             	add    $0x10,%esp
 79c:	85 c0                	test   %eax,%eax
 79e:	74 4b                	je     7eb <parseblock+0x6d>
 7a0:	6a 00                	push   $0x0
 7a2:	6a 00                	push   $0x0
 7a4:	56                   	push   %esi
 7a5:	53                   	push   %ebx
 7a6:	e8 80 fb ff ff       	call   32b <gettoken>
 7ab:	83 c4 08             	add    $0x8,%esp
 7ae:	56                   	push   %esi
 7af:	53                   	push   %ebx
 7b0:	e8 38 ff ff ff       	call   6ed <parseline>
 7b5:	89 c7                	mov    %eax,%edi
 7b7:	83 c4 0c             	add    $0xc,%esp
 7ba:	68 68 10 00 00       	push   $0x1068
 7bf:	56                   	push   %esi
 7c0:	53                   	push   %ebx
 7c1:	e8 a2 fc ff ff       	call   468 <peek>
 7c6:	83 c4 10             	add    $0x10,%esp
 7c9:	85 c0                	test   %eax,%eax
 7cb:	74 2b                	je     7f8 <parseblock+0x7a>
 7cd:	6a 00                	push   $0x0
 7cf:	6a 00                	push   $0x0
 7d1:	56                   	push   %esi
 7d2:	53                   	push   %ebx
 7d3:	e8 53 fb ff ff       	call   32b <gettoken>
 7d8:	83 c4 0c             	add    $0xc,%esp
 7db:	56                   	push   %esi
 7dc:	53                   	push   %ebx
 7dd:	57                   	push   %edi
 7de:	e8 ef fc ff ff       	call   4d2 <parseredirs>
 7e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7e6:	5b                   	pop    %ebx
 7e7:	5e                   	pop    %esi
 7e8:	5f                   	pop    %edi
 7e9:	5d                   	pop    %ebp
 7ea:	c3                   	ret
 7eb:	83 ec 0c             	sub    $0xc,%esp
 7ee:	68 4c 10 00 00       	push   $0x104c
 7f3:	e8 47 f8 ff ff       	call   3f <panic>
 7f8:	83 ec 0c             	sub    $0xc,%esp
 7fb:	68 57 10 00 00       	push   $0x1057
 800:	e8 3a f8 ff ff       	call   3f <panic>

00000805 <nulterminate>:
 805:	55                   	push   %ebp
 806:	89 e5                	mov    %esp,%ebp
 808:	53                   	push   %ebx
 809:	83 ec 04             	sub    $0x4,%esp
 80c:	8b 5d 08             	mov    0x8(%ebp),%ebx
 80f:	85 db                	test   %ebx,%ebx
 811:	74 3c                	je     84f <nulterminate+0x4a>
 813:	83 3b 05             	cmpl   $0x5,(%ebx)
 816:	77 37                	ja     84f <nulterminate+0x4a>
 818:	8b 03                	mov    (%ebx),%eax
 81a:	ff 24 85 b0 10 00 00 	jmp    *0x10b0(,%eax,4)
 821:	83 7b 04 00          	cmpl   $0x0,0x4(%ebx)
 825:	74 28                	je     84f <nulterminate+0x4a>
 827:	8d 43 08             	lea    0x8(%ebx),%eax
 82a:	8b 50 24             	mov    0x24(%eax),%edx
 82d:	c6 02 00             	movb   $0x0,(%edx)
 830:	83 c0 04             	add    $0x4,%eax
 833:	83 78 fc 00          	cmpl   $0x0,-0x4(%eax)
 837:	75 f1                	jne    82a <nulterminate+0x25>
 839:	eb 14                	jmp    84f <nulterminate+0x4a>
 83b:	83 ec 0c             	sub    $0xc,%esp
 83e:	ff 73 04             	push   0x4(%ebx)
 841:	e8 bf ff ff ff       	call   805 <nulterminate>
 846:	8b 43 0c             	mov    0xc(%ebx),%eax
 849:	c6 00 00             	movb   $0x0,(%eax)
 84c:	83 c4 10             	add    $0x10,%esp
 84f:	89 d8                	mov    %ebx,%eax
 851:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 854:	c9                   	leave
 855:	c3                   	ret
 856:	83 ec 0c             	sub    $0xc,%esp
 859:	ff 73 04             	push   0x4(%ebx)
 85c:	e8 a4 ff ff ff       	call   805 <nulterminate>
 861:	83 c4 04             	add    $0x4,%esp
 864:	ff 73 08             	push   0x8(%ebx)
 867:	e8 99 ff ff ff       	call   805 <nulterminate>
 86c:	83 c4 10             	add    $0x10,%esp
 86f:	eb de                	jmp    84f <nulterminate+0x4a>
 871:	83 ec 0c             	sub    $0xc,%esp
 874:	ff 73 04             	push   0x4(%ebx)
 877:	e8 89 ff ff ff       	call   805 <nulterminate>
 87c:	83 c4 04             	add    $0x4,%esp
 87f:	ff 73 08             	push   0x8(%ebx)
 882:	e8 7e ff ff ff       	call   805 <nulterminate>
 887:	83 c4 10             	add    $0x10,%esp
 88a:	eb c3                	jmp    84f <nulterminate+0x4a>
 88c:	83 ec 0c             	sub    $0xc,%esp
 88f:	ff 73 04             	push   0x4(%ebx)
 892:	e8 6e ff ff ff       	call   805 <nulterminate>
 897:	83 c4 10             	add    $0x10,%esp
 89a:	eb b3                	jmp    84f <nulterminate+0x4a>

0000089c <parsecmd>:
 89c:	55                   	push   %ebp
 89d:	89 e5                	mov    %esp,%ebp
 89f:	56                   	push   %esi
 8a0:	53                   	push   %ebx
 8a1:	8b 5d 08             	mov    0x8(%ebp),%ebx
 8a4:	83 ec 0c             	sub    $0xc,%esp
 8a7:	53                   	push   %ebx
 8a8:	e8 7d 01 00 00       	call   a2a <strlen>
 8ad:	01 c3                	add    %eax,%ebx
 8af:	83 c4 08             	add    $0x8,%esp
 8b2:	53                   	push   %ebx
 8b3:	8d 45 08             	lea    0x8(%ebp),%eax
 8b6:	50                   	push   %eax
 8b7:	e8 31 fe ff ff       	call   6ed <parseline>
 8bc:	89 c6                	mov    %eax,%esi
 8be:	83 c4 0c             	add    $0xc,%esp
 8c1:	68 f6 0f 00 00       	push   $0xff6
 8c6:	53                   	push   %ebx
 8c7:	8d 45 08             	lea    0x8(%ebp),%eax
 8ca:	50                   	push   %eax
 8cb:	e8 98 fb ff ff       	call   468 <peek>
 8d0:	8b 45 08             	mov    0x8(%ebp),%eax
 8d3:	83 c4 10             	add    $0x10,%esp
 8d6:	39 d8                	cmp    %ebx,%eax
 8d8:	75 12                	jne    8ec <parsecmd+0x50>
 8da:	83 ec 0c             	sub    $0xc,%esp
 8dd:	56                   	push   %esi
 8de:	e8 22 ff ff ff       	call   805 <nulterminate>
 8e3:	89 f0                	mov    %esi,%eax
 8e5:	8d 65 f8             	lea    -0x8(%ebp),%esp
 8e8:	5b                   	pop    %ebx
 8e9:	5e                   	pop    %esi
 8ea:	5d                   	pop    %ebp
 8eb:	c3                   	ret
 8ec:	83 ec 04             	sub    $0x4,%esp
 8ef:	50                   	push   %eax
 8f0:	68 6a 10 00 00       	push   $0x106a
 8f5:	6a 02                	push   $0x2
 8f7:	e8 e7 03 00 00       	call   ce3 <printf>
 8fc:	c7 04 24 2e 10 00 00 	movl   $0x102e,(%esp)
 903:	e8 37 f7 ff ff       	call   3f <panic>

00000908 <main>:
 908:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 90c:	83 e4 f0             	and    $0xfffffff0,%esp
 90f:	ff 71 fc             	push   -0x4(%ecx)
 912:	55                   	push   %ebp
 913:	89 e5                	mov    %esp,%ebp
 915:	51                   	push   %ecx
 916:	83 ec 04             	sub    $0x4,%esp
 919:	83 ec 08             	sub    $0x8,%esp
 91c:	6a 02                	push   $0x2
 91e:	68 79 10 00 00       	push   $0x1079
 923:	e8 bb 02 00 00       	call   be3 <open>
 928:	83 c4 10             	add    $0x10,%esp
 92b:	85 c0                	test   %eax,%eax
 92d:	78 21                	js     950 <main+0x48>
 92f:	83 f8 02             	cmp    $0x2,%eax
 932:	7e e5                	jle    919 <main+0x11>
 934:	83 ec 0c             	sub    $0xc,%esp
 937:	50                   	push   %eax
 938:	e8 8e 02 00 00       	call   bcb <close>
 93d:	83 c4 10             	add    $0x10,%esp
 940:	eb 0e                	jmp    950 <main+0x48>
 942:	e8 12 f7 ff ff       	call   59 <fork1>
 947:	85 c0                	test   %eax,%eax
 949:	74 76                	je     9c1 <main+0xb9>
 94b:	e8 5b 02 00 00       	call   bab <wait>
 950:	83 ec 08             	sub    $0x8,%esp
 953:	6a 64                	push   $0x64
 955:	68 80 16 00 00       	push   $0x1680
 95a:	e8 a1 f6 ff ff       	call   0 <getcmd>
 95f:	83 c4 10             	add    $0x10,%esp
 962:	85 c0                	test   %eax,%eax
 964:	78 70                	js     9d6 <main+0xce>
 966:	80 3d 80 16 00 00 63 	cmpb   $0x63,0x1680
 96d:	75 d3                	jne    942 <main+0x3a>
 96f:	80 3d 81 16 00 00 64 	cmpb   $0x64,0x1681
 976:	75 ca                	jne    942 <main+0x3a>
 978:	80 3d 82 16 00 00 20 	cmpb   $0x20,0x1682
 97f:	75 c1                	jne    942 <main+0x3a>
 981:	83 ec 0c             	sub    $0xc,%esp
 984:	68 80 16 00 00       	push   $0x1680
 989:	e8 9c 00 00 00       	call   a2a <strlen>
 98e:	c6 80 7f 16 00 00 00 	movb   $0x0,0x167f(%eax)
 995:	c7 04 24 83 16 00 00 	movl   $0x1683,(%esp)
 99c:	e8 72 02 00 00       	call   c13 <chdir>
 9a1:	83 c4 10             	add    $0x10,%esp
 9a4:	85 c0                	test   %eax,%eax
 9a6:	79 a8                	jns    950 <main+0x48>
 9a8:	83 ec 04             	sub    $0x4,%esp
 9ab:	68 83 16 00 00       	push   $0x1683
 9b0:	68 81 10 00 00       	push   $0x1081
 9b5:	6a 02                	push   $0x2
 9b7:	e8 27 03 00 00       	call   ce3 <printf>
 9bc:	83 c4 10             	add    $0x10,%esp
 9bf:	eb 8f                	jmp    950 <main+0x48>
 9c1:	83 ec 0c             	sub    $0xc,%esp
 9c4:	68 80 16 00 00       	push   $0x1680
 9c9:	e8 ce fe ff ff       	call   89c <parsecmd>
 9ce:	89 04 24             	mov    %eax,(%esp)
 9d1:	e8 a2 f6 ff ff       	call   78 <runcmd>
 9d6:	e8 c8 01 00 00       	call   ba3 <exit>

000009db <strcpy>:
 9db:	55                   	push   %ebp
 9dc:	89 e5                	mov    %esp,%ebp
 9de:	53                   	push   %ebx
 9df:	8b 4d 08             	mov    0x8(%ebp),%ecx
 9e2:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 9e5:	b8 00 00 00 00       	mov    $0x0,%eax
 9ea:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 9ee:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 9f1:	83 c0 01             	add    $0x1,%eax
 9f4:	84 d2                	test   %dl,%dl
 9f6:	75 f2                	jne    9ea <strcpy+0xf>
 9f8:	89 c8                	mov    %ecx,%eax
 9fa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 9fd:	c9                   	leave
 9fe:	c3                   	ret

000009ff <strcmp>:
 9ff:	55                   	push   %ebp
 a00:	89 e5                	mov    %esp,%ebp
 a02:	8b 4d 08             	mov    0x8(%ebp),%ecx
 a05:	8b 55 0c             	mov    0xc(%ebp),%edx
 a08:	0f b6 01             	movzbl (%ecx),%eax
 a0b:	84 c0                	test   %al,%al
 a0d:	74 11                	je     a20 <strcmp+0x21>
 a0f:	38 02                	cmp    %al,(%edx)
 a11:	75 0d                	jne    a20 <strcmp+0x21>
 a13:	83 c1 01             	add    $0x1,%ecx
 a16:	83 c2 01             	add    $0x1,%edx
 a19:	0f b6 01             	movzbl (%ecx),%eax
 a1c:	84 c0                	test   %al,%al
 a1e:	75 ef                	jne    a0f <strcmp+0x10>
 a20:	0f b6 c0             	movzbl %al,%eax
 a23:	0f b6 12             	movzbl (%edx),%edx
 a26:	29 d0                	sub    %edx,%eax
 a28:	5d                   	pop    %ebp
 a29:	c3                   	ret

00000a2a <strlen>:
 a2a:	55                   	push   %ebp
 a2b:	89 e5                	mov    %esp,%ebp
 a2d:	8b 55 08             	mov    0x8(%ebp),%edx
 a30:	80 3a 00             	cmpb   $0x0,(%edx)
 a33:	74 14                	je     a49 <strlen+0x1f>
 a35:	b8 00 00 00 00       	mov    $0x0,%eax
 a3a:	83 c0 01             	add    $0x1,%eax
 a3d:	89 c1                	mov    %eax,%ecx
 a3f:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 a43:	75 f5                	jne    a3a <strlen+0x10>
 a45:	89 c8                	mov    %ecx,%eax
 a47:	5d                   	pop    %ebp
 a48:	c3                   	ret
 a49:	b9 00 00 00 00       	mov    $0x0,%ecx
 a4e:	eb f5                	jmp    a45 <strlen+0x1b>

00000a50 <memset>:
 a50:	55                   	push   %ebp
 a51:	89 e5                	mov    %esp,%ebp
 a53:	57                   	push   %edi
 a54:	8b 55 08             	mov    0x8(%ebp),%edx
 a57:	89 d7                	mov    %edx,%edi
 a59:	8b 4d 10             	mov    0x10(%ebp),%ecx
 a5c:	8b 45 0c             	mov    0xc(%ebp),%eax
 a5f:	fc                   	cld
 a60:	f3 aa                	rep stos %al,%es:(%edi)
 a62:	89 d0                	mov    %edx,%eax
 a64:	8b 7d fc             	mov    -0x4(%ebp),%edi
 a67:	c9                   	leave
 a68:	c3                   	ret

00000a69 <strchr>:
 a69:	55                   	push   %ebp
 a6a:	89 e5                	mov    %esp,%ebp
 a6c:	8b 45 08             	mov    0x8(%ebp),%eax
 a6f:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
 a73:	0f b6 10             	movzbl (%eax),%edx
 a76:	84 d2                	test   %dl,%dl
 a78:	74 15                	je     a8f <strchr+0x26>
 a7a:	38 d1                	cmp    %dl,%cl
 a7c:	74 0f                	je     a8d <strchr+0x24>
 a7e:	83 c0 01             	add    $0x1,%eax
 a81:	0f b6 10             	movzbl (%eax),%edx
 a84:	84 d2                	test   %dl,%dl
 a86:	75 f2                	jne    a7a <strchr+0x11>
 a88:	b8 00 00 00 00       	mov    $0x0,%eax
 a8d:	5d                   	pop    %ebp
 a8e:	c3                   	ret
 a8f:	b8 00 00 00 00       	mov    $0x0,%eax
 a94:	eb f7                	jmp    a8d <strchr+0x24>

00000a96 <gets>:
 a96:	55                   	push   %ebp
 a97:	89 e5                	mov    %esp,%ebp
 a99:	57                   	push   %edi
 a9a:	56                   	push   %esi
 a9b:	53                   	push   %ebx
 a9c:	83 ec 2c             	sub    $0x2c,%esp
 a9f:	8b 75 08             	mov    0x8(%ebp),%esi
 aa2:	bb 00 00 00 00       	mov    $0x0,%ebx
 aa7:	8d 7d e7             	lea    -0x19(%ebp),%edi
 aaa:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 aad:	83 c3 01             	add    $0x1,%ebx
 ab0:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 ab3:	7d 27                	jge    adc <gets+0x46>
 ab5:	83 ec 04             	sub    $0x4,%esp
 ab8:	6a 01                	push   $0x1
 aba:	57                   	push   %edi
 abb:	6a 00                	push   $0x0
 abd:	e8 f9 00 00 00       	call   bbb <read>
 ac2:	83 c4 10             	add    $0x10,%esp
 ac5:	85 c0                	test   %eax,%eax
 ac7:	7e 13                	jle    adc <gets+0x46>
 ac9:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 acd:	88 44 1e ff          	mov    %al,-0x1(%esi,%ebx,1)
 ad1:	3c 0a                	cmp    $0xa,%al
 ad3:	74 04                	je     ad9 <gets+0x43>
 ad5:	3c 0d                	cmp    $0xd,%al
 ad7:	75 d1                	jne    aaa <gets+0x14>
 ad9:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 adc:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 adf:	c6 04 06 00          	movb   $0x0,(%esi,%eax,1)
 ae3:	89 f0                	mov    %esi,%eax
 ae5:	8d 65 f4             	lea    -0xc(%ebp),%esp
 ae8:	5b                   	pop    %ebx
 ae9:	5e                   	pop    %esi
 aea:	5f                   	pop    %edi
 aeb:	5d                   	pop    %ebp
 aec:	c3                   	ret

00000aed <stat>:
 aed:	55                   	push   %ebp
 aee:	89 e5                	mov    %esp,%ebp
 af0:	56                   	push   %esi
 af1:	53                   	push   %ebx
 af2:	83 ec 08             	sub    $0x8,%esp
 af5:	6a 00                	push   $0x0
 af7:	ff 75 08             	push   0x8(%ebp)
 afa:	e8 e4 00 00 00       	call   be3 <open>
 aff:	83 c4 10             	add    $0x10,%esp
 b02:	85 c0                	test   %eax,%eax
 b04:	78 24                	js     b2a <stat+0x3d>
 b06:	89 c3                	mov    %eax,%ebx
 b08:	83 ec 08             	sub    $0x8,%esp
 b0b:	ff 75 0c             	push   0xc(%ebp)
 b0e:	50                   	push   %eax
 b0f:	e8 e7 00 00 00       	call   bfb <fstat>
 b14:	89 c6                	mov    %eax,%esi
 b16:	89 1c 24             	mov    %ebx,(%esp)
 b19:	e8 ad 00 00 00       	call   bcb <close>
 b1e:	83 c4 10             	add    $0x10,%esp
 b21:	89 f0                	mov    %esi,%eax
 b23:	8d 65 f8             	lea    -0x8(%ebp),%esp
 b26:	5b                   	pop    %ebx
 b27:	5e                   	pop    %esi
 b28:	5d                   	pop    %ebp
 b29:	c3                   	ret
 b2a:	be ff ff ff ff       	mov    $0xffffffff,%esi
 b2f:	eb f0                	jmp    b21 <stat+0x34>

00000b31 <atoi>:
 b31:	55                   	push   %ebp
 b32:	89 e5                	mov    %esp,%ebp
 b34:	53                   	push   %ebx
 b35:	8b 55 08             	mov    0x8(%ebp),%edx
 b38:	0f b6 02             	movzbl (%edx),%eax
 b3b:	8d 48 d0             	lea    -0x30(%eax),%ecx
 b3e:	80 f9 09             	cmp    $0x9,%cl
 b41:	77 24                	ja     b67 <atoi+0x36>
 b43:	b9 00 00 00 00       	mov    $0x0,%ecx
 b48:	83 c2 01             	add    $0x1,%edx
 b4b:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 b4e:	0f be c0             	movsbl %al,%eax
 b51:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
 b55:	0f b6 02             	movzbl (%edx),%eax
 b58:	8d 58 d0             	lea    -0x30(%eax),%ebx
 b5b:	80 fb 09             	cmp    $0x9,%bl
 b5e:	76 e8                	jbe    b48 <atoi+0x17>
 b60:	89 c8                	mov    %ecx,%eax
 b62:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 b65:	c9                   	leave
 b66:	c3                   	ret
 b67:	b9 00 00 00 00       	mov    $0x0,%ecx
 b6c:	eb f2                	jmp    b60 <atoi+0x2f>

00000b6e <memmove>:
 b6e:	55                   	push   %ebp
 b6f:	89 e5                	mov    %esp,%ebp
 b71:	56                   	push   %esi
 b72:	53                   	push   %ebx
 b73:	8b 75 08             	mov    0x8(%ebp),%esi
 b76:	8b 55 0c             	mov    0xc(%ebp),%edx
 b79:	8b 5d 10             	mov    0x10(%ebp),%ebx
 b7c:	85 db                	test   %ebx,%ebx
 b7e:	7e 15                	jle    b95 <memmove+0x27>
 b80:	01 f3                	add    %esi,%ebx
 b82:	89 f0                	mov    %esi,%eax
 b84:	83 c2 01             	add    $0x1,%edx
 b87:	83 c0 01             	add    $0x1,%eax
 b8a:	0f b6 4a ff          	movzbl -0x1(%edx),%ecx
 b8e:	88 48 ff             	mov    %cl,-0x1(%eax)
 b91:	39 c3                	cmp    %eax,%ebx
 b93:	75 ef                	jne    b84 <memmove+0x16>
 b95:	89 f0                	mov    %esi,%eax
 b97:	5b                   	pop    %ebx
 b98:	5e                   	pop    %esi
 b99:	5d                   	pop    %ebp
 b9a:	c3                   	ret

00000b9b <fork>:
  name: \
    movl $1, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALLFORK(fork) //instead of SYSCALL(fork) !!!
 b9b:	b8 01 00 00 00       	mov    $0x1,%eax
 ba0:	cd 40                	int    $0x40
 ba2:	c3                   	ret

00000ba3 <exit>:
//SYSCALL(fork)
SYSCALL(exit)
 ba3:	b8 02 00 00 00       	mov    $0x2,%eax
 ba8:	cd 40                	int    $0x40
 baa:	c3                   	ret

00000bab <wait>:
SYSCALL(wait)
 bab:	b8 03 00 00 00       	mov    $0x3,%eax
 bb0:	cd 40                	int    $0x40
 bb2:	c3                   	ret

00000bb3 <pipe>:
SYSCALL(pipe)
 bb3:	b8 04 00 00 00       	mov    $0x4,%eax
 bb8:	cd 40                	int    $0x40
 bba:	c3                   	ret

00000bbb <read>:
SYSCALL(read)
 bbb:	b8 05 00 00 00       	mov    $0x5,%eax
 bc0:	cd 40                	int    $0x40
 bc2:	c3                   	ret

00000bc3 <write>:
SYSCALL(write)
 bc3:	b8 10 00 00 00       	mov    $0x10,%eax
 bc8:	cd 40                	int    $0x40
 bca:	c3                   	ret

00000bcb <close>:
SYSCALL(close)
 bcb:	b8 15 00 00 00       	mov    $0x15,%eax
 bd0:	cd 40                	int    $0x40
 bd2:	c3                   	ret

00000bd3 <kill>:
SYSCALL(kill)
 bd3:	b8 06 00 00 00       	mov    $0x6,%eax
 bd8:	cd 40                	int    $0x40
 bda:	c3                   	ret

00000bdb <exec>:
SYSCALL(exec)
 bdb:	b8 07 00 00 00       	mov    $0x7,%eax
 be0:	cd 40                	int    $0x40
 be2:	c3                   	ret

00000be3 <open>:
SYSCALL(open)
 be3:	b8 0f 00 00 00       	mov    $0xf,%eax
 be8:	cd 40                	int    $0x40
 bea:	c3                   	ret

00000beb <mknod>:
SYSCALL(mknod)
 beb:	b8 11 00 00 00       	mov    $0x11,%eax
 bf0:	cd 40                	int    $0x40
 bf2:	c3                   	ret

00000bf3 <unlink>:
SYSCALL(unlink)
 bf3:	b8 12 00 00 00       	mov    $0x12,%eax
 bf8:	cd 40                	int    $0x40
 bfa:	c3                   	ret

00000bfb <fstat>:
SYSCALL(fstat)
 bfb:	b8 08 00 00 00       	mov    $0x8,%eax
 c00:	cd 40                	int    $0x40
 c02:	c3                   	ret

00000c03 <link>:
SYSCALL(link)
 c03:	b8 13 00 00 00       	mov    $0x13,%eax
 c08:	cd 40                	int    $0x40
 c0a:	c3                   	ret

00000c0b <mkdir>:
SYSCALL(mkdir)
 c0b:	b8 14 00 00 00       	mov    $0x14,%eax
 c10:	cd 40                	int    $0x40
 c12:	c3                   	ret

00000c13 <chdir>:
SYSCALL(chdir)
 c13:	b8 09 00 00 00       	mov    $0x9,%eax
 c18:	cd 40                	int    $0x40
 c1a:	c3                   	ret

00000c1b <dup>:
SYSCALL(dup)
 c1b:	b8 0a 00 00 00       	mov    $0xa,%eax
 c20:	cd 40                	int    $0x40
 c22:	c3                   	ret

00000c23 <getpid>:
SYSCALL(getpid)
 c23:	b8 0b 00 00 00       	mov    $0xb,%eax
 c28:	cd 40                	int    $0x40
 c2a:	c3                   	ret

00000c2b <sbrk>:
SYSCALL(sbrk)
 c2b:	b8 0c 00 00 00       	mov    $0xc,%eax
 c30:	cd 40                	int    $0x40
 c32:	c3                   	ret

00000c33 <sleep>:
SYSCALL(sleep)
 c33:	b8 0d 00 00 00       	mov    $0xd,%eax
 c38:	cd 40                	int    $0x40
 c3a:	c3                   	ret

00000c3b <uptime>:
SYSCALL(uptime)
 c3b:	b8 0e 00 00 00       	mov    $0xe,%eax
 c40:	cd 40                	int    $0x40
 c42:	c3                   	ret

00000c43 <ps>:
SYSCALL(ps)
 c43:	b8 16 00 00 00       	mov    $0x16,%eax
 c48:	cd 40                	int    $0x40
 c4a:	c3                   	ret

00000c4b <printint>:
 c4b:	55                   	push   %ebp
 c4c:	89 e5                	mov    %esp,%ebp
 c4e:	57                   	push   %edi
 c4f:	56                   	push   %esi
 c50:	53                   	push   %ebx
 c51:	83 ec 3c             	sub    $0x3c,%esp
 c54:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 c57:	89 ce                	mov    %ecx,%esi
 c59:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 c5d:	74 79                	je     cd8 <printint+0x8d>
 c5f:	85 d2                	test   %edx,%edx
 c61:	79 75                	jns    cd8 <printint+0x8d>
 c63:	89 d1                	mov    %edx,%ecx
 c65:	f7 d9                	neg    %ecx
 c67:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
 c6e:	bb 00 00 00 00       	mov    $0x0,%ebx
 c73:	89 df                	mov    %ebx,%edi
 c75:	83 c3 01             	add    $0x1,%ebx
 c78:	89 c8                	mov    %ecx,%eax
 c7a:	ba 00 00 00 00       	mov    $0x0,%edx
 c7f:	f7 f6                	div    %esi
 c81:	0f b6 92 20 11 00 00 	movzbl 0x1120(%edx),%edx
 c88:	88 54 1d d7          	mov    %dl,-0x29(%ebp,%ebx,1)
 c8c:	89 ca                	mov    %ecx,%edx
 c8e:	89 c1                	mov    %eax,%ecx
 c90:	39 f2                	cmp    %esi,%edx
 c92:	73 df                	jae    c73 <printint+0x28>
 c94:	83 7d c0 00          	cmpl   $0x0,-0x40(%ebp)
 c98:	74 08                	je     ca2 <printint+0x57>
 c9a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 c9f:	8d 5f 02             	lea    0x2(%edi),%ebx
 ca2:	85 db                	test   %ebx,%ebx
 ca4:	7e 2a                	jle    cd0 <printint+0x85>
 ca6:	8d 75 d8             	lea    -0x28(%ebp),%esi
 ca9:	8d 5c 1d d7          	lea    -0x29(%ebp,%ebx,1),%ebx
 cad:	8d 7d d7             	lea    -0x29(%ebp),%edi
 cb0:	0f b6 03             	movzbl (%ebx),%eax
 cb3:	88 45 d7             	mov    %al,-0x29(%ebp)
 cb6:	83 ec 04             	sub    $0x4,%esp
 cb9:	6a 01                	push   $0x1
 cbb:	57                   	push   %edi
 cbc:	ff 75 c4             	push   -0x3c(%ebp)
 cbf:	e8 ff fe ff ff       	call   bc3 <write>
 cc4:	89 d8                	mov    %ebx,%eax
 cc6:	83 eb 01             	sub    $0x1,%ebx
 cc9:	83 c4 10             	add    $0x10,%esp
 ccc:	39 f0                	cmp    %esi,%eax
 cce:	75 e0                	jne    cb0 <printint+0x65>
 cd0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 cd3:	5b                   	pop    %ebx
 cd4:	5e                   	pop    %esi
 cd5:	5f                   	pop    %edi
 cd6:	5d                   	pop    %ebp
 cd7:	c3                   	ret
 cd8:	89 d1                	mov    %edx,%ecx
 cda:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
 ce1:	eb 8b                	jmp    c6e <printint+0x23>

00000ce3 <printf>:
 ce3:	55                   	push   %ebp
 ce4:	89 e5                	mov    %esp,%ebp
 ce6:	57                   	push   %edi
 ce7:	56                   	push   %esi
 ce8:	53                   	push   %ebx
 ce9:	83 ec 2c             	sub    $0x2c,%esp
 cec:	8b 75 0c             	mov    0xc(%ebp),%esi
 cef:	0f b6 1e             	movzbl (%esi),%ebx
 cf2:	84 db                	test   %bl,%bl
 cf4:	0f 84 9e 01 00 00    	je     e98 <printf+0x1b5>
 cfa:	83 c6 01             	add    $0x1,%esi
 cfd:	8d 45 10             	lea    0x10(%ebp),%eax
 d00:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 d03:	bf 00 00 00 00       	mov    $0x0,%edi
 d08:	eb 2d                	jmp    d37 <printf+0x54>
 d0a:	88 5d e7             	mov    %bl,-0x19(%ebp)
 d0d:	83 ec 04             	sub    $0x4,%esp
 d10:	6a 01                	push   $0x1
 d12:	8d 45 e7             	lea    -0x19(%ebp),%eax
 d15:	50                   	push   %eax
 d16:	ff 75 08             	push   0x8(%ebp)
 d19:	e8 a5 fe ff ff       	call   bc3 <write>
 d1e:	83 c4 10             	add    $0x10,%esp
 d21:	eb 05                	jmp    d28 <printf+0x45>
 d23:	83 ff 25             	cmp    $0x25,%edi
 d26:	74 1f                	je     d47 <printf+0x64>
 d28:	83 c6 01             	add    $0x1,%esi
 d2b:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 d2f:	84 db                	test   %bl,%bl
 d31:	0f 84 61 01 00 00    	je     e98 <printf+0x1b5>
 d37:	0f b6 c3             	movzbl %bl,%eax
 d3a:	85 ff                	test   %edi,%edi
 d3c:	75 e5                	jne    d23 <printf+0x40>
 d3e:	83 f8 25             	cmp    $0x25,%eax
 d41:	75 c7                	jne    d0a <printf+0x27>
 d43:	89 c7                	mov    %eax,%edi
 d45:	eb e1                	jmp    d28 <printf+0x45>
 d47:	83 f8 25             	cmp    $0x25,%eax
 d4a:	0f 84 f4 00 00 00    	je     e44 <printf+0x161>
 d50:	8d 50 9d             	lea    -0x63(%eax),%edx
 d53:	83 fa 15             	cmp    $0x15,%edx
 d56:	0f 87 09 01 00 00    	ja     e65 <printf+0x182>
 d5c:	0f 87 03 01 00 00    	ja     e65 <printf+0x182>
 d62:	ff 24 95 c8 10 00 00 	jmp    *0x10c8(,%edx,4)
 d69:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 d6c:	8b 17                	mov    (%edi),%edx
 d6e:	83 ec 0c             	sub    $0xc,%esp
 d71:	6a 01                	push   $0x1
 d73:	b9 0a 00 00 00       	mov    $0xa,%ecx
 d78:	8b 45 08             	mov    0x8(%ebp),%eax
 d7b:	e8 cb fe ff ff       	call   c4b <printint>
 d80:	83 c7 04             	add    $0x4,%edi
 d83:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 d86:	83 c4 10             	add    $0x10,%esp
 d89:	bf 00 00 00 00       	mov    $0x0,%edi
 d8e:	eb 98                	jmp    d28 <printf+0x45>
 d90:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 d93:	8b 17                	mov    (%edi),%edx
 d95:	83 ec 0c             	sub    $0xc,%esp
 d98:	6a 00                	push   $0x0
 d9a:	b9 10 00 00 00       	mov    $0x10,%ecx
 d9f:	8b 45 08             	mov    0x8(%ebp),%eax
 da2:	e8 a4 fe ff ff       	call   c4b <printint>
 da7:	83 c7 04             	add    $0x4,%edi
 daa:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 dad:	83 c4 10             	add    $0x10,%esp
 db0:	bf 00 00 00 00       	mov    $0x0,%edi
 db5:	e9 6e ff ff ff       	jmp    d28 <printf+0x45>
 dba:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
 dbd:	8b 01                	mov    (%ecx),%eax
 dbf:	83 c1 04             	add    $0x4,%ecx
 dc2:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 dc5:	85 c0                	test   %eax,%eax
 dc7:	74 13                	je     ddc <printf+0xf9>
 dc9:	89 c3                	mov    %eax,%ebx
 dcb:	0f b6 00             	movzbl (%eax),%eax
 dce:	bf 00 00 00 00       	mov    $0x0,%edi
 dd3:	84 c0                	test   %al,%al
 dd5:	75 0f                	jne    de6 <printf+0x103>
 dd7:	e9 4c ff ff ff       	jmp    d28 <printf+0x45>
 ddc:	bb 8f 10 00 00       	mov    $0x108f,%ebx
 de1:	b8 28 00 00 00       	mov    $0x28,%eax
 de6:	8d 7d e7             	lea    -0x19(%ebp),%edi
 de9:	89 75 d0             	mov    %esi,-0x30(%ebp)
 dec:	8b 75 08             	mov    0x8(%ebp),%esi
 def:	88 45 e7             	mov    %al,-0x19(%ebp)
 df2:	83 ec 04             	sub    $0x4,%esp
 df5:	6a 01                	push   $0x1
 df7:	57                   	push   %edi
 df8:	56                   	push   %esi
 df9:	e8 c5 fd ff ff       	call   bc3 <write>
 dfe:	83 c3 01             	add    $0x1,%ebx
 e01:	0f b6 03             	movzbl (%ebx),%eax
 e04:	83 c4 10             	add    $0x10,%esp
 e07:	84 c0                	test   %al,%al
 e09:	75 e4                	jne    def <printf+0x10c>
 e0b:	8b 75 d0             	mov    -0x30(%ebp),%esi
 e0e:	bf 00 00 00 00       	mov    $0x0,%edi
 e13:	e9 10 ff ff ff       	jmp    d28 <printf+0x45>
 e18:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 e1b:	8b 07                	mov    (%edi),%eax
 e1d:	88 45 e7             	mov    %al,-0x19(%ebp)
 e20:	83 ec 04             	sub    $0x4,%esp
 e23:	6a 01                	push   $0x1
 e25:	8d 45 e7             	lea    -0x19(%ebp),%eax
 e28:	50                   	push   %eax
 e29:	ff 75 08             	push   0x8(%ebp)
 e2c:	e8 92 fd ff ff       	call   bc3 <write>
 e31:	83 c7 04             	add    $0x4,%edi
 e34:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 e37:	83 c4 10             	add    $0x10,%esp
 e3a:	bf 00 00 00 00       	mov    $0x0,%edi
 e3f:	e9 e4 fe ff ff       	jmp    d28 <printf+0x45>
 e44:	88 5d e7             	mov    %bl,-0x19(%ebp)
 e47:	83 ec 04             	sub    $0x4,%esp
 e4a:	6a 01                	push   $0x1
 e4c:	8d 45 e7             	lea    -0x19(%ebp),%eax
 e4f:	50                   	push   %eax
 e50:	ff 75 08             	push   0x8(%ebp)
 e53:	e8 6b fd ff ff       	call   bc3 <write>
 e58:	83 c4 10             	add    $0x10,%esp
 e5b:	bf 00 00 00 00       	mov    $0x0,%edi
 e60:	e9 c3 fe ff ff       	jmp    d28 <printf+0x45>
 e65:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 e69:	83 ec 04             	sub    $0x4,%esp
 e6c:	6a 01                	push   $0x1
 e6e:	8d 7d e7             	lea    -0x19(%ebp),%edi
 e71:	57                   	push   %edi
 e72:	ff 75 08             	push   0x8(%ebp)
 e75:	e8 49 fd ff ff       	call   bc3 <write>
 e7a:	88 5d e7             	mov    %bl,-0x19(%ebp)
 e7d:	83 c4 0c             	add    $0xc,%esp
 e80:	6a 01                	push   $0x1
 e82:	57                   	push   %edi
 e83:	ff 75 08             	push   0x8(%ebp)
 e86:	e8 38 fd ff ff       	call   bc3 <write>
 e8b:	83 c4 10             	add    $0x10,%esp
 e8e:	bf 00 00 00 00       	mov    $0x0,%edi
 e93:	e9 90 fe ff ff       	jmp    d28 <printf+0x45>
 e98:	8d 65 f4             	lea    -0xc(%ebp),%esp
 e9b:	5b                   	pop    %ebx
 e9c:	5e                   	pop    %esi
 e9d:	5f                   	pop    %edi
 e9e:	5d                   	pop    %ebp
 e9f:	c3                   	ret

00000ea0 <free>:
 ea0:	55                   	push   %ebp
 ea1:	89 e5                	mov    %esp,%ebp
 ea3:	57                   	push   %edi
 ea4:	56                   	push   %esi
 ea5:	53                   	push   %ebx
 ea6:	8b 5d 08             	mov    0x8(%ebp),%ebx
 ea9:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 eac:	a1 e4 16 00 00       	mov    0x16e4,%eax
 eb1:	eb 0c                	jmp    ebf <free+0x1f>
 eb3:	8b 10                	mov    (%eax),%edx
 eb5:	39 d0                	cmp    %edx,%eax
 eb7:	72 04                	jb     ebd <free+0x1d>
 eb9:	39 d1                	cmp    %edx,%ecx
 ebb:	72 10                	jb     ecd <free+0x2d>
 ebd:	89 d0                	mov    %edx,%eax
 ebf:	39 c8                	cmp    %ecx,%eax
 ec1:	73 f0                	jae    eb3 <free+0x13>
 ec3:	8b 10                	mov    (%eax),%edx
 ec5:	39 d1                	cmp    %edx,%ecx
 ec7:	72 04                	jb     ecd <free+0x2d>
 ec9:	39 d0                	cmp    %edx,%eax
 ecb:	72 f0                	jb     ebd <free+0x1d>
 ecd:	8b 73 fc             	mov    -0x4(%ebx),%esi
 ed0:	8b 10                	mov    (%eax),%edx
 ed2:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 ed5:	39 fa                	cmp    %edi,%edx
 ed7:	74 19                	je     ef2 <free+0x52>
 ed9:	89 53 f8             	mov    %edx,-0x8(%ebx)
 edc:	8b 50 04             	mov    0x4(%eax),%edx
 edf:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 ee2:	39 f1                	cmp    %esi,%ecx
 ee4:	74 18                	je     efe <free+0x5e>
 ee6:	89 08                	mov    %ecx,(%eax)
 ee8:	a3 e4 16 00 00       	mov    %eax,0x16e4
 eed:	5b                   	pop    %ebx
 eee:	5e                   	pop    %esi
 eef:	5f                   	pop    %edi
 ef0:	5d                   	pop    %ebp
 ef1:	c3                   	ret
 ef2:	03 72 04             	add    0x4(%edx),%esi
 ef5:	89 73 fc             	mov    %esi,-0x4(%ebx)
 ef8:	8b 10                	mov    (%eax),%edx
 efa:	8b 12                	mov    (%edx),%edx
 efc:	eb db                	jmp    ed9 <free+0x39>
 efe:	03 53 fc             	add    -0x4(%ebx),%edx
 f01:	89 50 04             	mov    %edx,0x4(%eax)
 f04:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 f07:	eb dd                	jmp    ee6 <free+0x46>

00000f09 <malloc>:
 f09:	55                   	push   %ebp
 f0a:	89 e5                	mov    %esp,%ebp
 f0c:	57                   	push   %edi
 f0d:	56                   	push   %esi
 f0e:	53                   	push   %ebx
 f0f:	83 ec 0c             	sub    $0xc,%esp
 f12:	8b 45 08             	mov    0x8(%ebp),%eax
 f15:	8d 58 07             	lea    0x7(%eax),%ebx
 f18:	c1 eb 03             	shr    $0x3,%ebx
 f1b:	83 c3 01             	add    $0x1,%ebx
 f1e:	8b 15 e4 16 00 00    	mov    0x16e4,%edx
 f24:	85 d2                	test   %edx,%edx
 f26:	74 1c                	je     f44 <malloc+0x3b>
 f28:	8b 02                	mov    (%edx),%eax
 f2a:	8b 48 04             	mov    0x4(%eax),%ecx
 f2d:	39 d9                	cmp    %ebx,%ecx
 f2f:	73 38                	jae    f69 <malloc+0x60>
 f31:	be 00 10 00 00       	mov    $0x1000,%esi
 f36:	39 f3                	cmp    %esi,%ebx
 f38:	0f 43 f3             	cmovae %ebx,%esi
 f3b:	8d 3c f5 00 00 00 00 	lea    0x0(,%esi,8),%edi
 f42:	eb 72                	jmp    fb6 <malloc+0xad>
 f44:	c7 05 e4 16 00 00 e8 	movl   $0x16e8,0x16e4
 f4b:	16 00 00 
 f4e:	c7 05 e8 16 00 00 e8 	movl   $0x16e8,0x16e8
 f55:	16 00 00 
 f58:	c7 05 ec 16 00 00 00 	movl   $0x0,0x16ec
 f5f:	00 00 00 
 f62:	b8 e8 16 00 00       	mov    $0x16e8,%eax
 f67:	eb c8                	jmp    f31 <malloc+0x28>
 f69:	39 cb                	cmp    %ecx,%ebx
 f6b:	74 1e                	je     f8b <malloc+0x82>
 f6d:	29 d9                	sub    %ebx,%ecx
 f6f:	89 48 04             	mov    %ecx,0x4(%eax)
 f72:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 f75:	89 58 04             	mov    %ebx,0x4(%eax)
 f78:	89 15 e4 16 00 00    	mov    %edx,0x16e4
 f7e:	8d 50 08             	lea    0x8(%eax),%edx
 f81:	89 d0                	mov    %edx,%eax
 f83:	8d 65 f4             	lea    -0xc(%ebp),%esp
 f86:	5b                   	pop    %ebx
 f87:	5e                   	pop    %esi
 f88:	5f                   	pop    %edi
 f89:	5d                   	pop    %ebp
 f8a:	c3                   	ret
 f8b:	8b 08                	mov    (%eax),%ecx
 f8d:	89 0a                	mov    %ecx,(%edx)
 f8f:	eb e7                	jmp    f78 <malloc+0x6f>
 f91:	89 70 04             	mov    %esi,0x4(%eax)
 f94:	83 ec 0c             	sub    $0xc,%esp
 f97:	83 c0 08             	add    $0x8,%eax
 f9a:	50                   	push   %eax
 f9b:	e8 00 ff ff ff       	call   ea0 <free>
 fa0:	8b 15 e4 16 00 00    	mov    0x16e4,%edx
 fa6:	83 c4 10             	add    $0x10,%esp
 fa9:	85 d2                	test   %edx,%edx
 fab:	74 d4                	je     f81 <malloc+0x78>
 fad:	8b 02                	mov    (%edx),%eax
 faf:	8b 48 04             	mov    0x4(%eax),%ecx
 fb2:	39 d9                	cmp    %ebx,%ecx
 fb4:	73 b3                	jae    f69 <malloc+0x60>
 fb6:	89 c2                	mov    %eax,%edx
 fb8:	39 05 e4 16 00 00    	cmp    %eax,0x16e4
 fbe:	75 ed                	jne    fad <malloc+0xa4>
 fc0:	83 ec 0c             	sub    $0xc,%esp
 fc3:	57                   	push   %edi
 fc4:	e8 62 fc ff ff       	call   c2b <sbrk>
 fc9:	83 c4 10             	add    $0x10,%esp
 fcc:	83 f8 ff             	cmp    $0xffffffff,%eax
 fcf:	75 c0                	jne    f91 <malloc+0x88>
 fd1:	ba 00 00 00 00       	mov    $0x0,%edx
 fd6:	eb a9                	jmp    f81 <malloc+0x78>
