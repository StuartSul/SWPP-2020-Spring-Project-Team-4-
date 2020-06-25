
; Function malloc_upto_8
start malloc_upto_8 1:
  .entry:
    ; init sp!
    sp = sub sp 32 64
    r1 = add arg1 7 64
    store 8 r1 sp 0
    r1 = load 8 sp 0
    r1 = udiv r1 8 64
    store 8 r1 sp 8
    r1 = load 8 sp 8
    r1 = mul r1 8 64
    store 8 r1 sp 16
    r1 = load 8 sp 16
    r1 = malloc r1
    store 8 r1 sp 24
    r1 = load 8 sp 24
    ret r1
end malloc_upto_8

; Function merge
start merge 4:
  .entry:
    ; init sp!
    sp = sub sp 736 64
    r1 = sub arg3 arg2 32
    store 8 r1 sp 0
    r1 = load 8 sp 0
    r1 = add r1 1 32
    store 8 r1 sp 8
    r1 = sub arg4 arg3 32
    store 8 r1 sp 16
    r1 = load 8 sp 8
    r2 = and r1 2147483648 64
    r2 = sub 0 r2 64
    r1 = or r2 r1 64
    store 8 r1 sp 24
    r2 = load 8 sp 24
    r1 = mul 4 r2 64
    store 8 r1 sp 32
    r1 = load 8 sp 32
    r1 = call malloc_upto_8 r1
    store 8 r1 sp 40
    r1 = load 8 sp 40
    store 8 r1 sp 48
    r1 = load 8 sp 16
    r2 = and r1 2147483648 64
    r2 = sub 0 r2 64
    r1 = or r2 r1 64
    store 8 r1 sp 56
    r2 = load 8 sp 56
    r1 = mul 4 r2 64
    store 8 r1 sp 64
    r1 = load 8 sp 64
    r1 = call malloc_upto_8 r1
    store 8 r1 sp 72
    r1 = load 8 sp 72
    store 8 r1 sp 80
    store 8 0 sp 96
    r1 = load 8 sp 96
    store 8 r1 sp 88
    br .for.cond

  .for.cond:
    r1 = load 8 sp 88
    r2 = load 8 sp 8
    r1 = icmp slt r1 r2 32
    store 8 r1 sp 104
    r1 = load 8 sp 104
    br r1 .for.body .for.end

  .for.body:
    r2 = load 8 sp 88
    r1 = add arg2 r2 32
    store 8 r1 sp 112
    r1 = load 8 sp 112
    r2 = and r1 2147483648 64
    r2 = sub 0 r2 64
    r1 = or r2 r1 64
    store 8 r1 sp 120
    r1 = mul arg1 1 64
    r2 = load 8 sp 120
    r2 = mul r2 4 64
    r1 = add r1 r2 64
    store 8 r1 sp 128
    r1 = load 8 sp 128
    r1 = load 4 r1 0
    store 8 r1 sp 136
    r1 = load 8 sp 88
    r2 = and r1 2147483648 64
    r2 = sub 0 r2 64
    r1 = or r2 r1 64
    store 8 r1 sp 144
    r1 = load 8 sp 48
    r2 = load 8 sp 144
    r2 = mul r2 4 64
    r1 = add r1 r2 64
    store 8 r1 sp 152
    r1 = load 8 sp 136
    r2 = load 8 sp 152
    store 4 r1 r2 0
    br .for.inc

  .for.inc:
    r1 = load 8 sp 88
    r1 = add r1 1 32
    store 8 r1 sp 160
    r1 = load 8 sp 160
    store 8 r1 sp 96
    r1 = load 8 sp 96
    store 8 r1 sp 88
    br .for.cond

  .for.end:
    store 8 0 sp 176
    r1 = load 8 sp 176
    store 8 r1 sp 168
    br .for.cond9

  .for.cond9:
    r1 = load 8 sp 168
    r2 = load 8 sp 16
    r1 = icmp slt r1 r2 32
    store 8 r1 sp 184
    r1 = load 8 sp 184
    br r1 .for.body12 .for.end21

  .for.body12:
    r1 = add arg3 1 32
    store 8 r1 sp 192
    r1 = load 8 sp 192
    r2 = load 8 sp 168
    r1 = add r1 r2 32
    store 8 r1 sp 200
    r1 = load 8 sp 200
    r2 = and r1 2147483648 64
    r2 = sub 0 r2 64
    r1 = or r2 r1 64
    store 8 r1 sp 208
    r1 = mul arg1 1 64
    r2 = load 8 sp 208
    r2 = mul r2 4 64
    r1 = add r1 r2 64
    store 8 r1 sp 216
    r1 = load 8 sp 216
    r1 = load 4 r1 0
    store 8 r1 sp 224
    r1 = load 8 sp 168
    r2 = and r1 2147483648 64
    r2 = sub 0 r2 64
    r1 = or r2 r1 64
    store 8 r1 sp 232
    r1 = load 8 sp 80
    r2 = load 8 sp 232
    r2 = mul r2 4 64
    r1 = add r1 r2 64
    store 8 r1 sp 240
    r1 = load 8 sp 224
    r2 = load 8 sp 240
    store 4 r1 r2 0
    br .for.inc19

  .for.inc19:
    r1 = load 8 sp 168
    r1 = add r1 1 32
    store 8 r1 sp 248
    r1 = load 8 sp 248
    store 8 r1 sp 176
    r1 = load 8 sp 176
    store 8 r1 sp 168
    br .for.cond9

  .for.end21:
    store 8 arg2 sp 264
    store 8 0 sp 280
    store 8 0 sp 296
    r1 = load 8 sp 264
    store 8 r1 sp 256
    r1 = load 8 sp 280
    store 8 r1 sp 272
    r1 = load 8 sp 296
    store 8 r1 sp 288
    br .while.cond

  .while.cond:
    r1 = load 8 sp 288
    r2 = load 8 sp 8
    r1 = icmp slt r1 r2 32
    store 8 r1 sp 304
    store 8 0 sp 328
    r1 = load 8 sp 328
    store 8 r1 sp 320
    r1 = load 8 sp 304
    br r1 .land.rhs .land.end

  .land.rhs:
    r1 = load 8 sp 272
    r2 = load 8 sp 16
    r1 = icmp slt r1 r2 32
    store 8 r1 sp 312
    r1 = load 8 sp 312
    store 8 r1 sp 328
    r1 = load 8 sp 328
    store 8 r1 sp 320
    br .land.end

  .land.end:
    r1 = load 8 sp 320
    br r1 .while.body .while.end

  .while.body:
    r1 = load 8 sp 288
    r2 = and r1 2147483648 64
    r2 = sub 0 r2 64
    r1 = or r2 r1 64
    store 8 r1 sp 336
    r1 = load 8 sp 48
    r2 = load 8 sp 336
    r2 = mul r2 4 64
    r1 = add r1 r2 64
    store 8 r1 sp 344
    r1 = load 8 sp 344
    r1 = load 4 r1 0
    store 8 r1 sp 352
    r1 = load 8 sp 272
    r2 = and r1 2147483648 64
    r2 = sub 0 r2 64
    r1 = or r2 r1 64
    store 8 r1 sp 360
    r1 = load 8 sp 80
    r2 = load 8 sp 360
    r2 = mul r2 4 64
    r1 = add r1 r2 64
    store 8 r1 sp 368
    r1 = load 8 sp 368
    r1 = load 4 r1 0
    store 8 r1 sp 376
    r1 = load 8 sp 352
    r2 = load 8 sp 376
    r1 = icmp sle r1 r2 32
    store 8 r1 sp 384
    r1 = load 8 sp 384
    br r1 .if.then .if.else

  .if.then:
    r1 = load 8 sp 288
    r2 = and r1 2147483648 64
    r2 = sub 0 r2 64
    r1 = or r2 r1 64
    store 8 r1 sp 392
    r1 = load 8 sp 48
    r2 = load 8 sp 392
    r2 = mul r2 4 64
    r1 = add r1 r2 64
    store 8 r1 sp 400
    r1 = load 8 sp 400
    r1 = load 4 r1 0
    store 8 r1 sp 408
    r1 = load 8 sp 256
    r2 = and r1 2147483648 64
    r2 = sub 0 r2 64
    r1 = or r2 r1 64
    store 8 r1 sp 416
    r1 = mul arg1 1 64
    r2 = load 8 sp 416
    r2 = mul r2 4 64
    r1 = add r1 r2 64
    store 8 r1 sp 424
    r1 = load 8 sp 408
    r2 = load 8 sp 424
    store 4 r1 r2 0
    r1 = load 8 sp 288
    r1 = add r1 1 32
    store 8 r1 sp 432
    r1 = load 8 sp 272
    store 8 r1 sp 496
    r1 = load 8 sp 432
    store 8 r1 sp 512
    r1 = load 8 sp 496
    store 8 r1 sp 488
    r1 = load 8 sp 512
    store 8 r1 sp 504
    br .if.end

  .if.else:
    r1 = load 8 sp 272
    r2 = and r1 2147483648 64
    r2 = sub 0 r2 64
    r1 = or r2 r1 64
    store 8 r1 sp 440
    r1 = load 8 sp 80
    r2 = load 8 sp 440
    r2 = mul r2 4 64
    r1 = add r1 r2 64
    store 8 r1 sp 448
    r1 = load 8 sp 448
    r1 = load 4 r1 0
    store 8 r1 sp 456
    r1 = load 8 sp 256
    r2 = and r1 2147483648 64
    r2 = sub 0 r2 64
    r1 = or r2 r1 64
    store 8 r1 sp 464
    r1 = mul arg1 1 64
    r2 = load 8 sp 464
    r2 = mul r2 4 64
    r1 = add r1 r2 64
    store 8 r1 sp 472
    r1 = load 8 sp 456
    r2 = load 8 sp 472
    store 4 r1 r2 0
    r1 = load 8 sp 272
    r1 = add r1 1 32
    store 8 r1 sp 480
    r1 = load 8 sp 480
    store 8 r1 sp 496
    r1 = load 8 sp 288
    store 8 r1 sp 512
    r1 = load 8 sp 496
    store 8 r1 sp 488
    r1 = load 8 sp 512
    store 8 r1 sp 504
    br .if.end

  .if.end:
    r1 = load 8 sp 256
    r1 = add r1 1 32
    store 8 r1 sp 520
    r1 = load 8 sp 520
    store 8 r1 sp 264
    r1 = load 8 sp 488
    store 8 r1 sp 280
    r1 = load 8 sp 504
    store 8 r1 sp 296
    r1 = load 8 sp 264
    store 8 r1 sp 256
    r1 = load 8 sp 280
    store 8 r1 sp 272
    r1 = load 8 sp 296
    store 8 r1 sp 288
    br .while.cond

  .while.end:
    r1 = load 8 sp 256
    store 8 r1 sp 536
    r1 = load 8 sp 288
    store 8 r1 sp 552
    r1 = load 8 sp 536
    store 8 r1 sp 528
    r1 = load 8 sp 552
    store 8 r1 sp 544
    br .while.cond43

  .while.cond43:
    r1 = load 8 sp 544
    r2 = load 8 sp 8
    r1 = icmp slt r1 r2 32
    store 8 r1 sp 560
    r1 = load 8 sp 560
    br r1 .while.body46 .while.end53

  .while.body46:
    r1 = load 8 sp 544
    r2 = and r1 2147483648 64
    r2 = sub 0 r2 64
    r1 = or r2 r1 64
    store 8 r1 sp 568
    r1 = load 8 sp 48
    r2 = load 8 sp 568
    r2 = mul r2 4 64
    r1 = add r1 r2 64
    store 8 r1 sp 576
    r1 = load 8 sp 576
    r1 = load 4 r1 0
    store 8 r1 sp 584
    r1 = load 8 sp 528
    r2 = and r1 2147483648 64
    r2 = sub 0 r2 64
    r1 = or r2 r1 64
    store 8 r1 sp 592
    r1 = mul arg1 1 64
    r2 = load 8 sp 592
    r2 = mul r2 4 64
    r1 = add r1 r2 64
    store 8 r1 sp 600
    r1 = load 8 sp 584
    r2 = load 8 sp 600
    store 4 r1 r2 0
    r1 = load 8 sp 544
    r1 = add r1 1 32
    store 8 r1 sp 608
    r1 = load 8 sp 528
    r1 = add r1 1 32
    store 8 r1 sp 616
    r1 = load 8 sp 616
    store 8 r1 sp 536
    r1 = load 8 sp 608
    store 8 r1 sp 552
    r1 = load 8 sp 536
    store 8 r1 sp 528
    r1 = load 8 sp 552
    store 8 r1 sp 544
    br .while.cond43

  .while.end53:
    r1 = load 8 sp 528
    store 8 r1 sp 632
    r1 = load 8 sp 272
    store 8 r1 sp 648
    r1 = load 8 sp 632
    store 8 r1 sp 624
    r1 = load 8 sp 648
    store 8 r1 sp 640
    br .while.cond54

  .while.cond54:
    r1 = load 8 sp 640
    r2 = load 8 sp 16
    r1 = icmp slt r1 r2 32
    store 8 r1 sp 656
    r1 = load 8 sp 656
    br r1 .while.body57 .while.end64

  .while.body57:
    r1 = load 8 sp 640
    r2 = and r1 2147483648 64
    r2 = sub 0 r2 64
    r1 = or r2 r1 64
    store 8 r1 sp 664
    r1 = load 8 sp 80
    r2 = load 8 sp 664
    r2 = mul r2 4 64
    r1 = add r1 r2 64
    store 8 r1 sp 672
    r1 = load 8 sp 672
    r1 = load 4 r1 0
    store 8 r1 sp 680
    r1 = load 8 sp 624
    r2 = and r1 2147483648 64
    r2 = sub 0 r2 64
    r1 = or r2 r1 64
    store 8 r1 sp 688
    r1 = mul arg1 1 64
    r2 = load 8 sp 688
    r2 = mul r2 4 64
    r1 = add r1 r2 64
    store 8 r1 sp 696
    r1 = load 8 sp 680
    r2 = load 8 sp 696
    store 4 r1 r2 0
    r1 = load 8 sp 640
    r1 = add r1 1 32
    store 8 r1 sp 704
    r1 = load 8 sp 624
    r1 = add r1 1 32
    store 8 r1 sp 712
    r1 = load 8 sp 712
    store 8 r1 sp 632
    r1 = load 8 sp 704
    store 8 r1 sp 648
    r1 = load 8 sp 632
    store 8 r1 sp 624
    r1 = load 8 sp 648
    store 8 r1 sp 640
    br .while.cond54

  .while.end64:
    r1 = load 8 sp 48
    store 8 r1 sp 720
    r1 = load 8 sp 720
    free r1
    r1 = load 8 sp 80
    store 8 r1 sp 728
    r1 = load 8 sp 728
    free r1
    ret 0
end merge

; Function mergeSort
start mergeSort 3:
  .entry:
    ; init sp!
    sp = sub sp 40 64
    r1 = icmp slt arg2 arg3 32
    store 8 r1 sp 0
    r1 = load 8 sp 0
    br r1 .if.then .if.end

  .if.then:
    r1 = sub arg3 arg2 32
    store 8 r1 sp 8
    r1 = load 8 sp 8
    r1 = sdiv r1 2 32
    store 8 r1 sp 16
    r2 = load 8 sp 16
    r1 = add arg2 r2 32
    store 8 r1 sp 24
    r3 = load 8 sp 24
    call mergeSort arg1 arg2 r3
    r1 = load 8 sp 24
    r1 = add r1 1 32
    store 8 r1 sp 32
    r2 = load 8 sp 32
    call mergeSort arg1 r2 arg3
    r3 = load 8 sp 24
    call merge arg1 arg2 r3 arg3
    br .if.end

  .if.end:
    ret 0
end mergeSort

; Function main
start main 0:
  .entry:
    ; init sp!
    sp = sub sp 200 64
    r1 = call read
    store 8 r1 sp 0
    r2 = load 8 sp 0
    r1 = mul 4 r2 64
    store 8 r1 sp 8
    r1 = load 8 sp 8
    r1 = call malloc_upto_8 r1
    store 8 r1 sp 16
    r1 = load 8 sp 16
    store 8 r1 sp 24
    store 8 0 sp 40
    r1 = load 8 sp 40
    store 8 r1 sp 32
    br .for.cond

  .for.cond:
    r1 = load 8 sp 32
    r2 = and r1 2147483648 64
    r2 = sub 0 r2 64
    r1 = or r2 r1 64
    store 8 r1 sp 48
    r1 = load 8 sp 48
    r2 = load 8 sp 0
    r1 = icmp ult r1 r2 64
    store 8 r1 sp 56
    r1 = load 8 sp 56
    br r1 .for.body .for.cond.cleanup

  .for.cond.cleanup:
    br .for.end

  .for.body:
    r1 = call read
    store 8 r1 sp 64
    r1 = load 8 sp 64
    r1 = and r1 4294967295 64
    store 8 r1 sp 72
    r1 = load 8 sp 32
    r2 = and r1 2147483648 64
    r2 = sub 0 r2 64
    r1 = or r2 r1 64
    store 8 r1 sp 80
    r1 = load 8 sp 24
    r2 = load 8 sp 80
    r2 = mul r2 4 64
    r1 = add r1 r2 64
    store 8 r1 sp 88
    r1 = load 8 sp 72
    r2 = load 8 sp 88
    store 4 r1 r2 0
    br .for.inc

  .for.inc:
    r1 = load 8 sp 32
    r1 = add r1 1 32
    store 8 r1 sp 96
    r1 = load 8 sp 96
    store 8 r1 sp 40
    r1 = load 8 sp 40
    store 8 r1 sp 32
    br .for.cond

  .for.end:
    r1 = load 8 sp 0
    r1 = sub r1 1 64
    store 8 r1 sp 104
    r1 = load 8 sp 104
    r1 = and r1 4294967295 64
    store 8 r1 sp 112
    r1 = load 8 sp 24
    r3 = load 8 sp 112
    call mergeSort r1 0 r3
    store 8 0 sp 128
    r1 = load 8 sp 128
    store 8 r1 sp 120
    br .for.cond7

  .for.cond7:
    r1 = load 8 sp 120
    r2 = and r1 2147483648 64
    r2 = sub 0 r2 64
    r1 = or r2 r1 64
    store 8 r1 sp 136
    r1 = load 8 sp 136
    r2 = load 8 sp 0
    r1 = icmp ult r1 r2 64
    store 8 r1 sp 144
    r1 = load 8 sp 144
    br r1 .for.body12 .for.cond.cleanup11

  .for.cond.cleanup11:
    br .for.end18

  .for.body12:
    r1 = load 8 sp 120
    r2 = and r1 2147483648 64
    r2 = sub 0 r2 64
    r1 = or r2 r1 64
    store 8 r1 sp 152
    r1 = load 8 sp 24
    r2 = load 8 sp 152
    r2 = mul r2 4 64
    r1 = add r1 r2 64
    store 8 r1 sp 160
    r1 = load 8 sp 160
    r1 = load 4 r1 0
    store 8 r1 sp 168
    r1 = load 8 sp 168
    r2 = and r1 2147483648 64
    r2 = sub 0 r2 64
    r1 = or r2 r1 64
    store 8 r1 sp 176
    r1 = load 8 sp 176
    call write r1
    br .for.inc16

  .for.inc16:
    r1 = load 8 sp 120
    r1 = add r1 1 32
    store 8 r1 sp 184
    r1 = load 8 sp 184
    store 8 r1 sp 128
    r1 = load 8 sp 128
    store 8 r1 sp 120
    br .for.cond7

  .for.end18:
    r1 = load 8 sp 24
    store 8 r1 sp 192
    r1 = load 8 sp 192
    free r1
    ret 0
end main
