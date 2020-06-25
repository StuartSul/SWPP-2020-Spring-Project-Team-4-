
; Function area
start area 2:
  .entry:
    ; init sp!
    sp = sub sp 328 64
    store 8 0 sp 8
    store 8 0 sp 24
    store 8 0 sp 40
    r1 = load 8 sp 8
    store 8 r1 sp 0
    r1 = load 8 sp 24
    store 8 r1 sp 16
    r1 = load 8 sp 40
    store 8 r1 sp 32
    br .for.cond

  .for.cond:
    r1 = load 8 sp 0
    r1 = icmp ult r1 arg2 32
    store 8 r1 sp 48
    r1 = load 8 sp 48
    br r1 .for.body .for.cond.cleanup

  .for.cond.cleanup:
    br .for.end

  .for.body:
    r1 = load 8 sp 0
    r1 = add r1 1 32
    store 8 r1 sp 56
    r1 = load 8 sp 56
    r1 = urem r1 arg2 32
    store 8 r1 sp 64
    r1 = load 8 sp 0
    r1 = mul r1 2 32
    store 8 r1 sp 72
    r1 = load 8 sp 72
    store 8 r1 sp 80
    r1 = mul arg1 1 64
    r2 = load 8 sp 80
    r2 = mul r2 4 64
    r1 = add r1 r2 64
    store 8 r1 sp 88
    r1 = load 8 sp 88
    r1 = load 4 r1 0
    store 8 r1 sp 96
    r1 = load 8 sp 96
    store 8 r1 sp 104
    r1 = load 8 sp 0
    r1 = mul r1 2 32
    store 8 r1 sp 112
    r1 = load 8 sp 112
    r1 = add r1 1 32
    store 8 r1 sp 120
    r1 = load 8 sp 120
    store 8 r1 sp 128
    r1 = mul arg1 1 64
    r2 = load 8 sp 128
    r2 = mul r2 4 64
    r1 = add r1 r2 64
    store 8 r1 sp 136
    r1 = load 8 sp 136
    r1 = load 4 r1 0
    store 8 r1 sp 144
    r1 = load 8 sp 144
    store 8 r1 sp 152
    r1 = load 8 sp 64
    r1 = mul r1 2 32
    store 8 r1 sp 160
    r1 = load 8 sp 160
    store 8 r1 sp 168
    r1 = mul arg1 1 64
    r2 = load 8 sp 168
    r2 = mul r2 4 64
    r1 = add r1 r2 64
    store 8 r1 sp 176
    r1 = load 8 sp 176
    r1 = load 4 r1 0
    store 8 r1 sp 184
    r1 = load 8 sp 184
    store 8 r1 sp 192
    r1 = load 8 sp 64
    r1 = mul r1 2 32
    store 8 r1 sp 200
    r1 = load 8 sp 200
    r1 = add r1 1 32
    store 8 r1 sp 208
    r1 = load 8 sp 208
    store 8 r1 sp 216
    r1 = mul arg1 1 64
    r2 = load 8 sp 216
    r2 = mul r2 4 64
    r1 = add r1 r2 64
    store 8 r1 sp 224
    r1 = load 8 sp 224
    r1 = load 4 r1 0
    store 8 r1 sp 232
    r1 = load 8 sp 232
    store 8 r1 sp 240
    r1 = load 8 sp 104
    r2 = load 8 sp 240
    r1 = mul r1 r2 64
    store 8 r1 sp 248
    r1 = load 8 sp 152
    r2 = load 8 sp 192
    r1 = mul r1 r2 64
    store 8 r1 sp 256
    r1 = load 8 sp 248
    r2 = load 8 sp 256
    r1 = sub r1 r2 64
    store 8 r1 sp 264
    r1 = load 8 sp 264
    r1 = sdiv r1 2 64
    store 8 r1 sp 272
    r1 = load 8 sp 32
    r2 = load 8 sp 272
    r1 = add r1 r2 64
    store 8 r1 sp 280
    r1 = load 8 sp 264
    r1 = srem r1 2 64
    store 8 r1 sp 288
    r1 = load 8 sp 16
    r2 = load 8 sp 288
    r1 = add r1 r2 64
    store 8 r1 sp 296
    br .for.inc

  .for.inc:
    r1 = load 8 sp 0
    r1 = add r1 1 32
    store 8 r1 sp 304
    r1 = load 8 sp 304
    store 8 r1 sp 8
    r1 = load 8 sp 296
    store 8 r1 sp 24
    r1 = load 8 sp 280
    store 8 r1 sp 40
    r1 = load 8 sp 8
    store 8 r1 sp 0
    r1 = load 8 sp 24
    store 8 r1 sp 16
    r1 = load 8 sp 40
    store 8 r1 sp 32
    br .for.cond

  .for.end:
    r1 = load 8 sp 16
    r1 = sdiv r1 2 64
    store 8 r1 sp 312
    r1 = load 8 sp 32
    r2 = load 8 sp 312
    r1 = add r1 r2 64
    store 8 r1 sp 320
    r1 = load 8 sp 320
    ret r1
end area

; Function main
start main 0:
  .entry:
    ; init sp!
    sp = sub sp 144 64
    r1 = call read
    store 8 r1 sp 0
    r1 = load 8 sp 0
    r1 = icmp eq r1 0 64
    store 8 r1 sp 8
    r1 = load 8 sp 8
    br r1 .if.then .if.end

  .if.then:
    call write 0
    br .cleanup

  .if.end:
    r2 = load 8 sp 0
    r1 = mul 8 r2 64
    store 8 r1 sp 16
    r1 = load 8 sp 16
    r1 = malloc r1
    store 8 r1 sp 24
    r1 = load 8 sp 24
    store 8 r1 sp 32
    store 8 0 sp 48
    r1 = load 8 sp 48
    store 8 r1 sp 40
    br .for.cond

  .for.cond:
    r1 = load 8 sp 40
    r2 = and r1 2147483648 64
    r2 = sub 0 r2 64
    r1 = or r2 r1 64
    store 8 r1 sp 56
    r2 = load 8 sp 0
    r1 = mul 2 r2 64
    store 8 r1 sp 64
    r1 = load 8 sp 56
    r2 = load 8 sp 64
    r1 = icmp ult r1 r2 64
    store 8 r1 sp 72
    r1 = load 8 sp 72
    br r1 .for.body .for.cond.cleanup

  .for.cond.cleanup:
    br .for.end

  .for.body:
    r1 = call read
    store 8 r1 sp 80
    r1 = load 8 sp 80
    r1 = and r1 4294967295 64
    store 8 r1 sp 88
    r1 = load 8 sp 40
    r2 = and r1 2147483648 64
    r2 = sub 0 r2 64
    r1 = or r2 r1 64
    store 8 r1 sp 96
    r1 = load 8 sp 32
    r2 = load 8 sp 96
    r2 = mul r2 4 64
    r1 = add r1 r2 64
    store 8 r1 sp 104
    r1 = load 8 sp 88
    r2 = load 8 sp 104
    store 4 r1 r2 0
    br .for.inc

  .for.inc:
    r1 = load 8 sp 40
    r1 = add r1 1 32
    store 8 r1 sp 112
    r1 = load 8 sp 112
    store 8 r1 sp 48
    r1 = load 8 sp 48
    store 8 r1 sp 40
    br .for.cond

  .for.end:
    r1 = load 8 sp 0
    r1 = and r1 4294967295 64
    store 8 r1 sp 120
    r1 = load 8 sp 32
    r2 = load 8 sp 120
    r1 = call area r1 r2
    store 8 r1 sp 128
    r1 = load 8 sp 128
    call write r1
    r1 = load 8 sp 32
    store 8 r1 sp 136
    r1 = load 8 sp 136
    free r1
    br .cleanup

  .cleanup:
    ret 0
end main
