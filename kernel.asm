
kernel:     file format elf32-i386


Disassembly of section .text:

80100000 <multiboot_header>:
80100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
80100006:	00 00                	add    %al,(%eax)
80100008:	fe 4f 52             	decb   0x52(%edi)
8010000b:	e4                   	.byte 0xe4

8010000c <entry>:

# Entering xv6 on boot processor, with paging off.
.globl entry
entry:
  # Turn on page size extension for 4Mbyte pages
  movl    %cr4, %eax
8010000c:	0f 20 e0             	mov    %cr4,%eax
  orl     $(CR4_PSE), %eax
8010000f:	83 c8 10             	or     $0x10,%eax
  movl    %eax, %cr4
80100012:	0f 22 e0             	mov    %eax,%cr4
  # Set page directory
  movl    $(V2P_WO(entrypgdir)), %eax
80100015:	b8 00 80 10 00       	mov    $0x108000,%eax
  movl    %eax, %cr3
8010001a:	0f 22 d8             	mov    %eax,%cr3
  # Turn on paging.
  movl    %cr0, %eax
8010001d:	0f 20 c0             	mov    %cr0,%eax
  orl     $(CR0_PG|CR0_WP), %eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
  movl    %eax, %cr0
80100025:	0f 22 c0             	mov    %eax,%cr0

  # Set up the stack pointer.
  movl $(stack + KSTACKSIZE), %esp
80100028:	bc d0 44 11 80       	mov    $0x801144d0,%esp

  # Jump to main(), and switch to executing at
  # high addresses. The indirect call is needed because
  # the assembler produces a PC-relative instruction
  # for a direct jump.
  mov $main, %eax
8010002d:	b8 e8 29 10 80       	mov    $0x801029e8,%eax
  jmp *%eax
80100032:	ff e0                	jmp    *%eax

80100034 <binit>:
80100034:	55                   	push   %ebp
80100035:	89 e5                	mov    %esp,%ebp
80100037:	53                   	push   %ebx
80100038:	83 ec 0c             	sub    $0xc,%esp
8010003b:	68 20 64 10 80       	push   $0x80106420
80100040:	68 20 95 10 80       	push   $0x80109520
80100045:	e8 de 3a 00 00       	call   80103b28 <initlock>
8010004a:	c7 05 6c dc 10 80 1c 	movl   $0x8010dc1c,0x8010dc6c
80100051:	dc 10 80 
80100054:	c7 05 70 dc 10 80 1c 	movl   $0x8010dc1c,0x8010dc70
8010005b:	dc 10 80 
8010005e:	83 c4 10             	add    $0x10,%esp
80100061:	bb 54 95 10 80       	mov    $0x80109554,%ebx
80100066:	a1 70 dc 10 80       	mov    0x8010dc70,%eax
8010006b:	89 43 54             	mov    %eax,0x54(%ebx)
8010006e:	c7 43 50 1c dc 10 80 	movl   $0x8010dc1c,0x50(%ebx)
80100075:	83 ec 08             	sub    $0x8,%esp
80100078:	68 27 64 10 80       	push   $0x80106427
8010007d:	8d 43 0c             	lea    0xc(%ebx),%eax
80100080:	50                   	push   %eax
80100081:	e8 98 39 00 00       	call   80103a1e <initsleeplock>
80100086:	a1 70 dc 10 80       	mov    0x8010dc70,%eax
8010008b:	89 58 50             	mov    %ebx,0x50(%eax)
8010008e:	89 1d 70 dc 10 80    	mov    %ebx,0x8010dc70
80100094:	81 c3 5c 02 00 00    	add    $0x25c,%ebx
8010009a:	83 c4 10             	add    $0x10,%esp
8010009d:	81 fb 1c dc 10 80    	cmp    $0x8010dc1c,%ebx
801000a3:	75 c1                	jne    80100066 <binit+0x32>
801000a5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801000a8:	c9                   	leave
801000a9:	c3                   	ret

801000aa <bread>:
801000aa:	55                   	push   %ebp
801000ab:	89 e5                	mov    %esp,%ebp
801000ad:	57                   	push   %edi
801000ae:	56                   	push   %esi
801000af:	53                   	push   %ebx
801000b0:	83 ec 18             	sub    $0x18,%esp
801000b3:	8b 75 08             	mov    0x8(%ebp),%esi
801000b6:	8b 7d 0c             	mov    0xc(%ebp),%edi
801000b9:	68 20 95 10 80       	push   $0x80109520
801000be:	e8 ab 3b 00 00       	call   80103c6e <acquire>
801000c3:	8b 1d 70 dc 10 80    	mov    0x8010dc70,%ebx
801000c9:	83 c4 10             	add    $0x10,%esp
801000cc:	81 fb 1c dc 10 80    	cmp    $0x8010dc1c,%ebx
801000d2:	75 26                	jne    801000fa <bread+0x50>
801000d4:	8b 1d 6c dc 10 80    	mov    0x8010dc6c,%ebx
801000da:	81 fb 1c dc 10 80    	cmp    $0x8010dc1c,%ebx
801000e0:	75 4e                	jne    80100130 <bread+0x86>
801000e2:	83 ec 0c             	sub    $0xc,%esp
801000e5:	68 2e 64 10 80       	push   $0x8010642e
801000ea:	e8 53 02 00 00       	call   80100342 <panic>
801000ef:	8b 5b 54             	mov    0x54(%ebx),%ebx
801000f2:	81 fb 1c dc 10 80    	cmp    $0x8010dc1c,%ebx
801000f8:	74 da                	je     801000d4 <bread+0x2a>
801000fa:	3b 73 04             	cmp    0x4(%ebx),%esi
801000fd:	75 f0                	jne    801000ef <bread+0x45>
801000ff:	3b 7b 08             	cmp    0x8(%ebx),%edi
80100102:	75 eb                	jne    801000ef <bread+0x45>
80100104:	83 43 4c 01          	addl   $0x1,0x4c(%ebx)
80100108:	83 ec 0c             	sub    $0xc,%esp
8010010b:	68 20 95 10 80       	push   $0x80109520
80100110:	e8 c0 3b 00 00       	call   80103cd5 <release>
80100115:	8d 43 0c             	lea    0xc(%ebx),%eax
80100118:	89 04 24             	mov    %eax,(%esp)
8010011b:	e8 31 39 00 00       	call   80103a51 <acquiresleep>
80100120:	83 c4 10             	add    $0x10,%esp
80100123:	eb 44                	jmp    80100169 <bread+0xbf>
80100125:	8b 5b 50             	mov    0x50(%ebx),%ebx
80100128:	81 fb 1c dc 10 80    	cmp    $0x8010dc1c,%ebx
8010012e:	74 b2                	je     801000e2 <bread+0x38>
80100130:	83 7b 4c 00          	cmpl   $0x0,0x4c(%ebx)
80100134:	75 ef                	jne    80100125 <bread+0x7b>
80100136:	f6 03 04             	testb  $0x4,(%ebx)
80100139:	75 ea                	jne    80100125 <bread+0x7b>
8010013b:	89 73 04             	mov    %esi,0x4(%ebx)
8010013e:	89 7b 08             	mov    %edi,0x8(%ebx)
80100141:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80100147:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
8010014e:	83 ec 0c             	sub    $0xc,%esp
80100151:	68 20 95 10 80       	push   $0x80109520
80100156:	e8 7a 3b 00 00       	call   80103cd5 <release>
8010015b:	8d 43 0c             	lea    0xc(%ebx),%eax
8010015e:	89 04 24             	mov    %eax,(%esp)
80100161:	e8 eb 38 00 00       	call   80103a51 <acquiresleep>
80100166:	83 c4 10             	add    $0x10,%esp
80100169:	f6 03 02             	testb  $0x2,(%ebx)
8010016c:	74 0a                	je     80100178 <bread+0xce>
8010016e:	89 d8                	mov    %ebx,%eax
80100170:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100173:	5b                   	pop    %ebx
80100174:	5e                   	pop    %esi
80100175:	5f                   	pop    %edi
80100176:	5d                   	pop    %ebp
80100177:	c3                   	ret
80100178:	83 ec 0c             	sub    $0xc,%esp
8010017b:	53                   	push   %ebx
8010017c:	e8 8c 1c 00 00       	call   80101e0d <iderw>
80100181:	83 c4 10             	add    $0x10,%esp
80100184:	eb e8                	jmp    8010016e <bread+0xc4>

80100186 <bwrite>:
80100186:	55                   	push   %ebp
80100187:	89 e5                	mov    %esp,%ebp
80100189:	53                   	push   %ebx
8010018a:	83 ec 10             	sub    $0x10,%esp
8010018d:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100190:	8d 43 0c             	lea    0xc(%ebx),%eax
80100193:	50                   	push   %eax
80100194:	e8 45 39 00 00       	call   80103ade <holdingsleep>
80100199:	83 c4 10             	add    $0x10,%esp
8010019c:	85 c0                	test   %eax,%eax
8010019e:	74 14                	je     801001b4 <bwrite+0x2e>
801001a0:	83 0b 04             	orl    $0x4,(%ebx)
801001a3:	83 ec 0c             	sub    $0xc,%esp
801001a6:	53                   	push   %ebx
801001a7:	e8 61 1c 00 00       	call   80101e0d <iderw>
801001ac:	83 c4 10             	add    $0x10,%esp
801001af:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801001b2:	c9                   	leave
801001b3:	c3                   	ret
801001b4:	83 ec 0c             	sub    $0xc,%esp
801001b7:	68 3f 64 10 80       	push   $0x8010643f
801001bc:	e8 81 01 00 00       	call   80100342 <panic>

801001c1 <brelse>:
801001c1:	55                   	push   %ebp
801001c2:	89 e5                	mov    %esp,%ebp
801001c4:	56                   	push   %esi
801001c5:	53                   	push   %ebx
801001c6:	8b 5d 08             	mov    0x8(%ebp),%ebx
801001c9:	8d 73 0c             	lea    0xc(%ebx),%esi
801001cc:	83 ec 0c             	sub    $0xc,%esp
801001cf:	56                   	push   %esi
801001d0:	e8 09 39 00 00       	call   80103ade <holdingsleep>
801001d5:	83 c4 10             	add    $0x10,%esp
801001d8:	85 c0                	test   %eax,%eax
801001da:	74 68                	je     80100244 <brelse+0x83>
801001dc:	83 ec 0c             	sub    $0xc,%esp
801001df:	56                   	push   %esi
801001e0:	e8 be 38 00 00       	call   80103aa3 <releasesleep>
801001e5:	c7 04 24 20 95 10 80 	movl   $0x80109520,(%esp)
801001ec:	e8 7d 3a 00 00       	call   80103c6e <acquire>
801001f1:	8b 43 4c             	mov    0x4c(%ebx),%eax
801001f4:	83 e8 01             	sub    $0x1,%eax
801001f7:	89 43 4c             	mov    %eax,0x4c(%ebx)
801001fa:	83 c4 10             	add    $0x10,%esp
801001fd:	85 c0                	test   %eax,%eax
801001ff:	75 2c                	jne    8010022d <brelse+0x6c>
80100201:	8b 53 54             	mov    0x54(%ebx),%edx
80100204:	8b 43 50             	mov    0x50(%ebx),%eax
80100207:	89 42 50             	mov    %eax,0x50(%edx)
8010020a:	8b 53 54             	mov    0x54(%ebx),%edx
8010020d:	89 50 54             	mov    %edx,0x54(%eax)
80100210:	a1 70 dc 10 80       	mov    0x8010dc70,%eax
80100215:	89 43 54             	mov    %eax,0x54(%ebx)
80100218:	c7 43 50 1c dc 10 80 	movl   $0x8010dc1c,0x50(%ebx)
8010021f:	a1 70 dc 10 80       	mov    0x8010dc70,%eax
80100224:	89 58 50             	mov    %ebx,0x50(%eax)
80100227:	89 1d 70 dc 10 80    	mov    %ebx,0x8010dc70
8010022d:	83 ec 0c             	sub    $0xc,%esp
80100230:	68 20 95 10 80       	push   $0x80109520
80100235:	e8 9b 3a 00 00       	call   80103cd5 <release>
8010023a:	83 c4 10             	add    $0x10,%esp
8010023d:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100240:	5b                   	pop    %ebx
80100241:	5e                   	pop    %esi
80100242:	5d                   	pop    %ebp
80100243:	c3                   	ret
80100244:	83 ec 0c             	sub    $0xc,%esp
80100247:	68 46 64 10 80       	push   $0x80106446
8010024c:	e8 f1 00 00 00       	call   80100342 <panic>

80100251 <consoleread>:
80100251:	55                   	push   %ebp
80100252:	89 e5                	mov    %esp,%ebp
80100254:	57                   	push   %edi
80100255:	56                   	push   %esi
80100256:	53                   	push   %ebx
80100257:	83 ec 28             	sub    $0x28,%esp
8010025a:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010025d:	8b 75 10             	mov    0x10(%ebp),%esi
80100260:	ff 75 08             	push   0x8(%ebp)
80100263:	e8 db 12 00 00       	call   80101543 <iunlock>
80100268:	89 75 e4             	mov    %esi,-0x1c(%ebp)
8010026b:	c7 04 24 20 df 10 80 	movl   $0x8010df20,(%esp)
80100272:	e8 f7 39 00 00       	call   80103c6e <acquire>
80100277:	83 c4 10             	add    $0x10,%esp
8010027a:	bb 80 de 10 80       	mov    $0x8010de80,%ebx
8010027f:	85 f6                	test   %esi,%esi
80100281:	7e 67                	jle    801002ea <consoleread+0x99>
80100283:	8b 83 80 00 00 00    	mov    0x80(%ebx),%eax
80100289:	3b 83 84 00 00 00    	cmp    0x84(%ebx),%eax
8010028f:	75 2e                	jne    801002bf <consoleread+0x6e>
80100291:	e8 a5 2f 00 00       	call   8010323b <myproc>
80100296:	83 78 24 00          	cmpl   $0x0,0x24(%eax)
8010029a:	75 70                	jne    8010030c <consoleread+0xbb>
8010029c:	83 ec 08             	sub    $0x8,%esp
8010029f:	68 20 df 10 80       	push   $0x8010df20
801002a4:	68 00 df 10 80       	push   $0x8010df00
801002a9:	e8 30 34 00 00       	call   801036de <sleep>
801002ae:	8b 83 80 00 00 00    	mov    0x80(%ebx),%eax
801002b4:	83 c4 10             	add    $0x10,%esp
801002b7:	3b 83 84 00 00 00    	cmp    0x84(%ebx),%eax
801002bd:	74 d2                	je     80100291 <consoleread+0x40>
801002bf:	8d 50 01             	lea    0x1(%eax),%edx
801002c2:	89 15 00 df 10 80    	mov    %edx,0x8010df00
801002c8:	89 c2                	mov    %eax,%edx
801002ca:	83 e2 7f             	and    $0x7f,%edx
801002cd:	0f b6 92 80 de 10 80 	movzbl -0x7fef2180(%edx),%edx
801002d4:	0f be ca             	movsbl %dl,%ecx
801002d7:	80 fa 04             	cmp    $0x4,%dl
801002da:	74 58                	je     80100334 <consoleread+0xe3>
801002dc:	83 c7 01             	add    $0x1,%edi
801002df:	88 57 ff             	mov    %dl,-0x1(%edi)
801002e2:	83 ee 01             	sub    $0x1,%esi
801002e5:	83 f9 0a             	cmp    $0xa,%ecx
801002e8:	75 95                	jne    8010027f <consoleread+0x2e>
801002ea:	83 ec 0c             	sub    $0xc,%esp
801002ed:	68 20 df 10 80       	push   $0x8010df20
801002f2:	e8 de 39 00 00       	call   80103cd5 <release>
801002f7:	83 c4 04             	add    $0x4,%esp
801002fa:	ff 75 08             	push   0x8(%ebp)
801002fd:	e8 7f 11 00 00       	call   80101481 <ilock>
80100302:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100305:	29 f0                	sub    %esi,%eax
80100307:	83 c4 10             	add    $0x10,%esp
8010030a:	eb 20                	jmp    8010032c <consoleread+0xdb>
8010030c:	83 ec 0c             	sub    $0xc,%esp
8010030f:	68 20 df 10 80       	push   $0x8010df20
80100314:	e8 bc 39 00 00       	call   80103cd5 <release>
80100319:	83 c4 04             	add    $0x4,%esp
8010031c:	ff 75 08             	push   0x8(%ebp)
8010031f:	e8 5d 11 00 00       	call   80101481 <ilock>
80100324:	83 c4 10             	add    $0x10,%esp
80100327:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010032c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010032f:	5b                   	pop    %ebx
80100330:	5e                   	pop    %esi
80100331:	5f                   	pop    %edi
80100332:	5d                   	pop    %ebp
80100333:	c3                   	ret
80100334:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80100337:	39 ce                	cmp    %ecx,%esi
80100339:	73 af                	jae    801002ea <consoleread+0x99>
8010033b:	a3 00 df 10 80       	mov    %eax,0x8010df00
80100340:	eb a8                	jmp    801002ea <consoleread+0x99>

80100342 <panic>:
80100342:	55                   	push   %ebp
80100343:	89 e5                	mov    %esp,%ebp
80100345:	56                   	push   %esi
80100346:	53                   	push   %ebx
80100347:	83 ec 30             	sub    $0x30,%esp
8010034a:	fa                   	cli
8010034b:	c7 05 54 df 10 80 00 	movl   $0x0,0x8010df54
80100352:	00 00 00 
80100355:	e8 5d 20 00 00       	call   801023b7 <lapicid>
8010035a:	83 ec 08             	sub    $0x8,%esp
8010035d:	50                   	push   %eax
8010035e:	68 4d 64 10 80       	push   $0x8010644d
80100363:	e8 a1 02 00 00       	call   80100609 <cprintf>
80100368:	83 c4 04             	add    $0x4,%esp
8010036b:	ff 75 08             	push   0x8(%ebp)
8010036e:	e8 96 02 00 00       	call   80100609 <cprintf>
80100373:	c7 04 24 f9 68 10 80 	movl   $0x801068f9,(%esp)
8010037a:	e8 8a 02 00 00       	call   80100609 <cprintf>
8010037f:	83 c4 08             	add    $0x8,%esp
80100382:	8d 5d d0             	lea    -0x30(%ebp),%ebx
80100385:	53                   	push   %ebx
80100386:	8d 45 08             	lea    0x8(%ebp),%eax
80100389:	50                   	push   %eax
8010038a:	e8 b4 37 00 00       	call   80103b43 <getcallerpcs>
8010038f:	8d 75 f8             	lea    -0x8(%ebp),%esi
80100392:	83 c4 10             	add    $0x10,%esp
80100395:	83 ec 08             	sub    $0x8,%esp
80100398:	ff 33                	push   (%ebx)
8010039a:	68 61 64 10 80       	push   $0x80106461
8010039f:	e8 65 02 00 00       	call   80100609 <cprintf>
801003a4:	83 c3 04             	add    $0x4,%ebx
801003a7:	83 c4 10             	add    $0x10,%esp
801003aa:	39 f3                	cmp    %esi,%ebx
801003ac:	75 e7                	jne    80100395 <panic+0x53>
801003ae:	c7 05 58 df 10 80 01 	movl   $0x1,0x8010df58
801003b5:	00 00 00 
801003b8:	eb fe                	jmp    801003b8 <panic+0x76>

801003ba <consputc>:
801003ba:	83 3d 58 df 10 80 00 	cmpl   $0x0,0x8010df58
801003c1:	74 03                	je     801003c6 <consputc+0xc>
801003c3:	fa                   	cli
801003c4:	eb fe                	jmp    801003c4 <consputc+0xa>
801003c6:	55                   	push   %ebp
801003c7:	89 e5                	mov    %esp,%ebp
801003c9:	57                   	push   %edi
801003ca:	56                   	push   %esi
801003cb:	53                   	push   %ebx
801003cc:	83 ec 0c             	sub    $0xc,%esp
801003cf:	89 c3                	mov    %eax,%ebx
801003d1:	3d 00 01 00 00       	cmp    $0x100,%eax
801003d6:	0f 84 ae 00 00 00    	je     8010048a <consputc+0xd0>
801003dc:	83 ec 0c             	sub    $0xc,%esp
801003df:	50                   	push   %eax
801003e0:	e8 9c 4c 00 00       	call   80105081 <uartputc>
801003e5:	83 c4 10             	add    $0x10,%esp
801003e8:	bf d4 03 00 00       	mov    $0x3d4,%edi
801003ed:	b8 0e 00 00 00       	mov    $0xe,%eax
801003f2:	89 fa                	mov    %edi,%edx
801003f4:	ee                   	out    %al,(%dx)
801003f5:	be d5 03 00 00       	mov    $0x3d5,%esi
801003fa:	89 f2                	mov    %esi,%edx
801003fc:	ec                   	in     (%dx),%al
801003fd:	0f b6 c8             	movzbl %al,%ecx
80100400:	c1 e1 08             	shl    $0x8,%ecx
80100403:	b8 0f 00 00 00       	mov    $0xf,%eax
80100408:	89 fa                	mov    %edi,%edx
8010040a:	ee                   	out    %al,(%dx)
8010040b:	89 f2                	mov    %esi,%edx
8010040d:	ec                   	in     (%dx),%al
8010040e:	0f b6 c0             	movzbl %al,%eax
80100411:	09 c8                	or     %ecx,%eax
80100413:	83 fb 0a             	cmp    $0xa,%ebx
80100416:	0f 84 98 00 00 00    	je     801004b4 <consputc+0xfa>
8010041c:	81 fb 00 01 00 00    	cmp    $0x100,%ebx
80100422:	0f 84 a4 00 00 00    	je     801004cc <consputc+0x112>
80100428:	8d 70 01             	lea    0x1(%eax),%esi
8010042b:	0f b6 db             	movzbl %bl,%ebx
8010042e:	80 cf 07             	or     $0x7,%bh
80100431:	66 89 9c 00 00 80 0b 	mov    %bx,-0x7ff48000(%eax,%eax,1)
80100438:	80 
80100439:	81 fe d0 07 00 00    	cmp    $0x7d0,%esi
8010043f:	0f 87 99 00 00 00    	ja     801004de <consputc+0x124>
80100445:	81 fe 7f 07 00 00    	cmp    $0x77f,%esi
8010044b:	0f 8f 9a 00 00 00    	jg     801004eb <consputc+0x131>
80100451:	bb d4 03 00 00       	mov    $0x3d4,%ebx
80100456:	b8 0e 00 00 00       	mov    $0xe,%eax
8010045b:	89 da                	mov    %ebx,%edx
8010045d:	ee                   	out    %al,(%dx)
8010045e:	89 f0                	mov    %esi,%eax
80100460:	c1 f8 08             	sar    $0x8,%eax
80100463:	b9 d5 03 00 00       	mov    $0x3d5,%ecx
80100468:	89 ca                	mov    %ecx,%edx
8010046a:	ee                   	out    %al,(%dx)
8010046b:	b8 0f 00 00 00       	mov    $0xf,%eax
80100470:	89 da                	mov    %ebx,%edx
80100472:	ee                   	out    %al,(%dx)
80100473:	89 f0                	mov    %esi,%eax
80100475:	89 ca                	mov    %ecx,%edx
80100477:	ee                   	out    %al,(%dx)
80100478:	66 c7 84 36 00 80 0b 	movw   $0x720,-0x7ff48000(%esi,%esi,1)
8010047f:	80 20 07 
80100482:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100485:	5b                   	pop    %ebx
80100486:	5e                   	pop    %esi
80100487:	5f                   	pop    %edi
80100488:	5d                   	pop    %ebp
80100489:	c3                   	ret
8010048a:	83 ec 0c             	sub    $0xc,%esp
8010048d:	6a 08                	push   $0x8
8010048f:	e8 ed 4b 00 00       	call   80105081 <uartputc>
80100494:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
8010049b:	e8 e1 4b 00 00       	call   80105081 <uartputc>
801004a0:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
801004a7:	e8 d5 4b 00 00       	call   80105081 <uartputc>
801004ac:	83 c4 10             	add    $0x10,%esp
801004af:	e9 34 ff ff ff       	jmp    801003e8 <consputc+0x2e>
801004b4:	ba 67 66 66 66       	mov    $0x66666667,%edx
801004b9:	f7 ea                	imul   %edx
801004bb:	c1 fa 05             	sar    $0x5,%edx
801004be:	8d 04 92             	lea    (%edx,%edx,4),%eax
801004c1:	c1 e0 04             	shl    $0x4,%eax
801004c4:	8d 70 50             	lea    0x50(%eax),%esi
801004c7:	e9 6d ff ff ff       	jmp    80100439 <consputc+0x7f>
801004cc:	8d 70 ff             	lea    -0x1(%eax),%esi
801004cf:	85 c0                	test   %eax,%eax
801004d1:	0f 8f 62 ff ff ff    	jg     80100439 <consputc+0x7f>
801004d7:	89 c6                	mov    %eax,%esi
801004d9:	e9 73 ff ff ff       	jmp    80100451 <consputc+0x97>
801004de:	83 ec 0c             	sub    $0xc,%esp
801004e1:	68 65 64 10 80       	push   $0x80106465
801004e6:	e8 57 fe ff ff       	call   80100342 <panic>
801004eb:	83 ec 04             	sub    $0x4,%esp
801004ee:	68 60 0e 00 00       	push   $0xe60
801004f3:	68 a0 80 0b 80       	push   $0x800b80a0
801004f8:	68 00 80 0b 80       	push   $0x800b8000
801004fd:	e8 91 38 00 00       	call   80103d93 <memmove>
80100502:	83 ee 50             	sub    $0x50,%esi
80100505:	83 c4 0c             	add    $0xc,%esp
80100508:	b8 80 07 00 00       	mov    $0x780,%eax
8010050d:	29 f0                	sub    %esi,%eax
8010050f:	01 c0                	add    %eax,%eax
80100511:	50                   	push   %eax
80100512:	6a 00                	push   $0x0
80100514:	8d 84 36 00 80 0b 80 	lea    -0x7ff48000(%esi,%esi,1),%eax
8010051b:	50                   	push   %eax
8010051c:	e8 fb 37 00 00       	call   80103d1c <memset>
80100521:	83 c4 10             	add    $0x10,%esp
80100524:	e9 28 ff ff ff       	jmp    80100451 <consputc+0x97>

80100529 <printint>:
80100529:	55                   	push   %ebp
8010052a:	89 e5                	mov    %esp,%ebp
8010052c:	57                   	push   %edi
8010052d:	56                   	push   %esi
8010052e:	53                   	push   %ebx
8010052f:	83 ec 2c             	sub    $0x2c,%esp
80100532:	89 d3                	mov    %edx,%ebx
80100534:	85 c9                	test   %ecx,%ecx
80100536:	74 04                	je     8010053c <printint+0x13>
80100538:	85 c0                	test   %eax,%eax
8010053a:	78 61                	js     8010059d <printint+0x74>
8010053c:	89 c1                	mov    %eax,%ecx
8010053e:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
80100545:	bf 00 00 00 00       	mov    $0x0,%edi
8010054a:	89 fe                	mov    %edi,%esi
8010054c:	83 c7 01             	add    $0x1,%edi
8010054f:	89 c8                	mov    %ecx,%eax
80100551:	ba 00 00 00 00       	mov    $0x0,%edx
80100556:	f7 f3                	div    %ebx
80100558:	0f b6 92 4c 69 10 80 	movzbl -0x7fef96b4(%edx),%edx
8010055f:	88 54 3d d7          	mov    %dl,-0x29(%ebp,%edi,1)
80100563:	89 ca                	mov    %ecx,%edx
80100565:	89 c1                	mov    %eax,%ecx
80100567:	39 da                	cmp    %ebx,%edx
80100569:	73 df                	jae    8010054a <printint+0x21>
8010056b:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
8010056f:	74 08                	je     80100579 <printint+0x50>
80100571:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
80100576:	8d 7e 02             	lea    0x2(%esi),%edi
80100579:	85 ff                	test   %edi,%edi
8010057b:	7e 18                	jle    80100595 <printint+0x6c>
8010057d:	8d 75 d8             	lea    -0x28(%ebp),%esi
80100580:	8d 5c 3d d7          	lea    -0x29(%ebp,%edi,1),%ebx
80100584:	0f be 03             	movsbl (%ebx),%eax
80100587:	e8 2e fe ff ff       	call   801003ba <consputc>
8010058c:	89 d8                	mov    %ebx,%eax
8010058e:	83 eb 01             	sub    $0x1,%ebx
80100591:	39 f0                	cmp    %esi,%eax
80100593:	75 ef                	jne    80100584 <printint+0x5b>
80100595:	83 c4 2c             	add    $0x2c,%esp
80100598:	5b                   	pop    %ebx
80100599:	5e                   	pop    %esi
8010059a:	5f                   	pop    %edi
8010059b:	5d                   	pop    %ebp
8010059c:	c3                   	ret
8010059d:	f7 d8                	neg    %eax
8010059f:	89 c1                	mov    %eax,%ecx
801005a1:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
801005a8:	eb 9b                	jmp    80100545 <printint+0x1c>

801005aa <consolewrite>:
801005aa:	55                   	push   %ebp
801005ab:	89 e5                	mov    %esp,%ebp
801005ad:	57                   	push   %edi
801005ae:	56                   	push   %esi
801005af:	53                   	push   %ebx
801005b0:	83 ec 18             	sub    $0x18,%esp
801005b3:	8b 75 0c             	mov    0xc(%ebp),%esi
801005b6:	8b 7d 10             	mov    0x10(%ebp),%edi
801005b9:	ff 75 08             	push   0x8(%ebp)
801005bc:	e8 82 0f 00 00       	call   80101543 <iunlock>
801005c1:	c7 04 24 20 df 10 80 	movl   $0x8010df20,(%esp)
801005c8:	e8 a1 36 00 00       	call   80103c6e <acquire>
801005cd:	83 c4 10             	add    $0x10,%esp
801005d0:	85 ff                	test   %edi,%edi
801005d2:	7e 13                	jle    801005e7 <consolewrite+0x3d>
801005d4:	89 f3                	mov    %esi,%ebx
801005d6:	01 fe                	add    %edi,%esi
801005d8:	0f b6 03             	movzbl (%ebx),%eax
801005db:	e8 da fd ff ff       	call   801003ba <consputc>
801005e0:	83 c3 01             	add    $0x1,%ebx
801005e3:	39 f3                	cmp    %esi,%ebx
801005e5:	75 f1                	jne    801005d8 <consolewrite+0x2e>
801005e7:	83 ec 0c             	sub    $0xc,%esp
801005ea:	68 20 df 10 80       	push   $0x8010df20
801005ef:	e8 e1 36 00 00       	call   80103cd5 <release>
801005f4:	83 c4 04             	add    $0x4,%esp
801005f7:	ff 75 08             	push   0x8(%ebp)
801005fa:	e8 82 0e 00 00       	call   80101481 <ilock>
801005ff:	89 f8                	mov    %edi,%eax
80100601:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100604:	5b                   	pop    %ebx
80100605:	5e                   	pop    %esi
80100606:	5f                   	pop    %edi
80100607:	5d                   	pop    %ebp
80100608:	c3                   	ret

80100609 <cprintf>:
80100609:	55                   	push   %ebp
8010060a:	89 e5                	mov    %esp,%ebp
8010060c:	57                   	push   %edi
8010060d:	56                   	push   %esi
8010060e:	53                   	push   %ebx
8010060f:	83 ec 1c             	sub    $0x1c,%esp
80100612:	8b 35 54 df 10 80    	mov    0x8010df54,%esi
80100618:	85 f6                	test   %esi,%esi
8010061a:	75 22                	jne    8010063e <cprintf+0x35>
8010061c:	8b 7d 08             	mov    0x8(%ebp),%edi
8010061f:	85 ff                	test   %edi,%edi
80100621:	74 2d                	je     80100650 <cprintf+0x47>
80100623:	0f b6 07             	movzbl (%edi),%eax
80100626:	8d 4d 0c             	lea    0xc(%ebp),%ecx
80100629:	bb 00 00 00 00       	mov    $0x0,%ebx
8010062e:	85 c0                	test   %eax,%eax
80100630:	0f 84 13 01 00 00    	je     80100749 <cprintf+0x140>
80100636:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80100639:	89 75 e0             	mov    %esi,-0x20(%ebp)
8010063c:	eb 33                	jmp    80100671 <cprintf+0x68>
8010063e:	83 ec 0c             	sub    $0xc,%esp
80100641:	68 20 df 10 80       	push   $0x8010df20
80100646:	e8 23 36 00 00       	call   80103c6e <acquire>
8010064b:	83 c4 10             	add    $0x10,%esp
8010064e:	eb cc                	jmp    8010061c <cprintf+0x13>
80100650:	83 ec 0c             	sub    $0xc,%esp
80100653:	68 7f 64 10 80       	push   $0x8010647f
80100658:	e8 e5 fc ff ff       	call   80100342 <panic>
8010065d:	e8 58 fd ff ff       	call   801003ba <consputc>
80100662:	83 c3 01             	add    $0x1,%ebx
80100665:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
80100669:	85 c0                	test   %eax,%eax
8010066b:	0f 84 d5 00 00 00    	je     80100746 <cprintf+0x13d>
80100671:	83 f8 25             	cmp    $0x25,%eax
80100674:	75 e7                	jne    8010065d <cprintf+0x54>
80100676:	83 c3 01             	add    $0x1,%ebx
80100679:	0f b6 34 1f          	movzbl (%edi,%ebx,1),%esi
8010067d:	85 f6                	test   %esi,%esi
8010067f:	0f 84 d0 00 00 00    	je     80100755 <cprintf+0x14c>
80100685:	83 fe 70             	cmp    $0x70,%esi
80100688:	74 49                	je     801006d3 <cprintf+0xca>
8010068a:	7f 2a                	jg     801006b6 <cprintf+0xad>
8010068c:	83 fe 25             	cmp    $0x25,%esi
8010068f:	0f 84 a2 00 00 00    	je     80100737 <cprintf+0x12e>
80100695:	83 fe 64             	cmp    $0x64,%esi
80100698:	75 26                	jne    801006c0 <cprintf+0xb7>
8010069a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010069d:	8d 70 04             	lea    0x4(%eax),%esi
801006a0:	8b 00                	mov    (%eax),%eax
801006a2:	b9 01 00 00 00       	mov    $0x1,%ecx
801006a7:	ba 0a 00 00 00       	mov    $0xa,%edx
801006ac:	e8 78 fe ff ff       	call   80100529 <printint>
801006b1:	89 75 e4             	mov    %esi,-0x1c(%ebp)
801006b4:	eb ac                	jmp    80100662 <cprintf+0x59>
801006b6:	83 fe 73             	cmp    $0x73,%esi
801006b9:	74 37                	je     801006f2 <cprintf+0xe9>
801006bb:	83 fe 78             	cmp    $0x78,%esi
801006be:	74 13                	je     801006d3 <cprintf+0xca>
801006c0:	b8 25 00 00 00       	mov    $0x25,%eax
801006c5:	e8 f0 fc ff ff       	call   801003ba <consputc>
801006ca:	89 f0                	mov    %esi,%eax
801006cc:	e8 e9 fc ff ff       	call   801003ba <consputc>
801006d1:	eb 8f                	jmp    80100662 <cprintf+0x59>
801006d3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801006d6:	8d 70 04             	lea    0x4(%eax),%esi
801006d9:	8b 00                	mov    (%eax),%eax
801006db:	b9 00 00 00 00       	mov    $0x0,%ecx
801006e0:	ba 10 00 00 00       	mov    $0x10,%edx
801006e5:	e8 3f fe ff ff       	call   80100529 <printint>
801006ea:	89 75 e4             	mov    %esi,-0x1c(%ebp)
801006ed:	e9 70 ff ff ff       	jmp    80100662 <cprintf+0x59>
801006f2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801006f5:	8d 50 04             	lea    0x4(%eax),%edx
801006f8:	8b 00                	mov    (%eax),%eax
801006fa:	85 c0                	test   %eax,%eax
801006fc:	74 15                	je     80100713 <cprintf+0x10a>
801006fe:	89 c6                	mov    %eax,%esi
80100700:	0f b6 00             	movzbl (%eax),%eax
80100703:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80100706:	84 c0                	test   %al,%al
80100708:	0f 84 54 ff ff ff    	je     80100662 <cprintf+0x59>
8010070e:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80100711:	eb 0d                	jmp    80100720 <cprintf+0x117>
80100713:	be 78 64 10 80       	mov    $0x80106478,%esi
80100718:	b8 28 00 00 00       	mov    $0x28,%eax
8010071d:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80100720:	0f be c0             	movsbl %al,%eax
80100723:	e8 92 fc ff ff       	call   801003ba <consputc>
80100728:	83 c6 01             	add    $0x1,%esi
8010072b:	0f b6 06             	movzbl (%esi),%eax
8010072e:	84 c0                	test   %al,%al
80100730:	75 ee                	jne    80100720 <cprintf+0x117>
80100732:	e9 2b ff ff ff       	jmp    80100662 <cprintf+0x59>
80100737:	b8 25 00 00 00       	mov    $0x25,%eax
8010073c:	e8 79 fc ff ff       	call   801003ba <consputc>
80100741:	e9 1c ff ff ff       	jmp    80100662 <cprintf+0x59>
80100746:	8b 75 e0             	mov    -0x20(%ebp),%esi
80100749:	85 f6                	test   %esi,%esi
8010074b:	75 0d                	jne    8010075a <cprintf+0x151>
8010074d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100750:	5b                   	pop    %ebx
80100751:	5e                   	pop    %esi
80100752:	5f                   	pop    %edi
80100753:	5d                   	pop    %ebp
80100754:	c3                   	ret
80100755:	8b 75 e0             	mov    -0x20(%ebp),%esi
80100758:	eb ef                	jmp    80100749 <cprintf+0x140>
8010075a:	83 ec 0c             	sub    $0xc,%esp
8010075d:	68 20 df 10 80       	push   $0x8010df20
80100762:	e8 6e 35 00 00       	call   80103cd5 <release>
80100767:	83 c4 10             	add    $0x10,%esp
8010076a:	eb e1                	jmp    8010074d <cprintf+0x144>

8010076c <consoleintr>:
8010076c:	55                   	push   %ebp
8010076d:	89 e5                	mov    %esp,%ebp
8010076f:	57                   	push   %edi
80100770:	56                   	push   %esi
80100771:	53                   	push   %ebx
80100772:	83 ec 28             	sub    $0x28,%esp
80100775:	8b 7d 08             	mov    0x8(%ebp),%edi
80100778:	68 20 df 10 80       	push   $0x8010df20
8010077d:	e8 ec 34 00 00       	call   80103c6e <acquire>
80100782:	83 c4 10             	add    $0x10,%esp
80100785:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
8010078c:	bb 80 de 10 80       	mov    $0x8010de80,%ebx
80100791:	e9 b5 00 00 00       	jmp    8010084b <consoleintr+0xdf>
80100796:	83 fe 7f             	cmp    $0x7f,%esi
80100799:	0f 84 9e 00 00 00    	je     8010083d <consoleintr+0xd1>
8010079f:	8b 83 88 00 00 00    	mov    0x88(%ebx),%eax
801007a5:	89 c2                	mov    %eax,%edx
801007a7:	2b 93 80 00 00 00    	sub    0x80(%ebx),%edx
801007ad:	83 fa 7f             	cmp    $0x7f,%edx
801007b0:	0f 87 95 00 00 00    	ja     8010084b <consoleintr+0xdf>
801007b6:	83 fe 0d             	cmp    $0xd,%esi
801007b9:	0f 84 f4 00 00 00    	je     801008b3 <consoleintr+0x147>
801007bf:	8d 50 01             	lea    0x1(%eax),%edx
801007c2:	89 15 08 df 10 80    	mov    %edx,0x8010df08
801007c8:	83 e0 7f             	and    $0x7f,%eax
801007cb:	89 f1                	mov    %esi,%ecx
801007cd:	88 88 80 de 10 80    	mov    %cl,-0x7fef2180(%eax)
801007d3:	89 f0                	mov    %esi,%eax
801007d5:	e8 e0 fb ff ff       	call   801003ba <consputc>
801007da:	83 fe 0a             	cmp    $0xa,%esi
801007dd:	0f 84 ed 00 00 00    	je     801008d0 <consoleintr+0x164>
801007e3:	83 fe 04             	cmp    $0x4,%esi
801007e6:	0f 84 e4 00 00 00    	je     801008d0 <consoleintr+0x164>
801007ec:	a1 00 df 10 80       	mov    0x8010df00,%eax
801007f1:	83 e8 80             	sub    $0xffffff80,%eax
801007f4:	39 05 08 df 10 80    	cmp    %eax,0x8010df08
801007fa:	75 4f                	jne    8010084b <consoleintr+0xdf>
801007fc:	e9 cf 00 00 00       	jmp    801008d0 <consoleintr+0x164>
80100801:	8b 83 88 00 00 00    	mov    0x88(%ebx),%eax
80100807:	3b 83 84 00 00 00    	cmp    0x84(%ebx),%eax
8010080d:	74 3c                	je     8010084b <consoleintr+0xdf>
8010080f:	83 e8 01             	sub    $0x1,%eax
80100812:	89 c2                	mov    %eax,%edx
80100814:	83 e2 7f             	and    $0x7f,%edx
80100817:	80 3c 13 0a          	cmpb   $0xa,(%ebx,%edx,1)
8010081b:	74 2e                	je     8010084b <consoleintr+0xdf>
8010081d:	89 83 88 00 00 00    	mov    %eax,0x88(%ebx)
80100823:	b8 00 01 00 00       	mov    $0x100,%eax
80100828:	e8 8d fb ff ff       	call   801003ba <consputc>
8010082d:	8b 83 88 00 00 00    	mov    0x88(%ebx),%eax
80100833:	3b 83 84 00 00 00    	cmp    0x84(%ebx),%eax
80100839:	75 d4                	jne    8010080f <consoleintr+0xa3>
8010083b:	eb 0e                	jmp    8010084b <consoleintr+0xdf>
8010083d:	8b 83 88 00 00 00    	mov    0x88(%ebx),%eax
80100843:	3b 83 84 00 00 00    	cmp    0x84(%ebx),%eax
80100849:	75 26                	jne    80100871 <consoleintr+0x105>
8010084b:	ff d7                	call   *%edi
8010084d:	89 c6                	mov    %eax,%esi
8010084f:	85 c0                	test   %eax,%eax
80100851:	78 3b                	js     8010088e <consoleintr+0x122>
80100853:	83 fe 15             	cmp    $0x15,%esi
80100856:	74 a9                	je     80100801 <consoleintr+0x95>
80100858:	0f 8f 38 ff ff ff    	jg     80100796 <consoleintr+0x2a>
8010085e:	83 fe 08             	cmp    $0x8,%esi
80100861:	74 da                	je     8010083d <consoleintr+0xd1>
80100863:	83 fe 10             	cmp    $0x10,%esi
80100866:	75 1d                	jne    80100885 <consoleintr+0x119>
80100868:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
8010086f:	eb da                	jmp    8010084b <consoleintr+0xdf>
80100871:	83 e8 01             	sub    $0x1,%eax
80100874:	a3 08 df 10 80       	mov    %eax,0x8010df08
80100879:	b8 00 01 00 00       	mov    $0x100,%eax
8010087e:	e8 37 fb ff ff       	call   801003ba <consputc>
80100883:	eb c6                	jmp    8010084b <consoleintr+0xdf>
80100885:	85 f6                	test   %esi,%esi
80100887:	74 c2                	je     8010084b <consoleintr+0xdf>
80100889:	e9 11 ff ff ff       	jmp    8010079f <consoleintr+0x33>
8010088e:	83 ec 0c             	sub    $0xc,%esp
80100891:	68 20 df 10 80       	push   $0x8010df20
80100896:	e8 3a 34 00 00       	call   80103cd5 <release>
8010089b:	83 c4 10             	add    $0x10,%esp
8010089e:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
801008a2:	75 08                	jne    801008ac <consoleintr+0x140>
801008a4:	8d 65 f4             	lea    -0xc(%ebp),%esp
801008a7:	5b                   	pop    %ebx
801008a8:	5e                   	pop    %esi
801008a9:	5f                   	pop    %edi
801008aa:	5d                   	pop    %ebp
801008ab:	c3                   	ret
801008ac:	e8 43 30 00 00       	call   801038f4 <procdump>
801008b1:	eb f1                	jmp    801008a4 <consoleintr+0x138>
801008b3:	8d 50 01             	lea    0x1(%eax),%edx
801008b6:	89 15 08 df 10 80    	mov    %edx,0x8010df08
801008bc:	83 e0 7f             	and    $0x7f,%eax
801008bf:	c6 80 80 de 10 80 0a 	movb   $0xa,-0x7fef2180(%eax)
801008c6:	b8 0a 00 00 00       	mov    $0xa,%eax
801008cb:	e8 ea fa ff ff       	call   801003ba <consputc>
801008d0:	a1 08 df 10 80       	mov    0x8010df08,%eax
801008d5:	a3 04 df 10 80       	mov    %eax,0x8010df04
801008da:	83 ec 0c             	sub    $0xc,%esp
801008dd:	68 00 df 10 80       	push   $0x8010df00
801008e2:	e8 72 2f 00 00       	call   80103859 <wakeup>
801008e7:	83 c4 10             	add    $0x10,%esp
801008ea:	e9 5c ff ff ff       	jmp    8010084b <consoleintr+0xdf>

801008ef <consoleinit>:
801008ef:	55                   	push   %ebp
801008f0:	89 e5                	mov    %esp,%ebp
801008f2:	83 ec 10             	sub    $0x10,%esp
801008f5:	68 88 64 10 80       	push   $0x80106488
801008fa:	68 20 df 10 80       	push   $0x8010df20
801008ff:	e8 24 32 00 00       	call   80103b28 <initlock>
80100904:	c7 05 0c e9 10 80 aa 	movl   $0x801005aa,0x8010e90c
8010090b:	05 10 80 
8010090e:	c7 05 08 e9 10 80 51 	movl   $0x80100251,0x8010e908
80100915:	02 10 80 
80100918:	c7 05 54 df 10 80 01 	movl   $0x1,0x8010df54
8010091f:	00 00 00 
80100922:	83 c4 08             	add    $0x8,%esp
80100925:	6a 00                	push   $0x0
80100927:	6a 01                	push   $0x1
80100929:	e8 61 16 00 00       	call   80101f8f <ioapicenable>
8010092e:	83 c4 10             	add    $0x10,%esp
80100931:	c9                   	leave
80100932:	c3                   	ret

80100933 <exec>:
80100933:	55                   	push   %ebp
80100934:	89 e5                	mov    %esp,%ebp
80100936:	57                   	push   %edi
80100937:	56                   	push   %esi
80100938:	53                   	push   %ebx
80100939:	81 ec 0c 01 00 00    	sub    $0x10c,%esp
8010093f:	e8 f7 28 00 00       	call   8010323b <myproc>
80100944:	89 85 ec fe ff ff    	mov    %eax,-0x114(%ebp)
8010094a:	e8 cc 1d 00 00       	call   8010271b <begin_op>
8010094f:	83 ec 0c             	sub    $0xc,%esp
80100952:	ff 75 08             	push   0x8(%ebp)
80100955:	e8 b2 12 00 00       	call   80101c0c <namei>
8010095a:	83 c4 10             	add    $0x10,%esp
8010095d:	85 c0                	test   %eax,%eax
8010095f:	74 4e                	je     801009af <exec+0x7c>
80100961:	89 c3                	mov    %eax,%ebx
80100963:	83 ec 0c             	sub    $0xc,%esp
80100966:	50                   	push   %eax
80100967:	e8 15 0b 00 00       	call   80101481 <ilock>
8010096c:	6a 34                	push   $0x34
8010096e:	6a 00                	push   $0x0
80100970:	8d 85 24 ff ff ff    	lea    -0xdc(%ebp),%eax
80100976:	50                   	push   %eax
80100977:	53                   	push   %ebx
80100978:	e8 9a 0d 00 00       	call   80101717 <readi>
8010097d:	83 c4 20             	add    $0x20,%esp
80100980:	83 f8 34             	cmp    $0x34,%eax
80100983:	75 0c                	jne    80100991 <exec+0x5e>
80100985:	81 bd 24 ff ff ff 7f 	cmpl   $0x464c457f,-0xdc(%ebp)
8010098c:	45 4c 46 
8010098f:	74 3a                	je     801009cb <exec+0x98>
80100991:	83 ec 0c             	sub    $0xc,%esp
80100994:	53                   	push   %ebx
80100995:	e8 32 0d 00 00       	call   801016cc <iunlockput>
8010099a:	e8 f7 1d 00 00       	call   80102796 <end_op>
8010099f:	83 c4 10             	add    $0x10,%esp
801009a2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801009a7:	8d 65 f4             	lea    -0xc(%ebp),%esp
801009aa:	5b                   	pop    %ebx
801009ab:	5e                   	pop    %esi
801009ac:	5f                   	pop    %edi
801009ad:	5d                   	pop    %ebp
801009ae:	c3                   	ret
801009af:	e8 e2 1d 00 00       	call   80102796 <end_op>
801009b4:	83 ec 0c             	sub    $0xc,%esp
801009b7:	68 90 64 10 80       	push   $0x80106490
801009bc:	e8 48 fc ff ff       	call   80100609 <cprintf>
801009c1:	83 c4 10             	add    $0x10,%esp
801009c4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801009c9:	eb dc                	jmp    801009a7 <exec+0x74>
801009cb:	e8 ec 57 00 00       	call   801061bc <setupkvm>
801009d0:	89 c7                	mov    %eax,%edi
801009d2:	85 c0                	test   %eax,%eax
801009d4:	74 bb                	je     80100991 <exec+0x5e>
801009d6:	8b 85 40 ff ff ff    	mov    -0xc0(%ebp),%eax
801009dc:	66 83 bd 50 ff ff ff 	cmpw   $0x0,-0xb0(%ebp)
801009e3:	00 
801009e4:	0f 84 c6 00 00 00    	je     80100ab0 <exec+0x17d>
801009ea:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
801009f1:	00 00 00 
801009f4:	be 00 00 00 00       	mov    $0x0,%esi
801009f9:	eb 1b                	jmp    80100a16 <exec+0xe3>
801009fb:	83 c6 01             	add    $0x1,%esi
801009fe:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
80100a04:	83 c0 20             	add    $0x20,%eax
80100a07:	0f b7 95 50 ff ff ff 	movzwl -0xb0(%ebp),%edx
80100a0e:	39 f2                	cmp    %esi,%edx
80100a10:	0f 8e a4 00 00 00    	jle    80100aba <exec+0x187>
80100a16:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)
80100a1c:	6a 20                	push   $0x20
80100a1e:	50                   	push   %eax
80100a1f:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
80100a25:	50                   	push   %eax
80100a26:	53                   	push   %ebx
80100a27:	e8 eb 0c 00 00       	call   80101717 <readi>
80100a2c:	83 c4 10             	add    $0x10,%esp
80100a2f:	83 f8 20             	cmp    $0x20,%eax
80100a32:	75 6b                	jne    80100a9f <exec+0x16c>
80100a34:	83 bd 04 ff ff ff 01 	cmpl   $0x1,-0xfc(%ebp)
80100a3b:	75 be                	jne    801009fb <exec+0xc8>
80100a3d:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
80100a43:	3b 85 14 ff ff ff    	cmp    -0xec(%ebp),%eax
80100a49:	72 54                	jb     80100a9f <exec+0x16c>
80100a4b:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
80100a51:	72 4c                	jb     80100a9f <exec+0x16c>
80100a53:	83 ec 04             	sub    $0x4,%esp
80100a56:	50                   	push   %eax
80100a57:	ff b5 f0 fe ff ff    	push   -0x110(%ebp)
80100a5d:	57                   	push   %edi
80100a5e:	e8 07 56 00 00       	call   8010606a <allocuvm>
80100a63:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100a69:	83 c4 10             	add    $0x10,%esp
80100a6c:	85 c0                	test   %eax,%eax
80100a6e:	74 2f                	je     80100a9f <exec+0x16c>
80100a70:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100a76:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100a7b:	75 22                	jne    80100a9f <exec+0x16c>
80100a7d:	83 ec 0c             	sub    $0xc,%esp
80100a80:	ff b5 14 ff ff ff    	push   -0xec(%ebp)
80100a86:	ff b5 08 ff ff ff    	push   -0xf8(%ebp)
80100a8c:	53                   	push   %ebx
80100a8d:	50                   	push   %eax
80100a8e:	57                   	push   %edi
80100a8f:	e8 a8 54 00 00       	call   80105f3c <loaduvm>
80100a94:	83 c4 20             	add    $0x20,%esp
80100a97:	85 c0                	test   %eax,%eax
80100a99:	0f 89 5c ff ff ff    	jns    801009fb <exec+0xc8>
80100a9f:	83 ec 0c             	sub    $0xc,%esp
80100aa2:	57                   	push   %edi
80100aa3:	e8 a1 56 00 00       	call   80106149 <freevm>
80100aa8:	83 c4 10             	add    $0x10,%esp
80100aab:	e9 e1 fe ff ff       	jmp    80100991 <exec+0x5e>
80100ab0:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
80100ab7:	00 00 00 
80100aba:	83 ec 0c             	sub    $0xc,%esp
80100abd:	53                   	push   %ebx
80100abe:	e8 09 0c 00 00       	call   801016cc <iunlockput>
80100ac3:	e8 ce 1c 00 00       	call   80102796 <end_op>
80100ac8:	8b 85 f0 fe ff ff    	mov    -0x110(%ebp),%eax
80100ace:	05 ff 0f 00 00       	add    $0xfff,%eax
80100ad3:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80100ad8:	83 c4 0c             	add    $0xc,%esp
80100adb:	8d 90 00 20 00 00    	lea    0x2000(%eax),%edx
80100ae1:	52                   	push   %edx
80100ae2:	50                   	push   %eax
80100ae3:	57                   	push   %edi
80100ae4:	e8 81 55 00 00       	call   8010606a <allocuvm>
80100ae9:	89 c3                	mov    %eax,%ebx
80100aeb:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)
80100af1:	83 c4 10             	add    $0x10,%esp
80100af4:	85 c0                	test   %eax,%eax
80100af6:	75 16                	jne    80100b0e <exec+0x1db>
80100af8:	83 ec 0c             	sub    $0xc,%esp
80100afb:	57                   	push   %edi
80100afc:	e8 48 56 00 00       	call   80106149 <freevm>
80100b01:	83 c4 10             	add    $0x10,%esp
80100b04:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100b09:	e9 99 fe ff ff       	jmp    801009a7 <exec+0x74>
80100b0e:	83 ec 08             	sub    $0x8,%esp
80100b11:	8d 80 00 e0 ff ff    	lea    -0x2000(%eax),%eax
80100b17:	50                   	push   %eax
80100b18:	57                   	push   %edi
80100b19:	e8 23 57 00 00       	call   80106241 <clearpteu>
80100b1e:	8b 45 0c             	mov    0xc(%ebp),%eax
80100b21:	8b 00                	mov    (%eax),%eax
80100b23:	83 c4 10             	add    $0x10,%esp
80100b26:	be 00 00 00 00       	mov    $0x0,%esi
80100b2b:	85 c0                	test   %eax,%eax
80100b2d:	74 55                	je     80100b84 <exec+0x251>
80100b2f:	83 ec 0c             	sub    $0xc,%esp
80100b32:	50                   	push   %eax
80100b33:	e8 88 33 00 00       	call   80103ec0 <strlen>
80100b38:	29 c3                	sub    %eax,%ebx
80100b3a:	83 eb 01             	sub    $0x1,%ebx
80100b3d:	83 e3 fc             	and    $0xfffffffc,%ebx
80100b40:	83 c4 04             	add    $0x4,%esp
80100b43:	8b 45 0c             	mov    0xc(%ebp),%eax
80100b46:	ff 34 b0             	push   (%eax,%esi,4)
80100b49:	e8 72 33 00 00       	call   80103ec0 <strlen>
80100b4e:	83 c0 01             	add    $0x1,%eax
80100b51:	50                   	push   %eax
80100b52:	8b 45 0c             	mov    0xc(%ebp),%eax
80100b55:	ff 34 b0             	push   (%eax,%esi,4)
80100b58:	53                   	push   %ebx
80100b59:	57                   	push   %edi
80100b5a:	e8 2c 58 00 00       	call   8010638b <copyout>
80100b5f:	83 c4 20             	add    $0x20,%esp
80100b62:	85 c0                	test   %eax,%eax
80100b64:	78 92                	js     80100af8 <exec+0x1c5>
80100b66:	89 9c b5 64 ff ff ff 	mov    %ebx,-0x9c(%ebp,%esi,4)
80100b6d:	83 c6 01             	add    $0x1,%esi
80100b70:	8b 45 0c             	mov    0xc(%ebp),%eax
80100b73:	8b 04 b0             	mov    (%eax,%esi,4),%eax
80100b76:	85 c0                	test   %eax,%eax
80100b78:	74 10                	je     80100b8a <exec+0x257>
80100b7a:	83 fe 20             	cmp    $0x20,%esi
80100b7d:	75 b0                	jne    80100b2f <exec+0x1fc>
80100b7f:	e9 74 ff ff ff       	jmp    80100af8 <exec+0x1c5>
80100b84:	8b 9d f4 fe ff ff    	mov    -0x10c(%ebp),%ebx
80100b8a:	c7 84 b5 64 ff ff ff 	movl   $0x0,-0x9c(%ebp,%esi,4)
80100b91:	00 00 00 00 
80100b95:	c7 85 58 ff ff ff ff 	movl   $0xffffffff,-0xa8(%ebp)
80100b9c:	ff ff ff 
80100b9f:	89 b5 5c ff ff ff    	mov    %esi,-0xa4(%ebp)
80100ba5:	8d 04 b5 04 00 00 00 	lea    0x4(,%esi,4),%eax
80100bac:	89 da                	mov    %ebx,%edx
80100bae:	29 c2                	sub    %eax,%edx
80100bb0:	89 95 60 ff ff ff    	mov    %edx,-0xa0(%ebp)
80100bb6:	83 c0 0c             	add    $0xc,%eax
80100bb9:	89 de                	mov    %ebx,%esi
80100bbb:	29 c6                	sub    %eax,%esi
80100bbd:	50                   	push   %eax
80100bbe:	8d 85 58 ff ff ff    	lea    -0xa8(%ebp),%eax
80100bc4:	50                   	push   %eax
80100bc5:	56                   	push   %esi
80100bc6:	57                   	push   %edi
80100bc7:	e8 bf 57 00 00       	call   8010638b <copyout>
80100bcc:	83 c4 10             	add    $0x10,%esp
80100bcf:	85 c0                	test   %eax,%eax
80100bd1:	0f 88 21 ff ff ff    	js     80100af8 <exec+0x1c5>
80100bd7:	8b 45 08             	mov    0x8(%ebp),%eax
80100bda:	0f b6 10             	movzbl (%eax),%edx
80100bdd:	84 d2                	test   %dl,%dl
80100bdf:	74 1a                	je     80100bfb <exec+0x2c8>
80100be1:	83 c0 01             	add    $0x1,%eax
80100be4:	8b 4d 08             	mov    0x8(%ebp),%ecx
80100be7:	80 fa 2f             	cmp    $0x2f,%dl
80100bea:	0f 44 c8             	cmove  %eax,%ecx
80100bed:	83 c0 01             	add    $0x1,%eax
80100bf0:	0f b6 50 ff          	movzbl -0x1(%eax),%edx
80100bf4:	84 d2                	test   %dl,%dl
80100bf6:	75 ef                	jne    80100be7 <exec+0x2b4>
80100bf8:	89 4d 08             	mov    %ecx,0x8(%ebp)
80100bfb:	83 ec 04             	sub    $0x4,%esp
80100bfe:	6a 10                	push   $0x10
80100c00:	ff 75 08             	push   0x8(%ebp)
80100c03:	8b 9d ec fe ff ff    	mov    -0x114(%ebp),%ebx
80100c09:	8d 43 6c             	lea    0x6c(%ebx),%eax
80100c0c:	50                   	push   %eax
80100c0d:	e8 78 32 00 00       	call   80103e8a <safestrcpy>
80100c12:	89 d9                	mov    %ebx,%ecx
80100c14:	8b 5b 04             	mov    0x4(%ebx),%ebx
80100c17:	89 79 04             	mov    %edi,0x4(%ecx)
80100c1a:	8b bd f4 fe ff ff    	mov    -0x10c(%ebp),%edi
80100c20:	89 39                	mov    %edi,(%ecx)
80100c22:	8b 41 18             	mov    0x18(%ecx),%eax
80100c25:	8b 95 3c ff ff ff    	mov    -0xc4(%ebp),%edx
80100c2b:	89 50 38             	mov    %edx,0x38(%eax)
80100c2e:	8b 41 18             	mov    0x18(%ecx),%eax
80100c31:	89 70 44             	mov    %esi,0x44(%eax)
80100c34:	89 0c 24             	mov    %ecx,(%esp)
80100c37:	e8 99 51 00 00       	call   80105dd5 <switchuvm>
80100c3c:	89 1c 24             	mov    %ebx,(%esp)
80100c3f:	e8 05 55 00 00       	call   80106149 <freevm>
80100c44:	83 c4 10             	add    $0x10,%esp
80100c47:	b8 00 00 00 00       	mov    $0x0,%eax
80100c4c:	e9 56 fd ff ff       	jmp    801009a7 <exec+0x74>

80100c51 <fileinit>:
80100c51:	55                   	push   %ebp
80100c52:	89 e5                	mov    %esp,%ebp
80100c54:	83 ec 10             	sub    $0x10,%esp
80100c57:	68 9c 64 10 80       	push   $0x8010649c
80100c5c:	68 60 df 10 80       	push   $0x8010df60
80100c61:	e8 c2 2e 00 00       	call   80103b28 <initlock>
80100c66:	83 c4 10             	add    $0x10,%esp
80100c69:	c9                   	leave
80100c6a:	c3                   	ret

80100c6b <filealloc>:
80100c6b:	55                   	push   %ebp
80100c6c:	89 e5                	mov    %esp,%ebp
80100c6e:	53                   	push   %ebx
80100c6f:	83 ec 10             	sub    $0x10,%esp
80100c72:	68 60 df 10 80       	push   $0x8010df60
80100c77:	e8 f2 2f 00 00       	call   80103c6e <acquire>
80100c7c:	83 c4 10             	add    $0x10,%esp
80100c7f:	bb 94 df 10 80       	mov    $0x8010df94,%ebx
80100c84:	83 7b 04 00          	cmpl   $0x0,0x4(%ebx)
80100c88:	74 22                	je     80100cac <filealloc+0x41>
80100c8a:	83 c3 18             	add    $0x18,%ebx
80100c8d:	81 fb f4 e8 10 80    	cmp    $0x8010e8f4,%ebx
80100c93:	75 ef                	jne    80100c84 <filealloc+0x19>
80100c95:	83 ec 0c             	sub    $0xc,%esp
80100c98:	68 60 df 10 80       	push   $0x8010df60
80100c9d:	e8 33 30 00 00       	call   80103cd5 <release>
80100ca2:	83 c4 10             	add    $0x10,%esp
80100ca5:	bb 00 00 00 00       	mov    $0x0,%ebx
80100caa:	eb 17                	jmp    80100cc3 <filealloc+0x58>
80100cac:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
80100cb3:	83 ec 0c             	sub    $0xc,%esp
80100cb6:	68 60 df 10 80       	push   $0x8010df60
80100cbb:	e8 15 30 00 00       	call   80103cd5 <release>
80100cc0:	83 c4 10             	add    $0x10,%esp
80100cc3:	89 d8                	mov    %ebx,%eax
80100cc5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100cc8:	c9                   	leave
80100cc9:	c3                   	ret

80100cca <filedup>:
80100cca:	55                   	push   %ebp
80100ccb:	89 e5                	mov    %esp,%ebp
80100ccd:	53                   	push   %ebx
80100cce:	83 ec 10             	sub    $0x10,%esp
80100cd1:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100cd4:	68 60 df 10 80       	push   $0x8010df60
80100cd9:	e8 90 2f 00 00       	call   80103c6e <acquire>
80100cde:	8b 43 04             	mov    0x4(%ebx),%eax
80100ce1:	83 c4 10             	add    $0x10,%esp
80100ce4:	85 c0                	test   %eax,%eax
80100ce6:	7e 1a                	jle    80100d02 <filedup+0x38>
80100ce8:	83 c0 01             	add    $0x1,%eax
80100ceb:	89 43 04             	mov    %eax,0x4(%ebx)
80100cee:	83 ec 0c             	sub    $0xc,%esp
80100cf1:	68 60 df 10 80       	push   $0x8010df60
80100cf6:	e8 da 2f 00 00       	call   80103cd5 <release>
80100cfb:	89 d8                	mov    %ebx,%eax
80100cfd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100d00:	c9                   	leave
80100d01:	c3                   	ret
80100d02:	83 ec 0c             	sub    $0xc,%esp
80100d05:	68 a3 64 10 80       	push   $0x801064a3
80100d0a:	e8 33 f6 ff ff       	call   80100342 <panic>

80100d0f <fileclose>:
80100d0f:	55                   	push   %ebp
80100d10:	89 e5                	mov    %esp,%ebp
80100d12:	57                   	push   %edi
80100d13:	56                   	push   %esi
80100d14:	53                   	push   %ebx
80100d15:	83 ec 28             	sub    $0x28,%esp
80100d18:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100d1b:	68 60 df 10 80       	push   $0x8010df60
80100d20:	e8 49 2f 00 00       	call   80103c6e <acquire>
80100d25:	8b 43 04             	mov    0x4(%ebx),%eax
80100d28:	83 c4 10             	add    $0x10,%esp
80100d2b:	85 c0                	test   %eax,%eax
80100d2d:	7e 5d                	jle    80100d8c <fileclose+0x7d>
80100d2f:	83 e8 01             	sub    $0x1,%eax
80100d32:	89 43 04             	mov    %eax,0x4(%ebx)
80100d35:	85 c0                	test   %eax,%eax
80100d37:	7f 60                	jg     80100d99 <fileclose+0x8a>
80100d39:	8b 33                	mov    (%ebx),%esi
80100d3b:	0f b6 43 09          	movzbl 0x9(%ebx),%eax
80100d3f:	88 45 e7             	mov    %al,-0x19(%ebp)
80100d42:	8b 7b 0c             	mov    0xc(%ebx),%edi
80100d45:	8b 43 10             	mov    0x10(%ebx),%eax
80100d48:	89 45 e0             	mov    %eax,-0x20(%ebp)
80100d4b:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
80100d52:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80100d58:	83 ec 0c             	sub    $0xc,%esp
80100d5b:	68 60 df 10 80       	push   $0x8010df60
80100d60:	e8 70 2f 00 00       	call   80103cd5 <release>
80100d65:	83 c4 10             	add    $0x10,%esp
80100d68:	83 fe 01             	cmp    $0x1,%esi
80100d6b:	74 44                	je     80100db1 <fileclose+0xa2>
80100d6d:	83 fe 02             	cmp    $0x2,%esi
80100d70:	75 37                	jne    80100da9 <fileclose+0x9a>
80100d72:	e8 a4 19 00 00       	call   8010271b <begin_op>
80100d77:	83 ec 0c             	sub    $0xc,%esp
80100d7a:	ff 75 e0             	push   -0x20(%ebp)
80100d7d:	e8 06 08 00 00       	call   80101588 <iput>
80100d82:	e8 0f 1a 00 00       	call   80102796 <end_op>
80100d87:	83 c4 10             	add    $0x10,%esp
80100d8a:	eb 1d                	jmp    80100da9 <fileclose+0x9a>
80100d8c:	83 ec 0c             	sub    $0xc,%esp
80100d8f:	68 ab 64 10 80       	push   $0x801064ab
80100d94:	e8 a9 f5 ff ff       	call   80100342 <panic>
80100d99:	83 ec 0c             	sub    $0xc,%esp
80100d9c:	68 60 df 10 80       	push   $0x8010df60
80100da1:	e8 2f 2f 00 00       	call   80103cd5 <release>
80100da6:	83 c4 10             	add    $0x10,%esp
80100da9:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100dac:	5b                   	pop    %ebx
80100dad:	5e                   	pop    %esi
80100dae:	5f                   	pop    %edi
80100daf:	5d                   	pop    %ebp
80100db0:	c3                   	ret
80100db1:	83 ec 08             	sub    $0x8,%esp
80100db4:	0f be 45 e7          	movsbl -0x19(%ebp),%eax
80100db8:	50                   	push   %eax
80100db9:	57                   	push   %edi
80100dba:	e8 7c 20 00 00       	call   80102e3b <pipeclose>
80100dbf:	83 c4 10             	add    $0x10,%esp
80100dc2:	eb e5                	jmp    80100da9 <fileclose+0x9a>

80100dc4 <filestat>:
80100dc4:	55                   	push   %ebp
80100dc5:	89 e5                	mov    %esp,%ebp
80100dc7:	53                   	push   %ebx
80100dc8:	83 ec 04             	sub    $0x4,%esp
80100dcb:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100dce:	83 3b 02             	cmpl   $0x2,(%ebx)
80100dd1:	75 31                	jne    80100e04 <filestat+0x40>
80100dd3:	83 ec 0c             	sub    $0xc,%esp
80100dd6:	ff 73 10             	push   0x10(%ebx)
80100dd9:	e8 a3 06 00 00       	call   80101481 <ilock>
80100dde:	83 c4 08             	add    $0x8,%esp
80100de1:	ff 75 0c             	push   0xc(%ebp)
80100de4:	ff 73 10             	push   0x10(%ebx)
80100de7:	e8 00 09 00 00       	call   801016ec <stati>
80100dec:	83 c4 04             	add    $0x4,%esp
80100def:	ff 73 10             	push   0x10(%ebx)
80100df2:	e8 4c 07 00 00       	call   80101543 <iunlock>
80100df7:	83 c4 10             	add    $0x10,%esp
80100dfa:	b8 00 00 00 00       	mov    $0x0,%eax
80100dff:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e02:	c9                   	leave
80100e03:	c3                   	ret
80100e04:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100e09:	eb f4                	jmp    80100dff <filestat+0x3b>

80100e0b <fileread>:
80100e0b:	55                   	push   %ebp
80100e0c:	89 e5                	mov    %esp,%ebp
80100e0e:	56                   	push   %esi
80100e0f:	53                   	push   %ebx
80100e10:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100e13:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80100e17:	74 70                	je     80100e89 <fileread+0x7e>
80100e19:	8b 03                	mov    (%ebx),%eax
80100e1b:	83 f8 01             	cmp    $0x1,%eax
80100e1e:	74 44                	je     80100e64 <fileread+0x59>
80100e20:	83 f8 02             	cmp    $0x2,%eax
80100e23:	75 57                	jne    80100e7c <fileread+0x71>
80100e25:	83 ec 0c             	sub    $0xc,%esp
80100e28:	ff 73 10             	push   0x10(%ebx)
80100e2b:	e8 51 06 00 00       	call   80101481 <ilock>
80100e30:	ff 75 10             	push   0x10(%ebp)
80100e33:	ff 73 14             	push   0x14(%ebx)
80100e36:	ff 75 0c             	push   0xc(%ebp)
80100e39:	ff 73 10             	push   0x10(%ebx)
80100e3c:	e8 d6 08 00 00       	call   80101717 <readi>
80100e41:	89 c6                	mov    %eax,%esi
80100e43:	83 c4 20             	add    $0x20,%esp
80100e46:	85 c0                	test   %eax,%eax
80100e48:	7e 03                	jle    80100e4d <fileread+0x42>
80100e4a:	01 43 14             	add    %eax,0x14(%ebx)
80100e4d:	83 ec 0c             	sub    $0xc,%esp
80100e50:	ff 73 10             	push   0x10(%ebx)
80100e53:	e8 eb 06 00 00       	call   80101543 <iunlock>
80100e58:	83 c4 10             	add    $0x10,%esp
80100e5b:	89 f0                	mov    %esi,%eax
80100e5d:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100e60:	5b                   	pop    %ebx
80100e61:	5e                   	pop    %esi
80100e62:	5d                   	pop    %ebp
80100e63:	c3                   	ret
80100e64:	83 ec 04             	sub    $0x4,%esp
80100e67:	ff 75 10             	push   0x10(%ebp)
80100e6a:	ff 75 0c             	push   0xc(%ebp)
80100e6d:	ff 73 0c             	push   0xc(%ebx)
80100e70:	e8 40 21 00 00       	call   80102fb5 <piperead>
80100e75:	89 c6                	mov    %eax,%esi
80100e77:	83 c4 10             	add    $0x10,%esp
80100e7a:	eb df                	jmp    80100e5b <fileread+0x50>
80100e7c:	83 ec 0c             	sub    $0xc,%esp
80100e7f:	68 b5 64 10 80       	push   $0x801064b5
80100e84:	e8 b9 f4 ff ff       	call   80100342 <panic>
80100e89:	be ff ff ff ff       	mov    $0xffffffff,%esi
80100e8e:	eb cb                	jmp    80100e5b <fileread+0x50>

80100e90 <filewrite>:
80100e90:	55                   	push   %ebp
80100e91:	89 e5                	mov    %esp,%ebp
80100e93:	57                   	push   %edi
80100e94:	56                   	push   %esi
80100e95:	53                   	push   %ebx
80100e96:	83 ec 1c             	sub    $0x1c,%esp
80100e99:	8b 7d 08             	mov    0x8(%ebp),%edi
80100e9c:	80 7f 09 00          	cmpb   $0x0,0x9(%edi)
80100ea0:	0f 84 ea 00 00 00    	je     80100f90 <filewrite+0x100>
80100ea6:	8b 07                	mov    (%edi),%eax
80100ea8:	83 f8 01             	cmp    $0x1,%eax
80100eab:	74 1a                	je     80100ec7 <filewrite+0x37>
80100ead:	83 f8 02             	cmp    $0x2,%eax
80100eb0:	0f 85 cd 00 00 00    	jne    80100f83 <filewrite+0xf3>
80100eb6:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
80100eba:	0f 8e bc 00 00 00    	jle    80100f7c <filewrite+0xec>
80100ec0:	bb 00 00 00 00       	mov    $0x0,%ebx
80100ec5:	eb 40                	jmp    80100f07 <filewrite+0x77>
80100ec7:	83 ec 04             	sub    $0x4,%esp
80100eca:	ff 75 10             	push   0x10(%ebp)
80100ecd:	ff 75 0c             	push   0xc(%ebp)
80100ed0:	ff 77 0c             	push   0xc(%edi)
80100ed3:	e8 ef 1f 00 00       	call   80102ec7 <pipewrite>
80100ed8:	83 c4 10             	add    $0x10,%esp
80100edb:	e9 87 00 00 00       	jmp    80100f67 <filewrite+0xd7>
80100ee0:	01 47 14             	add    %eax,0x14(%edi)
80100ee3:	83 ec 0c             	sub    $0xc,%esp
80100ee6:	ff 77 10             	push   0x10(%edi)
80100ee9:	e8 55 06 00 00       	call   80101543 <iunlock>
80100eee:	e8 a3 18 00 00       	call   80102796 <end_op>
80100ef3:	83 c4 10             	add    $0x10,%esp
80100ef6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100ef9:	39 c6                	cmp    %eax,%esi
80100efb:	75 72                	jne    80100f6f <filewrite+0xdf>
80100efd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100f00:	01 c3                	add    %eax,%ebx
80100f02:	39 5d 10             	cmp    %ebx,0x10(%ebp)
80100f05:	7e 54                	jle    80100f5b <filewrite+0xcb>
80100f07:	8b 75 10             	mov    0x10(%ebp),%esi
80100f0a:	29 de                	sub    %ebx,%esi
80100f0c:	b8 00 06 00 00       	mov    $0x600,%eax
80100f11:	39 c6                	cmp    %eax,%esi
80100f13:	0f 4f f0             	cmovg  %eax,%esi
80100f16:	e8 00 18 00 00       	call   8010271b <begin_op>
80100f1b:	83 ec 0c             	sub    $0xc,%esp
80100f1e:	ff 77 10             	push   0x10(%edi)
80100f21:	e8 5b 05 00 00       	call   80101481 <ilock>
80100f26:	56                   	push   %esi
80100f27:	ff 77 14             	push   0x14(%edi)
80100f2a:	89 d8                	mov    %ebx,%eax
80100f2c:	03 45 0c             	add    0xc(%ebp),%eax
80100f2f:	50                   	push   %eax
80100f30:	ff 77 10             	push   0x10(%edi)
80100f33:	e8 d9 08 00 00       	call   80101811 <writei>
80100f38:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100f3b:	83 c4 20             	add    $0x20,%esp
80100f3e:	85 c0                	test   %eax,%eax
80100f40:	7f 9e                	jg     80100ee0 <filewrite+0x50>
80100f42:	83 ec 0c             	sub    $0xc,%esp
80100f45:	ff 77 10             	push   0x10(%edi)
80100f48:	e8 f6 05 00 00       	call   80101543 <iunlock>
80100f4d:	e8 44 18 00 00       	call   80102796 <end_op>
80100f52:	83 c4 10             	add    $0x10,%esp
80100f55:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
80100f59:	79 9b                	jns    80100ef6 <filewrite+0x66>
80100f5b:	39 5d 10             	cmp    %ebx,0x10(%ebp)
80100f5e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100f63:	0f 44 45 10          	cmove  0x10(%ebp),%eax
80100f67:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f6a:	5b                   	pop    %ebx
80100f6b:	5e                   	pop    %esi
80100f6c:	5f                   	pop    %edi
80100f6d:	5d                   	pop    %ebp
80100f6e:	c3                   	ret
80100f6f:	83 ec 0c             	sub    $0xc,%esp
80100f72:	68 be 64 10 80       	push   $0x801064be
80100f77:	e8 c6 f3 ff ff       	call   80100342 <panic>
80100f7c:	bb 00 00 00 00       	mov    $0x0,%ebx
80100f81:	eb d8                	jmp    80100f5b <filewrite+0xcb>
80100f83:	83 ec 0c             	sub    $0xc,%esp
80100f86:	68 c4 64 10 80       	push   $0x801064c4
80100f8b:	e8 b2 f3 ff ff       	call   80100342 <panic>
80100f90:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100f95:	eb d0                	jmp    80100f67 <filewrite+0xd7>

80100f97 <bfree>:
80100f97:	55                   	push   %ebp
80100f98:	89 e5                	mov    %esp,%ebp
80100f9a:	56                   	push   %esi
80100f9b:	53                   	push   %ebx
80100f9c:	89 c1                	mov    %eax,%ecx
80100f9e:	89 d3                	mov    %edx,%ebx
80100fa0:	83 ec 08             	sub    $0x8,%esp
80100fa3:	89 d0                	mov    %edx,%eax
80100fa5:	c1 e8 0c             	shr    $0xc,%eax
80100fa8:	03 05 cc 05 11 80    	add    0x801105cc,%eax
80100fae:	50                   	push   %eax
80100faf:	51                   	push   %ecx
80100fb0:	e8 f5 f0 ff ff       	call   801000aa <bread>
80100fb5:	89 c6                	mov    %eax,%esi
80100fb7:	89 d9                	mov    %ebx,%ecx
80100fb9:	83 e1 07             	and    $0x7,%ecx
80100fbc:	b8 01 00 00 00       	mov    $0x1,%eax
80100fc1:	d3 e0                	shl    %cl,%eax
80100fc3:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
80100fc9:	83 c4 10             	add    $0x10,%esp
80100fcc:	c1 fb 03             	sar    $0x3,%ebx
80100fcf:	0f b6 54 1e 5c       	movzbl 0x5c(%esi,%ebx,1),%edx
80100fd4:	0f b6 ca             	movzbl %dl,%ecx
80100fd7:	85 c1                	test   %eax,%ecx
80100fd9:	74 23                	je     80100ffe <bfree+0x67>
80100fdb:	f7 d0                	not    %eax
80100fdd:	21 d0                	and    %edx,%eax
80100fdf:	88 44 1e 5c          	mov    %al,0x5c(%esi,%ebx,1)
80100fe3:	83 ec 0c             	sub    $0xc,%esp
80100fe6:	56                   	push   %esi
80100fe7:	e8 ec 18 00 00       	call   801028d8 <log_write>
80100fec:	89 34 24             	mov    %esi,(%esp)
80100fef:	e8 cd f1 ff ff       	call   801001c1 <brelse>
80100ff4:	83 c4 10             	add    $0x10,%esp
80100ff7:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100ffa:	5b                   	pop    %ebx
80100ffb:	5e                   	pop    %esi
80100ffc:	5d                   	pop    %ebp
80100ffd:	c3                   	ret
80100ffe:	83 ec 0c             	sub    $0xc,%esp
80101001:	68 ce 64 10 80       	push   $0x801064ce
80101006:	e8 37 f3 ff ff       	call   80100342 <panic>

8010100b <balloc>:
8010100b:	55                   	push   %ebp
8010100c:	89 e5                	mov    %esp,%ebp
8010100e:	57                   	push   %edi
8010100f:	56                   	push   %esi
80101010:	53                   	push   %ebx
80101011:	83 ec 1c             	sub    $0x1c,%esp
80101014:	89 45 dc             	mov    %eax,-0x24(%ebp)
80101017:	83 3d b4 05 11 80 00 	cmpl   $0x0,0x801105b4
8010101e:	0f 84 9d 00 00 00    	je     801010c1 <balloc+0xb6>
80101024:	bf 00 00 00 00       	mov    $0x0,%edi
80101029:	eb 1f                	jmp    8010104a <balloc+0x3f>
8010102b:	8b 7d d8             	mov    -0x28(%ebp),%edi
8010102e:	83 ec 0c             	sub    $0xc,%esp
80101031:	ff 75 e4             	push   -0x1c(%ebp)
80101034:	e8 88 f1 ff ff       	call   801001c1 <brelse>
80101039:	81 c7 00 10 00 00    	add    $0x1000,%edi
8010103f:	83 c4 10             	add    $0x10,%esp
80101042:	3b 3d b4 05 11 80    	cmp    0x801105b4,%edi
80101048:	73 77                	jae    801010c1 <balloc+0xb6>
8010104a:	83 ec 08             	sub    $0x8,%esp
8010104d:	8d 87 ff 0f 00 00    	lea    0xfff(%edi),%eax
80101053:	85 ff                	test   %edi,%edi
80101055:	0f 49 c7             	cmovns %edi,%eax
80101058:	c1 f8 0c             	sar    $0xc,%eax
8010105b:	03 05 cc 05 11 80    	add    0x801105cc,%eax
80101061:	50                   	push   %eax
80101062:	ff 75 dc             	push   -0x24(%ebp)
80101065:	e8 40 f0 ff ff       	call   801000aa <bread>
8010106a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010106d:	a1 b4 05 11 80       	mov    0x801105b4,%eax
80101072:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101075:	89 fe                	mov    %edi,%esi
80101077:	83 c4 10             	add    $0x10,%esp
8010107a:	b8 00 00 00 00       	mov    $0x0,%eax
8010107f:	89 7d d8             	mov    %edi,-0x28(%ebp)
80101082:	8b 7d e0             	mov    -0x20(%ebp),%edi
80101085:	39 fe                	cmp    %edi,%esi
80101087:	73 a2                	jae    8010102b <balloc+0x20>
80101089:	89 c1                	mov    %eax,%ecx
8010108b:	83 e1 07             	and    $0x7,%ecx
8010108e:	bb 01 00 00 00       	mov    $0x1,%ebx
80101093:	d3 e3                	shl    %cl,%ebx
80101095:	8d 50 07             	lea    0x7(%eax),%edx
80101098:	85 c0                	test   %eax,%eax
8010109a:	0f 49 d0             	cmovns %eax,%edx
8010109d:	c1 fa 03             	sar    $0x3,%edx
801010a0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801010a3:	0f b6 4c 17 5c       	movzbl 0x5c(%edi,%edx,1),%ecx
801010a8:	0f b6 f9             	movzbl %cl,%edi
801010ab:	85 df                	test   %ebx,%edi
801010ad:	74 1f                	je     801010ce <balloc+0xc3>
801010af:	83 c0 01             	add    $0x1,%eax
801010b2:	83 c6 01             	add    $0x1,%esi
801010b5:	3d 00 10 00 00       	cmp    $0x1000,%eax
801010ba:	75 c6                	jne    80101082 <balloc+0x77>
801010bc:	e9 6a ff ff ff       	jmp    8010102b <balloc+0x20>
801010c1:	83 ec 0c             	sub    $0xc,%esp
801010c4:	68 e1 64 10 80       	push   $0x801064e1
801010c9:	e8 74 f2 ff ff       	call   80100342 <panic>
801010ce:	09 d9                	or     %ebx,%ecx
801010d0:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
801010d3:	88 4c 13 5c          	mov    %cl,0x5c(%ebx,%edx,1)
801010d7:	83 ec 0c             	sub    $0xc,%esp
801010da:	53                   	push   %ebx
801010db:	e8 f8 17 00 00       	call   801028d8 <log_write>
801010e0:	89 1c 24             	mov    %ebx,(%esp)
801010e3:	e8 d9 f0 ff ff       	call   801001c1 <brelse>
801010e8:	83 c4 08             	add    $0x8,%esp
801010eb:	56                   	push   %esi
801010ec:	ff 75 dc             	push   -0x24(%ebp)
801010ef:	e8 b6 ef ff ff       	call   801000aa <bread>
801010f4:	89 c3                	mov    %eax,%ebx
801010f6:	83 c4 0c             	add    $0xc,%esp
801010f9:	68 00 02 00 00       	push   $0x200
801010fe:	6a 00                	push   $0x0
80101100:	8d 40 5c             	lea    0x5c(%eax),%eax
80101103:	50                   	push   %eax
80101104:	e8 13 2c 00 00       	call   80103d1c <memset>
80101109:	89 1c 24             	mov    %ebx,(%esp)
8010110c:	e8 c7 17 00 00       	call   801028d8 <log_write>
80101111:	89 1c 24             	mov    %ebx,(%esp)
80101114:	e8 a8 f0 ff ff       	call   801001c1 <brelse>
80101119:	89 f0                	mov    %esi,%eax
8010111b:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010111e:	5b                   	pop    %ebx
8010111f:	5e                   	pop    %esi
80101120:	5f                   	pop    %edi
80101121:	5d                   	pop    %ebp
80101122:	c3                   	ret

80101123 <bmap>:
80101123:	55                   	push   %ebp
80101124:	89 e5                	mov    %esp,%ebp
80101126:	57                   	push   %edi
80101127:	56                   	push   %esi
80101128:	53                   	push   %ebx
80101129:	83 ec 1c             	sub    $0x1c,%esp
8010112c:	89 c3                	mov    %eax,%ebx
8010112e:	89 d7                	mov    %edx,%edi
80101130:	83 fa 0b             	cmp    $0xb,%edx
80101133:	76 45                	jbe    8010117a <bmap+0x57>
80101135:	8d 72 f4             	lea    -0xc(%edx),%esi
80101138:	83 fe 7f             	cmp    $0x7f,%esi
8010113b:	77 7f                	ja     801011bc <bmap+0x99>
8010113d:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
80101143:	85 c0                	test   %eax,%eax
80101145:	74 4a                	je     80101191 <bmap+0x6e>
80101147:	83 ec 08             	sub    $0x8,%esp
8010114a:	50                   	push   %eax
8010114b:	ff 33                	push   (%ebx)
8010114d:	e8 58 ef ff ff       	call   801000aa <bread>
80101152:	89 c7                	mov    %eax,%edi
80101154:	8d 44 b0 5c          	lea    0x5c(%eax,%esi,4),%eax
80101158:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010115b:	8b 30                	mov    (%eax),%esi
8010115d:	83 c4 10             	add    $0x10,%esp
80101160:	85 f6                	test   %esi,%esi
80101162:	74 3c                	je     801011a0 <bmap+0x7d>
80101164:	83 ec 0c             	sub    $0xc,%esp
80101167:	57                   	push   %edi
80101168:	e8 54 f0 ff ff       	call   801001c1 <brelse>
8010116d:	83 c4 10             	add    $0x10,%esp
80101170:	89 f0                	mov    %esi,%eax
80101172:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101175:	5b                   	pop    %ebx
80101176:	5e                   	pop    %esi
80101177:	5f                   	pop    %edi
80101178:	5d                   	pop    %ebp
80101179:	c3                   	ret
8010117a:	8b 74 90 5c          	mov    0x5c(%eax,%edx,4),%esi
8010117e:	85 f6                	test   %esi,%esi
80101180:	75 ee                	jne    80101170 <bmap+0x4d>
80101182:	8b 00                	mov    (%eax),%eax
80101184:	e8 82 fe ff ff       	call   8010100b <balloc>
80101189:	89 c6                	mov    %eax,%esi
8010118b:	89 44 bb 5c          	mov    %eax,0x5c(%ebx,%edi,4)
8010118f:	eb df                	jmp    80101170 <bmap+0x4d>
80101191:	8b 03                	mov    (%ebx),%eax
80101193:	e8 73 fe ff ff       	call   8010100b <balloc>
80101198:	89 83 8c 00 00 00    	mov    %eax,0x8c(%ebx)
8010119e:	eb a7                	jmp    80101147 <bmap+0x24>
801011a0:	8b 03                	mov    (%ebx),%eax
801011a2:	e8 64 fe ff ff       	call   8010100b <balloc>
801011a7:	89 c6                	mov    %eax,%esi
801011a9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801011ac:	89 30                	mov    %esi,(%eax)
801011ae:	83 ec 0c             	sub    $0xc,%esp
801011b1:	57                   	push   %edi
801011b2:	e8 21 17 00 00       	call   801028d8 <log_write>
801011b7:	83 c4 10             	add    $0x10,%esp
801011ba:	eb a8                	jmp    80101164 <bmap+0x41>
801011bc:	83 ec 0c             	sub    $0xc,%esp
801011bf:	68 f7 64 10 80       	push   $0x801064f7
801011c4:	e8 79 f1 ff ff       	call   80100342 <panic>

801011c9 <iget>:
801011c9:	55                   	push   %ebp
801011ca:	89 e5                	mov    %esp,%ebp
801011cc:	57                   	push   %edi
801011cd:	56                   	push   %esi
801011ce:	53                   	push   %ebx
801011cf:	83 ec 28             	sub    $0x28,%esp
801011d2:	89 c7                	mov    %eax,%edi
801011d4:	89 55 e4             	mov    %edx,-0x1c(%ebp)
801011d7:	68 60 e9 10 80       	push   $0x8010e960
801011dc:	e8 8d 2a 00 00       	call   80103c6e <acquire>
801011e1:	83 c4 10             	add    $0x10,%esp
801011e4:	be 00 00 00 00       	mov    $0x0,%esi
801011e9:	bb 94 e9 10 80       	mov    $0x8010e994,%ebx
801011ee:	eb 13                	jmp    80101203 <iget+0x3a>
801011f0:	09 f0                	or     %esi,%eax
801011f2:	0f 44 f3             	cmove  %ebx,%esi
801011f5:	81 c3 90 00 00 00    	add    $0x90,%ebx
801011fb:	81 fb b4 05 11 80    	cmp    $0x801105b4,%ebx
80101201:	74 2d                	je     80101230 <iget+0x67>
80101203:	8b 43 08             	mov    0x8(%ebx),%eax
80101206:	85 c0                	test   %eax,%eax
80101208:	7e e6                	jle    801011f0 <iget+0x27>
8010120a:	39 3b                	cmp    %edi,(%ebx)
8010120c:	75 e7                	jne    801011f5 <iget+0x2c>
8010120e:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101211:	39 4b 04             	cmp    %ecx,0x4(%ebx)
80101214:	75 df                	jne    801011f5 <iget+0x2c>
80101216:	83 c0 01             	add    $0x1,%eax
80101219:	89 43 08             	mov    %eax,0x8(%ebx)
8010121c:	83 ec 0c             	sub    $0xc,%esp
8010121f:	68 60 e9 10 80       	push   $0x8010e960
80101224:	e8 ac 2a 00 00       	call   80103cd5 <release>
80101229:	83 c4 10             	add    $0x10,%esp
8010122c:	89 de                	mov    %ebx,%esi
8010122e:	eb 2a                	jmp    8010125a <iget+0x91>
80101230:	85 f6                	test   %esi,%esi
80101232:	74 30                	je     80101264 <iget+0x9b>
80101234:	89 3e                	mov    %edi,(%esi)
80101236:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101239:	89 46 04             	mov    %eax,0x4(%esi)
8010123c:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
80101243:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
8010124a:	83 ec 0c             	sub    $0xc,%esp
8010124d:	68 60 e9 10 80       	push   $0x8010e960
80101252:	e8 7e 2a 00 00       	call   80103cd5 <release>
80101257:	83 c4 10             	add    $0x10,%esp
8010125a:	89 f0                	mov    %esi,%eax
8010125c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010125f:	5b                   	pop    %ebx
80101260:	5e                   	pop    %esi
80101261:	5f                   	pop    %edi
80101262:	5d                   	pop    %ebp
80101263:	c3                   	ret
80101264:	83 ec 0c             	sub    $0xc,%esp
80101267:	68 0a 65 10 80       	push   $0x8010650a
8010126c:	e8 d1 f0 ff ff       	call   80100342 <panic>

80101271 <readsb>:
80101271:	55                   	push   %ebp
80101272:	89 e5                	mov    %esp,%ebp
80101274:	53                   	push   %ebx
80101275:	83 ec 0c             	sub    $0xc,%esp
80101278:	6a 01                	push   $0x1
8010127a:	ff 75 08             	push   0x8(%ebp)
8010127d:	e8 28 ee ff ff       	call   801000aa <bread>
80101282:	89 c3                	mov    %eax,%ebx
80101284:	83 c4 0c             	add    $0xc,%esp
80101287:	6a 1c                	push   $0x1c
80101289:	8d 40 5c             	lea    0x5c(%eax),%eax
8010128c:	50                   	push   %eax
8010128d:	ff 75 0c             	push   0xc(%ebp)
80101290:	e8 fe 2a 00 00       	call   80103d93 <memmove>
80101295:	89 1c 24             	mov    %ebx,(%esp)
80101298:	e8 24 ef ff ff       	call   801001c1 <brelse>
8010129d:	83 c4 10             	add    $0x10,%esp
801012a0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801012a3:	c9                   	leave
801012a4:	c3                   	ret

801012a5 <iinit>:
801012a5:	55                   	push   %ebp
801012a6:	89 e5                	mov    %esp,%ebp
801012a8:	56                   	push   %esi
801012a9:	53                   	push   %ebx
801012aa:	83 ec 08             	sub    $0x8,%esp
801012ad:	68 1a 65 10 80       	push   $0x8010651a
801012b2:	68 60 e9 10 80       	push   $0x8010e960
801012b7:	e8 6c 28 00 00       	call   80103b28 <initlock>
801012bc:	bb a0 e9 10 80       	mov    $0x8010e9a0,%ebx
801012c1:	be c0 05 11 80       	mov    $0x801105c0,%esi
801012c6:	83 c4 10             	add    $0x10,%esp
801012c9:	83 ec 08             	sub    $0x8,%esp
801012cc:	68 21 65 10 80       	push   $0x80106521
801012d1:	53                   	push   %ebx
801012d2:	e8 47 27 00 00       	call   80103a1e <initsleeplock>
801012d7:	81 c3 90 00 00 00    	add    $0x90,%ebx
801012dd:	83 c4 10             	add    $0x10,%esp
801012e0:	39 f3                	cmp    %esi,%ebx
801012e2:	75 e5                	jne    801012c9 <iinit+0x24>
801012e4:	83 ec 08             	sub    $0x8,%esp
801012e7:	68 b4 05 11 80       	push   $0x801105b4
801012ec:	ff 75 08             	push   0x8(%ebp)
801012ef:	e8 7d ff ff ff       	call   80101271 <readsb>
801012f4:	ff 35 cc 05 11 80    	push   0x801105cc
801012fa:	ff 35 c8 05 11 80    	push   0x801105c8
80101300:	ff 35 c4 05 11 80    	push   0x801105c4
80101306:	ff 35 c0 05 11 80    	push   0x801105c0
8010130c:	ff 35 bc 05 11 80    	push   0x801105bc
80101312:	ff 35 b8 05 11 80    	push   0x801105b8
80101318:	ff 35 b4 05 11 80    	push   0x801105b4
8010131e:	68 60 69 10 80       	push   $0x80106960
80101323:	e8 e1 f2 ff ff       	call   80100609 <cprintf>
80101328:	83 c4 30             	add    $0x30,%esp
8010132b:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010132e:	5b                   	pop    %ebx
8010132f:	5e                   	pop    %esi
80101330:	5d                   	pop    %ebp
80101331:	c3                   	ret

80101332 <ialloc>:
80101332:	55                   	push   %ebp
80101333:	89 e5                	mov    %esp,%ebp
80101335:	57                   	push   %edi
80101336:	56                   	push   %esi
80101337:	53                   	push   %ebx
80101338:	83 ec 1c             	sub    $0x1c,%esp
8010133b:	8b 45 0c             	mov    0xc(%ebp),%eax
8010133e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101341:	83 3d bc 05 11 80 01 	cmpl   $0x1,0x801105bc
80101348:	76 4a                	jbe    80101394 <ialloc+0x62>
8010134a:	be 01 00 00 00       	mov    $0x1,%esi
8010134f:	83 ec 08             	sub    $0x8,%esp
80101352:	89 f0                	mov    %esi,%eax
80101354:	c1 e8 03             	shr    $0x3,%eax
80101357:	03 05 c8 05 11 80    	add    0x801105c8,%eax
8010135d:	50                   	push   %eax
8010135e:	ff 75 08             	push   0x8(%ebp)
80101361:	e8 44 ed ff ff       	call   801000aa <bread>
80101366:	89 c3                	mov    %eax,%ebx
80101368:	89 f0                	mov    %esi,%eax
8010136a:	83 e0 07             	and    $0x7,%eax
8010136d:	c1 e0 06             	shl    $0x6,%eax
80101370:	8d 7c 03 5c          	lea    0x5c(%ebx,%eax,1),%edi
80101374:	83 c4 10             	add    $0x10,%esp
80101377:	66 83 3f 00          	cmpw   $0x0,(%edi)
8010137b:	74 24                	je     801013a1 <ialloc+0x6f>
8010137d:	83 ec 0c             	sub    $0xc,%esp
80101380:	53                   	push   %ebx
80101381:	e8 3b ee ff ff       	call   801001c1 <brelse>
80101386:	83 c6 01             	add    $0x1,%esi
80101389:	83 c4 10             	add    $0x10,%esp
8010138c:	3b 35 bc 05 11 80    	cmp    0x801105bc,%esi
80101392:	72 bb                	jb     8010134f <ialloc+0x1d>
80101394:	83 ec 0c             	sub    $0xc,%esp
80101397:	68 27 65 10 80       	push   $0x80106527
8010139c:	e8 a1 ef ff ff       	call   80100342 <panic>
801013a1:	83 ec 04             	sub    $0x4,%esp
801013a4:	6a 40                	push   $0x40
801013a6:	6a 00                	push   $0x0
801013a8:	57                   	push   %edi
801013a9:	e8 6e 29 00 00       	call   80103d1c <memset>
801013ae:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
801013b2:	66 89 07             	mov    %ax,(%edi)
801013b5:	89 1c 24             	mov    %ebx,(%esp)
801013b8:	e8 1b 15 00 00       	call   801028d8 <log_write>
801013bd:	89 1c 24             	mov    %ebx,(%esp)
801013c0:	e8 fc ed ff ff       	call   801001c1 <brelse>
801013c5:	89 f2                	mov    %esi,%edx
801013c7:	8b 45 08             	mov    0x8(%ebp),%eax
801013ca:	e8 fa fd ff ff       	call   801011c9 <iget>
801013cf:	8d 65 f4             	lea    -0xc(%ebp),%esp
801013d2:	5b                   	pop    %ebx
801013d3:	5e                   	pop    %esi
801013d4:	5f                   	pop    %edi
801013d5:	5d                   	pop    %ebp
801013d6:	c3                   	ret

801013d7 <iupdate>:
801013d7:	55                   	push   %ebp
801013d8:	89 e5                	mov    %esp,%ebp
801013da:	56                   	push   %esi
801013db:	53                   	push   %ebx
801013dc:	8b 5d 08             	mov    0x8(%ebp),%ebx
801013df:	83 ec 08             	sub    $0x8,%esp
801013e2:	8b 43 04             	mov    0x4(%ebx),%eax
801013e5:	c1 e8 03             	shr    $0x3,%eax
801013e8:	03 05 c8 05 11 80    	add    0x801105c8,%eax
801013ee:	50                   	push   %eax
801013ef:	ff 33                	push   (%ebx)
801013f1:	e8 b4 ec ff ff       	call   801000aa <bread>
801013f6:	89 c6                	mov    %eax,%esi
801013f8:	8b 43 04             	mov    0x4(%ebx),%eax
801013fb:	83 e0 07             	and    $0x7,%eax
801013fe:	c1 e0 06             	shl    $0x6,%eax
80101401:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
80101405:	0f b7 53 50          	movzwl 0x50(%ebx),%edx
80101409:	66 89 10             	mov    %dx,(%eax)
8010140c:	0f b7 53 52          	movzwl 0x52(%ebx),%edx
80101410:	66 89 50 02          	mov    %dx,0x2(%eax)
80101414:	0f b7 53 54          	movzwl 0x54(%ebx),%edx
80101418:	66 89 50 04          	mov    %dx,0x4(%eax)
8010141c:	0f b7 53 56          	movzwl 0x56(%ebx),%edx
80101420:	66 89 50 06          	mov    %dx,0x6(%eax)
80101424:	8b 53 58             	mov    0x58(%ebx),%edx
80101427:	89 50 08             	mov    %edx,0x8(%eax)
8010142a:	83 c4 0c             	add    $0xc,%esp
8010142d:	6a 34                	push   $0x34
8010142f:	83 c3 5c             	add    $0x5c,%ebx
80101432:	53                   	push   %ebx
80101433:	83 c0 0c             	add    $0xc,%eax
80101436:	50                   	push   %eax
80101437:	e8 57 29 00 00       	call   80103d93 <memmove>
8010143c:	89 34 24             	mov    %esi,(%esp)
8010143f:	e8 94 14 00 00       	call   801028d8 <log_write>
80101444:	89 34 24             	mov    %esi,(%esp)
80101447:	e8 75 ed ff ff       	call   801001c1 <brelse>
8010144c:	83 c4 10             	add    $0x10,%esp
8010144f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101452:	5b                   	pop    %ebx
80101453:	5e                   	pop    %esi
80101454:	5d                   	pop    %ebp
80101455:	c3                   	ret

80101456 <idup>:
80101456:	55                   	push   %ebp
80101457:	89 e5                	mov    %esp,%ebp
80101459:	53                   	push   %ebx
8010145a:	83 ec 10             	sub    $0x10,%esp
8010145d:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101460:	68 60 e9 10 80       	push   $0x8010e960
80101465:	e8 04 28 00 00       	call   80103c6e <acquire>
8010146a:	83 43 08 01          	addl   $0x1,0x8(%ebx)
8010146e:	c7 04 24 60 e9 10 80 	movl   $0x8010e960,(%esp)
80101475:	e8 5b 28 00 00       	call   80103cd5 <release>
8010147a:	89 d8                	mov    %ebx,%eax
8010147c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010147f:	c9                   	leave
80101480:	c3                   	ret

80101481 <ilock>:
80101481:	55                   	push   %ebp
80101482:	89 e5                	mov    %esp,%ebp
80101484:	56                   	push   %esi
80101485:	53                   	push   %ebx
80101486:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101489:	85 db                	test   %ebx,%ebx
8010148b:	74 22                	je     801014af <ilock+0x2e>
8010148d:	83 7b 08 00          	cmpl   $0x0,0x8(%ebx)
80101491:	7e 1c                	jle    801014af <ilock+0x2e>
80101493:	83 ec 0c             	sub    $0xc,%esp
80101496:	8d 43 0c             	lea    0xc(%ebx),%eax
80101499:	50                   	push   %eax
8010149a:	e8 b2 25 00 00       	call   80103a51 <acquiresleep>
8010149f:	83 c4 10             	add    $0x10,%esp
801014a2:	83 7b 4c 00          	cmpl   $0x0,0x4c(%ebx)
801014a6:	74 14                	je     801014bc <ilock+0x3b>
801014a8:	8d 65 f8             	lea    -0x8(%ebp),%esp
801014ab:	5b                   	pop    %ebx
801014ac:	5e                   	pop    %esi
801014ad:	5d                   	pop    %ebp
801014ae:	c3                   	ret
801014af:	83 ec 0c             	sub    $0xc,%esp
801014b2:	68 39 65 10 80       	push   $0x80106539
801014b7:	e8 86 ee ff ff       	call   80100342 <panic>
801014bc:	83 ec 08             	sub    $0x8,%esp
801014bf:	8b 43 04             	mov    0x4(%ebx),%eax
801014c2:	c1 e8 03             	shr    $0x3,%eax
801014c5:	03 05 c8 05 11 80    	add    0x801105c8,%eax
801014cb:	50                   	push   %eax
801014cc:	ff 33                	push   (%ebx)
801014ce:	e8 d7 eb ff ff       	call   801000aa <bread>
801014d3:	89 c6                	mov    %eax,%esi
801014d5:	8b 43 04             	mov    0x4(%ebx),%eax
801014d8:	83 e0 07             	and    $0x7,%eax
801014db:	c1 e0 06             	shl    $0x6,%eax
801014de:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
801014e2:	0f b7 10             	movzwl (%eax),%edx
801014e5:	66 89 53 50          	mov    %dx,0x50(%ebx)
801014e9:	0f b7 50 02          	movzwl 0x2(%eax),%edx
801014ed:	66 89 53 52          	mov    %dx,0x52(%ebx)
801014f1:	0f b7 50 04          	movzwl 0x4(%eax),%edx
801014f5:	66 89 53 54          	mov    %dx,0x54(%ebx)
801014f9:	0f b7 50 06          	movzwl 0x6(%eax),%edx
801014fd:	66 89 53 56          	mov    %dx,0x56(%ebx)
80101501:	8b 50 08             	mov    0x8(%eax),%edx
80101504:	89 53 58             	mov    %edx,0x58(%ebx)
80101507:	83 c4 0c             	add    $0xc,%esp
8010150a:	6a 34                	push   $0x34
8010150c:	83 c0 0c             	add    $0xc,%eax
8010150f:	50                   	push   %eax
80101510:	8d 43 5c             	lea    0x5c(%ebx),%eax
80101513:	50                   	push   %eax
80101514:	e8 7a 28 00 00       	call   80103d93 <memmove>
80101519:	89 34 24             	mov    %esi,(%esp)
8010151c:	e8 a0 ec ff ff       	call   801001c1 <brelse>
80101521:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
80101528:	83 c4 10             	add    $0x10,%esp
8010152b:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
80101530:	0f 85 72 ff ff ff    	jne    801014a8 <ilock+0x27>
80101536:	83 ec 0c             	sub    $0xc,%esp
80101539:	68 3f 65 10 80       	push   $0x8010653f
8010153e:	e8 ff ed ff ff       	call   80100342 <panic>

80101543 <iunlock>:
80101543:	55                   	push   %ebp
80101544:	89 e5                	mov    %esp,%ebp
80101546:	56                   	push   %esi
80101547:	53                   	push   %ebx
80101548:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010154b:	85 db                	test   %ebx,%ebx
8010154d:	74 2c                	je     8010157b <iunlock+0x38>
8010154f:	8d 73 0c             	lea    0xc(%ebx),%esi
80101552:	83 ec 0c             	sub    $0xc,%esp
80101555:	56                   	push   %esi
80101556:	e8 83 25 00 00       	call   80103ade <holdingsleep>
8010155b:	83 c4 10             	add    $0x10,%esp
8010155e:	85 c0                	test   %eax,%eax
80101560:	74 19                	je     8010157b <iunlock+0x38>
80101562:	83 7b 08 00          	cmpl   $0x0,0x8(%ebx)
80101566:	7e 13                	jle    8010157b <iunlock+0x38>
80101568:	83 ec 0c             	sub    $0xc,%esp
8010156b:	56                   	push   %esi
8010156c:	e8 32 25 00 00       	call   80103aa3 <releasesleep>
80101571:	83 c4 10             	add    $0x10,%esp
80101574:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101577:	5b                   	pop    %ebx
80101578:	5e                   	pop    %esi
80101579:	5d                   	pop    %ebp
8010157a:	c3                   	ret
8010157b:	83 ec 0c             	sub    $0xc,%esp
8010157e:	68 4e 65 10 80       	push   $0x8010654e
80101583:	e8 ba ed ff ff       	call   80100342 <panic>

80101588 <iput>:
80101588:	55                   	push   %ebp
80101589:	89 e5                	mov    %esp,%ebp
8010158b:	57                   	push   %edi
8010158c:	56                   	push   %esi
8010158d:	53                   	push   %ebx
8010158e:	83 ec 28             	sub    $0x28,%esp
80101591:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101594:	8d 7b 0c             	lea    0xc(%ebx),%edi
80101597:	57                   	push   %edi
80101598:	e8 b4 24 00 00       	call   80103a51 <acquiresleep>
8010159d:	83 c4 10             	add    $0x10,%esp
801015a0:	83 7b 4c 00          	cmpl   $0x0,0x4c(%ebx)
801015a4:	74 07                	je     801015ad <iput+0x25>
801015a6:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
801015ab:	74 30                	je     801015dd <iput+0x55>
801015ad:	83 ec 0c             	sub    $0xc,%esp
801015b0:	57                   	push   %edi
801015b1:	e8 ed 24 00 00       	call   80103aa3 <releasesleep>
801015b6:	c7 04 24 60 e9 10 80 	movl   $0x8010e960,(%esp)
801015bd:	e8 ac 26 00 00       	call   80103c6e <acquire>
801015c2:	83 6b 08 01          	subl   $0x1,0x8(%ebx)
801015c6:	c7 04 24 60 e9 10 80 	movl   $0x8010e960,(%esp)
801015cd:	e8 03 27 00 00       	call   80103cd5 <release>
801015d2:	83 c4 10             	add    $0x10,%esp
801015d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801015d8:	5b                   	pop    %ebx
801015d9:	5e                   	pop    %esi
801015da:	5f                   	pop    %edi
801015db:	5d                   	pop    %ebp
801015dc:	c3                   	ret
801015dd:	83 ec 0c             	sub    $0xc,%esp
801015e0:	68 60 e9 10 80       	push   $0x8010e960
801015e5:	e8 84 26 00 00       	call   80103c6e <acquire>
801015ea:	8b 73 08             	mov    0x8(%ebx),%esi
801015ed:	c7 04 24 60 e9 10 80 	movl   $0x8010e960,(%esp)
801015f4:	e8 dc 26 00 00       	call   80103cd5 <release>
801015f9:	83 c4 10             	add    $0x10,%esp
801015fc:	83 fe 01             	cmp    $0x1,%esi
801015ff:	75 ac                	jne    801015ad <iput+0x25>
80101601:	8d 73 5c             	lea    0x5c(%ebx),%esi
80101604:	8d 83 8c 00 00 00    	lea    0x8c(%ebx),%eax
8010160a:	89 7d e4             	mov    %edi,-0x1c(%ebp)
8010160d:	89 c7                	mov    %eax,%edi
8010160f:	eb 07                	jmp    80101618 <iput+0x90>
80101611:	83 c6 04             	add    $0x4,%esi
80101614:	39 fe                	cmp    %edi,%esi
80101616:	74 15                	je     8010162d <iput+0xa5>
80101618:	8b 16                	mov    (%esi),%edx
8010161a:	85 d2                	test   %edx,%edx
8010161c:	74 f3                	je     80101611 <iput+0x89>
8010161e:	8b 03                	mov    (%ebx),%eax
80101620:	e8 72 f9 ff ff       	call   80100f97 <bfree>
80101625:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
8010162b:	eb e4                	jmp    80101611 <iput+0x89>
8010162d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80101630:	8b 83 8c 00 00 00    	mov    0x8c(%ebx),%eax
80101636:	85 c0                	test   %eax,%eax
80101638:	75 2d                	jne    80101667 <iput+0xdf>
8010163a:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
80101641:	83 ec 0c             	sub    $0xc,%esp
80101644:	53                   	push   %ebx
80101645:	e8 8d fd ff ff       	call   801013d7 <iupdate>
8010164a:	66 c7 43 50 00 00    	movw   $0x0,0x50(%ebx)
80101650:	89 1c 24             	mov    %ebx,(%esp)
80101653:	e8 7f fd ff ff       	call   801013d7 <iupdate>
80101658:	c7 43 4c 00 00 00 00 	movl   $0x0,0x4c(%ebx)
8010165f:	83 c4 10             	add    $0x10,%esp
80101662:	e9 46 ff ff ff       	jmp    801015ad <iput+0x25>
80101667:	83 ec 08             	sub    $0x8,%esp
8010166a:	50                   	push   %eax
8010166b:	ff 33                	push   (%ebx)
8010166d:	e8 38 ea ff ff       	call   801000aa <bread>
80101672:	8d 70 5c             	lea    0x5c(%eax),%esi
80101675:	8d 88 5c 02 00 00    	lea    0x25c(%eax),%ecx
8010167b:	83 c4 10             	add    $0x10,%esp
8010167e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80101681:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101684:	89 cf                	mov    %ecx,%edi
80101686:	eb 07                	jmp    8010168f <iput+0x107>
80101688:	83 c6 04             	add    $0x4,%esi
8010168b:	39 fe                	cmp    %edi,%esi
8010168d:	74 0f                	je     8010169e <iput+0x116>
8010168f:	8b 16                	mov    (%esi),%edx
80101691:	85 d2                	test   %edx,%edx
80101693:	74 f3                	je     80101688 <iput+0x100>
80101695:	8b 03                	mov    (%ebx),%eax
80101697:	e8 fb f8 ff ff       	call   80100f97 <bfree>
8010169c:	eb ea                	jmp    80101688 <iput+0x100>
8010169e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801016a1:	8b 45 e0             	mov    -0x20(%ebp),%eax
801016a4:	83 ec 0c             	sub    $0xc,%esp
801016a7:	50                   	push   %eax
801016a8:	e8 14 eb ff ff       	call   801001c1 <brelse>
801016ad:	8b 93 8c 00 00 00    	mov    0x8c(%ebx),%edx
801016b3:	8b 03                	mov    (%ebx),%eax
801016b5:	e8 dd f8 ff ff       	call   80100f97 <bfree>
801016ba:	c7 83 8c 00 00 00 00 	movl   $0x0,0x8c(%ebx)
801016c1:	00 00 00 
801016c4:	83 c4 10             	add    $0x10,%esp
801016c7:	e9 6e ff ff ff       	jmp    8010163a <iput+0xb2>

801016cc <iunlockput>:
801016cc:	55                   	push   %ebp
801016cd:	89 e5                	mov    %esp,%ebp
801016cf:	53                   	push   %ebx
801016d0:	83 ec 10             	sub    $0x10,%esp
801016d3:	8b 5d 08             	mov    0x8(%ebp),%ebx
801016d6:	53                   	push   %ebx
801016d7:	e8 67 fe ff ff       	call   80101543 <iunlock>
801016dc:	89 1c 24             	mov    %ebx,(%esp)
801016df:	e8 a4 fe ff ff       	call   80101588 <iput>
801016e4:	83 c4 10             	add    $0x10,%esp
801016e7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801016ea:	c9                   	leave
801016eb:	c3                   	ret

801016ec <stati>:
801016ec:	55                   	push   %ebp
801016ed:	89 e5                	mov    %esp,%ebp
801016ef:	8b 55 08             	mov    0x8(%ebp),%edx
801016f2:	8b 45 0c             	mov    0xc(%ebp),%eax
801016f5:	8b 0a                	mov    (%edx),%ecx
801016f7:	89 48 04             	mov    %ecx,0x4(%eax)
801016fa:	8b 4a 04             	mov    0x4(%edx),%ecx
801016fd:	89 48 08             	mov    %ecx,0x8(%eax)
80101700:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
80101704:	66 89 08             	mov    %cx,(%eax)
80101707:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
8010170b:	66 89 48 0c          	mov    %cx,0xc(%eax)
8010170f:	8b 52 58             	mov    0x58(%edx),%edx
80101712:	89 50 10             	mov    %edx,0x10(%eax)
80101715:	5d                   	pop    %ebp
80101716:	c3                   	ret

80101717 <readi>:
80101717:	55                   	push   %ebp
80101718:	89 e5                	mov    %esp,%ebp
8010171a:	57                   	push   %edi
8010171b:	56                   	push   %esi
8010171c:	53                   	push   %ebx
8010171d:	83 ec 1c             	sub    $0x1c,%esp
80101720:	8b 4d 08             	mov    0x8(%ebp),%ecx
80101723:	8b 7d 10             	mov    0x10(%ebp),%edi
80101726:	66 83 79 50 03       	cmpw   $0x3,0x50(%ecx)
8010172b:	0f 84 9d 00 00 00    	je     801017ce <readi+0xb7>
80101731:	8b 41 58             	mov    0x58(%ecx),%eax
80101734:	39 f8                	cmp    %edi,%eax
80101736:	0f 82 c7 00 00 00    	jb     80101803 <readi+0xec>
8010173c:	89 fa                	mov    %edi,%edx
8010173e:	03 55 14             	add    0x14(%ebp),%edx
80101741:	0f 82 c3 00 00 00    	jb     8010180a <readi+0xf3>
80101747:	89 c3                	mov    %eax,%ebx
80101749:	29 fb                	sub    %edi,%ebx
8010174b:	39 d0                	cmp    %edx,%eax
8010174d:	0f 43 5d 14          	cmovae 0x14(%ebp),%ebx
80101751:	89 5d 14             	mov    %ebx,0x14(%ebp)
80101754:	85 db                	test   %ebx,%ebx
80101756:	74 6b                	je     801017c3 <readi+0xac>
80101758:	be 00 00 00 00       	mov    $0x0,%esi
8010175d:	89 4d 08             	mov    %ecx,0x8(%ebp)
80101760:	89 fa                	mov    %edi,%edx
80101762:	c1 ea 09             	shr    $0x9,%edx
80101765:	8b 45 08             	mov    0x8(%ebp),%eax
80101768:	e8 b6 f9 ff ff       	call   80101123 <bmap>
8010176d:	83 ec 08             	sub    $0x8,%esp
80101770:	50                   	push   %eax
80101771:	8b 45 08             	mov    0x8(%ebp),%eax
80101774:	ff 30                	push   (%eax)
80101776:	e8 2f e9 ff ff       	call   801000aa <bread>
8010177b:	89 c1                	mov    %eax,%ecx
8010177d:	89 f8                	mov    %edi,%eax
8010177f:	25 ff 01 00 00       	and    $0x1ff,%eax
80101784:	bb 00 02 00 00       	mov    $0x200,%ebx
80101789:	29 c3                	sub    %eax,%ebx
8010178b:	8b 55 14             	mov    0x14(%ebp),%edx
8010178e:	29 f2                	sub    %esi,%edx
80101790:	39 d3                	cmp    %edx,%ebx
80101792:	0f 47 da             	cmova  %edx,%ebx
80101795:	83 c4 0c             	add    $0xc,%esp
80101798:	53                   	push   %ebx
80101799:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
8010179c:	8d 44 01 5c          	lea    0x5c(%ecx,%eax,1),%eax
801017a0:	50                   	push   %eax
801017a1:	ff 75 0c             	push   0xc(%ebp)
801017a4:	e8 ea 25 00 00       	call   80103d93 <memmove>
801017a9:	83 c4 04             	add    $0x4,%esp
801017ac:	ff 75 e4             	push   -0x1c(%ebp)
801017af:	e8 0d ea ff ff       	call   801001c1 <brelse>
801017b4:	01 de                	add    %ebx,%esi
801017b6:	01 df                	add    %ebx,%edi
801017b8:	01 5d 0c             	add    %ebx,0xc(%ebp)
801017bb:	83 c4 10             	add    $0x10,%esp
801017be:	3b 75 14             	cmp    0x14(%ebp),%esi
801017c1:	72 9d                	jb     80101760 <readi+0x49>
801017c3:	8b 45 14             	mov    0x14(%ebp),%eax
801017c6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801017c9:	5b                   	pop    %ebx
801017ca:	5e                   	pop    %esi
801017cb:	5f                   	pop    %edi
801017cc:	5d                   	pop    %ebp
801017cd:	c3                   	ret
801017ce:	0f b7 41 52          	movzwl 0x52(%ecx),%eax
801017d2:	66 83 f8 09          	cmp    $0x9,%ax
801017d6:	77 1d                	ja     801017f5 <readi+0xde>
801017d8:	98                   	cwtl
801017d9:	8b 04 c5 00 e9 10 80 	mov    -0x7fef1700(,%eax,8),%eax
801017e0:	85 c0                	test   %eax,%eax
801017e2:	74 18                	je     801017fc <readi+0xe5>
801017e4:	83 ec 04             	sub    $0x4,%esp
801017e7:	ff 75 14             	push   0x14(%ebp)
801017ea:	ff 75 0c             	push   0xc(%ebp)
801017ed:	51                   	push   %ecx
801017ee:	ff d0                	call   *%eax
801017f0:	83 c4 10             	add    $0x10,%esp
801017f3:	eb d1                	jmp    801017c6 <readi+0xaf>
801017f5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801017fa:	eb ca                	jmp    801017c6 <readi+0xaf>
801017fc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101801:	eb c3                	jmp    801017c6 <readi+0xaf>
80101803:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101808:	eb bc                	jmp    801017c6 <readi+0xaf>
8010180a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010180f:	eb b5                	jmp    801017c6 <readi+0xaf>

80101811 <writei>:
80101811:	55                   	push   %ebp
80101812:	89 e5                	mov    %esp,%ebp
80101814:	57                   	push   %edi
80101815:	56                   	push   %esi
80101816:	53                   	push   %ebx
80101817:	83 ec 1c             	sub    $0x1c,%esp
8010181a:	8b 4d 08             	mov    0x8(%ebp),%ecx
8010181d:	8b 7d 10             	mov    0x10(%ebp),%edi
80101820:	66 83 79 50 03       	cmpw   $0x3,0x50(%ecx)
80101825:	0f 84 b0 00 00 00    	je     801018db <writei+0xca>
8010182b:	39 79 58             	cmp    %edi,0x58(%ecx)
8010182e:	0f 82 ed 00 00 00    	jb     80101921 <writei+0x110>
80101834:	89 f8                	mov    %edi,%eax
80101836:	03 45 14             	add    0x14(%ebp),%eax
80101839:	3d 00 18 01 00       	cmp    $0x11800,%eax
8010183e:	0f 87 e4 00 00 00    	ja     80101928 <writei+0x117>
80101844:	39 f8                	cmp    %edi,%eax
80101846:	0f 82 dc 00 00 00    	jb     80101928 <writei+0x117>
8010184c:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
80101850:	74 7e                	je     801018d0 <writei+0xbf>
80101852:	be 00 00 00 00       	mov    $0x0,%esi
80101857:	89 4d 08             	mov    %ecx,0x8(%ebp)
8010185a:	89 fa                	mov    %edi,%edx
8010185c:	c1 ea 09             	shr    $0x9,%edx
8010185f:	8b 45 08             	mov    0x8(%ebp),%eax
80101862:	e8 bc f8 ff ff       	call   80101123 <bmap>
80101867:	83 ec 08             	sub    $0x8,%esp
8010186a:	50                   	push   %eax
8010186b:	8b 45 08             	mov    0x8(%ebp),%eax
8010186e:	ff 30                	push   (%eax)
80101870:	e8 35 e8 ff ff       	call   801000aa <bread>
80101875:	89 c1                	mov    %eax,%ecx
80101877:	89 f8                	mov    %edi,%eax
80101879:	25 ff 01 00 00       	and    $0x1ff,%eax
8010187e:	bb 00 02 00 00       	mov    $0x200,%ebx
80101883:	29 c3                	sub    %eax,%ebx
80101885:	8b 55 14             	mov    0x14(%ebp),%edx
80101888:	29 f2                	sub    %esi,%edx
8010188a:	39 d3                	cmp    %edx,%ebx
8010188c:	0f 47 da             	cmova  %edx,%ebx
8010188f:	83 c4 0c             	add    $0xc,%esp
80101892:	53                   	push   %ebx
80101893:	ff 75 0c             	push   0xc(%ebp)
80101896:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101899:	8d 44 01 5c          	lea    0x5c(%ecx,%eax,1),%eax
8010189d:	50                   	push   %eax
8010189e:	e8 f0 24 00 00       	call   80103d93 <memmove>
801018a3:	83 c4 04             	add    $0x4,%esp
801018a6:	ff 75 e4             	push   -0x1c(%ebp)
801018a9:	e8 2a 10 00 00       	call   801028d8 <log_write>
801018ae:	83 c4 04             	add    $0x4,%esp
801018b1:	ff 75 e4             	push   -0x1c(%ebp)
801018b4:	e8 08 e9 ff ff       	call   801001c1 <brelse>
801018b9:	01 de                	add    %ebx,%esi
801018bb:	01 df                	add    %ebx,%edi
801018bd:	01 5d 0c             	add    %ebx,0xc(%ebp)
801018c0:	83 c4 10             	add    $0x10,%esp
801018c3:	3b 75 14             	cmp    0x14(%ebp),%esi
801018c6:	72 92                	jb     8010185a <writei+0x49>
801018c8:	8b 4d 08             	mov    0x8(%ebp),%ecx
801018cb:	39 79 58             	cmp    %edi,0x58(%ecx)
801018ce:	72 32                	jb     80101902 <writei+0xf1>
801018d0:	8b 45 14             	mov    0x14(%ebp),%eax
801018d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
801018d6:	5b                   	pop    %ebx
801018d7:	5e                   	pop    %esi
801018d8:	5f                   	pop    %edi
801018d9:	5d                   	pop    %ebp
801018da:	c3                   	ret
801018db:	0f b7 41 52          	movzwl 0x52(%ecx),%eax
801018df:	66 83 f8 09          	cmp    $0x9,%ax
801018e3:	77 2e                	ja     80101913 <writei+0x102>
801018e5:	98                   	cwtl
801018e6:	8b 04 c5 04 e9 10 80 	mov    -0x7fef16fc(,%eax,8),%eax
801018ed:	85 c0                	test   %eax,%eax
801018ef:	74 29                	je     8010191a <writei+0x109>
801018f1:	83 ec 04             	sub    $0x4,%esp
801018f4:	ff 75 14             	push   0x14(%ebp)
801018f7:	ff 75 0c             	push   0xc(%ebp)
801018fa:	51                   	push   %ecx
801018fb:	ff d0                	call   *%eax
801018fd:	83 c4 10             	add    $0x10,%esp
80101900:	eb d1                	jmp    801018d3 <writei+0xc2>
80101902:	89 79 58             	mov    %edi,0x58(%ecx)
80101905:	83 ec 0c             	sub    $0xc,%esp
80101908:	51                   	push   %ecx
80101909:	e8 c9 fa ff ff       	call   801013d7 <iupdate>
8010190e:	83 c4 10             	add    $0x10,%esp
80101911:	eb bd                	jmp    801018d0 <writei+0xbf>
80101913:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101918:	eb b9                	jmp    801018d3 <writei+0xc2>
8010191a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010191f:	eb b2                	jmp    801018d3 <writei+0xc2>
80101921:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101926:	eb ab                	jmp    801018d3 <writei+0xc2>
80101928:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010192d:	eb a4                	jmp    801018d3 <writei+0xc2>

8010192f <namecmp>:
8010192f:	55                   	push   %ebp
80101930:	89 e5                	mov    %esp,%ebp
80101932:	83 ec 0c             	sub    $0xc,%esp
80101935:	6a 0e                	push   $0xe
80101937:	ff 75 0c             	push   0xc(%ebp)
8010193a:	ff 75 08             	push   0x8(%ebp)
8010193d:	e8 b8 24 00 00       	call   80103dfa <strncmp>
80101942:	c9                   	leave
80101943:	c3                   	ret

80101944 <dirlookup>:
80101944:	55                   	push   %ebp
80101945:	89 e5                	mov    %esp,%ebp
80101947:	57                   	push   %edi
80101948:	56                   	push   %esi
80101949:	53                   	push   %ebx
8010194a:	83 ec 1c             	sub    $0x1c,%esp
8010194d:	8b 75 08             	mov    0x8(%ebp),%esi
80101950:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80101955:	75 15                	jne    8010196c <dirlookup+0x28>
80101957:	bb 00 00 00 00       	mov    $0x0,%ebx
8010195c:	8d 7d d8             	lea    -0x28(%ebp),%edi
8010195f:	b8 00 00 00 00       	mov    $0x0,%eax
80101964:	83 7e 58 00          	cmpl   $0x0,0x58(%esi)
80101968:	75 24                	jne    8010198e <dirlookup+0x4a>
8010196a:	eb 6e                	jmp    801019da <dirlookup+0x96>
8010196c:	83 ec 0c             	sub    $0xc,%esp
8010196f:	68 56 65 10 80       	push   $0x80106556
80101974:	e8 c9 e9 ff ff       	call   80100342 <panic>
80101979:	83 ec 0c             	sub    $0xc,%esp
8010197c:	68 68 65 10 80       	push   $0x80106568
80101981:	e8 bc e9 ff ff       	call   80100342 <panic>
80101986:	83 c3 10             	add    $0x10,%ebx
80101989:	3b 5e 58             	cmp    0x58(%esi),%ebx
8010198c:	73 47                	jae    801019d5 <dirlookup+0x91>
8010198e:	6a 10                	push   $0x10
80101990:	53                   	push   %ebx
80101991:	57                   	push   %edi
80101992:	56                   	push   %esi
80101993:	e8 7f fd ff ff       	call   80101717 <readi>
80101998:	83 c4 10             	add    $0x10,%esp
8010199b:	83 f8 10             	cmp    $0x10,%eax
8010199e:	75 d9                	jne    80101979 <dirlookup+0x35>
801019a0:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
801019a5:	74 df                	je     80101986 <dirlookup+0x42>
801019a7:	83 ec 08             	sub    $0x8,%esp
801019aa:	8d 45 da             	lea    -0x26(%ebp),%eax
801019ad:	50                   	push   %eax
801019ae:	ff 75 0c             	push   0xc(%ebp)
801019b1:	e8 79 ff ff ff       	call   8010192f <namecmp>
801019b6:	83 c4 10             	add    $0x10,%esp
801019b9:	85 c0                	test   %eax,%eax
801019bb:	75 c9                	jne    80101986 <dirlookup+0x42>
801019bd:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
801019c1:	74 05                	je     801019c8 <dirlookup+0x84>
801019c3:	8b 45 10             	mov    0x10(%ebp),%eax
801019c6:	89 18                	mov    %ebx,(%eax)
801019c8:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
801019cc:	8b 06                	mov    (%esi),%eax
801019ce:	e8 f6 f7 ff ff       	call   801011c9 <iget>
801019d3:	eb 05                	jmp    801019da <dirlookup+0x96>
801019d5:	b8 00 00 00 00       	mov    $0x0,%eax
801019da:	8d 65 f4             	lea    -0xc(%ebp),%esp
801019dd:	5b                   	pop    %ebx
801019de:	5e                   	pop    %esi
801019df:	5f                   	pop    %edi
801019e0:	5d                   	pop    %ebp
801019e1:	c3                   	ret

801019e2 <namex>:
801019e2:	55                   	push   %ebp
801019e3:	89 e5                	mov    %esp,%ebp
801019e5:	57                   	push   %edi
801019e6:	56                   	push   %esi
801019e7:	53                   	push   %ebx
801019e8:	83 ec 1c             	sub    $0x1c,%esp
801019eb:	89 c3                	mov    %eax,%ebx
801019ed:	89 55 dc             	mov    %edx,-0x24(%ebp)
801019f0:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
801019f3:	80 38 2f             	cmpb   $0x2f,(%eax)
801019f6:	74 1a                	je     80101a12 <namex+0x30>
801019f8:	e8 3e 18 00 00       	call   8010323b <myproc>
801019fd:	83 ec 0c             	sub    $0xc,%esp
80101a00:	ff 70 68             	push   0x68(%eax)
80101a03:	e8 4e fa ff ff       	call   80101456 <idup>
80101a08:	89 c7                	mov    %eax,%edi
80101a0a:	83 c4 10             	add    $0x10,%esp
80101a0d:	e9 c2 00 00 00       	jmp    80101ad4 <namex+0xf2>
80101a12:	ba 01 00 00 00       	mov    $0x1,%edx
80101a17:	b8 01 00 00 00       	mov    $0x1,%eax
80101a1c:	e8 a8 f7 ff ff       	call   801011c9 <iget>
80101a21:	89 c7                	mov    %eax,%edi
80101a23:	e9 ac 00 00 00       	jmp    80101ad4 <namex+0xf2>
80101a28:	83 ec 0c             	sub    $0xc,%esp
80101a2b:	57                   	push   %edi
80101a2c:	e8 9b fc ff ff       	call   801016cc <iunlockput>
80101a31:	83 c4 10             	add    $0x10,%esp
80101a34:	bf 00 00 00 00       	mov    $0x0,%edi
80101a39:	89 f8                	mov    %edi,%eax
80101a3b:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a3e:	5b                   	pop    %ebx
80101a3f:	5e                   	pop    %esi
80101a40:	5f                   	pop    %edi
80101a41:	5d                   	pop    %ebp
80101a42:	c3                   	ret
80101a43:	83 ec 0c             	sub    $0xc,%esp
80101a46:	57                   	push   %edi
80101a47:	e8 f7 fa ff ff       	call   80101543 <iunlock>
80101a4c:	83 c4 10             	add    $0x10,%esp
80101a4f:	eb e8                	jmp    80101a39 <namex+0x57>
80101a51:	83 ec 0c             	sub    $0xc,%esp
80101a54:	57                   	push   %edi
80101a55:	e8 72 fc ff ff       	call   801016cc <iunlockput>
80101a5a:	83 c4 10             	add    $0x10,%esp
80101a5d:	89 f7                	mov    %esi,%edi
80101a5f:	eb d8                	jmp    80101a39 <namex+0x57>
80101a61:	89 f0                	mov    %esi,%eax
80101a63:	29 d8                	sub    %ebx,%eax
80101a65:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101a68:	83 f8 0d             	cmp    $0xd,%eax
80101a6b:	0f 8e a5 00 00 00    	jle    80101b16 <namex+0x134>
80101a71:	83 ec 04             	sub    $0x4,%esp
80101a74:	6a 0e                	push   $0xe
80101a76:	53                   	push   %ebx
80101a77:	ff 75 e4             	push   -0x1c(%ebp)
80101a7a:	e8 14 23 00 00       	call   80103d93 <memmove>
80101a7f:	83 c4 10             	add    $0x10,%esp
80101a82:	89 f3                	mov    %esi,%ebx
80101a84:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80101a87:	75 08                	jne    80101a91 <namex+0xaf>
80101a89:	83 c3 01             	add    $0x1,%ebx
80101a8c:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80101a8f:	74 f8                	je     80101a89 <namex+0xa7>
80101a91:	83 ec 0c             	sub    $0xc,%esp
80101a94:	57                   	push   %edi
80101a95:	e8 e7 f9 ff ff       	call   80101481 <ilock>
80101a9a:	83 c4 10             	add    $0x10,%esp
80101a9d:	66 83 7f 50 01       	cmpw   $0x1,0x50(%edi)
80101aa2:	75 84                	jne    80101a28 <namex+0x46>
80101aa4:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
80101aa8:	74 05                	je     80101aaf <namex+0xcd>
80101aaa:	80 3b 00             	cmpb   $0x0,(%ebx)
80101aad:	74 94                	je     80101a43 <namex+0x61>
80101aaf:	83 ec 04             	sub    $0x4,%esp
80101ab2:	6a 00                	push   $0x0
80101ab4:	ff 75 e4             	push   -0x1c(%ebp)
80101ab7:	57                   	push   %edi
80101ab8:	e8 87 fe ff ff       	call   80101944 <dirlookup>
80101abd:	89 c6                	mov    %eax,%esi
80101abf:	83 c4 10             	add    $0x10,%esp
80101ac2:	85 c0                	test   %eax,%eax
80101ac4:	74 8b                	je     80101a51 <namex+0x6f>
80101ac6:	83 ec 0c             	sub    $0xc,%esp
80101ac9:	57                   	push   %edi
80101aca:	e8 fd fb ff ff       	call   801016cc <iunlockput>
80101acf:	83 c4 10             	add    $0x10,%esp
80101ad2:	89 f7                	mov    %esi,%edi
80101ad4:	0f b6 03             	movzbl (%ebx),%eax
80101ad7:	3c 2f                	cmp    $0x2f,%al
80101ad9:	75 0a                	jne    80101ae5 <namex+0x103>
80101adb:	83 c3 01             	add    $0x1,%ebx
80101ade:	0f b6 03             	movzbl (%ebx),%eax
80101ae1:	3c 2f                	cmp    $0x2f,%al
80101ae3:	74 f6                	je     80101adb <namex+0xf9>
80101ae5:	84 c0                	test   %al,%al
80101ae7:	74 4e                	je     80101b37 <namex+0x155>
80101ae9:	0f b6 03             	movzbl (%ebx),%eax
80101aec:	3c 2f                	cmp    $0x2f,%al
80101aee:	74 1d                	je     80101b0d <namex+0x12b>
80101af0:	84 c0                	test   %al,%al
80101af2:	74 19                	je     80101b0d <namex+0x12b>
80101af4:	89 de                	mov    %ebx,%esi
80101af6:	83 c6 01             	add    $0x1,%esi
80101af9:	0f b6 06             	movzbl (%esi),%eax
80101afc:	3c 2f                	cmp    $0x2f,%al
80101afe:	0f 84 5d ff ff ff    	je     80101a61 <namex+0x7f>
80101b04:	84 c0                	test   %al,%al
80101b06:	75 ee                	jne    80101af6 <namex+0x114>
80101b08:	e9 54 ff ff ff       	jmp    80101a61 <namex+0x7f>
80101b0d:	89 de                	mov    %ebx,%esi
80101b0f:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
80101b16:	83 ec 04             	sub    $0x4,%esp
80101b19:	ff 75 e0             	push   -0x20(%ebp)
80101b1c:	53                   	push   %ebx
80101b1d:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101b20:	53                   	push   %ebx
80101b21:	e8 6d 22 00 00       	call   80103d93 <memmove>
80101b26:	8b 4d e0             	mov    -0x20(%ebp),%ecx
80101b29:	c6 04 0b 00          	movb   $0x0,(%ebx,%ecx,1)
80101b2d:	83 c4 10             	add    $0x10,%esp
80101b30:	89 f3                	mov    %esi,%ebx
80101b32:	e9 4d ff ff ff       	jmp    80101a84 <namex+0xa2>
80101b37:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
80101b3b:	0f 84 f8 fe ff ff    	je     80101a39 <namex+0x57>
80101b41:	83 ec 0c             	sub    $0xc,%esp
80101b44:	57                   	push   %edi
80101b45:	e8 3e fa ff ff       	call   80101588 <iput>
80101b4a:	83 c4 10             	add    $0x10,%esp
80101b4d:	bf 00 00 00 00       	mov    $0x0,%edi
80101b52:	e9 e2 fe ff ff       	jmp    80101a39 <namex+0x57>

80101b57 <dirlink>:
80101b57:	55                   	push   %ebp
80101b58:	89 e5                	mov    %esp,%ebp
80101b5a:	57                   	push   %edi
80101b5b:	56                   	push   %esi
80101b5c:	53                   	push   %ebx
80101b5d:	83 ec 20             	sub    $0x20,%esp
80101b60:	8b 75 08             	mov    0x8(%ebp),%esi
80101b63:	6a 00                	push   $0x0
80101b65:	ff 75 0c             	push   0xc(%ebp)
80101b68:	56                   	push   %esi
80101b69:	e8 d6 fd ff ff       	call   80101944 <dirlookup>
80101b6e:	83 c4 10             	add    $0x10,%esp
80101b71:	85 c0                	test   %eax,%eax
80101b73:	75 6a                	jne    80101bdf <dirlink+0x88>
80101b75:	8b 5e 58             	mov    0x58(%esi),%ebx
80101b78:	85 db                	test   %ebx,%ebx
80101b7a:	74 29                	je     80101ba5 <dirlink+0x4e>
80101b7c:	bb 00 00 00 00       	mov    $0x0,%ebx
80101b81:	8d 7d d8             	lea    -0x28(%ebp),%edi
80101b84:	6a 10                	push   $0x10
80101b86:	53                   	push   %ebx
80101b87:	57                   	push   %edi
80101b88:	56                   	push   %esi
80101b89:	e8 89 fb ff ff       	call   80101717 <readi>
80101b8e:	83 c4 10             	add    $0x10,%esp
80101b91:	83 f8 10             	cmp    $0x10,%eax
80101b94:	75 5c                	jne    80101bf2 <dirlink+0x9b>
80101b96:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101b9b:	74 08                	je     80101ba5 <dirlink+0x4e>
80101b9d:	83 c3 10             	add    $0x10,%ebx
80101ba0:	3b 5e 58             	cmp    0x58(%esi),%ebx
80101ba3:	72 df                	jb     80101b84 <dirlink+0x2d>
80101ba5:	83 ec 04             	sub    $0x4,%esp
80101ba8:	6a 0e                	push   $0xe
80101baa:	ff 75 0c             	push   0xc(%ebp)
80101bad:	8d 7d d8             	lea    -0x28(%ebp),%edi
80101bb0:	8d 45 da             	lea    -0x26(%ebp),%eax
80101bb3:	50                   	push   %eax
80101bb4:	e8 83 22 00 00       	call   80103e3c <strncpy>
80101bb9:	8b 45 10             	mov    0x10(%ebp),%eax
80101bbc:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
80101bc0:	6a 10                	push   $0x10
80101bc2:	53                   	push   %ebx
80101bc3:	57                   	push   %edi
80101bc4:	56                   	push   %esi
80101bc5:	e8 47 fc ff ff       	call   80101811 <writei>
80101bca:	83 c4 20             	add    $0x20,%esp
80101bcd:	83 f8 10             	cmp    $0x10,%eax
80101bd0:	75 2d                	jne    80101bff <dirlink+0xa8>
80101bd2:	b8 00 00 00 00       	mov    $0x0,%eax
80101bd7:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101bda:	5b                   	pop    %ebx
80101bdb:	5e                   	pop    %esi
80101bdc:	5f                   	pop    %edi
80101bdd:	5d                   	pop    %ebp
80101bde:	c3                   	ret
80101bdf:	83 ec 0c             	sub    $0xc,%esp
80101be2:	50                   	push   %eax
80101be3:	e8 a0 f9 ff ff       	call   80101588 <iput>
80101be8:	83 c4 10             	add    $0x10,%esp
80101beb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101bf0:	eb e5                	jmp    80101bd7 <dirlink+0x80>
80101bf2:	83 ec 0c             	sub    $0xc,%esp
80101bf5:	68 77 65 10 80       	push   $0x80106577
80101bfa:	e8 43 e7 ff ff       	call   80100342 <panic>
80101bff:	83 ec 0c             	sub    $0xc,%esp
80101c02:	68 fd 67 10 80       	push   $0x801067fd
80101c07:	e8 36 e7 ff ff       	call   80100342 <panic>

80101c0c <namei>:
80101c0c:	55                   	push   %ebp
80101c0d:	89 e5                	mov    %esp,%ebp
80101c0f:	83 ec 18             	sub    $0x18,%esp
80101c12:	8d 4d ea             	lea    -0x16(%ebp),%ecx
80101c15:	ba 00 00 00 00       	mov    $0x0,%edx
80101c1a:	8b 45 08             	mov    0x8(%ebp),%eax
80101c1d:	e8 c0 fd ff ff       	call   801019e2 <namex>
80101c22:	c9                   	leave
80101c23:	c3                   	ret

80101c24 <nameiparent>:
80101c24:	55                   	push   %ebp
80101c25:	89 e5                	mov    %esp,%ebp
80101c27:	83 ec 08             	sub    $0x8,%esp
80101c2a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80101c2d:	ba 01 00 00 00       	mov    $0x1,%edx
80101c32:	8b 45 08             	mov    0x8(%ebp),%eax
80101c35:	e8 a8 fd ff ff       	call   801019e2 <namex>
80101c3a:	c9                   	leave
80101c3b:	c3                   	ret

80101c3c <idestart>:
80101c3c:	55                   	push   %ebp
80101c3d:	89 e5                	mov    %esp,%ebp
80101c3f:	56                   	push   %esi
80101c40:	53                   	push   %ebx
80101c41:	85 c0                	test   %eax,%eax
80101c43:	0f 84 8b 00 00 00    	je     80101cd4 <idestart+0x98>
80101c49:	89 c1                	mov    %eax,%ecx
80101c4b:	8b 58 08             	mov    0x8(%eax),%ebx
80101c4e:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
80101c54:	0f 87 87 00 00 00    	ja     80101ce1 <idestart+0xa5>
80101c5a:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101c5f:	ec                   	in     (%dx),%al
80101c60:	83 e0 c0             	and    $0xffffffc0,%eax
80101c63:	3c 40                	cmp    $0x40,%al
80101c65:	75 f8                	jne    80101c5f <idestart+0x23>
80101c67:	be 00 00 00 00       	mov    $0x0,%esi
80101c6c:	ba f6 03 00 00       	mov    $0x3f6,%edx
80101c71:	89 f0                	mov    %esi,%eax
80101c73:	ee                   	out    %al,(%dx)
80101c74:	b8 01 00 00 00       	mov    $0x1,%eax
80101c79:	ba f2 01 00 00       	mov    $0x1f2,%edx
80101c7e:	ee                   	out    %al,(%dx)
80101c7f:	ba f3 01 00 00       	mov    $0x1f3,%edx
80101c84:	89 d8                	mov    %ebx,%eax
80101c86:	ee                   	out    %al,(%dx)
80101c87:	89 d8                	mov    %ebx,%eax
80101c89:	c1 f8 08             	sar    $0x8,%eax
80101c8c:	ba f4 01 00 00       	mov    $0x1f4,%edx
80101c91:	ee                   	out    %al,(%dx)
80101c92:	ba f5 01 00 00       	mov    $0x1f5,%edx
80101c97:	89 f0                	mov    %esi,%eax
80101c99:	ee                   	out    %al,(%dx)
80101c9a:	0f b6 41 04          	movzbl 0x4(%ecx),%eax
80101c9e:	c1 e0 04             	shl    $0x4,%eax
80101ca1:	83 e0 10             	and    $0x10,%eax
80101ca4:	83 c8 e0             	or     $0xffffffe0,%eax
80101ca7:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101cac:	ee                   	out    %al,(%dx)
80101cad:	f6 01 04             	testb  $0x4,(%ecx)
80101cb0:	74 3c                	je     80101cee <idestart+0xb2>
80101cb2:	b8 30 00 00 00       	mov    $0x30,%eax
80101cb7:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101cbc:	ee                   	out    %al,(%dx)
80101cbd:	8d 71 5c             	lea    0x5c(%ecx),%esi
80101cc0:	b9 80 00 00 00       	mov    $0x80,%ecx
80101cc5:	ba f0 01 00 00       	mov    $0x1f0,%edx
80101cca:	fc                   	cld
80101ccb:	f3 6f                	rep outsl %ds:(%esi),(%dx)
80101ccd:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101cd0:	5b                   	pop    %ebx
80101cd1:	5e                   	pop    %esi
80101cd2:	5d                   	pop    %ebp
80101cd3:	c3                   	ret
80101cd4:	83 ec 0c             	sub    $0xc,%esp
80101cd7:	68 84 65 10 80       	push   $0x80106584
80101cdc:	e8 61 e6 ff ff       	call   80100342 <panic>
80101ce1:	83 ec 0c             	sub    $0xc,%esp
80101ce4:	68 8d 65 10 80       	push   $0x8010658d
80101ce9:	e8 54 e6 ff ff       	call   80100342 <panic>
80101cee:	b8 20 00 00 00       	mov    $0x20,%eax
80101cf3:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101cf8:	ee                   	out    %al,(%dx)
80101cf9:	eb d2                	jmp    80101ccd <idestart+0x91>

80101cfb <ideinit>:
80101cfb:	55                   	push   %ebp
80101cfc:	89 e5                	mov    %esp,%ebp
80101cfe:	83 ec 10             	sub    $0x10,%esp
80101d01:	68 9f 65 10 80       	push   $0x8010659f
80101d06:	68 00 06 11 80       	push   $0x80110600
80101d0b:	e8 18 1e 00 00       	call   80103b28 <initlock>
80101d10:	83 c4 08             	add    $0x8,%esp
80101d13:	a1 84 07 11 80       	mov    0x80110784,%eax
80101d18:	83 e8 01             	sub    $0x1,%eax
80101d1b:	50                   	push   %eax
80101d1c:	6a 0e                	push   $0xe
80101d1e:	e8 6c 02 00 00       	call   80101f8f <ioapicenable>
80101d23:	83 c4 10             	add    $0x10,%esp
80101d26:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101d2b:	ec                   	in     (%dx),%al
80101d2c:	83 e0 c0             	and    $0xffffffc0,%eax
80101d2f:	3c 40                	cmp    $0x40,%al
80101d31:	75 f8                	jne    80101d2b <ideinit+0x30>
80101d33:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
80101d38:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101d3d:	ee                   	out    %al,(%dx)
80101d3e:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101d43:	ec                   	in     (%dx),%al
80101d44:	84 c0                	test   %al,%al
80101d46:	75 0f                	jne    80101d57 <ideinit+0x5c>
80101d48:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
80101d4d:	83 e9 01             	sub    $0x1,%ecx
80101d50:	74 0f                	je     80101d61 <ideinit+0x66>
80101d52:	ec                   	in     (%dx),%al
80101d53:	84 c0                	test   %al,%al
80101d55:	74 f6                	je     80101d4d <ideinit+0x52>
80101d57:	c7 05 e0 05 11 80 01 	movl   $0x1,0x801105e0
80101d5e:	00 00 00 
80101d61:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
80101d66:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101d6b:	ee                   	out    %al,(%dx)
80101d6c:	c9                   	leave
80101d6d:	c3                   	ret

80101d6e <ideintr>:
80101d6e:	55                   	push   %ebp
80101d6f:	89 e5                	mov    %esp,%ebp
80101d71:	57                   	push   %edi
80101d72:	53                   	push   %ebx
80101d73:	83 ec 0c             	sub    $0xc,%esp
80101d76:	68 00 06 11 80       	push   $0x80110600
80101d7b:	e8 ee 1e 00 00       	call   80103c6e <acquire>
80101d80:	8b 1d e4 05 11 80    	mov    0x801105e4,%ebx
80101d86:	83 c4 10             	add    $0x10,%esp
80101d89:	85 db                	test   %ebx,%ebx
80101d8b:	74 48                	je     80101dd5 <ideintr+0x67>
80101d8d:	8b 43 58             	mov    0x58(%ebx),%eax
80101d90:	a3 e4 05 11 80       	mov    %eax,0x801105e4
80101d95:	f6 03 04             	testb  $0x4,(%ebx)
80101d98:	74 4d                	je     80101de7 <ideintr+0x79>
80101d9a:	8b 03                	mov    (%ebx),%eax
80101d9c:	83 e0 fb             	and    $0xfffffffb,%eax
80101d9f:	83 c8 02             	or     $0x2,%eax
80101da2:	89 03                	mov    %eax,(%ebx)
80101da4:	83 ec 0c             	sub    $0xc,%esp
80101da7:	53                   	push   %ebx
80101da8:	e8 ac 1a 00 00       	call   80103859 <wakeup>
80101dad:	a1 e4 05 11 80       	mov    0x801105e4,%eax
80101db2:	83 c4 10             	add    $0x10,%esp
80101db5:	85 c0                	test   %eax,%eax
80101db7:	74 05                	je     80101dbe <ideintr+0x50>
80101db9:	e8 7e fe ff ff       	call   80101c3c <idestart>
80101dbe:	83 ec 0c             	sub    $0xc,%esp
80101dc1:	68 00 06 11 80       	push   $0x80110600
80101dc6:	e8 0a 1f 00 00       	call   80103cd5 <release>
80101dcb:	83 c4 10             	add    $0x10,%esp
80101dce:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101dd1:	5b                   	pop    %ebx
80101dd2:	5f                   	pop    %edi
80101dd3:	5d                   	pop    %ebp
80101dd4:	c3                   	ret
80101dd5:	83 ec 0c             	sub    $0xc,%esp
80101dd8:	68 00 06 11 80       	push   $0x80110600
80101ddd:	e8 f3 1e 00 00       	call   80103cd5 <release>
80101de2:	83 c4 10             	add    $0x10,%esp
80101de5:	eb e7                	jmp    80101dce <ideintr+0x60>
80101de7:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101dec:	ec                   	in     (%dx),%al
80101ded:	89 c1                	mov    %eax,%ecx
80101def:	83 e1 c0             	and    $0xffffffc0,%ecx
80101df2:	80 f9 40             	cmp    $0x40,%cl
80101df5:	75 f5                	jne    80101dec <ideintr+0x7e>
80101df7:	a8 21                	test   $0x21,%al
80101df9:	75 9f                	jne    80101d9a <ideintr+0x2c>
80101dfb:	8d 7b 5c             	lea    0x5c(%ebx),%edi
80101dfe:	b9 80 00 00 00       	mov    $0x80,%ecx
80101e03:	ba f0 01 00 00       	mov    $0x1f0,%edx
80101e08:	fc                   	cld
80101e09:	f3 6d                	rep insl (%dx),%es:(%edi)
80101e0b:	eb 8d                	jmp    80101d9a <ideintr+0x2c>

80101e0d <iderw>:
80101e0d:	55                   	push   %ebp
80101e0e:	89 e5                	mov    %esp,%ebp
80101e10:	53                   	push   %ebx
80101e11:	83 ec 10             	sub    $0x10,%esp
80101e14:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101e17:	8d 43 0c             	lea    0xc(%ebx),%eax
80101e1a:	50                   	push   %eax
80101e1b:	e8 be 1c 00 00       	call   80103ade <holdingsleep>
80101e20:	83 c4 10             	add    $0x10,%esp
80101e23:	85 c0                	test   %eax,%eax
80101e25:	0f 84 91 00 00 00    	je     80101ebc <iderw+0xaf>
80101e2b:	8b 03                	mov    (%ebx),%eax
80101e2d:	83 e0 06             	and    $0x6,%eax
80101e30:	83 f8 02             	cmp    $0x2,%eax
80101e33:	0f 84 90 00 00 00    	je     80101ec9 <iderw+0xbc>
80101e39:	83 7b 04 00          	cmpl   $0x0,0x4(%ebx)
80101e3d:	74 0d                	je     80101e4c <iderw+0x3f>
80101e3f:	83 3d e0 05 11 80 00 	cmpl   $0x0,0x801105e0
80101e46:	0f 84 8a 00 00 00    	je     80101ed6 <iderw+0xc9>
80101e4c:	83 ec 0c             	sub    $0xc,%esp
80101e4f:	68 00 06 11 80       	push   $0x80110600
80101e54:	e8 15 1e 00 00       	call   80103c6e <acquire>
80101e59:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
80101e60:	a1 e4 05 11 80       	mov    0x801105e4,%eax
80101e65:	83 c4 10             	add    $0x10,%esp
80101e68:	85 c0                	test   %eax,%eax
80101e6a:	74 77                	je     80101ee3 <iderw+0xd6>
80101e6c:	89 c2                	mov    %eax,%edx
80101e6e:	8b 40 58             	mov    0x58(%eax),%eax
80101e71:	85 c0                	test   %eax,%eax
80101e73:	75 f7                	jne    80101e6c <iderw+0x5f>
80101e75:	83 c2 58             	add    $0x58,%edx
80101e78:	89 1a                	mov    %ebx,(%edx)
80101e7a:	39 1d e4 05 11 80    	cmp    %ebx,0x801105e4
80101e80:	74 68                	je     80101eea <iderw+0xdd>
80101e82:	8b 03                	mov    (%ebx),%eax
80101e84:	83 e0 06             	and    $0x6,%eax
80101e87:	83 f8 02             	cmp    $0x2,%eax
80101e8a:	74 1b                	je     80101ea7 <iderw+0x9a>
80101e8c:	83 ec 08             	sub    $0x8,%esp
80101e8f:	68 00 06 11 80       	push   $0x80110600
80101e94:	53                   	push   %ebx
80101e95:	e8 44 18 00 00       	call   801036de <sleep>
80101e9a:	8b 03                	mov    (%ebx),%eax
80101e9c:	83 e0 06             	and    $0x6,%eax
80101e9f:	83 c4 10             	add    $0x10,%esp
80101ea2:	83 f8 02             	cmp    $0x2,%eax
80101ea5:	75 e5                	jne    80101e8c <iderw+0x7f>
80101ea7:	83 ec 0c             	sub    $0xc,%esp
80101eaa:	68 00 06 11 80       	push   $0x80110600
80101eaf:	e8 21 1e 00 00       	call   80103cd5 <release>
80101eb4:	83 c4 10             	add    $0x10,%esp
80101eb7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101eba:	c9                   	leave
80101ebb:	c3                   	ret
80101ebc:	83 ec 0c             	sub    $0xc,%esp
80101ebf:	68 a3 65 10 80       	push   $0x801065a3
80101ec4:	e8 79 e4 ff ff       	call   80100342 <panic>
80101ec9:	83 ec 0c             	sub    $0xc,%esp
80101ecc:	68 b9 65 10 80       	push   $0x801065b9
80101ed1:	e8 6c e4 ff ff       	call   80100342 <panic>
80101ed6:	83 ec 0c             	sub    $0xc,%esp
80101ed9:	68 ce 65 10 80       	push   $0x801065ce
80101ede:	e8 5f e4 ff ff       	call   80100342 <panic>
80101ee3:	ba e4 05 11 80       	mov    $0x801105e4,%edx
80101ee8:	eb 8e                	jmp    80101e78 <iderw+0x6b>
80101eea:	89 d8                	mov    %ebx,%eax
80101eec:	e8 4b fd ff ff       	call   80101c3c <idestart>
80101ef1:	eb 8f                	jmp    80101e82 <iderw+0x75>

80101ef3 <ioapicinit>:
80101ef3:	55                   	push   %ebp
80101ef4:	89 e5                	mov    %esp,%ebp
80101ef6:	56                   	push   %esi
80101ef7:	53                   	push   %ebx
80101ef8:	c7 05 34 06 11 80 00 	movl   $0xfec00000,0x80110634
80101eff:	00 c0 fe 
80101f02:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
80101f09:	00 00 00 
80101f0c:	a1 34 06 11 80       	mov    0x80110634,%eax
80101f11:	8b 58 10             	mov    0x10(%eax),%ebx
80101f14:	c1 eb 10             	shr    $0x10,%ebx
80101f17:	0f b6 db             	movzbl %bl,%ebx
80101f1a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80101f20:	a1 34 06 11 80       	mov    0x80110634,%eax
80101f25:	8b 40 10             	mov    0x10(%eax),%eax
80101f28:	0f b6 15 80 07 11 80 	movzbl 0x80110780,%edx
80101f2f:	c1 e8 18             	shr    $0x18,%eax
80101f32:	39 c2                	cmp    %eax,%edx
80101f34:	75 47                	jne    80101f7d <ioapicinit+0x8a>
80101f36:	ba 10 00 00 00       	mov    $0x10,%edx
80101f3b:	b8 00 00 00 00       	mov    $0x0,%eax
80101f40:	8d 48 20             	lea    0x20(%eax),%ecx
80101f43:	81 c9 00 00 01 00    	or     $0x10000,%ecx
80101f49:	8b 35 34 06 11 80    	mov    0x80110634,%esi
80101f4f:	89 16                	mov    %edx,(%esi)
80101f51:	8b 35 34 06 11 80    	mov    0x80110634,%esi
80101f57:	89 4e 10             	mov    %ecx,0x10(%esi)
80101f5a:	8d 4a 01             	lea    0x1(%edx),%ecx
80101f5d:	89 0e                	mov    %ecx,(%esi)
80101f5f:	8b 0d 34 06 11 80    	mov    0x80110634,%ecx
80101f65:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
80101f6c:	83 c0 01             	add    $0x1,%eax
80101f6f:	83 c2 02             	add    $0x2,%edx
80101f72:	39 c3                	cmp    %eax,%ebx
80101f74:	7d ca                	jge    80101f40 <ioapicinit+0x4d>
80101f76:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101f79:	5b                   	pop    %ebx
80101f7a:	5e                   	pop    %esi
80101f7b:	5d                   	pop    %ebp
80101f7c:	c3                   	ret
80101f7d:	83 ec 0c             	sub    $0xc,%esp
80101f80:	68 b4 69 10 80       	push   $0x801069b4
80101f85:	e8 7f e6 ff ff       	call   80100609 <cprintf>
80101f8a:	83 c4 10             	add    $0x10,%esp
80101f8d:	eb a7                	jmp    80101f36 <ioapicinit+0x43>

80101f8f <ioapicenable>:
80101f8f:	55                   	push   %ebp
80101f90:	89 e5                	mov    %esp,%ebp
80101f92:	8b 45 08             	mov    0x8(%ebp),%eax
80101f95:	8d 50 20             	lea    0x20(%eax),%edx
80101f98:	8d 44 00 10          	lea    0x10(%eax,%eax,1),%eax
80101f9c:	8b 0d 34 06 11 80    	mov    0x80110634,%ecx
80101fa2:	89 01                	mov    %eax,(%ecx)
80101fa4:	8b 0d 34 06 11 80    	mov    0x80110634,%ecx
80101faa:	89 51 10             	mov    %edx,0x10(%ecx)
80101fad:	8b 55 0c             	mov    0xc(%ebp),%edx
80101fb0:	c1 e2 18             	shl    $0x18,%edx
80101fb3:	83 c0 01             	add    $0x1,%eax
80101fb6:	89 01                	mov    %eax,(%ecx)
80101fb8:	a1 34 06 11 80       	mov    0x80110634,%eax
80101fbd:	89 50 10             	mov    %edx,0x10(%eax)
80101fc0:	5d                   	pop    %ebp
80101fc1:	c3                   	ret

80101fc2 <kfree>:
80101fc2:	55                   	push   %ebp
80101fc3:	89 e5                	mov    %esp,%ebp
80101fc5:	53                   	push   %ebx
80101fc6:	83 ec 04             	sub    $0x4,%esp
80101fc9:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101fcc:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
80101fd2:	75 4c                	jne    80102020 <kfree+0x5e>
80101fd4:	81 fb d0 44 11 80    	cmp    $0x801144d0,%ebx
80101fda:	72 44                	jb     80102020 <kfree+0x5e>
80101fdc:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80101fe2:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
80101fe7:	77 37                	ja     80102020 <kfree+0x5e>
80101fe9:	83 ec 04             	sub    $0x4,%esp
80101fec:	68 00 10 00 00       	push   $0x1000
80101ff1:	6a 01                	push   $0x1
80101ff3:	53                   	push   %ebx
80101ff4:	e8 23 1d 00 00       	call   80103d1c <memset>
80101ff9:	83 c4 10             	add    $0x10,%esp
80101ffc:	83 3d 74 06 11 80 00 	cmpl   $0x0,0x80110674
80102003:	75 28                	jne    8010202d <kfree+0x6b>
80102005:	a1 78 06 11 80       	mov    0x80110678,%eax
8010200a:	89 03                	mov    %eax,(%ebx)
8010200c:	89 1d 78 06 11 80    	mov    %ebx,0x80110678
80102012:	83 3d 74 06 11 80 00 	cmpl   $0x0,0x80110674
80102019:	75 24                	jne    8010203f <kfree+0x7d>
8010201b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010201e:	c9                   	leave
8010201f:	c3                   	ret
80102020:	83 ec 0c             	sub    $0xc,%esp
80102023:	68 ec 65 10 80       	push   $0x801065ec
80102028:	e8 15 e3 ff ff       	call   80100342 <panic>
8010202d:	83 ec 0c             	sub    $0xc,%esp
80102030:	68 40 06 11 80       	push   $0x80110640
80102035:	e8 34 1c 00 00       	call   80103c6e <acquire>
8010203a:	83 c4 10             	add    $0x10,%esp
8010203d:	eb c6                	jmp    80102005 <kfree+0x43>
8010203f:	83 ec 0c             	sub    $0xc,%esp
80102042:	68 40 06 11 80       	push   $0x80110640
80102047:	e8 89 1c 00 00       	call   80103cd5 <release>
8010204c:	83 c4 10             	add    $0x10,%esp
8010204f:	eb ca                	jmp    8010201b <kfree+0x59>

80102051 <freerange>:
80102051:	55                   	push   %ebp
80102052:	89 e5                	mov    %esp,%ebp
80102054:	56                   	push   %esi
80102055:	53                   	push   %ebx
80102056:	8b 75 0c             	mov    0xc(%ebp),%esi
80102059:	8b 45 08             	mov    0x8(%ebp),%eax
8010205c:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102062:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80102068:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010206e:	39 de                	cmp    %ebx,%esi
80102070:	72 1c                	jb     8010208e <freerange+0x3d>
80102072:	83 ec 0c             	sub    $0xc,%esp
80102075:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010207b:	50                   	push   %eax
8010207c:	e8 41 ff ff ff       	call   80101fc2 <kfree>
80102081:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80102087:	83 c4 10             	add    $0x10,%esp
8010208a:	39 de                	cmp    %ebx,%esi
8010208c:	73 e4                	jae    80102072 <freerange+0x21>
8010208e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102091:	5b                   	pop    %ebx
80102092:	5e                   	pop    %esi
80102093:	5d                   	pop    %ebp
80102094:	c3                   	ret

80102095 <kinit1>:
80102095:	55                   	push   %ebp
80102096:	89 e5                	mov    %esp,%ebp
80102098:	83 ec 10             	sub    $0x10,%esp
8010209b:	68 f2 65 10 80       	push   $0x801065f2
801020a0:	68 40 06 11 80       	push   $0x80110640
801020a5:	e8 7e 1a 00 00       	call   80103b28 <initlock>
801020aa:	c7 05 74 06 11 80 00 	movl   $0x0,0x80110674
801020b1:	00 00 00 
801020b4:	83 c4 08             	add    $0x8,%esp
801020b7:	ff 75 0c             	push   0xc(%ebp)
801020ba:	ff 75 08             	push   0x8(%ebp)
801020bd:	e8 8f ff ff ff       	call   80102051 <freerange>
801020c2:	83 c4 10             	add    $0x10,%esp
801020c5:	c9                   	leave
801020c6:	c3                   	ret

801020c7 <kinit2>:
801020c7:	55                   	push   %ebp
801020c8:	89 e5                	mov    %esp,%ebp
801020ca:	83 ec 10             	sub    $0x10,%esp
801020cd:	ff 75 0c             	push   0xc(%ebp)
801020d0:	ff 75 08             	push   0x8(%ebp)
801020d3:	e8 79 ff ff ff       	call   80102051 <freerange>
801020d8:	c7 05 74 06 11 80 01 	movl   $0x1,0x80110674
801020df:	00 00 00 
801020e2:	83 c4 10             	add    $0x10,%esp
801020e5:	c9                   	leave
801020e6:	c3                   	ret

801020e7 <kalloc>:
801020e7:	55                   	push   %ebp
801020e8:	89 e5                	mov    %esp,%ebp
801020ea:	53                   	push   %ebx
801020eb:	83 ec 04             	sub    $0x4,%esp
801020ee:	83 3d 74 06 11 80 00 	cmpl   $0x0,0x80110674
801020f5:	75 21                	jne    80102118 <kalloc+0x31>
801020f7:	8b 1d 78 06 11 80    	mov    0x80110678,%ebx
801020fd:	85 db                	test   %ebx,%ebx
801020ff:	74 10                	je     80102111 <kalloc+0x2a>
80102101:	8b 03                	mov    (%ebx),%eax
80102103:	a3 78 06 11 80       	mov    %eax,0x80110678
80102108:	83 3d 74 06 11 80 00 	cmpl   $0x0,0x80110674
8010210f:	75 23                	jne    80102134 <kalloc+0x4d>
80102111:	89 d8                	mov    %ebx,%eax
80102113:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102116:	c9                   	leave
80102117:	c3                   	ret
80102118:	83 ec 0c             	sub    $0xc,%esp
8010211b:	68 40 06 11 80       	push   $0x80110640
80102120:	e8 49 1b 00 00       	call   80103c6e <acquire>
80102125:	8b 1d 78 06 11 80    	mov    0x80110678,%ebx
8010212b:	83 c4 10             	add    $0x10,%esp
8010212e:	85 db                	test   %ebx,%ebx
80102130:	75 cf                	jne    80102101 <kalloc+0x1a>
80102132:	eb d4                	jmp    80102108 <kalloc+0x21>
80102134:	83 ec 0c             	sub    $0xc,%esp
80102137:	68 40 06 11 80       	push   $0x80110640
8010213c:	e8 94 1b 00 00       	call   80103cd5 <release>
80102141:	83 c4 10             	add    $0x10,%esp
80102144:	eb cb                	jmp    80102111 <kalloc+0x2a>

80102146 <kbdgetc>:
80102146:	ba 64 00 00 00       	mov    $0x64,%edx
8010214b:	ec                   	in     (%dx),%al
8010214c:	a8 01                	test   $0x1,%al
8010214e:	0f 84 ad 00 00 00    	je     80102201 <kbdgetc+0xbb>
80102154:	ba 60 00 00 00       	mov    $0x60,%edx
80102159:	ec                   	in     (%dx),%al
8010215a:	0f b6 c8             	movzbl %al,%ecx
8010215d:	3c e0                	cmp    $0xe0,%al
8010215f:	74 5b                	je     801021bc <kbdgetc+0x76>
80102161:	84 c0                	test   %al,%al
80102163:	78 64                	js     801021c9 <kbdgetc+0x83>
80102165:	8b 15 7c 06 11 80    	mov    0x8011067c,%edx
8010216b:	f6 c2 40             	test   $0x40,%dl
8010216e:	74 0f                	je     8010217f <kbdgetc+0x39>
80102170:	83 c8 80             	or     $0xffffff80,%eax
80102173:	0f b6 c8             	movzbl %al,%ecx
80102176:	83 e2 bf             	and    $0xffffffbf,%edx
80102179:	89 15 7c 06 11 80    	mov    %edx,0x8011067c
8010217f:	0f b6 91 40 6c 10 80 	movzbl -0x7fef93c0(%ecx),%edx
80102186:	0b 15 7c 06 11 80    	or     0x8011067c,%edx
8010218c:	0f b6 81 40 6b 10 80 	movzbl -0x7fef94c0(%ecx),%eax
80102193:	31 c2                	xor    %eax,%edx
80102195:	89 15 7c 06 11 80    	mov    %edx,0x8011067c
8010219b:	89 d0                	mov    %edx,%eax
8010219d:	83 e0 03             	and    $0x3,%eax
801021a0:	8b 04 85 20 6b 10 80 	mov    -0x7fef94e0(,%eax,4),%eax
801021a7:	0f b6 04 08          	movzbl (%eax,%ecx,1),%eax
801021ab:	f6 c2 08             	test   $0x8,%dl
801021ae:	74 56                	je     80102206 <kbdgetc+0xc0>
801021b0:	8d 50 9f             	lea    -0x61(%eax),%edx
801021b3:	83 fa 19             	cmp    $0x19,%edx
801021b6:	77 3c                	ja     801021f4 <kbdgetc+0xae>
801021b8:	83 e8 20             	sub    $0x20,%eax
801021bb:	c3                   	ret
801021bc:	83 0d 7c 06 11 80 40 	orl    $0x40,0x8011067c
801021c3:	b8 00 00 00 00       	mov    $0x0,%eax
801021c8:	c3                   	ret
801021c9:	8b 15 7c 06 11 80    	mov    0x8011067c,%edx
801021cf:	83 e0 7f             	and    $0x7f,%eax
801021d2:	f6 c2 40             	test   $0x40,%dl
801021d5:	0f 44 c8             	cmove  %eax,%ecx
801021d8:	0f b6 81 40 6c 10 80 	movzbl -0x7fef93c0(%ecx),%eax
801021df:	83 c8 40             	or     $0x40,%eax
801021e2:	0f b6 c0             	movzbl %al,%eax
801021e5:	f7 d0                	not    %eax
801021e7:	21 d0                	and    %edx,%eax
801021e9:	a3 7c 06 11 80       	mov    %eax,0x8011067c
801021ee:	b8 00 00 00 00       	mov    $0x0,%eax
801021f3:	c3                   	ret
801021f4:	8d 48 bf             	lea    -0x41(%eax),%ecx
801021f7:	8d 50 20             	lea    0x20(%eax),%edx
801021fa:	83 f9 1a             	cmp    $0x1a,%ecx
801021fd:	0f 42 c2             	cmovb  %edx,%eax
80102200:	c3                   	ret
80102201:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80102206:	c3                   	ret

80102207 <kbdintr>:
80102207:	55                   	push   %ebp
80102208:	89 e5                	mov    %esp,%ebp
8010220a:	83 ec 14             	sub    $0x14,%esp
8010220d:	68 46 21 10 80       	push   $0x80102146
80102212:	e8 55 e5 ff ff       	call   8010076c <consoleintr>
80102217:	83 c4 10             	add    $0x10,%esp
8010221a:	c9                   	leave
8010221b:	c3                   	ret

8010221c <lapicw>:
8010221c:	8b 0d 80 06 11 80    	mov    0x80110680,%ecx
80102222:	8d 04 81             	lea    (%ecx,%eax,4),%eax
80102225:	89 10                	mov    %edx,(%eax)
80102227:	a1 80 06 11 80       	mov    0x80110680,%eax
8010222c:	8b 40 20             	mov    0x20(%eax),%eax
8010222f:	c3                   	ret

80102230 <fill_rtcdate>:
80102230:	55                   	push   %ebp
80102231:	89 e5                	mov    %esp,%ebp
80102233:	56                   	push   %esi
80102234:	53                   	push   %ebx
80102235:	89 c1                	mov    %eax,%ecx
80102237:	be 70 00 00 00       	mov    $0x70,%esi
8010223c:	b8 00 00 00 00       	mov    $0x0,%eax
80102241:	89 f2                	mov    %esi,%edx
80102243:	ee                   	out    %al,(%dx)
80102244:	bb 71 00 00 00       	mov    $0x71,%ebx
80102249:	89 da                	mov    %ebx,%edx
8010224b:	ec                   	in     (%dx),%al
8010224c:	0f b6 c0             	movzbl %al,%eax
8010224f:	89 01                	mov    %eax,(%ecx)
80102251:	b8 02 00 00 00       	mov    $0x2,%eax
80102256:	89 f2                	mov    %esi,%edx
80102258:	ee                   	out    %al,(%dx)
80102259:	89 da                	mov    %ebx,%edx
8010225b:	ec                   	in     (%dx),%al
8010225c:	0f b6 c0             	movzbl %al,%eax
8010225f:	89 41 04             	mov    %eax,0x4(%ecx)
80102262:	b8 04 00 00 00       	mov    $0x4,%eax
80102267:	89 f2                	mov    %esi,%edx
80102269:	ee                   	out    %al,(%dx)
8010226a:	89 da                	mov    %ebx,%edx
8010226c:	ec                   	in     (%dx),%al
8010226d:	0f b6 c0             	movzbl %al,%eax
80102270:	89 41 08             	mov    %eax,0x8(%ecx)
80102273:	b8 07 00 00 00       	mov    $0x7,%eax
80102278:	89 f2                	mov    %esi,%edx
8010227a:	ee                   	out    %al,(%dx)
8010227b:	89 da                	mov    %ebx,%edx
8010227d:	ec                   	in     (%dx),%al
8010227e:	0f b6 c0             	movzbl %al,%eax
80102281:	89 41 0c             	mov    %eax,0xc(%ecx)
80102284:	b8 08 00 00 00       	mov    $0x8,%eax
80102289:	89 f2                	mov    %esi,%edx
8010228b:	ee                   	out    %al,(%dx)
8010228c:	89 da                	mov    %ebx,%edx
8010228e:	ec                   	in     (%dx),%al
8010228f:	0f b6 c0             	movzbl %al,%eax
80102292:	89 41 10             	mov    %eax,0x10(%ecx)
80102295:	b8 09 00 00 00       	mov    $0x9,%eax
8010229a:	89 f2                	mov    %esi,%edx
8010229c:	ee                   	out    %al,(%dx)
8010229d:	89 da                	mov    %ebx,%edx
8010229f:	ec                   	in     (%dx),%al
801022a0:	0f b6 c0             	movzbl %al,%eax
801022a3:	89 41 14             	mov    %eax,0x14(%ecx)
801022a6:	5b                   	pop    %ebx
801022a7:	5e                   	pop    %esi
801022a8:	5d                   	pop    %ebp
801022a9:	c3                   	ret

801022aa <lapicinit>:
801022aa:	83 3d 80 06 11 80 00 	cmpl   $0x0,0x80110680
801022b1:	0f 84 ff 00 00 00    	je     801023b6 <lapicinit+0x10c>
801022b7:	55                   	push   %ebp
801022b8:	89 e5                	mov    %esp,%ebp
801022ba:	83 ec 08             	sub    $0x8,%esp
801022bd:	ba 3f 01 00 00       	mov    $0x13f,%edx
801022c2:	b8 3c 00 00 00       	mov    $0x3c,%eax
801022c7:	e8 50 ff ff ff       	call   8010221c <lapicw>
801022cc:	ba 0b 00 00 00       	mov    $0xb,%edx
801022d1:	b8 f8 00 00 00       	mov    $0xf8,%eax
801022d6:	e8 41 ff ff ff       	call   8010221c <lapicw>
801022db:	ba 20 00 02 00       	mov    $0x20020,%edx
801022e0:	b8 c8 00 00 00       	mov    $0xc8,%eax
801022e5:	e8 32 ff ff ff       	call   8010221c <lapicw>
801022ea:	ba 80 96 98 00       	mov    $0x989680,%edx
801022ef:	b8 e0 00 00 00       	mov    $0xe0,%eax
801022f4:	e8 23 ff ff ff       	call   8010221c <lapicw>
801022f9:	ba 00 00 01 00       	mov    $0x10000,%edx
801022fe:	b8 d4 00 00 00       	mov    $0xd4,%eax
80102303:	e8 14 ff ff ff       	call   8010221c <lapicw>
80102308:	ba 00 00 01 00       	mov    $0x10000,%edx
8010230d:	b8 d8 00 00 00       	mov    $0xd8,%eax
80102312:	e8 05 ff ff ff       	call   8010221c <lapicw>
80102317:	a1 80 06 11 80       	mov    0x80110680,%eax
8010231c:	8b 40 30             	mov    0x30(%eax),%eax
8010231f:	a9 00 00 fc 00       	test   $0xfc0000,%eax
80102324:	75 7c                	jne    801023a2 <lapicinit+0xf8>
80102326:	ba 33 00 00 00       	mov    $0x33,%edx
8010232b:	b8 dc 00 00 00       	mov    $0xdc,%eax
80102330:	e8 e7 fe ff ff       	call   8010221c <lapicw>
80102335:	ba 00 00 00 00       	mov    $0x0,%edx
8010233a:	b8 a0 00 00 00       	mov    $0xa0,%eax
8010233f:	e8 d8 fe ff ff       	call   8010221c <lapicw>
80102344:	ba 00 00 00 00       	mov    $0x0,%edx
80102349:	b8 a0 00 00 00       	mov    $0xa0,%eax
8010234e:	e8 c9 fe ff ff       	call   8010221c <lapicw>
80102353:	ba 00 00 00 00       	mov    $0x0,%edx
80102358:	b8 2c 00 00 00       	mov    $0x2c,%eax
8010235d:	e8 ba fe ff ff       	call   8010221c <lapicw>
80102362:	ba 00 00 00 00       	mov    $0x0,%edx
80102367:	b8 c4 00 00 00       	mov    $0xc4,%eax
8010236c:	e8 ab fe ff ff       	call   8010221c <lapicw>
80102371:	ba 00 85 08 00       	mov    $0x88500,%edx
80102376:	b8 c0 00 00 00       	mov    $0xc0,%eax
8010237b:	e8 9c fe ff ff       	call   8010221c <lapicw>
80102380:	8b 15 80 06 11 80    	mov    0x80110680,%edx
80102386:	8b 82 00 03 00 00    	mov    0x300(%edx),%eax
8010238c:	f6 c4 10             	test   $0x10,%ah
8010238f:	75 f5                	jne    80102386 <lapicinit+0xdc>
80102391:	ba 00 00 00 00       	mov    $0x0,%edx
80102396:	b8 20 00 00 00       	mov    $0x20,%eax
8010239b:	e8 7c fe ff ff       	call   8010221c <lapicw>
801023a0:	c9                   	leave
801023a1:	c3                   	ret
801023a2:	ba 00 00 01 00       	mov    $0x10000,%edx
801023a7:	b8 d0 00 00 00       	mov    $0xd0,%eax
801023ac:	e8 6b fe ff ff       	call   8010221c <lapicw>
801023b1:	e9 70 ff ff ff       	jmp    80102326 <lapicinit+0x7c>
801023b6:	c3                   	ret

801023b7 <lapicid>:
801023b7:	a1 80 06 11 80       	mov    0x80110680,%eax
801023bc:	85 c0                	test   %eax,%eax
801023be:	74 07                	je     801023c7 <lapicid+0x10>
801023c0:	8b 40 20             	mov    0x20(%eax),%eax
801023c3:	c1 e8 18             	shr    $0x18,%eax
801023c6:	c3                   	ret
801023c7:	b8 00 00 00 00       	mov    $0x0,%eax
801023cc:	c3                   	ret

801023cd <lapiceoi>:
801023cd:	83 3d 80 06 11 80 00 	cmpl   $0x0,0x80110680
801023d4:	74 17                	je     801023ed <lapiceoi+0x20>
801023d6:	55                   	push   %ebp
801023d7:	89 e5                	mov    %esp,%ebp
801023d9:	83 ec 08             	sub    $0x8,%esp
801023dc:	ba 00 00 00 00       	mov    $0x0,%edx
801023e1:	b8 2c 00 00 00       	mov    $0x2c,%eax
801023e6:	e8 31 fe ff ff       	call   8010221c <lapicw>
801023eb:	c9                   	leave
801023ec:	c3                   	ret
801023ed:	c3                   	ret

801023ee <microdelay>:
801023ee:	c3                   	ret

801023ef <lapicstartap>:
801023ef:	55                   	push   %ebp
801023f0:	89 e5                	mov    %esp,%ebp
801023f2:	56                   	push   %esi
801023f3:	53                   	push   %ebx
801023f4:	8b 75 08             	mov    0x8(%ebp),%esi
801023f7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
801023fa:	b8 0f 00 00 00       	mov    $0xf,%eax
801023ff:	ba 70 00 00 00       	mov    $0x70,%edx
80102404:	ee                   	out    %al,(%dx)
80102405:	b8 0a 00 00 00       	mov    $0xa,%eax
8010240a:	ba 71 00 00 00       	mov    $0x71,%edx
8010240f:	ee                   	out    %al,(%dx)
80102410:	66 c7 05 67 04 00 80 	movw   $0x0,0x80000467
80102417:	00 00 
80102419:	89 d8                	mov    %ebx,%eax
8010241b:	c1 e8 04             	shr    $0x4,%eax
8010241e:	66 a3 69 04 00 80    	mov    %ax,0x80000469
80102424:	c1 e6 18             	shl    $0x18,%esi
80102427:	89 f2                	mov    %esi,%edx
80102429:	b8 c4 00 00 00       	mov    $0xc4,%eax
8010242e:	e8 e9 fd ff ff       	call   8010221c <lapicw>
80102433:	ba 00 c5 00 00       	mov    $0xc500,%edx
80102438:	b8 c0 00 00 00       	mov    $0xc0,%eax
8010243d:	e8 da fd ff ff       	call   8010221c <lapicw>
80102442:	ba 00 85 00 00       	mov    $0x8500,%edx
80102447:	b8 c0 00 00 00       	mov    $0xc0,%eax
8010244c:	e8 cb fd ff ff       	call   8010221c <lapicw>
80102451:	c1 eb 0c             	shr    $0xc,%ebx
80102454:	80 cf 06             	or     $0x6,%bh
80102457:	89 f2                	mov    %esi,%edx
80102459:	b8 c4 00 00 00       	mov    $0xc4,%eax
8010245e:	e8 b9 fd ff ff       	call   8010221c <lapicw>
80102463:	89 da                	mov    %ebx,%edx
80102465:	b8 c0 00 00 00       	mov    $0xc0,%eax
8010246a:	e8 ad fd ff ff       	call   8010221c <lapicw>
8010246f:	89 f2                	mov    %esi,%edx
80102471:	b8 c4 00 00 00       	mov    $0xc4,%eax
80102476:	e8 a1 fd ff ff       	call   8010221c <lapicw>
8010247b:	89 da                	mov    %ebx,%edx
8010247d:	b8 c0 00 00 00       	mov    $0xc0,%eax
80102482:	e8 95 fd ff ff       	call   8010221c <lapicw>
80102487:	5b                   	pop    %ebx
80102488:	5e                   	pop    %esi
80102489:	5d                   	pop    %ebp
8010248a:	c3                   	ret

8010248b <cmostime>:
8010248b:	55                   	push   %ebp
8010248c:	89 e5                	mov    %esp,%ebp
8010248e:	57                   	push   %edi
8010248f:	56                   	push   %esi
80102490:	53                   	push   %ebx
80102491:	83 ec 4c             	sub    $0x4c,%esp
80102494:	b8 0b 00 00 00       	mov    $0xb,%eax
80102499:	ba 70 00 00 00       	mov    $0x70,%edx
8010249e:	ee                   	out    %al,(%dx)
8010249f:	ba 71 00 00 00       	mov    $0x71,%edx
801024a4:	ec                   	in     (%dx),%al
801024a5:	83 e0 04             	and    $0x4,%eax
801024a8:	88 45 b7             	mov    %al,-0x49(%ebp)
801024ab:	8d 75 d0             	lea    -0x30(%ebp),%esi
801024ae:	bf 0a 00 00 00       	mov    $0xa,%edi
801024b3:	89 f0                	mov    %esi,%eax
801024b5:	e8 76 fd ff ff       	call   80102230 <fill_rtcdate>
801024ba:	ba 70 00 00 00       	mov    $0x70,%edx
801024bf:	89 f8                	mov    %edi,%eax
801024c1:	ee                   	out    %al,(%dx)
801024c2:	ba 71 00 00 00       	mov    $0x71,%edx
801024c7:	ec                   	in     (%dx),%al
801024c8:	84 c0                	test   %al,%al
801024ca:	78 e7                	js     801024b3 <cmostime+0x28>
801024cc:	8d 5d b8             	lea    -0x48(%ebp),%ebx
801024cf:	89 d8                	mov    %ebx,%eax
801024d1:	e8 5a fd ff ff       	call   80102230 <fill_rtcdate>
801024d6:	83 ec 04             	sub    $0x4,%esp
801024d9:	6a 18                	push   $0x18
801024db:	53                   	push   %ebx
801024dc:	56                   	push   %esi
801024dd:	e8 6f 18 00 00       	call   80103d51 <memcmp>
801024e2:	83 c4 10             	add    $0x10,%esp
801024e5:	85 c0                	test   %eax,%eax
801024e7:	75 ca                	jne    801024b3 <cmostime+0x28>
801024e9:	80 7d b7 00          	cmpb   $0x0,-0x49(%ebp)
801024ed:	75 78                	jne    80102567 <cmostime+0xdc>
801024ef:	8b 45 d0             	mov    -0x30(%ebp),%eax
801024f2:	89 c2                	mov    %eax,%edx
801024f4:	c1 ea 04             	shr    $0x4,%edx
801024f7:	8d 14 92             	lea    (%edx,%edx,4),%edx
801024fa:	83 e0 0f             	and    $0xf,%eax
801024fd:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102500:	89 45 d0             	mov    %eax,-0x30(%ebp)
80102503:	8b 45 d4             	mov    -0x2c(%ebp),%eax
80102506:	89 c2                	mov    %eax,%edx
80102508:	c1 ea 04             	shr    $0x4,%edx
8010250b:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010250e:	83 e0 0f             	and    $0xf,%eax
80102511:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102514:	89 45 d4             	mov    %eax,-0x2c(%ebp)
80102517:	8b 45 d8             	mov    -0x28(%ebp),%eax
8010251a:	89 c2                	mov    %eax,%edx
8010251c:	c1 ea 04             	shr    $0x4,%edx
8010251f:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102522:	83 e0 0f             	and    $0xf,%eax
80102525:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102528:	89 45 d8             	mov    %eax,-0x28(%ebp)
8010252b:	8b 45 dc             	mov    -0x24(%ebp),%eax
8010252e:	89 c2                	mov    %eax,%edx
80102530:	c1 ea 04             	shr    $0x4,%edx
80102533:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102536:	83 e0 0f             	and    $0xf,%eax
80102539:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010253c:	89 45 dc             	mov    %eax,-0x24(%ebp)
8010253f:	8b 45 e0             	mov    -0x20(%ebp),%eax
80102542:	89 c2                	mov    %eax,%edx
80102544:	c1 ea 04             	shr    $0x4,%edx
80102547:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010254a:	83 e0 0f             	and    $0xf,%eax
8010254d:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102550:	89 45 e0             	mov    %eax,-0x20(%ebp)
80102553:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80102556:	89 c2                	mov    %eax,%edx
80102558:	c1 ea 04             	shr    $0x4,%edx
8010255b:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010255e:	83 e0 0f             	and    $0xf,%eax
80102561:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102564:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80102567:	8b 45 d0             	mov    -0x30(%ebp),%eax
8010256a:	8b 4d 08             	mov    0x8(%ebp),%ecx
8010256d:	89 01                	mov    %eax,(%ecx)
8010256f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
80102572:	89 41 04             	mov    %eax,0x4(%ecx)
80102575:	8b 45 d8             	mov    -0x28(%ebp),%eax
80102578:	89 41 08             	mov    %eax,0x8(%ecx)
8010257b:	8b 45 dc             	mov    -0x24(%ebp),%eax
8010257e:	89 41 0c             	mov    %eax,0xc(%ecx)
80102581:	8b 45 e0             	mov    -0x20(%ebp),%eax
80102584:	89 41 10             	mov    %eax,0x10(%ecx)
80102587:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010258a:	89 41 14             	mov    %eax,0x14(%ecx)
8010258d:	81 41 14 d0 07 00 00 	addl   $0x7d0,0x14(%ecx)
80102594:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102597:	5b                   	pop    %ebx
80102598:	5e                   	pop    %esi
80102599:	5f                   	pop    %edi
8010259a:	5d                   	pop    %ebp
8010259b:	c3                   	ret

8010259c <install_trans>:
8010259c:	83 3d e8 06 11 80 00 	cmpl   $0x0,0x801106e8
801025a3:	0f 8e 84 00 00 00    	jle    8010262d <install_trans+0x91>
801025a9:	55                   	push   %ebp
801025aa:	89 e5                	mov    %esp,%ebp
801025ac:	57                   	push   %edi
801025ad:	56                   	push   %esi
801025ae:	53                   	push   %ebx
801025af:	83 ec 1c             	sub    $0x1c,%esp
801025b2:	be 00 00 00 00       	mov    $0x0,%esi
801025b7:	bf a0 06 11 80       	mov    $0x801106a0,%edi
801025bc:	83 ec 08             	sub    $0x8,%esp
801025bf:	89 f0                	mov    %esi,%eax
801025c1:	03 47 34             	add    0x34(%edi),%eax
801025c4:	83 c0 01             	add    $0x1,%eax
801025c7:	50                   	push   %eax
801025c8:	ff 77 44             	push   0x44(%edi)
801025cb:	e8 da da ff ff       	call   801000aa <bread>
801025d0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801025d3:	83 c4 08             	add    $0x8,%esp
801025d6:	ff 34 b5 ec 06 11 80 	push   -0x7feef914(,%esi,4)
801025dd:	ff 77 44             	push   0x44(%edi)
801025e0:	e8 c5 da ff ff       	call   801000aa <bread>
801025e5:	89 c3                	mov    %eax,%ebx
801025e7:	83 c4 0c             	add    $0xc,%esp
801025ea:	68 00 02 00 00       	push   $0x200
801025ef:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801025f2:	83 c0 5c             	add    $0x5c,%eax
801025f5:	50                   	push   %eax
801025f6:	8d 43 5c             	lea    0x5c(%ebx),%eax
801025f9:	50                   	push   %eax
801025fa:	e8 94 17 00 00       	call   80103d93 <memmove>
801025ff:	89 1c 24             	mov    %ebx,(%esp)
80102602:	e8 7f db ff ff       	call   80100186 <bwrite>
80102607:	83 c4 04             	add    $0x4,%esp
8010260a:	ff 75 e4             	push   -0x1c(%ebp)
8010260d:	e8 af db ff ff       	call   801001c1 <brelse>
80102612:	89 1c 24             	mov    %ebx,(%esp)
80102615:	e8 a7 db ff ff       	call   801001c1 <brelse>
8010261a:	83 c6 01             	add    $0x1,%esi
8010261d:	83 c4 10             	add    $0x10,%esp
80102620:	39 77 48             	cmp    %esi,0x48(%edi)
80102623:	7f 97                	jg     801025bc <install_trans+0x20>
80102625:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102628:	5b                   	pop    %ebx
80102629:	5e                   	pop    %esi
8010262a:	5f                   	pop    %edi
8010262b:	5d                   	pop    %ebp
8010262c:	c3                   	ret
8010262d:	c3                   	ret

8010262e <write_head>:
8010262e:	55                   	push   %ebp
8010262f:	89 e5                	mov    %esp,%ebp
80102631:	53                   	push   %ebx
80102632:	83 ec 0c             	sub    $0xc,%esp
80102635:	ff 35 d4 06 11 80    	push   0x801106d4
8010263b:	ff 35 e4 06 11 80    	push   0x801106e4
80102641:	e8 64 da ff ff       	call   801000aa <bread>
80102646:	89 c3                	mov    %eax,%ebx
80102648:	8b 0d e8 06 11 80    	mov    0x801106e8,%ecx
8010264e:	89 48 5c             	mov    %ecx,0x5c(%eax)
80102651:	83 c4 10             	add    $0x10,%esp
80102654:	85 c9                	test   %ecx,%ecx
80102656:	7e 17                	jle    8010266f <write_head+0x41>
80102658:	b8 00 00 00 00       	mov    $0x0,%eax
8010265d:	8b 14 85 ec 06 11 80 	mov    -0x7feef914(,%eax,4),%edx
80102664:	89 54 83 60          	mov    %edx,0x60(%ebx,%eax,4)
80102668:	83 c0 01             	add    $0x1,%eax
8010266b:	39 c1                	cmp    %eax,%ecx
8010266d:	75 ee                	jne    8010265d <write_head+0x2f>
8010266f:	83 ec 0c             	sub    $0xc,%esp
80102672:	53                   	push   %ebx
80102673:	e8 0e db ff ff       	call   80100186 <bwrite>
80102678:	89 1c 24             	mov    %ebx,(%esp)
8010267b:	e8 41 db ff ff       	call   801001c1 <brelse>
80102680:	83 c4 10             	add    $0x10,%esp
80102683:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102686:	c9                   	leave
80102687:	c3                   	ret

80102688 <initlog>:
80102688:	55                   	push   %ebp
80102689:	89 e5                	mov    %esp,%ebp
8010268b:	53                   	push   %ebx
8010268c:	83 ec 2c             	sub    $0x2c,%esp
8010268f:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102692:	68 f7 65 10 80       	push   $0x801065f7
80102697:	68 a0 06 11 80       	push   $0x801106a0
8010269c:	e8 87 14 00 00       	call   80103b28 <initlock>
801026a1:	83 c4 08             	add    $0x8,%esp
801026a4:	8d 45 dc             	lea    -0x24(%ebp),%eax
801026a7:	50                   	push   %eax
801026a8:	53                   	push   %ebx
801026a9:	e8 c3 eb ff ff       	call   80101271 <readsb>
801026ae:	8b 45 ec             	mov    -0x14(%ebp),%eax
801026b1:	a3 d4 06 11 80       	mov    %eax,0x801106d4
801026b6:	8b 55 e8             	mov    -0x18(%ebp),%edx
801026b9:	89 15 d8 06 11 80    	mov    %edx,0x801106d8
801026bf:	89 1d e4 06 11 80    	mov    %ebx,0x801106e4
801026c5:	83 c4 08             	add    $0x8,%esp
801026c8:	50                   	push   %eax
801026c9:	53                   	push   %ebx
801026ca:	e8 db d9 ff ff       	call   801000aa <bread>
801026cf:	8b 58 5c             	mov    0x5c(%eax),%ebx
801026d2:	89 1d e8 06 11 80    	mov    %ebx,0x801106e8
801026d8:	83 c4 10             	add    $0x10,%esp
801026db:	85 db                	test   %ebx,%ebx
801026dd:	7e 17                	jle    801026f6 <initlog+0x6e>
801026df:	ba 00 00 00 00       	mov    $0x0,%edx
801026e4:	8b 4c 90 60          	mov    0x60(%eax,%edx,4),%ecx
801026e8:	89 0c 95 ec 06 11 80 	mov    %ecx,-0x7feef914(,%edx,4)
801026ef:	83 c2 01             	add    $0x1,%edx
801026f2:	39 d3                	cmp    %edx,%ebx
801026f4:	75 ee                	jne    801026e4 <initlog+0x5c>
801026f6:	83 ec 0c             	sub    $0xc,%esp
801026f9:	50                   	push   %eax
801026fa:	e8 c2 da ff ff       	call   801001c1 <brelse>
801026ff:	e8 98 fe ff ff       	call   8010259c <install_trans>
80102704:	c7 05 e8 06 11 80 00 	movl   $0x0,0x801106e8
8010270b:	00 00 00 
8010270e:	e8 1b ff ff ff       	call   8010262e <write_head>
80102713:	83 c4 10             	add    $0x10,%esp
80102716:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102719:	c9                   	leave
8010271a:	c3                   	ret

8010271b <begin_op>:
8010271b:	55                   	push   %ebp
8010271c:	89 e5                	mov    %esp,%ebp
8010271e:	53                   	push   %ebx
8010271f:	83 ec 10             	sub    $0x10,%esp
80102722:	68 a0 06 11 80       	push   $0x801106a0
80102727:	e8 42 15 00 00       	call   80103c6e <acquire>
8010272c:	83 c4 10             	add    $0x10,%esp
8010272f:	bb a0 06 11 80       	mov    $0x801106a0,%ebx
80102734:	eb 15                	jmp    8010274b <begin_op+0x30>
80102736:	83 ec 08             	sub    $0x8,%esp
80102739:	68 a0 06 11 80       	push   $0x801106a0
8010273e:	68 a0 06 11 80       	push   $0x801106a0
80102743:	e8 96 0f 00 00       	call   801036de <sleep>
80102748:	83 c4 10             	add    $0x10,%esp
8010274b:	83 7b 40 00          	cmpl   $0x0,0x40(%ebx)
8010274f:	75 e5                	jne    80102736 <begin_op+0x1b>
80102751:	8b 43 3c             	mov    0x3c(%ebx),%eax
80102754:	83 c0 01             	add    $0x1,%eax
80102757:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
8010275a:	8b 53 48             	mov    0x48(%ebx),%edx
8010275d:	8d 14 4a             	lea    (%edx,%ecx,2),%edx
80102760:	83 fa 1e             	cmp    $0x1e,%edx
80102763:	7e 17                	jle    8010277c <begin_op+0x61>
80102765:	83 ec 08             	sub    $0x8,%esp
80102768:	68 a0 06 11 80       	push   $0x801106a0
8010276d:	68 a0 06 11 80       	push   $0x801106a0
80102772:	e8 67 0f 00 00       	call   801036de <sleep>
80102777:	83 c4 10             	add    $0x10,%esp
8010277a:	eb cf                	jmp    8010274b <begin_op+0x30>
8010277c:	a3 dc 06 11 80       	mov    %eax,0x801106dc
80102781:	83 ec 0c             	sub    $0xc,%esp
80102784:	68 a0 06 11 80       	push   $0x801106a0
80102789:	e8 47 15 00 00       	call   80103cd5 <release>
8010278e:	83 c4 10             	add    $0x10,%esp
80102791:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102794:	c9                   	leave
80102795:	c3                   	ret

80102796 <end_op>:
80102796:	55                   	push   %ebp
80102797:	89 e5                	mov    %esp,%ebp
80102799:	57                   	push   %edi
8010279a:	56                   	push   %esi
8010279b:	53                   	push   %ebx
8010279c:	83 ec 28             	sub    $0x28,%esp
8010279f:	68 a0 06 11 80       	push   $0x801106a0
801027a4:	e8 c5 14 00 00       	call   80103c6e <acquire>
801027a9:	a1 dc 06 11 80       	mov    0x801106dc,%eax
801027ae:	8d 58 ff             	lea    -0x1(%eax),%ebx
801027b1:	89 1d dc 06 11 80    	mov    %ebx,0x801106dc
801027b7:	83 c4 10             	add    $0x10,%esp
801027ba:	83 3d e0 06 11 80 00 	cmpl   $0x0,0x801106e0
801027c1:	75 60                	jne    80102823 <end_op+0x8d>
801027c3:	85 db                	test   %ebx,%ebx
801027c5:	75 69                	jne    80102830 <end_op+0x9a>
801027c7:	c7 05 e0 06 11 80 01 	movl   $0x1,0x801106e0
801027ce:	00 00 00 
801027d1:	83 ec 0c             	sub    $0xc,%esp
801027d4:	68 a0 06 11 80       	push   $0x801106a0
801027d9:	e8 f7 14 00 00       	call   80103cd5 <release>
801027de:	83 c4 10             	add    $0x10,%esp
801027e1:	bf a0 06 11 80       	mov    $0x801106a0,%edi
801027e6:	83 3d e8 06 11 80 00 	cmpl   $0x0,0x801106e8
801027ed:	7f 65                	jg     80102854 <end_op+0xbe>
801027ef:	83 ec 0c             	sub    $0xc,%esp
801027f2:	68 a0 06 11 80       	push   $0x801106a0
801027f7:	e8 72 14 00 00       	call   80103c6e <acquire>
801027fc:	c7 05 e0 06 11 80 00 	movl   $0x0,0x801106e0
80102803:	00 00 00 
80102806:	c7 04 24 a0 06 11 80 	movl   $0x801106a0,(%esp)
8010280d:	e8 47 10 00 00       	call   80103859 <wakeup>
80102812:	c7 04 24 a0 06 11 80 	movl   $0x801106a0,(%esp)
80102819:	e8 b7 14 00 00       	call   80103cd5 <release>
8010281e:	83 c4 10             	add    $0x10,%esp
80102821:	eb 29                	jmp    8010284c <end_op+0xb6>
80102823:	83 ec 0c             	sub    $0xc,%esp
80102826:	68 fb 65 10 80       	push   $0x801065fb
8010282b:	e8 12 db ff ff       	call   80100342 <panic>
80102830:	83 ec 0c             	sub    $0xc,%esp
80102833:	68 a0 06 11 80       	push   $0x801106a0
80102838:	e8 1c 10 00 00       	call   80103859 <wakeup>
8010283d:	c7 04 24 a0 06 11 80 	movl   $0x801106a0,(%esp)
80102844:	e8 8c 14 00 00       	call   80103cd5 <release>
80102849:	83 c4 10             	add    $0x10,%esp
8010284c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010284f:	5b                   	pop    %ebx
80102850:	5e                   	pop    %esi
80102851:	5f                   	pop    %edi
80102852:	5d                   	pop    %ebp
80102853:	c3                   	ret
80102854:	83 ec 08             	sub    $0x8,%esp
80102857:	89 d8                	mov    %ebx,%eax
80102859:	03 47 34             	add    0x34(%edi),%eax
8010285c:	83 c0 01             	add    $0x1,%eax
8010285f:	50                   	push   %eax
80102860:	ff 77 44             	push   0x44(%edi)
80102863:	e8 42 d8 ff ff       	call   801000aa <bread>
80102868:	89 c6                	mov    %eax,%esi
8010286a:	83 c4 08             	add    $0x8,%esp
8010286d:	ff 34 9d ec 06 11 80 	push   -0x7feef914(,%ebx,4)
80102874:	ff 77 44             	push   0x44(%edi)
80102877:	e8 2e d8 ff ff       	call   801000aa <bread>
8010287c:	83 c4 0c             	add    $0xc,%esp
8010287f:	68 00 02 00 00       	push   $0x200
80102884:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80102887:	83 c0 5c             	add    $0x5c,%eax
8010288a:	50                   	push   %eax
8010288b:	8d 46 5c             	lea    0x5c(%esi),%eax
8010288e:	50                   	push   %eax
8010288f:	e8 ff 14 00 00       	call   80103d93 <memmove>
80102894:	89 34 24             	mov    %esi,(%esp)
80102897:	e8 ea d8 ff ff       	call   80100186 <bwrite>
8010289c:	83 c4 04             	add    $0x4,%esp
8010289f:	ff 75 e4             	push   -0x1c(%ebp)
801028a2:	e8 1a d9 ff ff       	call   801001c1 <brelse>
801028a7:	89 34 24             	mov    %esi,(%esp)
801028aa:	e8 12 d9 ff ff       	call   801001c1 <brelse>
801028af:	83 c3 01             	add    $0x1,%ebx
801028b2:	83 c4 10             	add    $0x10,%esp
801028b5:	3b 5f 48             	cmp    0x48(%edi),%ebx
801028b8:	7c 9a                	jl     80102854 <end_op+0xbe>
801028ba:	e8 6f fd ff ff       	call   8010262e <write_head>
801028bf:	e8 d8 fc ff ff       	call   8010259c <install_trans>
801028c4:	c7 05 e8 06 11 80 00 	movl   $0x0,0x801106e8
801028cb:	00 00 00 
801028ce:	e8 5b fd ff ff       	call   8010262e <write_head>
801028d3:	e9 17 ff ff ff       	jmp    801027ef <end_op+0x59>

801028d8 <log_write>:
801028d8:	55                   	push   %ebp
801028d9:	89 e5                	mov    %esp,%ebp
801028db:	53                   	push   %ebx
801028dc:	83 ec 04             	sub    $0x4,%esp
801028df:	8b 5d 08             	mov    0x8(%ebp),%ebx
801028e2:	8b 15 e8 06 11 80    	mov    0x801106e8,%edx
801028e8:	83 fa 1d             	cmp    $0x1d,%edx
801028eb:	7f 5c                	jg     80102949 <log_write+0x71>
801028ed:	a1 d8 06 11 80       	mov    0x801106d8,%eax
801028f2:	83 e8 01             	sub    $0x1,%eax
801028f5:	39 c2                	cmp    %eax,%edx
801028f7:	7d 50                	jge    80102949 <log_write+0x71>
801028f9:	83 3d dc 06 11 80 00 	cmpl   $0x0,0x801106dc
80102900:	7e 54                	jle    80102956 <log_write+0x7e>
80102902:	83 ec 0c             	sub    $0xc,%esp
80102905:	68 a0 06 11 80       	push   $0x801106a0
8010290a:	e8 5f 13 00 00       	call   80103c6e <acquire>
8010290f:	8b 15 e8 06 11 80    	mov    0x801106e8,%edx
80102915:	83 c4 10             	add    $0x10,%esp
80102918:	85 d2                	test   %edx,%edx
8010291a:	7e 47                	jle    80102963 <log_write+0x8b>
8010291c:	8b 4b 08             	mov    0x8(%ebx),%ecx
8010291f:	b8 00 00 00 00       	mov    $0x0,%eax
80102924:	39 0c 85 ec 06 11 80 	cmp    %ecx,-0x7feef914(,%eax,4)
8010292b:	74 3b                	je     80102968 <log_write+0x90>
8010292d:	83 c0 01             	add    $0x1,%eax
80102930:	39 d0                	cmp    %edx,%eax
80102932:	75 f0                	jne    80102924 <log_write+0x4c>
80102934:	8b 43 08             	mov    0x8(%ebx),%eax
80102937:	89 04 95 ec 06 11 80 	mov    %eax,-0x7feef914(,%edx,4)
8010293e:	83 c2 01             	add    $0x1,%edx
80102941:	89 15 e8 06 11 80    	mov    %edx,0x801106e8
80102947:	eb 2d                	jmp    80102976 <log_write+0x9e>
80102949:	83 ec 0c             	sub    $0xc,%esp
8010294c:	68 0a 66 10 80       	push   $0x8010660a
80102951:	e8 ec d9 ff ff       	call   80100342 <panic>
80102956:	83 ec 0c             	sub    $0xc,%esp
80102959:	68 20 66 10 80       	push   $0x80106620
8010295e:	e8 df d9 ff ff       	call   80100342 <panic>
80102963:	b8 00 00 00 00       	mov    $0x0,%eax
80102968:	8b 4b 08             	mov    0x8(%ebx),%ecx
8010296b:	89 0c 85 ec 06 11 80 	mov    %ecx,-0x7feef914(,%eax,4)
80102972:	39 c2                	cmp    %eax,%edx
80102974:	74 15                	je     8010298b <log_write+0xb3>
80102976:	83 0b 04             	orl    $0x4,(%ebx)
80102979:	83 ec 0c             	sub    $0xc,%esp
8010297c:	68 a0 06 11 80       	push   $0x801106a0
80102981:	e8 4f 13 00 00       	call   80103cd5 <release>
80102986:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102989:	c9                   	leave
8010298a:	c3                   	ret
8010298b:	89 c2                	mov    %eax,%edx
8010298d:	eb af                	jmp    8010293e <log_write+0x66>

8010298f <mpmain>:
8010298f:	55                   	push   %ebp
80102990:	89 e5                	mov    %esp,%ebp
80102992:	53                   	push   %ebx
80102993:	83 ec 04             	sub    $0x4,%esp
80102996:	e8 85 08 00 00       	call   80103220 <cpuid>
8010299b:	89 c3                	mov    %eax,%ebx
8010299d:	e8 7e 08 00 00       	call   80103220 <cpuid>
801029a2:	83 ec 04             	sub    $0x4,%esp
801029a5:	53                   	push   %ebx
801029a6:	50                   	push   %eax
801029a7:	68 3b 66 10 80       	push   $0x8010663b
801029ac:	e8 58 dc ff ff       	call   80100609 <cprintf>
801029b1:	e8 71 24 00 00       	call   80104e27 <idtinit>
801029b6:	e8 06 08 00 00       	call   801031c1 <mycpu>
801029bb:	89 c2                	mov    %eax,%edx
801029bd:	b8 01 00 00 00       	mov    $0x1,%eax
801029c2:	f0 87 82 a0 00 00 00 	lock xchg %eax,0xa0(%edx)
801029c9:	e8 e9 0a 00 00       	call   801034b7 <scheduler>

801029ce <mpenter>:
801029ce:	55                   	push   %ebp
801029cf:	89 e5                	mov    %esp,%ebp
801029d1:	83 ec 08             	sub    $0x8,%esp
801029d4:	e8 ee 33 00 00       	call   80105dc7 <switchkvm>
801029d9:	e8 02 33 00 00       	call   80105ce0 <seginit>
801029de:	e8 c7 f8 ff ff       	call   801022aa <lapicinit>
801029e3:	e8 a7 ff ff ff       	call   8010298f <mpmain>

801029e8 <main>:
801029e8:	8d 4c 24 04          	lea    0x4(%esp),%ecx
801029ec:	83 e4 f0             	and    $0xfffffff0,%esp
801029ef:	ff 71 fc             	push   -0x4(%ecx)
801029f2:	55                   	push   %ebp
801029f3:	89 e5                	mov    %esp,%ebp
801029f5:	53                   	push   %ebx
801029f6:	51                   	push   %ecx
801029f7:	83 ec 08             	sub    $0x8,%esp
801029fa:	68 00 00 40 80       	push   $0x80400000
801029ff:	68 d0 44 11 80       	push   $0x801144d0
80102a04:	e8 8c f6 ff ff       	call   80102095 <kinit1>
80102a09:	e8 1c 38 00 00       	call   8010622a <kvmalloc>
80102a0e:	e8 58 01 00 00       	call   80102b6b <mpinit>
80102a13:	e8 92 f8 ff ff       	call   801022aa <lapicinit>
80102a18:	e8 c3 32 00 00       	call   80105ce0 <seginit>
80102a1d:	e8 0c 03 00 00       	call   80102d2e <picinit>
80102a22:	e8 cc f4 ff ff       	call   80101ef3 <ioapicinit>
80102a27:	e8 c3 de ff ff       	call   801008ef <consoleinit>
80102a2c:	e8 9c 26 00 00       	call   801050cd <uartinit>
80102a31:	e8 71 07 00 00       	call   801031a7 <pinit>
80102a36:	e8 61 23 00 00       	call   80104d9c <tvinit>
80102a3b:	e8 f4 d5 ff ff       	call   80100034 <binit>
80102a40:	e8 0c e2 ff ff       	call   80100c51 <fileinit>
80102a45:	e8 b1 f2 ff ff       	call   80101cfb <ideinit>
80102a4a:	83 c4 0c             	add    $0xc,%esp
80102a4d:	68 8a 00 00 00       	push   $0x8a
80102a52:	68 8c 94 10 80       	push   $0x8010948c
80102a57:	68 00 70 00 80       	push   $0x80007000
80102a5c:	e8 32 13 00 00       	call   80103d93 <memmove>
80102a61:	69 05 84 07 11 80 b0 	imul   $0xb0,0x80110784,%eax
80102a68:	00 00 00 
80102a6b:	05 a0 07 11 80       	add    $0x801107a0,%eax
80102a70:	83 c4 10             	add    $0x10,%esp
80102a73:	3d a0 07 11 80       	cmp    $0x801107a0,%eax
80102a78:	76 6c                	jbe    80102ae6 <main+0xfe>
80102a7a:	bb a0 07 11 80       	mov    $0x801107a0,%ebx
80102a7f:	eb 19                	jmp    80102a9a <main+0xb2>
80102a81:	81 c3 b0 00 00 00    	add    $0xb0,%ebx
80102a87:	69 05 84 07 11 80 b0 	imul   $0xb0,0x80110784,%eax
80102a8e:	00 00 00 
80102a91:	05 a0 07 11 80       	add    $0x801107a0,%eax
80102a96:	39 c3                	cmp    %eax,%ebx
80102a98:	73 4c                	jae    80102ae6 <main+0xfe>
80102a9a:	e8 22 07 00 00       	call   801031c1 <mycpu>
80102a9f:	39 c3                	cmp    %eax,%ebx
80102aa1:	74 de                	je     80102a81 <main+0x99>
80102aa3:	e8 3f f6 ff ff       	call   801020e7 <kalloc>
80102aa8:	05 00 10 00 00       	add    $0x1000,%eax
80102aad:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc
80102ab2:	c7 05 f8 6f 00 80 ce 	movl   $0x801029ce,0x80006ff8
80102ab9:	29 10 80 
80102abc:	c7 05 f4 6f 00 80 00 	movl   $0x108000,0x80006ff4
80102ac3:	80 10 00 
80102ac6:	83 ec 08             	sub    $0x8,%esp
80102ac9:	68 00 70 00 00       	push   $0x7000
80102ace:	0f b6 03             	movzbl (%ebx),%eax
80102ad1:	50                   	push   %eax
80102ad2:	e8 18 f9 ff ff       	call   801023ef <lapicstartap>
80102ad7:	83 c4 10             	add    $0x10,%esp
80102ada:	8b 83 a0 00 00 00    	mov    0xa0(%ebx),%eax
80102ae0:	85 c0                	test   %eax,%eax
80102ae2:	74 f6                	je     80102ada <main+0xf2>
80102ae4:	eb 9b                	jmp    80102a81 <main+0x99>
80102ae6:	83 ec 08             	sub    $0x8,%esp
80102ae9:	68 00 00 00 8e       	push   $0x8e000000
80102aee:	68 00 00 40 80       	push   $0x80400000
80102af3:	e8 cf f5 ff ff       	call   801020c7 <kinit2>
80102af8:	e8 61 07 00 00       	call   8010325e <userinit>
80102afd:	e8 8d fe ff ff       	call   8010298f <mpmain>

80102b02 <mpsearch1>:
80102b02:	55                   	push   %ebp
80102b03:	89 e5                	mov    %esp,%ebp
80102b05:	57                   	push   %edi
80102b06:	56                   	push   %esi
80102b07:	53                   	push   %ebx
80102b08:	83 ec 0c             	sub    $0xc,%esp
80102b0b:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
80102b11:	8d 3c 16             	lea    (%esi,%edx,1),%edi
80102b14:	39 fe                	cmp    %edi,%esi
80102b16:	73 4c                	jae    80102b64 <mpsearch1+0x62>
80102b18:	8d 98 10 00 00 80    	lea    -0x7ffffff0(%eax),%ebx
80102b1e:	eb 0e                	jmp    80102b2e <mpsearch1+0x2c>
80102b20:	84 c0                	test   %al,%al
80102b22:	74 36                	je     80102b5a <mpsearch1+0x58>
80102b24:	83 c6 10             	add    $0x10,%esi
80102b27:	83 c3 10             	add    $0x10,%ebx
80102b2a:	39 fe                	cmp    %edi,%esi
80102b2c:	73 27                	jae    80102b55 <mpsearch1+0x53>
80102b2e:	83 ec 04             	sub    $0x4,%esp
80102b31:	6a 04                	push   $0x4
80102b33:	68 4f 66 10 80       	push   $0x8010664f
80102b38:	56                   	push   %esi
80102b39:	e8 13 12 00 00       	call   80103d51 <memcmp>
80102b3e:	83 c4 10             	add    $0x10,%esp
80102b41:	85 c0                	test   %eax,%eax
80102b43:	75 df                	jne    80102b24 <mpsearch1+0x22>
80102b45:	89 f2                	mov    %esi,%edx
80102b47:	0f b6 0a             	movzbl (%edx),%ecx
80102b4a:	01 c8                	add    %ecx,%eax
80102b4c:	83 c2 01             	add    $0x1,%edx
80102b4f:	39 da                	cmp    %ebx,%edx
80102b51:	75 f4                	jne    80102b47 <mpsearch1+0x45>
80102b53:	eb cb                	jmp    80102b20 <mpsearch1+0x1e>
80102b55:	be 00 00 00 00       	mov    $0x0,%esi
80102b5a:	89 f0                	mov    %esi,%eax
80102b5c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102b5f:	5b                   	pop    %ebx
80102b60:	5e                   	pop    %esi
80102b61:	5f                   	pop    %edi
80102b62:	5d                   	pop    %ebp
80102b63:	c3                   	ret
80102b64:	be 00 00 00 00       	mov    $0x0,%esi
80102b69:	eb ef                	jmp    80102b5a <mpsearch1+0x58>

80102b6b <mpinit>:
80102b6b:	55                   	push   %ebp
80102b6c:	89 e5                	mov    %esp,%ebp
80102b6e:	57                   	push   %edi
80102b6f:	56                   	push   %esi
80102b70:	53                   	push   %ebx
80102b71:	83 ec 1c             	sub    $0x1c,%esp
80102b74:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
80102b7b:	c1 e0 08             	shl    $0x8,%eax
80102b7e:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
80102b85:	09 d0                	or     %edx,%eax
80102b87:	c1 e0 04             	shl    $0x4,%eax
80102b8a:	0f 84 c6 00 00 00    	je     80102c56 <mpinit+0xeb>
80102b90:	ba 00 04 00 00       	mov    $0x400,%edx
80102b95:	e8 68 ff ff ff       	call   80102b02 <mpsearch1>
80102b9a:	89 45 e0             	mov    %eax,-0x20(%ebp)
80102b9d:	85 c0                	test   %eax,%eax
80102b9f:	75 1a                	jne    80102bbb <mpinit+0x50>
80102ba1:	ba 00 00 01 00       	mov    $0x10000,%edx
80102ba6:	b8 00 00 0f 00       	mov    $0xf0000,%eax
80102bab:	e8 52 ff ff ff       	call   80102b02 <mpsearch1>
80102bb0:	89 45 e0             	mov    %eax,-0x20(%ebp)
80102bb3:	85 c0                	test   %eax,%eax
80102bb5:	0f 84 66 01 00 00    	je     80102d21 <mpinit+0x1b6>
80102bbb:	8b 45 e0             	mov    -0x20(%ebp),%eax
80102bbe:	8b 58 04             	mov    0x4(%eax),%ebx
80102bc1:	85 db                	test   %ebx,%ebx
80102bc3:	0f 84 58 01 00 00    	je     80102d21 <mpinit+0x1b6>
80102bc9:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80102bcf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80102bd2:	83 ec 04             	sub    $0x4,%esp
80102bd5:	6a 04                	push   $0x4
80102bd7:	68 54 66 10 80       	push   $0x80106654
80102bdc:	50                   	push   %eax
80102bdd:	e8 6f 11 00 00       	call   80103d51 <memcmp>
80102be2:	89 c6                	mov    %eax,%esi
80102be4:	83 c4 10             	add    $0x10,%esp
80102be7:	85 c0                	test   %eax,%eax
80102be9:	0f 85 32 01 00 00    	jne    80102d21 <mpinit+0x1b6>
80102bef:	0f b6 83 06 00 00 80 	movzbl -0x7ffffffa(%ebx),%eax
80102bf6:	3c 01                	cmp    $0x1,%al
80102bf8:	74 08                	je     80102c02 <mpinit+0x97>
80102bfa:	3c 04                	cmp    $0x4,%al
80102bfc:	0f 85 1f 01 00 00    	jne    80102d21 <mpinit+0x1b6>
80102c02:	0f b7 93 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edx
80102c09:	66 85 d2             	test   %dx,%dx
80102c0c:	74 22                	je     80102c30 <mpinit+0xc5>
80102c0e:	89 d8                	mov    %ebx,%eax
80102c10:	0f b7 d2             	movzwl %dx,%edx
80102c13:	8d 3c 1a             	lea    (%edx,%ebx,1),%edi
80102c16:	89 f2                	mov    %esi,%edx
80102c18:	0f b6 88 00 00 00 80 	movzbl -0x80000000(%eax),%ecx
80102c1f:	01 ca                	add    %ecx,%edx
80102c21:	83 c0 01             	add    $0x1,%eax
80102c24:	39 f8                	cmp    %edi,%eax
80102c26:	75 f0                	jne    80102c18 <mpinit+0xad>
80102c28:	84 d2                	test   %dl,%dl
80102c2a:	0f 85 f1 00 00 00    	jne    80102d21 <mpinit+0x1b6>
80102c30:	8b 83 24 00 00 80    	mov    -0x7fffffdc(%ebx),%eax
80102c36:	a3 80 06 11 80       	mov    %eax,0x80110680
80102c3b:	8d 83 2c 00 00 80    	lea    -0x7fffffd4(%ebx),%eax
80102c41:	0f b7 93 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edx
80102c48:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80102c4b:	01 d7                	add    %edx,%edi
80102c4d:	89 fa                	mov    %edi,%edx
80102c4f:	bf 01 00 00 00       	mov    $0x1,%edi
80102c54:	eb 6e                	jmp    80102cc4 <mpinit+0x159>
80102c56:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
80102c5d:	c1 e0 08             	shl    $0x8,%eax
80102c60:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
80102c67:	09 d0                	or     %edx,%eax
80102c69:	c1 e0 0a             	shl    $0xa,%eax
80102c6c:	2d 00 04 00 00       	sub    $0x400,%eax
80102c71:	ba 00 04 00 00       	mov    $0x400,%edx
80102c76:	e8 87 fe ff ff       	call   80102b02 <mpsearch1>
80102c7b:	89 45 e0             	mov    %eax,-0x20(%ebp)
80102c7e:	85 c0                	test   %eax,%eax
80102c80:	0f 85 35 ff ff ff    	jne    80102bbb <mpinit+0x50>
80102c86:	e9 16 ff ff ff       	jmp    80102ba1 <mpinit+0x36>
80102c8b:	83 e9 03             	sub    $0x3,%ecx
80102c8e:	80 f9 01             	cmp    $0x1,%cl
80102c91:	76 43                	jbe    80102cd6 <mpinit+0x16b>
80102c93:	89 f7                	mov    %esi,%edi
80102c95:	eb 2d                	jmp    80102cc4 <mpinit+0x159>
80102c97:	8b 0d 84 07 11 80    	mov    0x80110784,%ecx
80102c9d:	83 f9 07             	cmp    $0x7,%ecx
80102ca0:	7f 1f                	jg     80102cc1 <mpinit+0x156>
80102ca2:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80102ca5:	69 d9 b0 00 00 00    	imul   $0xb0,%ecx,%ebx
80102cab:	0f b6 48 01          	movzbl 0x1(%eax),%ecx
80102caf:	88 8b a0 07 11 80    	mov    %cl,-0x7feef860(%ebx)
80102cb5:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80102cb8:	83 c1 01             	add    $0x1,%ecx
80102cbb:	89 0d 84 07 11 80    	mov    %ecx,0x80110784
80102cc1:	83 c0 14             	add    $0x14,%eax
80102cc4:	39 d0                	cmp    %edx,%eax
80102cc6:	73 22                	jae    80102cea <mpinit+0x17f>
80102cc8:	0f b6 08             	movzbl (%eax),%ecx
80102ccb:	80 f9 02             	cmp    $0x2,%cl
80102cce:	74 0b                	je     80102cdb <mpinit+0x170>
80102cd0:	77 b9                	ja     80102c8b <mpinit+0x120>
80102cd2:	84 c9                	test   %cl,%cl
80102cd4:	74 c1                	je     80102c97 <mpinit+0x12c>
80102cd6:	83 c0 08             	add    $0x8,%eax
80102cd9:	eb e9                	jmp    80102cc4 <mpinit+0x159>
80102cdb:	0f b6 48 01          	movzbl 0x1(%eax),%ecx
80102cdf:	88 0d 80 07 11 80    	mov    %cl,0x80110780
80102ce5:	83 c0 08             	add    $0x8,%eax
80102ce8:	eb da                	jmp    80102cc4 <mpinit+0x159>
80102cea:	85 ff                	test   %edi,%edi
80102cec:	74 26                	je     80102d14 <mpinit+0x1a9>
80102cee:	8b 45 e0             	mov    -0x20(%ebp),%eax
80102cf1:	80 78 0c 00          	cmpb   $0x0,0xc(%eax)
80102cf5:	74 15                	je     80102d0c <mpinit+0x1a1>
80102cf7:	b8 70 00 00 00       	mov    $0x70,%eax
80102cfc:	ba 22 00 00 00       	mov    $0x22,%edx
80102d01:	ee                   	out    %al,(%dx)
80102d02:	ba 23 00 00 00       	mov    $0x23,%edx
80102d07:	ec                   	in     (%dx),%al
80102d08:	83 c8 01             	or     $0x1,%eax
80102d0b:	ee                   	out    %al,(%dx)
80102d0c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102d0f:	5b                   	pop    %ebx
80102d10:	5e                   	pop    %esi
80102d11:	5f                   	pop    %edi
80102d12:	5d                   	pop    %ebp
80102d13:	c3                   	ret
80102d14:	83 ec 0c             	sub    $0xc,%esp
80102d17:	68 e8 69 10 80       	push   $0x801069e8
80102d1c:	e8 21 d6 ff ff       	call   80100342 <panic>
80102d21:	83 ec 0c             	sub    $0xc,%esp
80102d24:	68 59 66 10 80       	push   $0x80106659
80102d29:	e8 14 d6 ff ff       	call   80100342 <panic>

80102d2e <picinit>:
80102d2e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80102d33:	ba 21 00 00 00       	mov    $0x21,%edx
80102d38:	ee                   	out    %al,(%dx)
80102d39:	ba a1 00 00 00       	mov    $0xa1,%edx
80102d3e:	ee                   	out    %al,(%dx)
80102d3f:	c3                   	ret

80102d40 <pipealloc>:
80102d40:	55                   	push   %ebp
80102d41:	89 e5                	mov    %esp,%ebp
80102d43:	57                   	push   %edi
80102d44:	56                   	push   %esi
80102d45:	53                   	push   %ebx
80102d46:	83 ec 0c             	sub    $0xc,%esp
80102d49:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102d4c:	8b 75 0c             	mov    0xc(%ebp),%esi
80102d4f:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
80102d55:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80102d5b:	e8 0b df ff ff       	call   80100c6b <filealloc>
80102d60:	89 03                	mov    %eax,(%ebx)
80102d62:	85 c0                	test   %eax,%eax
80102d64:	0f 84 a6 00 00 00    	je     80102e10 <pipealloc+0xd0>
80102d6a:	e8 fc de ff ff       	call   80100c6b <filealloc>
80102d6f:	89 06                	mov    %eax,(%esi)
80102d71:	85 c0                	test   %eax,%eax
80102d73:	0f 84 85 00 00 00    	je     80102dfe <pipealloc+0xbe>
80102d79:	e8 69 f3 ff ff       	call   801020e7 <kalloc>
80102d7e:	89 c7                	mov    %eax,%edi
80102d80:	85 c0                	test   %eax,%eax
80102d82:	74 72                	je     80102df6 <pipealloc+0xb6>
80102d84:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
80102d8b:	00 00 00 
80102d8e:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
80102d95:	00 00 00 
80102d98:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
80102d9f:	00 00 00 
80102da2:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
80102da9:	00 00 00 
80102dac:	83 ec 08             	sub    $0x8,%esp
80102daf:	68 71 66 10 80       	push   $0x80106671
80102db4:	50                   	push   %eax
80102db5:	e8 6e 0d 00 00       	call   80103b28 <initlock>
80102dba:	8b 03                	mov    (%ebx),%eax
80102dbc:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
80102dc2:	8b 03                	mov    (%ebx),%eax
80102dc4:	c6 40 08 01          	movb   $0x1,0x8(%eax)
80102dc8:	8b 03                	mov    (%ebx),%eax
80102dca:	c6 40 09 00          	movb   $0x0,0x9(%eax)
80102dce:	8b 03                	mov    (%ebx),%eax
80102dd0:	89 78 0c             	mov    %edi,0xc(%eax)
80102dd3:	8b 06                	mov    (%esi),%eax
80102dd5:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
80102ddb:	8b 06                	mov    (%esi),%eax
80102ddd:	c6 40 08 00          	movb   $0x0,0x8(%eax)
80102de1:	8b 06                	mov    (%esi),%eax
80102de3:	c6 40 09 01          	movb   $0x1,0x9(%eax)
80102de7:	8b 06                	mov    (%esi),%eax
80102de9:	89 78 0c             	mov    %edi,0xc(%eax)
80102dec:	83 c4 10             	add    $0x10,%esp
80102def:	b8 00 00 00 00       	mov    $0x0,%eax
80102df4:	eb 36                	jmp    80102e2c <pipealloc+0xec>
80102df6:	8b 03                	mov    (%ebx),%eax
80102df8:	85 c0                	test   %eax,%eax
80102dfa:	75 08                	jne    80102e04 <pipealloc+0xc4>
80102dfc:	eb 12                	jmp    80102e10 <pipealloc+0xd0>
80102dfe:	8b 03                	mov    (%ebx),%eax
80102e00:	85 c0                	test   %eax,%eax
80102e02:	74 30                	je     80102e34 <pipealloc+0xf4>
80102e04:	83 ec 0c             	sub    $0xc,%esp
80102e07:	50                   	push   %eax
80102e08:	e8 02 df ff ff       	call   80100d0f <fileclose>
80102e0d:	83 c4 10             	add    $0x10,%esp
80102e10:	8b 16                	mov    (%esi),%edx
80102e12:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80102e17:	85 d2                	test   %edx,%edx
80102e19:	74 11                	je     80102e2c <pipealloc+0xec>
80102e1b:	83 ec 0c             	sub    $0xc,%esp
80102e1e:	52                   	push   %edx
80102e1f:	e8 eb de ff ff       	call   80100d0f <fileclose>
80102e24:	83 c4 10             	add    $0x10,%esp
80102e27:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80102e2c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102e2f:	5b                   	pop    %ebx
80102e30:	5e                   	pop    %esi
80102e31:	5f                   	pop    %edi
80102e32:	5d                   	pop    %ebp
80102e33:	c3                   	ret
80102e34:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80102e39:	eb f1                	jmp    80102e2c <pipealloc+0xec>

80102e3b <pipeclose>:
80102e3b:	55                   	push   %ebp
80102e3c:	89 e5                	mov    %esp,%ebp
80102e3e:	53                   	push   %ebx
80102e3f:	83 ec 10             	sub    $0x10,%esp
80102e42:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102e45:	53                   	push   %ebx
80102e46:	e8 23 0e 00 00       	call   80103c6e <acquire>
80102e4b:	83 c4 10             	add    $0x10,%esp
80102e4e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
80102e52:	74 3f                	je     80102e93 <pipeclose+0x58>
80102e54:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
80102e5b:	00 00 00 
80102e5e:	83 ec 0c             	sub    $0xc,%esp
80102e61:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80102e67:	50                   	push   %eax
80102e68:	e8 ec 09 00 00       	call   80103859 <wakeup>
80102e6d:	83 c4 10             	add    $0x10,%esp
80102e70:	83 bb 3c 02 00 00 00 	cmpl   $0x0,0x23c(%ebx)
80102e77:	75 09                	jne    80102e82 <pipeclose+0x47>
80102e79:	83 bb 40 02 00 00 00 	cmpl   $0x0,0x240(%ebx)
80102e80:	74 2f                	je     80102eb1 <pipeclose+0x76>
80102e82:	83 ec 0c             	sub    $0xc,%esp
80102e85:	53                   	push   %ebx
80102e86:	e8 4a 0e 00 00       	call   80103cd5 <release>
80102e8b:	83 c4 10             	add    $0x10,%esp
80102e8e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102e91:	c9                   	leave
80102e92:	c3                   	ret
80102e93:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
80102e9a:	00 00 00 
80102e9d:	83 ec 0c             	sub    $0xc,%esp
80102ea0:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
80102ea6:	50                   	push   %eax
80102ea7:	e8 ad 09 00 00       	call   80103859 <wakeup>
80102eac:	83 c4 10             	add    $0x10,%esp
80102eaf:	eb bf                	jmp    80102e70 <pipeclose+0x35>
80102eb1:	83 ec 0c             	sub    $0xc,%esp
80102eb4:	53                   	push   %ebx
80102eb5:	e8 1b 0e 00 00       	call   80103cd5 <release>
80102eba:	89 1c 24             	mov    %ebx,(%esp)
80102ebd:	e8 00 f1 ff ff       	call   80101fc2 <kfree>
80102ec2:	83 c4 10             	add    $0x10,%esp
80102ec5:	eb c7                	jmp    80102e8e <pipeclose+0x53>

80102ec7 <pipewrite>:
80102ec7:	55                   	push   %ebp
80102ec8:	89 e5                	mov    %esp,%ebp
80102eca:	57                   	push   %edi
80102ecb:	56                   	push   %esi
80102ecc:	53                   	push   %ebx
80102ecd:	83 ec 28             	sub    $0x28,%esp
80102ed0:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102ed3:	8b 75 0c             	mov    0xc(%ebp),%esi
80102ed6:	8b 7d 10             	mov    0x10(%ebp),%edi
80102ed9:	53                   	push   %ebx
80102eda:	e8 8f 0d 00 00       	call   80103c6e <acquire>
80102edf:	83 c4 10             	add    $0x10,%esp
80102ee2:	85 ff                	test   %edi,%edi
80102ee4:	0f 8e 94 00 00 00    	jle    80102f7e <pipewrite+0xb7>
80102eea:	89 f1                	mov    %esi,%ecx
80102eec:	8d 04 3e             	lea    (%esi,%edi,1),%eax
80102eef:	89 45 e0             	mov    %eax,-0x20(%ebp)
80102ef2:	8d b3 34 02 00 00    	lea    0x234(%ebx),%esi
80102ef8:	89 7d 10             	mov    %edi,0x10(%ebp)
80102efb:	8b 93 38 02 00 00    	mov    0x238(%ebx),%edx
80102f01:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
80102f07:	05 00 02 00 00       	add    $0x200,%eax
80102f0c:	8d bb 38 02 00 00    	lea    0x238(%ebx),%edi
80102f12:	39 c2                	cmp    %eax,%edx
80102f14:	75 45                	jne    80102f5b <pipewrite+0x94>
80102f16:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80102f19:	83 bb 3c 02 00 00 00 	cmpl   $0x0,0x23c(%ebx)
80102f20:	74 7a                	je     80102f9c <pipewrite+0xd5>
80102f22:	e8 14 03 00 00       	call   8010323b <myproc>
80102f27:	83 78 24 00          	cmpl   $0x0,0x24(%eax)
80102f2b:	75 6f                	jne    80102f9c <pipewrite+0xd5>
80102f2d:	83 ec 0c             	sub    $0xc,%esp
80102f30:	56                   	push   %esi
80102f31:	e8 23 09 00 00       	call   80103859 <wakeup>
80102f36:	83 c4 08             	add    $0x8,%esp
80102f39:	53                   	push   %ebx
80102f3a:	57                   	push   %edi
80102f3b:	e8 9e 07 00 00       	call   801036de <sleep>
80102f40:	8b 93 38 02 00 00    	mov    0x238(%ebx),%edx
80102f46:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
80102f4c:	05 00 02 00 00       	add    $0x200,%eax
80102f51:	83 c4 10             	add    $0x10,%esp
80102f54:	39 c2                	cmp    %eax,%edx
80102f56:	74 c1                	je     80102f19 <pipewrite+0x52>
80102f58:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80102f5b:	8d 42 01             	lea    0x1(%edx),%eax
80102f5e:	89 83 38 02 00 00    	mov    %eax,0x238(%ebx)
80102f64:	0f b6 01             	movzbl (%ecx),%eax
80102f67:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
80102f6d:	88 44 13 34          	mov    %al,0x34(%ebx,%edx,1)
80102f71:	83 c1 01             	add    $0x1,%ecx
80102f74:	8b 45 e0             	mov    -0x20(%ebp),%eax
80102f77:	39 c1                	cmp    %eax,%ecx
80102f79:	75 80                	jne    80102efb <pipewrite+0x34>
80102f7b:	8b 7d 10             	mov    0x10(%ebp),%edi
80102f7e:	83 ec 0c             	sub    $0xc,%esp
80102f81:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80102f87:	50                   	push   %eax
80102f88:	e8 cc 08 00 00       	call   80103859 <wakeup>
80102f8d:	89 1c 24             	mov    %ebx,(%esp)
80102f90:	e8 40 0d 00 00       	call   80103cd5 <release>
80102f95:	83 c4 10             	add    $0x10,%esp
80102f98:	89 f8                	mov    %edi,%eax
80102f9a:	eb 11                	jmp    80102fad <pipewrite+0xe6>
80102f9c:	83 ec 0c             	sub    $0xc,%esp
80102f9f:	53                   	push   %ebx
80102fa0:	e8 30 0d 00 00       	call   80103cd5 <release>
80102fa5:	83 c4 10             	add    $0x10,%esp
80102fa8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80102fad:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102fb0:	5b                   	pop    %ebx
80102fb1:	5e                   	pop    %esi
80102fb2:	5f                   	pop    %edi
80102fb3:	5d                   	pop    %ebp
80102fb4:	c3                   	ret

80102fb5 <piperead>:
80102fb5:	55                   	push   %ebp
80102fb6:	89 e5                	mov    %esp,%ebp
80102fb8:	57                   	push   %edi
80102fb9:	56                   	push   %esi
80102fba:	53                   	push   %ebx
80102fbb:	83 ec 18             	sub    $0x18,%esp
80102fbe:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102fc1:	8b 7d 0c             	mov    0xc(%ebp),%edi
80102fc4:	53                   	push   %ebx
80102fc5:	e8 a4 0c 00 00       	call   80103c6e <acquire>
80102fca:	83 c4 10             	add    $0x10,%esp
80102fcd:	8d b3 34 02 00 00    	lea    0x234(%ebx),%esi
80102fd3:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
80102fd9:	39 83 34 02 00 00    	cmp    %eax,0x234(%ebx)
80102fdf:	75 2f                	jne    80103010 <piperead+0x5b>
80102fe1:	83 bb 40 02 00 00 00 	cmpl   $0x0,0x240(%ebx)
80102fe8:	74 26                	je     80103010 <piperead+0x5b>
80102fea:	e8 4c 02 00 00       	call   8010323b <myproc>
80102fef:	83 78 24 00          	cmpl   $0x0,0x24(%eax)
80102ff3:	75 79                	jne    8010306e <piperead+0xb9>
80102ff5:	83 ec 08             	sub    $0x8,%esp
80102ff8:	53                   	push   %ebx
80102ff9:	56                   	push   %esi
80102ffa:	e8 df 06 00 00       	call   801036de <sleep>
80102fff:	83 c4 10             	add    $0x10,%esp
80103002:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
80103008:	39 83 34 02 00 00    	cmp    %eax,0x234(%ebx)
8010300e:	74 d1                	je     80102fe1 <piperead+0x2c>
80103010:	be 00 00 00 00       	mov    $0x0,%esi
80103015:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
80103019:	7e 2f                	jle    8010304a <piperead+0x95>
8010301b:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
80103021:	3b 83 38 02 00 00    	cmp    0x238(%ebx),%eax
80103027:	74 21                	je     8010304a <piperead+0x95>
80103029:	8d 50 01             	lea    0x1(%eax),%edx
8010302c:	89 93 34 02 00 00    	mov    %edx,0x234(%ebx)
80103032:	25 ff 01 00 00       	and    $0x1ff,%eax
80103037:	0f b6 44 03 34       	movzbl 0x34(%ebx,%eax,1),%eax
8010303c:	88 04 37             	mov    %al,(%edi,%esi,1)
8010303f:	83 c6 01             	add    $0x1,%esi
80103042:	39 75 10             	cmp    %esi,0x10(%ebp)
80103045:	75 d4                	jne    8010301b <piperead+0x66>
80103047:	8b 75 10             	mov    0x10(%ebp),%esi
8010304a:	83 ec 0c             	sub    $0xc,%esp
8010304d:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
80103053:	50                   	push   %eax
80103054:	e8 00 08 00 00       	call   80103859 <wakeup>
80103059:	89 1c 24             	mov    %ebx,(%esp)
8010305c:	e8 74 0c 00 00       	call   80103cd5 <release>
80103061:	83 c4 10             	add    $0x10,%esp
80103064:	89 f0                	mov    %esi,%eax
80103066:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103069:	5b                   	pop    %ebx
8010306a:	5e                   	pop    %esi
8010306b:	5f                   	pop    %edi
8010306c:	5d                   	pop    %ebp
8010306d:	c3                   	ret
8010306e:	83 ec 0c             	sub    $0xc,%esp
80103071:	53                   	push   %ebx
80103072:	e8 5e 0c 00 00       	call   80103cd5 <release>
80103077:	83 c4 10             	add    $0x10,%esp
8010307a:	be ff ff ff ff       	mov    $0xffffffff,%esi
8010307f:	eb e3                	jmp    80103064 <piperead+0xaf>

80103081 <wakeup1>:
80103081:	ba 54 0d 11 80       	mov    $0x80110d54,%edx
80103086:	eb 0b                	jmp    80103093 <wakeup1+0x12>
80103088:	83 c2 7c             	add    $0x7c,%edx
8010308b:	81 fa 54 2c 11 80    	cmp    $0x80112c54,%edx
80103091:	74 14                	je     801030a7 <wakeup1+0x26>
80103093:	83 7a 0c 02          	cmpl   $0x2,0xc(%edx)
80103097:	75 ef                	jne    80103088 <wakeup1+0x7>
80103099:	39 42 20             	cmp    %eax,0x20(%edx)
8010309c:	75 ea                	jne    80103088 <wakeup1+0x7>
8010309e:	c7 42 0c 03 00 00 00 	movl   $0x3,0xc(%edx)
801030a5:	eb e1                	jmp    80103088 <wakeup1+0x7>
801030a7:	c3                   	ret

801030a8 <allocproc>:
801030a8:	55                   	push   %ebp
801030a9:	89 e5                	mov    %esp,%ebp
801030ab:	53                   	push   %ebx
801030ac:	83 ec 10             	sub    $0x10,%esp
801030af:	68 20 0d 11 80       	push   $0x80110d20
801030b4:	e8 b5 0b 00 00       	call   80103c6e <acquire>
801030b9:	83 c4 10             	add    $0x10,%esp
801030bc:	bb 54 0d 11 80       	mov    $0x80110d54,%ebx
801030c1:	83 7b 0c 00          	cmpl   $0x0,0xc(%ebx)
801030c5:	74 22                	je     801030e9 <allocproc+0x41>
801030c7:	83 c3 7c             	add    $0x7c,%ebx
801030ca:	81 fb 54 2c 11 80    	cmp    $0x80112c54,%ebx
801030d0:	75 ef                	jne    801030c1 <allocproc+0x19>
801030d2:	83 ec 0c             	sub    $0xc,%esp
801030d5:	68 20 0d 11 80       	push   $0x80110d20
801030da:	e8 f6 0b 00 00       	call   80103cd5 <release>
801030df:	83 c4 10             	add    $0x10,%esp
801030e2:	bb 00 00 00 00       	mov    $0x0,%ebx
801030e7:	eb 69                	jmp    80103152 <allocproc+0xaa>
801030e9:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
801030f0:	a1 04 90 10 80       	mov    0x80109004,%eax
801030f5:	8d 50 01             	lea    0x1(%eax),%edx
801030f8:	89 15 04 90 10 80    	mov    %edx,0x80109004
801030fe:	89 43 10             	mov    %eax,0x10(%ebx)
80103101:	83 ec 0c             	sub    $0xc,%esp
80103104:	68 20 0d 11 80       	push   $0x80110d20
80103109:	e8 c7 0b 00 00       	call   80103cd5 <release>
8010310e:	e8 d4 ef ff ff       	call   801020e7 <kalloc>
80103113:	89 43 08             	mov    %eax,0x8(%ebx)
80103116:	83 c4 10             	add    $0x10,%esp
80103119:	85 c0                	test   %eax,%eax
8010311b:	74 3c                	je     80103159 <allocproc+0xb1>
8010311d:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
80103123:	89 53 18             	mov    %edx,0x18(%ebx)
80103126:	c7 80 b0 0f 00 00 91 	movl   $0x80104d91,0xfb0(%eax)
8010312d:	4d 10 80 
80103130:	05 9c 0f 00 00       	add    $0xf9c,%eax
80103135:	89 43 1c             	mov    %eax,0x1c(%ebx)
80103138:	83 ec 04             	sub    $0x4,%esp
8010313b:	6a 14                	push   $0x14
8010313d:	6a 00                	push   $0x0
8010313f:	50                   	push   %eax
80103140:	e8 d7 0b 00 00       	call   80103d1c <memset>
80103145:	8b 43 1c             	mov    0x1c(%ebx),%eax
80103148:	c7 40 10 64 31 10 80 	movl   $0x80103164,0x10(%eax)
8010314f:	83 c4 10             	add    $0x10,%esp
80103152:	89 d8                	mov    %ebx,%eax
80103154:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103157:	c9                   	leave
80103158:	c3                   	ret
80103159:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
80103160:	89 c3                	mov    %eax,%ebx
80103162:	eb ee                	jmp    80103152 <allocproc+0xaa>

80103164 <forkret>:
80103164:	55                   	push   %ebp
80103165:	89 e5                	mov    %esp,%ebp
80103167:	83 ec 14             	sub    $0x14,%esp
8010316a:	68 20 0d 11 80       	push   $0x80110d20
8010316f:	e8 61 0b 00 00       	call   80103cd5 <release>
80103174:	83 c4 10             	add    $0x10,%esp
80103177:	83 3d 00 90 10 80 00 	cmpl   $0x0,0x80109000
8010317e:	75 02                	jne    80103182 <forkret+0x1e>
80103180:	c9                   	leave
80103181:	c3                   	ret
80103182:	c7 05 00 90 10 80 00 	movl   $0x0,0x80109000
80103189:	00 00 00 
8010318c:	83 ec 0c             	sub    $0xc,%esp
8010318f:	6a 01                	push   $0x1
80103191:	e8 0f e1 ff ff       	call   801012a5 <iinit>
80103196:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
8010319d:	e8 e6 f4 ff ff       	call   80102688 <initlog>
801031a2:	83 c4 10             	add    $0x10,%esp
801031a5:	eb d9                	jmp    80103180 <forkret+0x1c>

801031a7 <pinit>:
801031a7:	55                   	push   %ebp
801031a8:	89 e5                	mov    %esp,%ebp
801031aa:	83 ec 10             	sub    $0x10,%esp
801031ad:	68 76 66 10 80       	push   $0x80106676
801031b2:	68 20 0d 11 80       	push   $0x80110d20
801031b7:	e8 6c 09 00 00       	call   80103b28 <initlock>
801031bc:	83 c4 10             	add    $0x10,%esp
801031bf:	c9                   	leave
801031c0:	c3                   	ret

801031c1 <mycpu>:
801031c1:	55                   	push   %ebp
801031c2:	89 e5                	mov    %esp,%ebp
801031c4:	56                   	push   %esi
801031c5:	53                   	push   %ebx
801031c6:	9c                   	pushf
801031c7:	58                   	pop    %eax
801031c8:	f6 c4 02             	test   $0x2,%ah
801031cb:	75 39                	jne    80103206 <mycpu+0x45>
801031cd:	e8 e5 f1 ff ff       	call   801023b7 <lapicid>
801031d2:	8b 35 84 07 11 80    	mov    0x80110784,%esi
801031d8:	85 f6                	test   %esi,%esi
801031da:	7e 1d                	jle    801031f9 <mycpu+0x38>
801031dc:	ba 00 00 00 00       	mov    $0x0,%edx
801031e1:	69 ca b0 00 00 00    	imul   $0xb0,%edx,%ecx
801031e7:	0f b6 99 a0 07 11 80 	movzbl -0x7feef860(%ecx),%ebx
801031ee:	39 c3                	cmp    %eax,%ebx
801031f0:	74 21                	je     80103213 <mycpu+0x52>
801031f2:	83 c2 01             	add    $0x1,%edx
801031f5:	39 f2                	cmp    %esi,%edx
801031f7:	75 e8                	jne    801031e1 <mycpu+0x20>
801031f9:	83 ec 0c             	sub    $0xc,%esp
801031fc:	68 7d 66 10 80       	push   $0x8010667d
80103201:	e8 3c d1 ff ff       	call   80100342 <panic>
80103206:	83 ec 0c             	sub    $0xc,%esp
80103209:	68 08 6a 10 80       	push   $0x80106a08
8010320e:	e8 2f d1 ff ff       	call   80100342 <panic>
80103213:	8d 81 a0 07 11 80    	lea    -0x7feef860(%ecx),%eax
80103219:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010321c:	5b                   	pop    %ebx
8010321d:	5e                   	pop    %esi
8010321e:	5d                   	pop    %ebp
8010321f:	c3                   	ret

80103220 <cpuid>:
80103220:	55                   	push   %ebp
80103221:	89 e5                	mov    %esp,%ebp
80103223:	83 ec 08             	sub    $0x8,%esp
80103226:	e8 96 ff ff ff       	call   801031c1 <mycpu>
8010322b:	2d a0 07 11 80       	sub    $0x801107a0,%eax
80103230:	c1 f8 04             	sar    $0x4,%eax
80103233:	69 c0 a3 8b 2e ba    	imul   $0xba2e8ba3,%eax,%eax
80103239:	c9                   	leave
8010323a:	c3                   	ret

8010323b <myproc>:
8010323b:	55                   	push   %ebp
8010323c:	89 e5                	mov    %esp,%ebp
8010323e:	53                   	push   %ebx
8010323f:	83 ec 04             	sub    $0x4,%esp
80103242:	e8 57 09 00 00       	call   80103b9e <pushcli>
80103247:	e8 75 ff ff ff       	call   801031c1 <mycpu>
8010324c:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
80103252:	e8 83 09 00 00       	call   80103bda <popcli>
80103257:	89 d8                	mov    %ebx,%eax
80103259:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010325c:	c9                   	leave
8010325d:	c3                   	ret

8010325e <userinit>:
8010325e:	55                   	push   %ebp
8010325f:	89 e5                	mov    %esp,%ebp
80103261:	53                   	push   %ebx
80103262:	83 ec 04             	sub    $0x4,%esp
80103265:	e8 3e fe ff ff       	call   801030a8 <allocproc>
8010326a:	89 c3                	mov    %eax,%ebx
8010326c:	a3 54 2c 11 80       	mov    %eax,0x80112c54
80103271:	e8 46 2f 00 00       	call   801061bc <setupkvm>
80103276:	89 43 04             	mov    %eax,0x4(%ebx)
80103279:	85 c0                	test   %eax,%eax
8010327b:	0f 84 b7 00 00 00    	je     80103338 <userinit+0xda>
80103281:	83 ec 04             	sub    $0x4,%esp
80103284:	68 2c 00 00 00       	push   $0x2c
80103289:	68 60 94 10 80       	push   $0x80109460
8010328e:	50                   	push   %eax
8010328f:	e8 3f 2c 00 00       	call   80105ed3 <inituvm>
80103294:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
8010329a:	83 c4 0c             	add    $0xc,%esp
8010329d:	6a 4c                	push   $0x4c
8010329f:	6a 00                	push   $0x0
801032a1:	ff 73 18             	push   0x18(%ebx)
801032a4:	e8 73 0a 00 00       	call   80103d1c <memset>
801032a9:	8b 43 18             	mov    0x18(%ebx),%eax
801032ac:	66 c7 40 3c 1b 00    	movw   $0x1b,0x3c(%eax)
801032b2:	8b 43 18             	mov    0x18(%ebx),%eax
801032b5:	66 c7 40 2c 23 00    	movw   $0x23,0x2c(%eax)
801032bb:	8b 43 18             	mov    0x18(%ebx),%eax
801032be:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
801032c2:	66 89 50 28          	mov    %dx,0x28(%eax)
801032c6:	8b 43 18             	mov    0x18(%ebx),%eax
801032c9:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
801032cd:	66 89 50 48          	mov    %dx,0x48(%eax)
801032d1:	8b 43 18             	mov    0x18(%ebx),%eax
801032d4:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
801032db:	8b 43 18             	mov    0x18(%ebx),%eax
801032de:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
801032e5:	8b 43 18             	mov    0x18(%ebx),%eax
801032e8:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)
801032ef:	83 c4 0c             	add    $0xc,%esp
801032f2:	6a 10                	push   $0x10
801032f4:	68 a6 66 10 80       	push   $0x801066a6
801032f9:	8d 43 6c             	lea    0x6c(%ebx),%eax
801032fc:	50                   	push   %eax
801032fd:	e8 88 0b 00 00       	call   80103e8a <safestrcpy>
80103302:	c7 04 24 af 66 10 80 	movl   $0x801066af,(%esp)
80103309:	e8 fe e8 ff ff       	call   80101c0c <namei>
8010330e:	89 43 68             	mov    %eax,0x68(%ebx)
80103311:	c7 04 24 20 0d 11 80 	movl   $0x80110d20,(%esp)
80103318:	e8 51 09 00 00       	call   80103c6e <acquire>
8010331d:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
80103324:	c7 04 24 20 0d 11 80 	movl   $0x80110d20,(%esp)
8010332b:	e8 a5 09 00 00       	call   80103cd5 <release>
80103330:	83 c4 10             	add    $0x10,%esp
80103333:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103336:	c9                   	leave
80103337:	c3                   	ret
80103338:	83 ec 0c             	sub    $0xc,%esp
8010333b:	68 8d 66 10 80       	push   $0x8010668d
80103340:	e8 fd cf ff ff       	call   80100342 <panic>

80103345 <growproc>:
80103345:	55                   	push   %ebp
80103346:	89 e5                	mov    %esp,%ebp
80103348:	56                   	push   %esi
80103349:	53                   	push   %ebx
8010334a:	8b 75 08             	mov    0x8(%ebp),%esi
8010334d:	e8 e9 fe ff ff       	call   8010323b <myproc>
80103352:	89 c3                	mov    %eax,%ebx
80103354:	8b 00                	mov    (%eax),%eax
80103356:	85 f6                	test   %esi,%esi
80103358:	7f 1c                	jg     80103376 <growproc+0x31>
8010335a:	78 37                	js     80103393 <growproc+0x4e>
8010335c:	89 03                	mov    %eax,(%ebx)
8010335e:	83 ec 0c             	sub    $0xc,%esp
80103361:	53                   	push   %ebx
80103362:	e8 6e 2a 00 00       	call   80105dd5 <switchuvm>
80103367:	83 c4 10             	add    $0x10,%esp
8010336a:	b8 00 00 00 00       	mov    $0x0,%eax
8010336f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103372:	5b                   	pop    %ebx
80103373:	5e                   	pop    %esi
80103374:	5d                   	pop    %ebp
80103375:	c3                   	ret
80103376:	83 ec 04             	sub    $0x4,%esp
80103379:	01 c6                	add    %eax,%esi
8010337b:	56                   	push   %esi
8010337c:	50                   	push   %eax
8010337d:	ff 73 04             	push   0x4(%ebx)
80103380:	e8 e5 2c 00 00       	call   8010606a <allocuvm>
80103385:	83 c4 10             	add    $0x10,%esp
80103388:	85 c0                	test   %eax,%eax
8010338a:	75 d0                	jne    8010335c <growproc+0x17>
8010338c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103391:	eb dc                	jmp    8010336f <growproc+0x2a>
80103393:	83 ec 04             	sub    $0x4,%esp
80103396:	01 c6                	add    %eax,%esi
80103398:	56                   	push   %esi
80103399:	50                   	push   %eax
8010339a:	ff 73 04             	push   0x4(%ebx)
8010339d:	e8 39 2c 00 00       	call   80105fdb <deallocuvm>
801033a2:	83 c4 10             	add    $0x10,%esp
801033a5:	85 c0                	test   %eax,%eax
801033a7:	75 b3                	jne    8010335c <growproc+0x17>
801033a9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801033ae:	eb bf                	jmp    8010336f <growproc+0x2a>

801033b0 <fork>:
801033b0:	55                   	push   %ebp
801033b1:	89 e5                	mov    %esp,%ebp
801033b3:	57                   	push   %edi
801033b4:	56                   	push   %esi
801033b5:	53                   	push   %ebx
801033b6:	83 ec 1c             	sub    $0x1c,%esp
801033b9:	e8 7d fe ff ff       	call   8010323b <myproc>
801033be:	89 c3                	mov    %eax,%ebx
801033c0:	e8 e3 fc ff ff       	call   801030a8 <allocproc>
801033c5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801033c8:	85 c0                	test   %eax,%eax
801033ca:	0f 84 e0 00 00 00    	je     801034b0 <fork+0x100>
801033d0:	89 c7                	mov    %eax,%edi
801033d2:	83 ec 08             	sub    $0x8,%esp
801033d5:	ff 33                	push   (%ebx)
801033d7:	ff 73 04             	push   0x4(%ebx)
801033da:	e8 8e 2e 00 00       	call   8010626d <copyuvm>
801033df:	89 47 04             	mov    %eax,0x4(%edi)
801033e2:	83 c4 10             	add    $0x10,%esp
801033e5:	85 c0                	test   %eax,%eax
801033e7:	74 2a                	je     80103413 <fork+0x63>
801033e9:	8b 03                	mov    (%ebx),%eax
801033eb:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
801033ee:	89 01                	mov    %eax,(%ecx)
801033f0:	89 c8                	mov    %ecx,%eax
801033f2:	89 59 14             	mov    %ebx,0x14(%ecx)
801033f5:	8b 73 18             	mov    0x18(%ebx),%esi
801033f8:	8b 79 18             	mov    0x18(%ecx),%edi
801033fb:	b9 13 00 00 00       	mov    $0x13,%ecx
80103400:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
80103402:	8b 40 18             	mov    0x18(%eax),%eax
80103405:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
8010340c:	be 00 00 00 00       	mov    $0x0,%esi
80103411:	eb 2e                	jmp    80103441 <fork+0x91>
80103413:	83 ec 0c             	sub    $0xc,%esp
80103416:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80103419:	ff 73 08             	push   0x8(%ebx)
8010341c:	e8 a1 eb ff ff       	call   80101fc2 <kfree>
80103421:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
80103428:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
8010342f:	83 c4 10             	add    $0x10,%esp
80103432:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80103437:	eb 6d                	jmp    801034a6 <fork+0xf6>
80103439:	83 c6 01             	add    $0x1,%esi
8010343c:	83 fe 10             	cmp    $0x10,%esi
8010343f:	74 1d                	je     8010345e <fork+0xae>
80103441:	8b 44 b3 28          	mov    0x28(%ebx,%esi,4),%eax
80103445:	85 c0                	test   %eax,%eax
80103447:	74 f0                	je     80103439 <fork+0x89>
80103449:	83 ec 0c             	sub    $0xc,%esp
8010344c:	50                   	push   %eax
8010344d:	e8 78 d8 ff ff       	call   80100cca <filedup>
80103452:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80103455:	89 44 b2 28          	mov    %eax,0x28(%edx,%esi,4)
80103459:	83 c4 10             	add    $0x10,%esp
8010345c:	eb db                	jmp    80103439 <fork+0x89>
8010345e:	83 ec 0c             	sub    $0xc,%esp
80103461:	ff 73 68             	push   0x68(%ebx)
80103464:	e8 ed df ff ff       	call   80101456 <idup>
80103469:	8b 7d e4             	mov    -0x1c(%ebp),%edi
8010346c:	89 47 68             	mov    %eax,0x68(%edi)
8010346f:	83 c4 0c             	add    $0xc,%esp
80103472:	6a 10                	push   $0x10
80103474:	83 c3 6c             	add    $0x6c,%ebx
80103477:	53                   	push   %ebx
80103478:	8d 47 6c             	lea    0x6c(%edi),%eax
8010347b:	50                   	push   %eax
8010347c:	e8 09 0a 00 00       	call   80103e8a <safestrcpy>
80103481:	8b 5f 10             	mov    0x10(%edi),%ebx
80103484:	c7 04 24 20 0d 11 80 	movl   $0x80110d20,(%esp)
8010348b:	e8 de 07 00 00       	call   80103c6e <acquire>
80103490:	c7 47 0c 03 00 00 00 	movl   $0x3,0xc(%edi)
80103497:	c7 04 24 20 0d 11 80 	movl   $0x80110d20,(%esp)
8010349e:	e8 32 08 00 00       	call   80103cd5 <release>
801034a3:	83 c4 10             	add    $0x10,%esp
801034a6:	89 d8                	mov    %ebx,%eax
801034a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801034ab:	5b                   	pop    %ebx
801034ac:	5e                   	pop    %esi
801034ad:	5f                   	pop    %edi
801034ae:	5d                   	pop    %ebp
801034af:	c3                   	ret
801034b0:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
801034b5:	eb ef                	jmp    801034a6 <fork+0xf6>

801034b7 <scheduler>:
801034b7:	55                   	push   %ebp
801034b8:	89 e5                	mov    %esp,%ebp
801034ba:	57                   	push   %edi
801034bb:	56                   	push   %esi
801034bc:	53                   	push   %ebx
801034bd:	83 ec 0c             	sub    $0xc,%esp
801034c0:	e8 fc fc ff ff       	call   801031c1 <mycpu>
801034c5:	89 c6                	mov    %eax,%esi
801034c7:	c7 80 ac 00 00 00 00 	movl   $0x0,0xac(%eax)
801034ce:	00 00 00 
801034d1:	8d 78 04             	lea    0x4(%eax),%edi
801034d4:	eb 57                	jmp    8010352d <scheduler+0x76>
801034d6:	83 c3 7c             	add    $0x7c,%ebx
801034d9:	81 fb 54 2c 11 80    	cmp    $0x80112c54,%ebx
801034df:	74 3c                	je     8010351d <scheduler+0x66>
801034e1:	83 7b 0c 03          	cmpl   $0x3,0xc(%ebx)
801034e5:	75 ef                	jne    801034d6 <scheduler+0x1f>
801034e7:	89 9e ac 00 00 00    	mov    %ebx,0xac(%esi)
801034ed:	83 ec 0c             	sub    $0xc,%esp
801034f0:	53                   	push   %ebx
801034f1:	e8 df 28 00 00       	call   80105dd5 <switchuvm>
801034f6:	c7 43 0c 04 00 00 00 	movl   $0x4,0xc(%ebx)
801034fd:	83 c4 08             	add    $0x8,%esp
80103500:	ff 73 1c             	push   0x1c(%ebx)
80103503:	57                   	push   %edi
80103504:	e8 d9 09 00 00       	call   80103ee2 <swtch>
80103509:	e8 b9 28 00 00       	call   80105dc7 <switchkvm>
8010350e:	c7 86 ac 00 00 00 00 	movl   $0x0,0xac(%esi)
80103515:	00 00 00 
80103518:	83 c4 10             	add    $0x10,%esp
8010351b:	eb b9                	jmp    801034d6 <scheduler+0x1f>
8010351d:	83 ec 0c             	sub    $0xc,%esp
80103520:	68 20 0d 11 80       	push   $0x80110d20
80103525:	e8 ab 07 00 00       	call   80103cd5 <release>
8010352a:	83 c4 10             	add    $0x10,%esp
8010352d:	fb                   	sti
8010352e:	83 ec 0c             	sub    $0xc,%esp
80103531:	68 20 0d 11 80       	push   $0x80110d20
80103536:	e8 33 07 00 00       	call   80103c6e <acquire>
8010353b:	83 c4 10             	add    $0x10,%esp
8010353e:	bb 54 0d 11 80       	mov    $0x80110d54,%ebx
80103543:	eb 9c                	jmp    801034e1 <scheduler+0x2a>

80103545 <sched>:
80103545:	55                   	push   %ebp
80103546:	89 e5                	mov    %esp,%ebp
80103548:	56                   	push   %esi
80103549:	53                   	push   %ebx
8010354a:	e8 ec fc ff ff       	call   8010323b <myproc>
8010354f:	89 c3                	mov    %eax,%ebx
80103551:	83 ec 0c             	sub    $0xc,%esp
80103554:	68 20 0d 11 80       	push   $0x80110d20
80103559:	e8 dc 06 00 00       	call   80103c3a <holding>
8010355e:	83 c4 10             	add    $0x10,%esp
80103561:	85 c0                	test   %eax,%eax
80103563:	74 4f                	je     801035b4 <sched+0x6f>
80103565:	e8 57 fc ff ff       	call   801031c1 <mycpu>
8010356a:	83 b8 a4 00 00 00 01 	cmpl   $0x1,0xa4(%eax)
80103571:	75 4e                	jne    801035c1 <sched+0x7c>
80103573:	83 7b 0c 04          	cmpl   $0x4,0xc(%ebx)
80103577:	74 55                	je     801035ce <sched+0x89>
80103579:	9c                   	pushf
8010357a:	58                   	pop    %eax
8010357b:	f6 c4 02             	test   $0x2,%ah
8010357e:	75 5b                	jne    801035db <sched+0x96>
80103580:	e8 3c fc ff ff       	call   801031c1 <mycpu>
80103585:	8b b0 a8 00 00 00    	mov    0xa8(%eax),%esi
8010358b:	e8 31 fc ff ff       	call   801031c1 <mycpu>
80103590:	83 ec 08             	sub    $0x8,%esp
80103593:	ff 70 04             	push   0x4(%eax)
80103596:	83 c3 1c             	add    $0x1c,%ebx
80103599:	53                   	push   %ebx
8010359a:	e8 43 09 00 00       	call   80103ee2 <swtch>
8010359f:	e8 1d fc ff ff       	call   801031c1 <mycpu>
801035a4:	89 b0 a8 00 00 00    	mov    %esi,0xa8(%eax)
801035aa:	83 c4 10             	add    $0x10,%esp
801035ad:	8d 65 f8             	lea    -0x8(%ebp),%esp
801035b0:	5b                   	pop    %ebx
801035b1:	5e                   	pop    %esi
801035b2:	5d                   	pop    %ebp
801035b3:	c3                   	ret
801035b4:	83 ec 0c             	sub    $0xc,%esp
801035b7:	68 b1 66 10 80       	push   $0x801066b1
801035bc:	e8 81 cd ff ff       	call   80100342 <panic>
801035c1:	83 ec 0c             	sub    $0xc,%esp
801035c4:	68 c3 66 10 80       	push   $0x801066c3
801035c9:	e8 74 cd ff ff       	call   80100342 <panic>
801035ce:	83 ec 0c             	sub    $0xc,%esp
801035d1:	68 cf 66 10 80       	push   $0x801066cf
801035d6:	e8 67 cd ff ff       	call   80100342 <panic>
801035db:	83 ec 0c             	sub    $0xc,%esp
801035de:	68 dd 66 10 80       	push   $0x801066dd
801035e3:	e8 5a cd ff ff       	call   80100342 <panic>

801035e8 <exit>:
801035e8:	55                   	push   %ebp
801035e9:	89 e5                	mov    %esp,%ebp
801035eb:	57                   	push   %edi
801035ec:	56                   	push   %esi
801035ed:	53                   	push   %ebx
801035ee:	83 ec 0c             	sub    $0xc,%esp
801035f1:	e8 45 fc ff ff       	call   8010323b <myproc>
801035f6:	89 c6                	mov    %eax,%esi
801035f8:	8d 58 28             	lea    0x28(%eax),%ebx
801035fb:	8d 78 68             	lea    0x68(%eax),%edi
801035fe:	39 05 54 2c 11 80    	cmp    %eax,0x80112c54
80103604:	75 26                	jne    8010362c <exit+0x44>
80103606:	83 ec 0c             	sub    $0xc,%esp
80103609:	68 f1 66 10 80       	push   $0x801066f1
8010360e:	e8 2f cd ff ff       	call   80100342 <panic>
80103613:	83 ec 0c             	sub    $0xc,%esp
80103616:	50                   	push   %eax
80103617:	e8 f3 d6 ff ff       	call   80100d0f <fileclose>
8010361c:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103622:	83 c4 10             	add    $0x10,%esp
80103625:	83 c3 04             	add    $0x4,%ebx
80103628:	39 fb                	cmp    %edi,%ebx
8010362a:	74 08                	je     80103634 <exit+0x4c>
8010362c:	8b 03                	mov    (%ebx),%eax
8010362e:	85 c0                	test   %eax,%eax
80103630:	75 e1                	jne    80103613 <exit+0x2b>
80103632:	eb f1                	jmp    80103625 <exit+0x3d>
80103634:	e8 e2 f0 ff ff       	call   8010271b <begin_op>
80103639:	83 ec 0c             	sub    $0xc,%esp
8010363c:	ff 76 68             	push   0x68(%esi)
8010363f:	e8 44 df ff ff       	call   80101588 <iput>
80103644:	e8 4d f1 ff ff       	call   80102796 <end_op>
80103649:	c7 46 68 00 00 00 00 	movl   $0x0,0x68(%esi)
80103650:	c7 04 24 20 0d 11 80 	movl   $0x80110d20,(%esp)
80103657:	e8 12 06 00 00       	call   80103c6e <acquire>
8010365c:	8b 46 14             	mov    0x14(%esi),%eax
8010365f:	e8 1d fa ff ff       	call   80103081 <wakeup1>
80103664:	83 c4 10             	add    $0x10,%esp
80103667:	bb 54 0d 11 80       	mov    $0x80110d54,%ebx
8010366c:	eb 0b                	jmp    80103679 <exit+0x91>
8010366e:	83 c3 7c             	add    $0x7c,%ebx
80103671:	81 fb 54 2c 11 80    	cmp    $0x80112c54,%ebx
80103677:	74 1a                	je     80103693 <exit+0xab>
80103679:	39 73 14             	cmp    %esi,0x14(%ebx)
8010367c:	75 f0                	jne    8010366e <exit+0x86>
8010367e:	a1 54 2c 11 80       	mov    0x80112c54,%eax
80103683:	89 43 14             	mov    %eax,0x14(%ebx)
80103686:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
8010368a:	75 e2                	jne    8010366e <exit+0x86>
8010368c:	e8 f0 f9 ff ff       	call   80103081 <wakeup1>
80103691:	eb db                	jmp    8010366e <exit+0x86>
80103693:	c7 46 0c 05 00 00 00 	movl   $0x5,0xc(%esi)
8010369a:	e8 a6 fe ff ff       	call   80103545 <sched>
8010369f:	83 ec 0c             	sub    $0xc,%esp
801036a2:	68 fe 66 10 80       	push   $0x801066fe
801036a7:	e8 96 cc ff ff       	call   80100342 <panic>

801036ac <yield>:
801036ac:	55                   	push   %ebp
801036ad:	89 e5                	mov    %esp,%ebp
801036af:	83 ec 14             	sub    $0x14,%esp
801036b2:	68 20 0d 11 80       	push   $0x80110d20
801036b7:	e8 b2 05 00 00       	call   80103c6e <acquire>
801036bc:	e8 7a fb ff ff       	call   8010323b <myproc>
801036c1:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
801036c8:	e8 78 fe ff ff       	call   80103545 <sched>
801036cd:	c7 04 24 20 0d 11 80 	movl   $0x80110d20,(%esp)
801036d4:	e8 fc 05 00 00       	call   80103cd5 <release>
801036d9:	83 c4 10             	add    $0x10,%esp
801036dc:	c9                   	leave
801036dd:	c3                   	ret

801036de <sleep>:
801036de:	55                   	push   %ebp
801036df:	89 e5                	mov    %esp,%ebp
801036e1:	56                   	push   %esi
801036e2:	53                   	push   %ebx
801036e3:	8b 75 0c             	mov    0xc(%ebp),%esi
801036e6:	e8 50 fb ff ff       	call   8010323b <myproc>
801036eb:	85 c0                	test   %eax,%eax
801036ed:	74 5a                	je     80103749 <sleep+0x6b>
801036ef:	89 c3                	mov    %eax,%ebx
801036f1:	85 f6                	test   %esi,%esi
801036f3:	74 61                	je     80103756 <sleep+0x78>
801036f5:	81 fe 20 0d 11 80    	cmp    $0x80110d20,%esi
801036fb:	74 66                	je     80103763 <sleep+0x85>
801036fd:	83 ec 0c             	sub    $0xc,%esp
80103700:	68 20 0d 11 80       	push   $0x80110d20
80103705:	e8 64 05 00 00       	call   80103c6e <acquire>
8010370a:	89 34 24             	mov    %esi,(%esp)
8010370d:	e8 c3 05 00 00       	call   80103cd5 <release>
80103712:	8b 45 08             	mov    0x8(%ebp),%eax
80103715:	89 43 20             	mov    %eax,0x20(%ebx)
80103718:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)
8010371f:	e8 21 fe ff ff       	call   80103545 <sched>
80103724:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
8010372b:	c7 04 24 20 0d 11 80 	movl   $0x80110d20,(%esp)
80103732:	e8 9e 05 00 00       	call   80103cd5 <release>
80103737:	89 34 24             	mov    %esi,(%esp)
8010373a:	e8 2f 05 00 00       	call   80103c6e <acquire>
8010373f:	83 c4 10             	add    $0x10,%esp
80103742:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103745:	5b                   	pop    %ebx
80103746:	5e                   	pop    %esi
80103747:	5d                   	pop    %ebp
80103748:	c3                   	ret
80103749:	83 ec 0c             	sub    $0xc,%esp
8010374c:	68 0a 67 10 80       	push   $0x8010670a
80103751:	e8 ec cb ff ff       	call   80100342 <panic>
80103756:	83 ec 0c             	sub    $0xc,%esp
80103759:	68 10 67 10 80       	push   $0x80106710
8010375e:	e8 df cb ff ff       	call   80100342 <panic>
80103763:	8b 45 08             	mov    0x8(%ebp),%eax
80103766:	89 43 20             	mov    %eax,0x20(%ebx)
80103769:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)
80103770:	e8 d0 fd ff ff       	call   80103545 <sched>
80103775:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
8010377c:	eb c4                	jmp    80103742 <sleep+0x64>

8010377e <wait>:
8010377e:	55                   	push   %ebp
8010377f:	89 e5                	mov    %esp,%ebp
80103781:	57                   	push   %edi
80103782:	56                   	push   %esi
80103783:	53                   	push   %ebx
80103784:	83 ec 0c             	sub    $0xc,%esp
80103787:	e8 af fa ff ff       	call   8010323b <myproc>
8010378c:	89 c6                	mov    %eax,%esi
8010378e:	83 ec 0c             	sub    $0xc,%esp
80103791:	68 20 0d 11 80       	push   $0x80110d20
80103796:	e8 d3 04 00 00       	call   80103c6e <acquire>
8010379b:	83 c4 10             	add    $0x10,%esp
8010379e:	bf 01 00 00 00       	mov    $0x1,%edi
801037a3:	b8 00 00 00 00       	mov    $0x0,%eax
801037a8:	bb 54 0d 11 80       	mov    $0x80110d54,%ebx
801037ad:	eb 64                	jmp    80103813 <wait+0x95>
801037af:	8b 73 10             	mov    0x10(%ebx),%esi
801037b2:	83 ec 0c             	sub    $0xc,%esp
801037b5:	ff 73 08             	push   0x8(%ebx)
801037b8:	e8 05 e8 ff ff       	call   80101fc2 <kfree>
801037bd:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
801037c4:	83 c4 04             	add    $0x4,%esp
801037c7:	ff 73 04             	push   0x4(%ebx)
801037ca:	e8 7a 29 00 00       	call   80106149 <freevm>
801037cf:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
801037d6:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
801037dd:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
801037e1:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
801037e8:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
801037ef:	c7 04 24 20 0d 11 80 	movl   $0x80110d20,(%esp)
801037f6:	e8 da 04 00 00       	call   80103cd5 <release>
801037fb:	83 c4 10             	add    $0x10,%esp
801037fe:	89 f0                	mov    %esi,%eax
80103800:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103803:	5b                   	pop    %ebx
80103804:	5e                   	pop    %esi
80103805:	5f                   	pop    %edi
80103806:	5d                   	pop    %ebp
80103807:	c3                   	ret
80103808:	83 c3 7c             	add    $0x7c,%ebx
8010380b:	81 fb 54 2c 11 80    	cmp    $0x80112c54,%ebx
80103811:	74 0f                	je     80103822 <wait+0xa4>
80103813:	39 73 14             	cmp    %esi,0x14(%ebx)
80103816:	75 f0                	jne    80103808 <wait+0x8a>
80103818:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
8010381c:	74 91                	je     801037af <wait+0x31>
8010381e:	89 f8                	mov    %edi,%eax
80103820:	eb e6                	jmp    80103808 <wait+0x8a>
80103822:	85 c0                	test   %eax,%eax
80103824:	74 1c                	je     80103842 <wait+0xc4>
80103826:	83 7e 24 00          	cmpl   $0x0,0x24(%esi)
8010382a:	75 16                	jne    80103842 <wait+0xc4>
8010382c:	83 ec 08             	sub    $0x8,%esp
8010382f:	68 20 0d 11 80       	push   $0x80110d20
80103834:	56                   	push   %esi
80103835:	e8 a4 fe ff ff       	call   801036de <sleep>
8010383a:	83 c4 10             	add    $0x10,%esp
8010383d:	e9 61 ff ff ff       	jmp    801037a3 <wait+0x25>
80103842:	83 ec 0c             	sub    $0xc,%esp
80103845:	68 20 0d 11 80       	push   $0x80110d20
8010384a:	e8 86 04 00 00       	call   80103cd5 <release>
8010384f:	83 c4 10             	add    $0x10,%esp
80103852:	be ff ff ff ff       	mov    $0xffffffff,%esi
80103857:	eb a5                	jmp    801037fe <wait+0x80>

80103859 <wakeup>:
80103859:	55                   	push   %ebp
8010385a:	89 e5                	mov    %esp,%ebp
8010385c:	83 ec 14             	sub    $0x14,%esp
8010385f:	68 20 0d 11 80       	push   $0x80110d20
80103864:	e8 05 04 00 00       	call   80103c6e <acquire>
80103869:	8b 45 08             	mov    0x8(%ebp),%eax
8010386c:	e8 10 f8 ff ff       	call   80103081 <wakeup1>
80103871:	c7 04 24 20 0d 11 80 	movl   $0x80110d20,(%esp)
80103878:	e8 58 04 00 00       	call   80103cd5 <release>
8010387d:	83 c4 10             	add    $0x10,%esp
80103880:	c9                   	leave
80103881:	c3                   	ret

80103882 <kill>:
80103882:	55                   	push   %ebp
80103883:	89 e5                	mov    %esp,%ebp
80103885:	53                   	push   %ebx
80103886:	83 ec 10             	sub    $0x10,%esp
80103889:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010388c:	68 20 0d 11 80       	push   $0x80110d20
80103891:	e8 d8 03 00 00       	call   80103c6e <acquire>
80103896:	83 c4 10             	add    $0x10,%esp
80103899:	b8 54 0d 11 80       	mov    $0x80110d54,%eax
8010389e:	39 58 10             	cmp    %ebx,0x10(%eax)
801038a1:	74 21                	je     801038c4 <kill+0x42>
801038a3:	83 c0 7c             	add    $0x7c,%eax
801038a6:	3d 54 2c 11 80       	cmp    $0x80112c54,%eax
801038ab:	75 f1                	jne    8010389e <kill+0x1c>
801038ad:	83 ec 0c             	sub    $0xc,%esp
801038b0:	68 20 0d 11 80       	push   $0x80110d20
801038b5:	e8 1b 04 00 00       	call   80103cd5 <release>
801038ba:	83 c4 10             	add    $0x10,%esp
801038bd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801038c2:	eb 22                	jmp    801038e6 <kill+0x64>
801038c4:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
801038cb:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
801038cf:	74 1a                	je     801038eb <kill+0x69>
801038d1:	83 ec 0c             	sub    $0xc,%esp
801038d4:	68 20 0d 11 80       	push   $0x80110d20
801038d9:	e8 f7 03 00 00       	call   80103cd5 <release>
801038de:	83 c4 10             	add    $0x10,%esp
801038e1:	b8 00 00 00 00       	mov    $0x0,%eax
801038e6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801038e9:	c9                   	leave
801038ea:	c3                   	ret
801038eb:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
801038f2:	eb dd                	jmp    801038d1 <kill+0x4f>

801038f4 <procdump>:
801038f4:	55                   	push   %ebp
801038f5:	89 e5                	mov    %esp,%ebp
801038f7:	57                   	push   %edi
801038f8:	56                   	push   %esi
801038f9:	53                   	push   %ebx
801038fa:	83 ec 3c             	sub    $0x3c,%esp
801038fd:	bb c0 0d 11 80       	mov    $0x80110dc0,%ebx
80103902:	bf c0 2c 11 80       	mov    $0x80112cc0,%edi
80103907:	eb 2f                	jmp    80103938 <procdump+0x44>
80103909:	56                   	push   %esi
8010390a:	52                   	push   %edx
8010390b:	ff 76 a4             	push   -0x5c(%esi)
8010390e:	68 25 67 10 80       	push   $0x80106725
80103913:	e8 f1 cc ff ff       	call   80100609 <cprintf>
80103918:	83 c4 10             	add    $0x10,%esp
8010391b:	83 7e a0 02          	cmpl   $0x2,-0x60(%esi)
8010391f:	74 3d                	je     8010395e <procdump+0x6a>
80103921:	83 ec 0c             	sub    $0xc,%esp
80103924:	68 f9 68 10 80       	push   $0x801068f9
80103929:	e8 db cc ff ff       	call   80100609 <cprintf>
8010392e:	83 c4 10             	add    $0x10,%esp
80103931:	83 c3 7c             	add    $0x7c,%ebx
80103934:	39 fb                	cmp    %edi,%ebx
80103936:	74 65                	je     8010399d <procdump+0xa9>
80103938:	89 de                	mov    %ebx,%esi
8010393a:	8b 43 a0             	mov    -0x60(%ebx),%eax
8010393d:	85 c0                	test   %eax,%eax
8010393f:	74 f0                	je     80103931 <procdump+0x3d>
80103941:	ba 21 67 10 80       	mov    $0x80106721,%edx
80103946:	83 f8 05             	cmp    $0x5,%eax
80103949:	77 be                	ja     80103909 <procdump+0x15>
8010394b:	8b 14 85 40 6d 10 80 	mov    -0x7fef92c0(,%eax,4),%edx
80103952:	85 d2                	test   %edx,%edx
80103954:	b8 21 67 10 80       	mov    $0x80106721,%eax
80103959:	0f 44 d0             	cmove  %eax,%edx
8010395c:	eb ab                	jmp    80103909 <procdump+0x15>
8010395e:	83 ec 08             	sub    $0x8,%esp
80103961:	8d 45 c0             	lea    -0x40(%ebp),%eax
80103964:	50                   	push   %eax
80103965:	8b 46 b0             	mov    -0x50(%esi),%eax
80103968:	8b 40 0c             	mov    0xc(%eax),%eax
8010396b:	83 c0 08             	add    $0x8,%eax
8010396e:	50                   	push   %eax
8010396f:	e8 cf 01 00 00       	call   80103b43 <getcallerpcs>
80103974:	8d 75 c0             	lea    -0x40(%ebp),%esi
80103977:	83 c4 10             	add    $0x10,%esp
8010397a:	8b 06                	mov    (%esi),%eax
8010397c:	85 c0                	test   %eax,%eax
8010397e:	74 a1                	je     80103921 <procdump+0x2d>
80103980:	83 ec 08             	sub    $0x8,%esp
80103983:	50                   	push   %eax
80103984:	68 61 64 10 80       	push   $0x80106461
80103989:	e8 7b cc ff ff       	call   80100609 <cprintf>
8010398e:	83 c6 04             	add    $0x4,%esi
80103991:	83 c4 10             	add    $0x10,%esp
80103994:	8d 45 e8             	lea    -0x18(%ebp),%eax
80103997:	39 c6                	cmp    %eax,%esi
80103999:	75 df                	jne    8010397a <procdump+0x86>
8010399b:	eb 84                	jmp    80103921 <procdump+0x2d>
8010399d:	8d 65 f4             	lea    -0xc(%ebp),%esp
801039a0:	5b                   	pop    %ebx
801039a1:	5e                   	pop    %esi
801039a2:	5f                   	pop    %edi
801039a3:	5d                   	pop    %ebp
801039a4:	c3                   	ret

801039a5 <ps>:
801039a5:	55                   	push   %ebp
801039a6:	89 e5                	mov    %esp,%ebp
801039a8:	57                   	push   %edi
801039a9:	56                   	push   %esi
801039aa:	53                   	push   %ebx
801039ab:	83 ec 18             	sub    $0x18,%esp
801039ae:	68 30 6a 10 80       	push   $0x80106a30
801039b3:	e8 51 cc ff ff       	call   80100609 <cprintf>
801039b8:	bb c0 0d 11 80       	mov    $0x80110dc0,%ebx
801039bd:	be c0 2c 11 80       	mov    $0x80112cc0,%esi
801039c2:	83 c4 10             	add    $0x10,%esp
801039c5:	eb 20                	jmp    801039e7 <ps+0x42>
801039c7:	83 ec 08             	sub    $0x8,%esp
801039ca:	ff 70 94             	push   -0x6c(%eax)
801039cd:	52                   	push   %edx
801039ce:	57                   	push   %edi
801039cf:	ff 70 a4             	push   -0x5c(%eax)
801039d2:	50                   	push   %eax
801039d3:	68 3f 67 10 80       	push   $0x8010673f
801039d8:	e8 2c cc ff ff       	call   80100609 <cprintf>
801039dd:	83 c4 20             	add    $0x20,%esp
801039e0:	83 c3 7c             	add    $0x7c,%ebx
801039e3:	39 f3                	cmp    %esi,%ebx
801039e5:	74 2a                	je     80103a11 <ps+0x6c>
801039e7:	89 d8                	mov    %ebx,%eax
801039e9:	8b 53 a0             	mov    -0x60(%ebx),%edx
801039ec:	85 d2                	test   %edx,%edx
801039ee:	74 f0                	je     801039e0 <ps+0x3b>
801039f0:	83 fa 04             	cmp    $0x4,%edx
801039f3:	bf 2e 67 10 80       	mov    $0x8010672e,%edi
801039f8:	b9 36 67 10 80       	mov    $0x80106736,%ecx
801039fd:	0f 45 f9             	cmovne %ecx,%edi
80103a00:	8b 4b a8             	mov    -0x58(%ebx),%ecx
80103a03:	ba 00 00 00 00       	mov    $0x0,%edx
80103a08:	85 c9                	test   %ecx,%ecx
80103a0a:	74 bb                	je     801039c7 <ps+0x22>
80103a0c:	8b 51 10             	mov    0x10(%ecx),%edx
80103a0f:	eb b6                	jmp    801039c7 <ps+0x22>
80103a11:	b8 00 00 00 00       	mov    $0x0,%eax
80103a16:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103a19:	5b                   	pop    %ebx
80103a1a:	5e                   	pop    %esi
80103a1b:	5f                   	pop    %edi
80103a1c:	5d                   	pop    %ebp
80103a1d:	c3                   	ret

80103a1e <initsleeplock>:
80103a1e:	55                   	push   %ebp
80103a1f:	89 e5                	mov    %esp,%ebp
80103a21:	53                   	push   %ebx
80103a22:	83 ec 0c             	sub    $0xc,%esp
80103a25:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103a28:	68 82 67 10 80       	push   $0x80106782
80103a2d:	8d 43 04             	lea    0x4(%ebx),%eax
80103a30:	50                   	push   %eax
80103a31:	e8 f2 00 00 00       	call   80103b28 <initlock>
80103a36:	8b 45 0c             	mov    0xc(%ebp),%eax
80103a39:	89 43 38             	mov    %eax,0x38(%ebx)
80103a3c:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103a42:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
80103a49:	83 c4 10             	add    $0x10,%esp
80103a4c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103a4f:	c9                   	leave
80103a50:	c3                   	ret

80103a51 <acquiresleep>:
80103a51:	55                   	push   %ebp
80103a52:	89 e5                	mov    %esp,%ebp
80103a54:	56                   	push   %esi
80103a55:	53                   	push   %ebx
80103a56:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103a59:	8d 73 04             	lea    0x4(%ebx),%esi
80103a5c:	83 ec 0c             	sub    $0xc,%esp
80103a5f:	56                   	push   %esi
80103a60:	e8 09 02 00 00       	call   80103c6e <acquire>
80103a65:	83 c4 10             	add    $0x10,%esp
80103a68:	83 3b 00             	cmpl   $0x0,(%ebx)
80103a6b:	74 12                	je     80103a7f <acquiresleep+0x2e>
80103a6d:	83 ec 08             	sub    $0x8,%esp
80103a70:	56                   	push   %esi
80103a71:	53                   	push   %ebx
80103a72:	e8 67 fc ff ff       	call   801036de <sleep>
80103a77:	83 c4 10             	add    $0x10,%esp
80103a7a:	83 3b 00             	cmpl   $0x0,(%ebx)
80103a7d:	75 ee                	jne    80103a6d <acquiresleep+0x1c>
80103a7f:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
80103a85:	e8 b1 f7 ff ff       	call   8010323b <myproc>
80103a8a:	8b 40 10             	mov    0x10(%eax),%eax
80103a8d:	89 43 3c             	mov    %eax,0x3c(%ebx)
80103a90:	83 ec 0c             	sub    $0xc,%esp
80103a93:	56                   	push   %esi
80103a94:	e8 3c 02 00 00       	call   80103cd5 <release>
80103a99:	83 c4 10             	add    $0x10,%esp
80103a9c:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103a9f:	5b                   	pop    %ebx
80103aa0:	5e                   	pop    %esi
80103aa1:	5d                   	pop    %ebp
80103aa2:	c3                   	ret

80103aa3 <releasesleep>:
80103aa3:	55                   	push   %ebp
80103aa4:	89 e5                	mov    %esp,%ebp
80103aa6:	56                   	push   %esi
80103aa7:	53                   	push   %ebx
80103aa8:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103aab:	8d 73 04             	lea    0x4(%ebx),%esi
80103aae:	83 ec 0c             	sub    $0xc,%esp
80103ab1:	56                   	push   %esi
80103ab2:	e8 b7 01 00 00       	call   80103c6e <acquire>
80103ab7:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103abd:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
80103ac4:	89 1c 24             	mov    %ebx,(%esp)
80103ac7:	e8 8d fd ff ff       	call   80103859 <wakeup>
80103acc:	89 34 24             	mov    %esi,(%esp)
80103acf:	e8 01 02 00 00       	call   80103cd5 <release>
80103ad4:	83 c4 10             	add    $0x10,%esp
80103ad7:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103ada:	5b                   	pop    %ebx
80103adb:	5e                   	pop    %esi
80103adc:	5d                   	pop    %ebp
80103add:	c3                   	ret

80103ade <holdingsleep>:
80103ade:	55                   	push   %ebp
80103adf:	89 e5                	mov    %esp,%ebp
80103ae1:	57                   	push   %edi
80103ae2:	56                   	push   %esi
80103ae3:	53                   	push   %ebx
80103ae4:	83 ec 18             	sub    $0x18,%esp
80103ae7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103aea:	8d 73 04             	lea    0x4(%ebx),%esi
80103aed:	56                   	push   %esi
80103aee:	e8 7b 01 00 00       	call   80103c6e <acquire>
80103af3:	83 c4 10             	add    $0x10,%esp
80103af6:	bf 00 00 00 00       	mov    $0x0,%edi
80103afb:	83 3b 00             	cmpl   $0x0,(%ebx)
80103afe:	75 13                	jne    80103b13 <holdingsleep+0x35>
80103b00:	83 ec 0c             	sub    $0xc,%esp
80103b03:	56                   	push   %esi
80103b04:	e8 cc 01 00 00       	call   80103cd5 <release>
80103b09:	89 f8                	mov    %edi,%eax
80103b0b:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103b0e:	5b                   	pop    %ebx
80103b0f:	5e                   	pop    %esi
80103b10:	5f                   	pop    %edi
80103b11:	5d                   	pop    %ebp
80103b12:	c3                   	ret
80103b13:	8b 5b 3c             	mov    0x3c(%ebx),%ebx
80103b16:	e8 20 f7 ff ff       	call   8010323b <myproc>
80103b1b:	39 58 10             	cmp    %ebx,0x10(%eax)
80103b1e:	0f 94 c0             	sete   %al
80103b21:	0f b6 c0             	movzbl %al,%eax
80103b24:	89 c7                	mov    %eax,%edi
80103b26:	eb d8                	jmp    80103b00 <holdingsleep+0x22>

80103b28 <initlock>:
80103b28:	55                   	push   %ebp
80103b29:	89 e5                	mov    %esp,%ebp
80103b2b:	8b 45 08             	mov    0x8(%ebp),%eax
80103b2e:	8b 55 0c             	mov    0xc(%ebp),%edx
80103b31:	89 50 04             	mov    %edx,0x4(%eax)
80103b34:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80103b3a:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
80103b41:	5d                   	pop    %ebp
80103b42:	c3                   	ret

80103b43 <getcallerpcs>:
80103b43:	55                   	push   %ebp
80103b44:	89 e5                	mov    %esp,%ebp
80103b46:	53                   	push   %ebx
80103b47:	8b 45 08             	mov    0x8(%ebp),%eax
80103b4a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80103b4d:	8d 50 f8             	lea    -0x8(%eax),%edx
80103b50:	05 f8 ff ff 7f       	add    $0x7ffffff8,%eax
80103b55:	3d fe ff ff 7f       	cmp    $0x7ffffffe,%eax
80103b5a:	77 3b                	ja     80103b97 <getcallerpcs+0x54>
80103b5c:	b8 00 00 00 00       	mov    $0x0,%eax
80103b61:	8b 5a 04             	mov    0x4(%edx),%ebx
80103b64:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
80103b67:	8b 12                	mov    (%edx),%edx
80103b69:	83 c0 01             	add    $0x1,%eax
80103b6c:	83 f8 0a             	cmp    $0xa,%eax
80103b6f:	74 21                	je     80103b92 <getcallerpcs+0x4f>
80103b71:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
80103b77:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
80103b7d:	76 e2                	jbe    80103b61 <getcallerpcs+0x1e>
80103b7f:	8d 04 81             	lea    (%ecx,%eax,4),%eax
80103b82:	8d 51 28             	lea    0x28(%ecx),%edx
80103b85:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80103b8b:	83 c0 04             	add    $0x4,%eax
80103b8e:	39 d0                	cmp    %edx,%eax
80103b90:	75 f3                	jne    80103b85 <getcallerpcs+0x42>
80103b92:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103b95:	c9                   	leave
80103b96:	c3                   	ret
80103b97:	b8 00 00 00 00       	mov    $0x0,%eax
80103b9c:	eb e1                	jmp    80103b7f <getcallerpcs+0x3c>

80103b9e <pushcli>:
80103b9e:	55                   	push   %ebp
80103b9f:	89 e5                	mov    %esp,%ebp
80103ba1:	53                   	push   %ebx
80103ba2:	83 ec 04             	sub    $0x4,%esp
80103ba5:	9c                   	pushf
80103ba6:	5b                   	pop    %ebx
80103ba7:	fa                   	cli
80103ba8:	e8 14 f6 ff ff       	call   801031c1 <mycpu>
80103bad:	83 b8 a4 00 00 00 00 	cmpl   $0x0,0xa4(%eax)
80103bb4:	74 11                	je     80103bc7 <pushcli+0x29>
80103bb6:	e8 06 f6 ff ff       	call   801031c1 <mycpu>
80103bbb:	83 80 a4 00 00 00 01 	addl   $0x1,0xa4(%eax)
80103bc2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103bc5:	c9                   	leave
80103bc6:	c3                   	ret
80103bc7:	e8 f5 f5 ff ff       	call   801031c1 <mycpu>
80103bcc:	81 e3 00 02 00 00    	and    $0x200,%ebx
80103bd2:	89 98 a8 00 00 00    	mov    %ebx,0xa8(%eax)
80103bd8:	eb dc                	jmp    80103bb6 <pushcli+0x18>

80103bda <popcli>:
80103bda:	55                   	push   %ebp
80103bdb:	89 e5                	mov    %esp,%ebp
80103bdd:	83 ec 08             	sub    $0x8,%esp
80103be0:	9c                   	pushf
80103be1:	58                   	pop    %eax
80103be2:	f6 c4 02             	test   $0x2,%ah
80103be5:	75 28                	jne    80103c0f <popcli+0x35>
80103be7:	e8 d5 f5 ff ff       	call   801031c1 <mycpu>
80103bec:	8b 88 a4 00 00 00    	mov    0xa4(%eax),%ecx
80103bf2:	8d 51 ff             	lea    -0x1(%ecx),%edx
80103bf5:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
80103bfb:	85 d2                	test   %edx,%edx
80103bfd:	78 1d                	js     80103c1c <popcli+0x42>
80103bff:	e8 bd f5 ff ff       	call   801031c1 <mycpu>
80103c04:	83 b8 a4 00 00 00 00 	cmpl   $0x0,0xa4(%eax)
80103c0b:	74 1c                	je     80103c29 <popcli+0x4f>
80103c0d:	c9                   	leave
80103c0e:	c3                   	ret
80103c0f:	83 ec 0c             	sub    $0xc,%esp
80103c12:	68 8d 67 10 80       	push   $0x8010678d
80103c17:	e8 26 c7 ff ff       	call   80100342 <panic>
80103c1c:	83 ec 0c             	sub    $0xc,%esp
80103c1f:	68 a4 67 10 80       	push   $0x801067a4
80103c24:	e8 19 c7 ff ff       	call   80100342 <panic>
80103c29:	e8 93 f5 ff ff       	call   801031c1 <mycpu>
80103c2e:	83 b8 a8 00 00 00 00 	cmpl   $0x0,0xa8(%eax)
80103c35:	74 d6                	je     80103c0d <popcli+0x33>
80103c37:	fb                   	sti
80103c38:	eb d3                	jmp    80103c0d <popcli+0x33>

80103c3a <holding>:
80103c3a:	55                   	push   %ebp
80103c3b:	89 e5                	mov    %esp,%ebp
80103c3d:	56                   	push   %esi
80103c3e:	53                   	push   %ebx
80103c3f:	8b 75 08             	mov    0x8(%ebp),%esi
80103c42:	e8 57 ff ff ff       	call   80103b9e <pushcli>
80103c47:	bb 00 00 00 00       	mov    $0x0,%ebx
80103c4c:	83 3e 00             	cmpl   $0x0,(%esi)
80103c4f:	75 0b                	jne    80103c5c <holding+0x22>
80103c51:	e8 84 ff ff ff       	call   80103bda <popcli>
80103c56:	89 d8                	mov    %ebx,%eax
80103c58:	5b                   	pop    %ebx
80103c59:	5e                   	pop    %esi
80103c5a:	5d                   	pop    %ebp
80103c5b:	c3                   	ret
80103c5c:	8b 5e 08             	mov    0x8(%esi),%ebx
80103c5f:	e8 5d f5 ff ff       	call   801031c1 <mycpu>
80103c64:	39 c3                	cmp    %eax,%ebx
80103c66:	0f 94 c3             	sete   %bl
80103c69:	0f b6 db             	movzbl %bl,%ebx
80103c6c:	eb e3                	jmp    80103c51 <holding+0x17>

80103c6e <acquire>:
80103c6e:	55                   	push   %ebp
80103c6f:	89 e5                	mov    %esp,%ebp
80103c71:	53                   	push   %ebx
80103c72:	83 ec 04             	sub    $0x4,%esp
80103c75:	e8 24 ff ff ff       	call   80103b9e <pushcli>
80103c7a:	83 ec 0c             	sub    $0xc,%esp
80103c7d:	ff 75 08             	push   0x8(%ebp)
80103c80:	e8 b5 ff ff ff       	call   80103c3a <holding>
80103c85:	83 c4 10             	add    $0x10,%esp
80103c88:	85 c0                	test   %eax,%eax
80103c8a:	75 3c                	jne    80103cc8 <acquire+0x5a>
80103c8c:	b9 01 00 00 00       	mov    $0x1,%ecx
80103c91:	8b 55 08             	mov    0x8(%ebp),%edx
80103c94:	89 c8                	mov    %ecx,%eax
80103c96:	f0 87 02             	lock xchg %eax,(%edx)
80103c99:	85 c0                	test   %eax,%eax
80103c9b:	75 f4                	jne    80103c91 <acquire+0x23>
80103c9d:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
80103ca2:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103ca5:	e8 17 f5 ff ff       	call   801031c1 <mycpu>
80103caa:	89 43 08             	mov    %eax,0x8(%ebx)
80103cad:	83 ec 08             	sub    $0x8,%esp
80103cb0:	8b 45 08             	mov    0x8(%ebp),%eax
80103cb3:	83 c0 0c             	add    $0xc,%eax
80103cb6:	50                   	push   %eax
80103cb7:	8d 45 08             	lea    0x8(%ebp),%eax
80103cba:	50                   	push   %eax
80103cbb:	e8 83 fe ff ff       	call   80103b43 <getcallerpcs>
80103cc0:	83 c4 10             	add    $0x10,%esp
80103cc3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103cc6:	c9                   	leave
80103cc7:	c3                   	ret
80103cc8:	83 ec 0c             	sub    $0xc,%esp
80103ccb:	68 ab 67 10 80       	push   $0x801067ab
80103cd0:	e8 6d c6 ff ff       	call   80100342 <panic>

80103cd5 <release>:
80103cd5:	55                   	push   %ebp
80103cd6:	89 e5                	mov    %esp,%ebp
80103cd8:	53                   	push   %ebx
80103cd9:	83 ec 10             	sub    $0x10,%esp
80103cdc:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103cdf:	53                   	push   %ebx
80103ce0:	e8 55 ff ff ff       	call   80103c3a <holding>
80103ce5:	83 c4 10             	add    $0x10,%esp
80103ce8:	85 c0                	test   %eax,%eax
80103cea:	74 23                	je     80103d0f <release+0x3a>
80103cec:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
80103cf3:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
80103cfa:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
80103cff:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103d05:	e8 d0 fe ff ff       	call   80103bda <popcli>
80103d0a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103d0d:	c9                   	leave
80103d0e:	c3                   	ret
80103d0f:	83 ec 0c             	sub    $0xc,%esp
80103d12:	68 b3 67 10 80       	push   $0x801067b3
80103d17:	e8 26 c6 ff ff       	call   80100342 <panic>

80103d1c <memset>:
80103d1c:	55                   	push   %ebp
80103d1d:	89 e5                	mov    %esp,%ebp
80103d1f:	57                   	push   %edi
80103d20:	8b 55 08             	mov    0x8(%ebp),%edx
80103d23:	8b 4d 10             	mov    0x10(%ebp),%ecx
80103d26:	89 d0                	mov    %edx,%eax
80103d28:	09 c8                	or     %ecx,%eax
80103d2a:	a8 03                	test   $0x3,%al
80103d2c:	75 14                	jne    80103d42 <memset+0x26>
80103d2e:	c1 e9 02             	shr    $0x2,%ecx
80103d31:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
80103d35:	69 c0 01 01 01 01    	imul   $0x1010101,%eax,%eax
80103d3b:	89 d7                	mov    %edx,%edi
80103d3d:	fc                   	cld
80103d3e:	f3 ab                	rep stos %eax,%es:(%edi)
80103d40:	eb 08                	jmp    80103d4a <memset+0x2e>
80103d42:	89 d7                	mov    %edx,%edi
80103d44:	8b 45 0c             	mov    0xc(%ebp),%eax
80103d47:	fc                   	cld
80103d48:	f3 aa                	rep stos %al,%es:(%edi)
80103d4a:	89 d0                	mov    %edx,%eax
80103d4c:	8b 7d fc             	mov    -0x4(%ebp),%edi
80103d4f:	c9                   	leave
80103d50:	c3                   	ret

80103d51 <memcmp>:
80103d51:	55                   	push   %ebp
80103d52:	89 e5                	mov    %esp,%ebp
80103d54:	56                   	push   %esi
80103d55:	53                   	push   %ebx
80103d56:	8b 45 08             	mov    0x8(%ebp),%eax
80103d59:	8b 55 0c             	mov    0xc(%ebp),%edx
80103d5c:	8b 75 10             	mov    0x10(%ebp),%esi
80103d5f:	85 f6                	test   %esi,%esi
80103d61:	74 29                	je     80103d8c <memcmp+0x3b>
80103d63:	01 c6                	add    %eax,%esi
80103d65:	0f b6 08             	movzbl (%eax),%ecx
80103d68:	0f b6 1a             	movzbl (%edx),%ebx
80103d6b:	38 d9                	cmp    %bl,%cl
80103d6d:	75 11                	jne    80103d80 <memcmp+0x2f>
80103d6f:	83 c0 01             	add    $0x1,%eax
80103d72:	83 c2 01             	add    $0x1,%edx
80103d75:	39 c6                	cmp    %eax,%esi
80103d77:	75 ec                	jne    80103d65 <memcmp+0x14>
80103d79:	b8 00 00 00 00       	mov    $0x0,%eax
80103d7e:	eb 08                	jmp    80103d88 <memcmp+0x37>
80103d80:	0f b6 c1             	movzbl %cl,%eax
80103d83:	0f b6 db             	movzbl %bl,%ebx
80103d86:	29 d8                	sub    %ebx,%eax
80103d88:	5b                   	pop    %ebx
80103d89:	5e                   	pop    %esi
80103d8a:	5d                   	pop    %ebp
80103d8b:	c3                   	ret
80103d8c:	b8 00 00 00 00       	mov    $0x0,%eax
80103d91:	eb f5                	jmp    80103d88 <memcmp+0x37>

80103d93 <memmove>:
80103d93:	55                   	push   %ebp
80103d94:	89 e5                	mov    %esp,%ebp
80103d96:	56                   	push   %esi
80103d97:	53                   	push   %ebx
80103d98:	8b 75 08             	mov    0x8(%ebp),%esi
80103d9b:	8b 45 0c             	mov    0xc(%ebp),%eax
80103d9e:	8b 4d 10             	mov    0x10(%ebp),%ecx
80103da1:	39 f0                	cmp    %esi,%eax
80103da3:	72 20                	jb     80103dc5 <memmove+0x32>
80103da5:	8d 1c 08             	lea    (%eax,%ecx,1),%ebx
80103da8:	89 f2                	mov    %esi,%edx
80103daa:	85 c9                	test   %ecx,%ecx
80103dac:	74 11                	je     80103dbf <memmove+0x2c>
80103dae:	83 c0 01             	add    $0x1,%eax
80103db1:	83 c2 01             	add    $0x1,%edx
80103db4:	0f b6 48 ff          	movzbl -0x1(%eax),%ecx
80103db8:	88 4a ff             	mov    %cl,-0x1(%edx)
80103dbb:	39 d8                	cmp    %ebx,%eax
80103dbd:	75 ef                	jne    80103dae <memmove+0x1b>
80103dbf:	89 f0                	mov    %esi,%eax
80103dc1:	5b                   	pop    %ebx
80103dc2:	5e                   	pop    %esi
80103dc3:	5d                   	pop    %ebp
80103dc4:	c3                   	ret
80103dc5:	8d 14 08             	lea    (%eax,%ecx,1),%edx
80103dc8:	39 d6                	cmp    %edx,%esi
80103dca:	73 d9                	jae    80103da5 <memmove+0x12>
80103dcc:	8d 51 ff             	lea    -0x1(%ecx),%edx
80103dcf:	85 c9                	test   %ecx,%ecx
80103dd1:	74 ec                	je     80103dbf <memmove+0x2c>
80103dd3:	0f b6 0c 10          	movzbl (%eax,%edx,1),%ecx
80103dd7:	88 0c 16             	mov    %cl,(%esi,%edx,1)
80103dda:	83 ea 01             	sub    $0x1,%edx
80103ddd:	83 fa ff             	cmp    $0xffffffff,%edx
80103de0:	75 f1                	jne    80103dd3 <memmove+0x40>
80103de2:	eb db                	jmp    80103dbf <memmove+0x2c>

80103de4 <memcpy>:
80103de4:	55                   	push   %ebp
80103de5:	89 e5                	mov    %esp,%ebp
80103de7:	83 ec 0c             	sub    $0xc,%esp
80103dea:	ff 75 10             	push   0x10(%ebp)
80103ded:	ff 75 0c             	push   0xc(%ebp)
80103df0:	ff 75 08             	push   0x8(%ebp)
80103df3:	e8 9b ff ff ff       	call   80103d93 <memmove>
80103df8:	c9                   	leave
80103df9:	c3                   	ret

80103dfa <strncmp>:
80103dfa:	55                   	push   %ebp
80103dfb:	89 e5                	mov    %esp,%ebp
80103dfd:	53                   	push   %ebx
80103dfe:	8b 45 08             	mov    0x8(%ebp),%eax
80103e01:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80103e04:	8b 55 10             	mov    0x10(%ebp),%edx
80103e07:	85 d2                	test   %edx,%edx
80103e09:	74 1d                	je     80103e28 <strncmp+0x2e>
80103e0b:	0f b6 18             	movzbl (%eax),%ebx
80103e0e:	84 db                	test   %bl,%bl
80103e10:	74 1d                	je     80103e2f <strncmp+0x35>
80103e12:	3a 19                	cmp    (%ecx),%bl
80103e14:	75 19                	jne    80103e2f <strncmp+0x35>
80103e16:	83 c0 01             	add    $0x1,%eax
80103e19:	83 c1 01             	add    $0x1,%ecx
80103e1c:	83 ea 01             	sub    $0x1,%edx
80103e1f:	75 ea                	jne    80103e0b <strncmp+0x11>
80103e21:	b8 00 00 00 00       	mov    $0x0,%eax
80103e26:	eb 0f                	jmp    80103e37 <strncmp+0x3d>
80103e28:	b8 00 00 00 00       	mov    $0x0,%eax
80103e2d:	eb 08                	jmp    80103e37 <strncmp+0x3d>
80103e2f:	0f b6 00             	movzbl (%eax),%eax
80103e32:	0f b6 11             	movzbl (%ecx),%edx
80103e35:	29 d0                	sub    %edx,%eax
80103e37:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103e3a:	c9                   	leave
80103e3b:	c3                   	ret

80103e3c <strncpy>:
80103e3c:	55                   	push   %ebp
80103e3d:	89 e5                	mov    %esp,%ebp
80103e3f:	57                   	push   %edi
80103e40:	56                   	push   %esi
80103e41:	53                   	push   %ebx
80103e42:	8b 75 08             	mov    0x8(%ebp),%esi
80103e45:	8b 45 10             	mov    0x10(%ebp),%eax
80103e48:	89 f2                	mov    %esi,%edx
80103e4a:	89 c3                	mov    %eax,%ebx
80103e4c:	83 e8 01             	sub    $0x1,%eax
80103e4f:	85 db                	test   %ebx,%ebx
80103e51:	7e 30                	jle    80103e83 <strncpy+0x47>
80103e53:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
80103e57:	83 c2 01             	add    $0x1,%edx
80103e5a:	8b 7d 0c             	mov    0xc(%ebp),%edi
80103e5d:	0f b6 7f ff          	movzbl -0x1(%edi),%edi
80103e61:	89 f9                	mov    %edi,%ecx
80103e63:	88 4a ff             	mov    %cl,-0x1(%edx)
80103e66:	84 c9                	test   %cl,%cl
80103e68:	75 e0                	jne    80103e4a <strncpy+0xe>
80103e6a:	85 c0                	test   %eax,%eax
80103e6c:	7e 15                	jle    80103e83 <strncpy+0x47>
80103e6e:	89 d0                	mov    %edx,%eax
80103e70:	8d 4c 1a ff          	lea    -0x1(%edx,%ebx,1),%ecx
80103e74:	83 c0 01             	add    $0x1,%eax
80103e77:	c6 40 ff 00          	movb   $0x0,-0x1(%eax)
80103e7b:	89 ca                	mov    %ecx,%edx
80103e7d:	29 c2                	sub    %eax,%edx
80103e7f:	85 d2                	test   %edx,%edx
80103e81:	7f f1                	jg     80103e74 <strncpy+0x38>
80103e83:	89 f0                	mov    %esi,%eax
80103e85:	5b                   	pop    %ebx
80103e86:	5e                   	pop    %esi
80103e87:	5f                   	pop    %edi
80103e88:	5d                   	pop    %ebp
80103e89:	c3                   	ret

80103e8a <safestrcpy>:
80103e8a:	55                   	push   %ebp
80103e8b:	89 e5                	mov    %esp,%ebp
80103e8d:	56                   	push   %esi
80103e8e:	53                   	push   %ebx
80103e8f:	8b 75 08             	mov    0x8(%ebp),%esi
80103e92:	8b 45 0c             	mov    0xc(%ebp),%eax
80103e95:	8b 55 10             	mov    0x10(%ebp),%edx
80103e98:	85 d2                	test   %edx,%edx
80103e9a:	7e 1e                	jle    80103eba <safestrcpy+0x30>
80103e9c:	8d 5c 10 ff          	lea    -0x1(%eax,%edx,1),%ebx
80103ea0:	89 f2                	mov    %esi,%edx
80103ea2:	39 d8                	cmp    %ebx,%eax
80103ea4:	74 11                	je     80103eb7 <safestrcpy+0x2d>
80103ea6:	83 c0 01             	add    $0x1,%eax
80103ea9:	83 c2 01             	add    $0x1,%edx
80103eac:	0f b6 48 ff          	movzbl -0x1(%eax),%ecx
80103eb0:	88 4a ff             	mov    %cl,-0x1(%edx)
80103eb3:	84 c9                	test   %cl,%cl
80103eb5:	75 eb                	jne    80103ea2 <safestrcpy+0x18>
80103eb7:	c6 02 00             	movb   $0x0,(%edx)
80103eba:	89 f0                	mov    %esi,%eax
80103ebc:	5b                   	pop    %ebx
80103ebd:	5e                   	pop    %esi
80103ebe:	5d                   	pop    %ebp
80103ebf:	c3                   	ret

80103ec0 <strlen>:
80103ec0:	55                   	push   %ebp
80103ec1:	89 e5                	mov    %esp,%ebp
80103ec3:	8b 55 08             	mov    0x8(%ebp),%edx
80103ec6:	80 3a 00             	cmpb   $0x0,(%edx)
80103ec9:	74 10                	je     80103edb <strlen+0x1b>
80103ecb:	b8 00 00 00 00       	mov    $0x0,%eax
80103ed0:	83 c0 01             	add    $0x1,%eax
80103ed3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
80103ed7:	75 f7                	jne    80103ed0 <strlen+0x10>
80103ed9:	5d                   	pop    %ebp
80103eda:	c3                   	ret
80103edb:	b8 00 00 00 00       	mov    $0x0,%eax
80103ee0:	eb f7                	jmp    80103ed9 <strlen+0x19>

80103ee2 <swtch>:
# a struct context, and save its address in *old.
# Switch stacks to new and pop previously-saved registers.

.globl swtch
swtch:
  movl 4(%esp), %eax
80103ee2:	8b 44 24 04          	mov    0x4(%esp),%eax
  movl 8(%esp), %edx
80103ee6:	8b 54 24 08          	mov    0x8(%esp),%edx

  # Save old callee-saved registers
  pushl %ebp
80103eea:	55                   	push   %ebp
  pushl %ebx
80103eeb:	53                   	push   %ebx
  pushl %esi
80103eec:	56                   	push   %esi
  pushl %edi
80103eed:	57                   	push   %edi

  # Switch stacks
  movl %esp, (%eax)
80103eee:	89 20                	mov    %esp,(%eax)
  movl %edx, %esp
80103ef0:	89 d4                	mov    %edx,%esp

  # Load new callee-saved registers
  popl %edi
80103ef2:	5f                   	pop    %edi
  popl %esi
80103ef3:	5e                   	pop    %esi
  popl %ebx
80103ef4:	5b                   	pop    %ebx
  popl %ebp
80103ef5:	5d                   	pop    %ebp
  ret
80103ef6:	c3                   	ret

80103ef7 <fetchint>:
80103ef7:	55                   	push   %ebp
80103ef8:	89 e5                	mov    %esp,%ebp
80103efa:	53                   	push   %ebx
80103efb:	83 ec 04             	sub    $0x4,%esp
80103efe:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103f01:	e8 35 f3 ff ff       	call   8010323b <myproc>
80103f06:	8b 00                	mov    (%eax),%eax
80103f08:	39 c3                	cmp    %eax,%ebx
80103f0a:	73 18                	jae    80103f24 <fetchint+0x2d>
80103f0c:	8d 53 04             	lea    0x4(%ebx),%edx
80103f0f:	39 d0                	cmp    %edx,%eax
80103f11:	72 18                	jb     80103f2b <fetchint+0x34>
80103f13:	8b 13                	mov    (%ebx),%edx
80103f15:	8b 45 0c             	mov    0xc(%ebp),%eax
80103f18:	89 10                	mov    %edx,(%eax)
80103f1a:	b8 00 00 00 00       	mov    $0x0,%eax
80103f1f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103f22:	c9                   	leave
80103f23:	c3                   	ret
80103f24:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103f29:	eb f4                	jmp    80103f1f <fetchint+0x28>
80103f2b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103f30:	eb ed                	jmp    80103f1f <fetchint+0x28>

80103f32 <fetchstr>:
80103f32:	55                   	push   %ebp
80103f33:	89 e5                	mov    %esp,%ebp
80103f35:	53                   	push   %ebx
80103f36:	83 ec 04             	sub    $0x4,%esp
80103f39:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103f3c:	e8 fa f2 ff ff       	call   8010323b <myproc>
80103f41:	3b 18                	cmp    (%eax),%ebx
80103f43:	73 27                	jae    80103f6c <fetchstr+0x3a>
80103f45:	8b 55 0c             	mov    0xc(%ebp),%edx
80103f48:	89 1a                	mov    %ebx,(%edx)
80103f4a:	8b 10                	mov    (%eax),%edx
80103f4c:	39 d3                	cmp    %edx,%ebx
80103f4e:	73 23                	jae    80103f73 <fetchstr+0x41>
80103f50:	89 d8                	mov    %ebx,%eax
80103f52:	80 38 00             	cmpb   $0x0,(%eax)
80103f55:	74 0e                	je     80103f65 <fetchstr+0x33>
80103f57:	83 c0 01             	add    $0x1,%eax
80103f5a:	39 d0                	cmp    %edx,%eax
80103f5c:	72 f4                	jb     80103f52 <fetchstr+0x20>
80103f5e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103f63:	eb 02                	jmp    80103f67 <fetchstr+0x35>
80103f65:	29 d8                	sub    %ebx,%eax
80103f67:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103f6a:	c9                   	leave
80103f6b:	c3                   	ret
80103f6c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103f71:	eb f4                	jmp    80103f67 <fetchstr+0x35>
80103f73:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103f78:	eb ed                	jmp    80103f67 <fetchstr+0x35>

80103f7a <argint>:
80103f7a:	55                   	push   %ebp
80103f7b:	89 e5                	mov    %esp,%ebp
80103f7d:	83 ec 08             	sub    $0x8,%esp
80103f80:	e8 b6 f2 ff ff       	call   8010323b <myproc>
80103f85:	83 ec 08             	sub    $0x8,%esp
80103f88:	ff 75 0c             	push   0xc(%ebp)
80103f8b:	8b 40 18             	mov    0x18(%eax),%eax
80103f8e:	8b 40 44             	mov    0x44(%eax),%eax
80103f91:	8b 55 08             	mov    0x8(%ebp),%edx
80103f94:	8d 44 90 04          	lea    0x4(%eax,%edx,4),%eax
80103f98:	50                   	push   %eax
80103f99:	e8 59 ff ff ff       	call   80103ef7 <fetchint>
80103f9e:	c9                   	leave
80103f9f:	c3                   	ret

80103fa0 <argptr>:
80103fa0:	55                   	push   %ebp
80103fa1:	89 e5                	mov    %esp,%ebp
80103fa3:	56                   	push   %esi
80103fa4:	53                   	push   %ebx
80103fa5:	83 ec 10             	sub    $0x10,%esp
80103fa8:	8b 5d 10             	mov    0x10(%ebp),%ebx
80103fab:	e8 8b f2 ff ff       	call   8010323b <myproc>
80103fb0:	89 c6                	mov    %eax,%esi
80103fb2:	83 ec 08             	sub    $0x8,%esp
80103fb5:	8d 45 f4             	lea    -0xc(%ebp),%eax
80103fb8:	50                   	push   %eax
80103fb9:	ff 75 08             	push   0x8(%ebp)
80103fbc:	e8 b9 ff ff ff       	call   80103f7a <argint>
80103fc1:	83 c4 10             	add    $0x10,%esp
80103fc4:	09 d8                	or     %ebx,%eax
80103fc6:	78 20                	js     80103fe8 <argptr+0x48>
80103fc8:	8b 16                	mov    (%esi),%edx
80103fca:	8b 45 f4             	mov    -0xc(%ebp),%eax
80103fcd:	39 d0                	cmp    %edx,%eax
80103fcf:	73 1e                	jae    80103fef <argptr+0x4f>
80103fd1:	01 c3                	add    %eax,%ebx
80103fd3:	39 da                	cmp    %ebx,%edx
80103fd5:	72 1f                	jb     80103ff6 <argptr+0x56>
80103fd7:	8b 55 0c             	mov    0xc(%ebp),%edx
80103fda:	89 02                	mov    %eax,(%edx)
80103fdc:	b8 00 00 00 00       	mov    $0x0,%eax
80103fe1:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103fe4:	5b                   	pop    %ebx
80103fe5:	5e                   	pop    %esi
80103fe6:	5d                   	pop    %ebp
80103fe7:	c3                   	ret
80103fe8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103fed:	eb f2                	jmp    80103fe1 <argptr+0x41>
80103fef:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103ff4:	eb eb                	jmp    80103fe1 <argptr+0x41>
80103ff6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103ffb:	eb e4                	jmp    80103fe1 <argptr+0x41>

80103ffd <argstr>:
80103ffd:	55                   	push   %ebp
80103ffe:	89 e5                	mov    %esp,%ebp
80104000:	83 ec 20             	sub    $0x20,%esp
80104003:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104006:	50                   	push   %eax
80104007:	ff 75 08             	push   0x8(%ebp)
8010400a:	e8 6b ff ff ff       	call   80103f7a <argint>
8010400f:	83 c4 10             	add    $0x10,%esp
80104012:	85 c0                	test   %eax,%eax
80104014:	78 13                	js     80104029 <argstr+0x2c>
80104016:	83 ec 08             	sub    $0x8,%esp
80104019:	ff 75 0c             	push   0xc(%ebp)
8010401c:	ff 75 f4             	push   -0xc(%ebp)
8010401f:	e8 0e ff ff ff       	call   80103f32 <fetchstr>
80104024:	83 c4 10             	add    $0x10,%esp
80104027:	c9                   	leave
80104028:	c3                   	ret
80104029:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010402e:	eb f7                	jmp    80104027 <argstr+0x2a>

80104030 <syscall>:
80104030:	55                   	push   %ebp
80104031:	89 e5                	mov    %esp,%ebp
80104033:	53                   	push   %ebx
80104034:	83 ec 04             	sub    $0x4,%esp
80104037:	e8 ff f1 ff ff       	call   8010323b <myproc>
8010403c:	89 c3                	mov    %eax,%ebx
8010403e:	8b 40 18             	mov    0x18(%eax),%eax
80104041:	8b 40 1c             	mov    0x1c(%eax),%eax
80104044:	8d 50 ff             	lea    -0x1(%eax),%edx
80104047:	83 fa 15             	cmp    $0x15,%edx
8010404a:	77 17                	ja     80104063 <syscall+0x33>
8010404c:	8b 14 85 60 6d 10 80 	mov    -0x7fef92a0(,%eax,4),%edx
80104053:	85 d2                	test   %edx,%edx
80104055:	74 0c                	je     80104063 <syscall+0x33>
80104057:	ff d2                	call   *%edx
80104059:	89 c2                	mov    %eax,%edx
8010405b:	8b 43 18             	mov    0x18(%ebx),%eax
8010405e:	89 50 1c             	mov    %edx,0x1c(%eax)
80104061:	eb 1f                	jmp    80104082 <syscall+0x52>
80104063:	50                   	push   %eax
80104064:	8d 43 6c             	lea    0x6c(%ebx),%eax
80104067:	50                   	push   %eax
80104068:	ff 73 10             	push   0x10(%ebx)
8010406b:	68 bb 67 10 80       	push   $0x801067bb
80104070:	e8 94 c5 ff ff       	call   80100609 <cprintf>
80104075:	8b 43 18             	mov    0x18(%ebx),%eax
80104078:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
8010407f:	83 c4 10             	add    $0x10,%esp
80104082:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104085:	c9                   	leave
80104086:	c3                   	ret

80104087 <argfd>:
80104087:	55                   	push   %ebp
80104088:	89 e5                	mov    %esp,%ebp
8010408a:	56                   	push   %esi
8010408b:	53                   	push   %ebx
8010408c:	83 ec 18             	sub    $0x18,%esp
8010408f:	89 d6                	mov    %edx,%esi
80104091:	89 cb                	mov    %ecx,%ebx
80104093:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104096:	52                   	push   %edx
80104097:	50                   	push   %eax
80104098:	e8 dd fe ff ff       	call   80103f7a <argint>
8010409d:	83 c4 10             	add    $0x10,%esp
801040a0:	85 c0                	test   %eax,%eax
801040a2:	78 30                	js     801040d4 <argfd+0x4d>
801040a4:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
801040a8:	77 31                	ja     801040db <argfd+0x54>
801040aa:	e8 8c f1 ff ff       	call   8010323b <myproc>
801040af:	89 c2                	mov    %eax,%edx
801040b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
801040b4:	8b 54 82 28          	mov    0x28(%edx,%eax,4),%edx
801040b8:	85 d2                	test   %edx,%edx
801040ba:	74 26                	je     801040e2 <argfd+0x5b>
801040bc:	85 f6                	test   %esi,%esi
801040be:	74 02                	je     801040c2 <argfd+0x3b>
801040c0:	89 06                	mov    %eax,(%esi)
801040c2:	b8 00 00 00 00       	mov    $0x0,%eax
801040c7:	85 db                	test   %ebx,%ebx
801040c9:	74 02                	je     801040cd <argfd+0x46>
801040cb:	89 13                	mov    %edx,(%ebx)
801040cd:	8d 65 f8             	lea    -0x8(%ebp),%esp
801040d0:	5b                   	pop    %ebx
801040d1:	5e                   	pop    %esi
801040d2:	5d                   	pop    %ebp
801040d3:	c3                   	ret
801040d4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801040d9:	eb f2                	jmp    801040cd <argfd+0x46>
801040db:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801040e0:	eb eb                	jmp    801040cd <argfd+0x46>
801040e2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801040e7:	eb e4                	jmp    801040cd <argfd+0x46>

801040e9 <fdalloc>:
801040e9:	55                   	push   %ebp
801040ea:	89 e5                	mov    %esp,%ebp
801040ec:	53                   	push   %ebx
801040ed:	83 ec 04             	sub    $0x4,%esp
801040f0:	89 c3                	mov    %eax,%ebx
801040f2:	e8 44 f1 ff ff       	call   8010323b <myproc>
801040f7:	89 c2                	mov    %eax,%edx
801040f9:	b8 00 00 00 00       	mov    $0x0,%eax
801040fe:	83 7c 82 28 00       	cmpl   $0x0,0x28(%edx,%eax,4)
80104103:	74 12                	je     80104117 <fdalloc+0x2e>
80104105:	83 c0 01             	add    $0x1,%eax
80104108:	83 f8 10             	cmp    $0x10,%eax
8010410b:	75 f1                	jne    801040fe <fdalloc+0x15>
8010410d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104112:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104115:	c9                   	leave
80104116:	c3                   	ret
80104117:	89 5c 82 28          	mov    %ebx,0x28(%edx,%eax,4)
8010411b:	eb f5                	jmp    80104112 <fdalloc+0x29>

8010411d <create>:
8010411d:	55                   	push   %ebp
8010411e:	89 e5                	mov    %esp,%ebp
80104120:	57                   	push   %edi
80104121:	56                   	push   %esi
80104122:	53                   	push   %ebx
80104123:	83 ec 34             	sub    $0x34,%esp
80104126:	89 55 d4             	mov    %edx,-0x2c(%ebp)
80104129:	89 4d d0             	mov    %ecx,-0x30(%ebp)
8010412c:	8b 7d 08             	mov    0x8(%ebp),%edi
8010412f:	8d 55 da             	lea    -0x26(%ebp),%edx
80104132:	52                   	push   %edx
80104133:	50                   	push   %eax
80104134:	e8 eb da ff ff       	call   80101c24 <nameiparent>
80104139:	89 c6                	mov    %eax,%esi
8010413b:	83 c4 10             	add    $0x10,%esp
8010413e:	85 c0                	test   %eax,%eax
80104140:	0f 84 2d 01 00 00    	je     80104273 <create+0x156>
80104146:	83 ec 0c             	sub    $0xc,%esp
80104149:	50                   	push   %eax
8010414a:	e8 32 d3 ff ff       	call   80101481 <ilock>
8010414f:	83 c4 0c             	add    $0xc,%esp
80104152:	6a 00                	push   $0x0
80104154:	8d 45 da             	lea    -0x26(%ebp),%eax
80104157:	50                   	push   %eax
80104158:	56                   	push   %esi
80104159:	e8 e6 d7 ff ff       	call   80101944 <dirlookup>
8010415e:	89 c3                	mov    %eax,%ebx
80104160:	83 c4 10             	add    $0x10,%esp
80104163:	85 c0                	test   %eax,%eax
80104165:	74 3d                	je     801041a4 <create+0x87>
80104167:	83 ec 0c             	sub    $0xc,%esp
8010416a:	56                   	push   %esi
8010416b:	e8 5c d5 ff ff       	call   801016cc <iunlockput>
80104170:	89 1c 24             	mov    %ebx,(%esp)
80104173:	e8 09 d3 ff ff       	call   80101481 <ilock>
80104178:	83 c4 10             	add    $0x10,%esp
8010417b:	66 83 7d d4 02       	cmpw   $0x2,-0x2c(%ebp)
80104180:	75 07                	jne    80104189 <create+0x6c>
80104182:	66 83 7b 50 02       	cmpw   $0x2,0x50(%ebx)
80104187:	74 11                	je     8010419a <create+0x7d>
80104189:	83 ec 0c             	sub    $0xc,%esp
8010418c:	53                   	push   %ebx
8010418d:	e8 3a d5 ff ff       	call   801016cc <iunlockput>
80104192:	83 c4 10             	add    $0x10,%esp
80104195:	bb 00 00 00 00       	mov    $0x0,%ebx
8010419a:	89 d8                	mov    %ebx,%eax
8010419c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010419f:	5b                   	pop    %ebx
801041a0:	5e                   	pop    %esi
801041a1:	5f                   	pop    %edi
801041a2:	5d                   	pop    %ebp
801041a3:	c3                   	ret
801041a4:	83 ec 08             	sub    $0x8,%esp
801041a7:	0f bf 45 d4          	movswl -0x2c(%ebp),%eax
801041ab:	50                   	push   %eax
801041ac:	ff 36                	push   (%esi)
801041ae:	e8 7f d1 ff ff       	call   80101332 <ialloc>
801041b3:	89 c3                	mov    %eax,%ebx
801041b5:	83 c4 10             	add    $0x10,%esp
801041b8:	85 c0                	test   %eax,%eax
801041ba:	74 52                	je     8010420e <create+0xf1>
801041bc:	83 ec 0c             	sub    $0xc,%esp
801041bf:	50                   	push   %eax
801041c0:	e8 bc d2 ff ff       	call   80101481 <ilock>
801041c5:	0f b7 45 d0          	movzwl -0x30(%ebp),%eax
801041c9:	66 89 43 52          	mov    %ax,0x52(%ebx)
801041cd:	66 89 7b 54          	mov    %di,0x54(%ebx)
801041d1:	66 c7 43 56 01 00    	movw   $0x1,0x56(%ebx)
801041d7:	89 1c 24             	mov    %ebx,(%esp)
801041da:	e8 f8 d1 ff ff       	call   801013d7 <iupdate>
801041df:	83 c4 10             	add    $0x10,%esp
801041e2:	66 83 7d d4 01       	cmpw   $0x1,-0x2c(%ebp)
801041e7:	74 32                	je     8010421b <create+0xfe>
801041e9:	83 ec 04             	sub    $0x4,%esp
801041ec:	ff 73 04             	push   0x4(%ebx)
801041ef:	8d 45 da             	lea    -0x26(%ebp),%eax
801041f2:	50                   	push   %eax
801041f3:	56                   	push   %esi
801041f4:	e8 5e d9 ff ff       	call   80101b57 <dirlink>
801041f9:	83 c4 10             	add    $0x10,%esp
801041fc:	85 c0                	test   %eax,%eax
801041fe:	78 66                	js     80104266 <create+0x149>
80104200:	83 ec 0c             	sub    $0xc,%esp
80104203:	56                   	push   %esi
80104204:	e8 c3 d4 ff ff       	call   801016cc <iunlockput>
80104209:	83 c4 10             	add    $0x10,%esp
8010420c:	eb 8c                	jmp    8010419a <create+0x7d>
8010420e:	83 ec 0c             	sub    $0xc,%esp
80104211:	68 d7 67 10 80       	push   $0x801067d7
80104216:	e8 27 c1 ff ff       	call   80100342 <panic>
8010421b:	66 83 46 56 01       	addw   $0x1,0x56(%esi)
80104220:	83 ec 0c             	sub    $0xc,%esp
80104223:	56                   	push   %esi
80104224:	e8 ae d1 ff ff       	call   801013d7 <iupdate>
80104229:	83 c4 0c             	add    $0xc,%esp
8010422c:	ff 73 04             	push   0x4(%ebx)
8010422f:	68 e7 67 10 80       	push   $0x801067e7
80104234:	53                   	push   %ebx
80104235:	e8 1d d9 ff ff       	call   80101b57 <dirlink>
8010423a:	83 c4 10             	add    $0x10,%esp
8010423d:	85 c0                	test   %eax,%eax
8010423f:	78 18                	js     80104259 <create+0x13c>
80104241:	83 ec 04             	sub    $0x4,%esp
80104244:	ff 76 04             	push   0x4(%esi)
80104247:	68 e6 67 10 80       	push   $0x801067e6
8010424c:	53                   	push   %ebx
8010424d:	e8 05 d9 ff ff       	call   80101b57 <dirlink>
80104252:	83 c4 10             	add    $0x10,%esp
80104255:	85 c0                	test   %eax,%eax
80104257:	79 90                	jns    801041e9 <create+0xcc>
80104259:	83 ec 0c             	sub    $0xc,%esp
8010425c:	68 e9 67 10 80       	push   $0x801067e9
80104261:	e8 dc c0 ff ff       	call   80100342 <panic>
80104266:	83 ec 0c             	sub    $0xc,%esp
80104269:	68 f5 67 10 80       	push   $0x801067f5
8010426e:	e8 cf c0 ff ff       	call   80100342 <panic>
80104273:	89 c3                	mov    %eax,%ebx
80104275:	e9 20 ff ff ff       	jmp    8010419a <create+0x7d>

8010427a <sys_dup>:
8010427a:	55                   	push   %ebp
8010427b:	89 e5                	mov    %esp,%ebp
8010427d:	56                   	push   %esi
8010427e:	53                   	push   %ebx
8010427f:	83 ec 10             	sub    $0x10,%esp
80104282:	8d 4d f4             	lea    -0xc(%ebp),%ecx
80104285:	ba 00 00 00 00       	mov    $0x0,%edx
8010428a:	b8 00 00 00 00       	mov    $0x0,%eax
8010428f:	e8 f3 fd ff ff       	call   80104087 <argfd>
80104294:	85 c0                	test   %eax,%eax
80104296:	78 25                	js     801042bd <sys_dup+0x43>
80104298:	8b 75 f4             	mov    -0xc(%ebp),%esi
8010429b:	89 f0                	mov    %esi,%eax
8010429d:	e8 47 fe ff ff       	call   801040e9 <fdalloc>
801042a2:	89 c3                	mov    %eax,%ebx
801042a4:	85 c0                	test   %eax,%eax
801042a6:	78 1c                	js     801042c4 <sys_dup+0x4a>
801042a8:	83 ec 0c             	sub    $0xc,%esp
801042ab:	56                   	push   %esi
801042ac:	e8 19 ca ff ff       	call   80100cca <filedup>
801042b1:	83 c4 10             	add    $0x10,%esp
801042b4:	89 d8                	mov    %ebx,%eax
801042b6:	8d 65 f8             	lea    -0x8(%ebp),%esp
801042b9:	5b                   	pop    %ebx
801042ba:	5e                   	pop    %esi
801042bb:	5d                   	pop    %ebp
801042bc:	c3                   	ret
801042bd:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
801042c2:	eb f0                	jmp    801042b4 <sys_dup+0x3a>
801042c4:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
801042c9:	eb e9                	jmp    801042b4 <sys_dup+0x3a>

801042cb <sys_read>:
801042cb:	55                   	push   %ebp
801042cc:	89 e5                	mov    %esp,%ebp
801042ce:	83 ec 18             	sub    $0x18,%esp
801042d1:	8d 4d f4             	lea    -0xc(%ebp),%ecx
801042d4:	ba 00 00 00 00       	mov    $0x0,%edx
801042d9:	b8 00 00 00 00       	mov    $0x0,%eax
801042de:	e8 a4 fd ff ff       	call   80104087 <argfd>
801042e3:	85 c0                	test   %eax,%eax
801042e5:	78 43                	js     8010432a <sys_read+0x5f>
801042e7:	83 ec 08             	sub    $0x8,%esp
801042ea:	8d 45 f0             	lea    -0x10(%ebp),%eax
801042ed:	50                   	push   %eax
801042ee:	6a 02                	push   $0x2
801042f0:	e8 85 fc ff ff       	call   80103f7a <argint>
801042f5:	83 c4 10             	add    $0x10,%esp
801042f8:	85 c0                	test   %eax,%eax
801042fa:	78 35                	js     80104331 <sys_read+0x66>
801042fc:	83 ec 04             	sub    $0x4,%esp
801042ff:	ff 75 f0             	push   -0x10(%ebp)
80104302:	8d 45 ec             	lea    -0x14(%ebp),%eax
80104305:	50                   	push   %eax
80104306:	6a 01                	push   $0x1
80104308:	e8 93 fc ff ff       	call   80103fa0 <argptr>
8010430d:	83 c4 10             	add    $0x10,%esp
80104310:	85 c0                	test   %eax,%eax
80104312:	78 24                	js     80104338 <sys_read+0x6d>
80104314:	83 ec 04             	sub    $0x4,%esp
80104317:	ff 75 f0             	push   -0x10(%ebp)
8010431a:	ff 75 ec             	push   -0x14(%ebp)
8010431d:	ff 75 f4             	push   -0xc(%ebp)
80104320:	e8 e6 ca ff ff       	call   80100e0b <fileread>
80104325:	83 c4 10             	add    $0x10,%esp
80104328:	c9                   	leave
80104329:	c3                   	ret
8010432a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010432f:	eb f7                	jmp    80104328 <sys_read+0x5d>
80104331:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104336:	eb f0                	jmp    80104328 <sys_read+0x5d>
80104338:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010433d:	eb e9                	jmp    80104328 <sys_read+0x5d>

8010433f <sys_write>:
8010433f:	55                   	push   %ebp
80104340:	89 e5                	mov    %esp,%ebp
80104342:	83 ec 18             	sub    $0x18,%esp
80104345:	8d 4d f4             	lea    -0xc(%ebp),%ecx
80104348:	ba 00 00 00 00       	mov    $0x0,%edx
8010434d:	b8 00 00 00 00       	mov    $0x0,%eax
80104352:	e8 30 fd ff ff       	call   80104087 <argfd>
80104357:	85 c0                	test   %eax,%eax
80104359:	78 43                	js     8010439e <sys_write+0x5f>
8010435b:	83 ec 08             	sub    $0x8,%esp
8010435e:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104361:	50                   	push   %eax
80104362:	6a 02                	push   $0x2
80104364:	e8 11 fc ff ff       	call   80103f7a <argint>
80104369:	83 c4 10             	add    $0x10,%esp
8010436c:	85 c0                	test   %eax,%eax
8010436e:	78 35                	js     801043a5 <sys_write+0x66>
80104370:	83 ec 04             	sub    $0x4,%esp
80104373:	ff 75 f0             	push   -0x10(%ebp)
80104376:	8d 45 ec             	lea    -0x14(%ebp),%eax
80104379:	50                   	push   %eax
8010437a:	6a 01                	push   $0x1
8010437c:	e8 1f fc ff ff       	call   80103fa0 <argptr>
80104381:	83 c4 10             	add    $0x10,%esp
80104384:	85 c0                	test   %eax,%eax
80104386:	78 24                	js     801043ac <sys_write+0x6d>
80104388:	83 ec 04             	sub    $0x4,%esp
8010438b:	ff 75 f0             	push   -0x10(%ebp)
8010438e:	ff 75 ec             	push   -0x14(%ebp)
80104391:	ff 75 f4             	push   -0xc(%ebp)
80104394:	e8 f7 ca ff ff       	call   80100e90 <filewrite>
80104399:	83 c4 10             	add    $0x10,%esp
8010439c:	c9                   	leave
8010439d:	c3                   	ret
8010439e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801043a3:	eb f7                	jmp    8010439c <sys_write+0x5d>
801043a5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801043aa:	eb f0                	jmp    8010439c <sys_write+0x5d>
801043ac:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801043b1:	eb e9                	jmp    8010439c <sys_write+0x5d>

801043b3 <sys_close>:
801043b3:	55                   	push   %ebp
801043b4:	89 e5                	mov    %esp,%ebp
801043b6:	83 ec 18             	sub    $0x18,%esp
801043b9:	8d 4d f0             	lea    -0x10(%ebp),%ecx
801043bc:	8d 55 f4             	lea    -0xc(%ebp),%edx
801043bf:	b8 00 00 00 00       	mov    $0x0,%eax
801043c4:	e8 be fc ff ff       	call   80104087 <argfd>
801043c9:	85 c0                	test   %eax,%eax
801043cb:	78 25                	js     801043f2 <sys_close+0x3f>
801043cd:	e8 69 ee ff ff       	call   8010323b <myproc>
801043d2:	8b 55 f4             	mov    -0xc(%ebp),%edx
801043d5:	c7 44 90 28 00 00 00 	movl   $0x0,0x28(%eax,%edx,4)
801043dc:	00 
801043dd:	83 ec 0c             	sub    $0xc,%esp
801043e0:	ff 75 f0             	push   -0x10(%ebp)
801043e3:	e8 27 c9 ff ff       	call   80100d0f <fileclose>
801043e8:	83 c4 10             	add    $0x10,%esp
801043eb:	b8 00 00 00 00       	mov    $0x0,%eax
801043f0:	c9                   	leave
801043f1:	c3                   	ret
801043f2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801043f7:	eb f7                	jmp    801043f0 <sys_close+0x3d>

801043f9 <sys_fstat>:
801043f9:	55                   	push   %ebp
801043fa:	89 e5                	mov    %esp,%ebp
801043fc:	83 ec 18             	sub    $0x18,%esp
801043ff:	8d 4d f4             	lea    -0xc(%ebp),%ecx
80104402:	ba 00 00 00 00       	mov    $0x0,%edx
80104407:	b8 00 00 00 00       	mov    $0x0,%eax
8010440c:	e8 76 fc ff ff       	call   80104087 <argfd>
80104411:	85 c0                	test   %eax,%eax
80104413:	78 2a                	js     8010443f <sys_fstat+0x46>
80104415:	83 ec 04             	sub    $0x4,%esp
80104418:	6a 14                	push   $0x14
8010441a:	8d 45 f0             	lea    -0x10(%ebp),%eax
8010441d:	50                   	push   %eax
8010441e:	6a 01                	push   $0x1
80104420:	e8 7b fb ff ff       	call   80103fa0 <argptr>
80104425:	83 c4 10             	add    $0x10,%esp
80104428:	85 c0                	test   %eax,%eax
8010442a:	78 1a                	js     80104446 <sys_fstat+0x4d>
8010442c:	83 ec 08             	sub    $0x8,%esp
8010442f:	ff 75 f0             	push   -0x10(%ebp)
80104432:	ff 75 f4             	push   -0xc(%ebp)
80104435:	e8 8a c9 ff ff       	call   80100dc4 <filestat>
8010443a:	83 c4 10             	add    $0x10,%esp
8010443d:	c9                   	leave
8010443e:	c3                   	ret
8010443f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104444:	eb f7                	jmp    8010443d <sys_fstat+0x44>
80104446:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010444b:	eb f0                	jmp    8010443d <sys_fstat+0x44>

8010444d <sys_link>:
8010444d:	55                   	push   %ebp
8010444e:	89 e5                	mov    %esp,%ebp
80104450:	56                   	push   %esi
80104451:	53                   	push   %ebx
80104452:	83 ec 28             	sub    $0x28,%esp
80104455:	8d 45 e0             	lea    -0x20(%ebp),%eax
80104458:	50                   	push   %eax
80104459:	6a 00                	push   $0x0
8010445b:	e8 9d fb ff ff       	call   80103ffd <argstr>
80104460:	83 c4 10             	add    $0x10,%esp
80104463:	85 c0                	test   %eax,%eax
80104465:	0f 88 26 01 00 00    	js     80104591 <sys_link+0x144>
8010446b:	83 ec 08             	sub    $0x8,%esp
8010446e:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80104471:	50                   	push   %eax
80104472:	6a 01                	push   $0x1
80104474:	e8 84 fb ff ff       	call   80103ffd <argstr>
80104479:	83 c4 10             	add    $0x10,%esp
8010447c:	85 c0                	test   %eax,%eax
8010447e:	0f 88 14 01 00 00    	js     80104598 <sys_link+0x14b>
80104484:	e8 92 e2 ff ff       	call   8010271b <begin_op>
80104489:	83 ec 0c             	sub    $0xc,%esp
8010448c:	ff 75 e0             	push   -0x20(%ebp)
8010448f:	e8 78 d7 ff ff       	call   80101c0c <namei>
80104494:	89 c3                	mov    %eax,%ebx
80104496:	83 c4 10             	add    $0x10,%esp
80104499:	85 c0                	test   %eax,%eax
8010449b:	0f 84 93 00 00 00    	je     80104534 <sys_link+0xe7>
801044a1:	83 ec 0c             	sub    $0xc,%esp
801044a4:	50                   	push   %eax
801044a5:	e8 d7 cf ff ff       	call   80101481 <ilock>
801044aa:	83 c4 10             	add    $0x10,%esp
801044ad:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801044b2:	0f 84 88 00 00 00    	je     80104540 <sys_link+0xf3>
801044b8:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
801044bd:	83 ec 0c             	sub    $0xc,%esp
801044c0:	53                   	push   %ebx
801044c1:	e8 11 cf ff ff       	call   801013d7 <iupdate>
801044c6:	89 1c 24             	mov    %ebx,(%esp)
801044c9:	e8 75 d0 ff ff       	call   80101543 <iunlock>
801044ce:	83 c4 08             	add    $0x8,%esp
801044d1:	8d 45 ea             	lea    -0x16(%ebp),%eax
801044d4:	50                   	push   %eax
801044d5:	ff 75 e4             	push   -0x1c(%ebp)
801044d8:	e8 47 d7 ff ff       	call   80101c24 <nameiparent>
801044dd:	89 c6                	mov    %eax,%esi
801044df:	83 c4 10             	add    $0x10,%esp
801044e2:	85 c0                	test   %eax,%eax
801044e4:	74 7e                	je     80104564 <sys_link+0x117>
801044e6:	83 ec 0c             	sub    $0xc,%esp
801044e9:	50                   	push   %eax
801044ea:	e8 92 cf ff ff       	call   80101481 <ilock>
801044ef:	83 c4 10             	add    $0x10,%esp
801044f2:	8b 03                	mov    (%ebx),%eax
801044f4:	39 06                	cmp    %eax,(%esi)
801044f6:	75 60                	jne    80104558 <sys_link+0x10b>
801044f8:	83 ec 04             	sub    $0x4,%esp
801044fb:	ff 73 04             	push   0x4(%ebx)
801044fe:	8d 45 ea             	lea    -0x16(%ebp),%eax
80104501:	50                   	push   %eax
80104502:	56                   	push   %esi
80104503:	e8 4f d6 ff ff       	call   80101b57 <dirlink>
80104508:	83 c4 10             	add    $0x10,%esp
8010450b:	85 c0                	test   %eax,%eax
8010450d:	78 49                	js     80104558 <sys_link+0x10b>
8010450f:	83 ec 0c             	sub    $0xc,%esp
80104512:	56                   	push   %esi
80104513:	e8 b4 d1 ff ff       	call   801016cc <iunlockput>
80104518:	89 1c 24             	mov    %ebx,(%esp)
8010451b:	e8 68 d0 ff ff       	call   80101588 <iput>
80104520:	e8 71 e2 ff ff       	call   80102796 <end_op>
80104525:	83 c4 10             	add    $0x10,%esp
80104528:	b8 00 00 00 00       	mov    $0x0,%eax
8010452d:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104530:	5b                   	pop    %ebx
80104531:	5e                   	pop    %esi
80104532:	5d                   	pop    %ebp
80104533:	c3                   	ret
80104534:	e8 5d e2 ff ff       	call   80102796 <end_op>
80104539:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010453e:	eb ed                	jmp    8010452d <sys_link+0xe0>
80104540:	83 ec 0c             	sub    $0xc,%esp
80104543:	53                   	push   %ebx
80104544:	e8 83 d1 ff ff       	call   801016cc <iunlockput>
80104549:	e8 48 e2 ff ff       	call   80102796 <end_op>
8010454e:	83 c4 10             	add    $0x10,%esp
80104551:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104556:	eb d5                	jmp    8010452d <sys_link+0xe0>
80104558:	83 ec 0c             	sub    $0xc,%esp
8010455b:	56                   	push   %esi
8010455c:	e8 6b d1 ff ff       	call   801016cc <iunlockput>
80104561:	83 c4 10             	add    $0x10,%esp
80104564:	83 ec 0c             	sub    $0xc,%esp
80104567:	53                   	push   %ebx
80104568:	e8 14 cf ff ff       	call   80101481 <ilock>
8010456d:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
80104572:	89 1c 24             	mov    %ebx,(%esp)
80104575:	e8 5d ce ff ff       	call   801013d7 <iupdate>
8010457a:	89 1c 24             	mov    %ebx,(%esp)
8010457d:	e8 4a d1 ff ff       	call   801016cc <iunlockput>
80104582:	e8 0f e2 ff ff       	call   80102796 <end_op>
80104587:	83 c4 10             	add    $0x10,%esp
8010458a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010458f:	eb 9c                	jmp    8010452d <sys_link+0xe0>
80104591:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104596:	eb 95                	jmp    8010452d <sys_link+0xe0>
80104598:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010459d:	eb 8e                	jmp    8010452d <sys_link+0xe0>

8010459f <sys_unlink>:
8010459f:	55                   	push   %ebp
801045a0:	89 e5                	mov    %esp,%ebp
801045a2:	57                   	push   %edi
801045a3:	56                   	push   %esi
801045a4:	53                   	push   %ebx
801045a5:	83 ec 54             	sub    $0x54,%esp
801045a8:	8d 45 c4             	lea    -0x3c(%ebp),%eax
801045ab:	50                   	push   %eax
801045ac:	6a 00                	push   $0x0
801045ae:	e8 4a fa ff ff       	call   80103ffd <argstr>
801045b3:	83 c4 10             	add    $0x10,%esp
801045b6:	85 c0                	test   %eax,%eax
801045b8:	0f 88 81 01 00 00    	js     8010473f <sys_unlink+0x1a0>
801045be:	e8 58 e1 ff ff       	call   8010271b <begin_op>
801045c3:	83 ec 08             	sub    $0x8,%esp
801045c6:	8d 45 ca             	lea    -0x36(%ebp),%eax
801045c9:	50                   	push   %eax
801045ca:	ff 75 c4             	push   -0x3c(%ebp)
801045cd:	e8 52 d6 ff ff       	call   80101c24 <nameiparent>
801045d2:	89 c7                	mov    %eax,%edi
801045d4:	83 c4 10             	add    $0x10,%esp
801045d7:	85 c0                	test   %eax,%eax
801045d9:	0f 84 df 00 00 00    	je     801046be <sys_unlink+0x11f>
801045df:	83 ec 0c             	sub    $0xc,%esp
801045e2:	50                   	push   %eax
801045e3:	e8 99 ce ff ff       	call   80101481 <ilock>
801045e8:	83 c4 08             	add    $0x8,%esp
801045eb:	68 e7 67 10 80       	push   $0x801067e7
801045f0:	8d 45 ca             	lea    -0x36(%ebp),%eax
801045f3:	50                   	push   %eax
801045f4:	e8 36 d3 ff ff       	call   8010192f <namecmp>
801045f9:	83 c4 10             	add    $0x10,%esp
801045fc:	85 c0                	test   %eax,%eax
801045fe:	0f 84 51 01 00 00    	je     80104755 <sys_unlink+0x1b6>
80104604:	83 ec 08             	sub    $0x8,%esp
80104607:	68 e6 67 10 80       	push   $0x801067e6
8010460c:	8d 45 ca             	lea    -0x36(%ebp),%eax
8010460f:	50                   	push   %eax
80104610:	e8 1a d3 ff ff       	call   8010192f <namecmp>
80104615:	83 c4 10             	add    $0x10,%esp
80104618:	85 c0                	test   %eax,%eax
8010461a:	0f 84 35 01 00 00    	je     80104755 <sys_unlink+0x1b6>
80104620:	83 ec 04             	sub    $0x4,%esp
80104623:	8d 45 c0             	lea    -0x40(%ebp),%eax
80104626:	50                   	push   %eax
80104627:	8d 45 ca             	lea    -0x36(%ebp),%eax
8010462a:	50                   	push   %eax
8010462b:	57                   	push   %edi
8010462c:	e8 13 d3 ff ff       	call   80101944 <dirlookup>
80104631:	89 c3                	mov    %eax,%ebx
80104633:	83 c4 10             	add    $0x10,%esp
80104636:	85 c0                	test   %eax,%eax
80104638:	0f 84 17 01 00 00    	je     80104755 <sys_unlink+0x1b6>
8010463e:	83 ec 0c             	sub    $0xc,%esp
80104641:	50                   	push   %eax
80104642:	e8 3a ce ff ff       	call   80101481 <ilock>
80104647:	83 c4 10             	add    $0x10,%esp
8010464a:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
8010464f:	7e 79                	jle    801046ca <sys_unlink+0x12b>
80104651:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104656:	74 7f                	je     801046d7 <sys_unlink+0x138>
80104658:	83 ec 04             	sub    $0x4,%esp
8010465b:	6a 10                	push   $0x10
8010465d:	6a 00                	push   $0x0
8010465f:	8d 75 d8             	lea    -0x28(%ebp),%esi
80104662:	56                   	push   %esi
80104663:	e8 b4 f6 ff ff       	call   80103d1c <memset>
80104668:	6a 10                	push   $0x10
8010466a:	ff 75 c0             	push   -0x40(%ebp)
8010466d:	56                   	push   %esi
8010466e:	57                   	push   %edi
8010466f:	e8 9d d1 ff ff       	call   80101811 <writei>
80104674:	83 c4 20             	add    $0x20,%esp
80104677:	83 f8 10             	cmp    $0x10,%eax
8010467a:	0f 85 9c 00 00 00    	jne    8010471c <sys_unlink+0x17d>
80104680:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104685:	0f 84 9e 00 00 00    	je     80104729 <sys_unlink+0x18a>
8010468b:	83 ec 0c             	sub    $0xc,%esp
8010468e:	57                   	push   %edi
8010468f:	e8 38 d0 ff ff       	call   801016cc <iunlockput>
80104694:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
80104699:	89 1c 24             	mov    %ebx,(%esp)
8010469c:	e8 36 cd ff ff       	call   801013d7 <iupdate>
801046a1:	89 1c 24             	mov    %ebx,(%esp)
801046a4:	e8 23 d0 ff ff       	call   801016cc <iunlockput>
801046a9:	e8 e8 e0 ff ff       	call   80102796 <end_op>
801046ae:	83 c4 10             	add    $0x10,%esp
801046b1:	b8 00 00 00 00       	mov    $0x0,%eax
801046b6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801046b9:	5b                   	pop    %ebx
801046ba:	5e                   	pop    %esi
801046bb:	5f                   	pop    %edi
801046bc:	5d                   	pop    %ebp
801046bd:	c3                   	ret
801046be:	e8 d3 e0 ff ff       	call   80102796 <end_op>
801046c3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801046c8:	eb ec                	jmp    801046b6 <sys_unlink+0x117>
801046ca:	83 ec 0c             	sub    $0xc,%esp
801046cd:	68 05 68 10 80       	push   $0x80106805
801046d2:	e8 6b bc ff ff       	call   80100342 <panic>
801046d7:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
801046db:	0f 86 77 ff ff ff    	jbe    80104658 <sys_unlink+0xb9>
801046e1:	be 20 00 00 00       	mov    $0x20,%esi
801046e6:	6a 10                	push   $0x10
801046e8:	56                   	push   %esi
801046e9:	8d 45 b0             	lea    -0x50(%ebp),%eax
801046ec:	50                   	push   %eax
801046ed:	53                   	push   %ebx
801046ee:	e8 24 d0 ff ff       	call   80101717 <readi>
801046f3:	83 c4 10             	add    $0x10,%esp
801046f6:	83 f8 10             	cmp    $0x10,%eax
801046f9:	75 14                	jne    8010470f <sys_unlink+0x170>
801046fb:	66 83 7d b0 00       	cmpw   $0x0,-0x50(%ebp)
80104700:	75 47                	jne    80104749 <sys_unlink+0x1aa>
80104702:	83 c6 10             	add    $0x10,%esi
80104705:	3b 73 58             	cmp    0x58(%ebx),%esi
80104708:	72 dc                	jb     801046e6 <sys_unlink+0x147>
8010470a:	e9 49 ff ff ff       	jmp    80104658 <sys_unlink+0xb9>
8010470f:	83 ec 0c             	sub    $0xc,%esp
80104712:	68 17 68 10 80       	push   $0x80106817
80104717:	e8 26 bc ff ff       	call   80100342 <panic>
8010471c:	83 ec 0c             	sub    $0xc,%esp
8010471f:	68 29 68 10 80       	push   $0x80106829
80104724:	e8 19 bc ff ff       	call   80100342 <panic>
80104729:	66 83 6f 56 01       	subw   $0x1,0x56(%edi)
8010472e:	83 ec 0c             	sub    $0xc,%esp
80104731:	57                   	push   %edi
80104732:	e8 a0 cc ff ff       	call   801013d7 <iupdate>
80104737:	83 c4 10             	add    $0x10,%esp
8010473a:	e9 4c ff ff ff       	jmp    8010468b <sys_unlink+0xec>
8010473f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104744:	e9 6d ff ff ff       	jmp    801046b6 <sys_unlink+0x117>
80104749:	83 ec 0c             	sub    $0xc,%esp
8010474c:	53                   	push   %ebx
8010474d:	e8 7a cf ff ff       	call   801016cc <iunlockput>
80104752:	83 c4 10             	add    $0x10,%esp
80104755:	83 ec 0c             	sub    $0xc,%esp
80104758:	57                   	push   %edi
80104759:	e8 6e cf ff ff       	call   801016cc <iunlockput>
8010475e:	e8 33 e0 ff ff       	call   80102796 <end_op>
80104763:	83 c4 10             	add    $0x10,%esp
80104766:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010476b:	e9 46 ff ff ff       	jmp    801046b6 <sys_unlink+0x117>

80104770 <sys_open>:
80104770:	55                   	push   %ebp
80104771:	89 e5                	mov    %esp,%ebp
80104773:	57                   	push   %edi
80104774:	56                   	push   %esi
80104775:	53                   	push   %ebx
80104776:	83 ec 24             	sub    $0x24,%esp
80104779:	8d 45 e4             	lea    -0x1c(%ebp),%eax
8010477c:	50                   	push   %eax
8010477d:	6a 00                	push   $0x0
8010477f:	e8 79 f8 ff ff       	call   80103ffd <argstr>
80104784:	83 c4 10             	add    $0x10,%esp
80104787:	85 c0                	test   %eax,%eax
80104789:	0f 88 32 01 00 00    	js     801048c1 <sys_open+0x151>
8010478f:	83 ec 08             	sub    $0x8,%esp
80104792:	8d 45 e0             	lea    -0x20(%ebp),%eax
80104795:	50                   	push   %eax
80104796:	6a 01                	push   $0x1
80104798:	e8 dd f7 ff ff       	call   80103f7a <argint>
8010479d:	83 c4 10             	add    $0x10,%esp
801047a0:	85 c0                	test   %eax,%eax
801047a2:	0f 88 23 01 00 00    	js     801048cb <sys_open+0x15b>
801047a8:	e8 6e df ff ff       	call   8010271b <begin_op>
801047ad:	f6 45 e1 02          	testb  $0x2,-0x1f(%ebp)
801047b1:	0f 84 8a 00 00 00    	je     80104841 <sys_open+0xd1>
801047b7:	83 ec 0c             	sub    $0xc,%esp
801047ba:	6a 00                	push   $0x0
801047bc:	b9 00 00 00 00       	mov    $0x0,%ecx
801047c1:	ba 02 00 00 00       	mov    $0x2,%edx
801047c6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801047c9:	e8 4f f9 ff ff       	call   8010411d <create>
801047ce:	89 c6                	mov    %eax,%esi
801047d0:	83 c4 10             	add    $0x10,%esp
801047d3:	85 c0                	test   %eax,%eax
801047d5:	74 5e                	je     80104835 <sys_open+0xc5>
801047d7:	e8 8f c4 ff ff       	call   80100c6b <filealloc>
801047dc:	89 c3                	mov    %eax,%ebx
801047de:	85 c0                	test   %eax,%eax
801047e0:	0f 84 c0 00 00 00    	je     801048a6 <sys_open+0x136>
801047e6:	e8 fe f8 ff ff       	call   801040e9 <fdalloc>
801047eb:	89 c7                	mov    %eax,%edi
801047ed:	85 c0                	test   %eax,%eax
801047ef:	0f 88 a5 00 00 00    	js     8010489a <sys_open+0x12a>
801047f5:	83 ec 0c             	sub    $0xc,%esp
801047f8:	56                   	push   %esi
801047f9:	e8 45 cd ff ff       	call   80101543 <iunlock>
801047fe:	e8 93 df ff ff       	call   80102796 <end_op>
80104803:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
80104809:	89 73 10             	mov    %esi,0x10(%ebx)
8010480c:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
80104813:	8b 55 e0             	mov    -0x20(%ebp),%edx
80104816:	89 d0                	mov    %edx,%eax
80104818:	83 f0 01             	xor    $0x1,%eax
8010481b:	83 e0 01             	and    $0x1,%eax
8010481e:	88 43 08             	mov    %al,0x8(%ebx)
80104821:	83 c4 10             	add    $0x10,%esp
80104824:	f6 c2 03             	test   $0x3,%dl
80104827:	0f 95 43 09          	setne  0x9(%ebx)
8010482b:	89 f8                	mov    %edi,%eax
8010482d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104830:	5b                   	pop    %ebx
80104831:	5e                   	pop    %esi
80104832:	5f                   	pop    %edi
80104833:	5d                   	pop    %ebp
80104834:	c3                   	ret
80104835:	e8 5c df ff ff       	call   80102796 <end_op>
8010483a:	bf ff ff ff ff       	mov    $0xffffffff,%edi
8010483f:	eb ea                	jmp    8010482b <sys_open+0xbb>
80104841:	83 ec 0c             	sub    $0xc,%esp
80104844:	ff 75 e4             	push   -0x1c(%ebp)
80104847:	e8 c0 d3 ff ff       	call   80101c0c <namei>
8010484c:	89 c6                	mov    %eax,%esi
8010484e:	83 c4 10             	add    $0x10,%esp
80104851:	85 c0                	test   %eax,%eax
80104853:	74 39                	je     8010488e <sys_open+0x11e>
80104855:	83 ec 0c             	sub    $0xc,%esp
80104858:	50                   	push   %eax
80104859:	e8 23 cc ff ff       	call   80101481 <ilock>
8010485e:	83 c4 10             	add    $0x10,%esp
80104861:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80104866:	0f 85 6b ff ff ff    	jne    801047d7 <sys_open+0x67>
8010486c:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
80104870:	0f 84 61 ff ff ff    	je     801047d7 <sys_open+0x67>
80104876:	83 ec 0c             	sub    $0xc,%esp
80104879:	56                   	push   %esi
8010487a:	e8 4d ce ff ff       	call   801016cc <iunlockput>
8010487f:	e8 12 df ff ff       	call   80102796 <end_op>
80104884:	83 c4 10             	add    $0x10,%esp
80104887:	bf ff ff ff ff       	mov    $0xffffffff,%edi
8010488c:	eb 9d                	jmp    8010482b <sys_open+0xbb>
8010488e:	e8 03 df ff ff       	call   80102796 <end_op>
80104893:	bf ff ff ff ff       	mov    $0xffffffff,%edi
80104898:	eb 91                	jmp    8010482b <sys_open+0xbb>
8010489a:	83 ec 0c             	sub    $0xc,%esp
8010489d:	53                   	push   %ebx
8010489e:	e8 6c c4 ff ff       	call   80100d0f <fileclose>
801048a3:	83 c4 10             	add    $0x10,%esp
801048a6:	83 ec 0c             	sub    $0xc,%esp
801048a9:	56                   	push   %esi
801048aa:	e8 1d ce ff ff       	call   801016cc <iunlockput>
801048af:	e8 e2 de ff ff       	call   80102796 <end_op>
801048b4:	83 c4 10             	add    $0x10,%esp
801048b7:	bf ff ff ff ff       	mov    $0xffffffff,%edi
801048bc:	e9 6a ff ff ff       	jmp    8010482b <sys_open+0xbb>
801048c1:	bf ff ff ff ff       	mov    $0xffffffff,%edi
801048c6:	e9 60 ff ff ff       	jmp    8010482b <sys_open+0xbb>
801048cb:	bf ff ff ff ff       	mov    $0xffffffff,%edi
801048d0:	e9 56 ff ff ff       	jmp    8010482b <sys_open+0xbb>

801048d5 <sys_mkdir>:
801048d5:	55                   	push   %ebp
801048d6:	89 e5                	mov    %esp,%ebp
801048d8:	83 ec 18             	sub    $0x18,%esp
801048db:	e8 3b de ff ff       	call   8010271b <begin_op>
801048e0:	83 ec 08             	sub    $0x8,%esp
801048e3:	8d 45 f4             	lea    -0xc(%ebp),%eax
801048e6:	50                   	push   %eax
801048e7:	6a 00                	push   $0x0
801048e9:	e8 0f f7 ff ff       	call   80103ffd <argstr>
801048ee:	83 c4 10             	add    $0x10,%esp
801048f1:	85 c0                	test   %eax,%eax
801048f3:	78 36                	js     8010492b <sys_mkdir+0x56>
801048f5:	83 ec 0c             	sub    $0xc,%esp
801048f8:	6a 00                	push   $0x0
801048fa:	b9 00 00 00 00       	mov    $0x0,%ecx
801048ff:	ba 01 00 00 00       	mov    $0x1,%edx
80104904:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104907:	e8 11 f8 ff ff       	call   8010411d <create>
8010490c:	83 c4 10             	add    $0x10,%esp
8010490f:	85 c0                	test   %eax,%eax
80104911:	74 18                	je     8010492b <sys_mkdir+0x56>
80104913:	83 ec 0c             	sub    $0xc,%esp
80104916:	50                   	push   %eax
80104917:	e8 b0 cd ff ff       	call   801016cc <iunlockput>
8010491c:	e8 75 de ff ff       	call   80102796 <end_op>
80104921:	83 c4 10             	add    $0x10,%esp
80104924:	b8 00 00 00 00       	mov    $0x0,%eax
80104929:	c9                   	leave
8010492a:	c3                   	ret
8010492b:	e8 66 de ff ff       	call   80102796 <end_op>
80104930:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104935:	eb f2                	jmp    80104929 <sys_mkdir+0x54>

80104937 <sys_mknod>:
80104937:	55                   	push   %ebp
80104938:	89 e5                	mov    %esp,%ebp
8010493a:	83 ec 18             	sub    $0x18,%esp
8010493d:	e8 d9 dd ff ff       	call   8010271b <begin_op>
80104942:	83 ec 08             	sub    $0x8,%esp
80104945:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104948:	50                   	push   %eax
80104949:	6a 00                	push   $0x0
8010494b:	e8 ad f6 ff ff       	call   80103ffd <argstr>
80104950:	83 c4 10             	add    $0x10,%esp
80104953:	85 c0                	test   %eax,%eax
80104955:	78 62                	js     801049b9 <sys_mknod+0x82>
80104957:	83 ec 08             	sub    $0x8,%esp
8010495a:	8d 45 f0             	lea    -0x10(%ebp),%eax
8010495d:	50                   	push   %eax
8010495e:	6a 01                	push   $0x1
80104960:	e8 15 f6 ff ff       	call   80103f7a <argint>
80104965:	83 c4 10             	add    $0x10,%esp
80104968:	85 c0                	test   %eax,%eax
8010496a:	78 4d                	js     801049b9 <sys_mknod+0x82>
8010496c:	83 ec 08             	sub    $0x8,%esp
8010496f:	8d 45 ec             	lea    -0x14(%ebp),%eax
80104972:	50                   	push   %eax
80104973:	6a 02                	push   $0x2
80104975:	e8 00 f6 ff ff       	call   80103f7a <argint>
8010497a:	83 c4 10             	add    $0x10,%esp
8010497d:	85 c0                	test   %eax,%eax
8010497f:	78 38                	js     801049b9 <sys_mknod+0x82>
80104981:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
80104985:	83 ec 0c             	sub    $0xc,%esp
80104988:	0f bf 45 ec          	movswl -0x14(%ebp),%eax
8010498c:	50                   	push   %eax
8010498d:	ba 03 00 00 00       	mov    $0x3,%edx
80104992:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104995:	e8 83 f7 ff ff       	call   8010411d <create>
8010499a:	83 c4 10             	add    $0x10,%esp
8010499d:	85 c0                	test   %eax,%eax
8010499f:	74 18                	je     801049b9 <sys_mknod+0x82>
801049a1:	83 ec 0c             	sub    $0xc,%esp
801049a4:	50                   	push   %eax
801049a5:	e8 22 cd ff ff       	call   801016cc <iunlockput>
801049aa:	e8 e7 dd ff ff       	call   80102796 <end_op>
801049af:	83 c4 10             	add    $0x10,%esp
801049b2:	b8 00 00 00 00       	mov    $0x0,%eax
801049b7:	c9                   	leave
801049b8:	c3                   	ret
801049b9:	e8 d8 dd ff ff       	call   80102796 <end_op>
801049be:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801049c3:	eb f2                	jmp    801049b7 <sys_mknod+0x80>

801049c5 <sys_chdir>:
801049c5:	55                   	push   %ebp
801049c6:	89 e5                	mov    %esp,%ebp
801049c8:	56                   	push   %esi
801049c9:	53                   	push   %ebx
801049ca:	83 ec 10             	sub    $0x10,%esp
801049cd:	e8 69 e8 ff ff       	call   8010323b <myproc>
801049d2:	89 c6                	mov    %eax,%esi
801049d4:	e8 42 dd ff ff       	call   8010271b <begin_op>
801049d9:	83 ec 08             	sub    $0x8,%esp
801049dc:	8d 45 f4             	lea    -0xc(%ebp),%eax
801049df:	50                   	push   %eax
801049e0:	6a 00                	push   $0x0
801049e2:	e8 16 f6 ff ff       	call   80103ffd <argstr>
801049e7:	83 c4 10             	add    $0x10,%esp
801049ea:	85 c0                	test   %eax,%eax
801049ec:	78 52                	js     80104a40 <sys_chdir+0x7b>
801049ee:	83 ec 0c             	sub    $0xc,%esp
801049f1:	ff 75 f4             	push   -0xc(%ebp)
801049f4:	e8 13 d2 ff ff       	call   80101c0c <namei>
801049f9:	89 c3                	mov    %eax,%ebx
801049fb:	83 c4 10             	add    $0x10,%esp
801049fe:	85 c0                	test   %eax,%eax
80104a00:	74 3e                	je     80104a40 <sys_chdir+0x7b>
80104a02:	83 ec 0c             	sub    $0xc,%esp
80104a05:	50                   	push   %eax
80104a06:	e8 76 ca ff ff       	call   80101481 <ilock>
80104a0b:	83 c4 10             	add    $0x10,%esp
80104a0e:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104a13:	75 37                	jne    80104a4c <sys_chdir+0x87>
80104a15:	83 ec 0c             	sub    $0xc,%esp
80104a18:	53                   	push   %ebx
80104a19:	e8 25 cb ff ff       	call   80101543 <iunlock>
80104a1e:	83 c4 04             	add    $0x4,%esp
80104a21:	ff 76 68             	push   0x68(%esi)
80104a24:	e8 5f cb ff ff       	call   80101588 <iput>
80104a29:	e8 68 dd ff ff       	call   80102796 <end_op>
80104a2e:	89 5e 68             	mov    %ebx,0x68(%esi)
80104a31:	83 c4 10             	add    $0x10,%esp
80104a34:	b8 00 00 00 00       	mov    $0x0,%eax
80104a39:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104a3c:	5b                   	pop    %ebx
80104a3d:	5e                   	pop    %esi
80104a3e:	5d                   	pop    %ebp
80104a3f:	c3                   	ret
80104a40:	e8 51 dd ff ff       	call   80102796 <end_op>
80104a45:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104a4a:	eb ed                	jmp    80104a39 <sys_chdir+0x74>
80104a4c:	83 ec 0c             	sub    $0xc,%esp
80104a4f:	53                   	push   %ebx
80104a50:	e8 77 cc ff ff       	call   801016cc <iunlockput>
80104a55:	e8 3c dd ff ff       	call   80102796 <end_op>
80104a5a:	83 c4 10             	add    $0x10,%esp
80104a5d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104a62:	eb d5                	jmp    80104a39 <sys_chdir+0x74>

80104a64 <sys_exec>:
80104a64:	55                   	push   %ebp
80104a65:	89 e5                	mov    %esp,%ebp
80104a67:	57                   	push   %edi
80104a68:	56                   	push   %esi
80104a69:	53                   	push   %ebx
80104a6a:	81 ec a4 00 00 00    	sub    $0xa4,%esp
80104a70:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80104a73:	50                   	push   %eax
80104a74:	6a 00                	push   $0x0
80104a76:	e8 82 f5 ff ff       	call   80103ffd <argstr>
80104a7b:	83 c4 10             	add    $0x10,%esp
80104a7e:	85 c0                	test   %eax,%eax
80104a80:	0f 88 ba 00 00 00    	js     80104b40 <sys_exec+0xdc>
80104a86:	83 ec 08             	sub    $0x8,%esp
80104a89:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
80104a8f:	50                   	push   %eax
80104a90:	6a 01                	push   $0x1
80104a92:	e8 e3 f4 ff ff       	call   80103f7a <argint>
80104a97:	83 c4 10             	add    $0x10,%esp
80104a9a:	85 c0                	test   %eax,%eax
80104a9c:	0f 88 a5 00 00 00    	js     80104b47 <sys_exec+0xe3>
80104aa2:	83 ec 04             	sub    $0x4,%esp
80104aa5:	68 80 00 00 00       	push   $0x80
80104aaa:	6a 00                	push   $0x0
80104aac:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
80104ab2:	50                   	push   %eax
80104ab3:	e8 64 f2 ff ff       	call   80103d1c <memset>
80104ab8:	83 c4 10             	add    $0x10,%esp
80104abb:	be 00 00 00 00       	mov    $0x0,%esi
80104ac0:	8d bd 5c ff ff ff    	lea    -0xa4(%ebp),%edi
80104ac6:	8d 1c b5 00 00 00 00 	lea    0x0(,%esi,4),%ebx
80104acd:	83 ec 08             	sub    $0x8,%esp
80104ad0:	57                   	push   %edi
80104ad1:	89 d8                	mov    %ebx,%eax
80104ad3:	03 85 60 ff ff ff    	add    -0xa0(%ebp),%eax
80104ad9:	50                   	push   %eax
80104ada:	e8 18 f4 ff ff       	call   80103ef7 <fetchint>
80104adf:	83 c4 10             	add    $0x10,%esp
80104ae2:	85 c0                	test   %eax,%eax
80104ae4:	78 68                	js     80104b4e <sys_exec+0xea>
80104ae6:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
80104aec:	85 c0                	test   %eax,%eax
80104aee:	74 2e                	je     80104b1e <sys_exec+0xba>
80104af0:	83 ec 08             	sub    $0x8,%esp
80104af3:	8d 95 64 ff ff ff    	lea    -0x9c(%ebp),%edx
80104af9:	01 d3                	add    %edx,%ebx
80104afb:	53                   	push   %ebx
80104afc:	50                   	push   %eax
80104afd:	e8 30 f4 ff ff       	call   80103f32 <fetchstr>
80104b02:	83 c4 10             	add    $0x10,%esp
80104b05:	85 c0                	test   %eax,%eax
80104b07:	78 4c                	js     80104b55 <sys_exec+0xf1>
80104b09:	83 c6 01             	add    $0x1,%esi
80104b0c:	83 fe 20             	cmp    $0x20,%esi
80104b0f:	75 b5                	jne    80104ac6 <sys_exec+0x62>
80104b11:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104b16:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104b19:	5b                   	pop    %ebx
80104b1a:	5e                   	pop    %esi
80104b1b:	5f                   	pop    %edi
80104b1c:	5d                   	pop    %ebp
80104b1d:	c3                   	ret
80104b1e:	c7 84 b5 64 ff ff ff 	movl   $0x0,-0x9c(%ebp,%esi,4)
80104b25:	00 00 00 00 
80104b29:	83 ec 08             	sub    $0x8,%esp
80104b2c:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
80104b32:	50                   	push   %eax
80104b33:	ff 75 e4             	push   -0x1c(%ebp)
80104b36:	e8 f8 bd ff ff       	call   80100933 <exec>
80104b3b:	83 c4 10             	add    $0x10,%esp
80104b3e:	eb d6                	jmp    80104b16 <sys_exec+0xb2>
80104b40:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104b45:	eb cf                	jmp    80104b16 <sys_exec+0xb2>
80104b47:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104b4c:	eb c8                	jmp    80104b16 <sys_exec+0xb2>
80104b4e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104b53:	eb c1                	jmp    80104b16 <sys_exec+0xb2>
80104b55:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104b5a:	eb ba                	jmp    80104b16 <sys_exec+0xb2>

80104b5c <sys_pipe>:
80104b5c:	55                   	push   %ebp
80104b5d:	89 e5                	mov    %esp,%ebp
80104b5f:	53                   	push   %ebx
80104b60:	83 ec 18             	sub    $0x18,%esp
80104b63:	6a 08                	push   $0x8
80104b65:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104b68:	50                   	push   %eax
80104b69:	6a 00                	push   $0x0
80104b6b:	e8 30 f4 ff ff       	call   80103fa0 <argptr>
80104b70:	83 c4 10             	add    $0x10,%esp
80104b73:	85 c0                	test   %eax,%eax
80104b75:	78 73                	js     80104bea <sys_pipe+0x8e>
80104b77:	83 ec 08             	sub    $0x8,%esp
80104b7a:	8d 45 ec             	lea    -0x14(%ebp),%eax
80104b7d:	50                   	push   %eax
80104b7e:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104b81:	50                   	push   %eax
80104b82:	e8 b9 e1 ff ff       	call   80102d40 <pipealloc>
80104b87:	83 c4 10             	add    $0x10,%esp
80104b8a:	85 c0                	test   %eax,%eax
80104b8c:	78 63                	js     80104bf1 <sys_pipe+0x95>
80104b8e:	8b 45 f0             	mov    -0x10(%ebp),%eax
80104b91:	e8 53 f5 ff ff       	call   801040e9 <fdalloc>
80104b96:	89 c3                	mov    %eax,%ebx
80104b98:	85 c0                	test   %eax,%eax
80104b9a:	78 2e                	js     80104bca <sys_pipe+0x6e>
80104b9c:	8b 45 ec             	mov    -0x14(%ebp),%eax
80104b9f:	e8 45 f5 ff ff       	call   801040e9 <fdalloc>
80104ba4:	85 c0                	test   %eax,%eax
80104ba6:	78 15                	js     80104bbd <sys_pipe+0x61>
80104ba8:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104bab:	89 1a                	mov    %ebx,(%edx)
80104bad:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104bb0:	89 42 04             	mov    %eax,0x4(%edx)
80104bb3:	b8 00 00 00 00       	mov    $0x0,%eax
80104bb8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104bbb:	c9                   	leave
80104bbc:	c3                   	ret
80104bbd:	e8 79 e6 ff ff       	call   8010323b <myproc>
80104bc2:	c7 44 98 28 00 00 00 	movl   $0x0,0x28(%eax,%ebx,4)
80104bc9:	00 
80104bca:	83 ec 0c             	sub    $0xc,%esp
80104bcd:	ff 75 f0             	push   -0x10(%ebp)
80104bd0:	e8 3a c1 ff ff       	call   80100d0f <fileclose>
80104bd5:	83 c4 04             	add    $0x4,%esp
80104bd8:	ff 75 ec             	push   -0x14(%ebp)
80104bdb:	e8 2f c1 ff ff       	call   80100d0f <fileclose>
80104be0:	83 c4 10             	add    $0x10,%esp
80104be3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104be8:	eb ce                	jmp    80104bb8 <sys_pipe+0x5c>
80104bea:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104bef:	eb c7                	jmp    80104bb8 <sys_pipe+0x5c>
80104bf1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104bf6:	eb c0                	jmp    80104bb8 <sys_pipe+0x5c>

80104bf8 <sys_fork>:
80104bf8:	55                   	push   %ebp
80104bf9:	89 e5                	mov    %esp,%ebp
80104bfb:	83 ec 08             	sub    $0x8,%esp
80104bfe:	e8 ad e7 ff ff       	call   801033b0 <fork>
80104c03:	c9                   	leave
80104c04:	c3                   	ret

80104c05 <sys_exit>:
80104c05:	55                   	push   %ebp
80104c06:	89 e5                	mov    %esp,%ebp
80104c08:	83 ec 08             	sub    $0x8,%esp
80104c0b:	e8 d8 e9 ff ff       	call   801035e8 <exit>
80104c10:	b8 00 00 00 00       	mov    $0x0,%eax
80104c15:	c9                   	leave
80104c16:	c3                   	ret

80104c17 <sys_wait>:
80104c17:	55                   	push   %ebp
80104c18:	89 e5                	mov    %esp,%ebp
80104c1a:	83 ec 08             	sub    $0x8,%esp
80104c1d:	e8 5c eb ff ff       	call   8010377e <wait>
80104c22:	c9                   	leave
80104c23:	c3                   	ret

80104c24 <sys_kill>:
80104c24:	55                   	push   %ebp
80104c25:	89 e5                	mov    %esp,%ebp
80104c27:	83 ec 20             	sub    $0x20,%esp
80104c2a:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104c2d:	50                   	push   %eax
80104c2e:	6a 00                	push   $0x0
80104c30:	e8 45 f3 ff ff       	call   80103f7a <argint>
80104c35:	83 c4 10             	add    $0x10,%esp
80104c38:	85 c0                	test   %eax,%eax
80104c3a:	78 10                	js     80104c4c <sys_kill+0x28>
80104c3c:	83 ec 0c             	sub    $0xc,%esp
80104c3f:	ff 75 f4             	push   -0xc(%ebp)
80104c42:	e8 3b ec ff ff       	call   80103882 <kill>
80104c47:	83 c4 10             	add    $0x10,%esp
80104c4a:	c9                   	leave
80104c4b:	c3                   	ret
80104c4c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104c51:	eb f7                	jmp    80104c4a <sys_kill+0x26>

80104c53 <sys_getpid>:
80104c53:	55                   	push   %ebp
80104c54:	89 e5                	mov    %esp,%ebp
80104c56:	83 ec 08             	sub    $0x8,%esp
80104c59:	e8 dd e5 ff ff       	call   8010323b <myproc>
80104c5e:	8b 40 10             	mov    0x10(%eax),%eax
80104c61:	c9                   	leave
80104c62:	c3                   	ret

80104c63 <sys_sbrk>:
80104c63:	55                   	push   %ebp
80104c64:	89 e5                	mov    %esp,%ebp
80104c66:	53                   	push   %ebx
80104c67:	83 ec 1c             	sub    $0x1c,%esp
80104c6a:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104c6d:	50                   	push   %eax
80104c6e:	6a 00                	push   $0x0
80104c70:	e8 05 f3 ff ff       	call   80103f7a <argint>
80104c75:	83 c4 10             	add    $0x10,%esp
80104c78:	85 c0                	test   %eax,%eax
80104c7a:	78 26                	js     80104ca2 <sys_sbrk+0x3f>
80104c7c:	e8 ba e5 ff ff       	call   8010323b <myproc>
80104c81:	8b 18                	mov    (%eax),%ebx
80104c83:	83 ec 0c             	sub    $0xc,%esp
80104c86:	ff 75 f4             	push   -0xc(%ebp)
80104c89:	e8 b7 e6 ff ff       	call   80103345 <growproc>
80104c8e:	83 c4 10             	add    $0x10,%esp
80104c91:	85 c0                	test   %eax,%eax
80104c93:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104c98:	0f 48 d8             	cmovs  %eax,%ebx
80104c9b:	89 d8                	mov    %ebx,%eax
80104c9d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104ca0:	c9                   	leave
80104ca1:	c3                   	ret
80104ca2:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80104ca7:	eb f2                	jmp    80104c9b <sys_sbrk+0x38>

80104ca9 <sys_sleep>:
80104ca9:	55                   	push   %ebp
80104caa:	89 e5                	mov    %esp,%ebp
80104cac:	53                   	push   %ebx
80104cad:	83 ec 1c             	sub    $0x1c,%esp
80104cb0:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104cb3:	50                   	push   %eax
80104cb4:	6a 00                	push   $0x0
80104cb6:	e8 bf f2 ff ff       	call   80103f7a <argint>
80104cbb:	83 c4 10             	add    $0x10,%esp
80104cbe:	85 c0                	test   %eax,%eax
80104cc0:	78 79                	js     80104d3b <sys_sleep+0x92>
80104cc2:	83 ec 0c             	sub    $0xc,%esp
80104cc5:	68 80 2c 11 80       	push   $0x80112c80
80104cca:	e8 9f ef ff ff       	call   80103c6e <acquire>
80104ccf:	8b 1d 60 2c 11 80    	mov    0x80112c60,%ebx
80104cd5:	83 c4 10             	add    $0x10,%esp
80104cd8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
80104cdc:	74 2c                	je     80104d0a <sys_sleep+0x61>
80104cde:	e8 58 e5 ff ff       	call   8010323b <myproc>
80104ce3:	83 78 24 00          	cmpl   $0x0,0x24(%eax)
80104ce7:	75 3b                	jne    80104d24 <sys_sleep+0x7b>
80104ce9:	83 ec 08             	sub    $0x8,%esp
80104cec:	68 80 2c 11 80       	push   $0x80112c80
80104cf1:	68 60 2c 11 80       	push   $0x80112c60
80104cf6:	e8 e3 e9 ff ff       	call   801036de <sleep>
80104cfb:	a1 60 2c 11 80       	mov    0x80112c60,%eax
80104d00:	29 d8                	sub    %ebx,%eax
80104d02:	83 c4 10             	add    $0x10,%esp
80104d05:	3b 45 f4             	cmp    -0xc(%ebp),%eax
80104d08:	72 d4                	jb     80104cde <sys_sleep+0x35>
80104d0a:	83 ec 0c             	sub    $0xc,%esp
80104d0d:	68 80 2c 11 80       	push   $0x80112c80
80104d12:	e8 be ef ff ff       	call   80103cd5 <release>
80104d17:	83 c4 10             	add    $0x10,%esp
80104d1a:	b8 00 00 00 00       	mov    $0x0,%eax
80104d1f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104d22:	c9                   	leave
80104d23:	c3                   	ret
80104d24:	83 ec 0c             	sub    $0xc,%esp
80104d27:	68 80 2c 11 80       	push   $0x80112c80
80104d2c:	e8 a4 ef ff ff       	call   80103cd5 <release>
80104d31:	83 c4 10             	add    $0x10,%esp
80104d34:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104d39:	eb e4                	jmp    80104d1f <sys_sleep+0x76>
80104d3b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104d40:	eb dd                	jmp    80104d1f <sys_sleep+0x76>

80104d42 <sys_uptime>:
80104d42:	55                   	push   %ebp
80104d43:	89 e5                	mov    %esp,%ebp
80104d45:	53                   	push   %ebx
80104d46:	83 ec 10             	sub    $0x10,%esp
80104d49:	68 80 2c 11 80       	push   $0x80112c80
80104d4e:	e8 1b ef ff ff       	call   80103c6e <acquire>
80104d53:	8b 1d 60 2c 11 80    	mov    0x80112c60,%ebx
80104d59:	c7 04 24 80 2c 11 80 	movl   $0x80112c80,(%esp)
80104d60:	e8 70 ef ff ff       	call   80103cd5 <release>
80104d65:	89 d8                	mov    %ebx,%eax
80104d67:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104d6a:	c9                   	leave
80104d6b:	c3                   	ret

80104d6c <sys_ps>:
80104d6c:	55                   	push   %ebp
80104d6d:	89 e5                	mov    %esp,%ebp
80104d6f:	83 ec 08             	sub    $0x8,%esp
80104d72:	e8 2e ec ff ff       	call   801039a5 <ps>
80104d77:	c9                   	leave
80104d78:	c3                   	ret

80104d79 <alltraps>:

  # vectors.S sends all traps here.
.globl alltraps
alltraps:
  # Build trap frame.
  pushl %ds
80104d79:	1e                   	push   %ds
  pushl %es
80104d7a:	06                   	push   %es
  pushl %fs
80104d7b:	0f a0                	push   %fs
  pushl %gs
80104d7d:	0f a8                	push   %gs
  pushal
80104d7f:	60                   	pusha
  
  # Set up data segments.
  movw $(SEG_KDATA<<3), %ax
80104d80:	66 b8 10 00          	mov    $0x10,%ax
  movw %ax, %ds
80104d84:	8e d8                	mov    %eax,%ds
  movw %ax, %es
80104d86:	8e c0                	mov    %eax,%es

  # Call trap(tf), where tf=%esp
  pushl %esp
80104d88:	54                   	push   %esp
  call trap
80104d89:	e8 bd 00 00 00       	call   80104e4b <trap>
  addl $4, %esp
80104d8e:	83 c4 04             	add    $0x4,%esp

80104d91 <trapret>:

  # Return falls through to trapret...
.globl trapret
trapret:
  popal
80104d91:	61                   	popa
  popl %gs
80104d92:	0f a9                	pop    %gs
  popl %fs
80104d94:	0f a1                	pop    %fs
  popl %es
80104d96:	07                   	pop    %es
  popl %ds
80104d97:	1f                   	pop    %ds
  addl $0x8, %esp  # trapno and errcode
80104d98:	83 c4 08             	add    $0x8,%esp
  iret
80104d9b:	cf                   	iret

80104d9c <tvinit>:
80104d9c:	55                   	push   %ebp
80104d9d:	89 e5                	mov    %esp,%ebp
80104d9f:	83 ec 08             	sub    $0x8,%esp
80104da2:	b8 00 00 00 00       	mov    $0x0,%eax
80104da7:	8b 14 85 08 90 10 80 	mov    -0x7fef6ff8(,%eax,4),%edx
80104dae:	66 89 14 c5 c0 2c 11 	mov    %dx,-0x7feed340(,%eax,8)
80104db5:	80 
80104db6:	66 c7 04 c5 c2 2c 11 	movw   $0x8,-0x7feed33e(,%eax,8)
80104dbd:	80 08 00 
80104dc0:	c6 04 c5 c4 2c 11 80 	movb   $0x0,-0x7feed33c(,%eax,8)
80104dc7:	00 
80104dc8:	c6 04 c5 c5 2c 11 80 	movb   $0x8e,-0x7feed33b(,%eax,8)
80104dcf:	8e 
80104dd0:	c1 ea 10             	shr    $0x10,%edx
80104dd3:	66 89 14 c5 c6 2c 11 	mov    %dx,-0x7feed33a(,%eax,8)
80104dda:	80 
80104ddb:	83 c0 01             	add    $0x1,%eax
80104dde:	3d 00 01 00 00       	cmp    $0x100,%eax
80104de3:	75 c2                	jne    80104da7 <tvinit+0xb>
80104de5:	a1 08 91 10 80       	mov    0x80109108,%eax
80104dea:	66 a3 c0 2e 11 80    	mov    %ax,0x80112ec0
80104df0:	66 c7 05 c2 2e 11 80 	movw   $0x8,0x80112ec2
80104df7:	08 00 
80104df9:	c6 05 c4 2e 11 80 00 	movb   $0x0,0x80112ec4
80104e00:	c6 05 c5 2e 11 80 ef 	movb   $0xef,0x80112ec5
80104e07:	c1 e8 10             	shr    $0x10,%eax
80104e0a:	66 a3 c6 2e 11 80    	mov    %ax,0x80112ec6
80104e10:	83 ec 08             	sub    $0x8,%esp
80104e13:	68 38 68 10 80       	push   $0x80106838
80104e18:	68 80 2c 11 80       	push   $0x80112c80
80104e1d:	e8 06 ed ff ff       	call   80103b28 <initlock>
80104e22:	83 c4 10             	add    $0x10,%esp
80104e25:	c9                   	leave
80104e26:	c3                   	ret

80104e27 <idtinit>:
80104e27:	55                   	push   %ebp
80104e28:	89 e5                	mov    %esp,%ebp
80104e2a:	83 ec 10             	sub    $0x10,%esp
80104e2d:	66 c7 45 fa ff 07    	movw   $0x7ff,-0x6(%ebp)
80104e33:	b8 c0 2c 11 80       	mov    $0x80112cc0,%eax
80104e38:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
80104e3c:	c1 e8 10             	shr    $0x10,%eax
80104e3f:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
80104e43:	8d 45 fa             	lea    -0x6(%ebp),%eax
80104e46:	0f 01 18             	lidtl  (%eax)
80104e49:	c9                   	leave
80104e4a:	c3                   	ret

80104e4b <trap>:
80104e4b:	55                   	push   %ebp
80104e4c:	89 e5                	mov    %esp,%ebp
80104e4e:	57                   	push   %edi
80104e4f:	56                   	push   %esi
80104e50:	53                   	push   %ebx
80104e51:	83 ec 1c             	sub    $0x1c,%esp
80104e54:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104e57:	8b 43 30             	mov    0x30(%ebx),%eax
80104e5a:	83 f8 40             	cmp    $0x40,%eax
80104e5d:	74 13                	je     80104e72 <trap+0x27>
80104e5f:	83 e8 20             	sub    $0x20,%eax
80104e62:	83 f8 1f             	cmp    $0x1f,%eax
80104e65:	0f 87 31 01 00 00    	ja     80104f9c <trap+0x151>
80104e6b:	ff 24 85 bc 6d 10 80 	jmp    *-0x7fef9244(,%eax,4)
80104e72:	e8 c4 e3 ff ff       	call   8010323b <myproc>
80104e77:	83 78 24 00          	cmpl   $0x0,0x24(%eax)
80104e7b:	75 1f                	jne    80104e9c <trap+0x51>
80104e7d:	e8 b9 e3 ff ff       	call   8010323b <myproc>
80104e82:	89 58 18             	mov    %ebx,0x18(%eax)
80104e85:	e8 a6 f1 ff ff       	call   80104030 <syscall>
80104e8a:	e8 ac e3 ff ff       	call   8010323b <myproc>
80104e8f:	83 78 24 00          	cmpl   $0x0,0x24(%eax)
80104e93:	74 78                	je     80104f0d <trap+0xc2>
80104e95:	e8 4e e7 ff ff       	call   801035e8 <exit>
80104e9a:	eb 71                	jmp    80104f0d <trap+0xc2>
80104e9c:	e8 47 e7 ff ff       	call   801035e8 <exit>
80104ea1:	eb da                	jmp    80104e7d <trap+0x32>
80104ea3:	e8 78 e3 ff ff       	call   80103220 <cpuid>
80104ea8:	85 c0                	test   %eax,%eax
80104eaa:	74 69                	je     80104f15 <trap+0xca>
80104eac:	e8 1c d5 ff ff       	call   801023cd <lapiceoi>
80104eb1:	e8 85 e3 ff ff       	call   8010323b <myproc>
80104eb6:	85 c0                	test   %eax,%eax
80104eb8:	74 19                	je     80104ed3 <trap+0x88>
80104eba:	e8 7c e3 ff ff       	call   8010323b <myproc>
80104ebf:	83 78 24 00          	cmpl   $0x0,0x24(%eax)
80104ec3:	74 0e                	je     80104ed3 <trap+0x88>
80104ec5:	0f b7 43 3c          	movzwl 0x3c(%ebx),%eax
80104ec9:	f7 d0                	not    %eax
80104ecb:	a8 03                	test   $0x3,%al
80104ecd:	0f 84 5d 01 00 00    	je     80105030 <trap+0x1e5>
80104ed3:	e8 63 e3 ff ff       	call   8010323b <myproc>
80104ed8:	85 c0                	test   %eax,%eax
80104eda:	74 0f                	je     80104eeb <trap+0xa0>
80104edc:	e8 5a e3 ff ff       	call   8010323b <myproc>
80104ee1:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
80104ee5:	0f 84 4f 01 00 00    	je     8010503a <trap+0x1ef>
80104eeb:	e8 4b e3 ff ff       	call   8010323b <myproc>
80104ef0:	85 c0                	test   %eax,%eax
80104ef2:	74 19                	je     80104f0d <trap+0xc2>
80104ef4:	e8 42 e3 ff ff       	call   8010323b <myproc>
80104ef9:	83 78 24 00          	cmpl   $0x0,0x24(%eax)
80104efd:	74 0e                	je     80104f0d <trap+0xc2>
80104eff:	0f b7 43 3c          	movzwl 0x3c(%ebx),%eax
80104f03:	f7 d0                	not    %eax
80104f05:	a8 03                	test   $0x3,%al
80104f07:	0f 84 41 01 00 00    	je     8010504e <trap+0x203>
80104f0d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104f10:	5b                   	pop    %ebx
80104f11:	5e                   	pop    %esi
80104f12:	5f                   	pop    %edi
80104f13:	5d                   	pop    %ebp
80104f14:	c3                   	ret
80104f15:	83 ec 0c             	sub    $0xc,%esp
80104f18:	68 80 2c 11 80       	push   $0x80112c80
80104f1d:	e8 4c ed ff ff       	call   80103c6e <acquire>
80104f22:	83 05 60 2c 11 80 01 	addl   $0x1,0x80112c60
80104f29:	c7 04 24 60 2c 11 80 	movl   $0x80112c60,(%esp)
80104f30:	e8 24 e9 ff ff       	call   80103859 <wakeup>
80104f35:	c7 04 24 80 2c 11 80 	movl   $0x80112c80,(%esp)
80104f3c:	e8 94 ed ff ff       	call   80103cd5 <release>
80104f41:	83 c4 10             	add    $0x10,%esp
80104f44:	e9 63 ff ff ff       	jmp    80104eac <trap+0x61>
80104f49:	e8 20 ce ff ff       	call   80101d6e <ideintr>
80104f4e:	e8 7a d4 ff ff       	call   801023cd <lapiceoi>
80104f53:	e9 59 ff ff ff       	jmp    80104eb1 <trap+0x66>
80104f58:	e8 aa d2 ff ff       	call   80102207 <kbdintr>
80104f5d:	e8 6b d4 ff ff       	call   801023cd <lapiceoi>
80104f62:	e9 4a ff ff ff       	jmp    80104eb1 <trap+0x66>
80104f67:	e8 06 02 00 00       	call   80105172 <uartintr>
80104f6c:	e8 5c d4 ff ff       	call   801023cd <lapiceoi>
80104f71:	e9 3b ff ff ff       	jmp    80104eb1 <trap+0x66>
80104f76:	8b 7b 38             	mov    0x38(%ebx),%edi
80104f79:	0f b7 73 3c          	movzwl 0x3c(%ebx),%esi
80104f7d:	e8 9e e2 ff ff       	call   80103220 <cpuid>
80104f82:	57                   	push   %edi
80104f83:	56                   	push   %esi
80104f84:	50                   	push   %eax
80104f85:	68 58 6a 10 80       	push   $0x80106a58
80104f8a:	e8 7a b6 ff ff       	call   80100609 <cprintf>
80104f8f:	e8 39 d4 ff ff       	call   801023cd <lapiceoi>
80104f94:	83 c4 10             	add    $0x10,%esp
80104f97:	e9 15 ff ff ff       	jmp    80104eb1 <trap+0x66>
80104f9c:	e8 9a e2 ff ff       	call   8010323b <myproc>
80104fa1:	85 c0                	test   %eax,%eax
80104fa3:	74 60                	je     80105005 <trap+0x1ba>
80104fa5:	f6 43 3c 03          	testb  $0x3,0x3c(%ebx)
80104fa9:	74 5a                	je     80105005 <trap+0x1ba>
80104fab:	0f 20 d7             	mov    %cr2,%edi
80104fae:	8b 43 38             	mov    0x38(%ebx),%eax
80104fb1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80104fb4:	e8 67 e2 ff ff       	call   80103220 <cpuid>
80104fb9:	89 45 e0             	mov    %eax,-0x20(%ebp)
80104fbc:	8b 53 34             	mov    0x34(%ebx),%edx
80104fbf:	89 55 dc             	mov    %edx,-0x24(%ebp)
80104fc2:	8b 73 30             	mov    0x30(%ebx),%esi
80104fc5:	e8 71 e2 ff ff       	call   8010323b <myproc>
80104fca:	89 45 d8             	mov    %eax,-0x28(%ebp)
80104fcd:	e8 69 e2 ff ff       	call   8010323b <myproc>
80104fd2:	57                   	push   %edi
80104fd3:	ff 75 e4             	push   -0x1c(%ebp)
80104fd6:	ff 75 e0             	push   -0x20(%ebp)
80104fd9:	ff 75 dc             	push   -0x24(%ebp)
80104fdc:	56                   	push   %esi
80104fdd:	8b 75 d8             	mov    -0x28(%ebp),%esi
80104fe0:	83 c6 6c             	add    $0x6c,%esi
80104fe3:	56                   	push   %esi
80104fe4:	ff 70 10             	push   0x10(%eax)
80104fe7:	68 b0 6a 10 80       	push   $0x80106ab0
80104fec:	e8 18 b6 ff ff       	call   80100609 <cprintf>
80104ff1:	83 c4 20             	add    $0x20,%esp
80104ff4:	e8 42 e2 ff ff       	call   8010323b <myproc>
80104ff9:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
80105000:	e9 ac fe ff ff       	jmp    80104eb1 <trap+0x66>
80105005:	0f 20 d7             	mov    %cr2,%edi
80105008:	8b 73 38             	mov    0x38(%ebx),%esi
8010500b:	e8 10 e2 ff ff       	call   80103220 <cpuid>
80105010:	83 ec 0c             	sub    $0xc,%esp
80105013:	57                   	push   %edi
80105014:	56                   	push   %esi
80105015:	50                   	push   %eax
80105016:	ff 73 30             	push   0x30(%ebx)
80105019:	68 7c 6a 10 80       	push   $0x80106a7c
8010501e:	e8 e6 b5 ff ff       	call   80100609 <cprintf>
80105023:	83 c4 14             	add    $0x14,%esp
80105026:	68 3d 68 10 80       	push   $0x8010683d
8010502b:	e8 12 b3 ff ff       	call   80100342 <panic>
80105030:	e8 b3 e5 ff ff       	call   801035e8 <exit>
80105035:	e9 99 fe ff ff       	jmp    80104ed3 <trap+0x88>
8010503a:	83 7b 30 20          	cmpl   $0x20,0x30(%ebx)
8010503e:	0f 85 a7 fe ff ff    	jne    80104eeb <trap+0xa0>
80105044:	e8 63 e6 ff ff       	call   801036ac <yield>
80105049:	e9 9d fe ff ff       	jmp    80104eeb <trap+0xa0>
8010504e:	e8 95 e5 ff ff       	call   801035e8 <exit>
80105053:	e9 b5 fe ff ff       	jmp    80104f0d <trap+0xc2>

80105058 <uartgetc>:
80105058:	83 3d c0 34 11 80 00 	cmpl   $0x0,0x801134c0
8010505f:	74 14                	je     80105075 <uartgetc+0x1d>
80105061:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105066:	ec                   	in     (%dx),%al
80105067:	a8 01                	test   $0x1,%al
80105069:	74 10                	je     8010507b <uartgetc+0x23>
8010506b:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105070:	ec                   	in     (%dx),%al
80105071:	0f b6 c0             	movzbl %al,%eax
80105074:	c3                   	ret
80105075:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010507a:	c3                   	ret
8010507b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105080:	c3                   	ret

80105081 <uartputc>:
80105081:	83 3d c0 34 11 80 00 	cmpl   $0x0,0x801134c0
80105088:	74 42                	je     801050cc <uartputc+0x4b>
8010508a:	55                   	push   %ebp
8010508b:	89 e5                	mov    %esp,%ebp
8010508d:	56                   	push   %esi
8010508e:	53                   	push   %ebx
8010508f:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105094:	ec                   	in     (%dx),%al
80105095:	a8 20                	test   $0x20,%al
80105097:	75 23                	jne    801050bc <uartputc+0x3b>
80105099:	bb 80 00 00 00       	mov    $0x80,%ebx
8010509e:	be fd 03 00 00       	mov    $0x3fd,%esi
801050a3:	83 ec 0c             	sub    $0xc,%esp
801050a6:	6a 0a                	push   $0xa
801050a8:	e8 41 d3 ff ff       	call   801023ee <microdelay>
801050ad:	83 c4 10             	add    $0x10,%esp
801050b0:	83 eb 01             	sub    $0x1,%ebx
801050b3:	74 07                	je     801050bc <uartputc+0x3b>
801050b5:	89 f2                	mov    %esi,%edx
801050b7:	ec                   	in     (%dx),%al
801050b8:	a8 20                	test   $0x20,%al
801050ba:	74 e7                	je     801050a3 <uartputc+0x22>
801050bc:	8b 45 08             	mov    0x8(%ebp),%eax
801050bf:	ba f8 03 00 00       	mov    $0x3f8,%edx
801050c4:	ee                   	out    %al,(%dx)
801050c5:	8d 65 f8             	lea    -0x8(%ebp),%esp
801050c8:	5b                   	pop    %ebx
801050c9:	5e                   	pop    %esi
801050ca:	5d                   	pop    %ebp
801050cb:	c3                   	ret
801050cc:	c3                   	ret

801050cd <uartinit>:
801050cd:	55                   	push   %ebp
801050ce:	89 e5                	mov    %esp,%ebp
801050d0:	56                   	push   %esi
801050d1:	53                   	push   %ebx
801050d2:	b9 00 00 00 00       	mov    $0x0,%ecx
801050d7:	ba fa 03 00 00       	mov    $0x3fa,%edx
801050dc:	89 c8                	mov    %ecx,%eax
801050de:	ee                   	out    %al,(%dx)
801050df:	be fb 03 00 00       	mov    $0x3fb,%esi
801050e4:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
801050e9:	89 f2                	mov    %esi,%edx
801050eb:	ee                   	out    %al,(%dx)
801050ec:	b8 0c 00 00 00       	mov    $0xc,%eax
801050f1:	ba f8 03 00 00       	mov    $0x3f8,%edx
801050f6:	ee                   	out    %al,(%dx)
801050f7:	bb f9 03 00 00       	mov    $0x3f9,%ebx
801050fc:	89 c8                	mov    %ecx,%eax
801050fe:	89 da                	mov    %ebx,%edx
80105100:	ee                   	out    %al,(%dx)
80105101:	b8 03 00 00 00       	mov    $0x3,%eax
80105106:	89 f2                	mov    %esi,%edx
80105108:	ee                   	out    %al,(%dx)
80105109:	ba fc 03 00 00       	mov    $0x3fc,%edx
8010510e:	89 c8                	mov    %ecx,%eax
80105110:	ee                   	out    %al,(%dx)
80105111:	b8 01 00 00 00       	mov    $0x1,%eax
80105116:	89 da                	mov    %ebx,%edx
80105118:	ee                   	out    %al,(%dx)
80105119:	ba fd 03 00 00       	mov    $0x3fd,%edx
8010511e:	ec                   	in     (%dx),%al
8010511f:	3c ff                	cmp    $0xff,%al
80105121:	74 48                	je     8010516b <uartinit+0x9e>
80105123:	c7 05 c0 34 11 80 01 	movl   $0x1,0x801134c0
8010512a:	00 00 00 
8010512d:	ba fa 03 00 00       	mov    $0x3fa,%edx
80105132:	ec                   	in     (%dx),%al
80105133:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105138:	ec                   	in     (%dx),%al
80105139:	83 ec 08             	sub    $0x8,%esp
8010513c:	6a 00                	push   $0x0
8010513e:	6a 04                	push   $0x4
80105140:	e8 4a ce ff ff       	call   80101f8f <ioapicenable>
80105145:	83 c4 10             	add    $0x10,%esp
80105148:	bb 42 68 10 80       	mov    $0x80106842,%ebx
8010514d:	b8 78 00 00 00       	mov    $0x78,%eax
80105152:	83 ec 0c             	sub    $0xc,%esp
80105155:	0f be c0             	movsbl %al,%eax
80105158:	50                   	push   %eax
80105159:	e8 23 ff ff ff       	call   80105081 <uartputc>
8010515e:	83 c3 01             	add    $0x1,%ebx
80105161:	0f b6 03             	movzbl (%ebx),%eax
80105164:	83 c4 10             	add    $0x10,%esp
80105167:	84 c0                	test   %al,%al
80105169:	75 e7                	jne    80105152 <uartinit+0x85>
8010516b:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010516e:	5b                   	pop    %ebx
8010516f:	5e                   	pop    %esi
80105170:	5d                   	pop    %ebp
80105171:	c3                   	ret

80105172 <uartintr>:
80105172:	55                   	push   %ebp
80105173:	89 e5                	mov    %esp,%ebp
80105175:	83 ec 14             	sub    $0x14,%esp
80105178:	68 58 50 10 80       	push   $0x80105058
8010517d:	e8 ea b5 ff ff       	call   8010076c <consoleintr>
80105182:	83 c4 10             	add    $0x10,%esp
80105185:	c9                   	leave
80105186:	c3                   	ret

80105187 <vector0>:
# generated by vectors.pl - do not edit
# handlers
.globl alltraps
.globl vector0
vector0:
  pushl $0
80105187:	6a 00                	push   $0x0
  pushl $0
80105189:	6a 00                	push   $0x0
  jmp alltraps
8010518b:	e9 e9 fb ff ff       	jmp    80104d79 <alltraps>

80105190 <vector1>:
.globl vector1
vector1:
  pushl $0
80105190:	6a 00                	push   $0x0
  pushl $1
80105192:	6a 01                	push   $0x1
  jmp alltraps
80105194:	e9 e0 fb ff ff       	jmp    80104d79 <alltraps>

80105199 <vector2>:
.globl vector2
vector2:
  pushl $0
80105199:	6a 00                	push   $0x0
  pushl $2
8010519b:	6a 02                	push   $0x2
  jmp alltraps
8010519d:	e9 d7 fb ff ff       	jmp    80104d79 <alltraps>

801051a2 <vector3>:
.globl vector3
vector3:
  pushl $0
801051a2:	6a 00                	push   $0x0
  pushl $3
801051a4:	6a 03                	push   $0x3
  jmp alltraps
801051a6:	e9 ce fb ff ff       	jmp    80104d79 <alltraps>

801051ab <vector4>:
.globl vector4
vector4:
  pushl $0
801051ab:	6a 00                	push   $0x0
  pushl $4
801051ad:	6a 04                	push   $0x4
  jmp alltraps
801051af:	e9 c5 fb ff ff       	jmp    80104d79 <alltraps>

801051b4 <vector5>:
.globl vector5
vector5:
  pushl $0
801051b4:	6a 00                	push   $0x0
  pushl $5
801051b6:	6a 05                	push   $0x5
  jmp alltraps
801051b8:	e9 bc fb ff ff       	jmp    80104d79 <alltraps>

801051bd <vector6>:
.globl vector6
vector6:
  pushl $0
801051bd:	6a 00                	push   $0x0
  pushl $6
801051bf:	6a 06                	push   $0x6
  jmp alltraps
801051c1:	e9 b3 fb ff ff       	jmp    80104d79 <alltraps>

801051c6 <vector7>:
.globl vector7
vector7:
  pushl $0
801051c6:	6a 00                	push   $0x0
  pushl $7
801051c8:	6a 07                	push   $0x7
  jmp alltraps
801051ca:	e9 aa fb ff ff       	jmp    80104d79 <alltraps>

801051cf <vector8>:
.globl vector8
vector8:
  pushl $8
801051cf:	6a 08                	push   $0x8
  jmp alltraps
801051d1:	e9 a3 fb ff ff       	jmp    80104d79 <alltraps>

801051d6 <vector9>:
.globl vector9
vector9:
  pushl $0
801051d6:	6a 00                	push   $0x0
  pushl $9
801051d8:	6a 09                	push   $0x9
  jmp alltraps
801051da:	e9 9a fb ff ff       	jmp    80104d79 <alltraps>

801051df <vector10>:
.globl vector10
vector10:
  pushl $10
801051df:	6a 0a                	push   $0xa
  jmp alltraps
801051e1:	e9 93 fb ff ff       	jmp    80104d79 <alltraps>

801051e6 <vector11>:
.globl vector11
vector11:
  pushl $11
801051e6:	6a 0b                	push   $0xb
  jmp alltraps
801051e8:	e9 8c fb ff ff       	jmp    80104d79 <alltraps>

801051ed <vector12>:
.globl vector12
vector12:
  pushl $12
801051ed:	6a 0c                	push   $0xc
  jmp alltraps
801051ef:	e9 85 fb ff ff       	jmp    80104d79 <alltraps>

801051f4 <vector13>:
.globl vector13
vector13:
  pushl $13
801051f4:	6a 0d                	push   $0xd
  jmp alltraps
801051f6:	e9 7e fb ff ff       	jmp    80104d79 <alltraps>

801051fb <vector14>:
.globl vector14
vector14:
  pushl $14
801051fb:	6a 0e                	push   $0xe
  jmp alltraps
801051fd:	e9 77 fb ff ff       	jmp    80104d79 <alltraps>

80105202 <vector15>:
.globl vector15
vector15:
  pushl $0
80105202:	6a 00                	push   $0x0
  pushl $15
80105204:	6a 0f                	push   $0xf
  jmp alltraps
80105206:	e9 6e fb ff ff       	jmp    80104d79 <alltraps>

8010520b <vector16>:
.globl vector16
vector16:
  pushl $0
8010520b:	6a 00                	push   $0x0
  pushl $16
8010520d:	6a 10                	push   $0x10
  jmp alltraps
8010520f:	e9 65 fb ff ff       	jmp    80104d79 <alltraps>

80105214 <vector17>:
.globl vector17
vector17:
  pushl $17
80105214:	6a 11                	push   $0x11
  jmp alltraps
80105216:	e9 5e fb ff ff       	jmp    80104d79 <alltraps>

8010521b <vector18>:
.globl vector18
vector18:
  pushl $0
8010521b:	6a 00                	push   $0x0
  pushl $18
8010521d:	6a 12                	push   $0x12
  jmp alltraps
8010521f:	e9 55 fb ff ff       	jmp    80104d79 <alltraps>

80105224 <vector19>:
.globl vector19
vector19:
  pushl $0
80105224:	6a 00                	push   $0x0
  pushl $19
80105226:	6a 13                	push   $0x13
  jmp alltraps
80105228:	e9 4c fb ff ff       	jmp    80104d79 <alltraps>

8010522d <vector20>:
.globl vector20
vector20:
  pushl $0
8010522d:	6a 00                	push   $0x0
  pushl $20
8010522f:	6a 14                	push   $0x14
  jmp alltraps
80105231:	e9 43 fb ff ff       	jmp    80104d79 <alltraps>

80105236 <vector21>:
.globl vector21
vector21:
  pushl $0
80105236:	6a 00                	push   $0x0
  pushl $21
80105238:	6a 15                	push   $0x15
  jmp alltraps
8010523a:	e9 3a fb ff ff       	jmp    80104d79 <alltraps>

8010523f <vector22>:
.globl vector22
vector22:
  pushl $0
8010523f:	6a 00                	push   $0x0
  pushl $22
80105241:	6a 16                	push   $0x16
  jmp alltraps
80105243:	e9 31 fb ff ff       	jmp    80104d79 <alltraps>

80105248 <vector23>:
.globl vector23
vector23:
  pushl $0
80105248:	6a 00                	push   $0x0
  pushl $23
8010524a:	6a 17                	push   $0x17
  jmp alltraps
8010524c:	e9 28 fb ff ff       	jmp    80104d79 <alltraps>

80105251 <vector24>:
.globl vector24
vector24:
  pushl $0
80105251:	6a 00                	push   $0x0
  pushl $24
80105253:	6a 18                	push   $0x18
  jmp alltraps
80105255:	e9 1f fb ff ff       	jmp    80104d79 <alltraps>

8010525a <vector25>:
.globl vector25
vector25:
  pushl $0
8010525a:	6a 00                	push   $0x0
  pushl $25
8010525c:	6a 19                	push   $0x19
  jmp alltraps
8010525e:	e9 16 fb ff ff       	jmp    80104d79 <alltraps>

80105263 <vector26>:
.globl vector26
vector26:
  pushl $0
80105263:	6a 00                	push   $0x0
  pushl $26
80105265:	6a 1a                	push   $0x1a
  jmp alltraps
80105267:	e9 0d fb ff ff       	jmp    80104d79 <alltraps>

8010526c <vector27>:
.globl vector27
vector27:
  pushl $0
8010526c:	6a 00                	push   $0x0
  pushl $27
8010526e:	6a 1b                	push   $0x1b
  jmp alltraps
80105270:	e9 04 fb ff ff       	jmp    80104d79 <alltraps>

80105275 <vector28>:
.globl vector28
vector28:
  pushl $0
80105275:	6a 00                	push   $0x0
  pushl $28
80105277:	6a 1c                	push   $0x1c
  jmp alltraps
80105279:	e9 fb fa ff ff       	jmp    80104d79 <alltraps>

8010527e <vector29>:
.globl vector29
vector29:
  pushl $0
8010527e:	6a 00                	push   $0x0
  pushl $29
80105280:	6a 1d                	push   $0x1d
  jmp alltraps
80105282:	e9 f2 fa ff ff       	jmp    80104d79 <alltraps>

80105287 <vector30>:
.globl vector30
vector30:
  pushl $0
80105287:	6a 00                	push   $0x0
  pushl $30
80105289:	6a 1e                	push   $0x1e
  jmp alltraps
8010528b:	e9 e9 fa ff ff       	jmp    80104d79 <alltraps>

80105290 <vector31>:
.globl vector31
vector31:
  pushl $0
80105290:	6a 00                	push   $0x0
  pushl $31
80105292:	6a 1f                	push   $0x1f
  jmp alltraps
80105294:	e9 e0 fa ff ff       	jmp    80104d79 <alltraps>

80105299 <vector32>:
.globl vector32
vector32:
  pushl $0
80105299:	6a 00                	push   $0x0
  pushl $32
8010529b:	6a 20                	push   $0x20
  jmp alltraps
8010529d:	e9 d7 fa ff ff       	jmp    80104d79 <alltraps>

801052a2 <vector33>:
.globl vector33
vector33:
  pushl $0
801052a2:	6a 00                	push   $0x0
  pushl $33
801052a4:	6a 21                	push   $0x21
  jmp alltraps
801052a6:	e9 ce fa ff ff       	jmp    80104d79 <alltraps>

801052ab <vector34>:
.globl vector34
vector34:
  pushl $0
801052ab:	6a 00                	push   $0x0
  pushl $34
801052ad:	6a 22                	push   $0x22
  jmp alltraps
801052af:	e9 c5 fa ff ff       	jmp    80104d79 <alltraps>

801052b4 <vector35>:
.globl vector35
vector35:
  pushl $0
801052b4:	6a 00                	push   $0x0
  pushl $35
801052b6:	6a 23                	push   $0x23
  jmp alltraps
801052b8:	e9 bc fa ff ff       	jmp    80104d79 <alltraps>

801052bd <vector36>:
.globl vector36
vector36:
  pushl $0
801052bd:	6a 00                	push   $0x0
  pushl $36
801052bf:	6a 24                	push   $0x24
  jmp alltraps
801052c1:	e9 b3 fa ff ff       	jmp    80104d79 <alltraps>

801052c6 <vector37>:
.globl vector37
vector37:
  pushl $0
801052c6:	6a 00                	push   $0x0
  pushl $37
801052c8:	6a 25                	push   $0x25
  jmp alltraps
801052ca:	e9 aa fa ff ff       	jmp    80104d79 <alltraps>

801052cf <vector38>:
.globl vector38
vector38:
  pushl $0
801052cf:	6a 00                	push   $0x0
  pushl $38
801052d1:	6a 26                	push   $0x26
  jmp alltraps
801052d3:	e9 a1 fa ff ff       	jmp    80104d79 <alltraps>

801052d8 <vector39>:
.globl vector39
vector39:
  pushl $0
801052d8:	6a 00                	push   $0x0
  pushl $39
801052da:	6a 27                	push   $0x27
  jmp alltraps
801052dc:	e9 98 fa ff ff       	jmp    80104d79 <alltraps>

801052e1 <vector40>:
.globl vector40
vector40:
  pushl $0
801052e1:	6a 00                	push   $0x0
  pushl $40
801052e3:	6a 28                	push   $0x28
  jmp alltraps
801052e5:	e9 8f fa ff ff       	jmp    80104d79 <alltraps>

801052ea <vector41>:
.globl vector41
vector41:
  pushl $0
801052ea:	6a 00                	push   $0x0
  pushl $41
801052ec:	6a 29                	push   $0x29
  jmp alltraps
801052ee:	e9 86 fa ff ff       	jmp    80104d79 <alltraps>

801052f3 <vector42>:
.globl vector42
vector42:
  pushl $0
801052f3:	6a 00                	push   $0x0
  pushl $42
801052f5:	6a 2a                	push   $0x2a
  jmp alltraps
801052f7:	e9 7d fa ff ff       	jmp    80104d79 <alltraps>

801052fc <vector43>:
.globl vector43
vector43:
  pushl $0
801052fc:	6a 00                	push   $0x0
  pushl $43
801052fe:	6a 2b                	push   $0x2b
  jmp alltraps
80105300:	e9 74 fa ff ff       	jmp    80104d79 <alltraps>

80105305 <vector44>:
.globl vector44
vector44:
  pushl $0
80105305:	6a 00                	push   $0x0
  pushl $44
80105307:	6a 2c                	push   $0x2c
  jmp alltraps
80105309:	e9 6b fa ff ff       	jmp    80104d79 <alltraps>

8010530e <vector45>:
.globl vector45
vector45:
  pushl $0
8010530e:	6a 00                	push   $0x0
  pushl $45
80105310:	6a 2d                	push   $0x2d
  jmp alltraps
80105312:	e9 62 fa ff ff       	jmp    80104d79 <alltraps>

80105317 <vector46>:
.globl vector46
vector46:
  pushl $0
80105317:	6a 00                	push   $0x0
  pushl $46
80105319:	6a 2e                	push   $0x2e
  jmp alltraps
8010531b:	e9 59 fa ff ff       	jmp    80104d79 <alltraps>

80105320 <vector47>:
.globl vector47
vector47:
  pushl $0
80105320:	6a 00                	push   $0x0
  pushl $47
80105322:	6a 2f                	push   $0x2f
  jmp alltraps
80105324:	e9 50 fa ff ff       	jmp    80104d79 <alltraps>

80105329 <vector48>:
.globl vector48
vector48:
  pushl $0
80105329:	6a 00                	push   $0x0
  pushl $48
8010532b:	6a 30                	push   $0x30
  jmp alltraps
8010532d:	e9 47 fa ff ff       	jmp    80104d79 <alltraps>

80105332 <vector49>:
.globl vector49
vector49:
  pushl $0
80105332:	6a 00                	push   $0x0
  pushl $49
80105334:	6a 31                	push   $0x31
  jmp alltraps
80105336:	e9 3e fa ff ff       	jmp    80104d79 <alltraps>

8010533b <vector50>:
.globl vector50
vector50:
  pushl $0
8010533b:	6a 00                	push   $0x0
  pushl $50
8010533d:	6a 32                	push   $0x32
  jmp alltraps
8010533f:	e9 35 fa ff ff       	jmp    80104d79 <alltraps>

80105344 <vector51>:
.globl vector51
vector51:
  pushl $0
80105344:	6a 00                	push   $0x0
  pushl $51
80105346:	6a 33                	push   $0x33
  jmp alltraps
80105348:	e9 2c fa ff ff       	jmp    80104d79 <alltraps>

8010534d <vector52>:
.globl vector52
vector52:
  pushl $0
8010534d:	6a 00                	push   $0x0
  pushl $52
8010534f:	6a 34                	push   $0x34
  jmp alltraps
80105351:	e9 23 fa ff ff       	jmp    80104d79 <alltraps>

80105356 <vector53>:
.globl vector53
vector53:
  pushl $0
80105356:	6a 00                	push   $0x0
  pushl $53
80105358:	6a 35                	push   $0x35
  jmp alltraps
8010535a:	e9 1a fa ff ff       	jmp    80104d79 <alltraps>

8010535f <vector54>:
.globl vector54
vector54:
  pushl $0
8010535f:	6a 00                	push   $0x0
  pushl $54
80105361:	6a 36                	push   $0x36
  jmp alltraps
80105363:	e9 11 fa ff ff       	jmp    80104d79 <alltraps>

80105368 <vector55>:
.globl vector55
vector55:
  pushl $0
80105368:	6a 00                	push   $0x0
  pushl $55
8010536a:	6a 37                	push   $0x37
  jmp alltraps
8010536c:	e9 08 fa ff ff       	jmp    80104d79 <alltraps>

80105371 <vector56>:
.globl vector56
vector56:
  pushl $0
80105371:	6a 00                	push   $0x0
  pushl $56
80105373:	6a 38                	push   $0x38
  jmp alltraps
80105375:	e9 ff f9 ff ff       	jmp    80104d79 <alltraps>

8010537a <vector57>:
.globl vector57
vector57:
  pushl $0
8010537a:	6a 00                	push   $0x0
  pushl $57
8010537c:	6a 39                	push   $0x39
  jmp alltraps
8010537e:	e9 f6 f9 ff ff       	jmp    80104d79 <alltraps>

80105383 <vector58>:
.globl vector58
vector58:
  pushl $0
80105383:	6a 00                	push   $0x0
  pushl $58
80105385:	6a 3a                	push   $0x3a
  jmp alltraps
80105387:	e9 ed f9 ff ff       	jmp    80104d79 <alltraps>

8010538c <vector59>:
.globl vector59
vector59:
  pushl $0
8010538c:	6a 00                	push   $0x0
  pushl $59
8010538e:	6a 3b                	push   $0x3b
  jmp alltraps
80105390:	e9 e4 f9 ff ff       	jmp    80104d79 <alltraps>

80105395 <vector60>:
.globl vector60
vector60:
  pushl $0
80105395:	6a 00                	push   $0x0
  pushl $60
80105397:	6a 3c                	push   $0x3c
  jmp alltraps
80105399:	e9 db f9 ff ff       	jmp    80104d79 <alltraps>

8010539e <vector61>:
.globl vector61
vector61:
  pushl $0
8010539e:	6a 00                	push   $0x0
  pushl $61
801053a0:	6a 3d                	push   $0x3d
  jmp alltraps
801053a2:	e9 d2 f9 ff ff       	jmp    80104d79 <alltraps>

801053a7 <vector62>:
.globl vector62
vector62:
  pushl $0
801053a7:	6a 00                	push   $0x0
  pushl $62
801053a9:	6a 3e                	push   $0x3e
  jmp alltraps
801053ab:	e9 c9 f9 ff ff       	jmp    80104d79 <alltraps>

801053b0 <vector63>:
.globl vector63
vector63:
  pushl $0
801053b0:	6a 00                	push   $0x0
  pushl $63
801053b2:	6a 3f                	push   $0x3f
  jmp alltraps
801053b4:	e9 c0 f9 ff ff       	jmp    80104d79 <alltraps>

801053b9 <vector64>:
.globl vector64
vector64:
  pushl $0
801053b9:	6a 00                	push   $0x0
  pushl $64
801053bb:	6a 40                	push   $0x40
  jmp alltraps
801053bd:	e9 b7 f9 ff ff       	jmp    80104d79 <alltraps>

801053c2 <vector65>:
.globl vector65
vector65:
  pushl $0
801053c2:	6a 00                	push   $0x0
  pushl $65
801053c4:	6a 41                	push   $0x41
  jmp alltraps
801053c6:	e9 ae f9 ff ff       	jmp    80104d79 <alltraps>

801053cb <vector66>:
.globl vector66
vector66:
  pushl $0
801053cb:	6a 00                	push   $0x0
  pushl $66
801053cd:	6a 42                	push   $0x42
  jmp alltraps
801053cf:	e9 a5 f9 ff ff       	jmp    80104d79 <alltraps>

801053d4 <vector67>:
.globl vector67
vector67:
  pushl $0
801053d4:	6a 00                	push   $0x0
  pushl $67
801053d6:	6a 43                	push   $0x43
  jmp alltraps
801053d8:	e9 9c f9 ff ff       	jmp    80104d79 <alltraps>

801053dd <vector68>:
.globl vector68
vector68:
  pushl $0
801053dd:	6a 00                	push   $0x0
  pushl $68
801053df:	6a 44                	push   $0x44
  jmp alltraps
801053e1:	e9 93 f9 ff ff       	jmp    80104d79 <alltraps>

801053e6 <vector69>:
.globl vector69
vector69:
  pushl $0
801053e6:	6a 00                	push   $0x0
  pushl $69
801053e8:	6a 45                	push   $0x45
  jmp alltraps
801053ea:	e9 8a f9 ff ff       	jmp    80104d79 <alltraps>

801053ef <vector70>:
.globl vector70
vector70:
  pushl $0
801053ef:	6a 00                	push   $0x0
  pushl $70
801053f1:	6a 46                	push   $0x46
  jmp alltraps
801053f3:	e9 81 f9 ff ff       	jmp    80104d79 <alltraps>

801053f8 <vector71>:
.globl vector71
vector71:
  pushl $0
801053f8:	6a 00                	push   $0x0
  pushl $71
801053fa:	6a 47                	push   $0x47
  jmp alltraps
801053fc:	e9 78 f9 ff ff       	jmp    80104d79 <alltraps>

80105401 <vector72>:
.globl vector72
vector72:
  pushl $0
80105401:	6a 00                	push   $0x0
  pushl $72
80105403:	6a 48                	push   $0x48
  jmp alltraps
80105405:	e9 6f f9 ff ff       	jmp    80104d79 <alltraps>

8010540a <vector73>:
.globl vector73
vector73:
  pushl $0
8010540a:	6a 00                	push   $0x0
  pushl $73
8010540c:	6a 49                	push   $0x49
  jmp alltraps
8010540e:	e9 66 f9 ff ff       	jmp    80104d79 <alltraps>

80105413 <vector74>:
.globl vector74
vector74:
  pushl $0
80105413:	6a 00                	push   $0x0
  pushl $74
80105415:	6a 4a                	push   $0x4a
  jmp alltraps
80105417:	e9 5d f9 ff ff       	jmp    80104d79 <alltraps>

8010541c <vector75>:
.globl vector75
vector75:
  pushl $0
8010541c:	6a 00                	push   $0x0
  pushl $75
8010541e:	6a 4b                	push   $0x4b
  jmp alltraps
80105420:	e9 54 f9 ff ff       	jmp    80104d79 <alltraps>

80105425 <vector76>:
.globl vector76
vector76:
  pushl $0
80105425:	6a 00                	push   $0x0
  pushl $76
80105427:	6a 4c                	push   $0x4c
  jmp alltraps
80105429:	e9 4b f9 ff ff       	jmp    80104d79 <alltraps>

8010542e <vector77>:
.globl vector77
vector77:
  pushl $0
8010542e:	6a 00                	push   $0x0
  pushl $77
80105430:	6a 4d                	push   $0x4d
  jmp alltraps
80105432:	e9 42 f9 ff ff       	jmp    80104d79 <alltraps>

80105437 <vector78>:
.globl vector78
vector78:
  pushl $0
80105437:	6a 00                	push   $0x0
  pushl $78
80105439:	6a 4e                	push   $0x4e
  jmp alltraps
8010543b:	e9 39 f9 ff ff       	jmp    80104d79 <alltraps>

80105440 <vector79>:
.globl vector79
vector79:
  pushl $0
80105440:	6a 00                	push   $0x0
  pushl $79
80105442:	6a 4f                	push   $0x4f
  jmp alltraps
80105444:	e9 30 f9 ff ff       	jmp    80104d79 <alltraps>

80105449 <vector80>:
.globl vector80
vector80:
  pushl $0
80105449:	6a 00                	push   $0x0
  pushl $80
8010544b:	6a 50                	push   $0x50
  jmp alltraps
8010544d:	e9 27 f9 ff ff       	jmp    80104d79 <alltraps>

80105452 <vector81>:
.globl vector81
vector81:
  pushl $0
80105452:	6a 00                	push   $0x0
  pushl $81
80105454:	6a 51                	push   $0x51
  jmp alltraps
80105456:	e9 1e f9 ff ff       	jmp    80104d79 <alltraps>

8010545b <vector82>:
.globl vector82
vector82:
  pushl $0
8010545b:	6a 00                	push   $0x0
  pushl $82
8010545d:	6a 52                	push   $0x52
  jmp alltraps
8010545f:	e9 15 f9 ff ff       	jmp    80104d79 <alltraps>

80105464 <vector83>:
.globl vector83
vector83:
  pushl $0
80105464:	6a 00                	push   $0x0
  pushl $83
80105466:	6a 53                	push   $0x53
  jmp alltraps
80105468:	e9 0c f9 ff ff       	jmp    80104d79 <alltraps>

8010546d <vector84>:
.globl vector84
vector84:
  pushl $0
8010546d:	6a 00                	push   $0x0
  pushl $84
8010546f:	6a 54                	push   $0x54
  jmp alltraps
80105471:	e9 03 f9 ff ff       	jmp    80104d79 <alltraps>

80105476 <vector85>:
.globl vector85
vector85:
  pushl $0
80105476:	6a 00                	push   $0x0
  pushl $85
80105478:	6a 55                	push   $0x55
  jmp alltraps
8010547a:	e9 fa f8 ff ff       	jmp    80104d79 <alltraps>

8010547f <vector86>:
.globl vector86
vector86:
  pushl $0
8010547f:	6a 00                	push   $0x0
  pushl $86
80105481:	6a 56                	push   $0x56
  jmp alltraps
80105483:	e9 f1 f8 ff ff       	jmp    80104d79 <alltraps>

80105488 <vector87>:
.globl vector87
vector87:
  pushl $0
80105488:	6a 00                	push   $0x0
  pushl $87
8010548a:	6a 57                	push   $0x57
  jmp alltraps
8010548c:	e9 e8 f8 ff ff       	jmp    80104d79 <alltraps>

80105491 <vector88>:
.globl vector88
vector88:
  pushl $0
80105491:	6a 00                	push   $0x0
  pushl $88
80105493:	6a 58                	push   $0x58
  jmp alltraps
80105495:	e9 df f8 ff ff       	jmp    80104d79 <alltraps>

8010549a <vector89>:
.globl vector89
vector89:
  pushl $0
8010549a:	6a 00                	push   $0x0
  pushl $89
8010549c:	6a 59                	push   $0x59
  jmp alltraps
8010549e:	e9 d6 f8 ff ff       	jmp    80104d79 <alltraps>

801054a3 <vector90>:
.globl vector90
vector90:
  pushl $0
801054a3:	6a 00                	push   $0x0
  pushl $90
801054a5:	6a 5a                	push   $0x5a
  jmp alltraps
801054a7:	e9 cd f8 ff ff       	jmp    80104d79 <alltraps>

801054ac <vector91>:
.globl vector91
vector91:
  pushl $0
801054ac:	6a 00                	push   $0x0
  pushl $91
801054ae:	6a 5b                	push   $0x5b
  jmp alltraps
801054b0:	e9 c4 f8 ff ff       	jmp    80104d79 <alltraps>

801054b5 <vector92>:
.globl vector92
vector92:
  pushl $0
801054b5:	6a 00                	push   $0x0
  pushl $92
801054b7:	6a 5c                	push   $0x5c
  jmp alltraps
801054b9:	e9 bb f8 ff ff       	jmp    80104d79 <alltraps>

801054be <vector93>:
.globl vector93
vector93:
  pushl $0
801054be:	6a 00                	push   $0x0
  pushl $93
801054c0:	6a 5d                	push   $0x5d
  jmp alltraps
801054c2:	e9 b2 f8 ff ff       	jmp    80104d79 <alltraps>

801054c7 <vector94>:
.globl vector94
vector94:
  pushl $0
801054c7:	6a 00                	push   $0x0
  pushl $94
801054c9:	6a 5e                	push   $0x5e
  jmp alltraps
801054cb:	e9 a9 f8 ff ff       	jmp    80104d79 <alltraps>

801054d0 <vector95>:
.globl vector95
vector95:
  pushl $0
801054d0:	6a 00                	push   $0x0
  pushl $95
801054d2:	6a 5f                	push   $0x5f
  jmp alltraps
801054d4:	e9 a0 f8 ff ff       	jmp    80104d79 <alltraps>

801054d9 <vector96>:
.globl vector96
vector96:
  pushl $0
801054d9:	6a 00                	push   $0x0
  pushl $96
801054db:	6a 60                	push   $0x60
  jmp alltraps
801054dd:	e9 97 f8 ff ff       	jmp    80104d79 <alltraps>

801054e2 <vector97>:
.globl vector97
vector97:
  pushl $0
801054e2:	6a 00                	push   $0x0
  pushl $97
801054e4:	6a 61                	push   $0x61
  jmp alltraps
801054e6:	e9 8e f8 ff ff       	jmp    80104d79 <alltraps>

801054eb <vector98>:
.globl vector98
vector98:
  pushl $0
801054eb:	6a 00                	push   $0x0
  pushl $98
801054ed:	6a 62                	push   $0x62
  jmp alltraps
801054ef:	e9 85 f8 ff ff       	jmp    80104d79 <alltraps>

801054f4 <vector99>:
.globl vector99
vector99:
  pushl $0
801054f4:	6a 00                	push   $0x0
  pushl $99
801054f6:	6a 63                	push   $0x63
  jmp alltraps
801054f8:	e9 7c f8 ff ff       	jmp    80104d79 <alltraps>

801054fd <vector100>:
.globl vector100
vector100:
  pushl $0
801054fd:	6a 00                	push   $0x0
  pushl $100
801054ff:	6a 64                	push   $0x64
  jmp alltraps
80105501:	e9 73 f8 ff ff       	jmp    80104d79 <alltraps>

80105506 <vector101>:
.globl vector101
vector101:
  pushl $0
80105506:	6a 00                	push   $0x0
  pushl $101
80105508:	6a 65                	push   $0x65
  jmp alltraps
8010550a:	e9 6a f8 ff ff       	jmp    80104d79 <alltraps>

8010550f <vector102>:
.globl vector102
vector102:
  pushl $0
8010550f:	6a 00                	push   $0x0
  pushl $102
80105511:	6a 66                	push   $0x66
  jmp alltraps
80105513:	e9 61 f8 ff ff       	jmp    80104d79 <alltraps>

80105518 <vector103>:
.globl vector103
vector103:
  pushl $0
80105518:	6a 00                	push   $0x0
  pushl $103
8010551a:	6a 67                	push   $0x67
  jmp alltraps
8010551c:	e9 58 f8 ff ff       	jmp    80104d79 <alltraps>

80105521 <vector104>:
.globl vector104
vector104:
  pushl $0
80105521:	6a 00                	push   $0x0
  pushl $104
80105523:	6a 68                	push   $0x68
  jmp alltraps
80105525:	e9 4f f8 ff ff       	jmp    80104d79 <alltraps>

8010552a <vector105>:
.globl vector105
vector105:
  pushl $0
8010552a:	6a 00                	push   $0x0
  pushl $105
8010552c:	6a 69                	push   $0x69
  jmp alltraps
8010552e:	e9 46 f8 ff ff       	jmp    80104d79 <alltraps>

80105533 <vector106>:
.globl vector106
vector106:
  pushl $0
80105533:	6a 00                	push   $0x0
  pushl $106
80105535:	6a 6a                	push   $0x6a
  jmp alltraps
80105537:	e9 3d f8 ff ff       	jmp    80104d79 <alltraps>

8010553c <vector107>:
.globl vector107
vector107:
  pushl $0
8010553c:	6a 00                	push   $0x0
  pushl $107
8010553e:	6a 6b                	push   $0x6b
  jmp alltraps
80105540:	e9 34 f8 ff ff       	jmp    80104d79 <alltraps>

80105545 <vector108>:
.globl vector108
vector108:
  pushl $0
80105545:	6a 00                	push   $0x0
  pushl $108
80105547:	6a 6c                	push   $0x6c
  jmp alltraps
80105549:	e9 2b f8 ff ff       	jmp    80104d79 <alltraps>

8010554e <vector109>:
.globl vector109
vector109:
  pushl $0
8010554e:	6a 00                	push   $0x0
  pushl $109
80105550:	6a 6d                	push   $0x6d
  jmp alltraps
80105552:	e9 22 f8 ff ff       	jmp    80104d79 <alltraps>

80105557 <vector110>:
.globl vector110
vector110:
  pushl $0
80105557:	6a 00                	push   $0x0
  pushl $110
80105559:	6a 6e                	push   $0x6e
  jmp alltraps
8010555b:	e9 19 f8 ff ff       	jmp    80104d79 <alltraps>

80105560 <vector111>:
.globl vector111
vector111:
  pushl $0
80105560:	6a 00                	push   $0x0
  pushl $111
80105562:	6a 6f                	push   $0x6f
  jmp alltraps
80105564:	e9 10 f8 ff ff       	jmp    80104d79 <alltraps>

80105569 <vector112>:
.globl vector112
vector112:
  pushl $0
80105569:	6a 00                	push   $0x0
  pushl $112
8010556b:	6a 70                	push   $0x70
  jmp alltraps
8010556d:	e9 07 f8 ff ff       	jmp    80104d79 <alltraps>

80105572 <vector113>:
.globl vector113
vector113:
  pushl $0
80105572:	6a 00                	push   $0x0
  pushl $113
80105574:	6a 71                	push   $0x71
  jmp alltraps
80105576:	e9 fe f7 ff ff       	jmp    80104d79 <alltraps>

8010557b <vector114>:
.globl vector114
vector114:
  pushl $0
8010557b:	6a 00                	push   $0x0
  pushl $114
8010557d:	6a 72                	push   $0x72
  jmp alltraps
8010557f:	e9 f5 f7 ff ff       	jmp    80104d79 <alltraps>

80105584 <vector115>:
.globl vector115
vector115:
  pushl $0
80105584:	6a 00                	push   $0x0
  pushl $115
80105586:	6a 73                	push   $0x73
  jmp alltraps
80105588:	e9 ec f7 ff ff       	jmp    80104d79 <alltraps>

8010558d <vector116>:
.globl vector116
vector116:
  pushl $0
8010558d:	6a 00                	push   $0x0
  pushl $116
8010558f:	6a 74                	push   $0x74
  jmp alltraps
80105591:	e9 e3 f7 ff ff       	jmp    80104d79 <alltraps>

80105596 <vector117>:
.globl vector117
vector117:
  pushl $0
80105596:	6a 00                	push   $0x0
  pushl $117
80105598:	6a 75                	push   $0x75
  jmp alltraps
8010559a:	e9 da f7 ff ff       	jmp    80104d79 <alltraps>

8010559f <vector118>:
.globl vector118
vector118:
  pushl $0
8010559f:	6a 00                	push   $0x0
  pushl $118
801055a1:	6a 76                	push   $0x76
  jmp alltraps
801055a3:	e9 d1 f7 ff ff       	jmp    80104d79 <alltraps>

801055a8 <vector119>:
.globl vector119
vector119:
  pushl $0
801055a8:	6a 00                	push   $0x0
  pushl $119
801055aa:	6a 77                	push   $0x77
  jmp alltraps
801055ac:	e9 c8 f7 ff ff       	jmp    80104d79 <alltraps>

801055b1 <vector120>:
.globl vector120
vector120:
  pushl $0
801055b1:	6a 00                	push   $0x0
  pushl $120
801055b3:	6a 78                	push   $0x78
  jmp alltraps
801055b5:	e9 bf f7 ff ff       	jmp    80104d79 <alltraps>

801055ba <vector121>:
.globl vector121
vector121:
  pushl $0
801055ba:	6a 00                	push   $0x0
  pushl $121
801055bc:	6a 79                	push   $0x79
  jmp alltraps
801055be:	e9 b6 f7 ff ff       	jmp    80104d79 <alltraps>

801055c3 <vector122>:
.globl vector122
vector122:
  pushl $0
801055c3:	6a 00                	push   $0x0
  pushl $122
801055c5:	6a 7a                	push   $0x7a
  jmp alltraps
801055c7:	e9 ad f7 ff ff       	jmp    80104d79 <alltraps>

801055cc <vector123>:
.globl vector123
vector123:
  pushl $0
801055cc:	6a 00                	push   $0x0
  pushl $123
801055ce:	6a 7b                	push   $0x7b
  jmp alltraps
801055d0:	e9 a4 f7 ff ff       	jmp    80104d79 <alltraps>

801055d5 <vector124>:
.globl vector124
vector124:
  pushl $0
801055d5:	6a 00                	push   $0x0
  pushl $124
801055d7:	6a 7c                	push   $0x7c
  jmp alltraps
801055d9:	e9 9b f7 ff ff       	jmp    80104d79 <alltraps>

801055de <vector125>:
.globl vector125
vector125:
  pushl $0
801055de:	6a 00                	push   $0x0
  pushl $125
801055e0:	6a 7d                	push   $0x7d
  jmp alltraps
801055e2:	e9 92 f7 ff ff       	jmp    80104d79 <alltraps>

801055e7 <vector126>:
.globl vector126
vector126:
  pushl $0
801055e7:	6a 00                	push   $0x0
  pushl $126
801055e9:	6a 7e                	push   $0x7e
  jmp alltraps
801055eb:	e9 89 f7 ff ff       	jmp    80104d79 <alltraps>

801055f0 <vector127>:
.globl vector127
vector127:
  pushl $0
801055f0:	6a 00                	push   $0x0
  pushl $127
801055f2:	6a 7f                	push   $0x7f
  jmp alltraps
801055f4:	e9 80 f7 ff ff       	jmp    80104d79 <alltraps>

801055f9 <vector128>:
.globl vector128
vector128:
  pushl $0
801055f9:	6a 00                	push   $0x0
  pushl $128
801055fb:	68 80 00 00 00       	push   $0x80
  jmp alltraps
80105600:	e9 74 f7 ff ff       	jmp    80104d79 <alltraps>

80105605 <vector129>:
.globl vector129
vector129:
  pushl $0
80105605:	6a 00                	push   $0x0
  pushl $129
80105607:	68 81 00 00 00       	push   $0x81
  jmp alltraps
8010560c:	e9 68 f7 ff ff       	jmp    80104d79 <alltraps>

80105611 <vector130>:
.globl vector130
vector130:
  pushl $0
80105611:	6a 00                	push   $0x0
  pushl $130
80105613:	68 82 00 00 00       	push   $0x82
  jmp alltraps
80105618:	e9 5c f7 ff ff       	jmp    80104d79 <alltraps>

8010561d <vector131>:
.globl vector131
vector131:
  pushl $0
8010561d:	6a 00                	push   $0x0
  pushl $131
8010561f:	68 83 00 00 00       	push   $0x83
  jmp alltraps
80105624:	e9 50 f7 ff ff       	jmp    80104d79 <alltraps>

80105629 <vector132>:
.globl vector132
vector132:
  pushl $0
80105629:	6a 00                	push   $0x0
  pushl $132
8010562b:	68 84 00 00 00       	push   $0x84
  jmp alltraps
80105630:	e9 44 f7 ff ff       	jmp    80104d79 <alltraps>

80105635 <vector133>:
.globl vector133
vector133:
  pushl $0
80105635:	6a 00                	push   $0x0
  pushl $133
80105637:	68 85 00 00 00       	push   $0x85
  jmp alltraps
8010563c:	e9 38 f7 ff ff       	jmp    80104d79 <alltraps>

80105641 <vector134>:
.globl vector134
vector134:
  pushl $0
80105641:	6a 00                	push   $0x0
  pushl $134
80105643:	68 86 00 00 00       	push   $0x86
  jmp alltraps
80105648:	e9 2c f7 ff ff       	jmp    80104d79 <alltraps>

8010564d <vector135>:
.globl vector135
vector135:
  pushl $0
8010564d:	6a 00                	push   $0x0
  pushl $135
8010564f:	68 87 00 00 00       	push   $0x87
  jmp alltraps
80105654:	e9 20 f7 ff ff       	jmp    80104d79 <alltraps>

80105659 <vector136>:
.globl vector136
vector136:
  pushl $0
80105659:	6a 00                	push   $0x0
  pushl $136
8010565b:	68 88 00 00 00       	push   $0x88
  jmp alltraps
80105660:	e9 14 f7 ff ff       	jmp    80104d79 <alltraps>

80105665 <vector137>:
.globl vector137
vector137:
  pushl $0
80105665:	6a 00                	push   $0x0
  pushl $137
80105667:	68 89 00 00 00       	push   $0x89
  jmp alltraps
8010566c:	e9 08 f7 ff ff       	jmp    80104d79 <alltraps>

80105671 <vector138>:
.globl vector138
vector138:
  pushl $0
80105671:	6a 00                	push   $0x0
  pushl $138
80105673:	68 8a 00 00 00       	push   $0x8a
  jmp alltraps
80105678:	e9 fc f6 ff ff       	jmp    80104d79 <alltraps>

8010567d <vector139>:
.globl vector139
vector139:
  pushl $0
8010567d:	6a 00                	push   $0x0
  pushl $139
8010567f:	68 8b 00 00 00       	push   $0x8b
  jmp alltraps
80105684:	e9 f0 f6 ff ff       	jmp    80104d79 <alltraps>

80105689 <vector140>:
.globl vector140
vector140:
  pushl $0
80105689:	6a 00                	push   $0x0
  pushl $140
8010568b:	68 8c 00 00 00       	push   $0x8c
  jmp alltraps
80105690:	e9 e4 f6 ff ff       	jmp    80104d79 <alltraps>

80105695 <vector141>:
.globl vector141
vector141:
  pushl $0
80105695:	6a 00                	push   $0x0
  pushl $141
80105697:	68 8d 00 00 00       	push   $0x8d
  jmp alltraps
8010569c:	e9 d8 f6 ff ff       	jmp    80104d79 <alltraps>

801056a1 <vector142>:
.globl vector142
vector142:
  pushl $0
801056a1:	6a 00                	push   $0x0
  pushl $142
801056a3:	68 8e 00 00 00       	push   $0x8e
  jmp alltraps
801056a8:	e9 cc f6 ff ff       	jmp    80104d79 <alltraps>

801056ad <vector143>:
.globl vector143
vector143:
  pushl $0
801056ad:	6a 00                	push   $0x0
  pushl $143
801056af:	68 8f 00 00 00       	push   $0x8f
  jmp alltraps
801056b4:	e9 c0 f6 ff ff       	jmp    80104d79 <alltraps>

801056b9 <vector144>:
.globl vector144
vector144:
  pushl $0
801056b9:	6a 00                	push   $0x0
  pushl $144
801056bb:	68 90 00 00 00       	push   $0x90
  jmp alltraps
801056c0:	e9 b4 f6 ff ff       	jmp    80104d79 <alltraps>

801056c5 <vector145>:
.globl vector145
vector145:
  pushl $0
801056c5:	6a 00                	push   $0x0
  pushl $145
801056c7:	68 91 00 00 00       	push   $0x91
  jmp alltraps
801056cc:	e9 a8 f6 ff ff       	jmp    80104d79 <alltraps>

801056d1 <vector146>:
.globl vector146
vector146:
  pushl $0
801056d1:	6a 00                	push   $0x0
  pushl $146
801056d3:	68 92 00 00 00       	push   $0x92
  jmp alltraps
801056d8:	e9 9c f6 ff ff       	jmp    80104d79 <alltraps>

801056dd <vector147>:
.globl vector147
vector147:
  pushl $0
801056dd:	6a 00                	push   $0x0
  pushl $147
801056df:	68 93 00 00 00       	push   $0x93
  jmp alltraps
801056e4:	e9 90 f6 ff ff       	jmp    80104d79 <alltraps>

801056e9 <vector148>:
.globl vector148
vector148:
  pushl $0
801056e9:	6a 00                	push   $0x0
  pushl $148
801056eb:	68 94 00 00 00       	push   $0x94
  jmp alltraps
801056f0:	e9 84 f6 ff ff       	jmp    80104d79 <alltraps>

801056f5 <vector149>:
.globl vector149
vector149:
  pushl $0
801056f5:	6a 00                	push   $0x0
  pushl $149
801056f7:	68 95 00 00 00       	push   $0x95
  jmp alltraps
801056fc:	e9 78 f6 ff ff       	jmp    80104d79 <alltraps>

80105701 <vector150>:
.globl vector150
vector150:
  pushl $0
80105701:	6a 00                	push   $0x0
  pushl $150
80105703:	68 96 00 00 00       	push   $0x96
  jmp alltraps
80105708:	e9 6c f6 ff ff       	jmp    80104d79 <alltraps>

8010570d <vector151>:
.globl vector151
vector151:
  pushl $0
8010570d:	6a 00                	push   $0x0
  pushl $151
8010570f:	68 97 00 00 00       	push   $0x97
  jmp alltraps
80105714:	e9 60 f6 ff ff       	jmp    80104d79 <alltraps>

80105719 <vector152>:
.globl vector152
vector152:
  pushl $0
80105719:	6a 00                	push   $0x0
  pushl $152
8010571b:	68 98 00 00 00       	push   $0x98
  jmp alltraps
80105720:	e9 54 f6 ff ff       	jmp    80104d79 <alltraps>

80105725 <vector153>:
.globl vector153
vector153:
  pushl $0
80105725:	6a 00                	push   $0x0
  pushl $153
80105727:	68 99 00 00 00       	push   $0x99
  jmp alltraps
8010572c:	e9 48 f6 ff ff       	jmp    80104d79 <alltraps>

80105731 <vector154>:
.globl vector154
vector154:
  pushl $0
80105731:	6a 00                	push   $0x0
  pushl $154
80105733:	68 9a 00 00 00       	push   $0x9a
  jmp alltraps
80105738:	e9 3c f6 ff ff       	jmp    80104d79 <alltraps>

8010573d <vector155>:
.globl vector155
vector155:
  pushl $0
8010573d:	6a 00                	push   $0x0
  pushl $155
8010573f:	68 9b 00 00 00       	push   $0x9b
  jmp alltraps
80105744:	e9 30 f6 ff ff       	jmp    80104d79 <alltraps>

80105749 <vector156>:
.globl vector156
vector156:
  pushl $0
80105749:	6a 00                	push   $0x0
  pushl $156
8010574b:	68 9c 00 00 00       	push   $0x9c
  jmp alltraps
80105750:	e9 24 f6 ff ff       	jmp    80104d79 <alltraps>

80105755 <vector157>:
.globl vector157
vector157:
  pushl $0
80105755:	6a 00                	push   $0x0
  pushl $157
80105757:	68 9d 00 00 00       	push   $0x9d
  jmp alltraps
8010575c:	e9 18 f6 ff ff       	jmp    80104d79 <alltraps>

80105761 <vector158>:
.globl vector158
vector158:
  pushl $0
80105761:	6a 00                	push   $0x0
  pushl $158
80105763:	68 9e 00 00 00       	push   $0x9e
  jmp alltraps
80105768:	e9 0c f6 ff ff       	jmp    80104d79 <alltraps>

8010576d <vector159>:
.globl vector159
vector159:
  pushl $0
8010576d:	6a 00                	push   $0x0
  pushl $159
8010576f:	68 9f 00 00 00       	push   $0x9f
  jmp alltraps
80105774:	e9 00 f6 ff ff       	jmp    80104d79 <alltraps>

80105779 <vector160>:
.globl vector160
vector160:
  pushl $0
80105779:	6a 00                	push   $0x0
  pushl $160
8010577b:	68 a0 00 00 00       	push   $0xa0
  jmp alltraps
80105780:	e9 f4 f5 ff ff       	jmp    80104d79 <alltraps>

80105785 <vector161>:
.globl vector161
vector161:
  pushl $0
80105785:	6a 00                	push   $0x0
  pushl $161
80105787:	68 a1 00 00 00       	push   $0xa1
  jmp alltraps
8010578c:	e9 e8 f5 ff ff       	jmp    80104d79 <alltraps>

80105791 <vector162>:
.globl vector162
vector162:
  pushl $0
80105791:	6a 00                	push   $0x0
  pushl $162
80105793:	68 a2 00 00 00       	push   $0xa2
  jmp alltraps
80105798:	e9 dc f5 ff ff       	jmp    80104d79 <alltraps>

8010579d <vector163>:
.globl vector163
vector163:
  pushl $0
8010579d:	6a 00                	push   $0x0
  pushl $163
8010579f:	68 a3 00 00 00       	push   $0xa3
  jmp alltraps
801057a4:	e9 d0 f5 ff ff       	jmp    80104d79 <alltraps>

801057a9 <vector164>:
.globl vector164
vector164:
  pushl $0
801057a9:	6a 00                	push   $0x0
  pushl $164
801057ab:	68 a4 00 00 00       	push   $0xa4
  jmp alltraps
801057b0:	e9 c4 f5 ff ff       	jmp    80104d79 <alltraps>

801057b5 <vector165>:
.globl vector165
vector165:
  pushl $0
801057b5:	6a 00                	push   $0x0
  pushl $165
801057b7:	68 a5 00 00 00       	push   $0xa5
  jmp alltraps
801057bc:	e9 b8 f5 ff ff       	jmp    80104d79 <alltraps>

801057c1 <vector166>:
.globl vector166
vector166:
  pushl $0
801057c1:	6a 00                	push   $0x0
  pushl $166
801057c3:	68 a6 00 00 00       	push   $0xa6
  jmp alltraps
801057c8:	e9 ac f5 ff ff       	jmp    80104d79 <alltraps>

801057cd <vector167>:
.globl vector167
vector167:
  pushl $0
801057cd:	6a 00                	push   $0x0
  pushl $167
801057cf:	68 a7 00 00 00       	push   $0xa7
  jmp alltraps
801057d4:	e9 a0 f5 ff ff       	jmp    80104d79 <alltraps>

801057d9 <vector168>:
.globl vector168
vector168:
  pushl $0
801057d9:	6a 00                	push   $0x0
  pushl $168
801057db:	68 a8 00 00 00       	push   $0xa8
  jmp alltraps
801057e0:	e9 94 f5 ff ff       	jmp    80104d79 <alltraps>

801057e5 <vector169>:
.globl vector169
vector169:
  pushl $0
801057e5:	6a 00                	push   $0x0
  pushl $169
801057e7:	68 a9 00 00 00       	push   $0xa9
  jmp alltraps
801057ec:	e9 88 f5 ff ff       	jmp    80104d79 <alltraps>

801057f1 <vector170>:
.globl vector170
vector170:
  pushl $0
801057f1:	6a 00                	push   $0x0
  pushl $170
801057f3:	68 aa 00 00 00       	push   $0xaa
  jmp alltraps
801057f8:	e9 7c f5 ff ff       	jmp    80104d79 <alltraps>

801057fd <vector171>:
.globl vector171
vector171:
  pushl $0
801057fd:	6a 00                	push   $0x0
  pushl $171
801057ff:	68 ab 00 00 00       	push   $0xab
  jmp alltraps
80105804:	e9 70 f5 ff ff       	jmp    80104d79 <alltraps>

80105809 <vector172>:
.globl vector172
vector172:
  pushl $0
80105809:	6a 00                	push   $0x0
  pushl $172
8010580b:	68 ac 00 00 00       	push   $0xac
  jmp alltraps
80105810:	e9 64 f5 ff ff       	jmp    80104d79 <alltraps>

80105815 <vector173>:
.globl vector173
vector173:
  pushl $0
80105815:	6a 00                	push   $0x0
  pushl $173
80105817:	68 ad 00 00 00       	push   $0xad
  jmp alltraps
8010581c:	e9 58 f5 ff ff       	jmp    80104d79 <alltraps>

80105821 <vector174>:
.globl vector174
vector174:
  pushl $0
80105821:	6a 00                	push   $0x0
  pushl $174
80105823:	68 ae 00 00 00       	push   $0xae
  jmp alltraps
80105828:	e9 4c f5 ff ff       	jmp    80104d79 <alltraps>

8010582d <vector175>:
.globl vector175
vector175:
  pushl $0
8010582d:	6a 00                	push   $0x0
  pushl $175
8010582f:	68 af 00 00 00       	push   $0xaf
  jmp alltraps
80105834:	e9 40 f5 ff ff       	jmp    80104d79 <alltraps>

80105839 <vector176>:
.globl vector176
vector176:
  pushl $0
80105839:	6a 00                	push   $0x0
  pushl $176
8010583b:	68 b0 00 00 00       	push   $0xb0
  jmp alltraps
80105840:	e9 34 f5 ff ff       	jmp    80104d79 <alltraps>

80105845 <vector177>:
.globl vector177
vector177:
  pushl $0
80105845:	6a 00                	push   $0x0
  pushl $177
80105847:	68 b1 00 00 00       	push   $0xb1
  jmp alltraps
8010584c:	e9 28 f5 ff ff       	jmp    80104d79 <alltraps>

80105851 <vector178>:
.globl vector178
vector178:
  pushl $0
80105851:	6a 00                	push   $0x0
  pushl $178
80105853:	68 b2 00 00 00       	push   $0xb2
  jmp alltraps
80105858:	e9 1c f5 ff ff       	jmp    80104d79 <alltraps>

8010585d <vector179>:
.globl vector179
vector179:
  pushl $0
8010585d:	6a 00                	push   $0x0
  pushl $179
8010585f:	68 b3 00 00 00       	push   $0xb3
  jmp alltraps
80105864:	e9 10 f5 ff ff       	jmp    80104d79 <alltraps>

80105869 <vector180>:
.globl vector180
vector180:
  pushl $0
80105869:	6a 00                	push   $0x0
  pushl $180
8010586b:	68 b4 00 00 00       	push   $0xb4
  jmp alltraps
80105870:	e9 04 f5 ff ff       	jmp    80104d79 <alltraps>

80105875 <vector181>:
.globl vector181
vector181:
  pushl $0
80105875:	6a 00                	push   $0x0
  pushl $181
80105877:	68 b5 00 00 00       	push   $0xb5
  jmp alltraps
8010587c:	e9 f8 f4 ff ff       	jmp    80104d79 <alltraps>

80105881 <vector182>:
.globl vector182
vector182:
  pushl $0
80105881:	6a 00                	push   $0x0
  pushl $182
80105883:	68 b6 00 00 00       	push   $0xb6
  jmp alltraps
80105888:	e9 ec f4 ff ff       	jmp    80104d79 <alltraps>

8010588d <vector183>:
.globl vector183
vector183:
  pushl $0
8010588d:	6a 00                	push   $0x0
  pushl $183
8010588f:	68 b7 00 00 00       	push   $0xb7
  jmp alltraps
80105894:	e9 e0 f4 ff ff       	jmp    80104d79 <alltraps>

80105899 <vector184>:
.globl vector184
vector184:
  pushl $0
80105899:	6a 00                	push   $0x0
  pushl $184
8010589b:	68 b8 00 00 00       	push   $0xb8
  jmp alltraps
801058a0:	e9 d4 f4 ff ff       	jmp    80104d79 <alltraps>

801058a5 <vector185>:
.globl vector185
vector185:
  pushl $0
801058a5:	6a 00                	push   $0x0
  pushl $185
801058a7:	68 b9 00 00 00       	push   $0xb9
  jmp alltraps
801058ac:	e9 c8 f4 ff ff       	jmp    80104d79 <alltraps>

801058b1 <vector186>:
.globl vector186
vector186:
  pushl $0
801058b1:	6a 00                	push   $0x0
  pushl $186
801058b3:	68 ba 00 00 00       	push   $0xba
  jmp alltraps
801058b8:	e9 bc f4 ff ff       	jmp    80104d79 <alltraps>

801058bd <vector187>:
.globl vector187
vector187:
  pushl $0
801058bd:	6a 00                	push   $0x0
  pushl $187
801058bf:	68 bb 00 00 00       	push   $0xbb
  jmp alltraps
801058c4:	e9 b0 f4 ff ff       	jmp    80104d79 <alltraps>

801058c9 <vector188>:
.globl vector188
vector188:
  pushl $0
801058c9:	6a 00                	push   $0x0
  pushl $188
801058cb:	68 bc 00 00 00       	push   $0xbc
  jmp alltraps
801058d0:	e9 a4 f4 ff ff       	jmp    80104d79 <alltraps>

801058d5 <vector189>:
.globl vector189
vector189:
  pushl $0
801058d5:	6a 00                	push   $0x0
  pushl $189
801058d7:	68 bd 00 00 00       	push   $0xbd
  jmp alltraps
801058dc:	e9 98 f4 ff ff       	jmp    80104d79 <alltraps>

801058e1 <vector190>:
.globl vector190
vector190:
  pushl $0
801058e1:	6a 00                	push   $0x0
  pushl $190
801058e3:	68 be 00 00 00       	push   $0xbe
  jmp alltraps
801058e8:	e9 8c f4 ff ff       	jmp    80104d79 <alltraps>

801058ed <vector191>:
.globl vector191
vector191:
  pushl $0
801058ed:	6a 00                	push   $0x0
  pushl $191
801058ef:	68 bf 00 00 00       	push   $0xbf
  jmp alltraps
801058f4:	e9 80 f4 ff ff       	jmp    80104d79 <alltraps>

801058f9 <vector192>:
.globl vector192
vector192:
  pushl $0
801058f9:	6a 00                	push   $0x0
  pushl $192
801058fb:	68 c0 00 00 00       	push   $0xc0
  jmp alltraps
80105900:	e9 74 f4 ff ff       	jmp    80104d79 <alltraps>

80105905 <vector193>:
.globl vector193
vector193:
  pushl $0
80105905:	6a 00                	push   $0x0
  pushl $193
80105907:	68 c1 00 00 00       	push   $0xc1
  jmp alltraps
8010590c:	e9 68 f4 ff ff       	jmp    80104d79 <alltraps>

80105911 <vector194>:
.globl vector194
vector194:
  pushl $0
80105911:	6a 00                	push   $0x0
  pushl $194
80105913:	68 c2 00 00 00       	push   $0xc2
  jmp alltraps
80105918:	e9 5c f4 ff ff       	jmp    80104d79 <alltraps>

8010591d <vector195>:
.globl vector195
vector195:
  pushl $0
8010591d:	6a 00                	push   $0x0
  pushl $195
8010591f:	68 c3 00 00 00       	push   $0xc3
  jmp alltraps
80105924:	e9 50 f4 ff ff       	jmp    80104d79 <alltraps>

80105929 <vector196>:
.globl vector196
vector196:
  pushl $0
80105929:	6a 00                	push   $0x0
  pushl $196
8010592b:	68 c4 00 00 00       	push   $0xc4
  jmp alltraps
80105930:	e9 44 f4 ff ff       	jmp    80104d79 <alltraps>

80105935 <vector197>:
.globl vector197
vector197:
  pushl $0
80105935:	6a 00                	push   $0x0
  pushl $197
80105937:	68 c5 00 00 00       	push   $0xc5
  jmp alltraps
8010593c:	e9 38 f4 ff ff       	jmp    80104d79 <alltraps>

80105941 <vector198>:
.globl vector198
vector198:
  pushl $0
80105941:	6a 00                	push   $0x0
  pushl $198
80105943:	68 c6 00 00 00       	push   $0xc6
  jmp alltraps
80105948:	e9 2c f4 ff ff       	jmp    80104d79 <alltraps>

8010594d <vector199>:
.globl vector199
vector199:
  pushl $0
8010594d:	6a 00                	push   $0x0
  pushl $199
8010594f:	68 c7 00 00 00       	push   $0xc7
  jmp alltraps
80105954:	e9 20 f4 ff ff       	jmp    80104d79 <alltraps>

80105959 <vector200>:
.globl vector200
vector200:
  pushl $0
80105959:	6a 00                	push   $0x0
  pushl $200
8010595b:	68 c8 00 00 00       	push   $0xc8
  jmp alltraps
80105960:	e9 14 f4 ff ff       	jmp    80104d79 <alltraps>

80105965 <vector201>:
.globl vector201
vector201:
  pushl $0
80105965:	6a 00                	push   $0x0
  pushl $201
80105967:	68 c9 00 00 00       	push   $0xc9
  jmp alltraps
8010596c:	e9 08 f4 ff ff       	jmp    80104d79 <alltraps>

80105971 <vector202>:
.globl vector202
vector202:
  pushl $0
80105971:	6a 00                	push   $0x0
  pushl $202
80105973:	68 ca 00 00 00       	push   $0xca
  jmp alltraps
80105978:	e9 fc f3 ff ff       	jmp    80104d79 <alltraps>

8010597d <vector203>:
.globl vector203
vector203:
  pushl $0
8010597d:	6a 00                	push   $0x0
  pushl $203
8010597f:	68 cb 00 00 00       	push   $0xcb
  jmp alltraps
80105984:	e9 f0 f3 ff ff       	jmp    80104d79 <alltraps>

80105989 <vector204>:
.globl vector204
vector204:
  pushl $0
80105989:	6a 00                	push   $0x0
  pushl $204
8010598b:	68 cc 00 00 00       	push   $0xcc
  jmp alltraps
80105990:	e9 e4 f3 ff ff       	jmp    80104d79 <alltraps>

80105995 <vector205>:
.globl vector205
vector205:
  pushl $0
80105995:	6a 00                	push   $0x0
  pushl $205
80105997:	68 cd 00 00 00       	push   $0xcd
  jmp alltraps
8010599c:	e9 d8 f3 ff ff       	jmp    80104d79 <alltraps>

801059a1 <vector206>:
.globl vector206
vector206:
  pushl $0
801059a1:	6a 00                	push   $0x0
  pushl $206
801059a3:	68 ce 00 00 00       	push   $0xce
  jmp alltraps
801059a8:	e9 cc f3 ff ff       	jmp    80104d79 <alltraps>

801059ad <vector207>:
.globl vector207
vector207:
  pushl $0
801059ad:	6a 00                	push   $0x0
  pushl $207
801059af:	68 cf 00 00 00       	push   $0xcf
  jmp alltraps
801059b4:	e9 c0 f3 ff ff       	jmp    80104d79 <alltraps>

801059b9 <vector208>:
.globl vector208
vector208:
  pushl $0
801059b9:	6a 00                	push   $0x0
  pushl $208
801059bb:	68 d0 00 00 00       	push   $0xd0
  jmp alltraps
801059c0:	e9 b4 f3 ff ff       	jmp    80104d79 <alltraps>

801059c5 <vector209>:
.globl vector209
vector209:
  pushl $0
801059c5:	6a 00                	push   $0x0
  pushl $209
801059c7:	68 d1 00 00 00       	push   $0xd1
  jmp alltraps
801059cc:	e9 a8 f3 ff ff       	jmp    80104d79 <alltraps>

801059d1 <vector210>:
.globl vector210
vector210:
  pushl $0
801059d1:	6a 00                	push   $0x0
  pushl $210
801059d3:	68 d2 00 00 00       	push   $0xd2
  jmp alltraps
801059d8:	e9 9c f3 ff ff       	jmp    80104d79 <alltraps>

801059dd <vector211>:
.globl vector211
vector211:
  pushl $0
801059dd:	6a 00                	push   $0x0
  pushl $211
801059df:	68 d3 00 00 00       	push   $0xd3
  jmp alltraps
801059e4:	e9 90 f3 ff ff       	jmp    80104d79 <alltraps>

801059e9 <vector212>:
.globl vector212
vector212:
  pushl $0
801059e9:	6a 00                	push   $0x0
  pushl $212
801059eb:	68 d4 00 00 00       	push   $0xd4
  jmp alltraps
801059f0:	e9 84 f3 ff ff       	jmp    80104d79 <alltraps>

801059f5 <vector213>:
.globl vector213
vector213:
  pushl $0
801059f5:	6a 00                	push   $0x0
  pushl $213
801059f7:	68 d5 00 00 00       	push   $0xd5
  jmp alltraps
801059fc:	e9 78 f3 ff ff       	jmp    80104d79 <alltraps>

80105a01 <vector214>:
.globl vector214
vector214:
  pushl $0
80105a01:	6a 00                	push   $0x0
  pushl $214
80105a03:	68 d6 00 00 00       	push   $0xd6
  jmp alltraps
80105a08:	e9 6c f3 ff ff       	jmp    80104d79 <alltraps>

80105a0d <vector215>:
.globl vector215
vector215:
  pushl $0
80105a0d:	6a 00                	push   $0x0
  pushl $215
80105a0f:	68 d7 00 00 00       	push   $0xd7
  jmp alltraps
80105a14:	e9 60 f3 ff ff       	jmp    80104d79 <alltraps>

80105a19 <vector216>:
.globl vector216
vector216:
  pushl $0
80105a19:	6a 00                	push   $0x0
  pushl $216
80105a1b:	68 d8 00 00 00       	push   $0xd8
  jmp alltraps
80105a20:	e9 54 f3 ff ff       	jmp    80104d79 <alltraps>

80105a25 <vector217>:
.globl vector217
vector217:
  pushl $0
80105a25:	6a 00                	push   $0x0
  pushl $217
80105a27:	68 d9 00 00 00       	push   $0xd9
  jmp alltraps
80105a2c:	e9 48 f3 ff ff       	jmp    80104d79 <alltraps>

80105a31 <vector218>:
.globl vector218
vector218:
  pushl $0
80105a31:	6a 00                	push   $0x0
  pushl $218
80105a33:	68 da 00 00 00       	push   $0xda
  jmp alltraps
80105a38:	e9 3c f3 ff ff       	jmp    80104d79 <alltraps>

80105a3d <vector219>:
.globl vector219
vector219:
  pushl $0
80105a3d:	6a 00                	push   $0x0
  pushl $219
80105a3f:	68 db 00 00 00       	push   $0xdb
  jmp alltraps
80105a44:	e9 30 f3 ff ff       	jmp    80104d79 <alltraps>

80105a49 <vector220>:
.globl vector220
vector220:
  pushl $0
80105a49:	6a 00                	push   $0x0
  pushl $220
80105a4b:	68 dc 00 00 00       	push   $0xdc
  jmp alltraps
80105a50:	e9 24 f3 ff ff       	jmp    80104d79 <alltraps>

80105a55 <vector221>:
.globl vector221
vector221:
  pushl $0
80105a55:	6a 00                	push   $0x0
  pushl $221
80105a57:	68 dd 00 00 00       	push   $0xdd
  jmp alltraps
80105a5c:	e9 18 f3 ff ff       	jmp    80104d79 <alltraps>

80105a61 <vector222>:
.globl vector222
vector222:
  pushl $0
80105a61:	6a 00                	push   $0x0
  pushl $222
80105a63:	68 de 00 00 00       	push   $0xde
  jmp alltraps
80105a68:	e9 0c f3 ff ff       	jmp    80104d79 <alltraps>

80105a6d <vector223>:
.globl vector223
vector223:
  pushl $0
80105a6d:	6a 00                	push   $0x0
  pushl $223
80105a6f:	68 df 00 00 00       	push   $0xdf
  jmp alltraps
80105a74:	e9 00 f3 ff ff       	jmp    80104d79 <alltraps>

80105a79 <vector224>:
.globl vector224
vector224:
  pushl $0
80105a79:	6a 00                	push   $0x0
  pushl $224
80105a7b:	68 e0 00 00 00       	push   $0xe0
  jmp alltraps
80105a80:	e9 f4 f2 ff ff       	jmp    80104d79 <alltraps>

80105a85 <vector225>:
.globl vector225
vector225:
  pushl $0
80105a85:	6a 00                	push   $0x0
  pushl $225
80105a87:	68 e1 00 00 00       	push   $0xe1
  jmp alltraps
80105a8c:	e9 e8 f2 ff ff       	jmp    80104d79 <alltraps>

80105a91 <vector226>:
.globl vector226
vector226:
  pushl $0
80105a91:	6a 00                	push   $0x0
  pushl $226
80105a93:	68 e2 00 00 00       	push   $0xe2
  jmp alltraps
80105a98:	e9 dc f2 ff ff       	jmp    80104d79 <alltraps>

80105a9d <vector227>:
.globl vector227
vector227:
  pushl $0
80105a9d:	6a 00                	push   $0x0
  pushl $227
80105a9f:	68 e3 00 00 00       	push   $0xe3
  jmp alltraps
80105aa4:	e9 d0 f2 ff ff       	jmp    80104d79 <alltraps>

80105aa9 <vector228>:
.globl vector228
vector228:
  pushl $0
80105aa9:	6a 00                	push   $0x0
  pushl $228
80105aab:	68 e4 00 00 00       	push   $0xe4
  jmp alltraps
80105ab0:	e9 c4 f2 ff ff       	jmp    80104d79 <alltraps>

80105ab5 <vector229>:
.globl vector229
vector229:
  pushl $0
80105ab5:	6a 00                	push   $0x0
  pushl $229
80105ab7:	68 e5 00 00 00       	push   $0xe5
  jmp alltraps
80105abc:	e9 b8 f2 ff ff       	jmp    80104d79 <alltraps>

80105ac1 <vector230>:
.globl vector230
vector230:
  pushl $0
80105ac1:	6a 00                	push   $0x0
  pushl $230
80105ac3:	68 e6 00 00 00       	push   $0xe6
  jmp alltraps
80105ac8:	e9 ac f2 ff ff       	jmp    80104d79 <alltraps>

80105acd <vector231>:
.globl vector231
vector231:
  pushl $0
80105acd:	6a 00                	push   $0x0
  pushl $231
80105acf:	68 e7 00 00 00       	push   $0xe7
  jmp alltraps
80105ad4:	e9 a0 f2 ff ff       	jmp    80104d79 <alltraps>

80105ad9 <vector232>:
.globl vector232
vector232:
  pushl $0
80105ad9:	6a 00                	push   $0x0
  pushl $232
80105adb:	68 e8 00 00 00       	push   $0xe8
  jmp alltraps
80105ae0:	e9 94 f2 ff ff       	jmp    80104d79 <alltraps>

80105ae5 <vector233>:
.globl vector233
vector233:
  pushl $0
80105ae5:	6a 00                	push   $0x0
  pushl $233
80105ae7:	68 e9 00 00 00       	push   $0xe9
  jmp alltraps
80105aec:	e9 88 f2 ff ff       	jmp    80104d79 <alltraps>

80105af1 <vector234>:
.globl vector234
vector234:
  pushl $0
80105af1:	6a 00                	push   $0x0
  pushl $234
80105af3:	68 ea 00 00 00       	push   $0xea
  jmp alltraps
80105af8:	e9 7c f2 ff ff       	jmp    80104d79 <alltraps>

80105afd <vector235>:
.globl vector235
vector235:
  pushl $0
80105afd:	6a 00                	push   $0x0
  pushl $235
80105aff:	68 eb 00 00 00       	push   $0xeb
  jmp alltraps
80105b04:	e9 70 f2 ff ff       	jmp    80104d79 <alltraps>

80105b09 <vector236>:
.globl vector236
vector236:
  pushl $0
80105b09:	6a 00                	push   $0x0
  pushl $236
80105b0b:	68 ec 00 00 00       	push   $0xec
  jmp alltraps
80105b10:	e9 64 f2 ff ff       	jmp    80104d79 <alltraps>

80105b15 <vector237>:
.globl vector237
vector237:
  pushl $0
80105b15:	6a 00                	push   $0x0
  pushl $237
80105b17:	68 ed 00 00 00       	push   $0xed
  jmp alltraps
80105b1c:	e9 58 f2 ff ff       	jmp    80104d79 <alltraps>

80105b21 <vector238>:
.globl vector238
vector238:
  pushl $0
80105b21:	6a 00                	push   $0x0
  pushl $238
80105b23:	68 ee 00 00 00       	push   $0xee
  jmp alltraps
80105b28:	e9 4c f2 ff ff       	jmp    80104d79 <alltraps>

80105b2d <vector239>:
.globl vector239
vector239:
  pushl $0
80105b2d:	6a 00                	push   $0x0
  pushl $239
80105b2f:	68 ef 00 00 00       	push   $0xef
  jmp alltraps
80105b34:	e9 40 f2 ff ff       	jmp    80104d79 <alltraps>

80105b39 <vector240>:
.globl vector240
vector240:
  pushl $0
80105b39:	6a 00                	push   $0x0
  pushl $240
80105b3b:	68 f0 00 00 00       	push   $0xf0
  jmp alltraps
80105b40:	e9 34 f2 ff ff       	jmp    80104d79 <alltraps>

80105b45 <vector241>:
.globl vector241
vector241:
  pushl $0
80105b45:	6a 00                	push   $0x0
  pushl $241
80105b47:	68 f1 00 00 00       	push   $0xf1
  jmp alltraps
80105b4c:	e9 28 f2 ff ff       	jmp    80104d79 <alltraps>

80105b51 <vector242>:
.globl vector242
vector242:
  pushl $0
80105b51:	6a 00                	push   $0x0
  pushl $242
80105b53:	68 f2 00 00 00       	push   $0xf2
  jmp alltraps
80105b58:	e9 1c f2 ff ff       	jmp    80104d79 <alltraps>

80105b5d <vector243>:
.globl vector243
vector243:
  pushl $0
80105b5d:	6a 00                	push   $0x0
  pushl $243
80105b5f:	68 f3 00 00 00       	push   $0xf3
  jmp alltraps
80105b64:	e9 10 f2 ff ff       	jmp    80104d79 <alltraps>

80105b69 <vector244>:
.globl vector244
vector244:
  pushl $0
80105b69:	6a 00                	push   $0x0
  pushl $244
80105b6b:	68 f4 00 00 00       	push   $0xf4
  jmp alltraps
80105b70:	e9 04 f2 ff ff       	jmp    80104d79 <alltraps>

80105b75 <vector245>:
.globl vector245
vector245:
  pushl $0
80105b75:	6a 00                	push   $0x0
  pushl $245
80105b77:	68 f5 00 00 00       	push   $0xf5
  jmp alltraps
80105b7c:	e9 f8 f1 ff ff       	jmp    80104d79 <alltraps>

80105b81 <vector246>:
.globl vector246
vector246:
  pushl $0
80105b81:	6a 00                	push   $0x0
  pushl $246
80105b83:	68 f6 00 00 00       	push   $0xf6
  jmp alltraps
80105b88:	e9 ec f1 ff ff       	jmp    80104d79 <alltraps>

80105b8d <vector247>:
.globl vector247
vector247:
  pushl $0
80105b8d:	6a 00                	push   $0x0
  pushl $247
80105b8f:	68 f7 00 00 00       	push   $0xf7
  jmp alltraps
80105b94:	e9 e0 f1 ff ff       	jmp    80104d79 <alltraps>

80105b99 <vector248>:
.globl vector248
vector248:
  pushl $0
80105b99:	6a 00                	push   $0x0
  pushl $248
80105b9b:	68 f8 00 00 00       	push   $0xf8
  jmp alltraps
80105ba0:	e9 d4 f1 ff ff       	jmp    80104d79 <alltraps>

80105ba5 <vector249>:
.globl vector249
vector249:
  pushl $0
80105ba5:	6a 00                	push   $0x0
  pushl $249
80105ba7:	68 f9 00 00 00       	push   $0xf9
  jmp alltraps
80105bac:	e9 c8 f1 ff ff       	jmp    80104d79 <alltraps>

80105bb1 <vector250>:
.globl vector250
vector250:
  pushl $0
80105bb1:	6a 00                	push   $0x0
  pushl $250
80105bb3:	68 fa 00 00 00       	push   $0xfa
  jmp alltraps
80105bb8:	e9 bc f1 ff ff       	jmp    80104d79 <alltraps>

80105bbd <vector251>:
.globl vector251
vector251:
  pushl $0
80105bbd:	6a 00                	push   $0x0
  pushl $251
80105bbf:	68 fb 00 00 00       	push   $0xfb
  jmp alltraps
80105bc4:	e9 b0 f1 ff ff       	jmp    80104d79 <alltraps>

80105bc9 <vector252>:
.globl vector252
vector252:
  pushl $0
80105bc9:	6a 00                	push   $0x0
  pushl $252
80105bcb:	68 fc 00 00 00       	push   $0xfc
  jmp alltraps
80105bd0:	e9 a4 f1 ff ff       	jmp    80104d79 <alltraps>

80105bd5 <vector253>:
.globl vector253
vector253:
  pushl $0
80105bd5:	6a 00                	push   $0x0
  pushl $253
80105bd7:	68 fd 00 00 00       	push   $0xfd
  jmp alltraps
80105bdc:	e9 98 f1 ff ff       	jmp    80104d79 <alltraps>

80105be1 <vector254>:
.globl vector254
vector254:
  pushl $0
80105be1:	6a 00                	push   $0x0
  pushl $254
80105be3:	68 fe 00 00 00       	push   $0xfe
  jmp alltraps
80105be8:	e9 8c f1 ff ff       	jmp    80104d79 <alltraps>

80105bed <vector255>:
.globl vector255
vector255:
  pushl $0
80105bed:	6a 00                	push   $0x0
  pushl $255
80105bef:	68 ff 00 00 00       	push   $0xff
  jmp alltraps
80105bf4:	e9 80 f1 ff ff       	jmp    80104d79 <alltraps>

80105bf9 <walkpgdir>:
80105bf9:	55                   	push   %ebp
80105bfa:	89 e5                	mov    %esp,%ebp
80105bfc:	57                   	push   %edi
80105bfd:	56                   	push   %esi
80105bfe:	53                   	push   %ebx
80105bff:	83 ec 0c             	sub    $0xc,%esp
80105c02:	89 d6                	mov    %edx,%esi
80105c04:	c1 ea 16             	shr    $0x16,%edx
80105c07:	8d 3c 90             	lea    (%eax,%edx,4),%edi
80105c0a:	8b 1f                	mov    (%edi),%ebx
80105c0c:	f6 c3 01             	test   $0x1,%bl
80105c0f:	74 21                	je     80105c32 <walkpgdir+0x39>
80105c11:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80105c17:	81 c3 00 00 00 80    	add    $0x80000000,%ebx
80105c1d:	c1 ee 0a             	shr    $0xa,%esi
80105c20:	81 e6 fc 0f 00 00    	and    $0xffc,%esi
80105c26:	01 f3                	add    %esi,%ebx
80105c28:	89 d8                	mov    %ebx,%eax
80105c2a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105c2d:	5b                   	pop    %ebx
80105c2e:	5e                   	pop    %esi
80105c2f:	5f                   	pop    %edi
80105c30:	5d                   	pop    %ebp
80105c31:	c3                   	ret
80105c32:	bb 00 00 00 00       	mov    $0x0,%ebx
80105c37:	85 c9                	test   %ecx,%ecx
80105c39:	74 ed                	je     80105c28 <walkpgdir+0x2f>
80105c3b:	e8 a7 c4 ff ff       	call   801020e7 <kalloc>
80105c40:	89 c3                	mov    %eax,%ebx
80105c42:	85 c0                	test   %eax,%eax
80105c44:	74 e2                	je     80105c28 <walkpgdir+0x2f>
80105c46:	83 ec 04             	sub    $0x4,%esp
80105c49:	68 00 10 00 00       	push   $0x1000
80105c4e:	6a 00                	push   $0x0
80105c50:	50                   	push   %eax
80105c51:	e8 c6 e0 ff ff       	call   80103d1c <memset>
80105c56:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80105c5c:	83 c8 07             	or     $0x7,%eax
80105c5f:	89 07                	mov    %eax,(%edi)
80105c61:	83 c4 10             	add    $0x10,%esp
80105c64:	eb b7                	jmp    80105c1d <walkpgdir+0x24>

80105c66 <mappages>:
80105c66:	55                   	push   %ebp
80105c67:	89 e5                	mov    %esp,%ebp
80105c69:	57                   	push   %edi
80105c6a:	56                   	push   %esi
80105c6b:	53                   	push   %ebx
80105c6c:	83 ec 1c             	sub    $0x1c,%esp
80105c6f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80105c72:	89 d0                	mov    %edx,%eax
80105c74:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
80105c7a:	89 d6                	mov    %edx,%esi
80105c7c:	8d 44 08 ff          	lea    -0x1(%eax,%ecx,1),%eax
80105c80:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80105c85:	89 45 e0             	mov    %eax,-0x20(%ebp)
80105c88:	8b 7d 08             	mov    0x8(%ebp),%edi
80105c8b:	29 d7                	sub    %edx,%edi
80105c8d:	8d 1c 3e             	lea    (%esi,%edi,1),%ebx
80105c90:	b9 01 00 00 00       	mov    $0x1,%ecx
80105c95:	89 f2                	mov    %esi,%edx
80105c97:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80105c9a:	e8 5a ff ff ff       	call   80105bf9 <walkpgdir>
80105c9f:	85 c0                	test   %eax,%eax
80105ca1:	74 29                	je     80105ccc <mappages+0x66>
80105ca3:	f6 00 01             	testb  $0x1,(%eax)
80105ca6:	75 17                	jne    80105cbf <mappages+0x59>
80105ca8:	0b 5d 0c             	or     0xc(%ebp),%ebx
80105cab:	83 cb 01             	or     $0x1,%ebx
80105cae:	89 18                	mov    %ebx,(%eax)
80105cb0:	8b 45 e0             	mov    -0x20(%ebp),%eax
80105cb3:	39 c6                	cmp    %eax,%esi
80105cb5:	74 22                	je     80105cd9 <mappages+0x73>
80105cb7:	81 c6 00 10 00 00    	add    $0x1000,%esi
80105cbd:	eb ce                	jmp    80105c8d <mappages+0x27>
80105cbf:	83 ec 0c             	sub    $0xc,%esp
80105cc2:	68 4a 68 10 80       	push   $0x8010684a
80105cc7:	e8 76 a6 ff ff       	call   80100342 <panic>
80105ccc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105cd1:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105cd4:	5b                   	pop    %ebx
80105cd5:	5e                   	pop    %esi
80105cd6:	5f                   	pop    %edi
80105cd7:	5d                   	pop    %ebp
80105cd8:	c3                   	ret
80105cd9:	b8 00 00 00 00       	mov    $0x0,%eax
80105cde:	eb f1                	jmp    80105cd1 <mappages+0x6b>

80105ce0 <seginit>:
80105ce0:	55                   	push   %ebp
80105ce1:	89 e5                	mov    %esp,%ebp
80105ce3:	83 ec 18             	sub    $0x18,%esp
80105ce6:	e8 35 d5 ff ff       	call   80103220 <cpuid>
80105ceb:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
80105cf1:	66 c7 80 18 08 11 80 	movw   $0xffff,-0x7feef7e8(%eax)
80105cf8:	ff ff 
80105cfa:	66 c7 80 1a 08 11 80 	movw   $0x0,-0x7feef7e6(%eax)
80105d01:	00 00 
80105d03:	c6 80 1c 08 11 80 00 	movb   $0x0,-0x7feef7e4(%eax)
80105d0a:	c6 80 1d 08 11 80 9a 	movb   $0x9a,-0x7feef7e3(%eax)
80105d11:	c6 80 1e 08 11 80 cf 	movb   $0xcf,-0x7feef7e2(%eax)
80105d18:	c6 80 1f 08 11 80 00 	movb   $0x0,-0x7feef7e1(%eax)
80105d1f:	66 c7 80 20 08 11 80 	movw   $0xffff,-0x7feef7e0(%eax)
80105d26:	ff ff 
80105d28:	66 c7 80 22 08 11 80 	movw   $0x0,-0x7feef7de(%eax)
80105d2f:	00 00 
80105d31:	c6 80 24 08 11 80 00 	movb   $0x0,-0x7feef7dc(%eax)
80105d38:	c6 80 25 08 11 80 92 	movb   $0x92,-0x7feef7db(%eax)
80105d3f:	c6 80 26 08 11 80 cf 	movb   $0xcf,-0x7feef7da(%eax)
80105d46:	c6 80 27 08 11 80 00 	movb   $0x0,-0x7feef7d9(%eax)
80105d4d:	66 c7 80 28 08 11 80 	movw   $0xffff,-0x7feef7d8(%eax)
80105d54:	ff ff 
80105d56:	66 c7 80 2a 08 11 80 	movw   $0x0,-0x7feef7d6(%eax)
80105d5d:	00 00 
80105d5f:	c6 80 2c 08 11 80 00 	movb   $0x0,-0x7feef7d4(%eax)
80105d66:	c6 80 2d 08 11 80 fa 	movb   $0xfa,-0x7feef7d3(%eax)
80105d6d:	c6 80 2e 08 11 80 cf 	movb   $0xcf,-0x7feef7d2(%eax)
80105d74:	c6 80 2f 08 11 80 00 	movb   $0x0,-0x7feef7d1(%eax)
80105d7b:	66 c7 80 30 08 11 80 	movw   $0xffff,-0x7feef7d0(%eax)
80105d82:	ff ff 
80105d84:	66 c7 80 32 08 11 80 	movw   $0x0,-0x7feef7ce(%eax)
80105d8b:	00 00 
80105d8d:	c6 80 34 08 11 80 00 	movb   $0x0,-0x7feef7cc(%eax)
80105d94:	c6 80 35 08 11 80 f2 	movb   $0xf2,-0x7feef7cb(%eax)
80105d9b:	c6 80 36 08 11 80 cf 	movb   $0xcf,-0x7feef7ca(%eax)
80105da2:	c6 80 37 08 11 80 00 	movb   $0x0,-0x7feef7c9(%eax)
80105da9:	05 10 08 11 80       	add    $0x80110810,%eax
80105dae:	66 c7 45 f2 2f 00    	movw   $0x2f,-0xe(%ebp)
80105db4:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
80105db8:	c1 e8 10             	shr    $0x10,%eax
80105dbb:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
80105dbf:	8d 45 f2             	lea    -0xe(%ebp),%eax
80105dc2:	0f 01 10             	lgdtl  (%eax)
80105dc5:	c9                   	leave
80105dc6:	c3                   	ret

80105dc7 <switchkvm>:
80105dc7:	a1 c4 34 11 80       	mov    0x801134c4,%eax
80105dcc:	05 00 00 00 80       	add    $0x80000000,%eax
80105dd1:	0f 22 d8             	mov    %eax,%cr3
80105dd4:	c3                   	ret

80105dd5 <switchuvm>:
80105dd5:	55                   	push   %ebp
80105dd6:	89 e5                	mov    %esp,%ebp
80105dd8:	57                   	push   %edi
80105dd9:	56                   	push   %esi
80105dda:	53                   	push   %ebx
80105ddb:	83 ec 1c             	sub    $0x1c,%esp
80105dde:	8b 75 08             	mov    0x8(%ebp),%esi
80105de1:	85 f6                	test   %esi,%esi
80105de3:	0f 84 c3 00 00 00    	je     80105eac <switchuvm+0xd7>
80105de9:	83 7e 08 00          	cmpl   $0x0,0x8(%esi)
80105ded:	0f 84 c6 00 00 00    	je     80105eb9 <switchuvm+0xe4>
80105df3:	83 7e 04 00          	cmpl   $0x0,0x4(%esi)
80105df7:	0f 84 c9 00 00 00    	je     80105ec6 <switchuvm+0xf1>
80105dfd:	e8 9c dd ff ff       	call   80103b9e <pushcli>
80105e02:	e8 ba d3 ff ff       	call   801031c1 <mycpu>
80105e07:	89 c3                	mov    %eax,%ebx
80105e09:	e8 b3 d3 ff ff       	call   801031c1 <mycpu>
80105e0e:	89 c7                	mov    %eax,%edi
80105e10:	e8 ac d3 ff ff       	call   801031c1 <mycpu>
80105e15:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80105e18:	e8 a4 d3 ff ff       	call   801031c1 <mycpu>
80105e1d:	66 c7 83 98 00 00 00 	movw   $0x67,0x98(%ebx)
80105e24:	67 00 
80105e26:	83 c7 08             	add    $0x8,%edi
80105e29:	66 89 bb 9a 00 00 00 	mov    %di,0x9a(%ebx)
80105e30:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80105e33:	83 c2 08             	add    $0x8,%edx
80105e36:	c1 ea 10             	shr    $0x10,%edx
80105e39:	88 93 9c 00 00 00    	mov    %dl,0x9c(%ebx)
80105e3f:	c6 83 9d 00 00 00 99 	movb   $0x99,0x9d(%ebx)
80105e46:	c6 83 9e 00 00 00 40 	movb   $0x40,0x9e(%ebx)
80105e4d:	83 c0 08             	add    $0x8,%eax
80105e50:	c1 e8 18             	shr    $0x18,%eax
80105e53:	88 83 9f 00 00 00    	mov    %al,0x9f(%ebx)
80105e59:	e8 63 d3 ff ff       	call   801031c1 <mycpu>
80105e5e:	80 a0 9d 00 00 00 ef 	andb   $0xef,0x9d(%eax)
80105e65:	e8 57 d3 ff ff       	call   801031c1 <mycpu>
80105e6a:	66 c7 40 10 10 00    	movw   $0x10,0x10(%eax)
80105e70:	8b 5e 08             	mov    0x8(%esi),%ebx
80105e73:	e8 49 d3 ff ff       	call   801031c1 <mycpu>
80105e78:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80105e7e:	89 58 0c             	mov    %ebx,0xc(%eax)
80105e81:	e8 3b d3 ff ff       	call   801031c1 <mycpu>
80105e86:	66 c7 40 6e ff ff    	movw   $0xffff,0x6e(%eax)
80105e8c:	b8 28 00 00 00       	mov    $0x28,%eax
80105e91:	0f 00 d8             	ltr    %eax
80105e94:	8b 46 04             	mov    0x4(%esi),%eax
80105e97:	05 00 00 00 80       	add    $0x80000000,%eax
80105e9c:	0f 22 d8             	mov    %eax,%cr3
80105e9f:	e8 36 dd ff ff       	call   80103bda <popcli>
80105ea4:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105ea7:	5b                   	pop    %ebx
80105ea8:	5e                   	pop    %esi
80105ea9:	5f                   	pop    %edi
80105eaa:	5d                   	pop    %ebp
80105eab:	c3                   	ret
80105eac:	83 ec 0c             	sub    $0xc,%esp
80105eaf:	68 50 68 10 80       	push   $0x80106850
80105eb4:	e8 89 a4 ff ff       	call   80100342 <panic>
80105eb9:	83 ec 0c             	sub    $0xc,%esp
80105ebc:	68 66 68 10 80       	push   $0x80106866
80105ec1:	e8 7c a4 ff ff       	call   80100342 <panic>
80105ec6:	83 ec 0c             	sub    $0xc,%esp
80105ec9:	68 7b 68 10 80       	push   $0x8010687b
80105ece:	e8 6f a4 ff ff       	call   80100342 <panic>

80105ed3 <inituvm>:
80105ed3:	55                   	push   %ebp
80105ed4:	89 e5                	mov    %esp,%ebp
80105ed6:	56                   	push   %esi
80105ed7:	53                   	push   %ebx
80105ed8:	8b 75 10             	mov    0x10(%ebp),%esi
80105edb:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80105ee1:	77 4c                	ja     80105f2f <inituvm+0x5c>
80105ee3:	e8 ff c1 ff ff       	call   801020e7 <kalloc>
80105ee8:	89 c3                	mov    %eax,%ebx
80105eea:	83 ec 04             	sub    $0x4,%esp
80105eed:	68 00 10 00 00       	push   $0x1000
80105ef2:	6a 00                	push   $0x0
80105ef4:	50                   	push   %eax
80105ef5:	e8 22 de ff ff       	call   80103d1c <memset>
80105efa:	83 c4 08             	add    $0x8,%esp
80105efd:	6a 06                	push   $0x6
80105eff:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80105f05:	50                   	push   %eax
80105f06:	b9 00 10 00 00       	mov    $0x1000,%ecx
80105f0b:	ba 00 00 00 00       	mov    $0x0,%edx
80105f10:	8b 45 08             	mov    0x8(%ebp),%eax
80105f13:	e8 4e fd ff ff       	call   80105c66 <mappages>
80105f18:	83 c4 0c             	add    $0xc,%esp
80105f1b:	56                   	push   %esi
80105f1c:	ff 75 0c             	push   0xc(%ebp)
80105f1f:	53                   	push   %ebx
80105f20:	e8 6e de ff ff       	call   80103d93 <memmove>
80105f25:	83 c4 10             	add    $0x10,%esp
80105f28:	8d 65 f8             	lea    -0x8(%ebp),%esp
80105f2b:	5b                   	pop    %ebx
80105f2c:	5e                   	pop    %esi
80105f2d:	5d                   	pop    %ebp
80105f2e:	c3                   	ret
80105f2f:	83 ec 0c             	sub    $0xc,%esp
80105f32:	68 8f 68 10 80       	push   $0x8010688f
80105f37:	e8 06 a4 ff ff       	call   80100342 <panic>

80105f3c <loaduvm>:
80105f3c:	55                   	push   %ebp
80105f3d:	89 e5                	mov    %esp,%ebp
80105f3f:	57                   	push   %edi
80105f40:	56                   	push   %esi
80105f41:	53                   	push   %ebx
80105f42:	83 ec 0c             	sub    $0xc,%esp
80105f45:	8b 7d 18             	mov    0x18(%ebp),%edi
80105f48:	8b 75 0c             	mov    0xc(%ebp),%esi
80105f4b:	81 e6 ff 0f 00 00    	and    $0xfff,%esi
80105f51:	75 61                	jne    80105fb4 <loaduvm+0x78>
80105f53:	b8 00 00 00 00       	mov    $0x0,%eax
80105f58:	85 ff                	test   %edi,%edi
80105f5a:	74 77                	je     80105fd3 <loaduvm+0x97>
80105f5c:	89 f2                	mov    %esi,%edx
80105f5e:	03 55 0c             	add    0xc(%ebp),%edx
80105f61:	b9 00 00 00 00       	mov    $0x0,%ecx
80105f66:	8b 45 08             	mov    0x8(%ebp),%eax
80105f69:	e8 8b fc ff ff       	call   80105bf9 <walkpgdir>
80105f6e:	85 c0                	test   %eax,%eax
80105f70:	74 4f                	je     80105fc1 <loaduvm+0x85>
80105f72:	89 fb                	mov    %edi,%ebx
80105f74:	29 f3                	sub    %esi,%ebx
80105f76:	ba 00 10 00 00       	mov    $0x1000,%edx
80105f7b:	39 d3                	cmp    %edx,%ebx
80105f7d:	0f 47 da             	cmova  %edx,%ebx
80105f80:	53                   	push   %ebx
80105f81:	89 f2                	mov    %esi,%edx
80105f83:	03 55 14             	add    0x14(%ebp),%edx
80105f86:	52                   	push   %edx
80105f87:	8b 00                	mov    (%eax),%eax
80105f89:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80105f8e:	05 00 00 00 80       	add    $0x80000000,%eax
80105f93:	50                   	push   %eax
80105f94:	ff 75 10             	push   0x10(%ebp)
80105f97:	e8 7b b7 ff ff       	call   80101717 <readi>
80105f9c:	83 c4 10             	add    $0x10,%esp
80105f9f:	39 d8                	cmp    %ebx,%eax
80105fa1:	75 2b                	jne    80105fce <loaduvm+0x92>
80105fa3:	81 c6 00 10 00 00    	add    $0x1000,%esi
80105fa9:	39 fe                	cmp    %edi,%esi
80105fab:	72 af                	jb     80105f5c <loaduvm+0x20>
80105fad:	b8 00 00 00 00       	mov    $0x0,%eax
80105fb2:	eb 1f                	jmp    80105fd3 <loaduvm+0x97>
80105fb4:	83 ec 0c             	sub    $0xc,%esp
80105fb7:	68 f4 6a 10 80       	push   $0x80106af4
80105fbc:	e8 81 a3 ff ff       	call   80100342 <panic>
80105fc1:	83 ec 0c             	sub    $0xc,%esp
80105fc4:	68 a9 68 10 80       	push   $0x801068a9
80105fc9:	e8 74 a3 ff ff       	call   80100342 <panic>
80105fce:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105fd3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105fd6:	5b                   	pop    %ebx
80105fd7:	5e                   	pop    %esi
80105fd8:	5f                   	pop    %edi
80105fd9:	5d                   	pop    %ebp
80105fda:	c3                   	ret

80105fdb <deallocuvm>:
80105fdb:	55                   	push   %ebp
80105fdc:	89 e5                	mov    %esp,%ebp
80105fde:	57                   	push   %edi
80105fdf:	56                   	push   %esi
80105fe0:	53                   	push   %ebx
80105fe1:	83 ec 0c             	sub    $0xc,%esp
80105fe4:	8b 7d 0c             	mov    0xc(%ebp),%edi
80105fe7:	89 f8                	mov    %edi,%eax
80105fe9:	39 7d 10             	cmp    %edi,0x10(%ebp)
80105fec:	73 16                	jae    80106004 <deallocuvm+0x29>
80105fee:	8b 45 10             	mov    0x10(%ebp),%eax
80105ff1:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80105ff7:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80105ffd:	39 fb                	cmp    %edi,%ebx
80105fff:	72 21                	jb     80106022 <deallocuvm+0x47>
80106001:	8b 45 10             	mov    0x10(%ebp),%eax
80106004:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106007:	5b                   	pop    %ebx
80106008:	5e                   	pop    %esi
80106009:	5f                   	pop    %edi
8010600a:	5d                   	pop    %ebp
8010600b:	c3                   	ret
8010600c:	81 e3 00 00 c0 ff    	and    $0xffc00000,%ebx
80106012:	81 c3 00 f0 3f 00    	add    $0x3ff000,%ebx
80106018:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010601e:	39 fb                	cmp    %edi,%ebx
80106020:	73 df                	jae    80106001 <deallocuvm+0x26>
80106022:	b9 00 00 00 00       	mov    $0x0,%ecx
80106027:	89 da                	mov    %ebx,%edx
80106029:	8b 45 08             	mov    0x8(%ebp),%eax
8010602c:	e8 c8 fb ff ff       	call   80105bf9 <walkpgdir>
80106031:	89 c6                	mov    %eax,%esi
80106033:	85 c0                	test   %eax,%eax
80106035:	74 d5                	je     8010600c <deallocuvm+0x31>
80106037:	8b 00                	mov    (%eax),%eax
80106039:	a8 01                	test   $0x1,%al
8010603b:	74 db                	je     80106018 <deallocuvm+0x3d>
8010603d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106042:	74 19                	je     8010605d <deallocuvm+0x82>
80106044:	83 ec 0c             	sub    $0xc,%esp
80106047:	05 00 00 00 80       	add    $0x80000000,%eax
8010604c:	50                   	push   %eax
8010604d:	e8 70 bf ff ff       	call   80101fc2 <kfree>
80106052:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
80106058:	83 c4 10             	add    $0x10,%esp
8010605b:	eb bb                	jmp    80106018 <deallocuvm+0x3d>
8010605d:	83 ec 0c             	sub    $0xc,%esp
80106060:	68 ec 65 10 80       	push   $0x801065ec
80106065:	e8 d8 a2 ff ff       	call   80100342 <panic>

8010606a <allocuvm>:
8010606a:	55                   	push   %ebp
8010606b:	89 e5                	mov    %esp,%ebp
8010606d:	57                   	push   %edi
8010606e:	56                   	push   %esi
8010606f:	53                   	push   %ebx
80106070:	83 ec 1c             	sub    $0x1c,%esp
80106073:	8b 75 10             	mov    0x10(%ebp),%esi
80106076:	ba 00 00 00 00       	mov    $0x0,%edx
8010607b:	85 f6                	test   %esi,%esi
8010607d:	78 6c                	js     801060eb <allocuvm+0x81>
8010607f:	89 f2                	mov    %esi,%edx
80106081:	3b 75 0c             	cmp    0xc(%ebp),%esi
80106084:	72 62                	jb     801060e8 <allocuvm+0x7e>
80106086:	8b 45 0c             	mov    0xc(%ebp),%eax
80106089:	05 ff 0f 00 00       	add    $0xfff,%eax
8010608e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106093:	89 c7                	mov    %eax,%edi
80106095:	39 f0                	cmp    %esi,%eax
80106097:	73 52                	jae    801060eb <allocuvm+0x81>
80106099:	89 75 e4             	mov    %esi,-0x1c(%ebp)
8010609c:	e8 46 c0 ff ff       	call   801020e7 <kalloc>
801060a1:	89 c3                	mov    %eax,%ebx
801060a3:	85 c0                	test   %eax,%eax
801060a5:	74 4e                	je     801060f5 <allocuvm+0x8b>
801060a7:	83 ec 04             	sub    $0x4,%esp
801060aa:	68 00 10 00 00       	push   $0x1000
801060af:	6a 00                	push   $0x0
801060b1:	50                   	push   %eax
801060b2:	e8 65 dc ff ff       	call   80103d1c <memset>
801060b7:	83 c4 08             	add    $0x8,%esp
801060ba:	6a 06                	push   $0x6
801060bc:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
801060c2:	50                   	push   %eax
801060c3:	b9 00 10 00 00       	mov    $0x1000,%ecx
801060c8:	89 fa                	mov    %edi,%edx
801060ca:	8b 45 08             	mov    0x8(%ebp),%eax
801060cd:	e8 94 fb ff ff       	call   80105c66 <mappages>
801060d2:	83 c4 10             	add    $0x10,%esp
801060d5:	85 c0                	test   %eax,%eax
801060d7:	78 42                	js     8010611b <allocuvm+0xb1>
801060d9:	81 c7 00 10 00 00    	add    $0x1000,%edi
801060df:	39 f7                	cmp    %esi,%edi
801060e1:	72 b9                	jb     8010609c <allocuvm+0x32>
801060e3:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801060e6:	eb 03                	jmp    801060eb <allocuvm+0x81>
801060e8:	8b 55 0c             	mov    0xc(%ebp),%edx
801060eb:	89 d0                	mov    %edx,%eax
801060ed:	8d 65 f4             	lea    -0xc(%ebp),%esp
801060f0:	5b                   	pop    %ebx
801060f1:	5e                   	pop    %esi
801060f2:	5f                   	pop    %edi
801060f3:	5d                   	pop    %ebp
801060f4:	c3                   	ret
801060f5:	83 ec 0c             	sub    $0xc,%esp
801060f8:	68 c7 68 10 80       	push   $0x801068c7
801060fd:	e8 07 a5 ff ff       	call   80100609 <cprintf>
80106102:	83 c4 0c             	add    $0xc,%esp
80106105:	ff 75 0c             	push   0xc(%ebp)
80106108:	56                   	push   %esi
80106109:	ff 75 08             	push   0x8(%ebp)
8010610c:	e8 ca fe ff ff       	call   80105fdb <deallocuvm>
80106111:	83 c4 10             	add    $0x10,%esp
80106114:	ba 00 00 00 00       	mov    $0x0,%edx
80106119:	eb d0                	jmp    801060eb <allocuvm+0x81>
8010611b:	83 ec 0c             	sub    $0xc,%esp
8010611e:	68 df 68 10 80       	push   $0x801068df
80106123:	e8 e1 a4 ff ff       	call   80100609 <cprintf>
80106128:	83 c4 0c             	add    $0xc,%esp
8010612b:	ff 75 0c             	push   0xc(%ebp)
8010612e:	56                   	push   %esi
8010612f:	ff 75 08             	push   0x8(%ebp)
80106132:	e8 a4 fe ff ff       	call   80105fdb <deallocuvm>
80106137:	89 1c 24             	mov    %ebx,(%esp)
8010613a:	e8 83 be ff ff       	call   80101fc2 <kfree>
8010613f:	83 c4 10             	add    $0x10,%esp
80106142:	ba 00 00 00 00       	mov    $0x0,%edx
80106147:	eb a2                	jmp    801060eb <allocuvm+0x81>

80106149 <freevm>:
80106149:	55                   	push   %ebp
8010614a:	89 e5                	mov    %esp,%ebp
8010614c:	57                   	push   %edi
8010614d:	56                   	push   %esi
8010614e:	53                   	push   %ebx
8010614f:	83 ec 0c             	sub    $0xc,%esp
80106152:	8b 7d 08             	mov    0x8(%ebp),%edi
80106155:	85 ff                	test   %edi,%edi
80106157:	74 1d                	je     80106176 <freevm+0x2d>
80106159:	83 ec 04             	sub    $0x4,%esp
8010615c:	6a 00                	push   $0x0
8010615e:	68 00 00 00 80       	push   $0x80000000
80106163:	57                   	push   %edi
80106164:	e8 72 fe ff ff       	call   80105fdb <deallocuvm>
80106169:	89 fb                	mov    %edi,%ebx
8010616b:	8d b7 00 10 00 00    	lea    0x1000(%edi),%esi
80106171:	83 c4 10             	add    $0x10,%esp
80106174:	eb 14                	jmp    8010618a <freevm+0x41>
80106176:	83 ec 0c             	sub    $0xc,%esp
80106179:	68 fb 68 10 80       	push   $0x801068fb
8010617e:	e8 bf a1 ff ff       	call   80100342 <panic>
80106183:	83 c3 04             	add    $0x4,%ebx
80106186:	39 f3                	cmp    %esi,%ebx
80106188:	74 1e                	je     801061a8 <freevm+0x5f>
8010618a:	8b 03                	mov    (%ebx),%eax
8010618c:	a8 01                	test   $0x1,%al
8010618e:	74 f3                	je     80106183 <freevm+0x3a>
80106190:	83 ec 0c             	sub    $0xc,%esp
80106193:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106198:	05 00 00 00 80       	add    $0x80000000,%eax
8010619d:	50                   	push   %eax
8010619e:	e8 1f be ff ff       	call   80101fc2 <kfree>
801061a3:	83 c4 10             	add    $0x10,%esp
801061a6:	eb db                	jmp    80106183 <freevm+0x3a>
801061a8:	83 ec 0c             	sub    $0xc,%esp
801061ab:	57                   	push   %edi
801061ac:	e8 11 be ff ff       	call   80101fc2 <kfree>
801061b1:	83 c4 10             	add    $0x10,%esp
801061b4:	8d 65 f4             	lea    -0xc(%ebp),%esp
801061b7:	5b                   	pop    %ebx
801061b8:	5e                   	pop    %esi
801061b9:	5f                   	pop    %edi
801061ba:	5d                   	pop    %ebp
801061bb:	c3                   	ret

801061bc <setupkvm>:
801061bc:	55                   	push   %ebp
801061bd:	89 e5                	mov    %esp,%ebp
801061bf:	56                   	push   %esi
801061c0:	53                   	push   %ebx
801061c1:	e8 21 bf ff ff       	call   801020e7 <kalloc>
801061c6:	89 c6                	mov    %eax,%esi
801061c8:	85 c0                	test   %eax,%eax
801061ca:	74 42                	je     8010620e <setupkvm+0x52>
801061cc:	83 ec 04             	sub    $0x4,%esp
801061cf:	68 00 10 00 00       	push   $0x1000
801061d4:	6a 00                	push   $0x0
801061d6:	50                   	push   %eax
801061d7:	e8 40 db ff ff       	call   80103d1c <memset>
801061dc:	83 c4 10             	add    $0x10,%esp
801061df:	bb 20 94 10 80       	mov    $0x80109420,%ebx
801061e4:	8b 43 04             	mov    0x4(%ebx),%eax
801061e7:	8b 4b 08             	mov    0x8(%ebx),%ecx
801061ea:	29 c1                	sub    %eax,%ecx
801061ec:	8b 13                	mov    (%ebx),%edx
801061ee:	83 ec 08             	sub    $0x8,%esp
801061f1:	ff 73 0c             	push   0xc(%ebx)
801061f4:	50                   	push   %eax
801061f5:	89 f0                	mov    %esi,%eax
801061f7:	e8 6a fa ff ff       	call   80105c66 <mappages>
801061fc:	83 c4 10             	add    $0x10,%esp
801061ff:	85 c0                	test   %eax,%eax
80106201:	78 14                	js     80106217 <setupkvm+0x5b>
80106203:	83 c3 10             	add    $0x10,%ebx
80106206:	81 fb 60 94 10 80    	cmp    $0x80109460,%ebx
8010620c:	75 d6                	jne    801061e4 <setupkvm+0x28>
8010620e:	89 f0                	mov    %esi,%eax
80106210:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106213:	5b                   	pop    %ebx
80106214:	5e                   	pop    %esi
80106215:	5d                   	pop    %ebp
80106216:	c3                   	ret
80106217:	83 ec 0c             	sub    $0xc,%esp
8010621a:	56                   	push   %esi
8010621b:	e8 29 ff ff ff       	call   80106149 <freevm>
80106220:	83 c4 10             	add    $0x10,%esp
80106223:	be 00 00 00 00       	mov    $0x0,%esi
80106228:	eb e4                	jmp    8010620e <setupkvm+0x52>

8010622a <kvmalloc>:
8010622a:	55                   	push   %ebp
8010622b:	89 e5                	mov    %esp,%ebp
8010622d:	83 ec 08             	sub    $0x8,%esp
80106230:	e8 87 ff ff ff       	call   801061bc <setupkvm>
80106235:	a3 c4 34 11 80       	mov    %eax,0x801134c4
8010623a:	e8 88 fb ff ff       	call   80105dc7 <switchkvm>
8010623f:	c9                   	leave
80106240:	c3                   	ret

80106241 <clearpteu>:
80106241:	55                   	push   %ebp
80106242:	89 e5                	mov    %esp,%ebp
80106244:	83 ec 08             	sub    $0x8,%esp
80106247:	b9 00 00 00 00       	mov    $0x0,%ecx
8010624c:	8b 55 0c             	mov    0xc(%ebp),%edx
8010624f:	8b 45 08             	mov    0x8(%ebp),%eax
80106252:	e8 a2 f9 ff ff       	call   80105bf9 <walkpgdir>
80106257:	85 c0                	test   %eax,%eax
80106259:	74 05                	je     80106260 <clearpteu+0x1f>
8010625b:	83 20 fb             	andl   $0xfffffffb,(%eax)
8010625e:	c9                   	leave
8010625f:	c3                   	ret
80106260:	83 ec 0c             	sub    $0xc,%esp
80106263:	68 0c 69 10 80       	push   $0x8010690c
80106268:	e8 d5 a0 ff ff       	call   80100342 <panic>

8010626d <copyuvm>:
8010626d:	55                   	push   %ebp
8010626e:	89 e5                	mov    %esp,%ebp
80106270:	57                   	push   %edi
80106271:	56                   	push   %esi
80106272:	53                   	push   %ebx
80106273:	83 ec 1c             	sub    $0x1c,%esp
80106276:	e8 41 ff ff ff       	call   801061bc <setupkvm>
8010627b:	89 45 dc             	mov    %eax,-0x24(%ebp)
8010627e:	85 c0                	test   %eax,%eax
80106280:	0f 84 c7 00 00 00    	je     8010634d <copyuvm+0xe0>
80106286:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
8010628a:	0f 84 bd 00 00 00    	je     8010634d <copyuvm+0xe0>
80106290:	bf 00 00 00 00       	mov    $0x0,%edi
80106295:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80106298:	b9 00 00 00 00       	mov    $0x0,%ecx
8010629d:	89 fa                	mov    %edi,%edx
8010629f:	8b 45 08             	mov    0x8(%ebp),%eax
801062a2:	e8 52 f9 ff ff       	call   80105bf9 <walkpgdir>
801062a7:	85 c0                	test   %eax,%eax
801062a9:	74 67                	je     80106312 <copyuvm+0xa5>
801062ab:	8b 00                	mov    (%eax),%eax
801062ad:	a8 01                	test   $0x1,%al
801062af:	74 6e                	je     8010631f <copyuvm+0xb2>
801062b1:	89 c6                	mov    %eax,%esi
801062b3:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
801062b9:	25 ff 0f 00 00       	and    $0xfff,%eax
801062be:	89 45 e0             	mov    %eax,-0x20(%ebp)
801062c1:	e8 21 be ff ff       	call   801020e7 <kalloc>
801062c6:	89 c3                	mov    %eax,%ebx
801062c8:	85 c0                	test   %eax,%eax
801062ca:	74 6c                	je     80106338 <copyuvm+0xcb>
801062cc:	83 ec 04             	sub    $0x4,%esp
801062cf:	68 00 10 00 00       	push   $0x1000
801062d4:	81 c6 00 00 00 80    	add    $0x80000000,%esi
801062da:	56                   	push   %esi
801062db:	50                   	push   %eax
801062dc:	e8 b2 da ff ff       	call   80103d93 <memmove>
801062e1:	83 c4 08             	add    $0x8,%esp
801062e4:	ff 75 e0             	push   -0x20(%ebp)
801062e7:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
801062ed:	50                   	push   %eax
801062ee:	b9 00 10 00 00       	mov    $0x1000,%ecx
801062f3:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801062f6:	8b 45 dc             	mov    -0x24(%ebp),%eax
801062f9:	e8 68 f9 ff ff       	call   80105c66 <mappages>
801062fe:	83 c4 10             	add    $0x10,%esp
80106301:	85 c0                	test   %eax,%eax
80106303:	78 27                	js     8010632c <copyuvm+0xbf>
80106305:	81 c7 00 10 00 00    	add    $0x1000,%edi
8010630b:	3b 7d 0c             	cmp    0xc(%ebp),%edi
8010630e:	72 85                	jb     80106295 <copyuvm+0x28>
80106310:	eb 3b                	jmp    8010634d <copyuvm+0xe0>
80106312:	83 ec 0c             	sub    $0xc,%esp
80106315:	68 16 69 10 80       	push   $0x80106916
8010631a:	e8 23 a0 ff ff       	call   80100342 <panic>
8010631f:	83 ec 0c             	sub    $0xc,%esp
80106322:	68 30 69 10 80       	push   $0x80106930
80106327:	e8 16 a0 ff ff       	call   80100342 <panic>
8010632c:	83 ec 0c             	sub    $0xc,%esp
8010632f:	53                   	push   %ebx
80106330:	e8 8d bc ff ff       	call   80101fc2 <kfree>
80106335:	83 c4 10             	add    $0x10,%esp
80106338:	83 ec 0c             	sub    $0xc,%esp
8010633b:	ff 75 dc             	push   -0x24(%ebp)
8010633e:	e8 06 fe ff ff       	call   80106149 <freevm>
80106343:	83 c4 10             	add    $0x10,%esp
80106346:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
8010634d:	8b 45 dc             	mov    -0x24(%ebp),%eax
80106350:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106353:	5b                   	pop    %ebx
80106354:	5e                   	pop    %esi
80106355:	5f                   	pop    %edi
80106356:	5d                   	pop    %ebp
80106357:	c3                   	ret

80106358 <uva2ka>:
80106358:	55                   	push   %ebp
80106359:	89 e5                	mov    %esp,%ebp
8010635b:	83 ec 08             	sub    $0x8,%esp
8010635e:	b9 00 00 00 00       	mov    $0x0,%ecx
80106363:	8b 55 0c             	mov    0xc(%ebp),%edx
80106366:	8b 45 08             	mov    0x8(%ebp),%eax
80106369:	e8 8b f8 ff ff       	call   80105bf9 <walkpgdir>
8010636e:	8b 10                	mov    (%eax),%edx
80106370:	89 d0                	mov    %edx,%eax
80106372:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106377:	05 00 00 00 80       	add    $0x80000000,%eax
8010637c:	f7 d2                	not    %edx
8010637e:	f6 c2 05             	test   $0x5,%dl
80106381:	ba 00 00 00 00       	mov    $0x0,%edx
80106386:	0f 45 c2             	cmovne %edx,%eax
80106389:	c9                   	leave
8010638a:	c3                   	ret

8010638b <copyout>:
8010638b:	55                   	push   %ebp
8010638c:	89 e5                	mov    %esp,%ebp
8010638e:	57                   	push   %edi
8010638f:	56                   	push   %esi
80106390:	53                   	push   %ebx
80106391:	83 ec 0c             	sub    $0xc,%esp
80106394:	8b 75 0c             	mov    0xc(%ebp),%esi
80106397:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
8010639b:	74 55                	je     801063f2 <copyout+0x67>
8010639d:	89 f7                	mov    %esi,%edi
8010639f:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
801063a5:	83 ec 08             	sub    $0x8,%esp
801063a8:	57                   	push   %edi
801063a9:	ff 75 08             	push   0x8(%ebp)
801063ac:	e8 a7 ff ff ff       	call   80106358 <uva2ka>
801063b1:	83 c4 10             	add    $0x10,%esp
801063b4:	85 c0                	test   %eax,%eax
801063b6:	74 41                	je     801063f9 <copyout+0x6e>
801063b8:	89 fb                	mov    %edi,%ebx
801063ba:	29 f3                	sub    %esi,%ebx
801063bc:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801063c2:	3b 5d 14             	cmp    0x14(%ebp),%ebx
801063c5:	0f 47 5d 14          	cmova  0x14(%ebp),%ebx
801063c9:	83 ec 04             	sub    $0x4,%esp
801063cc:	53                   	push   %ebx
801063cd:	ff 75 10             	push   0x10(%ebp)
801063d0:	29 fe                	sub    %edi,%esi
801063d2:	01 f0                	add    %esi,%eax
801063d4:	50                   	push   %eax
801063d5:	e8 b9 d9 ff ff       	call   80103d93 <memmove>
801063da:	01 5d 10             	add    %ebx,0x10(%ebp)
801063dd:	8d b7 00 10 00 00    	lea    0x1000(%edi),%esi
801063e3:	83 c4 10             	add    $0x10,%esp
801063e6:	29 5d 14             	sub    %ebx,0x14(%ebp)
801063e9:	75 b2                	jne    8010639d <copyout+0x12>
801063eb:	b8 00 00 00 00       	mov    $0x0,%eax
801063f0:	eb 0c                	jmp    801063fe <copyout+0x73>
801063f2:	b8 00 00 00 00       	mov    $0x0,%eax
801063f7:	eb 05                	jmp    801063fe <copyout+0x73>
801063f9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801063fe:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106401:	5b                   	pop    %ebx
80106402:	5e                   	pop    %esi
80106403:	5f                   	pop    %edi
80106404:	5d                   	pop    %ebp
80106405:	c3                   	ret
