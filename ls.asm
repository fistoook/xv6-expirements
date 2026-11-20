
_ls:     file format elf32-i386


Disassembly of section .text:

00000000 <fmtname>:
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	56                   	push   %esi
   4:	53                   	push   %ebx
   5:	8b 5d 08             	mov    0x8(%ebp),%ebx
   8:	83 ec 0c             	sub    $0xc,%esp
   b:	53                   	push   %ebx
   c:	e8 11 03 00 00       	call   322 <strlen>
  11:	83 c4 10             	add    $0x10,%esp
  14:	01 d8                	add    %ebx,%eax
  16:	72 0c                	jb     24 <fmtname+0x24>
  18:	80 38 2f             	cmpb   $0x2f,(%eax)
  1b:	74 07                	je     24 <fmtname+0x24>
  1d:	83 e8 01             	sub    $0x1,%eax
  20:	39 d8                	cmp    %ebx,%eax
  22:	73 f4                	jae    18 <fmtname+0x18>
  24:	8d 58 01             	lea    0x1(%eax),%ebx
  27:	83 ec 0c             	sub    $0xc,%esp
  2a:	53                   	push   %ebx
  2b:	e8 f2 02 00 00       	call   322 <strlen>
  30:	83 c4 10             	add    $0x10,%esp
  33:	83 f8 0d             	cmp    $0xd,%eax
  36:	76 09                	jbe    41 <fmtname+0x41>
  38:	89 d8                	mov    %ebx,%eax
  3a:	8d 65 f8             	lea    -0x8(%ebp),%esp
  3d:	5b                   	pop    %ebx
  3e:	5e                   	pop    %esi
  3f:	5d                   	pop    %ebp
  40:	c3                   	ret
  41:	83 ec 0c             	sub    $0xc,%esp
  44:	53                   	push   %ebx
  45:	e8 d8 02 00 00       	call   322 <strlen>
  4a:	83 c4 0c             	add    $0xc,%esp
  4d:	50                   	push   %eax
  4e:	53                   	push   %ebx
  4f:	68 4c 0c 00 00       	push   $0xc4c
  54:	e8 0d 04 00 00       	call   466 <memmove>
  59:	89 1c 24             	mov    %ebx,(%esp)
  5c:	e8 c1 02 00 00       	call   322 <strlen>
  61:	89 c6                	mov    %eax,%esi
  63:	89 1c 24             	mov    %ebx,(%esp)
  66:	e8 b7 02 00 00       	call   322 <strlen>
  6b:	83 c4 0c             	add    $0xc,%esp
  6e:	ba 0e 00 00 00       	mov    $0xe,%edx
  73:	29 f2                	sub    %esi,%edx
  75:	52                   	push   %edx
  76:	6a 20                	push   $0x20
  78:	05 4c 0c 00 00       	add    $0xc4c,%eax
  7d:	50                   	push   %eax
  7e:	e8 c5 02 00 00       	call   348 <memset>
  83:	83 c4 10             	add    $0x10,%esp
  86:	bb 4c 0c 00 00       	mov    $0xc4c,%ebx
  8b:	eb ab                	jmp    38 <fmtname+0x38>

0000008d <ls>:
  8d:	55                   	push   %ebp
  8e:	89 e5                	mov    %esp,%ebp
  90:	57                   	push   %edi
  91:	56                   	push   %esi
  92:	53                   	push   %ebx
  93:	81 ec 54 02 00 00    	sub    $0x254,%esp
  99:	8b 5d 08             	mov    0x8(%ebp),%ebx
  9c:	6a 00                	push   $0x0
  9e:	53                   	push   %ebx
  9f:	e8 37 04 00 00       	call   4db <open>
  a4:	83 c4 10             	add    $0x10,%esp
  a7:	85 c0                	test   %eax,%eax
  a9:	78 7b                	js     126 <ls+0x99>
  ab:	89 c6                	mov    %eax,%esi
  ad:	83 ec 08             	sub    $0x8,%esp
  b0:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
  b6:	50                   	push   %eax
  b7:	56                   	push   %esi
  b8:	e8 36 04 00 00       	call   4f3 <fstat>
  bd:	83 c4 10             	add    $0x10,%esp
  c0:	85 c0                	test   %eax,%eax
  c2:	78 77                	js     13b <ls+0xae>
  c4:	0f b7 85 c4 fd ff ff 	movzwl -0x23c(%ebp),%eax
  cb:	66 83 f8 01          	cmp    $0x1,%ax
  cf:	0f 84 83 00 00 00    	je     158 <ls+0xcb>
  d5:	66 83 f8 02          	cmp    $0x2,%ax
  d9:	75 37                	jne    112 <ls+0x85>
  db:	8b bd d4 fd ff ff    	mov    -0x22c(%ebp),%edi
  e1:	8b 85 cc fd ff ff    	mov    -0x234(%ebp),%eax
  e7:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
  ed:	83 ec 0c             	sub    $0xc,%esp
  f0:	53                   	push   %ebx
  f1:	e8 0a ff ff ff       	call   0 <fmtname>
  f6:	83 c4 08             	add    $0x8,%esp
  f9:	57                   	push   %edi
  fa:	ff b5 b4 fd ff ff    	push   -0x24c(%ebp)
 100:	6a 02                	push   $0x2
 102:	50                   	push   %eax
 103:	68 f8 08 00 00       	push   $0x8f8
 108:	6a 01                	push   $0x1
 10a:	e8 cc 04 00 00       	call   5db <printf>
 10f:	83 c4 20             	add    $0x20,%esp
 112:	83 ec 0c             	sub    $0xc,%esp
 115:	56                   	push   %esi
 116:	e8 a8 03 00 00       	call   4c3 <close>
 11b:	83 c4 10             	add    $0x10,%esp
 11e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 121:	5b                   	pop    %ebx
 122:	5e                   	pop    %esi
 123:	5f                   	pop    %edi
 124:	5d                   	pop    %ebp
 125:	c3                   	ret
 126:	83 ec 04             	sub    $0x4,%esp
 129:	53                   	push   %ebx
 12a:	68 d0 08 00 00       	push   $0x8d0
 12f:	6a 02                	push   $0x2
 131:	e8 a5 04 00 00       	call   5db <printf>
 136:	83 c4 10             	add    $0x10,%esp
 139:	eb e3                	jmp    11e <ls+0x91>
 13b:	83 ec 04             	sub    $0x4,%esp
 13e:	53                   	push   %ebx
 13f:	68 e4 08 00 00       	push   $0x8e4
 144:	6a 02                	push   $0x2
 146:	e8 90 04 00 00       	call   5db <printf>
 14b:	89 34 24             	mov    %esi,(%esp)
 14e:	e8 70 03 00 00       	call   4c3 <close>
 153:	83 c4 10             	add    $0x10,%esp
 156:	eb c6                	jmp    11e <ls+0x91>
 158:	83 ec 0c             	sub    $0xc,%esp
 15b:	53                   	push   %ebx
 15c:	e8 c1 01 00 00       	call   322 <strlen>
 161:	83 c0 10             	add    $0x10,%eax
 164:	83 c4 10             	add    $0x10,%esp
 167:	3d 00 02 00 00       	cmp    $0x200,%eax
 16c:	76 14                	jbe    182 <ls+0xf5>
 16e:	83 ec 08             	sub    $0x8,%esp
 171:	68 05 09 00 00       	push   $0x905
 176:	6a 01                	push   $0x1
 178:	e8 5e 04 00 00       	call   5db <printf>
 17d:	83 c4 10             	add    $0x10,%esp
 180:	eb 90                	jmp    112 <ls+0x85>
 182:	83 ec 08             	sub    $0x8,%esp
 185:	53                   	push   %ebx
 186:	8d bd e8 fd ff ff    	lea    -0x218(%ebp),%edi
 18c:	57                   	push   %edi
 18d:	e8 41 01 00 00       	call   2d3 <strcpy>
 192:	89 3c 24             	mov    %edi,(%esp)
 195:	e8 88 01 00 00       	call   322 <strlen>
 19a:	01 c7                	add    %eax,%edi
 19c:	8d 47 01             	lea    0x1(%edi),%eax
 19f:	89 85 a8 fd ff ff    	mov    %eax,-0x258(%ebp)
 1a5:	c6 07 2f             	movb   $0x2f,(%edi)
 1a8:	83 c4 10             	add    $0x10,%esp
 1ab:	8d 9d d8 fd ff ff    	lea    -0x228(%ebp),%ebx
 1b1:	eb 19                	jmp    1cc <ls+0x13f>
 1b3:	83 ec 04             	sub    $0x4,%esp
 1b6:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 1bc:	50                   	push   %eax
 1bd:	68 e4 08 00 00       	push   $0x8e4
 1c2:	6a 01                	push   $0x1
 1c4:	e8 12 04 00 00       	call   5db <printf>
 1c9:	83 c4 10             	add    $0x10,%esp
 1cc:	83 ec 04             	sub    $0x4,%esp
 1cf:	6a 10                	push   $0x10
 1d1:	53                   	push   %ebx
 1d2:	56                   	push   %esi
 1d3:	e8 db 02 00 00       	call   4b3 <read>
 1d8:	83 c4 10             	add    $0x10,%esp
 1db:	83 f8 10             	cmp    $0x10,%eax
 1de:	0f 85 2e ff ff ff    	jne    112 <ls+0x85>
 1e4:	66 83 bd d8 fd ff ff 	cmpw   $0x0,-0x228(%ebp)
 1eb:	00 
 1ec:	74 de                	je     1cc <ls+0x13f>
 1ee:	83 ec 04             	sub    $0x4,%esp
 1f1:	6a 0e                	push   $0xe
 1f3:	8d 85 da fd ff ff    	lea    -0x226(%ebp),%eax
 1f9:	50                   	push   %eax
 1fa:	ff b5 a8 fd ff ff    	push   -0x258(%ebp)
 200:	e8 61 02 00 00       	call   466 <memmove>
 205:	c6 47 0f 00          	movb   $0x0,0xf(%edi)
 209:	83 c4 08             	add    $0x8,%esp
 20c:	8d 85 c4 fd ff ff    	lea    -0x23c(%ebp),%eax
 212:	50                   	push   %eax
 213:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 219:	50                   	push   %eax
 21a:	e8 c6 01 00 00       	call   3e5 <stat>
 21f:	83 c4 10             	add    $0x10,%esp
 222:	85 c0                	test   %eax,%eax
 224:	78 8d                	js     1b3 <ls+0x126>
 226:	8b 85 d4 fd ff ff    	mov    -0x22c(%ebp),%eax
 22c:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
 232:	8b 95 cc fd ff ff    	mov    -0x234(%ebp),%edx
 238:	89 95 b0 fd ff ff    	mov    %edx,-0x250(%ebp)
 23e:	0f bf 8d c4 fd ff ff 	movswl -0x23c(%ebp),%ecx
 245:	89 8d ac fd ff ff    	mov    %ecx,-0x254(%ebp)
 24b:	83 ec 0c             	sub    $0xc,%esp
 24e:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
 254:	50                   	push   %eax
 255:	e8 a6 fd ff ff       	call   0 <fmtname>
 25a:	83 c4 08             	add    $0x8,%esp
 25d:	ff b5 b4 fd ff ff    	push   -0x24c(%ebp)
 263:	ff b5 b0 fd ff ff    	push   -0x250(%ebp)
 269:	ff b5 ac fd ff ff    	push   -0x254(%ebp)
 26f:	50                   	push   %eax
 270:	68 f8 08 00 00       	push   $0x8f8
 275:	6a 01                	push   $0x1
 277:	e8 5f 03 00 00       	call   5db <printf>
 27c:	83 c4 20             	add    $0x20,%esp
 27f:	e9 48 ff ff ff       	jmp    1cc <ls+0x13f>

00000284 <main>:
 284:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 288:	83 e4 f0             	and    $0xfffffff0,%esp
 28b:	ff 71 fc             	push   -0x4(%ecx)
 28e:	55                   	push   %ebp
 28f:	89 e5                	mov    %esp,%ebp
 291:	57                   	push   %edi
 292:	56                   	push   %esi
 293:	53                   	push   %ebx
 294:	51                   	push   %ecx
 295:	83 ec 08             	sub    $0x8,%esp
 298:	8b 31                	mov    (%ecx),%esi
 29a:	8b 79 04             	mov    0x4(%ecx),%edi
 29d:	bb 01 00 00 00       	mov    $0x1,%ebx
 2a2:	83 fe 01             	cmp    $0x1,%esi
 2a5:	7e 1a                	jle    2c1 <main+0x3d>
 2a7:	83 ec 0c             	sub    $0xc,%esp
 2aa:	ff 34 9f             	push   (%edi,%ebx,4)
 2ad:	e8 db fd ff ff       	call   8d <ls>
 2b2:	83 c3 01             	add    $0x1,%ebx
 2b5:	83 c4 10             	add    $0x10,%esp
 2b8:	39 de                	cmp    %ebx,%esi
 2ba:	75 eb                	jne    2a7 <main+0x23>
 2bc:	e8 da 01 00 00       	call   49b <exit>
 2c1:	83 ec 0c             	sub    $0xc,%esp
 2c4:	68 18 09 00 00       	push   $0x918
 2c9:	e8 bf fd ff ff       	call   8d <ls>
 2ce:	e8 c8 01 00 00       	call   49b <exit>

000002d3 <strcpy>:
 2d3:	55                   	push   %ebp
 2d4:	89 e5                	mov    %esp,%ebp
 2d6:	53                   	push   %ebx
 2d7:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2da:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 2dd:	b8 00 00 00 00       	mov    $0x0,%eax
 2e2:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 2e6:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 2e9:	83 c0 01             	add    $0x1,%eax
 2ec:	84 d2                	test   %dl,%dl
 2ee:	75 f2                	jne    2e2 <strcpy+0xf>
 2f0:	89 c8                	mov    %ecx,%eax
 2f2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2f5:	c9                   	leave
 2f6:	c3                   	ret

000002f7 <strcmp>:
 2f7:	55                   	push   %ebp
 2f8:	89 e5                	mov    %esp,%ebp
 2fa:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2fd:	8b 55 0c             	mov    0xc(%ebp),%edx
 300:	0f b6 01             	movzbl (%ecx),%eax
 303:	84 c0                	test   %al,%al
 305:	74 11                	je     318 <strcmp+0x21>
 307:	38 02                	cmp    %al,(%edx)
 309:	75 0d                	jne    318 <strcmp+0x21>
 30b:	83 c1 01             	add    $0x1,%ecx
 30e:	83 c2 01             	add    $0x1,%edx
 311:	0f b6 01             	movzbl (%ecx),%eax
 314:	84 c0                	test   %al,%al
 316:	75 ef                	jne    307 <strcmp+0x10>
 318:	0f b6 c0             	movzbl %al,%eax
 31b:	0f b6 12             	movzbl (%edx),%edx
 31e:	29 d0                	sub    %edx,%eax
 320:	5d                   	pop    %ebp
 321:	c3                   	ret

00000322 <strlen>:
 322:	55                   	push   %ebp
 323:	89 e5                	mov    %esp,%ebp
 325:	8b 55 08             	mov    0x8(%ebp),%edx
 328:	80 3a 00             	cmpb   $0x0,(%edx)
 32b:	74 14                	je     341 <strlen+0x1f>
 32d:	b8 00 00 00 00       	mov    $0x0,%eax
 332:	83 c0 01             	add    $0x1,%eax
 335:	89 c1                	mov    %eax,%ecx
 337:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 33b:	75 f5                	jne    332 <strlen+0x10>
 33d:	89 c8                	mov    %ecx,%eax
 33f:	5d                   	pop    %ebp
 340:	c3                   	ret
 341:	b9 00 00 00 00       	mov    $0x0,%ecx
 346:	eb f5                	jmp    33d <strlen+0x1b>

00000348 <memset>:
 348:	55                   	push   %ebp
 349:	89 e5                	mov    %esp,%ebp
 34b:	57                   	push   %edi
 34c:	8b 55 08             	mov    0x8(%ebp),%edx
 34f:	89 d7                	mov    %edx,%edi
 351:	8b 4d 10             	mov    0x10(%ebp),%ecx
 354:	8b 45 0c             	mov    0xc(%ebp),%eax
 357:	fc                   	cld
 358:	f3 aa                	rep stos %al,%es:(%edi)
 35a:	89 d0                	mov    %edx,%eax
 35c:	8b 7d fc             	mov    -0x4(%ebp),%edi
 35f:	c9                   	leave
 360:	c3                   	ret

00000361 <strchr>:
 361:	55                   	push   %ebp
 362:	89 e5                	mov    %esp,%ebp
 364:	8b 45 08             	mov    0x8(%ebp),%eax
 367:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
 36b:	0f b6 10             	movzbl (%eax),%edx
 36e:	84 d2                	test   %dl,%dl
 370:	74 15                	je     387 <strchr+0x26>
 372:	38 d1                	cmp    %dl,%cl
 374:	74 0f                	je     385 <strchr+0x24>
 376:	83 c0 01             	add    $0x1,%eax
 379:	0f b6 10             	movzbl (%eax),%edx
 37c:	84 d2                	test   %dl,%dl
 37e:	75 f2                	jne    372 <strchr+0x11>
 380:	b8 00 00 00 00       	mov    $0x0,%eax
 385:	5d                   	pop    %ebp
 386:	c3                   	ret
 387:	b8 00 00 00 00       	mov    $0x0,%eax
 38c:	eb f7                	jmp    385 <strchr+0x24>

0000038e <gets>:
 38e:	55                   	push   %ebp
 38f:	89 e5                	mov    %esp,%ebp
 391:	57                   	push   %edi
 392:	56                   	push   %esi
 393:	53                   	push   %ebx
 394:	83 ec 2c             	sub    $0x2c,%esp
 397:	8b 75 08             	mov    0x8(%ebp),%esi
 39a:	bb 00 00 00 00       	mov    $0x0,%ebx
 39f:	8d 7d e7             	lea    -0x19(%ebp),%edi
 3a2:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 3a5:	83 c3 01             	add    $0x1,%ebx
 3a8:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 3ab:	7d 27                	jge    3d4 <gets+0x46>
 3ad:	83 ec 04             	sub    $0x4,%esp
 3b0:	6a 01                	push   $0x1
 3b2:	57                   	push   %edi
 3b3:	6a 00                	push   $0x0
 3b5:	e8 f9 00 00 00       	call   4b3 <read>
 3ba:	83 c4 10             	add    $0x10,%esp
 3bd:	85 c0                	test   %eax,%eax
 3bf:	7e 13                	jle    3d4 <gets+0x46>
 3c1:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 3c5:	88 44 1e ff          	mov    %al,-0x1(%esi,%ebx,1)
 3c9:	3c 0a                	cmp    $0xa,%al
 3cb:	74 04                	je     3d1 <gets+0x43>
 3cd:	3c 0d                	cmp    $0xd,%al
 3cf:	75 d1                	jne    3a2 <gets+0x14>
 3d1:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 3d4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 3d7:	c6 04 06 00          	movb   $0x0,(%esi,%eax,1)
 3db:	89 f0                	mov    %esi,%eax
 3dd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3e0:	5b                   	pop    %ebx
 3e1:	5e                   	pop    %esi
 3e2:	5f                   	pop    %edi
 3e3:	5d                   	pop    %ebp
 3e4:	c3                   	ret

000003e5 <stat>:
 3e5:	55                   	push   %ebp
 3e6:	89 e5                	mov    %esp,%ebp
 3e8:	56                   	push   %esi
 3e9:	53                   	push   %ebx
 3ea:	83 ec 08             	sub    $0x8,%esp
 3ed:	6a 00                	push   $0x0
 3ef:	ff 75 08             	push   0x8(%ebp)
 3f2:	e8 e4 00 00 00       	call   4db <open>
 3f7:	83 c4 10             	add    $0x10,%esp
 3fa:	85 c0                	test   %eax,%eax
 3fc:	78 24                	js     422 <stat+0x3d>
 3fe:	89 c3                	mov    %eax,%ebx
 400:	83 ec 08             	sub    $0x8,%esp
 403:	ff 75 0c             	push   0xc(%ebp)
 406:	50                   	push   %eax
 407:	e8 e7 00 00 00       	call   4f3 <fstat>
 40c:	89 c6                	mov    %eax,%esi
 40e:	89 1c 24             	mov    %ebx,(%esp)
 411:	e8 ad 00 00 00       	call   4c3 <close>
 416:	83 c4 10             	add    $0x10,%esp
 419:	89 f0                	mov    %esi,%eax
 41b:	8d 65 f8             	lea    -0x8(%ebp),%esp
 41e:	5b                   	pop    %ebx
 41f:	5e                   	pop    %esi
 420:	5d                   	pop    %ebp
 421:	c3                   	ret
 422:	be ff ff ff ff       	mov    $0xffffffff,%esi
 427:	eb f0                	jmp    419 <stat+0x34>

00000429 <atoi>:
 429:	55                   	push   %ebp
 42a:	89 e5                	mov    %esp,%ebp
 42c:	53                   	push   %ebx
 42d:	8b 55 08             	mov    0x8(%ebp),%edx
 430:	0f b6 02             	movzbl (%edx),%eax
 433:	8d 48 d0             	lea    -0x30(%eax),%ecx
 436:	80 f9 09             	cmp    $0x9,%cl
 439:	77 24                	ja     45f <atoi+0x36>
 43b:	b9 00 00 00 00       	mov    $0x0,%ecx
 440:	83 c2 01             	add    $0x1,%edx
 443:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 446:	0f be c0             	movsbl %al,%eax
 449:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
 44d:	0f b6 02             	movzbl (%edx),%eax
 450:	8d 58 d0             	lea    -0x30(%eax),%ebx
 453:	80 fb 09             	cmp    $0x9,%bl
 456:	76 e8                	jbe    440 <atoi+0x17>
 458:	89 c8                	mov    %ecx,%eax
 45a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 45d:	c9                   	leave
 45e:	c3                   	ret
 45f:	b9 00 00 00 00       	mov    $0x0,%ecx
 464:	eb f2                	jmp    458 <atoi+0x2f>

00000466 <memmove>:
 466:	55                   	push   %ebp
 467:	89 e5                	mov    %esp,%ebp
 469:	56                   	push   %esi
 46a:	53                   	push   %ebx
 46b:	8b 75 08             	mov    0x8(%ebp),%esi
 46e:	8b 55 0c             	mov    0xc(%ebp),%edx
 471:	8b 5d 10             	mov    0x10(%ebp),%ebx
 474:	85 db                	test   %ebx,%ebx
 476:	7e 15                	jle    48d <memmove+0x27>
 478:	01 f3                	add    %esi,%ebx
 47a:	89 f0                	mov    %esi,%eax
 47c:	83 c2 01             	add    $0x1,%edx
 47f:	83 c0 01             	add    $0x1,%eax
 482:	0f b6 4a ff          	movzbl -0x1(%edx),%ecx
 486:	88 48 ff             	mov    %cl,-0x1(%eax)
 489:	39 c3                	cmp    %eax,%ebx
 48b:	75 ef                	jne    47c <memmove+0x16>
 48d:	89 f0                	mov    %esi,%eax
 48f:	5b                   	pop    %ebx
 490:	5e                   	pop    %esi
 491:	5d                   	pop    %ebp
 492:	c3                   	ret

00000493 <fork>:
  name: \
    movl $1, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALLFORK(fork) //instead of SYSCALL(fork) !!!
 493:	b8 01 00 00 00       	mov    $0x1,%eax
 498:	cd 40                	int    $0x40
 49a:	c3                   	ret

0000049b <exit>:
//SYSCALL(fork)
SYSCALL(exit)
 49b:	b8 02 00 00 00       	mov    $0x2,%eax
 4a0:	cd 40                	int    $0x40
 4a2:	c3                   	ret

000004a3 <wait>:
SYSCALL(wait)
 4a3:	b8 03 00 00 00       	mov    $0x3,%eax
 4a8:	cd 40                	int    $0x40
 4aa:	c3                   	ret

000004ab <pipe>:
SYSCALL(pipe)
 4ab:	b8 04 00 00 00       	mov    $0x4,%eax
 4b0:	cd 40                	int    $0x40
 4b2:	c3                   	ret

000004b3 <read>:
SYSCALL(read)
 4b3:	b8 05 00 00 00       	mov    $0x5,%eax
 4b8:	cd 40                	int    $0x40
 4ba:	c3                   	ret

000004bb <write>:
SYSCALL(write)
 4bb:	b8 10 00 00 00       	mov    $0x10,%eax
 4c0:	cd 40                	int    $0x40
 4c2:	c3                   	ret

000004c3 <close>:
SYSCALL(close)
 4c3:	b8 15 00 00 00       	mov    $0x15,%eax
 4c8:	cd 40                	int    $0x40
 4ca:	c3                   	ret

000004cb <kill>:
SYSCALL(kill)
 4cb:	b8 06 00 00 00       	mov    $0x6,%eax
 4d0:	cd 40                	int    $0x40
 4d2:	c3                   	ret

000004d3 <exec>:
SYSCALL(exec)
 4d3:	b8 07 00 00 00       	mov    $0x7,%eax
 4d8:	cd 40                	int    $0x40
 4da:	c3                   	ret

000004db <open>:
SYSCALL(open)
 4db:	b8 0f 00 00 00       	mov    $0xf,%eax
 4e0:	cd 40                	int    $0x40
 4e2:	c3                   	ret

000004e3 <mknod>:
SYSCALL(mknod)
 4e3:	b8 11 00 00 00       	mov    $0x11,%eax
 4e8:	cd 40                	int    $0x40
 4ea:	c3                   	ret

000004eb <unlink>:
SYSCALL(unlink)
 4eb:	b8 12 00 00 00       	mov    $0x12,%eax
 4f0:	cd 40                	int    $0x40
 4f2:	c3                   	ret

000004f3 <fstat>:
SYSCALL(fstat)
 4f3:	b8 08 00 00 00       	mov    $0x8,%eax
 4f8:	cd 40                	int    $0x40
 4fa:	c3                   	ret

000004fb <link>:
SYSCALL(link)
 4fb:	b8 13 00 00 00       	mov    $0x13,%eax
 500:	cd 40                	int    $0x40
 502:	c3                   	ret

00000503 <mkdir>:
SYSCALL(mkdir)
 503:	b8 14 00 00 00       	mov    $0x14,%eax
 508:	cd 40                	int    $0x40
 50a:	c3                   	ret

0000050b <chdir>:
SYSCALL(chdir)
 50b:	b8 09 00 00 00       	mov    $0x9,%eax
 510:	cd 40                	int    $0x40
 512:	c3                   	ret

00000513 <dup>:
SYSCALL(dup)
 513:	b8 0a 00 00 00       	mov    $0xa,%eax
 518:	cd 40                	int    $0x40
 51a:	c3                   	ret

0000051b <getpid>:
SYSCALL(getpid)
 51b:	b8 0b 00 00 00       	mov    $0xb,%eax
 520:	cd 40                	int    $0x40
 522:	c3                   	ret

00000523 <sbrk>:
SYSCALL(sbrk)
 523:	b8 0c 00 00 00       	mov    $0xc,%eax
 528:	cd 40                	int    $0x40
 52a:	c3                   	ret

0000052b <sleep>:
SYSCALL(sleep)
 52b:	b8 0d 00 00 00       	mov    $0xd,%eax
 530:	cd 40                	int    $0x40
 532:	c3                   	ret

00000533 <uptime>:
SYSCALL(uptime)
 533:	b8 0e 00 00 00       	mov    $0xe,%eax
 538:	cd 40                	int    $0x40
 53a:	c3                   	ret

0000053b <ps>:
SYSCALL(ps)
 53b:	b8 16 00 00 00       	mov    $0x16,%eax
 540:	cd 40                	int    $0x40
 542:	c3                   	ret

00000543 <printint>:
 543:	55                   	push   %ebp
 544:	89 e5                	mov    %esp,%ebp
 546:	57                   	push   %edi
 547:	56                   	push   %esi
 548:	53                   	push   %ebx
 549:	83 ec 3c             	sub    $0x3c,%esp
 54c:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 54f:	89 ce                	mov    %ecx,%esi
 551:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 555:	74 79                	je     5d0 <printint+0x8d>
 557:	85 d2                	test   %edx,%edx
 559:	79 75                	jns    5d0 <printint+0x8d>
 55b:	89 d1                	mov    %edx,%ecx
 55d:	f7 d9                	neg    %ecx
 55f:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
 566:	bb 00 00 00 00       	mov    $0x0,%ebx
 56b:	89 df                	mov    %ebx,%edi
 56d:	83 c3 01             	add    $0x1,%ebx
 570:	89 c8                	mov    %ecx,%eax
 572:	ba 00 00 00 00       	mov    $0x0,%edx
 577:	f7 f6                	div    %esi
 579:	0f b6 92 7c 09 00 00 	movzbl 0x97c(%edx),%edx
 580:	88 54 1d d7          	mov    %dl,-0x29(%ebp,%ebx,1)
 584:	89 ca                	mov    %ecx,%edx
 586:	89 c1                	mov    %eax,%ecx
 588:	39 f2                	cmp    %esi,%edx
 58a:	73 df                	jae    56b <printint+0x28>
 58c:	83 7d c0 00          	cmpl   $0x0,-0x40(%ebp)
 590:	74 08                	je     59a <printint+0x57>
 592:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
 597:	8d 5f 02             	lea    0x2(%edi),%ebx
 59a:	85 db                	test   %ebx,%ebx
 59c:	7e 2a                	jle    5c8 <printint+0x85>
 59e:	8d 75 d8             	lea    -0x28(%ebp),%esi
 5a1:	8d 5c 1d d7          	lea    -0x29(%ebp,%ebx,1),%ebx
 5a5:	8d 7d d7             	lea    -0x29(%ebp),%edi
 5a8:	0f b6 03             	movzbl (%ebx),%eax
 5ab:	88 45 d7             	mov    %al,-0x29(%ebp)
 5ae:	83 ec 04             	sub    $0x4,%esp
 5b1:	6a 01                	push   $0x1
 5b3:	57                   	push   %edi
 5b4:	ff 75 c4             	push   -0x3c(%ebp)
 5b7:	e8 ff fe ff ff       	call   4bb <write>
 5bc:	89 d8                	mov    %ebx,%eax
 5be:	83 eb 01             	sub    $0x1,%ebx
 5c1:	83 c4 10             	add    $0x10,%esp
 5c4:	39 f0                	cmp    %esi,%eax
 5c6:	75 e0                	jne    5a8 <printint+0x65>
 5c8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5cb:	5b                   	pop    %ebx
 5cc:	5e                   	pop    %esi
 5cd:	5f                   	pop    %edi
 5ce:	5d                   	pop    %ebp
 5cf:	c3                   	ret
 5d0:	89 d1                	mov    %edx,%ecx
 5d2:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
 5d9:	eb 8b                	jmp    566 <printint+0x23>

000005db <printf>:
 5db:	55                   	push   %ebp
 5dc:	89 e5                	mov    %esp,%ebp
 5de:	57                   	push   %edi
 5df:	56                   	push   %esi
 5e0:	53                   	push   %ebx
 5e1:	83 ec 2c             	sub    $0x2c,%esp
 5e4:	8b 75 0c             	mov    0xc(%ebp),%esi
 5e7:	0f b6 1e             	movzbl (%esi),%ebx
 5ea:	84 db                	test   %bl,%bl
 5ec:	0f 84 9e 01 00 00    	je     790 <printf+0x1b5>
 5f2:	83 c6 01             	add    $0x1,%esi
 5f5:	8d 45 10             	lea    0x10(%ebp),%eax
 5f8:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 5fb:	bf 00 00 00 00       	mov    $0x0,%edi
 600:	eb 2d                	jmp    62f <printf+0x54>
 602:	88 5d e7             	mov    %bl,-0x19(%ebp)
 605:	83 ec 04             	sub    $0x4,%esp
 608:	6a 01                	push   $0x1
 60a:	8d 45 e7             	lea    -0x19(%ebp),%eax
 60d:	50                   	push   %eax
 60e:	ff 75 08             	push   0x8(%ebp)
 611:	e8 a5 fe ff ff       	call   4bb <write>
 616:	83 c4 10             	add    $0x10,%esp
 619:	eb 05                	jmp    620 <printf+0x45>
 61b:	83 ff 25             	cmp    $0x25,%edi
 61e:	74 1f                	je     63f <printf+0x64>
 620:	83 c6 01             	add    $0x1,%esi
 623:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 627:	84 db                	test   %bl,%bl
 629:	0f 84 61 01 00 00    	je     790 <printf+0x1b5>
 62f:	0f b6 c3             	movzbl %bl,%eax
 632:	85 ff                	test   %edi,%edi
 634:	75 e5                	jne    61b <printf+0x40>
 636:	83 f8 25             	cmp    $0x25,%eax
 639:	75 c7                	jne    602 <printf+0x27>
 63b:	89 c7                	mov    %eax,%edi
 63d:	eb e1                	jmp    620 <printf+0x45>
 63f:	83 f8 25             	cmp    $0x25,%eax
 642:	0f 84 f4 00 00 00    	je     73c <printf+0x161>
 648:	8d 50 9d             	lea    -0x63(%eax),%edx
 64b:	83 fa 15             	cmp    $0x15,%edx
 64e:	0f 87 09 01 00 00    	ja     75d <printf+0x182>
 654:	0f 87 03 01 00 00    	ja     75d <printf+0x182>
 65a:	ff 24 95 24 09 00 00 	jmp    *0x924(,%edx,4)
 661:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 664:	8b 17                	mov    (%edi),%edx
 666:	83 ec 0c             	sub    $0xc,%esp
 669:	6a 01                	push   $0x1
 66b:	b9 0a 00 00 00       	mov    $0xa,%ecx
 670:	8b 45 08             	mov    0x8(%ebp),%eax
 673:	e8 cb fe ff ff       	call   543 <printint>
 678:	83 c7 04             	add    $0x4,%edi
 67b:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 67e:	83 c4 10             	add    $0x10,%esp
 681:	bf 00 00 00 00       	mov    $0x0,%edi
 686:	eb 98                	jmp    620 <printf+0x45>
 688:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 68b:	8b 17                	mov    (%edi),%edx
 68d:	83 ec 0c             	sub    $0xc,%esp
 690:	6a 00                	push   $0x0
 692:	b9 10 00 00 00       	mov    $0x10,%ecx
 697:	8b 45 08             	mov    0x8(%ebp),%eax
 69a:	e8 a4 fe ff ff       	call   543 <printint>
 69f:	83 c7 04             	add    $0x4,%edi
 6a2:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 6a5:	83 c4 10             	add    $0x10,%esp
 6a8:	bf 00 00 00 00       	mov    $0x0,%edi
 6ad:	e9 6e ff ff ff       	jmp    620 <printf+0x45>
 6b2:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
 6b5:	8b 01                	mov    (%ecx),%eax
 6b7:	83 c1 04             	add    $0x4,%ecx
 6ba:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
 6bd:	85 c0                	test   %eax,%eax
 6bf:	74 13                	je     6d4 <printf+0xf9>
 6c1:	89 c3                	mov    %eax,%ebx
 6c3:	0f b6 00             	movzbl (%eax),%eax
 6c6:	bf 00 00 00 00       	mov    $0x0,%edi
 6cb:	84 c0                	test   %al,%al
 6cd:	75 0f                	jne    6de <printf+0x103>
 6cf:	e9 4c ff ff ff       	jmp    620 <printf+0x45>
 6d4:	bb 1a 09 00 00       	mov    $0x91a,%ebx
 6d9:	b8 28 00 00 00       	mov    $0x28,%eax
 6de:	8d 7d e7             	lea    -0x19(%ebp),%edi
 6e1:	89 75 d0             	mov    %esi,-0x30(%ebp)
 6e4:	8b 75 08             	mov    0x8(%ebp),%esi
 6e7:	88 45 e7             	mov    %al,-0x19(%ebp)
 6ea:	83 ec 04             	sub    $0x4,%esp
 6ed:	6a 01                	push   $0x1
 6ef:	57                   	push   %edi
 6f0:	56                   	push   %esi
 6f1:	e8 c5 fd ff ff       	call   4bb <write>
 6f6:	83 c3 01             	add    $0x1,%ebx
 6f9:	0f b6 03             	movzbl (%ebx),%eax
 6fc:	83 c4 10             	add    $0x10,%esp
 6ff:	84 c0                	test   %al,%al
 701:	75 e4                	jne    6e7 <printf+0x10c>
 703:	8b 75 d0             	mov    -0x30(%ebp),%esi
 706:	bf 00 00 00 00       	mov    $0x0,%edi
 70b:	e9 10 ff ff ff       	jmp    620 <printf+0x45>
 710:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 713:	8b 07                	mov    (%edi),%eax
 715:	88 45 e7             	mov    %al,-0x19(%ebp)
 718:	83 ec 04             	sub    $0x4,%esp
 71b:	6a 01                	push   $0x1
 71d:	8d 45 e7             	lea    -0x19(%ebp),%eax
 720:	50                   	push   %eax
 721:	ff 75 08             	push   0x8(%ebp)
 724:	e8 92 fd ff ff       	call   4bb <write>
 729:	83 c7 04             	add    $0x4,%edi
 72c:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 72f:	83 c4 10             	add    $0x10,%esp
 732:	bf 00 00 00 00       	mov    $0x0,%edi
 737:	e9 e4 fe ff ff       	jmp    620 <printf+0x45>
 73c:	88 5d e7             	mov    %bl,-0x19(%ebp)
 73f:	83 ec 04             	sub    $0x4,%esp
 742:	6a 01                	push   $0x1
 744:	8d 45 e7             	lea    -0x19(%ebp),%eax
 747:	50                   	push   %eax
 748:	ff 75 08             	push   0x8(%ebp)
 74b:	e8 6b fd ff ff       	call   4bb <write>
 750:	83 c4 10             	add    $0x10,%esp
 753:	bf 00 00 00 00       	mov    $0x0,%edi
 758:	e9 c3 fe ff ff       	jmp    620 <printf+0x45>
 75d:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 761:	83 ec 04             	sub    $0x4,%esp
 764:	6a 01                	push   $0x1
 766:	8d 7d e7             	lea    -0x19(%ebp),%edi
 769:	57                   	push   %edi
 76a:	ff 75 08             	push   0x8(%ebp)
 76d:	e8 49 fd ff ff       	call   4bb <write>
 772:	88 5d e7             	mov    %bl,-0x19(%ebp)
 775:	83 c4 0c             	add    $0xc,%esp
 778:	6a 01                	push   $0x1
 77a:	57                   	push   %edi
 77b:	ff 75 08             	push   0x8(%ebp)
 77e:	e8 38 fd ff ff       	call   4bb <write>
 783:	83 c4 10             	add    $0x10,%esp
 786:	bf 00 00 00 00       	mov    $0x0,%edi
 78b:	e9 90 fe ff ff       	jmp    620 <printf+0x45>
 790:	8d 65 f4             	lea    -0xc(%ebp),%esp
 793:	5b                   	pop    %ebx
 794:	5e                   	pop    %esi
 795:	5f                   	pop    %edi
 796:	5d                   	pop    %ebp
 797:	c3                   	ret

00000798 <free>:
 798:	55                   	push   %ebp
 799:	89 e5                	mov    %esp,%ebp
 79b:	57                   	push   %edi
 79c:	56                   	push   %esi
 79d:	53                   	push   %ebx
 79e:	8b 5d 08             	mov    0x8(%ebp),%ebx
 7a1:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 7a4:	a1 5c 0c 00 00       	mov    0xc5c,%eax
 7a9:	eb 0c                	jmp    7b7 <free+0x1f>
 7ab:	8b 10                	mov    (%eax),%edx
 7ad:	39 d0                	cmp    %edx,%eax
 7af:	72 04                	jb     7b5 <free+0x1d>
 7b1:	39 d1                	cmp    %edx,%ecx
 7b3:	72 10                	jb     7c5 <free+0x2d>
 7b5:	89 d0                	mov    %edx,%eax
 7b7:	39 c8                	cmp    %ecx,%eax
 7b9:	73 f0                	jae    7ab <free+0x13>
 7bb:	8b 10                	mov    (%eax),%edx
 7bd:	39 d1                	cmp    %edx,%ecx
 7bf:	72 04                	jb     7c5 <free+0x2d>
 7c1:	39 d0                	cmp    %edx,%eax
 7c3:	72 f0                	jb     7b5 <free+0x1d>
 7c5:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7c8:	8b 10                	mov    (%eax),%edx
 7ca:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7cd:	39 fa                	cmp    %edi,%edx
 7cf:	74 19                	je     7ea <free+0x52>
 7d1:	89 53 f8             	mov    %edx,-0x8(%ebx)
 7d4:	8b 50 04             	mov    0x4(%eax),%edx
 7d7:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7da:	39 f1                	cmp    %esi,%ecx
 7dc:	74 18                	je     7f6 <free+0x5e>
 7de:	89 08                	mov    %ecx,(%eax)
 7e0:	a3 5c 0c 00 00       	mov    %eax,0xc5c
 7e5:	5b                   	pop    %ebx
 7e6:	5e                   	pop    %esi
 7e7:	5f                   	pop    %edi
 7e8:	5d                   	pop    %ebp
 7e9:	c3                   	ret
 7ea:	03 72 04             	add    0x4(%edx),%esi
 7ed:	89 73 fc             	mov    %esi,-0x4(%ebx)
 7f0:	8b 10                	mov    (%eax),%edx
 7f2:	8b 12                	mov    (%edx),%edx
 7f4:	eb db                	jmp    7d1 <free+0x39>
 7f6:	03 53 fc             	add    -0x4(%ebx),%edx
 7f9:	89 50 04             	mov    %edx,0x4(%eax)
 7fc:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 7ff:	eb dd                	jmp    7de <free+0x46>

00000801 <malloc>:
 801:	55                   	push   %ebp
 802:	89 e5                	mov    %esp,%ebp
 804:	57                   	push   %edi
 805:	56                   	push   %esi
 806:	53                   	push   %ebx
 807:	83 ec 0c             	sub    $0xc,%esp
 80a:	8b 45 08             	mov    0x8(%ebp),%eax
 80d:	8d 58 07             	lea    0x7(%eax),%ebx
 810:	c1 eb 03             	shr    $0x3,%ebx
 813:	83 c3 01             	add    $0x1,%ebx
 816:	8b 15 5c 0c 00 00    	mov    0xc5c,%edx
 81c:	85 d2                	test   %edx,%edx
 81e:	74 1c                	je     83c <malloc+0x3b>
 820:	8b 02                	mov    (%edx),%eax
 822:	8b 48 04             	mov    0x4(%eax),%ecx
 825:	39 d9                	cmp    %ebx,%ecx
 827:	73 38                	jae    861 <malloc+0x60>
 829:	be 00 10 00 00       	mov    $0x1000,%esi
 82e:	39 f3                	cmp    %esi,%ebx
 830:	0f 43 f3             	cmovae %ebx,%esi
 833:	8d 3c f5 00 00 00 00 	lea    0x0(,%esi,8),%edi
 83a:	eb 72                	jmp    8ae <malloc+0xad>
 83c:	c7 05 5c 0c 00 00 60 	movl   $0xc60,0xc5c
 843:	0c 00 00 
 846:	c7 05 60 0c 00 00 60 	movl   $0xc60,0xc60
 84d:	0c 00 00 
 850:	c7 05 64 0c 00 00 00 	movl   $0x0,0xc64
 857:	00 00 00 
 85a:	b8 60 0c 00 00       	mov    $0xc60,%eax
 85f:	eb c8                	jmp    829 <malloc+0x28>
 861:	39 cb                	cmp    %ecx,%ebx
 863:	74 1e                	je     883 <malloc+0x82>
 865:	29 d9                	sub    %ebx,%ecx
 867:	89 48 04             	mov    %ecx,0x4(%eax)
 86a:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 86d:	89 58 04             	mov    %ebx,0x4(%eax)
 870:	89 15 5c 0c 00 00    	mov    %edx,0xc5c
 876:	8d 50 08             	lea    0x8(%eax),%edx
 879:	89 d0                	mov    %edx,%eax
 87b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 87e:	5b                   	pop    %ebx
 87f:	5e                   	pop    %esi
 880:	5f                   	pop    %edi
 881:	5d                   	pop    %ebp
 882:	c3                   	ret
 883:	8b 08                	mov    (%eax),%ecx
 885:	89 0a                	mov    %ecx,(%edx)
 887:	eb e7                	jmp    870 <malloc+0x6f>
 889:	89 70 04             	mov    %esi,0x4(%eax)
 88c:	83 ec 0c             	sub    $0xc,%esp
 88f:	83 c0 08             	add    $0x8,%eax
 892:	50                   	push   %eax
 893:	e8 00 ff ff ff       	call   798 <free>
 898:	8b 15 5c 0c 00 00    	mov    0xc5c,%edx
 89e:	83 c4 10             	add    $0x10,%esp
 8a1:	85 d2                	test   %edx,%edx
 8a3:	74 d4                	je     879 <malloc+0x78>
 8a5:	8b 02                	mov    (%edx),%eax
 8a7:	8b 48 04             	mov    0x4(%eax),%ecx
 8aa:	39 d9                	cmp    %ebx,%ecx
 8ac:	73 b3                	jae    861 <malloc+0x60>
 8ae:	89 c2                	mov    %eax,%edx
 8b0:	39 05 5c 0c 00 00    	cmp    %eax,0xc5c
 8b6:	75 ed                	jne    8a5 <malloc+0xa4>
 8b8:	83 ec 0c             	sub    $0xc,%esp
 8bb:	57                   	push   %edi
 8bc:	e8 62 fc ff ff       	call   523 <sbrk>
 8c1:	83 c4 10             	add    $0x10,%esp
 8c4:	83 f8 ff             	cmp    $0xffffffff,%eax
 8c7:	75 c0                	jne    889 <malloc+0x88>
 8c9:	ba 00 00 00 00       	mov    $0x0,%edx
 8ce:	eb a9                	jmp    879 <malloc+0x78>
