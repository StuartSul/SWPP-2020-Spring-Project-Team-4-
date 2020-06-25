
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

; Function getMax
start getMax 2:
  .entry:
    ; init sp!
    sp = sub sp 136 64
    r1 = mul arg1 1 64
    store 8 r1 sp 0
    r1 = load 8 sp 0
    r1 = load 4 r1 0
    store 8 r1 sp 8
    r1 = load 8 sp 8
    store 8 r1 sp 24
    store 8 1 sp 40
    r1 = load 8 sp 24
    store 8 r1 sp 16
    r1 = load 8 sp 40
    store 8 r1 sp 32
    br .for.cond

  .for.cond:
    r1 = load 8 sp 32
    r1 = icmp slt r1 arg2 32
    store 8 r1 sp 48
    r1 = load 8 sp 48
    br r1 .for.body .for.cond.cleanup

  .for.cond.cleanup:
    br .for.end

  .for.body:
    r1 = load 8 sp 32
    r2 = and r1 2147483648 64
    r2 = sub 0 r2 64
    r1 = or r2 r1 64
    store 8 r1 sp 56
    r1 = mul arg1 1 64
    r2 = load 8 sp 56
    r2 = mul r2 4 64
    r1 = add r1 r2 64
    store 8 r1 sp 64
    r1 = load 8 sp 64
    r1 = load 4 r1 0
    store 8 r1 sp 72
    r1 = load 8 sp 72
    r2 = load 8 sp 16
    r1 = icmp sgt r1 r2 32
    store 8 r1 sp 80
    r1 = load 8 sp 16
    store 8 r1 sp 120
    r1 = load 8 sp 120
    store 8 r1 sp 112
    r1 = load 8 sp 80
    br r1 .if.then .if.end

  .if.then:
    r1 = load 8 sp 32
    r2 = and r1 2147483648 64
    r2 = sub 0 r2 64
    r1 = or r2 r1 64
    store 8 r1 sp 88
    r1 = mul arg1 1 64
    r2 = load 8 sp 88
    r2 = mul r2 4 64
    r1 = add r1 r2 64
    store 8 r1 sp 96
    r1 = load 8 sp 96
    r1 = load 4 r1 0
    store 8 r1 sp 104
    r1 = load 8 sp 104
    store 8 r1 sp 120
    r1 = load 8 sp 120
    store 8 r1 sp 112
    br .if.end

  .if.end:
    br .for.inc

  .for.inc:
    r1 = load 8 sp 32
    r1 = add r1 1 32
    store 8 r1 sp 128
    r1 = load 8 sp 112
    store 8 r1 sp 24
    r1 = load 8 sp 128
    store 8 r1 sp 40
    r1 = load 8 sp 24
    store 8 r1 sp 16
    r1 = load 8 sp 40
    store 8 r1 sp 32
    br .for.cond

  .for.end:
    r1 = load 8 sp 16
    ret r1
end getMax

; Function countSort
start countSort 3:
  .entry:
    ; init sp!
    sp = sub sp 632 64
    r1 = add sp 592 64
    store 8 r1 sp 0
    r2 = and arg2 2147483648 64
    r2 = sub 0 r2 64
    r1 = or r2 arg2 64
    store 8 r1 sp 8
    r2 = load 8 sp 8
    r1 = mul 4 r2 64
    store 8 r1 sp 16
    r1 = load 8 sp 16
    r1 = call malloc_upto_8 r1
    store 8 r1 sp 24
    r1 = load 8 sp 24
    store 8 r1 sp 32
    store 8 0 sp 48
    r1 = load 8 sp 48
    store 8 r1 sp 40
    br .for.cond

  .for.cond:
    r1 = load 8 sp 40
    r1 = icmp slt r1 10 32
    store 8 r1 sp 56
    r1 = load 8 sp 56
    br r1 .for.body .for.end

  .for.body:
    r1 = load 8 sp 40
    r2 = and r1 2147483648 64
    r2 = sub 0 r2 64
    r1 = or r2 r1 64
    store 8 r1 sp 64
    r1 = load 8 sp 0
    r2 = load 8 sp 64
    r2 = mul r2 4 64
    r1 = add r1 r2 64
    store 8 r1 sp 72
    r2 = load 8 sp 72
    store 4 0 r2 0
    br .for.inc

  .for.inc:
    r1 = load 8 sp 40
    r1 = add r1 1 32
    store 8 r1 sp 80
    r1 = load 8 sp 80
    store 8 r1 sp 48
    r1 = load 8 sp 48
    store 8 r1 sp 40
    br .for.cond

  .for.end:
    store 8 0 sp 96
    r1 = load 8 sp 96
    store 8 r1 sp 88
    br .for.cond2

  .for.cond2:
    r1 = load 8 sp 88
    r1 = icmp slt r1 arg2 32
    store 8 r1 sp 104
    r1 = load 8 sp 104
    br r1 .for.body5 .for.end13

  .for.body5:
    r1 = load 8 sp 88
    r2 = and r1 2147483648 64
    r2 = sub 0 r2 64
    r1 = or r2 r1 64
    store 8 r1 sp 112
    r1 = mul arg1 1 64
    r2 = load 8 sp 112
    r2 = mul r2 4 64
    r1 = add r1 r2 64
    store 8 r1 sp 120
    r1 = load 8 sp 120
    r1 = load 4 r1 0
    store 8 r1 sp 128
    r1 = load 8 sp 128
    r1 = sdiv r1 arg3 32
    store 8 r1 sp 136
    r1 = load 8 sp 136
    r1 = srem r1 10 32
    store 8 r1 sp 144
    r1 = load 8 sp 144
    r2 = and r1 2147483648 64
    r2 = sub 0 r2 64
    r1 = or r2 r1 64
    store 8 r1 sp 152
    r1 = load 8 sp 0
    r2 = load 8 sp 152
    r2 = mul r2 4 64
    r1 = add r1 r2 64
    store 8 r1 sp 160
    r1 = load 8 sp 160
    r1 = load 4 r1 0
    store 8 r1 sp 168
    r1 = load 8 sp 168
    r1 = add r1 1 32
    store 8 r1 sp 176
    r1 = load 8 sp 176
    r2 = load 8 sp 160
    store 4 r1 r2 0
    br .for.inc11

  .for.inc11:
    r1 = load 8 sp 88
    r1 = add r1 1 32
    store 8 r1 sp 184
    r1 = load 8 sp 184
    store 8 r1 sp 96
    r1 = load 8 sp 96
    store 8 r1 sp 88
    br .for.cond2

  .for.end13:
    store 8 1 sp 200
    r1 = load 8 sp 200
    store 8 r1 sp 192
    br .for.cond14

  .for.cond14:
    r1 = load 8 sp 192
    r1 = icmp slt r1 10 32
    store 8 r1 sp 208
    r1 = load 8 sp 208
    br r1 .for.body17 .for.end24

  .for.body17:
    r1 = load 8 sp 192
    r1 = sub r1 1 32
    store 8 r1 sp 216
    r1 = load 8 sp 216
    r2 = and r1 2147483648 64
    r2 = sub 0 r2 64
    r1 = or r2 r1 64
    store 8 r1 sp 224
    r1 = load 8 sp 0
    r2 = load 8 sp 224
    r2 = mul r2 4 64
    r1 = add r1 r2 64
    store 8 r1 sp 232
    r1 = load 8 sp 232
    r1 = load 4 r1 0
    store 8 r1 sp 240
    r1 = load 8 sp 192
    r2 = and r1 2147483648 64
    r2 = sub 0 r2 64
    r1 = or r2 r1 64
    store 8 r1 sp 248
    r1 = load 8 sp 0
    r2 = load 8 sp 248
    r2 = mul r2 4 64
    r1 = add r1 r2 64
    store 8 r1 sp 256
    r1 = load 8 sp 256
    r1 = load 4 r1 0
    store 8 r1 sp 264
    r1 = load 8 sp 264
    r2 = load 8 sp 240
    r1 = add r1 r2 32
    store 8 r1 sp 272
    r1 = load 8 sp 272
    r2 = load 8 sp 256
    store 4 r1 r2 0
    br .for.inc22

  .for.inc22:
    r1 = load 8 sp 192
    r1 = add r1 1 32
    store 8 r1 sp 280
    r1 = load 8 sp 280
    store 8 r1 sp 200
    r1 = load 8 sp 200
    store 8 r1 sp 192
    br .for.cond14

  .for.end24:
    r1 = sub arg2 1 32
    store 8 r1 sp 288
    r1 = load 8 sp 288
    store 8 r1 sp 304
    r1 = load 8 sp 304
    store 8 r1 sp 296
    br .for.cond26

  .for.cond26:
    r1 = load 8 sp 296
    r1 = icmp sge r1 0 32
    store 8 r1 sp 312
    r1 = load 8 sp 312
    br r1 .for.body29 .for.end49

  .for.body29:
    r1 = load 8 sp 296
    r2 = and r1 2147483648 64
    r2 = sub 0 r2 64
    r1 = or r2 r1 64
    store 8 r1 sp 320
    r1 = mul arg1 1 64
    r2 = load 8 sp 320
    r2 = mul r2 4 64
    r1 = add r1 r2 64
    store 8 r1 sp 328
    r1 = load 8 sp 328
    r1 = load 4 r1 0
    store 8 r1 sp 336
    r1 = load 8 sp 296
    r2 = and r1 2147483648 64
    r2 = sub 0 r2 64
    r1 = or r2 r1 64
    store 8 r1 sp 344
    r1 = mul arg1 1 64
    r2 = load 8 sp 344
    r2 = mul r2 4 64
    r1 = add r1 r2 64
    store 8 r1 sp 352
    r1 = load 8 sp 352
    r1 = load 4 r1 0
    store 8 r1 sp 360
    r1 = load 8 sp 360
    r1 = sdiv r1 arg3 32
    store 8 r1 sp 368
    r1 = load 8 sp 368
    r1 = srem r1 10 32
    store 8 r1 sp 376
    r1 = load 8 sp 376
    r2 = and r1 2147483648 64
    r2 = sub 0 r2 64
    r1 = or r2 r1 64
    store 8 r1 sp 384
    r1 = load 8 sp 0
    r2 = load 8 sp 384
    r2 = mul r2 4 64
    r1 = add r1 r2 64
    store 8 r1 sp 392
    r1 = load 8 sp 392
    r1 = load 4 r1 0
    store 8 r1 sp 400
    r1 = load 8 sp 400
    r1 = sub r1 1 32
    store 8 r1 sp 408
    r1 = load 8 sp 408
    r2 = and r1 2147483648 64
    r2 = sub 0 r2 64
    r1 = or r2 r1 64
    store 8 r1 sp 416
    r1 = load 8 sp 32
    r2 = load 8 sp 416
    r2 = mul r2 4 64
    r1 = add r1 r2 64
    store 8 r1 sp 424
    r1 = load 8 sp 336
    r2 = load 8 sp 424
    store 4 r1 r2 0
    r1 = load 8 sp 296
    r2 = and r1 2147483648 64
    r2 = sub 0 r2 64
    r1 = or r2 r1 64
    store 8 r1 sp 432
    r1 = mul arg1 1 64
    r2 = load 8 sp 432
    r2 = mul r2 4 64
    r1 = add r1 r2 64
    store 8 r1 sp 440
    r1 = load 8 sp 440
    r1 = load 4 r1 0
    store 8 r1 sp 448
    r1 = load 8 sp 448
    r1 = sdiv r1 arg3 32
    store 8 r1 sp 456
    r1 = load 8 sp 456
    r1 = srem r1 10 32
    store 8 r1 sp 464
    r1 = load 8 sp 464
    r2 = and r1 2147483648 64
    r2 = sub 0 r2 64
    r1 = or r2 r1 64
    store 8 r1 sp 472
    r1 = load 8 sp 0
    r2 = load 8 sp 472
    r2 = mul r2 4 64
    r1 = add r1 r2 64
    store 8 r1 sp 480
    r1 = load 8 sp 480
    r1 = load 4 r1 0
    store 8 r1 sp 488
    r1 = load 8 sp 488
    r1 = add r1 4294967295 32
    store 8 r1 sp 496
    r1 = load 8 sp 496
    r2 = load 8 sp 480
    store 4 r1 r2 0
    br .for.inc47

  .for.inc47:
    r1 = load 8 sp 296
    r1 = add r1 4294967295 32
    store 8 r1 sp 504
    r1 = load 8 sp 504
    store 8 r1 sp 304
    r1 = load 8 sp 304
    store 8 r1 sp 296
    br .for.cond26

  .for.end49:
    store 8 0 sp 520
    r1 = load 8 sp 520
    store 8 r1 sp 512
    br .for.cond50

  .for.cond50:
    r1 = load 8 sp 512
    r1 = icmp slt r1 arg2 32
    store 8 r1 sp 528
    r1 = load 8 sp 528
    br r1 .for.body53 .for.end60

  .for.body53:
    r1 = load 8 sp 512
    r2 = and r1 2147483648 64
    r2 = sub 0 r2 64
    r1 = or r2 r1 64
    store 8 r1 sp 536
    r1 = load 8 sp 32
    r2 = load 8 sp 536
    r2 = mul r2 4 64
    r1 = add r1 r2 64
    store 8 r1 sp 544
    r1 = load 8 sp 544
    r1 = load 4 r1 0
    store 8 r1 sp 552
    r1 = load 8 sp 512
    r2 = and r1 2147483648 64
    r2 = sub 0 r2 64
    r1 = or r2 r1 64
    store 8 r1 sp 560
    r1 = mul arg1 1 64
    r2 = load 8 sp 560
    r2 = mul r2 4 64
    r1 = add r1 r2 64
    store 8 r1 sp 568
    r1 = load 8 sp 552
    r2 = load 8 sp 568
    store 4 r1 r2 0
    br .for.inc58

  .for.inc58:
    r1 = load 8 sp 512
    r1 = add r1 1 32
    store 8 r1 sp 576
    r1 = load 8 sp 576
    store 8 r1 sp 520
    r1 = load 8 sp 520
    store 8 r1 sp 512
    br .for.cond50

  .for.end60:
    r1 = load 8 sp 32
    store 8 r1 sp 584
    r1 = load 8 sp 584
    free r1
    ret 0
end countSort

; Function radixSort
start radixSort 2:
  .entry:
    ; init sp!
    sp = sub sp 48 64
    r1 = call getMax arg1 arg2
    store 8 r1 sp 0
    store 8 1 sp 16
    r1 = load 8 sp 16
    store 8 r1 sp 8
    br .for.cond

  .for.cond:
    r1 = load 8 sp 0
    r2 = load 8 sp 8
    r1 = sdiv r1 r2 32
    store 8 r1 sp 24
    r1 = load 8 sp 24
    r1 = icmp sgt r1 0 32
    store 8 r1 sp 32
    r1 = load 8 sp 32
    br r1 .for.body .for.cond.cleanup

  .for.cond.cleanup:
    br .for.end

  .for.body:
    r3 = load 8 sp 8
    call countSort arg1 arg2 r3
    br .for.inc

  .for.inc:
    r1 = load 8 sp 8
    r1 = mul r1 10 32
    store 8 r1 sp 40
    r1 = load 8 sp 40
    store 8 r1 sp 16
    r1 = load 8 sp 16
    store 8 r1 sp 8
    br .for.cond

  .for.end:
    ret 0
end radixSort

; Function main
start main 0:
  .entry:
    ; init sp!
    sp = sub sp 192 64
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
    r1 = and r1 4294967295 64
    store 8 r1 sp 104
    r1 = load 8 sp 24
    r2 = load 8 sp 104
    call radixSort r1 r2
    store 8 0 sp 120
    r1 = load 8 sp 120
    store 8 r1 sp 112
    br .for.cond7

  .for.cond7:
    r1 = load 8 sp 112
    r2 = and r1 2147483648 64
    r2 = sub 0 r2 64
    r1 = or r2 r1 64
    store 8 r1 sp 128
    r1 = load 8 sp 128
    r2 = load 8 sp 0
    r1 = icmp ult r1 r2 64
    store 8 r1 sp 136
    r1 = load 8 sp 136
    br r1 .for.body12 .for.cond.cleanup11

  .for.cond.cleanup11:
    br .for.end18

  .for.body12:
    r1 = load 8 sp 112
    r2 = and r1 2147483648 64
    r2 = sub 0 r2 64
    r1 = or r2 r1 64
    store 8 r1 sp 144
    r1 = load 8 sp 24
    r2 = load 8 sp 144
    r2 = mul r2 4 64
    r1 = add r1 r2 64
    store 8 r1 sp 152
    r1 = load 8 sp 152
    r1 = load 4 r1 0
    store 8 r1 sp 160
    r1 = load 8 sp 160
    r2 = and r1 2147483648 64
    r2 = sub 0 r2 64
    r1 = or r2 r1 64
    store 8 r1 sp 168
    r1 = load 8 sp 168
    call write r1
    br .for.inc16

  .for.inc16:
    r1 = load 8 sp 112
    r1 = add r1 1 32
    store 8 r1 sp 176
    r1 = load 8 sp 176
    store 8 r1 sp 120
    r1 = load 8 sp 120
    store 8 r1 sp 112
    br .for.cond7

  .for.end18:
    r1 = load 8 sp 24
    store 8 r1 sp 184
    r1 = load 8 sp 184
    free r1
    ret 0
end main
