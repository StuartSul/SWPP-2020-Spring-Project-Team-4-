
; Function main
start main 0:
  .entry:
    ; init sp!
    sp = sub sp 792 64
    r9 = call read
    store 8 0 sp 0
    store 8 0 sp 8
    store 8 0 sp 16
    store 8 0 sp 24
    store 8 0 sp 32
    store 8 0 sp 40
    store 8 0 sp 48
    store 8 0 sp 56
    store 8 0 sp 64
    store 8 0 sp 72
    store 8 0 sp 80
    store 8 0 sp 88
    store 8 0 sp 96
    store 8 0 sp 104
    store 8 0 sp 112
    store 8 0 sp 120
    store 8 0 sp 128
    store 8 0 sp 136
    store 8 0 sp 144
    store 8 0 sp 152
    store 8 0 sp 160
    store 8 0 sp 168
    store 8 0 sp 176
    store 8 0 sp 184
    store 8 0 sp 192
    store 8 0 sp 200
    store 8 0 sp 208
    store 8 0 sp 216
    store 8 0 sp 224
    store 8 0 sp 232
    store 8 0 sp 240
    store 8 0 sp 248
    store 8 0 sp 256
    store 8 0 sp 264
    store 8 0 sp 272
    store 8 0 sp 280
    store 8 0 sp 288
    store 8 0 sp 296
    store 8 0 sp 304
    store 8 0 sp 312
    store 8 0 sp 320
    store 8 0 sp 328
    store 8 0 sp 336
    store 8 0 sp 344
    store 8 0 sp 352
    store 8 0 sp 360
    store 8 0 sp 368
    store 8 0 sp 376
    store 8 0 sp 384
    store 8 0 sp 392
    store 8 0 sp 400
    br .for.cond

  .for.cond:
    r1 = load 8 sp 400
    r2 = icmp sle r1 50 32
    br r2 .for.body .for.cond.cleanup

  .for.cond.cleanup:
    br .for.end

  .for.body:
    r3 = add r9 0 64
    r4 = add r9 1 64
    r5 = add r9 2 64
    r6 = add r9 3 64
    r7 = add r9 4 64
    r8 = add r9 5 64
    store 8 r1 sp 400
    r1 = add r9 6 64
    store 8 r2 sp 408
    r2 = add r9 7 64
    store 8 r3 sp 416
    r3 = add r9 8 64
    store 8 r4 sp 424
    r4 = add r9 9 64
    store 8 r5 sp 432
    r5 = add r9 10 64
    store 8 r6 sp 440
    r6 = add r9 11 64
    store 8 r7 sp 448
    r7 = add r9 12 64
    store 8 r8 sp 456
    r8 = add r9 13 64
    store 8 r1 sp 464
    r1 = add r9 14 64
    store 8 r2 sp 472
    r2 = add r9 15 64
    store 8 r3 sp 480
    r3 = add r9 16 64
    store 8 r4 sp 488
    r4 = add r9 17 64
    store 8 r5 sp 496
    r5 = add r9 18 64
    store 8 r6 sp 504
    r6 = add r9 19 64
    store 8 r7 sp 512
    r7 = add r9 20 64
    store 8 r8 sp 520
    r8 = add r9 21 64
    store 8 r1 sp 528
    r1 = add r9 22 64
    store 8 r2 sp 536
    r2 = add r9 23 64
    store 8 r3 sp 544
    r3 = add r9 24 64
    store 8 r4 sp 552
    r4 = add r9 25 64
    store 8 r5 sp 560
    r5 = add r9 26 64
    store 8 r6 sp 568
    r6 = add r9 27 64
    store 8 r7 sp 576
    r7 = add r9 28 64
    store 8 r8 sp 584
    r8 = add r9 29 64
    store 8 r1 sp 592
    r1 = add r9 30 64
    store 8 r2 sp 600
    r2 = add r9 31 64
    store 8 r3 sp 608
    r3 = add r9 32 64
    store 8 r4 sp 616
    r4 = add r9 33 64
    store 8 r5 sp 624
    r5 = add r9 34 64
    store 8 r6 sp 632
    r6 = add r9 35 64
    store 8 r7 sp 640
    r7 = add r9 36 64
    store 8 r8 sp 648
    r8 = add r9 37 64
    store 8 r1 sp 656
    r1 = add r9 38 64
    store 8 r2 sp 664
    r2 = add r9 39 64
    store 8 r3 sp 672
    r3 = add r9 40 64
    store 8 r4 sp 680
    r4 = add r9 41 64
    store 8 r5 sp 688
    r5 = add r9 42 64
    store 8 r6 sp 696
    r6 = add r9 43 64
    store 8 r7 sp 704
    r7 = add r9 44 64
    store 8 r8 sp 712
    r8 = add r9 45 64
    store 8 r1 sp 720
    r16 = add r9 46 64
    r15 = add r9 47 64
    r14 = add r9 48 64
    r13 = add r9 49 64
    br .for.inc

  .for.inc:
    r1 = load 8 sp 400
    store 8 r2 sp 728
    r12 = add r1 1 32
    r2 = load 8 sp 416
    store 8 r2 sp 0
    store 8 r3 sp 736
    r3 = load 8 sp 424
    store 8 r3 sp 8
    store 8 r4 sp 744
    r4 = load 8 sp 432
    store 8 r4 sp 16
    store 8 r5 sp 752
    r5 = load 8 sp 440
    store 8 r5 sp 24
    store 8 r6 sp 760
    r6 = load 8 sp 448
    store 8 r6 sp 32
    store 8 r7 sp 768
    r7 = load 8 sp 456
    store 8 r7 sp 40
    store 8 r8 sp 776
    r8 = load 8 sp 464
    store 8 r8 sp 48
    store 8 r1 sp 400
    r1 = load 8 sp 472
    store 8 r1 sp 56
    store 8 r2 sp 416
    r2 = load 8 sp 480
    store 8 r2 sp 64
    store 8 r3 sp 424
    r3 = load 8 sp 488
    store 8 r3 sp 72
    store 8 r4 sp 432
    r4 = load 8 sp 496
    store 8 r4 sp 80
    store 8 r5 sp 440
    r5 = load 8 sp 504
    store 8 r5 sp 88
    store 8 r6 sp 448
    r6 = load 8 sp 512
    store 8 r6 sp 96
    store 8 r7 sp 456
    r7 = load 8 sp 520
    store 8 r7 sp 104
    store 8 r8 sp 464
    r8 = load 8 sp 528
    store 8 r8 sp 112
    store 8 r1 sp 472
    r1 = load 8 sp 536
    store 8 r1 sp 120
    store 8 r2 sp 480
    r2 = load 8 sp 544
    store 8 r2 sp 128
    store 8 r3 sp 488
    r3 = load 8 sp 552
    store 8 r3 sp 136
    store 8 r4 sp 496
    r4 = load 8 sp 560
    store 8 r4 sp 144
    store 8 r5 sp 504
    r5 = load 8 sp 568
    store 8 r5 sp 152
    store 8 r6 sp 512
    r6 = load 8 sp 576
    store 8 r6 sp 160
    store 8 r7 sp 520
    r7 = load 8 sp 584
    store 8 r7 sp 168
    store 8 r8 sp 528
    r8 = load 8 sp 592
    store 8 r8 sp 176
    store 8 r1 sp 536
    r1 = load 8 sp 600
    store 8 r1 sp 184
    store 8 r2 sp 544
    r2 = load 8 sp 608
    store 8 r2 sp 192
    store 8 r3 sp 552
    r3 = load 8 sp 616
    store 8 r3 sp 200
    store 8 r4 sp 560
    r4 = load 8 sp 624
    store 8 r4 sp 208
    store 8 r5 sp 568
    r5 = load 8 sp 632
    store 8 r5 sp 216
    store 8 r6 sp 576
    r6 = load 8 sp 640
    store 8 r6 sp 224
    store 8 r7 sp 584
    r7 = load 8 sp 648
    store 8 r7 sp 232
    store 8 r8 sp 592
    r8 = load 8 sp 656
    store 8 r8 sp 240
    store 8 r1 sp 600
    r1 = load 8 sp 664
    store 8 r1 sp 248
    store 8 r2 sp 608
    r2 = load 8 sp 672
    store 8 r2 sp 256
    store 8 r3 sp 616
    r3 = load 8 sp 680
    store 8 r3 sp 264
    store 8 r4 sp 624
    r4 = load 8 sp 688
    store 8 r4 sp 272
    store 8 r5 sp 632
    r5 = load 8 sp 696
    store 8 r5 sp 280
    store 8 r6 sp 640
    r6 = load 8 sp 704
    store 8 r6 sp 288
    store 8 r7 sp 648
    r7 = load 8 sp 712
    store 8 r7 sp 296
    store 8 r8 sp 656
    r8 = load 8 sp 720
    store 8 r8 sp 304
    store 8 r1 sp 664
    r1 = load 8 sp 728
    store 8 r1 sp 312
    store 8 r2 sp 672
    r2 = load 8 sp 736
    store 8 r2 sp 320
    store 8 r3 sp 680
    r3 = load 8 sp 744
    store 8 r3 sp 328
    store 8 r4 sp 688
    r4 = load 8 sp 752
    store 8 r4 sp 336
    store 8 r5 sp 696
    r5 = load 8 sp 760
    store 8 r5 sp 344
    store 8 r6 sp 704
    r6 = load 8 sp 768
    store 8 r6 sp 352
    store 8 r7 sp 712
    r7 = load 8 sp 776
    store 8 r7 sp 360
    store 8 r16 sp 368
    store 8 r15 sp 376
    store 8 r14 sp 384
    store 8 r13 sp 392
    store 8 r12 sp 400
    br .for.cond

  .for.end:
    store 8 0 sp 784
    br .for.cond51

  .for.cond51:
    store 8 r8 sp 720
    r8 = load 8 sp 784
    store 8 r1 sp 728
    r11 = icmp sle r8 50 32
    br r11 .for.body54 .for.cond.cleanup53

  .for.cond.cleanup53:
    br .for.end57

  .for.body54:
    r1 = load 8 sp 0
    call write r1
    store 8 r2 sp 736
    r2 = load 8 sp 8
    call write r2
    store 8 r3 sp 744
    r3 = load 8 sp 16
    call write r3
    store 8 r4 sp 752
    r4 = load 8 sp 24
    call write r4
    store 8 r5 sp 760
    r5 = load 8 sp 32
    call write r5
    store 8 r6 sp 768
    r6 = load 8 sp 40
    call write r6
    store 8 r7 sp 776
    r7 = load 8 sp 48
    call write r7
    store 8 r8 sp 784
    r8 = load 8 sp 56
    call write r8
    store 8 r1 sp 0
    r1 = load 8 sp 64
    call write r1
    store 8 r2 sp 8
    r2 = load 8 sp 72
    call write r2
    store 8 r3 sp 16
    r3 = load 8 sp 80
    call write r3
    store 8 r4 sp 24
    r4 = load 8 sp 88
    call write r4
    store 8 r5 sp 32
    r5 = load 8 sp 96
    call write r5
    store 8 r6 sp 40
    r6 = load 8 sp 104
    call write r6
    store 8 r7 sp 48
    r7 = load 8 sp 112
    call write r7
    store 8 r8 sp 56
    r8 = load 8 sp 120
    call write r8
    store 8 r1 sp 64
    r1 = load 8 sp 128
    call write r1
    store 8 r2 sp 72
    r2 = load 8 sp 136
    call write r2
    store 8 r3 sp 80
    r3 = load 8 sp 144
    call write r3
    store 8 r4 sp 88
    r4 = load 8 sp 152
    call write r4
    store 8 r5 sp 96
    r5 = load 8 sp 160
    call write r5
    store 8 r6 sp 104
    r6 = load 8 sp 168
    call write r6
    store 8 r7 sp 112
    r7 = load 8 sp 176
    call write r7
    store 8 r8 sp 120
    r8 = load 8 sp 184
    call write r8
    store 8 r1 sp 128
    r1 = load 8 sp 192
    call write r1
    store 8 r2 sp 136
    r2 = load 8 sp 200
    call write r2
    store 8 r3 sp 144
    r3 = load 8 sp 208
    call write r3
    store 8 r4 sp 152
    r4 = load 8 sp 216
    call write r4
    store 8 r5 sp 160
    r5 = load 8 sp 224
    call write r5
    store 8 r6 sp 168
    r6 = load 8 sp 232
    call write r6
    store 8 r7 sp 176
    r7 = load 8 sp 240
    call write r7
    store 8 r8 sp 184
    r8 = load 8 sp 248
    call write r8
    store 8 r1 sp 192
    r1 = load 8 sp 256
    call write r1
    store 8 r2 sp 200
    r2 = load 8 sp 264
    call write r2
    store 8 r3 sp 208
    r3 = load 8 sp 272
    call write r3
    store 8 r4 sp 216
    r4 = load 8 sp 280
    call write r4
    store 8 r5 sp 224
    r5 = load 8 sp 288
    call write r5
    store 8 r6 sp 232
    r6 = load 8 sp 296
    call write r6
    store 8 r7 sp 240
    r7 = load 8 sp 304
    call write r7
    store 8 r8 sp 248
    r8 = load 8 sp 312
    call write r8
    store 8 r1 sp 256
    r1 = load 8 sp 320
    call write r1
    store 8 r2 sp 264
    r2 = load 8 sp 328
    call write r2
    store 8 r3 sp 272
    r3 = load 8 sp 336
    call write r3
    store 8 r4 sp 280
    r4 = load 8 sp 344
    call write r4
    store 8 r5 sp 288
    r5 = load 8 sp 352
    call write r5
    store 8 r6 sp 296
    r6 = load 8 sp 360
    call write r6
    store 8 r7 sp 304
    r7 = load 8 sp 368
    call write r7
    store 8 r8 sp 312
    r8 = load 8 sp 376
    call write r8
    store 8 r1 sp 320
    r1 = load 8 sp 384
    call write r1
    store 8 r2 sp 328
    r2 = load 8 sp 392
    call write r2
    br .for.inc55

  .for.inc55:
    store 8 r3 sp 336
    r3 = load 8 sp 784
    store 8 r4 sp 344
    r10 = add r3 1 32
    store 8 r10 sp 784
    br .for.cond51

  .for.end57:
    ret 0
end main
