
_usertests:     file format elf32-i386


Disassembly of section .text:

00000000 <iputtest>:
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	83 ec 10             	sub    $0x10,%esp
       6:	68 28 3c 00 00       	push   $0x3c28
       b:	ff 35 fc 5b 00 00    	push   0x5bfc
      11:	e8 86 38 00 00       	call   389c <printf>
      16:	c7 04 24 bb 3b 00 00 	movl   $0x3bbb,(%esp)
      1d:	e8 a2 37 00 00       	call   37c4 <mkdir>
      22:	83 c4 10             	add    $0x10,%esp
      25:	85 c0                	test   %eax,%eax
      27:	78 54                	js     7d <iputtest+0x7d>
      29:	83 ec 0c             	sub    $0xc,%esp
      2c:	68 bb 3b 00 00       	push   $0x3bbb
      31:	e8 96 37 00 00       	call   37cc <chdir>
      36:	83 c4 10             	add    $0x10,%esp
      39:	85 c0                	test   %eax,%eax
      3b:	78 58                	js     95 <iputtest+0x95>
      3d:	83 ec 0c             	sub    $0xc,%esp
      40:	68 b8 3b 00 00       	push   $0x3bb8
      45:	e8 62 37 00 00       	call   37ac <unlink>
      4a:	83 c4 10             	add    $0x10,%esp
      4d:	85 c0                	test   %eax,%eax
      4f:	78 5c                	js     ad <iputtest+0xad>
      51:	83 ec 0c             	sub    $0xc,%esp
      54:	68 dd 3b 00 00       	push   $0x3bdd
      59:	e8 6e 37 00 00       	call   37cc <chdir>
      5e:	83 c4 10             	add    $0x10,%esp
      61:	85 c0                	test   %eax,%eax
      63:	78 60                	js     c5 <iputtest+0xc5>
      65:	83 ec 08             	sub    $0x8,%esp
      68:	68 60 3c 00 00       	push   $0x3c60
      6d:	ff 35 fc 5b 00 00    	push   0x5bfc
      73:	e8 24 38 00 00       	call   389c <printf>
      78:	83 c4 10             	add    $0x10,%esp
      7b:	c9                   	leave
      7c:	c3                   	ret
      7d:	83 ec 08             	sub    $0x8,%esp
      80:	68 94 3b 00 00       	push   $0x3b94
      85:	ff 35 fc 5b 00 00    	push   0x5bfc
      8b:	e8 0c 38 00 00       	call   389c <printf>
      90:	e8 c7 36 00 00       	call   375c <exit>
      95:	83 ec 08             	sub    $0x8,%esp
      98:	68 a2 3b 00 00       	push   $0x3ba2
      9d:	ff 35 fc 5b 00 00    	push   0x5bfc
      a3:	e8 f4 37 00 00       	call   389c <printf>
      a8:	e8 af 36 00 00       	call   375c <exit>
      ad:	83 ec 08             	sub    $0x8,%esp
      b0:	68 c3 3b 00 00       	push   $0x3bc3
      b5:	ff 35 fc 5b 00 00    	push   0x5bfc
      bb:	e8 dc 37 00 00       	call   389c <printf>
      c0:	e8 97 36 00 00       	call   375c <exit>
      c5:	83 ec 08             	sub    $0x8,%esp
      c8:	68 df 3b 00 00       	push   $0x3bdf
      cd:	ff 35 fc 5b 00 00    	push   0x5bfc
      d3:	e8 c4 37 00 00       	call   389c <printf>
      d8:	e8 7f 36 00 00       	call   375c <exit>

000000dd <exitiputtest>:
      dd:	55                   	push   %ebp
      de:	89 e5                	mov    %esp,%ebp
      e0:	83 ec 10             	sub    $0x10,%esp
      e3:	68 ef 3b 00 00       	push   $0x3bef
      e8:	ff 35 fc 5b 00 00    	push   0x5bfc
      ee:	e8 a9 37 00 00       	call   389c <printf>
      f3:	e8 5c 36 00 00       	call   3754 <fork>
      f8:	83 c4 10             	add    $0x10,%esp
      fb:	85 c0                	test   %eax,%eax
      fd:	78 47                	js     146 <exitiputtest+0x69>
      ff:	0f 85 a1 00 00 00    	jne    1a6 <exitiputtest+0xc9>
     105:	83 ec 0c             	sub    $0xc,%esp
     108:	68 bb 3b 00 00       	push   $0x3bbb
     10d:	e8 b2 36 00 00       	call   37c4 <mkdir>
     112:	83 c4 10             	add    $0x10,%esp
     115:	85 c0                	test   %eax,%eax
     117:	78 45                	js     15e <exitiputtest+0x81>
     119:	83 ec 0c             	sub    $0xc,%esp
     11c:	68 bb 3b 00 00       	push   $0x3bbb
     121:	e8 a6 36 00 00       	call   37cc <chdir>
     126:	83 c4 10             	add    $0x10,%esp
     129:	85 c0                	test   %eax,%eax
     12b:	78 49                	js     176 <exitiputtest+0x99>
     12d:	83 ec 0c             	sub    $0xc,%esp
     130:	68 b8 3b 00 00       	push   $0x3bb8
     135:	e8 72 36 00 00       	call   37ac <unlink>
     13a:	83 c4 10             	add    $0x10,%esp
     13d:	85 c0                	test   %eax,%eax
     13f:	78 4d                	js     18e <exitiputtest+0xb1>
     141:	e8 16 36 00 00       	call   375c <exit>
     146:	83 ec 08             	sub    $0x8,%esp
     149:	68 d5 4a 00 00       	push   $0x4ad5
     14e:	ff 35 fc 5b 00 00    	push   0x5bfc
     154:	e8 43 37 00 00       	call   389c <printf>
     159:	e8 fe 35 00 00       	call   375c <exit>
     15e:	83 ec 08             	sub    $0x8,%esp
     161:	68 94 3b 00 00       	push   $0x3b94
     166:	ff 35 fc 5b 00 00    	push   0x5bfc
     16c:	e8 2b 37 00 00       	call   389c <printf>
     171:	e8 e6 35 00 00       	call   375c <exit>
     176:	83 ec 08             	sub    $0x8,%esp
     179:	68 fe 3b 00 00       	push   $0x3bfe
     17e:	ff 35 fc 5b 00 00    	push   0x5bfc
     184:	e8 13 37 00 00       	call   389c <printf>
     189:	e8 ce 35 00 00       	call   375c <exit>
     18e:	83 ec 08             	sub    $0x8,%esp
     191:	68 c3 3b 00 00       	push   $0x3bc3
     196:	ff 35 fc 5b 00 00    	push   0x5bfc
     19c:	e8 fb 36 00 00       	call   389c <printf>
     1a1:	e8 b6 35 00 00       	call   375c <exit>
     1a6:	e8 b9 35 00 00       	call   3764 <wait>
     1ab:	83 ec 08             	sub    $0x8,%esp
     1ae:	68 12 3c 00 00       	push   $0x3c12
     1b3:	ff 35 fc 5b 00 00    	push   0x5bfc
     1b9:	e8 de 36 00 00       	call   389c <printf>
     1be:	83 c4 10             	add    $0x10,%esp
     1c1:	c9                   	leave
     1c2:	c3                   	ret

000001c3 <openiputtest>:
     1c3:	55                   	push   %ebp
     1c4:	89 e5                	mov    %esp,%ebp
     1c6:	83 ec 10             	sub    $0x10,%esp
     1c9:	68 24 3c 00 00       	push   $0x3c24
     1ce:	ff 35 fc 5b 00 00    	push   0x5bfc
     1d4:	e8 c3 36 00 00       	call   389c <printf>
     1d9:	c7 04 24 33 3c 00 00 	movl   $0x3c33,(%esp)
     1e0:	e8 df 35 00 00       	call   37c4 <mkdir>
     1e5:	83 c4 10             	add    $0x10,%esp
     1e8:	85 c0                	test   %eax,%eax
     1ea:	78 39                	js     225 <openiputtest+0x62>
     1ec:	e8 63 35 00 00       	call   3754 <fork>
     1f1:	85 c0                	test   %eax,%eax
     1f3:	78 48                	js     23d <openiputtest+0x7a>
     1f5:	75 63                	jne    25a <openiputtest+0x97>
     1f7:	83 ec 08             	sub    $0x8,%esp
     1fa:	6a 02                	push   $0x2
     1fc:	68 33 3c 00 00       	push   $0x3c33
     201:	e8 96 35 00 00       	call   379c <open>
     206:	83 c4 10             	add    $0x10,%esp
     209:	85 c0                	test   %eax,%eax
     20b:	78 48                	js     255 <openiputtest+0x92>
     20d:	83 ec 08             	sub    $0x8,%esp
     210:	68 bc 4b 00 00       	push   $0x4bbc
     215:	ff 35 fc 5b 00 00    	push   0x5bfc
     21b:	e8 7c 36 00 00       	call   389c <printf>
     220:	e8 37 35 00 00       	call   375c <exit>
     225:	83 ec 08             	sub    $0x8,%esp
     228:	68 39 3c 00 00       	push   $0x3c39
     22d:	ff 35 fc 5b 00 00    	push   0x5bfc
     233:	e8 64 36 00 00       	call   389c <printf>
     238:	e8 1f 35 00 00       	call   375c <exit>
     23d:	83 ec 08             	sub    $0x8,%esp
     240:	68 d5 4a 00 00       	push   $0x4ad5
     245:	ff 35 fc 5b 00 00    	push   0x5bfc
     24b:	e8 4c 36 00 00       	call   389c <printf>
     250:	e8 07 35 00 00       	call   375c <exit>
     255:	e8 02 35 00 00       	call   375c <exit>
     25a:	83 ec 0c             	sub    $0xc,%esp
     25d:	6a 01                	push   $0x1
     25f:	e8 88 35 00 00       	call   37ec <sleep>
     264:	c7 04 24 33 3c 00 00 	movl   $0x3c33,(%esp)
     26b:	e8 3c 35 00 00       	call   37ac <unlink>
     270:	83 c4 10             	add    $0x10,%esp
     273:	85 c0                	test   %eax,%eax
     275:	75 1d                	jne    294 <openiputtest+0xd1>
     277:	e8 e8 34 00 00       	call   3764 <wait>
     27c:	83 ec 08             	sub    $0x8,%esp
     27f:	68 5c 3c 00 00       	push   $0x3c5c
     284:	ff 35 fc 5b 00 00    	push   0x5bfc
     28a:	e8 0d 36 00 00       	call   389c <printf>
     28f:	83 c4 10             	add    $0x10,%esp
     292:	c9                   	leave
     293:	c3                   	ret
     294:	83 ec 08             	sub    $0x8,%esp
     297:	68 4d 3c 00 00       	push   $0x3c4d
     29c:	ff 35 fc 5b 00 00    	push   0x5bfc
     2a2:	e8 f5 35 00 00       	call   389c <printf>
     2a7:	e8 b0 34 00 00       	call   375c <exit>

000002ac <opentest>:
     2ac:	55                   	push   %ebp
     2ad:	89 e5                	mov    %esp,%ebp
     2af:	83 ec 10             	sub    $0x10,%esp
     2b2:	68 6e 3c 00 00       	push   $0x3c6e
     2b7:	ff 35 fc 5b 00 00    	push   0x5bfc
     2bd:	e8 da 35 00 00       	call   389c <printf>
     2c2:	83 c4 08             	add    $0x8,%esp
     2c5:	6a 00                	push   $0x0
     2c7:	68 79 3c 00 00       	push   $0x3c79
     2cc:	e8 cb 34 00 00       	call   379c <open>
     2d1:	83 c4 10             	add    $0x10,%esp
     2d4:	85 c0                	test   %eax,%eax
     2d6:	78 37                	js     30f <opentest+0x63>
     2d8:	83 ec 0c             	sub    $0xc,%esp
     2db:	50                   	push   %eax
     2dc:	e8 a3 34 00 00       	call   3784 <close>
     2e1:	83 c4 08             	add    $0x8,%esp
     2e4:	6a 00                	push   $0x0
     2e6:	68 91 3c 00 00       	push   $0x3c91
     2eb:	e8 ac 34 00 00       	call   379c <open>
     2f0:	83 c4 10             	add    $0x10,%esp
     2f3:	85 c0                	test   %eax,%eax
     2f5:	79 30                	jns    327 <opentest+0x7b>
     2f7:	83 ec 08             	sub    $0x8,%esp
     2fa:	68 bc 3c 00 00       	push   $0x3cbc
     2ff:	ff 35 fc 5b 00 00    	push   0x5bfc
     305:	e8 92 35 00 00       	call   389c <printf>
     30a:	83 c4 10             	add    $0x10,%esp
     30d:	c9                   	leave
     30e:	c3                   	ret
     30f:	83 ec 08             	sub    $0x8,%esp
     312:	68 7e 3c 00 00       	push   $0x3c7e
     317:	ff 35 fc 5b 00 00    	push   0x5bfc
     31d:	e8 7a 35 00 00       	call   389c <printf>
     322:	e8 35 34 00 00       	call   375c <exit>
     327:	83 ec 08             	sub    $0x8,%esp
     32a:	68 9e 3c 00 00       	push   $0x3c9e
     32f:	ff 35 fc 5b 00 00    	push   0x5bfc
     335:	e8 62 35 00 00       	call   389c <printf>
     33a:	e8 1d 34 00 00       	call   375c <exit>

0000033f <writetest>:
     33f:	55                   	push   %ebp
     340:	89 e5                	mov    %esp,%ebp
     342:	56                   	push   %esi
     343:	53                   	push   %ebx
     344:	83 ec 08             	sub    $0x8,%esp
     347:	68 ca 3c 00 00       	push   $0x3cca
     34c:	ff 35 fc 5b 00 00    	push   0x5bfc
     352:	e8 45 35 00 00       	call   389c <printf>
     357:	83 c4 08             	add    $0x8,%esp
     35a:	68 02 02 00 00       	push   $0x202
     35f:	68 db 3c 00 00       	push   $0x3cdb
     364:	e8 33 34 00 00       	call   379c <open>
     369:	83 c4 10             	add    $0x10,%esp
     36c:	85 c0                	test   %eax,%eax
     36e:	0f 88 17 01 00 00    	js     48b <writetest+0x14c>
     374:	89 c6                	mov    %eax,%esi
     376:	83 ec 08             	sub    $0x8,%esp
     379:	68 e1 3c 00 00       	push   $0x3ce1
     37e:	ff 35 fc 5b 00 00    	push   0x5bfc
     384:	e8 13 35 00 00       	call   389c <printf>
     389:	83 c4 10             	add    $0x10,%esp
     38c:	bb 00 00 00 00       	mov    $0x0,%ebx
     391:	83 ec 04             	sub    $0x4,%esp
     394:	6a 0a                	push   $0xa
     396:	68 18 3d 00 00       	push   $0x3d18
     39b:	56                   	push   %esi
     39c:	e8 db 33 00 00       	call   377c <write>
     3a1:	83 c4 10             	add    $0x10,%esp
     3a4:	83 f8 0a             	cmp    $0xa,%eax
     3a7:	0f 85 f6 00 00 00    	jne    4a3 <writetest+0x164>
     3ad:	83 ec 04             	sub    $0x4,%esp
     3b0:	6a 0a                	push   $0xa
     3b2:	68 23 3d 00 00       	push   $0x3d23
     3b7:	56                   	push   %esi
     3b8:	e8 bf 33 00 00       	call   377c <write>
     3bd:	83 c4 10             	add    $0x10,%esp
     3c0:	83 f8 0a             	cmp    $0xa,%eax
     3c3:	0f 85 f3 00 00 00    	jne    4bc <writetest+0x17d>
     3c9:	83 c3 01             	add    $0x1,%ebx
     3cc:	83 fb 64             	cmp    $0x64,%ebx
     3cf:	75 c0                	jne    391 <writetest+0x52>
     3d1:	83 ec 08             	sub    $0x8,%esp
     3d4:	68 2e 3d 00 00       	push   $0x3d2e
     3d9:	ff 35 fc 5b 00 00    	push   0x5bfc
     3df:	e8 b8 34 00 00       	call   389c <printf>
     3e4:	89 34 24             	mov    %esi,(%esp)
     3e7:	e8 98 33 00 00       	call   3784 <close>
     3ec:	83 c4 08             	add    $0x8,%esp
     3ef:	6a 00                	push   $0x0
     3f1:	68 db 3c 00 00       	push   $0x3cdb
     3f6:	e8 a1 33 00 00       	call   379c <open>
     3fb:	89 c3                	mov    %eax,%ebx
     3fd:	83 c4 10             	add    $0x10,%esp
     400:	85 c0                	test   %eax,%eax
     402:	0f 88 cd 00 00 00    	js     4d5 <writetest+0x196>
     408:	83 ec 08             	sub    $0x8,%esp
     40b:	68 39 3d 00 00       	push   $0x3d39
     410:	ff 35 fc 5b 00 00    	push   0x5bfc
     416:	e8 81 34 00 00       	call   389c <printf>
     41b:	83 c4 0c             	add    $0xc,%esp
     41e:	68 d0 07 00 00       	push   $0x7d0
     423:	68 40 83 00 00       	push   $0x8340
     428:	53                   	push   %ebx
     429:	e8 46 33 00 00       	call   3774 <read>
     42e:	83 c4 10             	add    $0x10,%esp
     431:	3d d0 07 00 00       	cmp    $0x7d0,%eax
     436:	0f 85 b1 00 00 00    	jne    4ed <writetest+0x1ae>
     43c:	83 ec 08             	sub    $0x8,%esp
     43f:	68 6d 3d 00 00       	push   $0x3d6d
     444:	ff 35 fc 5b 00 00    	push   0x5bfc
     44a:	e8 4d 34 00 00       	call   389c <printf>
     44f:	89 1c 24             	mov    %ebx,(%esp)
     452:	e8 2d 33 00 00       	call   3784 <close>
     457:	c7 04 24 db 3c 00 00 	movl   $0x3cdb,(%esp)
     45e:	e8 49 33 00 00       	call   37ac <unlink>
     463:	83 c4 10             	add    $0x10,%esp
     466:	85 c0                	test   %eax,%eax
     468:	0f 88 97 00 00 00    	js     505 <writetest+0x1c6>
     46e:	83 ec 08             	sub    $0x8,%esp
     471:	68 95 3d 00 00       	push   $0x3d95
     476:	ff 35 fc 5b 00 00    	push   0x5bfc
     47c:	e8 1b 34 00 00       	call   389c <printf>
     481:	83 c4 10             	add    $0x10,%esp
     484:	8d 65 f8             	lea    -0x8(%ebp),%esp
     487:	5b                   	pop    %ebx
     488:	5e                   	pop    %esi
     489:	5d                   	pop    %ebp
     48a:	c3                   	ret
     48b:	83 ec 08             	sub    $0x8,%esp
     48e:	68 fc 3c 00 00       	push   $0x3cfc
     493:	ff 35 fc 5b 00 00    	push   0x5bfc
     499:	e8 fe 33 00 00       	call   389c <printf>
     49e:	e8 b9 32 00 00       	call   375c <exit>
     4a3:	83 ec 04             	sub    $0x4,%esp
     4a6:	53                   	push   %ebx
     4a7:	68 e0 4b 00 00       	push   $0x4be0
     4ac:	ff 35 fc 5b 00 00    	push   0x5bfc
     4b2:	e8 e5 33 00 00       	call   389c <printf>
     4b7:	e8 a0 32 00 00       	call   375c <exit>
     4bc:	83 ec 04             	sub    $0x4,%esp
     4bf:	53                   	push   %ebx
     4c0:	68 04 4c 00 00       	push   $0x4c04
     4c5:	ff 35 fc 5b 00 00    	push   0x5bfc
     4cb:	e8 cc 33 00 00       	call   389c <printf>
     4d0:	e8 87 32 00 00       	call   375c <exit>
     4d5:	83 ec 08             	sub    $0x8,%esp
     4d8:	68 52 3d 00 00       	push   $0x3d52
     4dd:	ff 35 fc 5b 00 00    	push   0x5bfc
     4e3:	e8 b4 33 00 00       	call   389c <printf>
     4e8:	e8 6f 32 00 00       	call   375c <exit>
     4ed:	83 ec 08             	sub    $0x8,%esp
     4f0:	68 99 40 00 00       	push   $0x4099
     4f5:	ff 35 fc 5b 00 00    	push   0x5bfc
     4fb:	e8 9c 33 00 00       	call   389c <printf>
     500:	e8 57 32 00 00       	call   375c <exit>
     505:	83 ec 08             	sub    $0x8,%esp
     508:	68 80 3d 00 00       	push   $0x3d80
     50d:	ff 35 fc 5b 00 00    	push   0x5bfc
     513:	e8 84 33 00 00       	call   389c <printf>
     518:	e8 3f 32 00 00       	call   375c <exit>

0000051d <writetest1>:
     51d:	55                   	push   %ebp
     51e:	89 e5                	mov    %esp,%ebp
     520:	56                   	push   %esi
     521:	53                   	push   %ebx
     522:	83 ec 08             	sub    $0x8,%esp
     525:	68 a9 3d 00 00       	push   $0x3da9
     52a:	ff 35 fc 5b 00 00    	push   0x5bfc
     530:	e8 67 33 00 00       	call   389c <printf>
     535:	83 c4 08             	add    $0x8,%esp
     538:	68 02 02 00 00       	push   $0x202
     53d:	68 23 3e 00 00       	push   $0x3e23
     542:	e8 55 32 00 00       	call   379c <open>
     547:	83 c4 10             	add    $0x10,%esp
     54a:	85 c0                	test   %eax,%eax
     54c:	0f 88 96 00 00 00    	js     5e8 <writetest1+0xcb>
     552:	89 c6                	mov    %eax,%esi
     554:	bb 00 00 00 00       	mov    $0x0,%ebx
     559:	89 1d 40 83 00 00    	mov    %ebx,0x8340
     55f:	83 ec 04             	sub    $0x4,%esp
     562:	68 00 02 00 00       	push   $0x200
     567:	68 40 83 00 00       	push   $0x8340
     56c:	56                   	push   %esi
     56d:	e8 0a 32 00 00       	call   377c <write>
     572:	83 c4 10             	add    $0x10,%esp
     575:	3d 00 02 00 00       	cmp    $0x200,%eax
     57a:	0f 85 80 00 00 00    	jne    600 <writetest1+0xe3>
     580:	83 c3 01             	add    $0x1,%ebx
     583:	81 fb 8c 00 00 00    	cmp    $0x8c,%ebx
     589:	75 ce                	jne    559 <writetest1+0x3c>
     58b:	83 ec 0c             	sub    $0xc,%esp
     58e:	56                   	push   %esi
     58f:	e8 f0 31 00 00       	call   3784 <close>
     594:	83 c4 08             	add    $0x8,%esp
     597:	6a 00                	push   $0x0
     599:	68 23 3e 00 00       	push   $0x3e23
     59e:	e8 f9 31 00 00       	call   379c <open>
     5a3:	89 c6                	mov    %eax,%esi
     5a5:	83 c4 10             	add    $0x10,%esp
     5a8:	85 c0                	test   %eax,%eax
     5aa:	78 6d                	js     619 <writetest1+0xfc>
     5ac:	bb 00 00 00 00       	mov    $0x0,%ebx
     5b1:	83 ec 04             	sub    $0x4,%esp
     5b4:	68 00 02 00 00       	push   $0x200
     5b9:	68 40 83 00 00       	push   $0x8340
     5be:	56                   	push   %esi
     5bf:	e8 b0 31 00 00       	call   3774 <read>
     5c4:	83 c4 10             	add    $0x10,%esp
     5c7:	85 c0                	test   %eax,%eax
     5c9:	74 66                	je     631 <writetest1+0x114>
     5cb:	3d 00 02 00 00       	cmp    $0x200,%eax
     5d0:	0f 85 b9 00 00 00    	jne    68f <writetest1+0x172>
     5d6:	a1 40 83 00 00       	mov    0x8340,%eax
     5db:	39 d8                	cmp    %ebx,%eax
     5dd:	0f 85 c5 00 00 00    	jne    6a8 <writetest1+0x18b>
     5e3:	83 c3 01             	add    $0x1,%ebx
     5e6:	eb c9                	jmp    5b1 <writetest1+0x94>
     5e8:	83 ec 08             	sub    $0x8,%esp
     5eb:	68 b9 3d 00 00       	push   $0x3db9
     5f0:	ff 35 fc 5b 00 00    	push   0x5bfc
     5f6:	e8 a1 32 00 00       	call   389c <printf>
     5fb:	e8 5c 31 00 00       	call   375c <exit>
     600:	83 ec 04             	sub    $0x4,%esp
     603:	53                   	push   %ebx
     604:	68 d3 3d 00 00       	push   $0x3dd3
     609:	ff 35 fc 5b 00 00    	push   0x5bfc
     60f:	e8 88 32 00 00       	call   389c <printf>
     614:	e8 43 31 00 00       	call   375c <exit>
     619:	83 ec 08             	sub    $0x8,%esp
     61c:	68 f1 3d 00 00       	push   $0x3df1
     621:	ff 35 fc 5b 00 00    	push   0x5bfc
     627:	e8 70 32 00 00       	call   389c <printf>
     62c:	e8 2b 31 00 00       	call   375c <exit>
     631:	81 fb 8b 00 00 00    	cmp    $0x8b,%ebx
     637:	74 39                	je     672 <writetest1+0x155>
     639:	83 ec 0c             	sub    $0xc,%esp
     63c:	56                   	push   %esi
     63d:	e8 42 31 00 00       	call   3784 <close>
     642:	c7 04 24 23 3e 00 00 	movl   $0x3e23,(%esp)
     649:	e8 5e 31 00 00       	call   37ac <unlink>
     64e:	83 c4 10             	add    $0x10,%esp
     651:	85 c0                	test   %eax,%eax
     653:	78 6a                	js     6bf <writetest1+0x1a2>
     655:	83 ec 08             	sub    $0x8,%esp
     658:	68 4a 3e 00 00       	push   $0x3e4a
     65d:	ff 35 fc 5b 00 00    	push   0x5bfc
     663:	e8 34 32 00 00       	call   389c <printf>
     668:	83 c4 10             	add    $0x10,%esp
     66b:	8d 65 f8             	lea    -0x8(%ebp),%esp
     66e:	5b                   	pop    %ebx
     66f:	5e                   	pop    %esi
     670:	5d                   	pop    %ebp
     671:	c3                   	ret
     672:	83 ec 04             	sub    $0x4,%esp
     675:	68 8b 00 00 00       	push   $0x8b
     67a:	68 0a 3e 00 00       	push   $0x3e0a
     67f:	ff 35 fc 5b 00 00    	push   0x5bfc
     685:	e8 12 32 00 00       	call   389c <printf>
     68a:	e8 cd 30 00 00       	call   375c <exit>
     68f:	83 ec 04             	sub    $0x4,%esp
     692:	50                   	push   %eax
     693:	68 27 3e 00 00       	push   $0x3e27
     698:	ff 35 fc 5b 00 00    	push   0x5bfc
     69e:	e8 f9 31 00 00       	call   389c <printf>
     6a3:	e8 b4 30 00 00       	call   375c <exit>
     6a8:	50                   	push   %eax
     6a9:	53                   	push   %ebx
     6aa:	68 28 4c 00 00       	push   $0x4c28
     6af:	ff 35 fc 5b 00 00    	push   0x5bfc
     6b5:	e8 e2 31 00 00       	call   389c <printf>
     6ba:	e8 9d 30 00 00       	call   375c <exit>
     6bf:	83 ec 08             	sub    $0x8,%esp
     6c2:	68 37 3e 00 00       	push   $0x3e37
     6c7:	ff 35 fc 5b 00 00    	push   0x5bfc
     6cd:	e8 ca 31 00 00       	call   389c <printf>
     6d2:	e8 85 30 00 00       	call   375c <exit>

000006d7 <createtest>:
     6d7:	55                   	push   %ebp
     6d8:	89 e5                	mov    %esp,%ebp
     6da:	53                   	push   %ebx
     6db:	83 ec 0c             	sub    $0xc,%esp
     6de:	68 48 4c 00 00       	push   $0x4c48
     6e3:	ff 35 fc 5b 00 00    	push   0x5bfc
     6e9:	e8 ae 31 00 00       	call   389c <printf>
     6ee:	c6 05 30 83 00 00 61 	movb   $0x61,0x8330
     6f5:	c6 05 32 83 00 00 00 	movb   $0x0,0x8332
     6fc:	83 c4 10             	add    $0x10,%esp
     6ff:	bb 30 00 00 00       	mov    $0x30,%ebx
     704:	88 1d 31 83 00 00    	mov    %bl,0x8331
     70a:	83 ec 08             	sub    $0x8,%esp
     70d:	68 02 02 00 00       	push   $0x202
     712:	68 30 83 00 00       	push   $0x8330
     717:	e8 80 30 00 00       	call   379c <open>
     71c:	89 04 24             	mov    %eax,(%esp)
     71f:	e8 60 30 00 00       	call   3784 <close>
     724:	83 c3 01             	add    $0x1,%ebx
     727:	83 c4 10             	add    $0x10,%esp
     72a:	80 fb 64             	cmp    $0x64,%bl
     72d:	75 d5                	jne    704 <createtest+0x2d>
     72f:	c6 05 30 83 00 00 61 	movb   $0x61,0x8330
     736:	c6 05 32 83 00 00 00 	movb   $0x0,0x8332
     73d:	bb 30 00 00 00       	mov    $0x30,%ebx
     742:	88 1d 31 83 00 00    	mov    %bl,0x8331
     748:	83 ec 0c             	sub    $0xc,%esp
     74b:	68 30 83 00 00       	push   $0x8330
     750:	e8 57 30 00 00       	call   37ac <unlink>
     755:	83 c3 01             	add    $0x1,%ebx
     758:	83 c4 10             	add    $0x10,%esp
     75b:	80 fb 64             	cmp    $0x64,%bl
     75e:	75 e2                	jne    742 <createtest+0x6b>
     760:	83 ec 08             	sub    $0x8,%esp
     763:	68 74 4c 00 00       	push   $0x4c74
     768:	ff 35 fc 5b 00 00    	push   0x5bfc
     76e:	e8 29 31 00 00       	call   389c <printf>
     773:	83 c4 10             	add    $0x10,%esp
     776:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     779:	c9                   	leave
     77a:	c3                   	ret

0000077b <dirtest>:
     77b:	55                   	push   %ebp
     77c:	89 e5                	mov    %esp,%ebp
     77e:	83 ec 10             	sub    $0x10,%esp
     781:	68 58 3e 00 00       	push   $0x3e58
     786:	ff 35 fc 5b 00 00    	push   0x5bfc
     78c:	e8 0b 31 00 00       	call   389c <printf>
     791:	c7 04 24 64 3e 00 00 	movl   $0x3e64,(%esp)
     798:	e8 27 30 00 00       	call   37c4 <mkdir>
     79d:	83 c4 10             	add    $0x10,%esp
     7a0:	85 c0                	test   %eax,%eax
     7a2:	78 54                	js     7f8 <dirtest+0x7d>
     7a4:	83 ec 0c             	sub    $0xc,%esp
     7a7:	68 64 3e 00 00       	push   $0x3e64
     7ac:	e8 1b 30 00 00       	call   37cc <chdir>
     7b1:	83 c4 10             	add    $0x10,%esp
     7b4:	85 c0                	test   %eax,%eax
     7b6:	78 58                	js     810 <dirtest+0x95>
     7b8:	83 ec 0c             	sub    $0xc,%esp
     7bb:	68 09 44 00 00       	push   $0x4409
     7c0:	e8 07 30 00 00       	call   37cc <chdir>
     7c5:	83 c4 10             	add    $0x10,%esp
     7c8:	85 c0                	test   %eax,%eax
     7ca:	78 5c                	js     828 <dirtest+0xad>
     7cc:	83 ec 0c             	sub    $0xc,%esp
     7cf:	68 64 3e 00 00       	push   $0x3e64
     7d4:	e8 d3 2f 00 00       	call   37ac <unlink>
     7d9:	83 c4 10             	add    $0x10,%esp
     7dc:	85 c0                	test   %eax,%eax
     7de:	78 60                	js     840 <dirtest+0xc5>
     7e0:	83 ec 08             	sub    $0x8,%esp
     7e3:	68 a1 3e 00 00       	push   $0x3ea1
     7e8:	ff 35 fc 5b 00 00    	push   0x5bfc
     7ee:	e8 a9 30 00 00       	call   389c <printf>
     7f3:	83 c4 10             	add    $0x10,%esp
     7f6:	c9                   	leave
     7f7:	c3                   	ret
     7f8:	83 ec 08             	sub    $0x8,%esp
     7fb:	68 94 3b 00 00       	push   $0x3b94
     800:	ff 35 fc 5b 00 00    	push   0x5bfc
     806:	e8 91 30 00 00       	call   389c <printf>
     80b:	e8 4c 2f 00 00       	call   375c <exit>
     810:	83 ec 08             	sub    $0x8,%esp
     813:	68 69 3e 00 00       	push   $0x3e69
     818:	ff 35 fc 5b 00 00    	push   0x5bfc
     81e:	e8 79 30 00 00       	call   389c <printf>
     823:	e8 34 2f 00 00       	call   375c <exit>
     828:	83 ec 08             	sub    $0x8,%esp
     82b:	68 7c 3e 00 00       	push   $0x3e7c
     830:	ff 35 fc 5b 00 00    	push   0x5bfc
     836:	e8 61 30 00 00       	call   389c <printf>
     83b:	e8 1c 2f 00 00       	call   375c <exit>
     840:	83 ec 08             	sub    $0x8,%esp
     843:	68 8d 3e 00 00       	push   $0x3e8d
     848:	ff 35 fc 5b 00 00    	push   0x5bfc
     84e:	e8 49 30 00 00       	call   389c <printf>
     853:	e8 04 2f 00 00       	call   375c <exit>

00000858 <exectest>:
     858:	55                   	push   %ebp
     859:	89 e5                	mov    %esp,%ebp
     85b:	83 ec 10             	sub    $0x10,%esp
     85e:	68 b0 3e 00 00       	push   $0x3eb0
     863:	ff 35 fc 5b 00 00    	push   0x5bfc
     869:	e8 2e 30 00 00       	call   389c <printf>
     86e:	83 c4 08             	add    $0x8,%esp
     871:	68 00 5c 00 00       	push   $0x5c00
     876:	68 79 3c 00 00       	push   $0x3c79
     87b:	e8 14 2f 00 00       	call   3794 <exec>
     880:	83 c4 10             	add    $0x10,%esp
     883:	85 c0                	test   %eax,%eax
     885:	78 02                	js     889 <exectest+0x31>
     887:	c9                   	leave
     888:	c3                   	ret
     889:	83 ec 08             	sub    $0x8,%esp
     88c:	68 bb 3e 00 00       	push   $0x3ebb
     891:	ff 35 fc 5b 00 00    	push   0x5bfc
     897:	e8 00 30 00 00       	call   389c <printf>
     89c:	e8 bb 2e 00 00       	call   375c <exit>

000008a1 <pipe1>:
     8a1:	55                   	push   %ebp
     8a2:	89 e5                	mov    %esp,%ebp
     8a4:	57                   	push   %edi
     8a5:	56                   	push   %esi
     8a6:	53                   	push   %ebx
     8a7:	83 ec 28             	sub    $0x28,%esp
     8aa:	8d 45 e0             	lea    -0x20(%ebp),%eax
     8ad:	50                   	push   %eax
     8ae:	e8 b9 2e 00 00       	call   376c <pipe>
     8b3:	83 c4 10             	add    $0x10,%esp
     8b6:	85 c0                	test   %eax,%eax
     8b8:	0f 85 8c 00 00 00    	jne    94a <pipe1+0xa9>
     8be:	89 c3                	mov    %eax,%ebx
     8c0:	e8 8f 2e 00 00       	call   3754 <fork>
     8c5:	89 c6                	mov    %eax,%esi
     8c7:	85 c0                	test   %eax,%eax
     8c9:	0f 84 8f 00 00 00    	je     95e <pipe1+0xbd>
     8cf:	0f 8e 4b 01 00 00    	jle    a20 <pipe1+0x17f>
     8d5:	83 ec 0c             	sub    $0xc,%esp
     8d8:	ff 75 e4             	push   -0x1c(%ebp)
     8db:	e8 a4 2e 00 00       	call   3784 <close>
     8e0:	83 c4 10             	add    $0x10,%esp
     8e3:	89 df                	mov    %ebx,%edi
     8e5:	be 01 00 00 00       	mov    $0x1,%esi
     8ea:	83 ec 04             	sub    $0x4,%esp
     8ed:	56                   	push   %esi
     8ee:	68 40 83 00 00       	push   $0x8340
     8f3:	ff 75 e0             	push   -0x20(%ebp)
     8f6:	e8 79 2e 00 00       	call   3774 <read>
     8fb:	89 c2                	mov    %eax,%edx
     8fd:	83 c4 10             	add    $0x10,%esp
     900:	85 c0                	test   %eax,%eax
     902:	0f 8e d4 00 00 00    	jle    9dc <pipe1+0x13b>
     908:	89 d8                	mov    %ebx,%eax
     90a:	32 05 40 83 00 00    	xor    0x8340,%al
     910:	0f b6 c0             	movzbl %al,%eax
     913:	85 c0                	test   %eax,%eax
     915:	75 19                	jne    930 <pipe1+0x8f>
     917:	8d 4b 01             	lea    0x1(%ebx),%ecx
     91a:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
     91d:	83 c0 01             	add    $0x1,%eax
     920:	39 c2                	cmp    %eax,%edx
     922:	0f 84 a1 00 00 00    	je     9c9 <pipe1+0x128>
     928:	38 98 40 83 00 00    	cmp    %bl,0x8340(%eax)
     92e:	74 ea                	je     91a <pipe1+0x79>
     930:	83 ec 08             	sub    $0x8,%esp
     933:	68 ea 3e 00 00       	push   $0x3eea
     938:	6a 01                	push   $0x1
     93a:	e8 5d 2f 00 00       	call   389c <printf>
     93f:	83 c4 10             	add    $0x10,%esp
     942:	8d 65 f4             	lea    -0xc(%ebp),%esp
     945:	5b                   	pop    %ebx
     946:	5e                   	pop    %esi
     947:	5f                   	pop    %edi
     948:	5d                   	pop    %ebp
     949:	c3                   	ret
     94a:	83 ec 08             	sub    $0x8,%esp
     94d:	68 cd 3e 00 00       	push   $0x3ecd
     952:	6a 01                	push   $0x1
     954:	e8 43 2f 00 00       	call   389c <printf>
     959:	e8 fe 2d 00 00       	call   375c <exit>
     95e:	83 ec 0c             	sub    $0xc,%esp
     961:	ff 75 e0             	push   -0x20(%ebp)
     964:	e8 1b 2e 00 00       	call   3784 <close>
     969:	83 c4 10             	add    $0x10,%esp
     96c:	89 f3                	mov    %esi,%ebx
     96e:	89 f0                	mov    %esi,%eax
     970:	8d 14 03             	lea    (%ebx,%eax,1),%edx
     973:	88 90 40 83 00 00    	mov    %dl,0x8340(%eax)
     979:	83 c0 01             	add    $0x1,%eax
     97c:	3d 09 04 00 00       	cmp    $0x409,%eax
     981:	75 ed                	jne    970 <pipe1+0xcf>
     983:	81 c3 09 04 00 00    	add    $0x409,%ebx
     989:	83 ec 04             	sub    $0x4,%esp
     98c:	68 09 04 00 00       	push   $0x409
     991:	68 40 83 00 00       	push   $0x8340
     996:	ff 75 e4             	push   -0x1c(%ebp)
     999:	e8 de 2d 00 00       	call   377c <write>
     99e:	83 c4 10             	add    $0x10,%esp
     9a1:	3d 09 04 00 00       	cmp    $0x409,%eax
     9a6:	75 0d                	jne    9b5 <pipe1+0x114>
     9a8:	81 fb 2d 14 00 00    	cmp    $0x142d,%ebx
     9ae:	75 be                	jne    96e <pipe1+0xcd>
     9b0:	e8 a7 2d 00 00       	call   375c <exit>
     9b5:	83 ec 08             	sub    $0x8,%esp
     9b8:	68 dc 3e 00 00       	push   $0x3edc
     9bd:	6a 01                	push   $0x1
     9bf:	e8 d8 2e 00 00       	call   389c <printf>
     9c4:	e8 93 2d 00 00       	call   375c <exit>
     9c9:	01 c7                	add    %eax,%edi
     9cb:	01 f6                	add    %esi,%esi
     9cd:	b8 00 20 00 00       	mov    $0x2000,%eax
     9d2:	39 c6                	cmp    %eax,%esi
     9d4:	0f 47 f0             	cmova  %eax,%esi
     9d7:	e9 0e ff ff ff       	jmp    8ea <pipe1+0x49>
     9dc:	81 ff 2d 14 00 00    	cmp    $0x142d,%edi
     9e2:	75 27                	jne    a0b <pipe1+0x16a>
     9e4:	83 ec 0c             	sub    $0xc,%esp
     9e7:	ff 75 e0             	push   -0x20(%ebp)
     9ea:	e8 95 2d 00 00       	call   3784 <close>
     9ef:	e8 70 2d 00 00       	call   3764 <wait>
     9f4:	83 c4 08             	add    $0x8,%esp
     9f7:	68 0f 3f 00 00       	push   $0x3f0f
     9fc:	6a 01                	push   $0x1
     9fe:	e8 99 2e 00 00       	call   389c <printf>
     a03:	83 c4 10             	add    $0x10,%esp
     a06:	e9 37 ff ff ff       	jmp    942 <pipe1+0xa1>
     a0b:	83 ec 04             	sub    $0x4,%esp
     a0e:	57                   	push   %edi
     a0f:	68 f8 3e 00 00       	push   $0x3ef8
     a14:	6a 01                	push   $0x1
     a16:	e8 81 2e 00 00       	call   389c <printf>
     a1b:	e8 3c 2d 00 00       	call   375c <exit>
     a20:	83 ec 08             	sub    $0x8,%esp
     a23:	68 19 3f 00 00       	push   $0x3f19
     a28:	6a 01                	push   $0x1
     a2a:	e8 6d 2e 00 00       	call   389c <printf>
     a2f:	e8 28 2d 00 00       	call   375c <exit>

00000a34 <preempt>:
     a34:	55                   	push   %ebp
     a35:	89 e5                	mov    %esp,%ebp
     a37:	57                   	push   %edi
     a38:	56                   	push   %esi
     a39:	53                   	push   %ebx
     a3a:	83 ec 24             	sub    $0x24,%esp
     a3d:	68 28 3f 00 00       	push   $0x3f28
     a42:	6a 01                	push   $0x1
     a44:	e8 53 2e 00 00       	call   389c <printf>
     a49:	e8 06 2d 00 00       	call   3754 <fork>
     a4e:	83 c4 10             	add    $0x10,%esp
     a51:	85 c0                	test   %eax,%eax
     a53:	75 02                	jne    a57 <preempt+0x23>
     a55:	eb fe                	jmp    a55 <preempt+0x21>
     a57:	89 c3                	mov    %eax,%ebx
     a59:	e8 f6 2c 00 00       	call   3754 <fork>
     a5e:	89 c6                	mov    %eax,%esi
     a60:	85 c0                	test   %eax,%eax
     a62:	75 02                	jne    a66 <preempt+0x32>
     a64:	eb fe                	jmp    a64 <preempt+0x30>
     a66:	83 ec 0c             	sub    $0xc,%esp
     a69:	8d 45 e0             	lea    -0x20(%ebp),%eax
     a6c:	50                   	push   %eax
     a6d:	e8 fa 2c 00 00       	call   376c <pipe>
     a72:	e8 dd 2c 00 00       	call   3754 <fork>
     a77:	89 c7                	mov    %eax,%edi
     a79:	83 c4 10             	add    $0x10,%esp
     a7c:	85 c0                	test   %eax,%eax
     a7e:	75 49                	jne    ac9 <preempt+0x95>
     a80:	83 ec 0c             	sub    $0xc,%esp
     a83:	ff 75 e0             	push   -0x20(%ebp)
     a86:	e8 f9 2c 00 00       	call   3784 <close>
     a8b:	83 c4 0c             	add    $0xc,%esp
     a8e:	6a 01                	push   $0x1
     a90:	68 ed 44 00 00       	push   $0x44ed
     a95:	ff 75 e4             	push   -0x1c(%ebp)
     a98:	e8 df 2c 00 00       	call   377c <write>
     a9d:	83 c4 10             	add    $0x10,%esp
     aa0:	83 f8 01             	cmp    $0x1,%eax
     aa3:	75 10                	jne    ab5 <preempt+0x81>
     aa5:	83 ec 0c             	sub    $0xc,%esp
     aa8:	ff 75 e4             	push   -0x1c(%ebp)
     aab:	e8 d4 2c 00 00       	call   3784 <close>
     ab0:	83 c4 10             	add    $0x10,%esp
     ab3:	eb fe                	jmp    ab3 <preempt+0x7f>
     ab5:	83 ec 08             	sub    $0x8,%esp
     ab8:	68 32 3f 00 00       	push   $0x3f32
     abd:	6a 01                	push   $0x1
     abf:	e8 d8 2d 00 00       	call   389c <printf>
     ac4:	83 c4 10             	add    $0x10,%esp
     ac7:	eb dc                	jmp    aa5 <preempt+0x71>
     ac9:	83 ec 0c             	sub    $0xc,%esp
     acc:	ff 75 e4             	push   -0x1c(%ebp)
     acf:	e8 b0 2c 00 00       	call   3784 <close>
     ad4:	83 c4 0c             	add    $0xc,%esp
     ad7:	68 00 20 00 00       	push   $0x2000
     adc:	68 40 83 00 00       	push   $0x8340
     ae1:	ff 75 e0             	push   -0x20(%ebp)
     ae4:	e8 8b 2c 00 00       	call   3774 <read>
     ae9:	83 c4 10             	add    $0x10,%esp
     aec:	83 f8 01             	cmp    $0x1,%eax
     aef:	74 1a                	je     b0b <preempt+0xd7>
     af1:	83 ec 08             	sub    $0x8,%esp
     af4:	68 46 3f 00 00       	push   $0x3f46
     af9:	6a 01                	push   $0x1
     afb:	e8 9c 2d 00 00       	call   389c <printf>
     b00:	83 c4 10             	add    $0x10,%esp
     b03:	8d 65 f4             	lea    -0xc(%ebp),%esp
     b06:	5b                   	pop    %ebx
     b07:	5e                   	pop    %esi
     b08:	5f                   	pop    %edi
     b09:	5d                   	pop    %ebp
     b0a:	c3                   	ret
     b0b:	83 ec 0c             	sub    $0xc,%esp
     b0e:	ff 75 e0             	push   -0x20(%ebp)
     b11:	e8 6e 2c 00 00       	call   3784 <close>
     b16:	83 c4 08             	add    $0x8,%esp
     b19:	68 59 3f 00 00       	push   $0x3f59
     b1e:	6a 01                	push   $0x1
     b20:	e8 77 2d 00 00       	call   389c <printf>
     b25:	89 1c 24             	mov    %ebx,(%esp)
     b28:	e8 5f 2c 00 00       	call   378c <kill>
     b2d:	89 34 24             	mov    %esi,(%esp)
     b30:	e8 57 2c 00 00       	call   378c <kill>
     b35:	89 3c 24             	mov    %edi,(%esp)
     b38:	e8 4f 2c 00 00       	call   378c <kill>
     b3d:	83 c4 08             	add    $0x8,%esp
     b40:	68 62 3f 00 00       	push   $0x3f62
     b45:	6a 01                	push   $0x1
     b47:	e8 50 2d 00 00       	call   389c <printf>
     b4c:	e8 13 2c 00 00       	call   3764 <wait>
     b51:	e8 0e 2c 00 00       	call   3764 <wait>
     b56:	e8 09 2c 00 00       	call   3764 <wait>
     b5b:	83 c4 08             	add    $0x8,%esp
     b5e:	68 6b 3f 00 00       	push   $0x3f6b
     b63:	6a 01                	push   $0x1
     b65:	e8 32 2d 00 00       	call   389c <printf>
     b6a:	83 c4 10             	add    $0x10,%esp
     b6d:	eb 94                	jmp    b03 <preempt+0xcf>

00000b6f <exitwait>:
     b6f:	55                   	push   %ebp
     b70:	89 e5                	mov    %esp,%ebp
     b72:	56                   	push   %esi
     b73:	53                   	push   %ebx
     b74:	be 64 00 00 00       	mov    $0x64,%esi
     b79:	e8 d6 2b 00 00       	call   3754 <fork>
     b7e:	89 c3                	mov    %eax,%ebx
     b80:	85 c0                	test   %eax,%eax
     b82:	78 24                	js     ba8 <exitwait+0x39>
     b84:	74 4f                	je     bd5 <exitwait+0x66>
     b86:	e8 d9 2b 00 00       	call   3764 <wait>
     b8b:	39 d8                	cmp    %ebx,%eax
     b8d:	75 32                	jne    bc1 <exitwait+0x52>
     b8f:	83 ee 01             	sub    $0x1,%esi
     b92:	75 e5                	jne    b79 <exitwait+0xa>
     b94:	83 ec 08             	sub    $0x8,%esp
     b97:	68 87 3f 00 00       	push   $0x3f87
     b9c:	6a 01                	push   $0x1
     b9e:	e8 f9 2c 00 00       	call   389c <printf>
     ba3:	83 c4 10             	add    $0x10,%esp
     ba6:	eb 12                	jmp    bba <exitwait+0x4b>
     ba8:	83 ec 08             	sub    $0x8,%esp
     bab:	68 d5 4a 00 00       	push   $0x4ad5
     bb0:	6a 01                	push   $0x1
     bb2:	e8 e5 2c 00 00       	call   389c <printf>
     bb7:	83 c4 10             	add    $0x10,%esp
     bba:	8d 65 f8             	lea    -0x8(%ebp),%esp
     bbd:	5b                   	pop    %ebx
     bbe:	5e                   	pop    %esi
     bbf:	5d                   	pop    %ebp
     bc0:	c3                   	ret
     bc1:	83 ec 08             	sub    $0x8,%esp
     bc4:	68 77 3f 00 00       	push   $0x3f77
     bc9:	6a 01                	push   $0x1
     bcb:	e8 cc 2c 00 00       	call   389c <printf>
     bd0:	83 c4 10             	add    $0x10,%esp
     bd3:	eb e5                	jmp    bba <exitwait+0x4b>
     bd5:	e8 82 2b 00 00       	call   375c <exit>

00000bda <mem>:
     bda:	55                   	push   %ebp
     bdb:	89 e5                	mov    %esp,%ebp
     bdd:	56                   	push   %esi
     bde:	53                   	push   %ebx
     bdf:	83 ec 08             	sub    $0x8,%esp
     be2:	68 94 3f 00 00       	push   $0x3f94
     be7:	6a 01                	push   $0x1
     be9:	e8 ae 2c 00 00       	call   389c <printf>
     bee:	e8 e9 2b 00 00       	call   37dc <getpid>
     bf3:	89 c6                	mov    %eax,%esi
     bf5:	e8 5a 2b 00 00       	call   3754 <fork>
     bfa:	83 c4 10             	add    $0x10,%esp
     bfd:	bb 00 00 00 00       	mov    $0x0,%ebx
     c02:	85 c0                	test   %eax,%eax
     c04:	74 10                	je     c16 <mem+0x3c>
     c06:	e8 59 2b 00 00       	call   3764 <wait>
     c0b:	8d 65 f8             	lea    -0x8(%ebp),%esp
     c0e:	5b                   	pop    %ebx
     c0f:	5e                   	pop    %esi
     c10:	5d                   	pop    %ebp
     c11:	c3                   	ret
     c12:	89 18                	mov    %ebx,(%eax)
     c14:	89 c3                	mov    %eax,%ebx
     c16:	83 ec 0c             	sub    $0xc,%esp
     c19:	68 11 27 00 00       	push   $0x2711
     c1e:	e8 9f 2e 00 00       	call   3ac2 <malloc>
     c23:	83 c4 10             	add    $0x10,%esp
     c26:	85 c0                	test   %eax,%eax
     c28:	75 e8                	jne    c12 <mem+0x38>
     c2a:	85 db                	test   %ebx,%ebx
     c2c:	74 14                	je     c42 <mem+0x68>
     c2e:	89 d8                	mov    %ebx,%eax
     c30:	8b 1b                	mov    (%ebx),%ebx
     c32:	83 ec 0c             	sub    $0xc,%esp
     c35:	50                   	push   %eax
     c36:	e8 1e 2e 00 00       	call   3a59 <free>
     c3b:	83 c4 10             	add    $0x10,%esp
     c3e:	85 db                	test   %ebx,%ebx
     c40:	75 ec                	jne    c2e <mem+0x54>
     c42:	83 ec 0c             	sub    $0xc,%esp
     c45:	68 00 50 00 00       	push   $0x5000
     c4a:	e8 73 2e 00 00       	call   3ac2 <malloc>
     c4f:	83 c4 10             	add    $0x10,%esp
     c52:	85 c0                	test   %eax,%eax
     c54:	74 1d                	je     c73 <mem+0x99>
     c56:	83 ec 0c             	sub    $0xc,%esp
     c59:	50                   	push   %eax
     c5a:	e8 fa 2d 00 00       	call   3a59 <free>
     c5f:	83 c4 08             	add    $0x8,%esp
     c62:	68 b8 3f 00 00       	push   $0x3fb8
     c67:	6a 01                	push   $0x1
     c69:	e8 2e 2c 00 00       	call   389c <printf>
     c6e:	e8 e9 2a 00 00       	call   375c <exit>
     c73:	83 ec 08             	sub    $0x8,%esp
     c76:	68 9e 3f 00 00       	push   $0x3f9e
     c7b:	6a 01                	push   $0x1
     c7d:	e8 1a 2c 00 00       	call   389c <printf>
     c82:	89 34 24             	mov    %esi,(%esp)
     c85:	e8 02 2b 00 00       	call   378c <kill>
     c8a:	e8 cd 2a 00 00       	call   375c <exit>

00000c8f <sharedfd>:
     c8f:	55                   	push   %ebp
     c90:	89 e5                	mov    %esp,%ebp
     c92:	57                   	push   %edi
     c93:	56                   	push   %esi
     c94:	53                   	push   %ebx
     c95:	83 ec 34             	sub    $0x34,%esp
     c98:	68 c0 3f 00 00       	push   $0x3fc0
     c9d:	6a 01                	push   $0x1
     c9f:	e8 f8 2b 00 00       	call   389c <printf>
     ca4:	c7 04 24 cf 3f 00 00 	movl   $0x3fcf,(%esp)
     cab:	e8 fc 2a 00 00       	call   37ac <unlink>
     cb0:	83 c4 08             	add    $0x8,%esp
     cb3:	68 02 02 00 00       	push   $0x202
     cb8:	68 cf 3f 00 00       	push   $0x3fcf
     cbd:	e8 da 2a 00 00       	call   379c <open>
     cc2:	83 c4 10             	add    $0x10,%esp
     cc5:	85 c0                	test   %eax,%eax
     cc7:	78 4a                	js     d13 <sharedfd+0x84>
     cc9:	89 c6                	mov    %eax,%esi
     ccb:	e8 84 2a 00 00       	call   3754 <fork>
     cd0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
     cd3:	83 f8 01             	cmp    $0x1,%eax
     cd6:	19 c0                	sbb    %eax,%eax
     cd8:	83 e0 f3             	and    $0xfffffff3,%eax
     cdb:	83 c0 70             	add    $0x70,%eax
     cde:	83 ec 04             	sub    $0x4,%esp
     ce1:	6a 0a                	push   $0xa
     ce3:	50                   	push   %eax
     ce4:	8d 45 de             	lea    -0x22(%ebp),%eax
     ce7:	50                   	push   %eax
     ce8:	e8 1c 29 00 00       	call   3609 <memset>
     ced:	83 c4 10             	add    $0x10,%esp
     cf0:	bb e8 03 00 00       	mov    $0x3e8,%ebx
     cf5:	8d 7d de             	lea    -0x22(%ebp),%edi
     cf8:	83 ec 04             	sub    $0x4,%esp
     cfb:	6a 0a                	push   $0xa
     cfd:	57                   	push   %edi
     cfe:	56                   	push   %esi
     cff:	e8 78 2a 00 00       	call   377c <write>
     d04:	83 c4 10             	add    $0x10,%esp
     d07:	83 f8 0a             	cmp    $0xa,%eax
     d0a:	75 1e                	jne    d2a <sharedfd+0x9b>
     d0c:	83 eb 01             	sub    $0x1,%ebx
     d0f:	75 e7                	jne    cf8 <sharedfd+0x69>
     d11:	eb 29                	jmp    d3c <sharedfd+0xad>
     d13:	83 ec 08             	sub    $0x8,%esp
     d16:	68 9c 4c 00 00       	push   $0x4c9c
     d1b:	6a 01                	push   $0x1
     d1d:	e8 7a 2b 00 00       	call   389c <printf>
     d22:	83 c4 10             	add    $0x10,%esp
     d25:	e9 de 00 00 00       	jmp    e08 <sharedfd+0x179>
     d2a:	83 ec 08             	sub    $0x8,%esp
     d2d:	68 c8 4c 00 00       	push   $0x4cc8
     d32:	6a 01                	push   $0x1
     d34:	e8 63 2b 00 00       	call   389c <printf>
     d39:	83 c4 10             	add    $0x10,%esp
     d3c:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
     d40:	74 51                	je     d93 <sharedfd+0x104>
     d42:	e8 1d 2a 00 00       	call   3764 <wait>
     d47:	83 ec 0c             	sub    $0xc,%esp
     d4a:	56                   	push   %esi
     d4b:	e8 34 2a 00 00       	call   3784 <close>
     d50:	83 c4 08             	add    $0x8,%esp
     d53:	6a 00                	push   $0x0
     d55:	68 cf 3f 00 00       	push   $0x3fcf
     d5a:	e8 3d 2a 00 00       	call   379c <open>
     d5f:	83 c4 10             	add    $0x10,%esp
     d62:	bb 00 00 00 00       	mov    $0x0,%ebx
     d67:	bf 00 00 00 00       	mov    $0x0,%edi
     d6c:	8d 75 e8             	lea    -0x18(%ebp),%esi
     d6f:	85 c0                	test   %eax,%eax
     d71:	78 25                	js     d98 <sharedfd+0x109>
     d73:	89 45 d4             	mov    %eax,-0x2c(%ebp)
     d76:	83 ec 04             	sub    $0x4,%esp
     d79:	6a 0a                	push   $0xa
     d7b:	8d 45 de             	lea    -0x22(%ebp),%eax
     d7e:	50                   	push   %eax
     d7f:	ff 75 d4             	push   -0x2c(%ebp)
     d82:	e8 ed 29 00 00       	call   3774 <read>
     d87:	83 c4 10             	add    $0x10,%esp
     d8a:	85 c0                	test   %eax,%eax
     d8c:	7e 3d                	jle    dcb <sharedfd+0x13c>
     d8e:	8d 45 de             	lea    -0x22(%ebp),%eax
     d91:	eb 2b                	jmp    dbe <sharedfd+0x12f>
     d93:	e8 c4 29 00 00       	call   375c <exit>
     d98:	83 ec 08             	sub    $0x8,%esp
     d9b:	68 e8 4c 00 00       	push   $0x4ce8
     da0:	6a 01                	push   $0x1
     da2:	e8 f5 2a 00 00       	call   389c <printf>
     da7:	83 c4 10             	add    $0x10,%esp
     daa:	eb 5c                	jmp    e08 <sharedfd+0x179>
     dac:	80 fa 70             	cmp    $0x70,%dl
     daf:	0f 94 c2             	sete   %dl
     db2:	0f b6 d2             	movzbl %dl,%edx
     db5:	01 d3                	add    %edx,%ebx
     db7:	83 c0 01             	add    $0x1,%eax
     dba:	39 f0                	cmp    %esi,%eax
     dbc:	74 b8                	je     d76 <sharedfd+0xe7>
     dbe:	0f b6 10             	movzbl (%eax),%edx
     dc1:	80 fa 63             	cmp    $0x63,%dl
     dc4:	75 e6                	jne    dac <sharedfd+0x11d>
     dc6:	83 c7 01             	add    $0x1,%edi
     dc9:	eb ec                	jmp    db7 <sharedfd+0x128>
     dcb:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
     dce:	83 ec 0c             	sub    $0xc,%esp
     dd1:	51                   	push   %ecx
     dd2:	e8 ad 29 00 00       	call   3784 <close>
     dd7:	c7 04 24 cf 3f 00 00 	movl   $0x3fcf,(%esp)
     dde:	e8 c9 29 00 00       	call   37ac <unlink>
     de3:	83 c4 10             	add    $0x10,%esp
     de6:	81 ff 10 27 00 00    	cmp    $0x2710,%edi
     dec:	75 22                	jne    e10 <sharedfd+0x181>
     dee:	81 fb 10 27 00 00    	cmp    $0x2710,%ebx
     df4:	75 1a                	jne    e10 <sharedfd+0x181>
     df6:	83 ec 08             	sub    $0x8,%esp
     df9:	68 d8 3f 00 00       	push   $0x3fd8
     dfe:	6a 01                	push   $0x1
     e00:	e8 97 2a 00 00       	call   389c <printf>
     e05:	83 c4 10             	add    $0x10,%esp
     e08:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e0b:	5b                   	pop    %ebx
     e0c:	5e                   	pop    %esi
     e0d:	5f                   	pop    %edi
     e0e:	5d                   	pop    %ebp
     e0f:	c3                   	ret
     e10:	53                   	push   %ebx
     e11:	57                   	push   %edi
     e12:	68 e5 3f 00 00       	push   $0x3fe5
     e17:	6a 01                	push   $0x1
     e19:	e8 7e 2a 00 00       	call   389c <printf>
     e1e:	e8 39 29 00 00       	call   375c <exit>

00000e23 <fourfiles>:
     e23:	55                   	push   %ebp
     e24:	89 e5                	mov    %esp,%ebp
     e26:	57                   	push   %edi
     e27:	56                   	push   %esi
     e28:	53                   	push   %ebx
     e29:	83 ec 34             	sub    $0x34,%esp
     e2c:	c7 45 d8 fa 3f 00 00 	movl   $0x3ffa,-0x28(%ebp)
     e33:	c7 45 dc 43 41 00 00 	movl   $0x4143,-0x24(%ebp)
     e3a:	c7 45 e0 47 41 00 00 	movl   $0x4147,-0x20(%ebp)
     e41:	c7 45 e4 fd 3f 00 00 	movl   $0x3ffd,-0x1c(%ebp)
     e48:	68 00 40 00 00       	push   $0x4000
     e4d:	6a 01                	push   $0x1
     e4f:	e8 48 2a 00 00       	call   389c <printf>
     e54:	83 c4 10             	add    $0x10,%esp
     e57:	bb 00 00 00 00       	mov    $0x0,%ebx
     e5c:	8b 74 9d d8          	mov    -0x28(%ebp,%ebx,4),%esi
     e60:	83 ec 0c             	sub    $0xc,%esp
     e63:	56                   	push   %esi
     e64:	e8 43 29 00 00       	call   37ac <unlink>
     e69:	e8 e6 28 00 00       	call   3754 <fork>
     e6e:	83 c4 10             	add    $0x10,%esp
     e71:	85 c0                	test   %eax,%eax
     e73:	78 28                	js     e9d <fourfiles+0x7a>
     e75:	74 3a                	je     eb1 <fourfiles+0x8e>
     e77:	83 c3 01             	add    $0x1,%ebx
     e7a:	83 fb 04             	cmp    $0x4,%ebx
     e7d:	75 dd                	jne    e5c <fourfiles+0x39>
     e7f:	e8 e0 28 00 00       	call   3764 <wait>
     e84:	e8 db 28 00 00       	call   3764 <wait>
     e89:	e8 d6 28 00 00       	call   3764 <wait>
     e8e:	e8 d1 28 00 00       	call   3764 <wait>
     e93:	bb 30 00 00 00       	mov    $0x30,%ebx
     e98:	e9 0c 01 00 00       	jmp    fa9 <fourfiles+0x186>
     e9d:	83 ec 08             	sub    $0x8,%esp
     ea0:	68 d5 4a 00 00       	push   $0x4ad5
     ea5:	6a 01                	push   $0x1
     ea7:	e8 f0 29 00 00       	call   389c <printf>
     eac:	e8 ab 28 00 00       	call   375c <exit>
     eb1:	83 ec 08             	sub    $0x8,%esp
     eb4:	68 02 02 00 00       	push   $0x202
     eb9:	56                   	push   %esi
     eba:	e8 dd 28 00 00       	call   379c <open>
     ebf:	89 c6                	mov    %eax,%esi
     ec1:	83 c4 10             	add    $0x10,%esp
     ec4:	85 c0                	test   %eax,%eax
     ec6:	78 45                	js     f0d <fourfiles+0xea>
     ec8:	83 ec 04             	sub    $0x4,%esp
     ecb:	68 00 02 00 00       	push   $0x200
     ed0:	83 c3 30             	add    $0x30,%ebx
     ed3:	53                   	push   %ebx
     ed4:	68 40 83 00 00       	push   $0x8340
     ed9:	e8 2b 27 00 00       	call   3609 <memset>
     ede:	83 c4 10             	add    $0x10,%esp
     ee1:	bb 0c 00 00 00       	mov    $0xc,%ebx
     ee6:	83 ec 04             	sub    $0x4,%esp
     ee9:	68 f4 01 00 00       	push   $0x1f4
     eee:	68 40 83 00 00       	push   $0x8340
     ef3:	56                   	push   %esi
     ef4:	e8 83 28 00 00       	call   377c <write>
     ef9:	83 c4 10             	add    $0x10,%esp
     efc:	3d f4 01 00 00       	cmp    $0x1f4,%eax
     f01:	75 1e                	jne    f21 <fourfiles+0xfe>
     f03:	83 eb 01             	sub    $0x1,%ebx
     f06:	75 de                	jne    ee6 <fourfiles+0xc3>
     f08:	e8 4f 28 00 00       	call   375c <exit>
     f0d:	83 ec 08             	sub    $0x8,%esp
     f10:	68 9b 42 00 00       	push   $0x429b
     f15:	6a 01                	push   $0x1
     f17:	e8 80 29 00 00       	call   389c <printf>
     f1c:	e8 3b 28 00 00       	call   375c <exit>
     f21:	83 ec 04             	sub    $0x4,%esp
     f24:	50                   	push   %eax
     f25:	68 10 40 00 00       	push   $0x4010
     f2a:	6a 01                	push   $0x1
     f2c:	e8 6b 29 00 00       	call   389c <printf>
     f31:	e8 26 28 00 00       	call   375c <exit>
     f36:	83 ec 08             	sub    $0x8,%esp
     f39:	68 21 40 00 00       	push   $0x4021
     f3e:	6a 01                	push   $0x1
     f40:	e8 57 29 00 00       	call   389c <printf>
     f45:	e8 12 28 00 00       	call   375c <exit>
     f4a:	01 d6                	add    %edx,%esi
     f4c:	83 ec 04             	sub    $0x4,%esp
     f4f:	68 00 20 00 00       	push   $0x2000
     f54:	68 40 83 00 00       	push   $0x8340
     f59:	57                   	push   %edi
     f5a:	e8 15 28 00 00       	call   3774 <read>
     f5f:	83 c4 10             	add    $0x10,%esp
     f62:	85 c0                	test   %eax,%eax
     f64:	7e 19                	jle    f7f <fourfiles+0x15c>
     f66:	ba 00 00 00 00       	mov    $0x0,%edx
     f6b:	0f be 8a 40 83 00 00 	movsbl 0x8340(%edx),%ecx
     f72:	39 d9                	cmp    %ebx,%ecx
     f74:	75 c0                	jne    f36 <fourfiles+0x113>
     f76:	83 c2 01             	add    $0x1,%edx
     f79:	39 d0                	cmp    %edx,%eax
     f7b:	75 ee                	jne    f6b <fourfiles+0x148>
     f7d:	eb cb                	jmp    f4a <fourfiles+0x127>
     f7f:	83 ec 0c             	sub    $0xc,%esp
     f82:	57                   	push   %edi
     f83:	e8 fc 27 00 00       	call   3784 <close>
     f88:	83 c4 10             	add    $0x10,%esp
     f8b:	81 fe 70 17 00 00    	cmp    $0x1770,%esi
     f91:	75 37                	jne    fca <fourfiles+0x1a7>
     f93:	83 ec 0c             	sub    $0xc,%esp
     f96:	ff 75 d4             	push   -0x2c(%ebp)
     f99:	e8 0e 28 00 00       	call   37ac <unlink>
     f9e:	83 c3 01             	add    $0x1,%ebx
     fa1:	83 c4 10             	add    $0x10,%esp
     fa4:	83 fb 32             	cmp    $0x32,%ebx
     fa7:	74 36                	je     fdf <fourfiles+0x1bc>
     fa9:	8b 84 9d 18 ff ff ff 	mov    -0xe8(%ebp,%ebx,4),%eax
     fb0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
     fb3:	83 ec 08             	sub    $0x8,%esp
     fb6:	6a 00                	push   $0x0
     fb8:	50                   	push   %eax
     fb9:	e8 de 27 00 00       	call   379c <open>
     fbe:	89 c7                	mov    %eax,%edi
     fc0:	83 c4 10             	add    $0x10,%esp
     fc3:	be 00 00 00 00       	mov    $0x0,%esi
     fc8:	eb 82                	jmp    f4c <fourfiles+0x129>
     fca:	83 ec 04             	sub    $0x4,%esp
     fcd:	56                   	push   %esi
     fce:	68 2d 40 00 00       	push   $0x402d
     fd3:	6a 01                	push   $0x1
     fd5:	e8 c2 28 00 00       	call   389c <printf>
     fda:	e8 7d 27 00 00       	call   375c <exit>
     fdf:	83 ec 08             	sub    $0x8,%esp
     fe2:	68 3e 40 00 00       	push   $0x403e
     fe7:	6a 01                	push   $0x1
     fe9:	e8 ae 28 00 00       	call   389c <printf>
     fee:	83 c4 10             	add    $0x10,%esp
     ff1:	8d 65 f4             	lea    -0xc(%ebp),%esp
     ff4:	5b                   	pop    %ebx
     ff5:	5e                   	pop    %esi
     ff6:	5f                   	pop    %edi
     ff7:	5d                   	pop    %ebp
     ff8:	c3                   	ret

00000ff9 <createdelete>:
     ff9:	55                   	push   %ebp
     ffa:	89 e5                	mov    %esp,%ebp
     ffc:	57                   	push   %edi
     ffd:	56                   	push   %esi
     ffe:	53                   	push   %ebx
     fff:	83 ec 44             	sub    $0x44,%esp
    1002:	68 4c 40 00 00       	push   $0x404c
    1007:	6a 01                	push   $0x1
    1009:	e8 8e 28 00 00       	call   389c <printf>
    100e:	83 c4 10             	add    $0x10,%esp
    1011:	be 00 00 00 00       	mov    $0x0,%esi
    1016:	e8 39 27 00 00       	call   3754 <fork>
    101b:	85 c0                	test   %eax,%eax
    101d:	78 35                	js     1054 <createdelete+0x5b>
    101f:	74 47                	je     1068 <createdelete+0x6f>
    1021:	83 c6 01             	add    $0x1,%esi
    1024:	83 fe 04             	cmp    $0x4,%esi
    1027:	75 ed                	jne    1016 <createdelete+0x1d>
    1029:	e8 36 27 00 00       	call   3764 <wait>
    102e:	e8 31 27 00 00       	call   3764 <wait>
    1033:	e8 2c 27 00 00       	call   3764 <wait>
    1038:	e8 27 27 00 00       	call   3764 <wait>
    103d:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    1041:	c6 45 c7 30          	movb   $0x30,-0x39(%ebp)
    1045:	be ff ff ff ff       	mov    $0xffffffff,%esi
    104a:	bf 00 00 00 00       	mov    $0x0,%edi
    104f:	e9 3d 01 00 00       	jmp    1191 <createdelete+0x198>
    1054:	83 ec 08             	sub    $0x8,%esp
    1057:	68 d5 4a 00 00       	push   $0x4ad5
    105c:	6a 01                	push   $0x1
    105e:	e8 39 28 00 00       	call   389c <printf>
    1063:	e8 f4 26 00 00       	call   375c <exit>
    1068:	89 c3                	mov    %eax,%ebx
    106a:	8d 46 70             	lea    0x70(%esi),%eax
    106d:	88 45 c8             	mov    %al,-0x38(%ebp)
    1070:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    1074:	8d 75 c8             	lea    -0x38(%ebp),%esi
    1077:	eb 1c                	jmp    1095 <createdelete+0x9c>
    1079:	83 ec 08             	sub    $0x8,%esp
    107c:	68 9b 42 00 00       	push   $0x429b
    1081:	6a 01                	push   $0x1
    1083:	e8 14 28 00 00       	call   389c <printf>
    1088:	e8 cf 26 00 00       	call   375c <exit>
    108d:	83 c3 01             	add    $0x1,%ebx
    1090:	83 fb 14             	cmp    $0x14,%ebx
    1093:	74 67                	je     10fc <createdelete+0x103>
    1095:	8d 43 30             	lea    0x30(%ebx),%eax
    1098:	88 45 c9             	mov    %al,-0x37(%ebp)
    109b:	83 ec 08             	sub    $0x8,%esp
    109e:	68 02 02 00 00       	push   $0x202
    10a3:	56                   	push   %esi
    10a4:	e8 f3 26 00 00       	call   379c <open>
    10a9:	83 c4 10             	add    $0x10,%esp
    10ac:	85 c0                	test   %eax,%eax
    10ae:	78 c9                	js     1079 <createdelete+0x80>
    10b0:	83 ec 0c             	sub    $0xc,%esp
    10b3:	50                   	push   %eax
    10b4:	e8 cb 26 00 00       	call   3784 <close>
    10b9:	83 c4 10             	add    $0x10,%esp
    10bc:	85 db                	test   %ebx,%ebx
    10be:	0f 8e 2b 01 00 00    	jle    11ef <createdelete+0x1f6>
    10c4:	f6 c3 01             	test   $0x1,%bl
    10c7:	75 c4                	jne    108d <createdelete+0x94>
    10c9:	89 d8                	mov    %ebx,%eax
    10cb:	c1 e8 1f             	shr    $0x1f,%eax
    10ce:	01 d8                	add    %ebx,%eax
    10d0:	d1 f8                	sar    $1,%eax
    10d2:	83 c0 30             	add    $0x30,%eax
    10d5:	88 45 c9             	mov    %al,-0x37(%ebp)
    10d8:	83 ec 0c             	sub    $0xc,%esp
    10db:	56                   	push   %esi
    10dc:	e8 cb 26 00 00       	call   37ac <unlink>
    10e1:	83 c4 10             	add    $0x10,%esp
    10e4:	85 c0                	test   %eax,%eax
    10e6:	79 a5                	jns    108d <createdelete+0x94>
    10e8:	83 ec 08             	sub    $0x8,%esp
    10eb:	68 4d 3c 00 00       	push   $0x3c4d
    10f0:	6a 01                	push   $0x1
    10f2:	e8 a5 27 00 00       	call   389c <printf>
    10f7:	e8 60 26 00 00       	call   375c <exit>
    10fc:	e8 5b 26 00 00       	call   375c <exit>
    1101:	83 fe 08             	cmp    $0x8,%esi
    1104:	76 52                	jbe    1158 <createdelete+0x15f>
    1106:	85 c0                	test   %eax,%eax
    1108:	79 6a                	jns    1174 <createdelete+0x17b>
    110a:	83 c3 01             	add    $0x1,%ebx
    110d:	80 fb 74             	cmp    $0x74,%bl
    1110:	74 70                	je     1182 <createdelete+0x189>
    1112:	88 5d c8             	mov    %bl,-0x38(%ebp)
    1115:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
    1119:	88 45 c9             	mov    %al,-0x37(%ebp)
    111c:	83 ec 08             	sub    $0x8,%esp
    111f:	6a 00                	push   $0x0
    1121:	8d 45 c8             	lea    -0x38(%ebp),%eax
    1124:	50                   	push   %eax
    1125:	e8 72 26 00 00       	call   379c <open>
    112a:	83 c4 10             	add    $0x10,%esp
    112d:	85 ff                	test   %edi,%edi
    112f:	0f 94 c2             	sete   %dl
    1132:	83 ff 09             	cmp    $0x9,%edi
    1135:	0f 9f c1             	setg   %cl
    1138:	08 ca                	or     %cl,%dl
    113a:	74 c5                	je     1101 <createdelete+0x108>
    113c:	85 c0                	test   %eax,%eax
    113e:	79 c1                	jns    1101 <createdelete+0x108>
    1140:	83 ec 04             	sub    $0x4,%esp
    1143:	8d 45 c8             	lea    -0x38(%ebp),%eax
    1146:	50                   	push   %eax
    1147:	68 14 4d 00 00       	push   $0x4d14
    114c:	6a 01                	push   $0x1
    114e:	e8 49 27 00 00       	call   389c <printf>
    1153:	e8 04 26 00 00       	call   375c <exit>
    1158:	85 c0                	test   %eax,%eax
    115a:	78 ae                	js     110a <createdelete+0x111>
    115c:	83 ec 04             	sub    $0x4,%esp
    115f:	8d 45 c8             	lea    -0x38(%ebp),%eax
    1162:	50                   	push   %eax
    1163:	68 38 4d 00 00       	push   $0x4d38
    1168:	6a 01                	push   $0x1
    116a:	e8 2d 27 00 00       	call   389c <printf>
    116f:	e8 e8 25 00 00       	call   375c <exit>
    1174:	83 ec 0c             	sub    $0xc,%esp
    1177:	50                   	push   %eax
    1178:	e8 07 26 00 00       	call   3784 <close>
    117d:	83 c4 10             	add    $0x10,%esp
    1180:	eb 88                	jmp    110a <createdelete+0x111>
    1182:	83 c7 01             	add    $0x1,%edi
    1185:	83 c6 01             	add    $0x1,%esi
    1188:	80 45 c7 01          	addb   $0x1,-0x39(%ebp)
    118c:	83 ff 14             	cmp    $0x14,%edi
    118f:	74 3b                	je     11cc <createdelete+0x1d3>
    1191:	bb 70 00 00 00       	mov    $0x70,%ebx
    1196:	e9 77 ff ff ff       	jmp    1112 <createdelete+0x119>
    119b:	83 c6 01             	add    $0x1,%esi
    119e:	83 c7 01             	add    $0x1,%edi
    11a1:	89 f0                	mov    %esi,%eax
    11a3:	3c 84                	cmp    $0x84,%al
    11a5:	74 31                	je     11d8 <createdelete+0x1df>
    11a7:	bb 04 00 00 00       	mov    $0x4,%ebx
    11ac:	89 f0                	mov    %esi,%eax
    11ae:	88 45 c8             	mov    %al,-0x38(%ebp)
    11b1:	89 f8                	mov    %edi,%eax
    11b3:	88 45 c9             	mov    %al,-0x37(%ebp)
    11b6:	83 ec 0c             	sub    $0xc,%esp
    11b9:	8d 45 c8             	lea    -0x38(%ebp),%eax
    11bc:	50                   	push   %eax
    11bd:	e8 ea 25 00 00       	call   37ac <unlink>
    11c2:	83 c4 10             	add    $0x10,%esp
    11c5:	83 eb 01             	sub    $0x1,%ebx
    11c8:	75 e2                	jne    11ac <createdelete+0x1b3>
    11ca:	eb cf                	jmp    119b <createdelete+0x1a2>
    11cc:	bf 30 00 00 00       	mov    $0x30,%edi
    11d1:	be 70 00 00 00       	mov    $0x70,%esi
    11d6:	eb cf                	jmp    11a7 <createdelete+0x1ae>
    11d8:	83 ec 08             	sub    $0x8,%esp
    11db:	68 5f 40 00 00       	push   $0x405f
    11e0:	6a 01                	push   $0x1
    11e2:	e8 b5 26 00 00       	call   389c <printf>
    11e7:	8d 65 f4             	lea    -0xc(%ebp),%esp
    11ea:	5b                   	pop    %ebx
    11eb:	5e                   	pop    %esi
    11ec:	5f                   	pop    %edi
    11ed:	5d                   	pop    %ebp
    11ee:	c3                   	ret
    11ef:	83 c3 01             	add    $0x1,%ebx
    11f2:	e9 9e fe ff ff       	jmp    1095 <createdelete+0x9c>

000011f7 <unlinkread>:
    11f7:	55                   	push   %ebp
    11f8:	89 e5                	mov    %esp,%ebp
    11fa:	56                   	push   %esi
    11fb:	53                   	push   %ebx
    11fc:	83 ec 08             	sub    $0x8,%esp
    11ff:	68 70 40 00 00       	push   $0x4070
    1204:	6a 01                	push   $0x1
    1206:	e8 91 26 00 00       	call   389c <printf>
    120b:	83 c4 08             	add    $0x8,%esp
    120e:	68 02 02 00 00       	push   $0x202
    1213:	68 81 40 00 00       	push   $0x4081
    1218:	e8 7f 25 00 00       	call   379c <open>
    121d:	83 c4 10             	add    $0x10,%esp
    1220:	85 c0                	test   %eax,%eax
    1222:	0f 88 f0 00 00 00    	js     1318 <unlinkread+0x121>
    1228:	89 c3                	mov    %eax,%ebx
    122a:	83 ec 04             	sub    $0x4,%esp
    122d:	6a 05                	push   $0x5
    122f:	68 a6 40 00 00       	push   $0x40a6
    1234:	50                   	push   %eax
    1235:	e8 42 25 00 00       	call   377c <write>
    123a:	89 1c 24             	mov    %ebx,(%esp)
    123d:	e8 42 25 00 00       	call   3784 <close>
    1242:	83 c4 08             	add    $0x8,%esp
    1245:	6a 02                	push   $0x2
    1247:	68 81 40 00 00       	push   $0x4081
    124c:	e8 4b 25 00 00       	call   379c <open>
    1251:	89 c3                	mov    %eax,%ebx
    1253:	83 c4 10             	add    $0x10,%esp
    1256:	85 c0                	test   %eax,%eax
    1258:	0f 88 ce 00 00 00    	js     132c <unlinkread+0x135>
    125e:	83 ec 0c             	sub    $0xc,%esp
    1261:	68 81 40 00 00       	push   $0x4081
    1266:	e8 41 25 00 00       	call   37ac <unlink>
    126b:	83 c4 10             	add    $0x10,%esp
    126e:	85 c0                	test   %eax,%eax
    1270:	0f 85 ca 00 00 00    	jne    1340 <unlinkread+0x149>
    1276:	83 ec 08             	sub    $0x8,%esp
    1279:	68 02 02 00 00       	push   $0x202
    127e:	68 81 40 00 00       	push   $0x4081
    1283:	e8 14 25 00 00       	call   379c <open>
    1288:	89 c6                	mov    %eax,%esi
    128a:	83 c4 0c             	add    $0xc,%esp
    128d:	6a 03                	push   $0x3
    128f:	68 de 40 00 00       	push   $0x40de
    1294:	50                   	push   %eax
    1295:	e8 e2 24 00 00       	call   377c <write>
    129a:	89 34 24             	mov    %esi,(%esp)
    129d:	e8 e2 24 00 00       	call   3784 <close>
    12a2:	83 c4 0c             	add    $0xc,%esp
    12a5:	68 00 20 00 00       	push   $0x2000
    12aa:	68 40 83 00 00       	push   $0x8340
    12af:	53                   	push   %ebx
    12b0:	e8 bf 24 00 00       	call   3774 <read>
    12b5:	83 c4 10             	add    $0x10,%esp
    12b8:	83 f8 05             	cmp    $0x5,%eax
    12bb:	0f 85 93 00 00 00    	jne    1354 <unlinkread+0x15d>
    12c1:	80 3d 40 83 00 00 68 	cmpb   $0x68,0x8340
    12c8:	0f 85 9a 00 00 00    	jne    1368 <unlinkread+0x171>
    12ce:	83 ec 04             	sub    $0x4,%esp
    12d1:	6a 0a                	push   $0xa
    12d3:	68 40 83 00 00       	push   $0x8340
    12d8:	53                   	push   %ebx
    12d9:	e8 9e 24 00 00       	call   377c <write>
    12de:	83 c4 10             	add    $0x10,%esp
    12e1:	83 f8 0a             	cmp    $0xa,%eax
    12e4:	0f 85 92 00 00 00    	jne    137c <unlinkread+0x185>
    12ea:	83 ec 0c             	sub    $0xc,%esp
    12ed:	53                   	push   %ebx
    12ee:	e8 91 24 00 00       	call   3784 <close>
    12f3:	c7 04 24 81 40 00 00 	movl   $0x4081,(%esp)
    12fa:	e8 ad 24 00 00       	call   37ac <unlink>
    12ff:	83 c4 08             	add    $0x8,%esp
    1302:	68 29 41 00 00       	push   $0x4129
    1307:	6a 01                	push   $0x1
    1309:	e8 8e 25 00 00       	call   389c <printf>
    130e:	83 c4 10             	add    $0x10,%esp
    1311:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1314:	5b                   	pop    %ebx
    1315:	5e                   	pop    %esi
    1316:	5d                   	pop    %ebp
    1317:	c3                   	ret
    1318:	83 ec 08             	sub    $0x8,%esp
    131b:	68 8c 40 00 00       	push   $0x408c
    1320:	6a 01                	push   $0x1
    1322:	e8 75 25 00 00       	call   389c <printf>
    1327:	e8 30 24 00 00       	call   375c <exit>
    132c:	83 ec 08             	sub    $0x8,%esp
    132f:	68 ac 40 00 00       	push   $0x40ac
    1334:	6a 01                	push   $0x1
    1336:	e8 61 25 00 00       	call   389c <printf>
    133b:	e8 1c 24 00 00       	call   375c <exit>
    1340:	83 ec 08             	sub    $0x8,%esp
    1343:	68 c4 40 00 00       	push   $0x40c4
    1348:	6a 01                	push   $0x1
    134a:	e8 4d 25 00 00       	call   389c <printf>
    134f:	e8 08 24 00 00       	call   375c <exit>
    1354:	83 ec 08             	sub    $0x8,%esp
    1357:	68 e2 40 00 00       	push   $0x40e2
    135c:	6a 01                	push   $0x1
    135e:	e8 39 25 00 00       	call   389c <printf>
    1363:	e8 f4 23 00 00       	call   375c <exit>
    1368:	83 ec 08             	sub    $0x8,%esp
    136b:	68 f9 40 00 00       	push   $0x40f9
    1370:	6a 01                	push   $0x1
    1372:	e8 25 25 00 00       	call   389c <printf>
    1377:	e8 e0 23 00 00       	call   375c <exit>
    137c:	83 ec 08             	sub    $0x8,%esp
    137f:	68 10 41 00 00       	push   $0x4110
    1384:	6a 01                	push   $0x1
    1386:	e8 11 25 00 00       	call   389c <printf>
    138b:	e8 cc 23 00 00       	call   375c <exit>

00001390 <linktest>:
    1390:	55                   	push   %ebp
    1391:	89 e5                	mov    %esp,%ebp
    1393:	53                   	push   %ebx
    1394:	83 ec 0c             	sub    $0xc,%esp
    1397:	68 38 41 00 00       	push   $0x4138
    139c:	6a 01                	push   $0x1
    139e:	e8 f9 24 00 00       	call   389c <printf>
    13a3:	c7 04 24 42 41 00 00 	movl   $0x4142,(%esp)
    13aa:	e8 fd 23 00 00       	call   37ac <unlink>
    13af:	c7 04 24 46 41 00 00 	movl   $0x4146,(%esp)
    13b6:	e8 f1 23 00 00       	call   37ac <unlink>
    13bb:	83 c4 08             	add    $0x8,%esp
    13be:	68 02 02 00 00       	push   $0x202
    13c3:	68 42 41 00 00       	push   $0x4142
    13c8:	e8 cf 23 00 00       	call   379c <open>
    13cd:	83 c4 10             	add    $0x10,%esp
    13d0:	85 c0                	test   %eax,%eax
    13d2:	0f 88 2a 01 00 00    	js     1502 <linktest+0x172>
    13d8:	89 c3                	mov    %eax,%ebx
    13da:	83 ec 04             	sub    $0x4,%esp
    13dd:	6a 05                	push   $0x5
    13df:	68 a6 40 00 00       	push   $0x40a6
    13e4:	50                   	push   %eax
    13e5:	e8 92 23 00 00       	call   377c <write>
    13ea:	83 c4 10             	add    $0x10,%esp
    13ed:	83 f8 05             	cmp    $0x5,%eax
    13f0:	0f 85 20 01 00 00    	jne    1516 <linktest+0x186>
    13f6:	83 ec 0c             	sub    $0xc,%esp
    13f9:	53                   	push   %ebx
    13fa:	e8 85 23 00 00       	call   3784 <close>
    13ff:	83 c4 08             	add    $0x8,%esp
    1402:	68 46 41 00 00       	push   $0x4146
    1407:	68 42 41 00 00       	push   $0x4142
    140c:	e8 ab 23 00 00       	call   37bc <link>
    1411:	83 c4 10             	add    $0x10,%esp
    1414:	85 c0                	test   %eax,%eax
    1416:	0f 88 0e 01 00 00    	js     152a <linktest+0x19a>
    141c:	83 ec 0c             	sub    $0xc,%esp
    141f:	68 42 41 00 00       	push   $0x4142
    1424:	e8 83 23 00 00       	call   37ac <unlink>
    1429:	83 c4 08             	add    $0x8,%esp
    142c:	6a 00                	push   $0x0
    142e:	68 42 41 00 00       	push   $0x4142
    1433:	e8 64 23 00 00       	call   379c <open>
    1438:	83 c4 10             	add    $0x10,%esp
    143b:	85 c0                	test   %eax,%eax
    143d:	0f 89 fb 00 00 00    	jns    153e <linktest+0x1ae>
    1443:	83 ec 08             	sub    $0x8,%esp
    1446:	6a 00                	push   $0x0
    1448:	68 46 41 00 00       	push   $0x4146
    144d:	e8 4a 23 00 00       	call   379c <open>
    1452:	89 c3                	mov    %eax,%ebx
    1454:	83 c4 10             	add    $0x10,%esp
    1457:	85 c0                	test   %eax,%eax
    1459:	0f 88 f3 00 00 00    	js     1552 <linktest+0x1c2>
    145f:	83 ec 04             	sub    $0x4,%esp
    1462:	68 00 20 00 00       	push   $0x2000
    1467:	68 40 83 00 00       	push   $0x8340
    146c:	50                   	push   %eax
    146d:	e8 02 23 00 00       	call   3774 <read>
    1472:	83 c4 10             	add    $0x10,%esp
    1475:	83 f8 05             	cmp    $0x5,%eax
    1478:	0f 85 e8 00 00 00    	jne    1566 <linktest+0x1d6>
    147e:	83 ec 0c             	sub    $0xc,%esp
    1481:	53                   	push   %ebx
    1482:	e8 fd 22 00 00       	call   3784 <close>
    1487:	83 c4 08             	add    $0x8,%esp
    148a:	68 46 41 00 00       	push   $0x4146
    148f:	68 46 41 00 00       	push   $0x4146
    1494:	e8 23 23 00 00       	call   37bc <link>
    1499:	83 c4 10             	add    $0x10,%esp
    149c:	85 c0                	test   %eax,%eax
    149e:	0f 89 d6 00 00 00    	jns    157a <linktest+0x1ea>
    14a4:	83 ec 0c             	sub    $0xc,%esp
    14a7:	68 46 41 00 00       	push   $0x4146
    14ac:	e8 fb 22 00 00       	call   37ac <unlink>
    14b1:	83 c4 08             	add    $0x8,%esp
    14b4:	68 42 41 00 00       	push   $0x4142
    14b9:	68 46 41 00 00       	push   $0x4146
    14be:	e8 f9 22 00 00       	call   37bc <link>
    14c3:	83 c4 10             	add    $0x10,%esp
    14c6:	85 c0                	test   %eax,%eax
    14c8:	0f 89 c0 00 00 00    	jns    158e <linktest+0x1fe>
    14ce:	83 ec 08             	sub    $0x8,%esp
    14d1:	68 42 41 00 00       	push   $0x4142
    14d6:	68 0a 44 00 00       	push   $0x440a
    14db:	e8 dc 22 00 00       	call   37bc <link>
    14e0:	83 c4 10             	add    $0x10,%esp
    14e3:	85 c0                	test   %eax,%eax
    14e5:	0f 89 b7 00 00 00    	jns    15a2 <linktest+0x212>
    14eb:	83 ec 08             	sub    $0x8,%esp
    14ee:	68 e0 41 00 00       	push   $0x41e0
    14f3:	6a 01                	push   $0x1
    14f5:	e8 a2 23 00 00       	call   389c <printf>
    14fa:	83 c4 10             	add    $0x10,%esp
    14fd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1500:	c9                   	leave
    1501:	c3                   	ret
    1502:	83 ec 08             	sub    $0x8,%esp
    1505:	68 4a 41 00 00       	push   $0x414a
    150a:	6a 01                	push   $0x1
    150c:	e8 8b 23 00 00       	call   389c <printf>
    1511:	e8 46 22 00 00       	call   375c <exit>
    1516:	83 ec 08             	sub    $0x8,%esp
    1519:	68 5d 41 00 00       	push   $0x415d
    151e:	6a 01                	push   $0x1
    1520:	e8 77 23 00 00       	call   389c <printf>
    1525:	e8 32 22 00 00       	call   375c <exit>
    152a:	83 ec 08             	sub    $0x8,%esp
    152d:	68 6f 41 00 00       	push   $0x416f
    1532:	6a 01                	push   $0x1
    1534:	e8 63 23 00 00       	call   389c <printf>
    1539:	e8 1e 22 00 00       	call   375c <exit>
    153e:	83 ec 08             	sub    $0x8,%esp
    1541:	68 58 4d 00 00       	push   $0x4d58
    1546:	6a 01                	push   $0x1
    1548:	e8 4f 23 00 00       	call   389c <printf>
    154d:	e8 0a 22 00 00       	call   375c <exit>
    1552:	83 ec 08             	sub    $0x8,%esp
    1555:	68 84 41 00 00       	push   $0x4184
    155a:	6a 01                	push   $0x1
    155c:	e8 3b 23 00 00       	call   389c <printf>
    1561:	e8 f6 21 00 00       	call   375c <exit>
    1566:	83 ec 08             	sub    $0x8,%esp
    1569:	68 95 41 00 00       	push   $0x4195
    156e:	6a 01                	push   $0x1
    1570:	e8 27 23 00 00       	call   389c <printf>
    1575:	e8 e2 21 00 00       	call   375c <exit>
    157a:	83 ec 08             	sub    $0x8,%esp
    157d:	68 a6 41 00 00       	push   $0x41a6
    1582:	6a 01                	push   $0x1
    1584:	e8 13 23 00 00       	call   389c <printf>
    1589:	e8 ce 21 00 00       	call   375c <exit>
    158e:	83 ec 08             	sub    $0x8,%esp
    1591:	68 80 4d 00 00       	push   $0x4d80
    1596:	6a 01                	push   $0x1
    1598:	e8 ff 22 00 00       	call   389c <printf>
    159d:	e8 ba 21 00 00       	call   375c <exit>
    15a2:	83 ec 08             	sub    $0x8,%esp
    15a5:	68 c4 41 00 00       	push   $0x41c4
    15aa:	6a 01                	push   $0x1
    15ac:	e8 eb 22 00 00       	call   389c <printf>
    15b1:	e8 a6 21 00 00       	call   375c <exit>

000015b6 <concreate>:
    15b6:	55                   	push   %ebp
    15b7:	89 e5                	mov    %esp,%ebp
    15b9:	57                   	push   %edi
    15ba:	56                   	push   %esi
    15bb:	53                   	push   %ebx
    15bc:	83 ec 54             	sub    $0x54,%esp
    15bf:	68 ed 41 00 00       	push   $0x41ed
    15c4:	6a 01                	push   $0x1
    15c6:	e8 d1 22 00 00       	call   389c <printf>
    15cb:	c6 45 e5 43          	movb   $0x43,-0x1b(%ebp)
    15cf:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
    15d3:	83 c4 10             	add    $0x10,%esp
    15d6:	bb 00 00 00 00       	mov    $0x0,%ebx
    15db:	8d 75 e5             	lea    -0x1b(%ebp),%esi
    15de:	bf 56 55 55 55       	mov    $0x55555556,%edi
    15e3:	e9 75 02 00 00       	jmp    185d <concreate+0x2a7>
    15e8:	83 ec 08             	sub    $0x8,%esp
    15eb:	56                   	push   %esi
    15ec:	68 fd 41 00 00       	push   $0x41fd
    15f1:	e8 c6 21 00 00       	call   37bc <link>
    15f6:	83 c4 10             	add    $0x10,%esp
    15f9:	e9 4e 02 00 00       	jmp    184c <concreate+0x296>
    15fe:	ba 67 66 66 66       	mov    $0x66666667,%edx
    1603:	89 d8                	mov    %ebx,%eax
    1605:	f7 ea                	imul   %edx
    1607:	d1 fa                	sar    $1,%edx
    1609:	89 d8                	mov    %ebx,%eax
    160b:	c1 f8 1f             	sar    $0x1f,%eax
    160e:	29 c2                	sub    %eax,%edx
    1610:	8d 04 92             	lea    (%edx,%edx,4),%eax
    1613:	29 c3                	sub    %eax,%ebx
    1615:	83 fb 01             	cmp    $0x1,%ebx
    1618:	74 34                	je     164e <concreate+0x98>
    161a:	83 ec 08             	sub    $0x8,%esp
    161d:	68 02 02 00 00       	push   $0x202
    1622:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1625:	50                   	push   %eax
    1626:	e8 71 21 00 00       	call   379c <open>
    162b:	83 c4 10             	add    $0x10,%esp
    162e:	85 c0                	test   %eax,%eax
    1630:	0f 89 f9 01 00 00    	jns    182f <concreate+0x279>
    1636:	83 ec 04             	sub    $0x4,%esp
    1639:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    163c:	50                   	push   %eax
    163d:	68 00 42 00 00       	push   $0x4200
    1642:	6a 01                	push   $0x1
    1644:	e8 53 22 00 00       	call   389c <printf>
    1649:	e8 0e 21 00 00       	call   375c <exit>
    164e:	83 ec 08             	sub    $0x8,%esp
    1651:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1654:	50                   	push   %eax
    1655:	68 fd 41 00 00       	push   $0x41fd
    165a:	e8 5d 21 00 00       	call   37bc <link>
    165f:	83 c4 10             	add    $0x10,%esp
    1662:	e8 f5 20 00 00       	call   375c <exit>
    1667:	83 ec 04             	sub    $0x4,%esp
    166a:	6a 28                	push   $0x28
    166c:	6a 00                	push   $0x0
    166e:	8d 45 bd             	lea    -0x43(%ebp),%eax
    1671:	50                   	push   %eax
    1672:	e8 92 1f 00 00       	call   3609 <memset>
    1677:	83 c4 08             	add    $0x8,%esp
    167a:	6a 00                	push   $0x0
    167c:	68 0a 44 00 00       	push   $0x440a
    1681:	e8 16 21 00 00       	call   379c <open>
    1686:	89 c3                	mov    %eax,%ebx
    1688:	83 c4 10             	add    $0x10,%esp
    168b:	bf 00 00 00 00       	mov    $0x0,%edi
    1690:	8d 75 ac             	lea    -0x54(%ebp),%esi
    1693:	83 ec 04             	sub    $0x4,%esp
    1696:	6a 10                	push   $0x10
    1698:	56                   	push   %esi
    1699:	53                   	push   %ebx
    169a:	e8 d5 20 00 00       	call   3774 <read>
    169f:	83 c4 10             	add    $0x10,%esp
    16a2:	85 c0                	test   %eax,%eax
    16a4:	7e 60                	jle    1706 <concreate+0x150>
    16a6:	66 83 7d ac 00       	cmpw   $0x0,-0x54(%ebp)
    16ab:	74 e6                	je     1693 <concreate+0xdd>
    16ad:	80 7d ae 43          	cmpb   $0x43,-0x52(%ebp)
    16b1:	75 e0                	jne    1693 <concreate+0xdd>
    16b3:	80 7d b0 00          	cmpb   $0x0,-0x50(%ebp)
    16b7:	75 da                	jne    1693 <concreate+0xdd>
    16b9:	0f be 45 af          	movsbl -0x51(%ebp),%eax
    16bd:	83 e8 30             	sub    $0x30,%eax
    16c0:	83 f8 27             	cmp    $0x27,%eax
    16c3:	77 11                	ja     16d6 <concreate+0x120>
    16c5:	80 7c 05 bd 00       	cmpb   $0x0,-0x43(%ebp,%eax,1)
    16ca:	75 22                	jne    16ee <concreate+0x138>
    16cc:	c6 44 05 bd 01       	movb   $0x1,-0x43(%ebp,%eax,1)
    16d1:	83 c7 01             	add    $0x1,%edi
    16d4:	eb bd                	jmp    1693 <concreate+0xdd>
    16d6:	83 ec 04             	sub    $0x4,%esp
    16d9:	8d 45 ae             	lea    -0x52(%ebp),%eax
    16dc:	50                   	push   %eax
    16dd:	68 1c 42 00 00       	push   $0x421c
    16e2:	6a 01                	push   $0x1
    16e4:	e8 b3 21 00 00       	call   389c <printf>
    16e9:	e8 6e 20 00 00       	call   375c <exit>
    16ee:	83 ec 04             	sub    $0x4,%esp
    16f1:	8d 45 ae             	lea    -0x52(%ebp),%eax
    16f4:	50                   	push   %eax
    16f5:	68 35 42 00 00       	push   $0x4235
    16fa:	6a 01                	push   $0x1
    16fc:	e8 9b 21 00 00       	call   389c <printf>
    1701:	e8 56 20 00 00       	call   375c <exit>
    1706:	83 ec 0c             	sub    $0xc,%esp
    1709:	53                   	push   %ebx
    170a:	e8 75 20 00 00       	call   3784 <close>
    170f:	83 c4 10             	add    $0x10,%esp
    1712:	83 ff 28             	cmp    $0x28,%edi
    1715:	75 0d                	jne    1724 <concreate+0x16e>
    1717:	bb 00 00 00 00       	mov    $0x0,%ebx
    171c:	8d 7d e5             	lea    -0x1b(%ebp),%edi
    171f:	e9 88 00 00 00       	jmp    17ac <concreate+0x1f6>
    1724:	83 ec 08             	sub    $0x8,%esp
    1727:	68 a4 4d 00 00       	push   $0x4da4
    172c:	6a 01                	push   $0x1
    172e:	e8 69 21 00 00       	call   389c <printf>
    1733:	e8 24 20 00 00       	call   375c <exit>
    1738:	83 ec 08             	sub    $0x8,%esp
    173b:	68 d5 4a 00 00       	push   $0x4ad5
    1740:	6a 01                	push   $0x1
    1742:	e8 55 21 00 00       	call   389c <printf>
    1747:	e8 10 20 00 00       	call   375c <exit>
    174c:	83 ec 08             	sub    $0x8,%esp
    174f:	6a 00                	push   $0x0
    1751:	57                   	push   %edi
    1752:	e8 45 20 00 00       	call   379c <open>
    1757:	89 04 24             	mov    %eax,(%esp)
    175a:	e8 25 20 00 00       	call   3784 <close>
    175f:	83 c4 08             	add    $0x8,%esp
    1762:	6a 00                	push   $0x0
    1764:	57                   	push   %edi
    1765:	e8 32 20 00 00       	call   379c <open>
    176a:	89 04 24             	mov    %eax,(%esp)
    176d:	e8 12 20 00 00       	call   3784 <close>
    1772:	83 c4 08             	add    $0x8,%esp
    1775:	6a 00                	push   $0x0
    1777:	57                   	push   %edi
    1778:	e8 1f 20 00 00       	call   379c <open>
    177d:	89 04 24             	mov    %eax,(%esp)
    1780:	e8 ff 1f 00 00       	call   3784 <close>
    1785:	83 c4 08             	add    $0x8,%esp
    1788:	6a 00                	push   $0x0
    178a:	57                   	push   %edi
    178b:	e8 0c 20 00 00       	call   379c <open>
    1790:	89 04 24             	mov    %eax,(%esp)
    1793:	e8 ec 1f 00 00       	call   3784 <close>
    1798:	83 c4 10             	add    $0x10,%esp
    179b:	85 f6                	test   %esi,%esi
    179d:	74 74                	je     1813 <concreate+0x25d>
    179f:	e8 c0 1f 00 00       	call   3764 <wait>
    17a4:	83 c3 01             	add    $0x1,%ebx
    17a7:	83 fb 28             	cmp    $0x28,%ebx
    17aa:	74 6c                	je     1818 <concreate+0x262>
    17ac:	8d 43 30             	lea    0x30(%ebx),%eax
    17af:	88 45 e6             	mov    %al,-0x1a(%ebp)
    17b2:	e8 9d 1f 00 00       	call   3754 <fork>
    17b7:	89 c6                	mov    %eax,%esi
    17b9:	85 c0                	test   %eax,%eax
    17bb:	0f 88 77 ff ff ff    	js     1738 <concreate+0x182>
    17c1:	b8 56 55 55 55       	mov    $0x55555556,%eax
    17c6:	f7 eb                	imul   %ebx
    17c8:	89 d8                	mov    %ebx,%eax
    17ca:	c1 f8 1f             	sar    $0x1f,%eax
    17cd:	29 c2                	sub    %eax,%edx
    17cf:	8d 04 52             	lea    (%edx,%edx,2),%eax
    17d2:	89 da                	mov    %ebx,%edx
    17d4:	29 c2                	sub    %eax,%edx
    17d6:	89 d0                	mov    %edx,%eax
    17d8:	09 f0                	or     %esi,%eax
    17da:	0f 84 6c ff ff ff    	je     174c <concreate+0x196>
    17e0:	85 f6                	test   %esi,%esi
    17e2:	74 09                	je     17ed <concreate+0x237>
    17e4:	83 fa 01             	cmp    $0x1,%edx
    17e7:	0f 84 5f ff ff ff    	je     174c <concreate+0x196>
    17ed:	83 ec 0c             	sub    $0xc,%esp
    17f0:	57                   	push   %edi
    17f1:	e8 b6 1f 00 00       	call   37ac <unlink>
    17f6:	89 3c 24             	mov    %edi,(%esp)
    17f9:	e8 ae 1f 00 00       	call   37ac <unlink>
    17fe:	89 3c 24             	mov    %edi,(%esp)
    1801:	e8 a6 1f 00 00       	call   37ac <unlink>
    1806:	89 3c 24             	mov    %edi,(%esp)
    1809:	e8 9e 1f 00 00       	call   37ac <unlink>
    180e:	83 c4 10             	add    $0x10,%esp
    1811:	eb 88                	jmp    179b <concreate+0x1e5>
    1813:	e8 44 1f 00 00       	call   375c <exit>
    1818:	83 ec 08             	sub    $0x8,%esp
    181b:	68 52 42 00 00       	push   $0x4252
    1820:	6a 01                	push   $0x1
    1822:	e8 75 20 00 00       	call   389c <printf>
    1827:	8d 65 f4             	lea    -0xc(%ebp),%esp
    182a:	5b                   	pop    %ebx
    182b:	5e                   	pop    %esi
    182c:	5f                   	pop    %edi
    182d:	5d                   	pop    %ebp
    182e:	c3                   	ret
    182f:	83 ec 0c             	sub    $0xc,%esp
    1832:	50                   	push   %eax
    1833:	e8 4c 1f 00 00       	call   3784 <close>
    1838:	83 c4 10             	add    $0x10,%esp
    183b:	e9 22 fe ff ff       	jmp    1662 <concreate+0xac>
    1840:	83 ec 0c             	sub    $0xc,%esp
    1843:	50                   	push   %eax
    1844:	e8 3b 1f 00 00       	call   3784 <close>
    1849:	83 c4 10             	add    $0x10,%esp
    184c:	e8 13 1f 00 00       	call   3764 <wait>
    1851:	83 c3 01             	add    $0x1,%ebx
    1854:	83 fb 28             	cmp    $0x28,%ebx
    1857:	0f 84 0a fe ff ff    	je     1667 <concreate+0xb1>
    185d:	8d 43 30             	lea    0x30(%ebx),%eax
    1860:	88 45 e6             	mov    %al,-0x1a(%ebp)
    1863:	83 ec 0c             	sub    $0xc,%esp
    1866:	56                   	push   %esi
    1867:	e8 40 1f 00 00       	call   37ac <unlink>
    186c:	e8 e3 1e 00 00       	call   3754 <fork>
    1871:	83 c4 10             	add    $0x10,%esp
    1874:	85 c0                	test   %eax,%eax
    1876:	0f 84 82 fd ff ff    	je     15fe <concreate+0x48>
    187c:	89 d8                	mov    %ebx,%eax
    187e:	f7 ef                	imul   %edi
    1880:	89 d8                	mov    %ebx,%eax
    1882:	c1 f8 1f             	sar    $0x1f,%eax
    1885:	29 c2                	sub    %eax,%edx
    1887:	8d 14 52             	lea    (%edx,%edx,2),%edx
    188a:	89 d8                	mov    %ebx,%eax
    188c:	29 d0                	sub    %edx,%eax
    188e:	83 f8 01             	cmp    $0x1,%eax
    1891:	0f 84 51 fd ff ff    	je     15e8 <concreate+0x32>
    1897:	83 ec 08             	sub    $0x8,%esp
    189a:	68 02 02 00 00       	push   $0x202
    189f:	56                   	push   %esi
    18a0:	e8 f7 1e 00 00       	call   379c <open>
    18a5:	83 c4 10             	add    $0x10,%esp
    18a8:	85 c0                	test   %eax,%eax
    18aa:	79 94                	jns    1840 <concreate+0x28a>
    18ac:	e9 85 fd ff ff       	jmp    1636 <concreate+0x80>

000018b1 <linkunlink>:
    18b1:	55                   	push   %ebp
    18b2:	89 e5                	mov    %esp,%ebp
    18b4:	57                   	push   %edi
    18b5:	56                   	push   %esi
    18b6:	53                   	push   %ebx
    18b7:	83 ec 24             	sub    $0x24,%esp
    18ba:	68 60 42 00 00       	push   $0x4260
    18bf:	6a 01                	push   $0x1
    18c1:	e8 d6 1f 00 00       	call   389c <printf>
    18c6:	c7 04 24 ed 44 00 00 	movl   $0x44ed,(%esp)
    18cd:	e8 da 1e 00 00       	call   37ac <unlink>
    18d2:	e8 7d 1e 00 00       	call   3754 <fork>
    18d7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    18da:	83 c4 10             	add    $0x10,%esp
    18dd:	85 c0                	test   %eax,%eax
    18df:	78 18                	js     18f9 <linkunlink+0x48>
    18e1:	83 7d e4 01          	cmpl   $0x1,-0x1c(%ebp)
    18e5:	19 db                	sbb    %ebx,%ebx
    18e7:	83 e3 60             	and    $0x60,%ebx
    18ea:	83 c3 01             	add    $0x1,%ebx
    18ed:	be 64 00 00 00       	mov    $0x64,%esi
    18f2:	bf ab aa aa aa       	mov    $0xaaaaaaab,%edi
    18f7:	eb 36                	jmp    192f <linkunlink+0x7e>
    18f9:	83 ec 08             	sub    $0x8,%esp
    18fc:	68 d5 4a 00 00       	push   $0x4ad5
    1901:	6a 01                	push   $0x1
    1903:	e8 94 1f 00 00       	call   389c <printf>
    1908:	e8 4f 1e 00 00       	call   375c <exit>
    190d:	83 ec 08             	sub    $0x8,%esp
    1910:	68 02 02 00 00       	push   $0x202
    1915:	68 ed 44 00 00       	push   $0x44ed
    191a:	e8 7d 1e 00 00       	call   379c <open>
    191f:	89 04 24             	mov    %eax,(%esp)
    1922:	e8 5d 1e 00 00       	call   3784 <close>
    1927:	83 c4 10             	add    $0x10,%esp
    192a:	83 ee 01             	sub    $0x1,%esi
    192d:	74 4d                	je     197c <linkunlink+0xcb>
    192f:	69 db 6d 4e c6 41    	imul   $0x41c64e6d,%ebx,%ebx
    1935:	81 c3 39 30 00 00    	add    $0x3039,%ebx
    193b:	89 d8                	mov    %ebx,%eax
    193d:	f7 e7                	mul    %edi
    193f:	89 d0                	mov    %edx,%eax
    1941:	d1 e8                	shr    $1,%eax
    1943:	83 e2 fe             	and    $0xfffffffe,%edx
    1946:	01 c2                	add    %eax,%edx
    1948:	89 d8                	mov    %ebx,%eax
    194a:	29 d0                	sub    %edx,%eax
    194c:	74 bf                	je     190d <linkunlink+0x5c>
    194e:	83 f8 01             	cmp    $0x1,%eax
    1951:	74 12                	je     1965 <linkunlink+0xb4>
    1953:	83 ec 0c             	sub    $0xc,%esp
    1956:	68 ed 44 00 00       	push   $0x44ed
    195b:	e8 4c 1e 00 00       	call   37ac <unlink>
    1960:	83 c4 10             	add    $0x10,%esp
    1963:	eb c5                	jmp    192a <linkunlink+0x79>
    1965:	83 ec 08             	sub    $0x8,%esp
    1968:	68 ed 44 00 00       	push   $0x44ed
    196d:	68 71 42 00 00       	push   $0x4271
    1972:	e8 45 1e 00 00       	call   37bc <link>
    1977:	83 c4 10             	add    $0x10,%esp
    197a:	eb ae                	jmp    192a <linkunlink+0x79>
    197c:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    1980:	74 1c                	je     199e <linkunlink+0xed>
    1982:	e8 dd 1d 00 00       	call   3764 <wait>
    1987:	83 ec 08             	sub    $0x8,%esp
    198a:	68 75 42 00 00       	push   $0x4275
    198f:	6a 01                	push   $0x1
    1991:	e8 06 1f 00 00       	call   389c <printf>
    1996:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1999:	5b                   	pop    %ebx
    199a:	5e                   	pop    %esi
    199b:	5f                   	pop    %edi
    199c:	5d                   	pop    %ebp
    199d:	c3                   	ret
    199e:	e8 b9 1d 00 00       	call   375c <exit>

000019a3 <bigdir>:
    19a3:	55                   	push   %ebp
    19a4:	89 e5                	mov    %esp,%ebp
    19a6:	57                   	push   %edi
    19a7:	56                   	push   %esi
    19a8:	53                   	push   %ebx
    19a9:	83 ec 24             	sub    $0x24,%esp
    19ac:	68 84 42 00 00       	push   $0x4284
    19b1:	6a 01                	push   $0x1
    19b3:	e8 e4 1e 00 00       	call   389c <printf>
    19b8:	c7 04 24 91 42 00 00 	movl   $0x4291,(%esp)
    19bf:	e8 e8 1d 00 00       	call   37ac <unlink>
    19c4:	83 c4 08             	add    $0x8,%esp
    19c7:	68 00 02 00 00       	push   $0x200
    19cc:	68 91 42 00 00       	push   $0x4291
    19d1:	e8 c6 1d 00 00       	call   379c <open>
    19d6:	83 c4 10             	add    $0x10,%esp
    19d9:	85 c0                	test   %eax,%eax
    19db:	0f 88 e0 00 00 00    	js     1ac1 <bigdir+0x11e>
    19e1:	83 ec 0c             	sub    $0xc,%esp
    19e4:	50                   	push   %eax
    19e5:	e8 9a 1d 00 00       	call   3784 <close>
    19ea:	83 c4 10             	add    $0x10,%esp
    19ed:	be 00 00 00 00       	mov    $0x0,%esi
    19f2:	8d 7d de             	lea    -0x22(%ebp),%edi
    19f5:	c6 45 de 78          	movb   $0x78,-0x22(%ebp)
    19f9:	8d 46 3f             	lea    0x3f(%esi),%eax
    19fc:	85 f6                	test   %esi,%esi
    19fe:	0f 49 c6             	cmovns %esi,%eax
    1a01:	c1 f8 06             	sar    $0x6,%eax
    1a04:	83 c0 30             	add    $0x30,%eax
    1a07:	88 45 df             	mov    %al,-0x21(%ebp)
    1a0a:	89 f2                	mov    %esi,%edx
    1a0c:	c1 fa 1f             	sar    $0x1f,%edx
    1a0f:	c1 ea 1a             	shr    $0x1a,%edx
    1a12:	8d 04 16             	lea    (%esi,%edx,1),%eax
    1a15:	83 e0 3f             	and    $0x3f,%eax
    1a18:	29 d0                	sub    %edx,%eax
    1a1a:	83 c0 30             	add    $0x30,%eax
    1a1d:	88 45 e0             	mov    %al,-0x20(%ebp)
    1a20:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
    1a24:	83 ec 08             	sub    $0x8,%esp
    1a27:	57                   	push   %edi
    1a28:	68 91 42 00 00       	push   $0x4291
    1a2d:	e8 8a 1d 00 00       	call   37bc <link>
    1a32:	89 c3                	mov    %eax,%ebx
    1a34:	83 c4 10             	add    $0x10,%esp
    1a37:	85 c0                	test   %eax,%eax
    1a39:	0f 85 96 00 00 00    	jne    1ad5 <bigdir+0x132>
    1a3f:	83 c6 01             	add    $0x1,%esi
    1a42:	81 fe f4 01 00 00    	cmp    $0x1f4,%esi
    1a48:	75 ab                	jne    19f5 <bigdir+0x52>
    1a4a:	83 ec 0c             	sub    $0xc,%esp
    1a4d:	68 91 42 00 00       	push   $0x4291
    1a52:	e8 55 1d 00 00       	call   37ac <unlink>
    1a57:	83 c4 10             	add    $0x10,%esp
    1a5a:	8d 75 de             	lea    -0x22(%ebp),%esi
    1a5d:	c6 45 de 78          	movb   $0x78,-0x22(%ebp)
    1a61:	8d 43 3f             	lea    0x3f(%ebx),%eax
    1a64:	85 db                	test   %ebx,%ebx
    1a66:	0f 49 c3             	cmovns %ebx,%eax
    1a69:	c1 f8 06             	sar    $0x6,%eax
    1a6c:	83 c0 30             	add    $0x30,%eax
    1a6f:	88 45 df             	mov    %al,-0x21(%ebp)
    1a72:	89 da                	mov    %ebx,%edx
    1a74:	c1 fa 1f             	sar    $0x1f,%edx
    1a77:	c1 ea 1a             	shr    $0x1a,%edx
    1a7a:	8d 04 13             	lea    (%ebx,%edx,1),%eax
    1a7d:	83 e0 3f             	and    $0x3f,%eax
    1a80:	29 d0                	sub    %edx,%eax
    1a82:	83 c0 30             	add    $0x30,%eax
    1a85:	88 45 e0             	mov    %al,-0x20(%ebp)
    1a88:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
    1a8c:	83 ec 0c             	sub    $0xc,%esp
    1a8f:	56                   	push   %esi
    1a90:	e8 17 1d 00 00       	call   37ac <unlink>
    1a95:	83 c4 10             	add    $0x10,%esp
    1a98:	85 c0                	test   %eax,%eax
    1a9a:	75 4d                	jne    1ae9 <bigdir+0x146>
    1a9c:	83 c3 01             	add    $0x1,%ebx
    1a9f:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
    1aa5:	75 b6                	jne    1a5d <bigdir+0xba>
    1aa7:	83 ec 08             	sub    $0x8,%esp
    1aaa:	68 d3 42 00 00       	push   $0x42d3
    1aaf:	6a 01                	push   $0x1
    1ab1:	e8 e6 1d 00 00       	call   389c <printf>
    1ab6:	83 c4 10             	add    $0x10,%esp
    1ab9:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1abc:	5b                   	pop    %ebx
    1abd:	5e                   	pop    %esi
    1abe:	5f                   	pop    %edi
    1abf:	5d                   	pop    %ebp
    1ac0:	c3                   	ret
    1ac1:	83 ec 08             	sub    $0x8,%esp
    1ac4:	68 94 42 00 00       	push   $0x4294
    1ac9:	6a 01                	push   $0x1
    1acb:	e8 cc 1d 00 00       	call   389c <printf>
    1ad0:	e8 87 1c 00 00       	call   375c <exit>
    1ad5:	83 ec 08             	sub    $0x8,%esp
    1ad8:	68 aa 42 00 00       	push   $0x42aa
    1add:	6a 01                	push   $0x1
    1adf:	e8 b8 1d 00 00       	call   389c <printf>
    1ae4:	e8 73 1c 00 00       	call   375c <exit>
    1ae9:	83 ec 08             	sub    $0x8,%esp
    1aec:	68 be 42 00 00       	push   $0x42be
    1af1:	6a 01                	push   $0x1
    1af3:	e8 a4 1d 00 00       	call   389c <printf>
    1af8:	e8 5f 1c 00 00       	call   375c <exit>

00001afd <subdir>:
    1afd:	55                   	push   %ebp
    1afe:	89 e5                	mov    %esp,%ebp
    1b00:	53                   	push   %ebx
    1b01:	83 ec 0c             	sub    $0xc,%esp
    1b04:	68 de 42 00 00       	push   $0x42de
    1b09:	6a 01                	push   $0x1
    1b0b:	e8 8c 1d 00 00       	call   389c <printf>
    1b10:	c7 04 24 67 43 00 00 	movl   $0x4367,(%esp)
    1b17:	e8 90 1c 00 00       	call   37ac <unlink>
    1b1c:	c7 04 24 04 44 00 00 	movl   $0x4404,(%esp)
    1b23:	e8 9c 1c 00 00       	call   37c4 <mkdir>
    1b28:	83 c4 10             	add    $0x10,%esp
    1b2b:	85 c0                	test   %eax,%eax
    1b2d:	0f 85 14 04 00 00    	jne    1f47 <subdir+0x44a>
    1b33:	83 ec 08             	sub    $0x8,%esp
    1b36:	68 02 02 00 00       	push   $0x202
    1b3b:	68 3d 43 00 00       	push   $0x433d
    1b40:	e8 57 1c 00 00       	call   379c <open>
    1b45:	89 c3                	mov    %eax,%ebx
    1b47:	83 c4 10             	add    $0x10,%esp
    1b4a:	85 c0                	test   %eax,%eax
    1b4c:	0f 88 09 04 00 00    	js     1f5b <subdir+0x45e>
    1b52:	83 ec 04             	sub    $0x4,%esp
    1b55:	6a 02                	push   $0x2
    1b57:	68 67 43 00 00       	push   $0x4367
    1b5c:	50                   	push   %eax
    1b5d:	e8 1a 1c 00 00       	call   377c <write>
    1b62:	89 1c 24             	mov    %ebx,(%esp)
    1b65:	e8 1a 1c 00 00       	call   3784 <close>
    1b6a:	c7 04 24 04 44 00 00 	movl   $0x4404,(%esp)
    1b71:	e8 36 1c 00 00       	call   37ac <unlink>
    1b76:	83 c4 10             	add    $0x10,%esp
    1b79:	85 c0                	test   %eax,%eax
    1b7b:	0f 89 ee 03 00 00    	jns    1f6f <subdir+0x472>
    1b81:	83 ec 0c             	sub    $0xc,%esp
    1b84:	68 18 43 00 00       	push   $0x4318
    1b89:	e8 36 1c 00 00       	call   37c4 <mkdir>
    1b8e:	83 c4 10             	add    $0x10,%esp
    1b91:	85 c0                	test   %eax,%eax
    1b93:	0f 85 ea 03 00 00    	jne    1f83 <subdir+0x486>
    1b99:	83 ec 08             	sub    $0x8,%esp
    1b9c:	68 02 02 00 00       	push   $0x202
    1ba1:	68 3a 43 00 00       	push   $0x433a
    1ba6:	e8 f1 1b 00 00       	call   379c <open>
    1bab:	89 c3                	mov    %eax,%ebx
    1bad:	83 c4 10             	add    $0x10,%esp
    1bb0:	85 c0                	test   %eax,%eax
    1bb2:	0f 88 df 03 00 00    	js     1f97 <subdir+0x49a>
    1bb8:	83 ec 04             	sub    $0x4,%esp
    1bbb:	6a 02                	push   $0x2
    1bbd:	68 5b 43 00 00       	push   $0x435b
    1bc2:	50                   	push   %eax
    1bc3:	e8 b4 1b 00 00       	call   377c <write>
    1bc8:	89 1c 24             	mov    %ebx,(%esp)
    1bcb:	e8 b4 1b 00 00       	call   3784 <close>
    1bd0:	83 c4 08             	add    $0x8,%esp
    1bd3:	6a 00                	push   $0x0
    1bd5:	68 5e 43 00 00       	push   $0x435e
    1bda:	e8 bd 1b 00 00       	call   379c <open>
    1bdf:	89 c3                	mov    %eax,%ebx
    1be1:	83 c4 10             	add    $0x10,%esp
    1be4:	85 c0                	test   %eax,%eax
    1be6:	0f 88 bf 03 00 00    	js     1fab <subdir+0x4ae>
    1bec:	83 ec 04             	sub    $0x4,%esp
    1bef:	68 00 20 00 00       	push   $0x2000
    1bf4:	68 40 83 00 00       	push   $0x8340
    1bf9:	50                   	push   %eax
    1bfa:	e8 75 1b 00 00       	call   3774 <read>
    1bff:	83 c4 10             	add    $0x10,%esp
    1c02:	83 f8 02             	cmp    $0x2,%eax
    1c05:	0f 85 b4 03 00 00    	jne    1fbf <subdir+0x4c2>
    1c0b:	80 3d 40 83 00 00 66 	cmpb   $0x66,0x8340
    1c12:	0f 85 a7 03 00 00    	jne    1fbf <subdir+0x4c2>
    1c18:	83 ec 0c             	sub    $0xc,%esp
    1c1b:	53                   	push   %ebx
    1c1c:	e8 63 1b 00 00       	call   3784 <close>
    1c21:	83 c4 08             	add    $0x8,%esp
    1c24:	68 9e 43 00 00       	push   $0x439e
    1c29:	68 3a 43 00 00       	push   $0x433a
    1c2e:	e8 89 1b 00 00       	call   37bc <link>
    1c33:	83 c4 10             	add    $0x10,%esp
    1c36:	85 c0                	test   %eax,%eax
    1c38:	0f 85 95 03 00 00    	jne    1fd3 <subdir+0x4d6>
    1c3e:	83 ec 0c             	sub    $0xc,%esp
    1c41:	68 3a 43 00 00       	push   $0x433a
    1c46:	e8 61 1b 00 00       	call   37ac <unlink>
    1c4b:	83 c4 10             	add    $0x10,%esp
    1c4e:	85 c0                	test   %eax,%eax
    1c50:	0f 85 91 03 00 00    	jne    1fe7 <subdir+0x4ea>
    1c56:	83 ec 08             	sub    $0x8,%esp
    1c59:	6a 00                	push   $0x0
    1c5b:	68 3a 43 00 00       	push   $0x433a
    1c60:	e8 37 1b 00 00       	call   379c <open>
    1c65:	83 c4 10             	add    $0x10,%esp
    1c68:	85 c0                	test   %eax,%eax
    1c6a:	0f 89 8b 03 00 00    	jns    1ffb <subdir+0x4fe>
    1c70:	83 ec 0c             	sub    $0xc,%esp
    1c73:	68 04 44 00 00       	push   $0x4404
    1c78:	e8 4f 1b 00 00       	call   37cc <chdir>
    1c7d:	83 c4 10             	add    $0x10,%esp
    1c80:	85 c0                	test   %eax,%eax
    1c82:	0f 85 87 03 00 00    	jne    200f <subdir+0x512>
    1c88:	83 ec 0c             	sub    $0xc,%esp
    1c8b:	68 d2 43 00 00       	push   $0x43d2
    1c90:	e8 37 1b 00 00       	call   37cc <chdir>
    1c95:	83 c4 10             	add    $0x10,%esp
    1c98:	85 c0                	test   %eax,%eax
    1c9a:	0f 85 83 03 00 00    	jne    2023 <subdir+0x526>
    1ca0:	83 ec 0c             	sub    $0xc,%esp
    1ca3:	68 f8 43 00 00       	push   $0x43f8
    1ca8:	e8 1f 1b 00 00       	call   37cc <chdir>
    1cad:	83 c4 10             	add    $0x10,%esp
    1cb0:	85 c0                	test   %eax,%eax
    1cb2:	0f 85 7f 03 00 00    	jne    2037 <subdir+0x53a>
    1cb8:	83 ec 0c             	sub    $0xc,%esp
    1cbb:	68 07 44 00 00       	push   $0x4407
    1cc0:	e8 07 1b 00 00       	call   37cc <chdir>
    1cc5:	83 c4 10             	add    $0x10,%esp
    1cc8:	85 c0                	test   %eax,%eax
    1cca:	0f 85 7b 03 00 00    	jne    204b <subdir+0x54e>
    1cd0:	83 ec 08             	sub    $0x8,%esp
    1cd3:	6a 00                	push   $0x0
    1cd5:	68 9e 43 00 00       	push   $0x439e
    1cda:	e8 bd 1a 00 00       	call   379c <open>
    1cdf:	89 c3                	mov    %eax,%ebx
    1ce1:	83 c4 10             	add    $0x10,%esp
    1ce4:	85 c0                	test   %eax,%eax
    1ce6:	0f 88 73 03 00 00    	js     205f <subdir+0x562>
    1cec:	83 ec 04             	sub    $0x4,%esp
    1cef:	68 00 20 00 00       	push   $0x2000
    1cf4:	68 40 83 00 00       	push   $0x8340
    1cf9:	50                   	push   %eax
    1cfa:	e8 75 1a 00 00       	call   3774 <read>
    1cff:	83 c4 10             	add    $0x10,%esp
    1d02:	83 f8 02             	cmp    $0x2,%eax
    1d05:	0f 85 68 03 00 00    	jne    2073 <subdir+0x576>
    1d0b:	83 ec 0c             	sub    $0xc,%esp
    1d0e:	53                   	push   %ebx
    1d0f:	e8 70 1a 00 00       	call   3784 <close>
    1d14:	83 c4 08             	add    $0x8,%esp
    1d17:	6a 00                	push   $0x0
    1d19:	68 3a 43 00 00       	push   $0x433a
    1d1e:	e8 79 1a 00 00       	call   379c <open>
    1d23:	83 c4 10             	add    $0x10,%esp
    1d26:	85 c0                	test   %eax,%eax
    1d28:	0f 89 59 03 00 00    	jns    2087 <subdir+0x58a>
    1d2e:	83 ec 08             	sub    $0x8,%esp
    1d31:	68 02 02 00 00       	push   $0x202
    1d36:	68 52 44 00 00       	push   $0x4452
    1d3b:	e8 5c 1a 00 00       	call   379c <open>
    1d40:	83 c4 10             	add    $0x10,%esp
    1d43:	85 c0                	test   %eax,%eax
    1d45:	0f 89 50 03 00 00    	jns    209b <subdir+0x59e>
    1d4b:	83 ec 08             	sub    $0x8,%esp
    1d4e:	68 02 02 00 00       	push   $0x202
    1d53:	68 77 44 00 00       	push   $0x4477
    1d58:	e8 3f 1a 00 00       	call   379c <open>
    1d5d:	83 c4 10             	add    $0x10,%esp
    1d60:	85 c0                	test   %eax,%eax
    1d62:	0f 89 47 03 00 00    	jns    20af <subdir+0x5b2>
    1d68:	83 ec 08             	sub    $0x8,%esp
    1d6b:	68 00 02 00 00       	push   $0x200
    1d70:	68 04 44 00 00       	push   $0x4404
    1d75:	e8 22 1a 00 00       	call   379c <open>
    1d7a:	83 c4 10             	add    $0x10,%esp
    1d7d:	85 c0                	test   %eax,%eax
    1d7f:	0f 89 3e 03 00 00    	jns    20c3 <subdir+0x5c6>
    1d85:	83 ec 08             	sub    $0x8,%esp
    1d88:	6a 02                	push   $0x2
    1d8a:	68 04 44 00 00       	push   $0x4404
    1d8f:	e8 08 1a 00 00       	call   379c <open>
    1d94:	83 c4 10             	add    $0x10,%esp
    1d97:	85 c0                	test   %eax,%eax
    1d99:	0f 89 38 03 00 00    	jns    20d7 <subdir+0x5da>
    1d9f:	83 ec 08             	sub    $0x8,%esp
    1da2:	6a 01                	push   $0x1
    1da4:	68 04 44 00 00       	push   $0x4404
    1da9:	e8 ee 19 00 00       	call   379c <open>
    1dae:	83 c4 10             	add    $0x10,%esp
    1db1:	85 c0                	test   %eax,%eax
    1db3:	0f 89 32 03 00 00    	jns    20eb <subdir+0x5ee>
    1db9:	83 ec 08             	sub    $0x8,%esp
    1dbc:	68 e6 44 00 00       	push   $0x44e6
    1dc1:	68 52 44 00 00       	push   $0x4452
    1dc6:	e8 f1 19 00 00       	call   37bc <link>
    1dcb:	83 c4 10             	add    $0x10,%esp
    1dce:	85 c0                	test   %eax,%eax
    1dd0:	0f 84 29 03 00 00    	je     20ff <subdir+0x602>
    1dd6:	83 ec 08             	sub    $0x8,%esp
    1dd9:	68 e6 44 00 00       	push   $0x44e6
    1dde:	68 77 44 00 00       	push   $0x4477
    1de3:	e8 d4 19 00 00       	call   37bc <link>
    1de8:	83 c4 10             	add    $0x10,%esp
    1deb:	85 c0                	test   %eax,%eax
    1ded:	0f 84 20 03 00 00    	je     2113 <subdir+0x616>
    1df3:	83 ec 08             	sub    $0x8,%esp
    1df6:	68 9e 43 00 00       	push   $0x439e
    1dfb:	68 3d 43 00 00       	push   $0x433d
    1e00:	e8 b7 19 00 00       	call   37bc <link>
    1e05:	83 c4 10             	add    $0x10,%esp
    1e08:	85 c0                	test   %eax,%eax
    1e0a:	0f 84 17 03 00 00    	je     2127 <subdir+0x62a>
    1e10:	83 ec 0c             	sub    $0xc,%esp
    1e13:	68 52 44 00 00       	push   $0x4452
    1e18:	e8 a7 19 00 00       	call   37c4 <mkdir>
    1e1d:	83 c4 10             	add    $0x10,%esp
    1e20:	85 c0                	test   %eax,%eax
    1e22:	0f 84 13 03 00 00    	je     213b <subdir+0x63e>
    1e28:	83 ec 0c             	sub    $0xc,%esp
    1e2b:	68 77 44 00 00       	push   $0x4477
    1e30:	e8 8f 19 00 00       	call   37c4 <mkdir>
    1e35:	83 c4 10             	add    $0x10,%esp
    1e38:	85 c0                	test   %eax,%eax
    1e3a:	0f 84 0f 03 00 00    	je     214f <subdir+0x652>
    1e40:	83 ec 0c             	sub    $0xc,%esp
    1e43:	68 9e 43 00 00       	push   $0x439e
    1e48:	e8 77 19 00 00       	call   37c4 <mkdir>
    1e4d:	83 c4 10             	add    $0x10,%esp
    1e50:	85 c0                	test   %eax,%eax
    1e52:	0f 84 0b 03 00 00    	je     2163 <subdir+0x666>
    1e58:	83 ec 0c             	sub    $0xc,%esp
    1e5b:	68 77 44 00 00       	push   $0x4477
    1e60:	e8 47 19 00 00       	call   37ac <unlink>
    1e65:	83 c4 10             	add    $0x10,%esp
    1e68:	85 c0                	test   %eax,%eax
    1e6a:	0f 84 07 03 00 00    	je     2177 <subdir+0x67a>
    1e70:	83 ec 0c             	sub    $0xc,%esp
    1e73:	68 52 44 00 00       	push   $0x4452
    1e78:	e8 2f 19 00 00       	call   37ac <unlink>
    1e7d:	83 c4 10             	add    $0x10,%esp
    1e80:	85 c0                	test   %eax,%eax
    1e82:	0f 84 03 03 00 00    	je     218b <subdir+0x68e>
    1e88:	83 ec 0c             	sub    $0xc,%esp
    1e8b:	68 3d 43 00 00       	push   $0x433d
    1e90:	e8 37 19 00 00       	call   37cc <chdir>
    1e95:	83 c4 10             	add    $0x10,%esp
    1e98:	85 c0                	test   %eax,%eax
    1e9a:	0f 84 ff 02 00 00    	je     219f <subdir+0x6a2>
    1ea0:	83 ec 0c             	sub    $0xc,%esp
    1ea3:	68 e9 44 00 00       	push   $0x44e9
    1ea8:	e8 1f 19 00 00       	call   37cc <chdir>
    1ead:	83 c4 10             	add    $0x10,%esp
    1eb0:	85 c0                	test   %eax,%eax
    1eb2:	0f 84 fb 02 00 00    	je     21b3 <subdir+0x6b6>
    1eb8:	83 ec 0c             	sub    $0xc,%esp
    1ebb:	68 9e 43 00 00       	push   $0x439e
    1ec0:	e8 e7 18 00 00       	call   37ac <unlink>
    1ec5:	83 c4 10             	add    $0x10,%esp
    1ec8:	85 c0                	test   %eax,%eax
    1eca:	0f 85 f7 02 00 00    	jne    21c7 <subdir+0x6ca>
    1ed0:	83 ec 0c             	sub    $0xc,%esp
    1ed3:	68 3d 43 00 00       	push   $0x433d
    1ed8:	e8 cf 18 00 00       	call   37ac <unlink>
    1edd:	83 c4 10             	add    $0x10,%esp
    1ee0:	85 c0                	test   %eax,%eax
    1ee2:	0f 85 f3 02 00 00    	jne    21db <subdir+0x6de>
    1ee8:	83 ec 0c             	sub    $0xc,%esp
    1eeb:	68 04 44 00 00       	push   $0x4404
    1ef0:	e8 b7 18 00 00       	call   37ac <unlink>
    1ef5:	83 c4 10             	add    $0x10,%esp
    1ef8:	85 c0                	test   %eax,%eax
    1efa:	0f 84 ef 02 00 00    	je     21ef <subdir+0x6f2>
    1f00:	83 ec 0c             	sub    $0xc,%esp
    1f03:	68 19 43 00 00       	push   $0x4319
    1f08:	e8 9f 18 00 00       	call   37ac <unlink>
    1f0d:	83 c4 10             	add    $0x10,%esp
    1f10:	85 c0                	test   %eax,%eax
    1f12:	0f 88 eb 02 00 00    	js     2203 <subdir+0x706>
    1f18:	83 ec 0c             	sub    $0xc,%esp
    1f1b:	68 04 44 00 00       	push   $0x4404
    1f20:	e8 87 18 00 00       	call   37ac <unlink>
    1f25:	83 c4 10             	add    $0x10,%esp
    1f28:	85 c0                	test   %eax,%eax
    1f2a:	0f 88 e7 02 00 00    	js     2217 <subdir+0x71a>
    1f30:	83 ec 08             	sub    $0x8,%esp
    1f33:	68 e6 45 00 00       	push   $0x45e6
    1f38:	6a 01                	push   $0x1
    1f3a:	e8 5d 19 00 00       	call   389c <printf>
    1f3f:	83 c4 10             	add    $0x10,%esp
    1f42:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1f45:	c9                   	leave
    1f46:	c3                   	ret
    1f47:	83 ec 08             	sub    $0x8,%esp
    1f4a:	68 eb 42 00 00       	push   $0x42eb
    1f4f:	6a 01                	push   $0x1
    1f51:	e8 46 19 00 00       	call   389c <printf>
    1f56:	e8 01 18 00 00       	call   375c <exit>
    1f5b:	83 ec 08             	sub    $0x8,%esp
    1f5e:	68 03 43 00 00       	push   $0x4303
    1f63:	6a 01                	push   $0x1
    1f65:	e8 32 19 00 00       	call   389c <printf>
    1f6a:	e8 ed 17 00 00       	call   375c <exit>
    1f6f:	83 ec 08             	sub    $0x8,%esp
    1f72:	68 d8 4d 00 00       	push   $0x4dd8
    1f77:	6a 01                	push   $0x1
    1f79:	e8 1e 19 00 00       	call   389c <printf>
    1f7e:	e8 d9 17 00 00       	call   375c <exit>
    1f83:	83 ec 08             	sub    $0x8,%esp
    1f86:	68 1f 43 00 00       	push   $0x431f
    1f8b:	6a 01                	push   $0x1
    1f8d:	e8 0a 19 00 00       	call   389c <printf>
    1f92:	e8 c5 17 00 00       	call   375c <exit>
    1f97:	83 ec 08             	sub    $0x8,%esp
    1f9a:	68 43 43 00 00       	push   $0x4343
    1f9f:	6a 01                	push   $0x1
    1fa1:	e8 f6 18 00 00       	call   389c <printf>
    1fa6:	e8 b1 17 00 00       	call   375c <exit>
    1fab:	83 ec 08             	sub    $0x8,%esp
    1fae:	68 6a 43 00 00       	push   $0x436a
    1fb3:	6a 01                	push   $0x1
    1fb5:	e8 e2 18 00 00       	call   389c <printf>
    1fba:	e8 9d 17 00 00       	call   375c <exit>
    1fbf:	83 ec 08             	sub    $0x8,%esp
    1fc2:	68 83 43 00 00       	push   $0x4383
    1fc7:	6a 01                	push   $0x1
    1fc9:	e8 ce 18 00 00       	call   389c <printf>
    1fce:	e8 89 17 00 00       	call   375c <exit>
    1fd3:	83 ec 08             	sub    $0x8,%esp
    1fd6:	68 00 4e 00 00       	push   $0x4e00
    1fdb:	6a 01                	push   $0x1
    1fdd:	e8 ba 18 00 00       	call   389c <printf>
    1fe2:	e8 75 17 00 00       	call   375c <exit>
    1fe7:	83 ec 08             	sub    $0x8,%esp
    1fea:	68 a9 43 00 00       	push   $0x43a9
    1fef:	6a 01                	push   $0x1
    1ff1:	e8 a6 18 00 00       	call   389c <printf>
    1ff6:	e8 61 17 00 00       	call   375c <exit>
    1ffb:	83 ec 08             	sub    $0x8,%esp
    1ffe:	68 24 4e 00 00       	push   $0x4e24
    2003:	6a 01                	push   $0x1
    2005:	e8 92 18 00 00       	call   389c <printf>
    200a:	e8 4d 17 00 00       	call   375c <exit>
    200f:	83 ec 08             	sub    $0x8,%esp
    2012:	68 c1 43 00 00       	push   $0x43c1
    2017:	6a 01                	push   $0x1
    2019:	e8 7e 18 00 00       	call   389c <printf>
    201e:	e8 39 17 00 00       	call   375c <exit>
    2023:	83 ec 08             	sub    $0x8,%esp
    2026:	68 de 43 00 00       	push   $0x43de
    202b:	6a 01                	push   $0x1
    202d:	e8 6a 18 00 00       	call   389c <printf>
    2032:	e8 25 17 00 00       	call   375c <exit>
    2037:	83 ec 08             	sub    $0x8,%esp
    203a:	68 de 43 00 00       	push   $0x43de
    203f:	6a 01                	push   $0x1
    2041:	e8 56 18 00 00       	call   389c <printf>
    2046:	e8 11 17 00 00       	call   375c <exit>
    204b:	83 ec 08             	sub    $0x8,%esp
    204e:	68 0c 44 00 00       	push   $0x440c
    2053:	6a 01                	push   $0x1
    2055:	e8 42 18 00 00       	call   389c <printf>
    205a:	e8 fd 16 00 00       	call   375c <exit>
    205f:	83 ec 08             	sub    $0x8,%esp
    2062:	68 1f 44 00 00       	push   $0x441f
    2067:	6a 01                	push   $0x1
    2069:	e8 2e 18 00 00       	call   389c <printf>
    206e:	e8 e9 16 00 00       	call   375c <exit>
    2073:	83 ec 08             	sub    $0x8,%esp
    2076:	68 37 44 00 00       	push   $0x4437
    207b:	6a 01                	push   $0x1
    207d:	e8 1a 18 00 00       	call   389c <printf>
    2082:	e8 d5 16 00 00       	call   375c <exit>
    2087:	83 ec 08             	sub    $0x8,%esp
    208a:	68 48 4e 00 00       	push   $0x4e48
    208f:	6a 01                	push   $0x1
    2091:	e8 06 18 00 00       	call   389c <printf>
    2096:	e8 c1 16 00 00       	call   375c <exit>
    209b:	83 ec 08             	sub    $0x8,%esp
    209e:	68 5b 44 00 00       	push   $0x445b
    20a3:	6a 01                	push   $0x1
    20a5:	e8 f2 17 00 00       	call   389c <printf>
    20aa:	e8 ad 16 00 00       	call   375c <exit>
    20af:	83 ec 08             	sub    $0x8,%esp
    20b2:	68 80 44 00 00       	push   $0x4480
    20b7:	6a 01                	push   $0x1
    20b9:	e8 de 17 00 00       	call   389c <printf>
    20be:	e8 99 16 00 00       	call   375c <exit>
    20c3:	83 ec 08             	sub    $0x8,%esp
    20c6:	68 9c 44 00 00       	push   $0x449c
    20cb:	6a 01                	push   $0x1
    20cd:	e8 ca 17 00 00       	call   389c <printf>
    20d2:	e8 85 16 00 00       	call   375c <exit>
    20d7:	83 ec 08             	sub    $0x8,%esp
    20da:	68 b2 44 00 00       	push   $0x44b2
    20df:	6a 01                	push   $0x1
    20e1:	e8 b6 17 00 00       	call   389c <printf>
    20e6:	e8 71 16 00 00       	call   375c <exit>
    20eb:	83 ec 08             	sub    $0x8,%esp
    20ee:	68 cb 44 00 00       	push   $0x44cb
    20f3:	6a 01                	push   $0x1
    20f5:	e8 a2 17 00 00       	call   389c <printf>
    20fa:	e8 5d 16 00 00       	call   375c <exit>
    20ff:	83 ec 08             	sub    $0x8,%esp
    2102:	68 70 4e 00 00       	push   $0x4e70
    2107:	6a 01                	push   $0x1
    2109:	e8 8e 17 00 00       	call   389c <printf>
    210e:	e8 49 16 00 00       	call   375c <exit>
    2113:	83 ec 08             	sub    $0x8,%esp
    2116:	68 94 4e 00 00       	push   $0x4e94
    211b:	6a 01                	push   $0x1
    211d:	e8 7a 17 00 00       	call   389c <printf>
    2122:	e8 35 16 00 00       	call   375c <exit>
    2127:	83 ec 08             	sub    $0x8,%esp
    212a:	68 b8 4e 00 00       	push   $0x4eb8
    212f:	6a 01                	push   $0x1
    2131:	e8 66 17 00 00       	call   389c <printf>
    2136:	e8 21 16 00 00       	call   375c <exit>
    213b:	83 ec 08             	sub    $0x8,%esp
    213e:	68 ef 44 00 00       	push   $0x44ef
    2143:	6a 01                	push   $0x1
    2145:	e8 52 17 00 00       	call   389c <printf>
    214a:	e8 0d 16 00 00       	call   375c <exit>
    214f:	83 ec 08             	sub    $0x8,%esp
    2152:	68 0a 45 00 00       	push   $0x450a
    2157:	6a 01                	push   $0x1
    2159:	e8 3e 17 00 00       	call   389c <printf>
    215e:	e8 f9 15 00 00       	call   375c <exit>
    2163:	83 ec 08             	sub    $0x8,%esp
    2166:	68 25 45 00 00       	push   $0x4525
    216b:	6a 01                	push   $0x1
    216d:	e8 2a 17 00 00       	call   389c <printf>
    2172:	e8 e5 15 00 00       	call   375c <exit>
    2177:	83 ec 08             	sub    $0x8,%esp
    217a:	68 42 45 00 00       	push   $0x4542
    217f:	6a 01                	push   $0x1
    2181:	e8 16 17 00 00       	call   389c <printf>
    2186:	e8 d1 15 00 00       	call   375c <exit>
    218b:	83 ec 08             	sub    $0x8,%esp
    218e:	68 5e 45 00 00       	push   $0x455e
    2193:	6a 01                	push   $0x1
    2195:	e8 02 17 00 00       	call   389c <printf>
    219a:	e8 bd 15 00 00       	call   375c <exit>
    219f:	83 ec 08             	sub    $0x8,%esp
    21a2:	68 7a 45 00 00       	push   $0x457a
    21a7:	6a 01                	push   $0x1
    21a9:	e8 ee 16 00 00       	call   389c <printf>
    21ae:	e8 a9 15 00 00       	call   375c <exit>
    21b3:	83 ec 08             	sub    $0x8,%esp
    21b6:	68 92 45 00 00       	push   $0x4592
    21bb:	6a 01                	push   $0x1
    21bd:	e8 da 16 00 00       	call   389c <printf>
    21c2:	e8 95 15 00 00       	call   375c <exit>
    21c7:	83 ec 08             	sub    $0x8,%esp
    21ca:	68 a9 43 00 00       	push   $0x43a9
    21cf:	6a 01                	push   $0x1
    21d1:	e8 c6 16 00 00       	call   389c <printf>
    21d6:	e8 81 15 00 00       	call   375c <exit>
    21db:	83 ec 08             	sub    $0x8,%esp
    21de:	68 aa 45 00 00       	push   $0x45aa
    21e3:	6a 01                	push   $0x1
    21e5:	e8 b2 16 00 00       	call   389c <printf>
    21ea:	e8 6d 15 00 00       	call   375c <exit>
    21ef:	83 ec 08             	sub    $0x8,%esp
    21f2:	68 dc 4e 00 00       	push   $0x4edc
    21f7:	6a 01                	push   $0x1
    21f9:	e8 9e 16 00 00       	call   389c <printf>
    21fe:	e8 59 15 00 00       	call   375c <exit>
    2203:	83 ec 08             	sub    $0x8,%esp
    2206:	68 bf 45 00 00       	push   $0x45bf
    220b:	6a 01                	push   $0x1
    220d:	e8 8a 16 00 00       	call   389c <printf>
    2212:	e8 45 15 00 00       	call   375c <exit>
    2217:	83 ec 08             	sub    $0x8,%esp
    221a:	68 d4 45 00 00       	push   $0x45d4
    221f:	6a 01                	push   $0x1
    2221:	e8 76 16 00 00       	call   389c <printf>
    2226:	e8 31 15 00 00       	call   375c <exit>

0000222b <bigwrite>:
    222b:	55                   	push   %ebp
    222c:	89 e5                	mov    %esp,%ebp
    222e:	57                   	push   %edi
    222f:	56                   	push   %esi
    2230:	53                   	push   %ebx
    2231:	83 ec 14             	sub    $0x14,%esp
    2234:	68 f1 45 00 00       	push   $0x45f1
    2239:	6a 01                	push   $0x1
    223b:	e8 5c 16 00 00       	call   389c <printf>
    2240:	c7 04 24 00 46 00 00 	movl   $0x4600,(%esp)
    2247:	e8 60 15 00 00       	call   37ac <unlink>
    224c:	83 c4 10             	add    $0x10,%esp
    224f:	bb f3 01 00 00       	mov    $0x1f3,%ebx
    2254:	83 ec 08             	sub    $0x8,%esp
    2257:	68 02 02 00 00       	push   $0x202
    225c:	68 00 46 00 00       	push   $0x4600
    2261:	e8 36 15 00 00       	call   379c <open>
    2266:	89 c6                	mov    %eax,%esi
    2268:	83 c4 10             	add    $0x10,%esp
    226b:	85 c0                	test   %eax,%eax
    226d:	78 6e                	js     22dd <bigwrite+0xb2>
    226f:	83 ec 04             	sub    $0x4,%esp
    2272:	53                   	push   %ebx
    2273:	68 40 83 00 00       	push   $0x8340
    2278:	50                   	push   %eax
    2279:	e8 fe 14 00 00       	call   377c <write>
    227e:	89 c7                	mov    %eax,%edi
    2280:	83 c4 10             	add    $0x10,%esp
    2283:	39 c3                	cmp    %eax,%ebx
    2285:	75 6a                	jne    22f1 <bigwrite+0xc6>
    2287:	83 ec 04             	sub    $0x4,%esp
    228a:	53                   	push   %ebx
    228b:	68 40 83 00 00       	push   $0x8340
    2290:	56                   	push   %esi
    2291:	e8 e6 14 00 00       	call   377c <write>
    2296:	83 c4 10             	add    $0x10,%esp
    2299:	39 d8                	cmp    %ebx,%eax
    229b:	75 56                	jne    22f3 <bigwrite+0xc8>
    229d:	83 ec 0c             	sub    $0xc,%esp
    22a0:	56                   	push   %esi
    22a1:	e8 de 14 00 00       	call   3784 <close>
    22a6:	c7 04 24 00 46 00 00 	movl   $0x4600,(%esp)
    22ad:	e8 fa 14 00 00       	call   37ac <unlink>
    22b2:	81 c3 d7 01 00 00    	add    $0x1d7,%ebx
    22b8:	83 c4 10             	add    $0x10,%esp
    22bb:	81 fb 07 18 00 00    	cmp    $0x1807,%ebx
    22c1:	75 91                	jne    2254 <bigwrite+0x29>
    22c3:	83 ec 08             	sub    $0x8,%esp
    22c6:	68 33 46 00 00       	push   $0x4633
    22cb:	6a 01                	push   $0x1
    22cd:	e8 ca 15 00 00       	call   389c <printf>
    22d2:	83 c4 10             	add    $0x10,%esp
    22d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
    22d8:	5b                   	pop    %ebx
    22d9:	5e                   	pop    %esi
    22da:	5f                   	pop    %edi
    22db:	5d                   	pop    %ebp
    22dc:	c3                   	ret
    22dd:	83 ec 08             	sub    $0x8,%esp
    22e0:	68 09 46 00 00       	push   $0x4609
    22e5:	6a 01                	push   $0x1
    22e7:	e8 b0 15 00 00       	call   389c <printf>
    22ec:	e8 6b 14 00 00       	call   375c <exit>
    22f1:	89 df                	mov    %ebx,%edi
    22f3:	50                   	push   %eax
    22f4:	57                   	push   %edi
    22f5:	68 21 46 00 00       	push   $0x4621
    22fa:	6a 01                	push   $0x1
    22fc:	e8 9b 15 00 00       	call   389c <printf>
    2301:	e8 56 14 00 00       	call   375c <exit>

00002306 <bigfile>:
    2306:	55                   	push   %ebp
    2307:	89 e5                	mov    %esp,%ebp
    2309:	57                   	push   %edi
    230a:	56                   	push   %esi
    230b:	53                   	push   %ebx
    230c:	83 ec 14             	sub    $0x14,%esp
    230f:	68 40 46 00 00       	push   $0x4640
    2314:	6a 01                	push   $0x1
    2316:	e8 81 15 00 00       	call   389c <printf>
    231b:	c7 04 24 5c 46 00 00 	movl   $0x465c,(%esp)
    2322:	e8 85 14 00 00       	call   37ac <unlink>
    2327:	83 c4 08             	add    $0x8,%esp
    232a:	68 02 02 00 00       	push   $0x202
    232f:	68 5c 46 00 00       	push   $0x465c
    2334:	e8 63 14 00 00       	call   379c <open>
    2339:	83 c4 10             	add    $0x10,%esp
    233c:	85 c0                	test   %eax,%eax
    233e:	0f 88 c3 00 00 00    	js     2407 <bigfile+0x101>
    2344:	89 c6                	mov    %eax,%esi
    2346:	bb 00 00 00 00       	mov    $0x0,%ebx
    234b:	83 ec 04             	sub    $0x4,%esp
    234e:	68 58 02 00 00       	push   $0x258
    2353:	53                   	push   %ebx
    2354:	68 40 83 00 00       	push   $0x8340
    2359:	e8 ab 12 00 00       	call   3609 <memset>
    235e:	83 c4 0c             	add    $0xc,%esp
    2361:	68 58 02 00 00       	push   $0x258
    2366:	68 40 83 00 00       	push   $0x8340
    236b:	56                   	push   %esi
    236c:	e8 0b 14 00 00       	call   377c <write>
    2371:	83 c4 10             	add    $0x10,%esp
    2374:	3d 58 02 00 00       	cmp    $0x258,%eax
    2379:	0f 85 9c 00 00 00    	jne    241b <bigfile+0x115>
    237f:	83 c3 01             	add    $0x1,%ebx
    2382:	83 fb 14             	cmp    $0x14,%ebx
    2385:	75 c4                	jne    234b <bigfile+0x45>
    2387:	83 ec 0c             	sub    $0xc,%esp
    238a:	56                   	push   %esi
    238b:	e8 f4 13 00 00       	call   3784 <close>
    2390:	83 c4 08             	add    $0x8,%esp
    2393:	6a 00                	push   $0x0
    2395:	68 5c 46 00 00       	push   $0x465c
    239a:	e8 fd 13 00 00       	call   379c <open>
    239f:	89 c7                	mov    %eax,%edi
    23a1:	83 c4 10             	add    $0x10,%esp
    23a4:	85 c0                	test   %eax,%eax
    23a6:	0f 88 83 00 00 00    	js     242f <bigfile+0x129>
    23ac:	be 00 00 00 00       	mov    $0x0,%esi
    23b1:	bb 00 00 00 00       	mov    $0x0,%ebx
    23b6:	83 ec 04             	sub    $0x4,%esp
    23b9:	68 2c 01 00 00       	push   $0x12c
    23be:	68 40 83 00 00       	push   $0x8340
    23c3:	57                   	push   %edi
    23c4:	e8 ab 13 00 00       	call   3774 <read>
    23c9:	83 c4 10             	add    $0x10,%esp
    23cc:	85 c0                	test   %eax,%eax
    23ce:	78 73                	js     2443 <bigfile+0x13d>
    23d0:	0f 84 a9 00 00 00    	je     247f <bigfile+0x179>
    23d6:	3d 2c 01 00 00       	cmp    $0x12c,%eax
    23db:	75 7a                	jne    2457 <bigfile+0x151>
    23dd:	89 d8                	mov    %ebx,%eax
    23df:	c1 e8 1f             	shr    $0x1f,%eax
    23e2:	01 d8                	add    %ebx,%eax
    23e4:	d1 f8                	sar    $1,%eax
    23e6:	0f be 15 40 83 00 00 	movsbl 0x8340,%edx
    23ed:	39 c2                	cmp    %eax,%edx
    23ef:	75 7a                	jne    246b <bigfile+0x165>
    23f1:	0f be 15 6b 84 00 00 	movsbl 0x846b,%edx
    23f8:	39 d0                	cmp    %edx,%eax
    23fa:	75 6f                	jne    246b <bigfile+0x165>
    23fc:	81 c6 2c 01 00 00    	add    $0x12c,%esi
    2402:	83 c3 01             	add    $0x1,%ebx
    2405:	eb af                	jmp    23b6 <bigfile+0xb0>
    2407:	83 ec 08             	sub    $0x8,%esp
    240a:	68 4e 46 00 00       	push   $0x464e
    240f:	6a 01                	push   $0x1
    2411:	e8 86 14 00 00       	call   389c <printf>
    2416:	e8 41 13 00 00       	call   375c <exit>
    241b:	83 ec 08             	sub    $0x8,%esp
    241e:	68 64 46 00 00       	push   $0x4664
    2423:	6a 01                	push   $0x1
    2425:	e8 72 14 00 00       	call   389c <printf>
    242a:	e8 2d 13 00 00       	call   375c <exit>
    242f:	83 ec 08             	sub    $0x8,%esp
    2432:	68 7a 46 00 00       	push   $0x467a
    2437:	6a 01                	push   $0x1
    2439:	e8 5e 14 00 00       	call   389c <printf>
    243e:	e8 19 13 00 00       	call   375c <exit>
    2443:	83 ec 08             	sub    $0x8,%esp
    2446:	68 8f 46 00 00       	push   $0x468f
    244b:	6a 01                	push   $0x1
    244d:	e8 4a 14 00 00       	call   389c <printf>
    2452:	e8 05 13 00 00       	call   375c <exit>
    2457:	83 ec 08             	sub    $0x8,%esp
    245a:	68 a4 46 00 00       	push   $0x46a4
    245f:	6a 01                	push   $0x1
    2461:	e8 36 14 00 00       	call   389c <printf>
    2466:	e8 f1 12 00 00       	call   375c <exit>
    246b:	83 ec 08             	sub    $0x8,%esp
    246e:	68 b8 46 00 00       	push   $0x46b8
    2473:	6a 01                	push   $0x1
    2475:	e8 22 14 00 00       	call   389c <printf>
    247a:	e8 dd 12 00 00       	call   375c <exit>
    247f:	83 ec 0c             	sub    $0xc,%esp
    2482:	57                   	push   %edi
    2483:	e8 fc 12 00 00       	call   3784 <close>
    2488:	83 c4 10             	add    $0x10,%esp
    248b:	81 fe e0 2e 00 00    	cmp    $0x2ee0,%esi
    2491:	75 27                	jne    24ba <bigfile+0x1b4>
    2493:	83 ec 0c             	sub    $0xc,%esp
    2496:	68 5c 46 00 00       	push   $0x465c
    249b:	e8 0c 13 00 00       	call   37ac <unlink>
    24a0:	83 c4 08             	add    $0x8,%esp
    24a3:	68 eb 46 00 00       	push   $0x46eb
    24a8:	6a 01                	push   $0x1
    24aa:	e8 ed 13 00 00       	call   389c <printf>
    24af:	83 c4 10             	add    $0x10,%esp
    24b2:	8d 65 f4             	lea    -0xc(%ebp),%esp
    24b5:	5b                   	pop    %ebx
    24b6:	5e                   	pop    %esi
    24b7:	5f                   	pop    %edi
    24b8:	5d                   	pop    %ebp
    24b9:	c3                   	ret
    24ba:	83 ec 08             	sub    $0x8,%esp
    24bd:	68 d1 46 00 00       	push   $0x46d1
    24c2:	6a 01                	push   $0x1
    24c4:	e8 d3 13 00 00       	call   389c <printf>
    24c9:	e8 8e 12 00 00       	call   375c <exit>

000024ce <fourteen>:
    24ce:	55                   	push   %ebp
    24cf:	89 e5                	mov    %esp,%ebp
    24d1:	83 ec 10             	sub    $0x10,%esp
    24d4:	68 fc 46 00 00       	push   $0x46fc
    24d9:	6a 01                	push   $0x1
    24db:	e8 bc 13 00 00       	call   389c <printf>
    24e0:	c7 04 24 37 47 00 00 	movl   $0x4737,(%esp)
    24e7:	e8 d8 12 00 00       	call   37c4 <mkdir>
    24ec:	83 c4 10             	add    $0x10,%esp
    24ef:	85 c0                	test   %eax,%eax
    24f1:	0f 85 9c 00 00 00    	jne    2593 <fourteen+0xc5>
    24f7:	83 ec 0c             	sub    $0xc,%esp
    24fa:	68 fc 4e 00 00       	push   $0x4efc
    24ff:	e8 c0 12 00 00       	call   37c4 <mkdir>
    2504:	83 c4 10             	add    $0x10,%esp
    2507:	85 c0                	test   %eax,%eax
    2509:	0f 85 98 00 00 00    	jne    25a7 <fourteen+0xd9>
    250f:	83 ec 08             	sub    $0x8,%esp
    2512:	68 00 02 00 00       	push   $0x200
    2517:	68 4c 4f 00 00       	push   $0x4f4c
    251c:	e8 7b 12 00 00       	call   379c <open>
    2521:	83 c4 10             	add    $0x10,%esp
    2524:	85 c0                	test   %eax,%eax
    2526:	0f 88 8f 00 00 00    	js     25bb <fourteen+0xed>
    252c:	83 ec 0c             	sub    $0xc,%esp
    252f:	50                   	push   %eax
    2530:	e8 4f 12 00 00       	call   3784 <close>
    2535:	83 c4 08             	add    $0x8,%esp
    2538:	6a 00                	push   $0x0
    253a:	68 bc 4f 00 00       	push   $0x4fbc
    253f:	e8 58 12 00 00       	call   379c <open>
    2544:	83 c4 10             	add    $0x10,%esp
    2547:	85 c0                	test   %eax,%eax
    2549:	0f 88 80 00 00 00    	js     25cf <fourteen+0x101>
    254f:	83 ec 0c             	sub    $0xc,%esp
    2552:	50                   	push   %eax
    2553:	e8 2c 12 00 00       	call   3784 <close>
    2558:	c7 04 24 28 47 00 00 	movl   $0x4728,(%esp)
    255f:	e8 60 12 00 00       	call   37c4 <mkdir>
    2564:	83 c4 10             	add    $0x10,%esp
    2567:	85 c0                	test   %eax,%eax
    2569:	74 78                	je     25e3 <fourteen+0x115>
    256b:	83 ec 0c             	sub    $0xc,%esp
    256e:	68 58 50 00 00       	push   $0x5058
    2573:	e8 4c 12 00 00       	call   37c4 <mkdir>
    2578:	83 c4 10             	add    $0x10,%esp
    257b:	85 c0                	test   %eax,%eax
    257d:	74 78                	je     25f7 <fourteen+0x129>
    257f:	83 ec 08             	sub    $0x8,%esp
    2582:	68 46 47 00 00       	push   $0x4746
    2587:	6a 01                	push   $0x1
    2589:	e8 0e 13 00 00       	call   389c <printf>
    258e:	83 c4 10             	add    $0x10,%esp
    2591:	c9                   	leave
    2592:	c3                   	ret
    2593:	83 ec 08             	sub    $0x8,%esp
    2596:	68 0b 47 00 00       	push   $0x470b
    259b:	6a 01                	push   $0x1
    259d:	e8 fa 12 00 00       	call   389c <printf>
    25a2:	e8 b5 11 00 00       	call   375c <exit>
    25a7:	83 ec 08             	sub    $0x8,%esp
    25aa:	68 1c 4f 00 00       	push   $0x4f1c
    25af:	6a 01                	push   $0x1
    25b1:	e8 e6 12 00 00       	call   389c <printf>
    25b6:	e8 a1 11 00 00       	call   375c <exit>
    25bb:	83 ec 08             	sub    $0x8,%esp
    25be:	68 7c 4f 00 00       	push   $0x4f7c
    25c3:	6a 01                	push   $0x1
    25c5:	e8 d2 12 00 00       	call   389c <printf>
    25ca:	e8 8d 11 00 00       	call   375c <exit>
    25cf:	83 ec 08             	sub    $0x8,%esp
    25d2:	68 ec 4f 00 00       	push   $0x4fec
    25d7:	6a 01                	push   $0x1
    25d9:	e8 be 12 00 00       	call   389c <printf>
    25de:	e8 79 11 00 00       	call   375c <exit>
    25e3:	83 ec 08             	sub    $0x8,%esp
    25e6:	68 28 50 00 00       	push   $0x5028
    25eb:	6a 01                	push   $0x1
    25ed:	e8 aa 12 00 00       	call   389c <printf>
    25f2:	e8 65 11 00 00       	call   375c <exit>
    25f7:	83 ec 08             	sub    $0x8,%esp
    25fa:	68 78 50 00 00       	push   $0x5078
    25ff:	6a 01                	push   $0x1
    2601:	e8 96 12 00 00       	call   389c <printf>
    2606:	e8 51 11 00 00       	call   375c <exit>

0000260b <rmdot>:
    260b:	55                   	push   %ebp
    260c:	89 e5                	mov    %esp,%ebp
    260e:	83 ec 10             	sub    $0x10,%esp
    2611:	68 53 47 00 00       	push   $0x4753
    2616:	6a 01                	push   $0x1
    2618:	e8 7f 12 00 00       	call   389c <printf>
    261d:	c7 04 24 5f 47 00 00 	movl   $0x475f,(%esp)
    2624:	e8 9b 11 00 00       	call   37c4 <mkdir>
    2629:	83 c4 10             	add    $0x10,%esp
    262c:	85 c0                	test   %eax,%eax
    262e:	0f 85 bc 00 00 00    	jne    26f0 <rmdot+0xe5>
    2634:	83 ec 0c             	sub    $0xc,%esp
    2637:	68 5f 47 00 00       	push   $0x475f
    263c:	e8 8b 11 00 00       	call   37cc <chdir>
    2641:	83 c4 10             	add    $0x10,%esp
    2644:	85 c0                	test   %eax,%eax
    2646:	0f 85 b8 00 00 00    	jne    2704 <rmdot+0xf9>
    264c:	83 ec 0c             	sub    $0xc,%esp
    264f:	68 0a 44 00 00       	push   $0x440a
    2654:	e8 53 11 00 00       	call   37ac <unlink>
    2659:	83 c4 10             	add    $0x10,%esp
    265c:	85 c0                	test   %eax,%eax
    265e:	0f 84 b4 00 00 00    	je     2718 <rmdot+0x10d>
    2664:	83 ec 0c             	sub    $0xc,%esp
    2667:	68 09 44 00 00       	push   $0x4409
    266c:	e8 3b 11 00 00       	call   37ac <unlink>
    2671:	83 c4 10             	add    $0x10,%esp
    2674:	85 c0                	test   %eax,%eax
    2676:	0f 84 b0 00 00 00    	je     272c <rmdot+0x121>
    267c:	83 ec 0c             	sub    $0xc,%esp
    267f:	68 dd 3b 00 00       	push   $0x3bdd
    2684:	e8 43 11 00 00       	call   37cc <chdir>
    2689:	83 c4 10             	add    $0x10,%esp
    268c:	85 c0                	test   %eax,%eax
    268e:	0f 85 ac 00 00 00    	jne    2740 <rmdot+0x135>
    2694:	83 ec 0c             	sub    $0xc,%esp
    2697:	68 a7 47 00 00       	push   $0x47a7
    269c:	e8 0b 11 00 00       	call   37ac <unlink>
    26a1:	83 c4 10             	add    $0x10,%esp
    26a4:	85 c0                	test   %eax,%eax
    26a6:	0f 84 a8 00 00 00    	je     2754 <rmdot+0x149>
    26ac:	83 ec 0c             	sub    $0xc,%esp
    26af:	68 c5 47 00 00       	push   $0x47c5
    26b4:	e8 f3 10 00 00       	call   37ac <unlink>
    26b9:	83 c4 10             	add    $0x10,%esp
    26bc:	85 c0                	test   %eax,%eax
    26be:	0f 84 a4 00 00 00    	je     2768 <rmdot+0x15d>
    26c4:	83 ec 0c             	sub    $0xc,%esp
    26c7:	68 5f 47 00 00       	push   $0x475f
    26cc:	e8 db 10 00 00       	call   37ac <unlink>
    26d1:	83 c4 10             	add    $0x10,%esp
    26d4:	85 c0                	test   %eax,%eax
    26d6:	0f 85 a0 00 00 00    	jne    277c <rmdot+0x171>
    26dc:	83 ec 08             	sub    $0x8,%esp
    26df:	68 fa 47 00 00       	push   $0x47fa
    26e4:	6a 01                	push   $0x1
    26e6:	e8 b1 11 00 00       	call   389c <printf>
    26eb:	83 c4 10             	add    $0x10,%esp
    26ee:	c9                   	leave
    26ef:	c3                   	ret
    26f0:	83 ec 08             	sub    $0x8,%esp
    26f3:	68 64 47 00 00       	push   $0x4764
    26f8:	6a 01                	push   $0x1
    26fa:	e8 9d 11 00 00       	call   389c <printf>
    26ff:	e8 58 10 00 00       	call   375c <exit>
    2704:	83 ec 08             	sub    $0x8,%esp
    2707:	68 77 47 00 00       	push   $0x4777
    270c:	6a 01                	push   $0x1
    270e:	e8 89 11 00 00       	call   389c <printf>
    2713:	e8 44 10 00 00       	call   375c <exit>
    2718:	83 ec 08             	sub    $0x8,%esp
    271b:	68 8a 47 00 00       	push   $0x478a
    2720:	6a 01                	push   $0x1
    2722:	e8 75 11 00 00       	call   389c <printf>
    2727:	e8 30 10 00 00       	call   375c <exit>
    272c:	83 ec 08             	sub    $0x8,%esp
    272f:	68 98 47 00 00       	push   $0x4798
    2734:	6a 01                	push   $0x1
    2736:	e8 61 11 00 00       	call   389c <printf>
    273b:	e8 1c 10 00 00       	call   375c <exit>
    2740:	83 ec 08             	sub    $0x8,%esp
    2743:	68 df 3b 00 00       	push   $0x3bdf
    2748:	6a 01                	push   $0x1
    274a:	e8 4d 11 00 00       	call   389c <printf>
    274f:	e8 08 10 00 00       	call   375c <exit>
    2754:	83 ec 08             	sub    $0x8,%esp
    2757:	68 ae 47 00 00       	push   $0x47ae
    275c:	6a 01                	push   $0x1
    275e:	e8 39 11 00 00       	call   389c <printf>
    2763:	e8 f4 0f 00 00       	call   375c <exit>
    2768:	83 ec 08             	sub    $0x8,%esp
    276b:	68 cd 47 00 00       	push   $0x47cd
    2770:	6a 01                	push   $0x1
    2772:	e8 25 11 00 00       	call   389c <printf>
    2777:	e8 e0 0f 00 00       	call   375c <exit>
    277c:	83 ec 08             	sub    $0x8,%esp
    277f:	68 e5 47 00 00       	push   $0x47e5
    2784:	6a 01                	push   $0x1
    2786:	e8 11 11 00 00       	call   389c <printf>
    278b:	e8 cc 0f 00 00       	call   375c <exit>

00002790 <dirfile>:
    2790:	55                   	push   %ebp
    2791:	89 e5                	mov    %esp,%ebp
    2793:	53                   	push   %ebx
    2794:	83 ec 0c             	sub    $0xc,%esp
    2797:	68 04 48 00 00       	push   $0x4804
    279c:	6a 01                	push   $0x1
    279e:	e8 f9 10 00 00       	call   389c <printf>
    27a3:	83 c4 08             	add    $0x8,%esp
    27a6:	68 00 02 00 00       	push   $0x200
    27ab:	68 11 48 00 00       	push   $0x4811
    27b0:	e8 e7 0f 00 00       	call   379c <open>
    27b5:	83 c4 10             	add    $0x10,%esp
    27b8:	85 c0                	test   %eax,%eax
    27ba:	0f 88 22 01 00 00    	js     28e2 <dirfile+0x152>
    27c0:	83 ec 0c             	sub    $0xc,%esp
    27c3:	50                   	push   %eax
    27c4:	e8 bb 0f 00 00       	call   3784 <close>
    27c9:	c7 04 24 11 48 00 00 	movl   $0x4811,(%esp)
    27d0:	e8 f7 0f 00 00       	call   37cc <chdir>
    27d5:	83 c4 10             	add    $0x10,%esp
    27d8:	85 c0                	test   %eax,%eax
    27da:	0f 84 16 01 00 00    	je     28f6 <dirfile+0x166>
    27e0:	83 ec 08             	sub    $0x8,%esp
    27e3:	6a 00                	push   $0x0
    27e5:	68 4a 48 00 00       	push   $0x484a
    27ea:	e8 ad 0f 00 00       	call   379c <open>
    27ef:	83 c4 10             	add    $0x10,%esp
    27f2:	85 c0                	test   %eax,%eax
    27f4:	0f 89 10 01 00 00    	jns    290a <dirfile+0x17a>
    27fa:	83 ec 08             	sub    $0x8,%esp
    27fd:	68 00 02 00 00       	push   $0x200
    2802:	68 4a 48 00 00       	push   $0x484a
    2807:	e8 90 0f 00 00       	call   379c <open>
    280c:	83 c4 10             	add    $0x10,%esp
    280f:	85 c0                	test   %eax,%eax
    2811:	0f 89 07 01 00 00    	jns    291e <dirfile+0x18e>
    2817:	83 ec 0c             	sub    $0xc,%esp
    281a:	68 4a 48 00 00       	push   $0x484a
    281f:	e8 a0 0f 00 00       	call   37c4 <mkdir>
    2824:	83 c4 10             	add    $0x10,%esp
    2827:	85 c0                	test   %eax,%eax
    2829:	0f 84 03 01 00 00    	je     2932 <dirfile+0x1a2>
    282f:	83 ec 0c             	sub    $0xc,%esp
    2832:	68 4a 48 00 00       	push   $0x484a
    2837:	e8 70 0f 00 00       	call   37ac <unlink>
    283c:	83 c4 10             	add    $0x10,%esp
    283f:	85 c0                	test   %eax,%eax
    2841:	0f 84 ff 00 00 00    	je     2946 <dirfile+0x1b6>
    2847:	83 ec 08             	sub    $0x8,%esp
    284a:	68 4a 48 00 00       	push   $0x484a
    284f:	68 ae 48 00 00       	push   $0x48ae
    2854:	e8 63 0f 00 00       	call   37bc <link>
    2859:	83 c4 10             	add    $0x10,%esp
    285c:	85 c0                	test   %eax,%eax
    285e:	0f 84 f6 00 00 00    	je     295a <dirfile+0x1ca>
    2864:	83 ec 0c             	sub    $0xc,%esp
    2867:	68 11 48 00 00       	push   $0x4811
    286c:	e8 3b 0f 00 00       	call   37ac <unlink>
    2871:	83 c4 10             	add    $0x10,%esp
    2874:	85 c0                	test   %eax,%eax
    2876:	0f 85 f2 00 00 00    	jne    296e <dirfile+0x1de>
    287c:	83 ec 08             	sub    $0x8,%esp
    287f:	6a 02                	push   $0x2
    2881:	68 0a 44 00 00       	push   $0x440a
    2886:	e8 11 0f 00 00       	call   379c <open>
    288b:	83 c4 10             	add    $0x10,%esp
    288e:	85 c0                	test   %eax,%eax
    2890:	0f 89 ec 00 00 00    	jns    2982 <dirfile+0x1f2>
    2896:	83 ec 08             	sub    $0x8,%esp
    2899:	6a 00                	push   $0x0
    289b:	68 0a 44 00 00       	push   $0x440a
    28a0:	e8 f7 0e 00 00       	call   379c <open>
    28a5:	89 c3                	mov    %eax,%ebx
    28a7:	83 c4 0c             	add    $0xc,%esp
    28aa:	6a 01                	push   $0x1
    28ac:	68 ed 44 00 00       	push   $0x44ed
    28b1:	50                   	push   %eax
    28b2:	e8 c5 0e 00 00       	call   377c <write>
    28b7:	83 c4 10             	add    $0x10,%esp
    28ba:	85 c0                	test   %eax,%eax
    28bc:	0f 8f d4 00 00 00    	jg     2996 <dirfile+0x206>
    28c2:	83 ec 0c             	sub    $0xc,%esp
    28c5:	53                   	push   %ebx
    28c6:	e8 b9 0e 00 00       	call   3784 <close>
    28cb:	83 c4 08             	add    $0x8,%esp
    28ce:	68 e1 48 00 00       	push   $0x48e1
    28d3:	6a 01                	push   $0x1
    28d5:	e8 c2 0f 00 00       	call   389c <printf>
    28da:	83 c4 10             	add    $0x10,%esp
    28dd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    28e0:	c9                   	leave
    28e1:	c3                   	ret
    28e2:	83 ec 08             	sub    $0x8,%esp
    28e5:	68 19 48 00 00       	push   $0x4819
    28ea:	6a 01                	push   $0x1
    28ec:	e8 ab 0f 00 00       	call   389c <printf>
    28f1:	e8 66 0e 00 00       	call   375c <exit>
    28f6:	83 ec 08             	sub    $0x8,%esp
    28f9:	68 30 48 00 00       	push   $0x4830
    28fe:	6a 01                	push   $0x1
    2900:	e8 97 0f 00 00       	call   389c <printf>
    2905:	e8 52 0e 00 00       	call   375c <exit>
    290a:	83 ec 08             	sub    $0x8,%esp
    290d:	68 55 48 00 00       	push   $0x4855
    2912:	6a 01                	push   $0x1
    2914:	e8 83 0f 00 00       	call   389c <printf>
    2919:	e8 3e 0e 00 00       	call   375c <exit>
    291e:	83 ec 08             	sub    $0x8,%esp
    2921:	68 55 48 00 00       	push   $0x4855
    2926:	6a 01                	push   $0x1
    2928:	e8 6f 0f 00 00       	call   389c <printf>
    292d:	e8 2a 0e 00 00       	call   375c <exit>
    2932:	83 ec 08             	sub    $0x8,%esp
    2935:	68 73 48 00 00       	push   $0x4873
    293a:	6a 01                	push   $0x1
    293c:	e8 5b 0f 00 00       	call   389c <printf>
    2941:	e8 16 0e 00 00       	call   375c <exit>
    2946:	83 ec 08             	sub    $0x8,%esp
    2949:	68 90 48 00 00       	push   $0x4890
    294e:	6a 01                	push   $0x1
    2950:	e8 47 0f 00 00       	call   389c <printf>
    2955:	e8 02 0e 00 00       	call   375c <exit>
    295a:	83 ec 08             	sub    $0x8,%esp
    295d:	68 ac 50 00 00       	push   $0x50ac
    2962:	6a 01                	push   $0x1
    2964:	e8 33 0f 00 00       	call   389c <printf>
    2969:	e8 ee 0d 00 00       	call   375c <exit>
    296e:	83 ec 08             	sub    $0x8,%esp
    2971:	68 b5 48 00 00       	push   $0x48b5
    2976:	6a 01                	push   $0x1
    2978:	e8 1f 0f 00 00       	call   389c <printf>
    297d:	e8 da 0d 00 00       	call   375c <exit>
    2982:	83 ec 08             	sub    $0x8,%esp
    2985:	68 cc 50 00 00       	push   $0x50cc
    298a:	6a 01                	push   $0x1
    298c:	e8 0b 0f 00 00       	call   389c <printf>
    2991:	e8 c6 0d 00 00       	call   375c <exit>
    2996:	83 ec 08             	sub    $0x8,%esp
    2999:	68 cd 48 00 00       	push   $0x48cd
    299e:	6a 01                	push   $0x1
    29a0:	e8 f7 0e 00 00       	call   389c <printf>
    29a5:	e8 b2 0d 00 00       	call   375c <exit>

000029aa <iref>:
    29aa:	55                   	push   %ebp
    29ab:	89 e5                	mov    %esp,%ebp
    29ad:	53                   	push   %ebx
    29ae:	83 ec 0c             	sub    $0xc,%esp
    29b1:	68 f1 48 00 00       	push   $0x48f1
    29b6:	6a 01                	push   $0x1
    29b8:	e8 df 0e 00 00       	call   389c <printf>
    29bd:	83 c4 10             	add    $0x10,%esp
    29c0:	bb 33 00 00 00       	mov    $0x33,%ebx
    29c5:	eb 4f                	jmp    2a16 <iref+0x6c>
    29c7:	83 ec 08             	sub    $0x8,%esp
    29ca:	68 08 49 00 00       	push   $0x4908
    29cf:	6a 01                	push   $0x1
    29d1:	e8 c6 0e 00 00       	call   389c <printf>
    29d6:	e8 81 0d 00 00       	call   375c <exit>
    29db:	83 ec 08             	sub    $0x8,%esp
    29de:	68 1c 49 00 00       	push   $0x491c
    29e3:	6a 01                	push   $0x1
    29e5:	e8 b2 0e 00 00       	call   389c <printf>
    29ea:	e8 6d 0d 00 00       	call   375c <exit>
    29ef:	83 ec 0c             	sub    $0xc,%esp
    29f2:	50                   	push   %eax
    29f3:	e8 8c 0d 00 00       	call   3784 <close>
    29f8:	83 c4 10             	add    $0x10,%esp
    29fb:	eb 7d                	jmp    2a7a <iref+0xd0>
    29fd:	83 ec 0c             	sub    $0xc,%esp
    2a00:	68 ec 44 00 00       	push   $0x44ec
    2a05:	e8 a2 0d 00 00       	call   37ac <unlink>
    2a0a:	83 c4 10             	add    $0x10,%esp
    2a0d:	83 eb 01             	sub    $0x1,%ebx
    2a10:	0f 84 92 00 00 00    	je     2aa8 <iref+0xfe>
    2a16:	83 ec 0c             	sub    $0xc,%esp
    2a19:	68 02 49 00 00       	push   $0x4902
    2a1e:	e8 a1 0d 00 00       	call   37c4 <mkdir>
    2a23:	83 c4 10             	add    $0x10,%esp
    2a26:	85 c0                	test   %eax,%eax
    2a28:	75 9d                	jne    29c7 <iref+0x1d>
    2a2a:	83 ec 0c             	sub    $0xc,%esp
    2a2d:	68 02 49 00 00       	push   $0x4902
    2a32:	e8 95 0d 00 00       	call   37cc <chdir>
    2a37:	83 c4 10             	add    $0x10,%esp
    2a3a:	85 c0                	test   %eax,%eax
    2a3c:	75 9d                	jne    29db <iref+0x31>
    2a3e:	83 ec 0c             	sub    $0xc,%esp
    2a41:	68 b7 3f 00 00       	push   $0x3fb7
    2a46:	e8 79 0d 00 00       	call   37c4 <mkdir>
    2a4b:	83 c4 08             	add    $0x8,%esp
    2a4e:	68 b7 3f 00 00       	push   $0x3fb7
    2a53:	68 ae 48 00 00       	push   $0x48ae
    2a58:	e8 5f 0d 00 00       	call   37bc <link>
    2a5d:	83 c4 08             	add    $0x8,%esp
    2a60:	68 00 02 00 00       	push   $0x200
    2a65:	68 b7 3f 00 00       	push   $0x3fb7
    2a6a:	e8 2d 0d 00 00       	call   379c <open>
    2a6f:	83 c4 10             	add    $0x10,%esp
    2a72:	85 c0                	test   %eax,%eax
    2a74:	0f 89 75 ff ff ff    	jns    29ef <iref+0x45>
    2a7a:	83 ec 08             	sub    $0x8,%esp
    2a7d:	68 00 02 00 00       	push   $0x200
    2a82:	68 ec 44 00 00       	push   $0x44ec
    2a87:	e8 10 0d 00 00       	call   379c <open>
    2a8c:	83 c4 10             	add    $0x10,%esp
    2a8f:	85 c0                	test   %eax,%eax
    2a91:	0f 88 66 ff ff ff    	js     29fd <iref+0x53>
    2a97:	83 ec 0c             	sub    $0xc,%esp
    2a9a:	50                   	push   %eax
    2a9b:	e8 e4 0c 00 00       	call   3784 <close>
    2aa0:	83 c4 10             	add    $0x10,%esp
    2aa3:	e9 55 ff ff ff       	jmp    29fd <iref+0x53>
    2aa8:	83 ec 0c             	sub    $0xc,%esp
    2aab:	68 dd 3b 00 00       	push   $0x3bdd
    2ab0:	e8 17 0d 00 00       	call   37cc <chdir>
    2ab5:	83 c4 08             	add    $0x8,%esp
    2ab8:	68 30 49 00 00       	push   $0x4930
    2abd:	6a 01                	push   $0x1
    2abf:	e8 d8 0d 00 00       	call   389c <printf>
    2ac4:	83 c4 10             	add    $0x10,%esp
    2ac7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2aca:	c9                   	leave
    2acb:	c3                   	ret

00002acc <forktest>:
    2acc:	55                   	push   %ebp
    2acd:	89 e5                	mov    %esp,%ebp
    2acf:	53                   	push   %ebx
    2ad0:	83 ec 0c             	sub    $0xc,%esp
    2ad3:	68 44 49 00 00       	push   $0x4944
    2ad8:	6a 01                	push   $0x1
    2ada:	e8 bd 0d 00 00       	call   389c <printf>
    2adf:	83 c4 10             	add    $0x10,%esp
    2ae2:	bb 00 00 00 00       	mov    $0x0,%ebx
    2ae7:	e8 68 0c 00 00       	call   3754 <fork>
    2aec:	85 c0                	test   %eax,%eax
    2aee:	78 4e                	js     2b3e <forktest+0x72>
    2af0:	74 1f                	je     2b11 <forktest+0x45>
    2af2:	83 c3 01             	add    $0x1,%ebx
    2af5:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
    2afb:	75 ea                	jne    2ae7 <forktest+0x1b>
    2afd:	83 ec 08             	sub    $0x8,%esp
    2b00:	68 ec 50 00 00       	push   $0x50ec
    2b05:	6a 01                	push   $0x1
    2b07:	e8 90 0d 00 00       	call   389c <printf>
    2b0c:	e8 4b 0c 00 00       	call   375c <exit>
    2b11:	e8 46 0c 00 00       	call   375c <exit>
    2b16:	83 ec 08             	sub    $0x8,%esp
    2b19:	68 4f 49 00 00       	push   $0x494f
    2b1e:	6a 01                	push   $0x1
    2b20:	e8 77 0d 00 00       	call   389c <printf>
    2b25:	e8 32 0c 00 00       	call   375c <exit>
    2b2a:	83 ec 08             	sub    $0x8,%esp
    2b2d:	68 63 49 00 00       	push   $0x4963
    2b32:	6a 01                	push   $0x1
    2b34:	e8 63 0d 00 00       	call   389c <printf>
    2b39:	e8 1e 0c 00 00       	call   375c <exit>
    2b3e:	85 db                	test   %ebx,%ebx
    2b40:	7e 0e                	jle    2b50 <forktest+0x84>
    2b42:	e8 1d 0c 00 00       	call   3764 <wait>
    2b47:	85 c0                	test   %eax,%eax
    2b49:	78 cb                	js     2b16 <forktest+0x4a>
    2b4b:	83 eb 01             	sub    $0x1,%ebx
    2b4e:	75 f2                	jne    2b42 <forktest+0x76>
    2b50:	e8 0f 0c 00 00       	call   3764 <wait>
    2b55:	83 f8 ff             	cmp    $0xffffffff,%eax
    2b58:	75 d0                	jne    2b2a <forktest+0x5e>
    2b5a:	83 ec 08             	sub    $0x8,%esp
    2b5d:	68 76 49 00 00       	push   $0x4976
    2b62:	6a 01                	push   $0x1
    2b64:	e8 33 0d 00 00       	call   389c <printf>
    2b69:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2b6c:	c9                   	leave
    2b6d:	c3                   	ret

00002b6e <sbrktest>:
    2b6e:	55                   	push   %ebp
    2b6f:	89 e5                	mov    %esp,%ebp
    2b71:	57                   	push   %edi
    2b72:	56                   	push   %esi
    2b73:	53                   	push   %ebx
    2b74:	83 ec 64             	sub    $0x64,%esp
    2b77:	68 84 49 00 00       	push   $0x4984
    2b7c:	ff 35 fc 5b 00 00    	push   0x5bfc
    2b82:	e8 15 0d 00 00       	call   389c <printf>
    2b87:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2b8e:	e8 51 0c 00 00       	call   37e4 <sbrk>
    2b93:	89 45 a4             	mov    %eax,-0x5c(%ebp)
    2b96:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2b9d:	e8 42 0c 00 00       	call   37e4 <sbrk>
    2ba2:	89 c3                	mov    %eax,%ebx
    2ba4:	83 c4 10             	add    $0x10,%esp
    2ba7:	be 00 00 00 00       	mov    $0x0,%esi
    2bac:	eb 02                	jmp    2bb0 <sbrktest+0x42>
    2bae:	89 c3                	mov    %eax,%ebx
    2bb0:	83 ec 0c             	sub    $0xc,%esp
    2bb3:	6a 01                	push   $0x1
    2bb5:	e8 2a 0c 00 00       	call   37e4 <sbrk>
    2bba:	83 c4 10             	add    $0x10,%esp
    2bbd:	39 d8                	cmp    %ebx,%eax
    2bbf:	0f 85 92 01 00 00    	jne    2d57 <sbrktest+0x1e9>
    2bc5:	c6 03 01             	movb   $0x1,(%ebx)
    2bc8:	8d 43 01             	lea    0x1(%ebx),%eax
    2bcb:	83 c6 01             	add    $0x1,%esi
    2bce:	81 fe 88 13 00 00    	cmp    $0x1388,%esi
    2bd4:	75 d8                	jne    2bae <sbrktest+0x40>
    2bd6:	e8 79 0b 00 00       	call   3754 <fork>
    2bdb:	89 c6                	mov    %eax,%esi
    2bdd:	85 c0                	test   %eax,%eax
    2bdf:	0f 88 90 01 00 00    	js     2d75 <sbrktest+0x207>
    2be5:	83 ec 0c             	sub    $0xc,%esp
    2be8:	6a 01                	push   $0x1
    2bea:	e8 f5 0b 00 00       	call   37e4 <sbrk>
    2bef:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2bf6:	e8 e9 0b 00 00       	call   37e4 <sbrk>
    2bfb:	83 c3 02             	add    $0x2,%ebx
    2bfe:	83 c4 10             	add    $0x10,%esp
    2c01:	39 c3                	cmp    %eax,%ebx
    2c03:	0f 85 84 01 00 00    	jne    2d8d <sbrktest+0x21f>
    2c09:	85 f6                	test   %esi,%esi
    2c0b:	0f 84 94 01 00 00    	je     2da5 <sbrktest+0x237>
    2c11:	e8 4e 0b 00 00       	call   3764 <wait>
    2c16:	83 ec 0c             	sub    $0xc,%esp
    2c19:	6a 00                	push   $0x0
    2c1b:	e8 c4 0b 00 00       	call   37e4 <sbrk>
    2c20:	89 c3                	mov    %eax,%ebx
    2c22:	b8 00 00 40 06       	mov    $0x6400000,%eax
    2c27:	29 d8                	sub    %ebx,%eax
    2c29:	89 04 24             	mov    %eax,(%esp)
    2c2c:	e8 b3 0b 00 00       	call   37e4 <sbrk>
    2c31:	83 c4 10             	add    $0x10,%esp
    2c34:	39 c3                	cmp    %eax,%ebx
    2c36:	0f 85 6e 01 00 00    	jne    2daa <sbrktest+0x23c>
    2c3c:	c6 05 ff ff 3f 06 63 	movb   $0x63,0x63fffff
    2c43:	83 ec 0c             	sub    $0xc,%esp
    2c46:	6a 00                	push   $0x0
    2c48:	e8 97 0b 00 00       	call   37e4 <sbrk>
    2c4d:	89 c3                	mov    %eax,%ebx
    2c4f:	c7 04 24 00 f0 ff ff 	movl   $0xfffff000,(%esp)
    2c56:	e8 89 0b 00 00       	call   37e4 <sbrk>
    2c5b:	83 c4 10             	add    $0x10,%esp
    2c5e:	83 f8 ff             	cmp    $0xffffffff,%eax
    2c61:	0f 84 5b 01 00 00    	je     2dc2 <sbrktest+0x254>
    2c67:	83 ec 0c             	sub    $0xc,%esp
    2c6a:	6a 00                	push   $0x0
    2c6c:	e8 73 0b 00 00       	call   37e4 <sbrk>
    2c71:	8d 93 00 f0 ff ff    	lea    -0x1000(%ebx),%edx
    2c77:	83 c4 10             	add    $0x10,%esp
    2c7a:	39 d0                	cmp    %edx,%eax
    2c7c:	0f 85 58 01 00 00    	jne    2dda <sbrktest+0x26c>
    2c82:	83 ec 0c             	sub    $0xc,%esp
    2c85:	6a 00                	push   $0x0
    2c87:	e8 58 0b 00 00       	call   37e4 <sbrk>
    2c8c:	89 c3                	mov    %eax,%ebx
    2c8e:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    2c95:	e8 4a 0b 00 00       	call   37e4 <sbrk>
    2c9a:	89 c6                	mov    %eax,%esi
    2c9c:	83 c4 10             	add    $0x10,%esp
    2c9f:	39 c3                	cmp    %eax,%ebx
    2ca1:	0f 85 4a 01 00 00    	jne    2df1 <sbrktest+0x283>
    2ca7:	83 ec 0c             	sub    $0xc,%esp
    2caa:	6a 00                	push   $0x0
    2cac:	e8 33 0b 00 00       	call   37e4 <sbrk>
    2cb1:	8d 93 00 10 00 00    	lea    0x1000(%ebx),%edx
    2cb7:	83 c4 10             	add    $0x10,%esp
    2cba:	39 c2                	cmp    %eax,%edx
    2cbc:	0f 85 2f 01 00 00    	jne    2df1 <sbrktest+0x283>
    2cc2:	80 3d ff ff 3f 06 63 	cmpb   $0x63,0x63fffff
    2cc9:	0f 84 39 01 00 00    	je     2e08 <sbrktest+0x29a>
    2ccf:	83 ec 0c             	sub    $0xc,%esp
    2cd2:	6a 00                	push   $0x0
    2cd4:	e8 0b 0b 00 00       	call   37e4 <sbrk>
    2cd9:	89 c3                	mov    %eax,%ebx
    2cdb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2ce2:	e8 fd 0a 00 00       	call   37e4 <sbrk>
    2ce7:	89 c2                	mov    %eax,%edx
    2ce9:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    2cec:	29 d0                	sub    %edx,%eax
    2cee:	89 04 24             	mov    %eax,(%esp)
    2cf1:	e8 ee 0a 00 00       	call   37e4 <sbrk>
    2cf6:	83 c4 10             	add    $0x10,%esp
    2cf9:	39 c3                	cmp    %eax,%ebx
    2cfb:	0f 85 1f 01 00 00    	jne    2e20 <sbrktest+0x2b2>
    2d01:	bb 00 00 00 80       	mov    $0x80000000,%ebx
    2d06:	e8 d1 0a 00 00       	call   37dc <getpid>
    2d0b:	89 c6                	mov    %eax,%esi
    2d0d:	e8 42 0a 00 00       	call   3754 <fork>
    2d12:	85 c0                	test   %eax,%eax
    2d14:	0f 88 1d 01 00 00    	js     2e37 <sbrktest+0x2c9>
    2d1a:	0f 84 2f 01 00 00    	je     2e4f <sbrktest+0x2e1>
    2d20:	e8 3f 0a 00 00       	call   3764 <wait>
    2d25:	81 c3 50 c3 00 00    	add    $0xc350,%ebx
    2d2b:	81 fb 80 84 1e 80    	cmp    $0x801e8480,%ebx
    2d31:	75 d3                	jne    2d06 <sbrktest+0x198>
    2d33:	83 ec 0c             	sub    $0xc,%esp
    2d36:	8d 45 e0             	lea    -0x20(%ebp),%eax
    2d39:	50                   	push   %eax
    2d3a:	e8 2d 0a 00 00       	call   376c <pipe>
    2d3f:	83 c4 10             	add    $0x10,%esp
    2d42:	85 c0                	test   %eax,%eax
    2d44:	0f 85 27 01 00 00    	jne    2e71 <sbrktest+0x303>
    2d4a:	8d 5d b8             	lea    -0x48(%ebp),%ebx
    2d4d:	8d 7d e0             	lea    -0x20(%ebp),%edi
    2d50:	89 de                	mov    %ebx,%esi
    2d52:	e9 77 01 00 00       	jmp    2ece <sbrktest+0x360>
    2d57:	83 ec 0c             	sub    $0xc,%esp
    2d5a:	50                   	push   %eax
    2d5b:	53                   	push   %ebx
    2d5c:	56                   	push   %esi
    2d5d:	68 8f 49 00 00       	push   $0x498f
    2d62:	ff 35 fc 5b 00 00    	push   0x5bfc
    2d68:	e8 2f 0b 00 00       	call   389c <printf>
    2d6d:	83 c4 20             	add    $0x20,%esp
    2d70:	e8 e7 09 00 00       	call   375c <exit>
    2d75:	83 ec 08             	sub    $0x8,%esp
    2d78:	68 aa 49 00 00       	push   $0x49aa
    2d7d:	ff 35 fc 5b 00 00    	push   0x5bfc
    2d83:	e8 14 0b 00 00       	call   389c <printf>
    2d88:	e8 cf 09 00 00       	call   375c <exit>
    2d8d:	83 ec 08             	sub    $0x8,%esp
    2d90:	68 c1 49 00 00       	push   $0x49c1
    2d95:	ff 35 fc 5b 00 00    	push   0x5bfc
    2d9b:	e8 fc 0a 00 00       	call   389c <printf>
    2da0:	e8 b7 09 00 00       	call   375c <exit>
    2da5:	e8 b2 09 00 00       	call   375c <exit>
    2daa:	83 ec 08             	sub    $0x8,%esp
    2dad:	68 10 51 00 00       	push   $0x5110
    2db2:	ff 35 fc 5b 00 00    	push   0x5bfc
    2db8:	e8 df 0a 00 00       	call   389c <printf>
    2dbd:	e8 9a 09 00 00       	call   375c <exit>
    2dc2:	83 ec 08             	sub    $0x8,%esp
    2dc5:	68 dd 49 00 00       	push   $0x49dd
    2dca:	ff 35 fc 5b 00 00    	push   0x5bfc
    2dd0:	e8 c7 0a 00 00       	call   389c <printf>
    2dd5:	e8 82 09 00 00       	call   375c <exit>
    2dda:	50                   	push   %eax
    2ddb:	53                   	push   %ebx
    2ddc:	68 50 51 00 00       	push   $0x5150
    2de1:	ff 35 fc 5b 00 00    	push   0x5bfc
    2de7:	e8 b0 0a 00 00       	call   389c <printf>
    2dec:	e8 6b 09 00 00       	call   375c <exit>
    2df1:	56                   	push   %esi
    2df2:	53                   	push   %ebx
    2df3:	68 88 51 00 00       	push   $0x5188
    2df8:	ff 35 fc 5b 00 00    	push   0x5bfc
    2dfe:	e8 99 0a 00 00       	call   389c <printf>
    2e03:	e8 54 09 00 00       	call   375c <exit>
    2e08:	83 ec 08             	sub    $0x8,%esp
    2e0b:	68 b0 51 00 00       	push   $0x51b0
    2e10:	ff 35 fc 5b 00 00    	push   0x5bfc
    2e16:	e8 81 0a 00 00       	call   389c <printf>
    2e1b:	e8 3c 09 00 00       	call   375c <exit>
    2e20:	50                   	push   %eax
    2e21:	53                   	push   %ebx
    2e22:	68 e0 51 00 00       	push   $0x51e0
    2e27:	ff 35 fc 5b 00 00    	push   0x5bfc
    2e2d:	e8 6a 0a 00 00       	call   389c <printf>
    2e32:	e8 25 09 00 00       	call   375c <exit>
    2e37:	83 ec 08             	sub    $0x8,%esp
    2e3a:	68 d5 4a 00 00       	push   $0x4ad5
    2e3f:	ff 35 fc 5b 00 00    	push   0x5bfc
    2e45:	e8 52 0a 00 00       	call   389c <printf>
    2e4a:	e8 0d 09 00 00       	call   375c <exit>
    2e4f:	0f be 03             	movsbl (%ebx),%eax
    2e52:	50                   	push   %eax
    2e53:	53                   	push   %ebx
    2e54:	68 f8 49 00 00       	push   $0x49f8
    2e59:	ff 35 fc 5b 00 00    	push   0x5bfc
    2e5f:	e8 38 0a 00 00       	call   389c <printf>
    2e64:	89 34 24             	mov    %esi,(%esp)
    2e67:	e8 20 09 00 00       	call   378c <kill>
    2e6c:	e8 eb 08 00 00       	call   375c <exit>
    2e71:	83 ec 08             	sub    $0x8,%esp
    2e74:	68 cd 3e 00 00       	push   $0x3ecd
    2e79:	6a 01                	push   $0x1
    2e7b:	e8 1c 0a 00 00       	call   389c <printf>
    2e80:	e8 d7 08 00 00       	call   375c <exit>
    2e85:	83 ec 0c             	sub    $0xc,%esp
    2e88:	6a 00                	push   $0x0
    2e8a:	e8 55 09 00 00       	call   37e4 <sbrk>
    2e8f:	89 c2                	mov    %eax,%edx
    2e91:	b8 00 00 40 06       	mov    $0x6400000,%eax
    2e96:	29 d0                	sub    %edx,%eax
    2e98:	89 04 24             	mov    %eax,(%esp)
    2e9b:	e8 44 09 00 00       	call   37e4 <sbrk>
    2ea0:	83 c4 0c             	add    $0xc,%esp
    2ea3:	6a 01                	push   $0x1
    2ea5:	68 ed 44 00 00       	push   $0x44ed
    2eaa:	ff 75 e4             	push   -0x1c(%ebp)
    2ead:	e8 ca 08 00 00       	call   377c <write>
    2eb2:	83 c4 10             	add    $0x10,%esp
    2eb5:	83 ec 0c             	sub    $0xc,%esp
    2eb8:	68 e8 03 00 00       	push   $0x3e8
    2ebd:	e8 2a 09 00 00       	call   37ec <sleep>
    2ec2:	83 c4 10             	add    $0x10,%esp
    2ec5:	eb ee                	jmp    2eb5 <sbrktest+0x347>
    2ec7:	83 c6 04             	add    $0x4,%esi
    2eca:	39 fe                	cmp    %edi,%esi
    2ecc:	74 26                	je     2ef4 <sbrktest+0x386>
    2ece:	e8 81 08 00 00       	call   3754 <fork>
    2ed3:	89 06                	mov    %eax,(%esi)
    2ed5:	85 c0                	test   %eax,%eax
    2ed7:	74 ac                	je     2e85 <sbrktest+0x317>
    2ed9:	83 f8 ff             	cmp    $0xffffffff,%eax
    2edc:	74 e9                	je     2ec7 <sbrktest+0x359>
    2ede:	83 ec 04             	sub    $0x4,%esp
    2ee1:	6a 01                	push   $0x1
    2ee3:	8d 45 b7             	lea    -0x49(%ebp),%eax
    2ee6:	50                   	push   %eax
    2ee7:	ff 75 e0             	push   -0x20(%ebp)
    2eea:	e8 85 08 00 00       	call   3774 <read>
    2eef:	83 c4 10             	add    $0x10,%esp
    2ef2:	eb d3                	jmp    2ec7 <sbrktest+0x359>
    2ef4:	83 ec 0c             	sub    $0xc,%esp
    2ef7:	68 00 10 00 00       	push   $0x1000
    2efc:	e8 e3 08 00 00       	call   37e4 <sbrk>
    2f01:	89 c6                	mov    %eax,%esi
    2f03:	83 c4 10             	add    $0x10,%esp
    2f06:	eb 07                	jmp    2f0f <sbrktest+0x3a1>
    2f08:	83 c3 04             	add    $0x4,%ebx
    2f0b:	39 fb                	cmp    %edi,%ebx
    2f0d:	74 1a                	je     2f29 <sbrktest+0x3bb>
    2f0f:	8b 03                	mov    (%ebx),%eax
    2f11:	83 f8 ff             	cmp    $0xffffffff,%eax
    2f14:	74 f2                	je     2f08 <sbrktest+0x39a>
    2f16:	83 ec 0c             	sub    $0xc,%esp
    2f19:	50                   	push   %eax
    2f1a:	e8 6d 08 00 00       	call   378c <kill>
    2f1f:	e8 40 08 00 00       	call   3764 <wait>
    2f24:	83 c4 10             	add    $0x10,%esp
    2f27:	eb df                	jmp    2f08 <sbrktest+0x39a>
    2f29:	83 fe ff             	cmp    $0xffffffff,%esi
    2f2c:	74 30                	je     2f5e <sbrktest+0x3f0>
    2f2e:	83 ec 0c             	sub    $0xc,%esp
    2f31:	6a 00                	push   $0x0
    2f33:	e8 ac 08 00 00       	call   37e4 <sbrk>
    2f38:	83 c4 10             	add    $0x10,%esp
    2f3b:	39 45 a4             	cmp    %eax,-0x5c(%ebp)
    2f3e:	72 36                	jb     2f76 <sbrktest+0x408>
    2f40:	83 ec 08             	sub    $0x8,%esp
    2f43:	68 2c 4a 00 00       	push   $0x4a2c
    2f48:	ff 35 fc 5b 00 00    	push   0x5bfc
    2f4e:	e8 49 09 00 00       	call   389c <printf>
    2f53:	83 c4 10             	add    $0x10,%esp
    2f56:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2f59:	5b                   	pop    %ebx
    2f5a:	5e                   	pop    %esi
    2f5b:	5f                   	pop    %edi
    2f5c:	5d                   	pop    %ebp
    2f5d:	c3                   	ret
    2f5e:	83 ec 08             	sub    $0x8,%esp
    2f61:	68 11 4a 00 00       	push   $0x4a11
    2f66:	ff 35 fc 5b 00 00    	push   0x5bfc
    2f6c:	e8 2b 09 00 00       	call   389c <printf>
    2f71:	e8 e6 07 00 00       	call   375c <exit>
    2f76:	83 ec 0c             	sub    $0xc,%esp
    2f79:	6a 00                	push   $0x0
    2f7b:	e8 64 08 00 00       	call   37e4 <sbrk>
    2f80:	89 c2                	mov    %eax,%edx
    2f82:	8b 45 a4             	mov    -0x5c(%ebp),%eax
    2f85:	29 d0                	sub    %edx,%eax
    2f87:	89 04 24             	mov    %eax,(%esp)
    2f8a:	e8 55 08 00 00       	call   37e4 <sbrk>
    2f8f:	83 c4 10             	add    $0x10,%esp
    2f92:	eb ac                	jmp    2f40 <sbrktest+0x3d2>

00002f94 <validateint>:
    2f94:	c3                   	ret

00002f95 <validatetest>:
    2f95:	55                   	push   %ebp
    2f96:	89 e5                	mov    %esp,%ebp
    2f98:	56                   	push   %esi
    2f99:	53                   	push   %ebx
    2f9a:	83 ec 08             	sub    $0x8,%esp
    2f9d:	68 3a 4a 00 00       	push   $0x4a3a
    2fa2:	ff 35 fc 5b 00 00    	push   0x5bfc
    2fa8:	e8 ef 08 00 00       	call   389c <printf>
    2fad:	83 c4 10             	add    $0x10,%esp
    2fb0:	be 00 00 00 00       	mov    $0x0,%esi
    2fb5:	e8 9a 07 00 00       	call   3754 <fork>
    2fba:	89 c3                	mov    %eax,%ebx
    2fbc:	85 c0                	test   %eax,%eax
    2fbe:	74 64                	je     3024 <validatetest+0x8f>
    2fc0:	83 ec 0c             	sub    $0xc,%esp
    2fc3:	6a 00                	push   $0x0
    2fc5:	e8 22 08 00 00       	call   37ec <sleep>
    2fca:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2fd1:	e8 16 08 00 00       	call   37ec <sleep>
    2fd6:	89 1c 24             	mov    %ebx,(%esp)
    2fd9:	e8 ae 07 00 00       	call   378c <kill>
    2fde:	e8 81 07 00 00       	call   3764 <wait>
    2fe3:	83 c4 08             	add    $0x8,%esp
    2fe6:	56                   	push   %esi
    2fe7:	68 49 4a 00 00       	push   $0x4a49
    2fec:	e8 cb 07 00 00       	call   37bc <link>
    2ff1:	83 c4 10             	add    $0x10,%esp
    2ff4:	83 f8 ff             	cmp    $0xffffffff,%eax
    2ff7:	75 30                	jne    3029 <validatetest+0x94>
    2ff9:	81 c6 00 10 00 00    	add    $0x1000,%esi
    2fff:	81 fe 00 40 11 00    	cmp    $0x114000,%esi
    3005:	75 ae                	jne    2fb5 <validatetest+0x20>
    3007:	83 ec 08             	sub    $0x8,%esp
    300a:	68 6d 4a 00 00       	push   $0x4a6d
    300f:	ff 35 fc 5b 00 00    	push   0x5bfc
    3015:	e8 82 08 00 00       	call   389c <printf>
    301a:	83 c4 10             	add    $0x10,%esp
    301d:	8d 65 f8             	lea    -0x8(%ebp),%esp
    3020:	5b                   	pop    %ebx
    3021:	5e                   	pop    %esi
    3022:	5d                   	pop    %ebp
    3023:	c3                   	ret
    3024:	e8 33 07 00 00       	call   375c <exit>
    3029:	83 ec 08             	sub    $0x8,%esp
    302c:	68 54 4a 00 00       	push   $0x4a54
    3031:	ff 35 fc 5b 00 00    	push   0x5bfc
    3037:	e8 60 08 00 00       	call   389c <printf>
    303c:	e8 1b 07 00 00       	call   375c <exit>

00003041 <bsstest>:
    3041:	55                   	push   %ebp
    3042:	89 e5                	mov    %esp,%ebp
    3044:	83 ec 10             	sub    $0x10,%esp
    3047:	68 7a 4a 00 00       	push   $0x4a7a
    304c:	ff 35 fc 5b 00 00    	push   0x5bfc
    3052:	e8 45 08 00 00       	call   389c <printf>
    3057:	83 c4 10             	add    $0x10,%esp
    305a:	b8 00 00 00 00       	mov    $0x0,%eax
    305f:	80 b8 20 5c 00 00 00 	cmpb   $0x0,0x5c20(%eax)
    3066:	75 22                	jne    308a <bsstest+0x49>
    3068:	83 c0 01             	add    $0x1,%eax
    306b:	3d 10 27 00 00       	cmp    $0x2710,%eax
    3070:	75 ed                	jne    305f <bsstest+0x1e>
    3072:	83 ec 08             	sub    $0x8,%esp
    3075:	68 95 4a 00 00       	push   $0x4a95
    307a:	ff 35 fc 5b 00 00    	push   0x5bfc
    3080:	e8 17 08 00 00       	call   389c <printf>
    3085:	83 c4 10             	add    $0x10,%esp
    3088:	c9                   	leave
    3089:	c3                   	ret
    308a:	83 ec 08             	sub    $0x8,%esp
    308d:	68 84 4a 00 00       	push   $0x4a84
    3092:	ff 35 fc 5b 00 00    	push   0x5bfc
    3098:	e8 ff 07 00 00       	call   389c <printf>
    309d:	e8 ba 06 00 00       	call   375c <exit>

000030a2 <bigargtest>:
    30a2:	55                   	push   %ebp
    30a3:	89 e5                	mov    %esp,%ebp
    30a5:	83 ec 14             	sub    $0x14,%esp
    30a8:	68 a2 4a 00 00       	push   $0x4aa2
    30ad:	e8 fa 06 00 00       	call   37ac <unlink>
    30b2:	e8 9d 06 00 00       	call   3754 <fork>
    30b7:	83 c4 10             	add    $0x10,%esp
    30ba:	85 c0                	test   %eax,%eax
    30bc:	74 3f                	je     30fd <bigargtest+0x5b>
    30be:	0f 88 ad 00 00 00    	js     3171 <bigargtest+0xcf>
    30c4:	e8 9b 06 00 00       	call   3764 <wait>
    30c9:	83 ec 08             	sub    $0x8,%esp
    30cc:	6a 00                	push   $0x0
    30ce:	68 a2 4a 00 00       	push   $0x4aa2
    30d3:	e8 c4 06 00 00       	call   379c <open>
    30d8:	83 c4 10             	add    $0x10,%esp
    30db:	85 c0                	test   %eax,%eax
    30dd:	0f 88 a6 00 00 00    	js     3189 <bigargtest+0xe7>
    30e3:	83 ec 0c             	sub    $0xc,%esp
    30e6:	50                   	push   %eax
    30e7:	e8 98 06 00 00       	call   3784 <close>
    30ec:	c7 04 24 a2 4a 00 00 	movl   $0x4aa2,(%esp)
    30f3:	e8 b4 06 00 00       	call   37ac <unlink>
    30f8:	83 c4 10             	add    $0x10,%esp
    30fb:	c9                   	leave
    30fc:	c3                   	ret
    30fd:	c7 04 85 40 a3 00 00 	movl   $0x5204,0xa340(,%eax,4)
    3104:	04 52 00 00 
    3108:	83 c0 01             	add    $0x1,%eax
    310b:	83 f8 1f             	cmp    $0x1f,%eax
    310e:	75 ed                	jne    30fd <bigargtest+0x5b>
    3110:	c7 05 bc a3 00 00 00 	movl   $0x0,0xa3bc
    3117:	00 00 00 
    311a:	83 ec 08             	sub    $0x8,%esp
    311d:	68 ac 4a 00 00       	push   $0x4aac
    3122:	ff 35 fc 5b 00 00    	push   0x5bfc
    3128:	e8 6f 07 00 00       	call   389c <printf>
    312d:	83 c4 08             	add    $0x8,%esp
    3130:	68 40 a3 00 00       	push   $0xa340
    3135:	68 79 3c 00 00       	push   $0x3c79
    313a:	e8 55 06 00 00       	call   3794 <exec>
    313f:	83 c4 08             	add    $0x8,%esp
    3142:	68 b9 4a 00 00       	push   $0x4ab9
    3147:	ff 35 fc 5b 00 00    	push   0x5bfc
    314d:	e8 4a 07 00 00       	call   389c <printf>
    3152:	83 c4 08             	add    $0x8,%esp
    3155:	68 00 02 00 00       	push   $0x200
    315a:	68 a2 4a 00 00       	push   $0x4aa2
    315f:	e8 38 06 00 00       	call   379c <open>
    3164:	89 04 24             	mov    %eax,(%esp)
    3167:	e8 18 06 00 00       	call   3784 <close>
    316c:	e8 eb 05 00 00       	call   375c <exit>
    3171:	83 ec 08             	sub    $0x8,%esp
    3174:	68 c9 4a 00 00       	push   $0x4ac9
    3179:	ff 35 fc 5b 00 00    	push   0x5bfc
    317f:	e8 18 07 00 00       	call   389c <printf>
    3184:	e8 d3 05 00 00       	call   375c <exit>
    3189:	83 ec 08             	sub    $0x8,%esp
    318c:	68 e2 4a 00 00       	push   $0x4ae2
    3191:	ff 35 fc 5b 00 00    	push   0x5bfc
    3197:	e8 00 07 00 00       	call   389c <printf>
    319c:	e8 bb 05 00 00       	call   375c <exit>

000031a1 <fsfull>:
    31a1:	55                   	push   %ebp
    31a2:	89 e5                	mov    %esp,%ebp
    31a4:	57                   	push   %edi
    31a5:	56                   	push   %esi
    31a6:	53                   	push   %ebx
    31a7:	83 ec 54             	sub    $0x54,%esp
    31aa:	68 f7 4a 00 00       	push   $0x4af7
    31af:	6a 01                	push   $0x1
    31b1:	e8 e6 06 00 00       	call   389c <printf>
    31b6:	83 c4 10             	add    $0x10,%esp
    31b9:	bb 00 00 00 00       	mov    $0x0,%ebx
    31be:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    31c2:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    31c7:	f7 eb                	imul   %ebx
    31c9:	c1 fa 06             	sar    $0x6,%edx
    31cc:	89 de                	mov    %ebx,%esi
    31ce:	c1 fe 1f             	sar    $0x1f,%esi
    31d1:	29 f2                	sub    %esi,%edx
    31d3:	8d 42 30             	lea    0x30(%edx),%eax
    31d6:	88 45 a9             	mov    %al,-0x57(%ebp)
    31d9:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
    31df:	89 d9                	mov    %ebx,%ecx
    31e1:	29 d1                	sub    %edx,%ecx
    31e3:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    31e8:	f7 e9                	imul   %ecx
    31ea:	c1 fa 05             	sar    $0x5,%edx
    31ed:	c1 f9 1f             	sar    $0x1f,%ecx
    31f0:	29 ca                	sub    %ecx,%edx
    31f2:	83 c2 30             	add    $0x30,%edx
    31f5:	88 55 aa             	mov    %dl,-0x56(%ebp)
    31f8:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    31fd:	f7 eb                	imul   %ebx
    31ff:	c1 fa 05             	sar    $0x5,%edx
    3202:	29 f2                	sub    %esi,%edx
    3204:	6b d2 64             	imul   $0x64,%edx,%edx
    3207:	89 df                	mov    %ebx,%edi
    3209:	29 d7                	sub    %edx,%edi
    320b:	b9 67 66 66 66       	mov    $0x66666667,%ecx
    3210:	89 f8                	mov    %edi,%eax
    3212:	f7 e9                	imul   %ecx
    3214:	c1 fa 02             	sar    $0x2,%edx
    3217:	c1 ff 1f             	sar    $0x1f,%edi
    321a:	29 fa                	sub    %edi,%edx
    321c:	83 c2 30             	add    $0x30,%edx
    321f:	88 55 ab             	mov    %dl,-0x55(%ebp)
    3222:	89 d8                	mov    %ebx,%eax
    3224:	f7 e9                	imul   %ecx
    3226:	c1 fa 02             	sar    $0x2,%edx
    3229:	29 f2                	sub    %esi,%edx
    322b:	8d 14 92             	lea    (%edx,%edx,4),%edx
    322e:	01 d2                	add    %edx,%edx
    3230:	89 d8                	mov    %ebx,%eax
    3232:	29 d0                	sub    %edx,%eax
    3234:	83 c0 30             	add    $0x30,%eax
    3237:	88 45 ac             	mov    %al,-0x54(%ebp)
    323a:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
    323e:	83 ec 04             	sub    $0x4,%esp
    3241:	8d 75 a8             	lea    -0x58(%ebp),%esi
    3244:	56                   	push   %esi
    3245:	68 04 4b 00 00       	push   $0x4b04
    324a:	6a 01                	push   $0x1
    324c:	e8 4b 06 00 00       	call   389c <printf>
    3251:	83 c4 08             	add    $0x8,%esp
    3254:	68 02 02 00 00       	push   $0x202
    3259:	56                   	push   %esi
    325a:	e8 3d 05 00 00       	call   379c <open>
    325f:	89 c6                	mov    %eax,%esi
    3261:	83 c4 10             	add    $0x10,%esp
    3264:	85 c0                	test   %eax,%eax
    3266:	0f 89 d3 00 00 00    	jns    333f <fsfull+0x19e>
    326c:	83 ec 04             	sub    $0x4,%esp
    326f:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3272:	50                   	push   %eax
    3273:	68 10 4b 00 00       	push   $0x4b10
    3278:	6a 01                	push   $0x1
    327a:	e8 1d 06 00 00       	call   389c <printf>
    327f:	83 c4 10             	add    $0x10,%esp
    3282:	85 db                	test   %ebx,%ebx
    3284:	0f 88 9b 00 00 00    	js     3325 <fsfull+0x184>
    328a:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    328e:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    3293:	f7 eb                	imul   %ebx
    3295:	c1 fa 06             	sar    $0x6,%edx
    3298:	89 de                	mov    %ebx,%esi
    329a:	c1 fe 1f             	sar    $0x1f,%esi
    329d:	29 f2                	sub    %esi,%edx
    329f:	8d 42 30             	lea    0x30(%edx),%eax
    32a2:	88 45 a9             	mov    %al,-0x57(%ebp)
    32a5:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
    32ab:	89 d9                	mov    %ebx,%ecx
    32ad:	29 d1                	sub    %edx,%ecx
    32af:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    32b4:	f7 e9                	imul   %ecx
    32b6:	c1 fa 05             	sar    $0x5,%edx
    32b9:	c1 f9 1f             	sar    $0x1f,%ecx
    32bc:	29 ca                	sub    %ecx,%edx
    32be:	83 c2 30             	add    $0x30,%edx
    32c1:	88 55 aa             	mov    %dl,-0x56(%ebp)
    32c4:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    32c9:	f7 eb                	imul   %ebx
    32cb:	c1 fa 05             	sar    $0x5,%edx
    32ce:	29 f2                	sub    %esi,%edx
    32d0:	6b d2 64             	imul   $0x64,%edx,%edx
    32d3:	89 df                	mov    %ebx,%edi
    32d5:	29 d7                	sub    %edx,%edi
    32d7:	b9 67 66 66 66       	mov    $0x66666667,%ecx
    32dc:	89 f8                	mov    %edi,%eax
    32de:	f7 e9                	imul   %ecx
    32e0:	c1 fa 02             	sar    $0x2,%edx
    32e3:	c1 ff 1f             	sar    $0x1f,%edi
    32e6:	29 fa                	sub    %edi,%edx
    32e8:	83 c2 30             	add    $0x30,%edx
    32eb:	88 55 ab             	mov    %dl,-0x55(%ebp)
    32ee:	89 d8                	mov    %ebx,%eax
    32f0:	f7 e9                	imul   %ecx
    32f2:	c1 fa 02             	sar    $0x2,%edx
    32f5:	29 f2                	sub    %esi,%edx
    32f7:	8d 14 92             	lea    (%edx,%edx,4),%edx
    32fa:	01 d2                	add    %edx,%edx
    32fc:	89 d8                	mov    %ebx,%eax
    32fe:	29 d0                	sub    %edx,%eax
    3300:	83 c0 30             	add    $0x30,%eax
    3303:	88 45 ac             	mov    %al,-0x54(%ebp)
    3306:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
    330a:	83 ec 0c             	sub    $0xc,%esp
    330d:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3310:	50                   	push   %eax
    3311:	e8 96 04 00 00       	call   37ac <unlink>
    3316:	83 eb 01             	sub    $0x1,%ebx
    3319:	83 c4 10             	add    $0x10,%esp
    331c:	83 fb ff             	cmp    $0xffffffff,%ebx
    331f:	0f 85 65 ff ff ff    	jne    328a <fsfull+0xe9>
    3325:	83 ec 08             	sub    $0x8,%esp
    3328:	68 30 4b 00 00       	push   $0x4b30
    332d:	6a 01                	push   $0x1
    332f:	e8 68 05 00 00       	call   389c <printf>
    3334:	83 c4 10             	add    $0x10,%esp
    3337:	8d 65 f4             	lea    -0xc(%ebp),%esp
    333a:	5b                   	pop    %ebx
    333b:	5e                   	pop    %esi
    333c:	5f                   	pop    %edi
    333d:	5d                   	pop    %ebp
    333e:	c3                   	ret
    333f:	bf 00 00 00 00       	mov    $0x0,%edi
    3344:	83 ec 04             	sub    $0x4,%esp
    3347:	68 00 02 00 00       	push   $0x200
    334c:	68 40 83 00 00       	push   $0x8340
    3351:	56                   	push   %esi
    3352:	e8 25 04 00 00       	call   377c <write>
    3357:	83 c4 10             	add    $0x10,%esp
    335a:	3d ff 01 00 00       	cmp    $0x1ff,%eax
    335f:	7e 04                	jle    3365 <fsfull+0x1c4>
    3361:	01 c7                	add    %eax,%edi
    3363:	eb df                	jmp    3344 <fsfull+0x1a3>
    3365:	83 ec 04             	sub    $0x4,%esp
    3368:	57                   	push   %edi
    3369:	68 20 4b 00 00       	push   $0x4b20
    336e:	6a 01                	push   $0x1
    3370:	e8 27 05 00 00       	call   389c <printf>
    3375:	89 34 24             	mov    %esi,(%esp)
    3378:	e8 07 04 00 00       	call   3784 <close>
    337d:	83 c4 10             	add    $0x10,%esp
    3380:	85 ff                	test   %edi,%edi
    3382:	0f 84 fa fe ff ff    	je     3282 <fsfull+0xe1>
    3388:	83 c3 01             	add    $0x1,%ebx
    338b:	e9 2e fe ff ff       	jmp    31be <fsfull+0x1d>

00003390 <uio>:
    3390:	55                   	push   %ebp
    3391:	89 e5                	mov    %esp,%ebp
    3393:	83 ec 10             	sub    $0x10,%esp
    3396:	68 46 4b 00 00       	push   $0x4b46
    339b:	6a 01                	push   $0x1
    339d:	e8 fa 04 00 00       	call   389c <printf>
    33a2:	e8 ad 03 00 00       	call   3754 <fork>
    33a7:	83 c4 10             	add    $0x10,%esp
    33aa:	85 c0                	test   %eax,%eax
    33ac:	74 1b                	je     33c9 <uio+0x39>
    33ae:	78 3e                	js     33ee <uio+0x5e>
    33b0:	e8 af 03 00 00       	call   3764 <wait>
    33b5:	83 ec 08             	sub    $0x8,%esp
    33b8:	68 50 4b 00 00       	push   $0x4b50
    33bd:	6a 01                	push   $0x1
    33bf:	e8 d8 04 00 00       	call   389c <printf>
    33c4:	83 c4 10             	add    $0x10,%esp
    33c7:	c9                   	leave
    33c8:	c3                   	ret
    33c9:	b8 09 00 00 00       	mov    $0x9,%eax
    33ce:	ba 70 00 00 00       	mov    $0x70,%edx
    33d3:	ee                   	out    %al,(%dx)
    33d4:	ba 71 00 00 00       	mov    $0x71,%edx
    33d9:	ec                   	in     (%dx),%al
    33da:	83 ec 08             	sub    $0x8,%esp
    33dd:	68 e4 52 00 00       	push   $0x52e4
    33e2:	6a 01                	push   $0x1
    33e4:	e8 b3 04 00 00       	call   389c <printf>
    33e9:	e8 6e 03 00 00       	call   375c <exit>
    33ee:	83 ec 08             	sub    $0x8,%esp
    33f1:	68 d5 4a 00 00       	push   $0x4ad5
    33f6:	6a 01                	push   $0x1
    33f8:	e8 9f 04 00 00       	call   389c <printf>
    33fd:	e8 5a 03 00 00       	call   375c <exit>

00003402 <argptest>:
    3402:	55                   	push   %ebp
    3403:	89 e5                	mov    %esp,%ebp
    3405:	53                   	push   %ebx
    3406:	83 ec 0c             	sub    $0xc,%esp
    3409:	6a 00                	push   $0x0
    340b:	68 5f 4b 00 00       	push   $0x4b5f
    3410:	e8 87 03 00 00       	call   379c <open>
    3415:	83 c4 10             	add    $0x10,%esp
    3418:	85 c0                	test   %eax,%eax
    341a:	78 3a                	js     3456 <argptest+0x54>
    341c:	89 c3                	mov    %eax,%ebx
    341e:	83 ec 0c             	sub    $0xc,%esp
    3421:	6a 00                	push   $0x0
    3423:	e8 bc 03 00 00       	call   37e4 <sbrk>
    3428:	83 c4 0c             	add    $0xc,%esp
    342b:	6a ff                	push   $0xffffffff
    342d:	83 e8 01             	sub    $0x1,%eax
    3430:	50                   	push   %eax
    3431:	53                   	push   %ebx
    3432:	e8 3d 03 00 00       	call   3774 <read>
    3437:	89 1c 24             	mov    %ebx,(%esp)
    343a:	e8 45 03 00 00       	call   3784 <close>
    343f:	83 c4 08             	add    $0x8,%esp
    3442:	68 71 4b 00 00       	push   $0x4b71
    3447:	6a 01                	push   $0x1
    3449:	e8 4e 04 00 00       	call   389c <printf>
    344e:	83 c4 10             	add    $0x10,%esp
    3451:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3454:	c9                   	leave
    3455:	c3                   	ret
    3456:	83 ec 08             	sub    $0x8,%esp
    3459:	68 64 4b 00 00       	push   $0x4b64
    345e:	6a 02                	push   $0x2
    3460:	e8 37 04 00 00       	call   389c <printf>
    3465:	e8 f2 02 00 00       	call   375c <exit>

0000346a <rand>:
    346a:	69 05 f8 5b 00 00 0d 	imul   $0x19660d,0x5bf8,%eax
    3471:	66 19 00 
    3474:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
    3479:	a3 f8 5b 00 00       	mov    %eax,0x5bf8
    347e:	c3                   	ret

0000347f <main>:
    347f:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    3483:	83 e4 f0             	and    $0xfffffff0,%esp
    3486:	ff 71 fc             	push   -0x4(%ecx)
    3489:	55                   	push   %ebp
    348a:	89 e5                	mov    %esp,%ebp
    348c:	51                   	push   %ecx
    348d:	83 ec 0c             	sub    $0xc,%esp
    3490:	68 82 4b 00 00       	push   $0x4b82
    3495:	6a 01                	push   $0x1
    3497:	e8 00 04 00 00       	call   389c <printf>
    349c:	83 c4 08             	add    $0x8,%esp
    349f:	6a 00                	push   $0x0
    34a1:	68 96 4b 00 00       	push   $0x4b96
    34a6:	e8 f1 02 00 00       	call   379c <open>
    34ab:	83 c4 10             	add    $0x10,%esp
    34ae:	85 c0                	test   %eax,%eax
    34b0:	78 14                	js     34c6 <main+0x47>
    34b2:	83 ec 08             	sub    $0x8,%esp
    34b5:	68 08 53 00 00       	push   $0x5308
    34ba:	6a 01                	push   $0x1
    34bc:	e8 db 03 00 00       	call   389c <printf>
    34c1:	e8 96 02 00 00       	call   375c <exit>
    34c6:	83 ec 08             	sub    $0x8,%esp
    34c9:	68 00 02 00 00       	push   $0x200
    34ce:	68 96 4b 00 00       	push   $0x4b96
    34d3:	e8 c4 02 00 00       	call   379c <open>
    34d8:	89 04 24             	mov    %eax,(%esp)
    34db:	e8 a4 02 00 00       	call   3784 <close>
    34e0:	e8 1d ff ff ff       	call   3402 <argptest>
    34e5:	e8 0f db ff ff       	call   ff9 <createdelete>
    34ea:	e8 c2 e3 ff ff       	call   18b1 <linkunlink>
    34ef:	e8 c2 e0 ff ff       	call   15b6 <concreate>
    34f4:	e8 2a d9 ff ff       	call   e23 <fourfiles>
    34f9:	e8 91 d7 ff ff       	call   c8f <sharedfd>
    34fe:	e8 9f fb ff ff       	call   30a2 <bigargtest>
    3503:	e8 23 ed ff ff       	call   222b <bigwrite>
    3508:	e8 95 fb ff ff       	call   30a2 <bigargtest>
    350d:	e8 2f fb ff ff       	call   3041 <bsstest>
    3512:	e8 57 f6 ff ff       	call   2b6e <sbrktest>
    3517:	e8 79 fa ff ff       	call   2f95 <validatetest>
    351c:	e8 8b cd ff ff       	call   2ac <opentest>
    3521:	e8 19 ce ff ff       	call   33f <writetest>
    3526:	e8 f2 cf ff ff       	call   51d <writetest1>
    352b:	e8 a7 d1 ff ff       	call   6d7 <createtest>
    3530:	e8 8e cc ff ff       	call   1c3 <openiputtest>
    3535:	e8 a3 cb ff ff       	call   dd <exitiputtest>
    353a:	e8 c1 ca ff ff       	call   0 <iputtest>
    353f:	e8 96 d6 ff ff       	call   bda <mem>
    3544:	e8 58 d3 ff ff       	call   8a1 <pipe1>
    3549:	e8 e6 d4 ff ff       	call   a34 <preempt>
    354e:	e8 1c d6 ff ff       	call   b6f <exitwait>
    3553:	e8 b3 f0 ff ff       	call   260b <rmdot>
    3558:	e8 71 ef ff ff       	call   24ce <fourteen>
    355d:	e8 a4 ed ff ff       	call   2306 <bigfile>
    3562:	e8 96 e5 ff ff       	call   1afd <subdir>
    3567:	e8 24 de ff ff       	call   1390 <linktest>
    356c:	e8 86 dc ff ff       	call   11f7 <unlinkread>
    3571:	e8 1a f2 ff ff       	call   2790 <dirfile>
    3576:	e8 2f f4 ff ff       	call   29aa <iref>
    357b:	e8 4c f5 ff ff       	call   2acc <forktest>
    3580:	e8 1e e4 ff ff       	call   19a3 <bigdir>
    3585:	e8 06 fe ff ff       	call   3390 <uio>
    358a:	e8 c9 d2 ff ff       	call   858 <exectest>
    358f:	e8 c8 01 00 00       	call   375c <exit>

00003594 <strcpy>:
    3594:	55                   	push   %ebp
    3595:	89 e5                	mov    %esp,%ebp
    3597:	53                   	push   %ebx
    3598:	8b 4d 08             	mov    0x8(%ebp),%ecx
    359b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    359e:	b8 00 00 00 00       	mov    $0x0,%eax
    35a3:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
    35a7:	88 14 01             	mov    %dl,(%ecx,%eax,1)
    35aa:	83 c0 01             	add    $0x1,%eax
    35ad:	84 d2                	test   %dl,%dl
    35af:	75 f2                	jne    35a3 <strcpy+0xf>
    35b1:	89 c8                	mov    %ecx,%eax
    35b3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    35b6:	c9                   	leave
    35b7:	c3                   	ret

000035b8 <strcmp>:
    35b8:	55                   	push   %ebp
    35b9:	89 e5                	mov    %esp,%ebp
    35bb:	8b 4d 08             	mov    0x8(%ebp),%ecx
    35be:	8b 55 0c             	mov    0xc(%ebp),%edx
    35c1:	0f b6 01             	movzbl (%ecx),%eax
    35c4:	84 c0                	test   %al,%al
    35c6:	74 11                	je     35d9 <strcmp+0x21>
    35c8:	38 02                	cmp    %al,(%edx)
    35ca:	75 0d                	jne    35d9 <strcmp+0x21>
    35cc:	83 c1 01             	add    $0x1,%ecx
    35cf:	83 c2 01             	add    $0x1,%edx
    35d2:	0f b6 01             	movzbl (%ecx),%eax
    35d5:	84 c0                	test   %al,%al
    35d7:	75 ef                	jne    35c8 <strcmp+0x10>
    35d9:	0f b6 c0             	movzbl %al,%eax
    35dc:	0f b6 12             	movzbl (%edx),%edx
    35df:	29 d0                	sub    %edx,%eax
    35e1:	5d                   	pop    %ebp
    35e2:	c3                   	ret

000035e3 <strlen>:
    35e3:	55                   	push   %ebp
    35e4:	89 e5                	mov    %esp,%ebp
    35e6:	8b 55 08             	mov    0x8(%ebp),%edx
    35e9:	80 3a 00             	cmpb   $0x0,(%edx)
    35ec:	74 14                	je     3602 <strlen+0x1f>
    35ee:	b8 00 00 00 00       	mov    $0x0,%eax
    35f3:	83 c0 01             	add    $0x1,%eax
    35f6:	89 c1                	mov    %eax,%ecx
    35f8:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    35fc:	75 f5                	jne    35f3 <strlen+0x10>
    35fe:	89 c8                	mov    %ecx,%eax
    3600:	5d                   	pop    %ebp
    3601:	c3                   	ret
    3602:	b9 00 00 00 00       	mov    $0x0,%ecx
    3607:	eb f5                	jmp    35fe <strlen+0x1b>

00003609 <memset>:
    3609:	55                   	push   %ebp
    360a:	89 e5                	mov    %esp,%ebp
    360c:	57                   	push   %edi
    360d:	8b 55 08             	mov    0x8(%ebp),%edx
    3610:	89 d7                	mov    %edx,%edi
    3612:	8b 4d 10             	mov    0x10(%ebp),%ecx
    3615:	8b 45 0c             	mov    0xc(%ebp),%eax
    3618:	fc                   	cld
    3619:	f3 aa                	rep stos %al,%es:(%edi)
    361b:	89 d0                	mov    %edx,%eax
    361d:	8b 7d fc             	mov    -0x4(%ebp),%edi
    3620:	c9                   	leave
    3621:	c3                   	ret

00003622 <strchr>:
    3622:	55                   	push   %ebp
    3623:	89 e5                	mov    %esp,%ebp
    3625:	8b 45 08             	mov    0x8(%ebp),%eax
    3628:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
    362c:	0f b6 10             	movzbl (%eax),%edx
    362f:	84 d2                	test   %dl,%dl
    3631:	74 15                	je     3648 <strchr+0x26>
    3633:	38 d1                	cmp    %dl,%cl
    3635:	74 0f                	je     3646 <strchr+0x24>
    3637:	83 c0 01             	add    $0x1,%eax
    363a:	0f b6 10             	movzbl (%eax),%edx
    363d:	84 d2                	test   %dl,%dl
    363f:	75 f2                	jne    3633 <strchr+0x11>
    3641:	b8 00 00 00 00       	mov    $0x0,%eax
    3646:	5d                   	pop    %ebp
    3647:	c3                   	ret
    3648:	b8 00 00 00 00       	mov    $0x0,%eax
    364d:	eb f7                	jmp    3646 <strchr+0x24>

0000364f <gets>:
    364f:	55                   	push   %ebp
    3650:	89 e5                	mov    %esp,%ebp
    3652:	57                   	push   %edi
    3653:	56                   	push   %esi
    3654:	53                   	push   %ebx
    3655:	83 ec 2c             	sub    $0x2c,%esp
    3658:	8b 75 08             	mov    0x8(%ebp),%esi
    365b:	bb 00 00 00 00       	mov    $0x0,%ebx
    3660:	8d 7d e7             	lea    -0x19(%ebp),%edi
    3663:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    3666:	83 c3 01             	add    $0x1,%ebx
    3669:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    366c:	7d 27                	jge    3695 <gets+0x46>
    366e:	83 ec 04             	sub    $0x4,%esp
    3671:	6a 01                	push   $0x1
    3673:	57                   	push   %edi
    3674:	6a 00                	push   $0x0
    3676:	e8 f9 00 00 00       	call   3774 <read>
    367b:	83 c4 10             	add    $0x10,%esp
    367e:	85 c0                	test   %eax,%eax
    3680:	7e 13                	jle    3695 <gets+0x46>
    3682:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    3686:	88 44 1e ff          	mov    %al,-0x1(%esi,%ebx,1)
    368a:	3c 0a                	cmp    $0xa,%al
    368c:	74 04                	je     3692 <gets+0x43>
    368e:	3c 0d                	cmp    $0xd,%al
    3690:	75 d1                	jne    3663 <gets+0x14>
    3692:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    3695:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3698:	c6 04 06 00          	movb   $0x0,(%esi,%eax,1)
    369c:	89 f0                	mov    %esi,%eax
    369e:	8d 65 f4             	lea    -0xc(%ebp),%esp
    36a1:	5b                   	pop    %ebx
    36a2:	5e                   	pop    %esi
    36a3:	5f                   	pop    %edi
    36a4:	5d                   	pop    %ebp
    36a5:	c3                   	ret

000036a6 <stat>:
    36a6:	55                   	push   %ebp
    36a7:	89 e5                	mov    %esp,%ebp
    36a9:	56                   	push   %esi
    36aa:	53                   	push   %ebx
    36ab:	83 ec 08             	sub    $0x8,%esp
    36ae:	6a 00                	push   $0x0
    36b0:	ff 75 08             	push   0x8(%ebp)
    36b3:	e8 e4 00 00 00       	call   379c <open>
    36b8:	83 c4 10             	add    $0x10,%esp
    36bb:	85 c0                	test   %eax,%eax
    36bd:	78 24                	js     36e3 <stat+0x3d>
    36bf:	89 c3                	mov    %eax,%ebx
    36c1:	83 ec 08             	sub    $0x8,%esp
    36c4:	ff 75 0c             	push   0xc(%ebp)
    36c7:	50                   	push   %eax
    36c8:	e8 e7 00 00 00       	call   37b4 <fstat>
    36cd:	89 c6                	mov    %eax,%esi
    36cf:	89 1c 24             	mov    %ebx,(%esp)
    36d2:	e8 ad 00 00 00       	call   3784 <close>
    36d7:	83 c4 10             	add    $0x10,%esp
    36da:	89 f0                	mov    %esi,%eax
    36dc:	8d 65 f8             	lea    -0x8(%ebp),%esp
    36df:	5b                   	pop    %ebx
    36e0:	5e                   	pop    %esi
    36e1:	5d                   	pop    %ebp
    36e2:	c3                   	ret
    36e3:	be ff ff ff ff       	mov    $0xffffffff,%esi
    36e8:	eb f0                	jmp    36da <stat+0x34>

000036ea <atoi>:
    36ea:	55                   	push   %ebp
    36eb:	89 e5                	mov    %esp,%ebp
    36ed:	53                   	push   %ebx
    36ee:	8b 55 08             	mov    0x8(%ebp),%edx
    36f1:	0f b6 02             	movzbl (%edx),%eax
    36f4:	8d 48 d0             	lea    -0x30(%eax),%ecx
    36f7:	80 f9 09             	cmp    $0x9,%cl
    36fa:	77 24                	ja     3720 <atoi+0x36>
    36fc:	b9 00 00 00 00       	mov    $0x0,%ecx
    3701:	83 c2 01             	add    $0x1,%edx
    3704:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
    3707:	0f be c0             	movsbl %al,%eax
    370a:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
    370e:	0f b6 02             	movzbl (%edx),%eax
    3711:	8d 58 d0             	lea    -0x30(%eax),%ebx
    3714:	80 fb 09             	cmp    $0x9,%bl
    3717:	76 e8                	jbe    3701 <atoi+0x17>
    3719:	89 c8                	mov    %ecx,%eax
    371b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    371e:	c9                   	leave
    371f:	c3                   	ret
    3720:	b9 00 00 00 00       	mov    $0x0,%ecx
    3725:	eb f2                	jmp    3719 <atoi+0x2f>

00003727 <memmove>:
    3727:	55                   	push   %ebp
    3728:	89 e5                	mov    %esp,%ebp
    372a:	56                   	push   %esi
    372b:	53                   	push   %ebx
    372c:	8b 75 08             	mov    0x8(%ebp),%esi
    372f:	8b 55 0c             	mov    0xc(%ebp),%edx
    3732:	8b 5d 10             	mov    0x10(%ebp),%ebx
    3735:	85 db                	test   %ebx,%ebx
    3737:	7e 15                	jle    374e <memmove+0x27>
    3739:	01 f3                	add    %esi,%ebx
    373b:	89 f0                	mov    %esi,%eax
    373d:	83 c2 01             	add    $0x1,%edx
    3740:	83 c0 01             	add    $0x1,%eax
    3743:	0f b6 4a ff          	movzbl -0x1(%edx),%ecx
    3747:	88 48 ff             	mov    %cl,-0x1(%eax)
    374a:	39 c3                	cmp    %eax,%ebx
    374c:	75 ef                	jne    373d <memmove+0x16>
    374e:	89 f0                	mov    %esi,%eax
    3750:	5b                   	pop    %ebx
    3751:	5e                   	pop    %esi
    3752:	5d                   	pop    %ebp
    3753:	c3                   	ret

00003754 <fork>:
  name: \
    movl $1, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALLFORK(fork) //instead of SYSCALL(fork) !!!
    3754:	b8 01 00 00 00       	mov    $0x1,%eax
    3759:	cd 40                	int    $0x40
    375b:	c3                   	ret

0000375c <exit>:
//SYSCALL(fork)
SYSCALL(exit)
    375c:	b8 02 00 00 00       	mov    $0x2,%eax
    3761:	cd 40                	int    $0x40
    3763:	c3                   	ret

00003764 <wait>:
SYSCALL(wait)
    3764:	b8 03 00 00 00       	mov    $0x3,%eax
    3769:	cd 40                	int    $0x40
    376b:	c3                   	ret

0000376c <pipe>:
SYSCALL(pipe)
    376c:	b8 04 00 00 00       	mov    $0x4,%eax
    3771:	cd 40                	int    $0x40
    3773:	c3                   	ret

00003774 <read>:
SYSCALL(read)
    3774:	b8 05 00 00 00       	mov    $0x5,%eax
    3779:	cd 40                	int    $0x40
    377b:	c3                   	ret

0000377c <write>:
SYSCALL(write)
    377c:	b8 10 00 00 00       	mov    $0x10,%eax
    3781:	cd 40                	int    $0x40
    3783:	c3                   	ret

00003784 <close>:
SYSCALL(close)
    3784:	b8 15 00 00 00       	mov    $0x15,%eax
    3789:	cd 40                	int    $0x40
    378b:	c3                   	ret

0000378c <kill>:
SYSCALL(kill)
    378c:	b8 06 00 00 00       	mov    $0x6,%eax
    3791:	cd 40                	int    $0x40
    3793:	c3                   	ret

00003794 <exec>:
SYSCALL(exec)
    3794:	b8 07 00 00 00       	mov    $0x7,%eax
    3799:	cd 40                	int    $0x40
    379b:	c3                   	ret

0000379c <open>:
SYSCALL(open)
    379c:	b8 0f 00 00 00       	mov    $0xf,%eax
    37a1:	cd 40                	int    $0x40
    37a3:	c3                   	ret

000037a4 <mknod>:
SYSCALL(mknod)
    37a4:	b8 11 00 00 00       	mov    $0x11,%eax
    37a9:	cd 40                	int    $0x40
    37ab:	c3                   	ret

000037ac <unlink>:
SYSCALL(unlink)
    37ac:	b8 12 00 00 00       	mov    $0x12,%eax
    37b1:	cd 40                	int    $0x40
    37b3:	c3                   	ret

000037b4 <fstat>:
SYSCALL(fstat)
    37b4:	b8 08 00 00 00       	mov    $0x8,%eax
    37b9:	cd 40                	int    $0x40
    37bb:	c3                   	ret

000037bc <link>:
SYSCALL(link)
    37bc:	b8 13 00 00 00       	mov    $0x13,%eax
    37c1:	cd 40                	int    $0x40
    37c3:	c3                   	ret

000037c4 <mkdir>:
SYSCALL(mkdir)
    37c4:	b8 14 00 00 00       	mov    $0x14,%eax
    37c9:	cd 40                	int    $0x40
    37cb:	c3                   	ret

000037cc <chdir>:
SYSCALL(chdir)
    37cc:	b8 09 00 00 00       	mov    $0x9,%eax
    37d1:	cd 40                	int    $0x40
    37d3:	c3                   	ret

000037d4 <dup>:
SYSCALL(dup)
    37d4:	b8 0a 00 00 00       	mov    $0xa,%eax
    37d9:	cd 40                	int    $0x40
    37db:	c3                   	ret

000037dc <getpid>:
SYSCALL(getpid)
    37dc:	b8 0b 00 00 00       	mov    $0xb,%eax
    37e1:	cd 40                	int    $0x40
    37e3:	c3                   	ret

000037e4 <sbrk>:
SYSCALL(sbrk)
    37e4:	b8 0c 00 00 00       	mov    $0xc,%eax
    37e9:	cd 40                	int    $0x40
    37eb:	c3                   	ret

000037ec <sleep>:
SYSCALL(sleep)
    37ec:	b8 0d 00 00 00       	mov    $0xd,%eax
    37f1:	cd 40                	int    $0x40
    37f3:	c3                   	ret

000037f4 <uptime>:
SYSCALL(uptime)
    37f4:	b8 0e 00 00 00       	mov    $0xe,%eax
    37f9:	cd 40                	int    $0x40
    37fb:	c3                   	ret

000037fc <ps>:
SYSCALL(ps)
    37fc:	b8 16 00 00 00       	mov    $0x16,%eax
    3801:	cd 40                	int    $0x40
    3803:	c3                   	ret

00003804 <printint>:
    3804:	55                   	push   %ebp
    3805:	89 e5                	mov    %esp,%ebp
    3807:	57                   	push   %edi
    3808:	56                   	push   %esi
    3809:	53                   	push   %ebx
    380a:	83 ec 3c             	sub    $0x3c,%esp
    380d:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    3810:	89 ce                	mov    %ecx,%esi
    3812:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    3816:	74 79                	je     3891 <printint+0x8d>
    3818:	85 d2                	test   %edx,%edx
    381a:	79 75                	jns    3891 <printint+0x8d>
    381c:	89 d1                	mov    %edx,%ecx
    381e:	f7 d9                	neg    %ecx
    3820:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
    3827:	bb 00 00 00 00       	mov    $0x0,%ebx
    382c:	89 df                	mov    %ebx,%edi
    382e:	83 c3 01             	add    $0x1,%ebx
    3831:	89 c8                	mov    %ecx,%eax
    3833:	ba 00 00 00 00       	mov    $0x0,%edx
    3838:	f7 f6                	div    %esi
    383a:	0f b6 92 8c 53 00 00 	movzbl 0x538c(%edx),%edx
    3841:	88 54 1d d7          	mov    %dl,-0x29(%ebp,%ebx,1)
    3845:	89 ca                	mov    %ecx,%edx
    3847:	89 c1                	mov    %eax,%ecx
    3849:	39 f2                	cmp    %esi,%edx
    384b:	73 df                	jae    382c <printint+0x28>
    384d:	83 7d c0 00          	cmpl   $0x0,-0x40(%ebp)
    3851:	74 08                	je     385b <printint+0x57>
    3853:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    3858:	8d 5f 02             	lea    0x2(%edi),%ebx
    385b:	85 db                	test   %ebx,%ebx
    385d:	7e 2a                	jle    3889 <printint+0x85>
    385f:	8d 75 d8             	lea    -0x28(%ebp),%esi
    3862:	8d 5c 1d d7          	lea    -0x29(%ebp,%ebx,1),%ebx
    3866:	8d 7d d7             	lea    -0x29(%ebp),%edi
    3869:	0f b6 03             	movzbl (%ebx),%eax
    386c:	88 45 d7             	mov    %al,-0x29(%ebp)
    386f:	83 ec 04             	sub    $0x4,%esp
    3872:	6a 01                	push   $0x1
    3874:	57                   	push   %edi
    3875:	ff 75 c4             	push   -0x3c(%ebp)
    3878:	e8 ff fe ff ff       	call   377c <write>
    387d:	89 d8                	mov    %ebx,%eax
    387f:	83 eb 01             	sub    $0x1,%ebx
    3882:	83 c4 10             	add    $0x10,%esp
    3885:	39 f0                	cmp    %esi,%eax
    3887:	75 e0                	jne    3869 <printint+0x65>
    3889:	8d 65 f4             	lea    -0xc(%ebp),%esp
    388c:	5b                   	pop    %ebx
    388d:	5e                   	pop    %esi
    388e:	5f                   	pop    %edi
    388f:	5d                   	pop    %ebp
    3890:	c3                   	ret
    3891:	89 d1                	mov    %edx,%ecx
    3893:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
    389a:	eb 8b                	jmp    3827 <printint+0x23>

0000389c <printf>:
    389c:	55                   	push   %ebp
    389d:	89 e5                	mov    %esp,%ebp
    389f:	57                   	push   %edi
    38a0:	56                   	push   %esi
    38a1:	53                   	push   %ebx
    38a2:	83 ec 2c             	sub    $0x2c,%esp
    38a5:	8b 75 0c             	mov    0xc(%ebp),%esi
    38a8:	0f b6 1e             	movzbl (%esi),%ebx
    38ab:	84 db                	test   %bl,%bl
    38ad:	0f 84 9e 01 00 00    	je     3a51 <printf+0x1b5>
    38b3:	83 c6 01             	add    $0x1,%esi
    38b6:	8d 45 10             	lea    0x10(%ebp),%eax
    38b9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    38bc:	bf 00 00 00 00       	mov    $0x0,%edi
    38c1:	eb 2d                	jmp    38f0 <printf+0x54>
    38c3:	88 5d e7             	mov    %bl,-0x19(%ebp)
    38c6:	83 ec 04             	sub    $0x4,%esp
    38c9:	6a 01                	push   $0x1
    38cb:	8d 45 e7             	lea    -0x19(%ebp),%eax
    38ce:	50                   	push   %eax
    38cf:	ff 75 08             	push   0x8(%ebp)
    38d2:	e8 a5 fe ff ff       	call   377c <write>
    38d7:	83 c4 10             	add    $0x10,%esp
    38da:	eb 05                	jmp    38e1 <printf+0x45>
    38dc:	83 ff 25             	cmp    $0x25,%edi
    38df:	74 1f                	je     3900 <printf+0x64>
    38e1:	83 c6 01             	add    $0x1,%esi
    38e4:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    38e8:	84 db                	test   %bl,%bl
    38ea:	0f 84 61 01 00 00    	je     3a51 <printf+0x1b5>
    38f0:	0f b6 c3             	movzbl %bl,%eax
    38f3:	85 ff                	test   %edi,%edi
    38f5:	75 e5                	jne    38dc <printf+0x40>
    38f7:	83 f8 25             	cmp    $0x25,%eax
    38fa:	75 c7                	jne    38c3 <printf+0x27>
    38fc:	89 c7                	mov    %eax,%edi
    38fe:	eb e1                	jmp    38e1 <printf+0x45>
    3900:	83 f8 25             	cmp    $0x25,%eax
    3903:	0f 84 f4 00 00 00    	je     39fd <printf+0x161>
    3909:	8d 50 9d             	lea    -0x63(%eax),%edx
    390c:	83 fa 15             	cmp    $0x15,%edx
    390f:	0f 87 09 01 00 00    	ja     3a1e <printf+0x182>
    3915:	0f 87 03 01 00 00    	ja     3a1e <printf+0x182>
    391b:	ff 24 95 34 53 00 00 	jmp    *0x5334(,%edx,4)
    3922:	8b 7d d4             	mov    -0x2c(%ebp),%edi
    3925:	8b 17                	mov    (%edi),%edx
    3927:	83 ec 0c             	sub    $0xc,%esp
    392a:	6a 01                	push   $0x1
    392c:	b9 0a 00 00 00       	mov    $0xa,%ecx
    3931:	8b 45 08             	mov    0x8(%ebp),%eax
    3934:	e8 cb fe ff ff       	call   3804 <printint>
    3939:	83 c7 04             	add    $0x4,%edi
    393c:	89 7d d4             	mov    %edi,-0x2c(%ebp)
    393f:	83 c4 10             	add    $0x10,%esp
    3942:	bf 00 00 00 00       	mov    $0x0,%edi
    3947:	eb 98                	jmp    38e1 <printf+0x45>
    3949:	8b 7d d4             	mov    -0x2c(%ebp),%edi
    394c:	8b 17                	mov    (%edi),%edx
    394e:	83 ec 0c             	sub    $0xc,%esp
    3951:	6a 00                	push   $0x0
    3953:	b9 10 00 00 00       	mov    $0x10,%ecx
    3958:	8b 45 08             	mov    0x8(%ebp),%eax
    395b:	e8 a4 fe ff ff       	call   3804 <printint>
    3960:	83 c7 04             	add    $0x4,%edi
    3963:	89 7d d4             	mov    %edi,-0x2c(%ebp)
    3966:	83 c4 10             	add    $0x10,%esp
    3969:	bf 00 00 00 00       	mov    $0x0,%edi
    396e:	e9 6e ff ff ff       	jmp    38e1 <printf+0x45>
    3973:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
    3976:	8b 01                	mov    (%ecx),%eax
    3978:	83 c1 04             	add    $0x4,%ecx
    397b:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    397e:	85 c0                	test   %eax,%eax
    3980:	74 13                	je     3995 <printf+0xf9>
    3982:	89 c3                	mov    %eax,%ebx
    3984:	0f b6 00             	movzbl (%eax),%eax
    3987:	bf 00 00 00 00       	mov    $0x0,%edi
    398c:	84 c0                	test   %al,%al
    398e:	75 0f                	jne    399f <printf+0x103>
    3990:	e9 4c ff ff ff       	jmp    38e1 <printf+0x45>
    3995:	bb b5 4b 00 00       	mov    $0x4bb5,%ebx
    399a:	b8 28 00 00 00       	mov    $0x28,%eax
    399f:	8d 7d e7             	lea    -0x19(%ebp),%edi
    39a2:	89 75 d0             	mov    %esi,-0x30(%ebp)
    39a5:	8b 75 08             	mov    0x8(%ebp),%esi
    39a8:	88 45 e7             	mov    %al,-0x19(%ebp)
    39ab:	83 ec 04             	sub    $0x4,%esp
    39ae:	6a 01                	push   $0x1
    39b0:	57                   	push   %edi
    39b1:	56                   	push   %esi
    39b2:	e8 c5 fd ff ff       	call   377c <write>
    39b7:	83 c3 01             	add    $0x1,%ebx
    39ba:	0f b6 03             	movzbl (%ebx),%eax
    39bd:	83 c4 10             	add    $0x10,%esp
    39c0:	84 c0                	test   %al,%al
    39c2:	75 e4                	jne    39a8 <printf+0x10c>
    39c4:	8b 75 d0             	mov    -0x30(%ebp),%esi
    39c7:	bf 00 00 00 00       	mov    $0x0,%edi
    39cc:	e9 10 ff ff ff       	jmp    38e1 <printf+0x45>
    39d1:	8b 7d d4             	mov    -0x2c(%ebp),%edi
    39d4:	8b 07                	mov    (%edi),%eax
    39d6:	88 45 e7             	mov    %al,-0x19(%ebp)
    39d9:	83 ec 04             	sub    $0x4,%esp
    39dc:	6a 01                	push   $0x1
    39de:	8d 45 e7             	lea    -0x19(%ebp),%eax
    39e1:	50                   	push   %eax
    39e2:	ff 75 08             	push   0x8(%ebp)
    39e5:	e8 92 fd ff ff       	call   377c <write>
    39ea:	83 c7 04             	add    $0x4,%edi
    39ed:	89 7d d4             	mov    %edi,-0x2c(%ebp)
    39f0:	83 c4 10             	add    $0x10,%esp
    39f3:	bf 00 00 00 00       	mov    $0x0,%edi
    39f8:	e9 e4 fe ff ff       	jmp    38e1 <printf+0x45>
    39fd:	88 5d e7             	mov    %bl,-0x19(%ebp)
    3a00:	83 ec 04             	sub    $0x4,%esp
    3a03:	6a 01                	push   $0x1
    3a05:	8d 45 e7             	lea    -0x19(%ebp),%eax
    3a08:	50                   	push   %eax
    3a09:	ff 75 08             	push   0x8(%ebp)
    3a0c:	e8 6b fd ff ff       	call   377c <write>
    3a11:	83 c4 10             	add    $0x10,%esp
    3a14:	bf 00 00 00 00       	mov    $0x0,%edi
    3a19:	e9 c3 fe ff ff       	jmp    38e1 <printf+0x45>
    3a1e:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    3a22:	83 ec 04             	sub    $0x4,%esp
    3a25:	6a 01                	push   $0x1
    3a27:	8d 7d e7             	lea    -0x19(%ebp),%edi
    3a2a:	57                   	push   %edi
    3a2b:	ff 75 08             	push   0x8(%ebp)
    3a2e:	e8 49 fd ff ff       	call   377c <write>
    3a33:	88 5d e7             	mov    %bl,-0x19(%ebp)
    3a36:	83 c4 0c             	add    $0xc,%esp
    3a39:	6a 01                	push   $0x1
    3a3b:	57                   	push   %edi
    3a3c:	ff 75 08             	push   0x8(%ebp)
    3a3f:	e8 38 fd ff ff       	call   377c <write>
    3a44:	83 c4 10             	add    $0x10,%esp
    3a47:	bf 00 00 00 00       	mov    $0x0,%edi
    3a4c:	e9 90 fe ff ff       	jmp    38e1 <printf+0x45>
    3a51:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3a54:	5b                   	pop    %ebx
    3a55:	5e                   	pop    %esi
    3a56:	5f                   	pop    %edi
    3a57:	5d                   	pop    %ebp
    3a58:	c3                   	ret

00003a59 <free>:
    3a59:	55                   	push   %ebp
    3a5a:	89 e5                	mov    %esp,%ebp
    3a5c:	57                   	push   %edi
    3a5d:	56                   	push   %esi
    3a5e:	53                   	push   %ebx
    3a5f:	8b 5d 08             	mov    0x8(%ebp),%ebx
    3a62:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    3a65:	a1 c0 a3 00 00       	mov    0xa3c0,%eax
    3a6a:	eb 0c                	jmp    3a78 <free+0x1f>
    3a6c:	8b 10                	mov    (%eax),%edx
    3a6e:	39 d0                	cmp    %edx,%eax
    3a70:	72 04                	jb     3a76 <free+0x1d>
    3a72:	39 d1                	cmp    %edx,%ecx
    3a74:	72 10                	jb     3a86 <free+0x2d>
    3a76:	89 d0                	mov    %edx,%eax
    3a78:	39 c8                	cmp    %ecx,%eax
    3a7a:	73 f0                	jae    3a6c <free+0x13>
    3a7c:	8b 10                	mov    (%eax),%edx
    3a7e:	39 d1                	cmp    %edx,%ecx
    3a80:	72 04                	jb     3a86 <free+0x2d>
    3a82:	39 d0                	cmp    %edx,%eax
    3a84:	72 f0                	jb     3a76 <free+0x1d>
    3a86:	8b 73 fc             	mov    -0x4(%ebx),%esi
    3a89:	8b 10                	mov    (%eax),%edx
    3a8b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    3a8e:	39 fa                	cmp    %edi,%edx
    3a90:	74 19                	je     3aab <free+0x52>
    3a92:	89 53 f8             	mov    %edx,-0x8(%ebx)
    3a95:	8b 50 04             	mov    0x4(%eax),%edx
    3a98:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    3a9b:	39 f1                	cmp    %esi,%ecx
    3a9d:	74 18                	je     3ab7 <free+0x5e>
    3a9f:	89 08                	mov    %ecx,(%eax)
    3aa1:	a3 c0 a3 00 00       	mov    %eax,0xa3c0
    3aa6:	5b                   	pop    %ebx
    3aa7:	5e                   	pop    %esi
    3aa8:	5f                   	pop    %edi
    3aa9:	5d                   	pop    %ebp
    3aaa:	c3                   	ret
    3aab:	03 72 04             	add    0x4(%edx),%esi
    3aae:	89 73 fc             	mov    %esi,-0x4(%ebx)
    3ab1:	8b 10                	mov    (%eax),%edx
    3ab3:	8b 12                	mov    (%edx),%edx
    3ab5:	eb db                	jmp    3a92 <free+0x39>
    3ab7:	03 53 fc             	add    -0x4(%ebx),%edx
    3aba:	89 50 04             	mov    %edx,0x4(%eax)
    3abd:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    3ac0:	eb dd                	jmp    3a9f <free+0x46>

00003ac2 <malloc>:
    3ac2:	55                   	push   %ebp
    3ac3:	89 e5                	mov    %esp,%ebp
    3ac5:	57                   	push   %edi
    3ac6:	56                   	push   %esi
    3ac7:	53                   	push   %ebx
    3ac8:	83 ec 0c             	sub    $0xc,%esp
    3acb:	8b 45 08             	mov    0x8(%ebp),%eax
    3ace:	8d 58 07             	lea    0x7(%eax),%ebx
    3ad1:	c1 eb 03             	shr    $0x3,%ebx
    3ad4:	83 c3 01             	add    $0x1,%ebx
    3ad7:	8b 15 c0 a3 00 00    	mov    0xa3c0,%edx
    3add:	85 d2                	test   %edx,%edx
    3adf:	74 1c                	je     3afd <malloc+0x3b>
    3ae1:	8b 02                	mov    (%edx),%eax
    3ae3:	8b 48 04             	mov    0x4(%eax),%ecx
    3ae6:	39 d9                	cmp    %ebx,%ecx
    3ae8:	73 38                	jae    3b22 <malloc+0x60>
    3aea:	be 00 10 00 00       	mov    $0x1000,%esi
    3aef:	39 f3                	cmp    %esi,%ebx
    3af1:	0f 43 f3             	cmovae %ebx,%esi
    3af4:	8d 3c f5 00 00 00 00 	lea    0x0(,%esi,8),%edi
    3afb:	eb 72                	jmp    3b6f <malloc+0xad>
    3afd:	c7 05 c0 a3 00 00 c4 	movl   $0xa3c4,0xa3c0
    3b04:	a3 00 00 
    3b07:	c7 05 c4 a3 00 00 c4 	movl   $0xa3c4,0xa3c4
    3b0e:	a3 00 00 
    3b11:	c7 05 c8 a3 00 00 00 	movl   $0x0,0xa3c8
    3b18:	00 00 00 
    3b1b:	b8 c4 a3 00 00       	mov    $0xa3c4,%eax
    3b20:	eb c8                	jmp    3aea <malloc+0x28>
    3b22:	39 cb                	cmp    %ecx,%ebx
    3b24:	74 1e                	je     3b44 <malloc+0x82>
    3b26:	29 d9                	sub    %ebx,%ecx
    3b28:	89 48 04             	mov    %ecx,0x4(%eax)
    3b2b:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
    3b2e:	89 58 04             	mov    %ebx,0x4(%eax)
    3b31:	89 15 c0 a3 00 00    	mov    %edx,0xa3c0
    3b37:	8d 50 08             	lea    0x8(%eax),%edx
    3b3a:	89 d0                	mov    %edx,%eax
    3b3c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3b3f:	5b                   	pop    %ebx
    3b40:	5e                   	pop    %esi
    3b41:	5f                   	pop    %edi
    3b42:	5d                   	pop    %ebp
    3b43:	c3                   	ret
    3b44:	8b 08                	mov    (%eax),%ecx
    3b46:	89 0a                	mov    %ecx,(%edx)
    3b48:	eb e7                	jmp    3b31 <malloc+0x6f>
    3b4a:	89 70 04             	mov    %esi,0x4(%eax)
    3b4d:	83 ec 0c             	sub    $0xc,%esp
    3b50:	83 c0 08             	add    $0x8,%eax
    3b53:	50                   	push   %eax
    3b54:	e8 00 ff ff ff       	call   3a59 <free>
    3b59:	8b 15 c0 a3 00 00    	mov    0xa3c0,%edx
    3b5f:	83 c4 10             	add    $0x10,%esp
    3b62:	85 d2                	test   %edx,%edx
    3b64:	74 d4                	je     3b3a <malloc+0x78>
    3b66:	8b 02                	mov    (%edx),%eax
    3b68:	8b 48 04             	mov    0x4(%eax),%ecx
    3b6b:	39 d9                	cmp    %ebx,%ecx
    3b6d:	73 b3                	jae    3b22 <malloc+0x60>
    3b6f:	89 c2                	mov    %eax,%edx
    3b71:	39 05 c0 a3 00 00    	cmp    %eax,0xa3c0
    3b77:	75 ed                	jne    3b66 <malloc+0xa4>
    3b79:	83 ec 0c             	sub    $0xc,%esp
    3b7c:	57                   	push   %edi
    3b7d:	e8 62 fc ff ff       	call   37e4 <sbrk>
    3b82:	83 c4 10             	add    $0x10,%esp
    3b85:	83 f8 ff             	cmp    $0xffffffff,%eax
    3b88:	75 c0                	jne    3b4a <malloc+0x88>
    3b8a:	ba 00 00 00 00       	mov    $0x0,%edx
    3b8f:	eb a9                	jmp    3b3a <malloc+0x78>
