
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

; Function swap
start swap 2:
  .entry:
    ; init sp!
    sp = sub sp 16 64
    r1 = load 4 arg1 0
    store 8 r1 sp 0
    r1 = load 4 arg2 0
    store 8 r1 sp 8
    r1 = load 8 sp 8
    store 4 r1 arg1 0
    r1 = load 8 sp 0
    store 4 r1 arg2 0
    ret 0
end swap

; Function partition
start partition 3:
  .entry:
    ; init sp!
    sp = sub sp 224 64
    r2 = and arg3 2147483648 64
    r2 = sub 0 r2 64
    r1 = or r2 arg3 64
    store 8 r1 sp 0
    r1 = mul arg1 1 64
    r2 = load 8 sp 0
    r2 = mul r2 4 64
    r1 = add r1 r2 64
    store 8 r1 sp 8
    r1 = load 8 sp 8
    r1 = load 4 r1 0
    store 8 r1 sp 16
    r1 = sub arg2 1 32
    store 8 r1 sp 24
    r1 = load 8 sp 24
    store 8 r1 sp 40
    store 8 arg2 sp 56
    r1 = load 8 sp 40
    store 8 r1 sp 32
    r1 = load 8 sp 56
    store 8 r1 sp 48
    br .for.cond

  .for.cond:
    r1 = sub arg3 1 32
    store 8 r1 sp 64
    r1 = load 8 sp 48
    r2 = load 8 sp 64
    r1 = icmp sle r1 r2 32
    store 8 r1 sp 72
    r1 = load 8 sp 72
    br r1 .for.body .for.cond.cleanup

  .for.cond.cleanup:
    br .for.end

  .for.body:
    r1 = load 8 sp 48
    r2 = and r1 2147483648 64
    r2 = sub 0 r2 64
    r1 = or r2 r1 64
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
    r2 = load 8 sp 16
    r1 = icmp slt r1 r2 32
    store 8 r1 sp 104
    r1 = load 8 sp 32
    store 8 r1 sp 160
    r1 = load 8 sp 160
    store 8 r1 sp 152
    r1 = load 8 sp 104
    br r1 .if.then .if.end

  .if.then:
    r1 = load 8 sp 32
    r1 = add r1 1 32
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
    r1 = load 8 sp 48
    r2 = and r1 2147483648 64
    r2 = sub 0 r2 64
    r1 = or r2 r1 64
    store 8 r1 sp 136
    r1 = mul arg1 1 64
    r2 = load 8 sp 136
    r2 = mul r2 4 64
    r1 = add r1 r2 64
    store 8 r1 sp 144
    r1 = load 8 sp 128
    r2 = load 8 sp 144
    call swap r1 r2
    r1 = load 8 sp 112
    store 8 r1 sp 160
    r1 = load 8 sp 160
    store 8 r1 sp 152
    br .if.end

  .if.end:
    br .for.inc

  .for.inc:
    r1 = load 8 sp 48
    r1 = add r1 1 32
    store 8 r1 sp 168
    r1 = load 8 sp 152
    store 8 r1 sp 40
    r1 = load 8 sp 168
    store 8 r1 sp 56
    r1 = load 8 sp 40
    store 8 r1 sp 32
    r1 = load 8 sp 56
    store 8 r1 sp 48
    br .for.cond

  .for.end:
    r1 = load 8 sp 32
    r1 = add r1 1 32
    store 8 r1 sp 176
    r1 = load 8 sp 176
    r2 = and r1 2147483648 64
    r2 = sub 0 r2 64
    r1 = or r2 r1 64
    store 8 r1 sp 184
    r1 = mul arg1 1 64
    r2 = load 8 sp 184
    r2 = mul r2 4 64
    r1 = add r1 r2 64
    store 8 r1 sp 192
    r2 = and arg3 2147483648 64
    r2 = sub 0 r2 64
    r1 = or r2 arg3 64
    store 8 r1 sp 200
    r1 = mul arg1 1 64
    r2 = load 8 sp 200
    r2 = mul r2 4 64
    r1 = add r1 r2 64
    store 8 r1 sp 208
    r1 = load 8 sp 192
    r2 = load 8 sp 208
    call swap r1 r2
    r1 = load 8 sp 32
    r1 = add r1 1 32
    store 8 r1 sp 216
    r1 = load 8 sp 216
    ret r1
end partition

; Function quickSort
start quickSort 3:
  .entry:
    ; init sp!
    sp = sub sp 32 64
    r1 = icmp slt arg2 arg3 32
    store 8 r1 sp 0
    r1 = load 8 sp 0
    br r1 .if.then .if.end

  .if.then:
    r1 = call partition arg1 arg2 arg3
    store 8 r1 sp 8
    r1 = load 8 sp 8
    r1 = sub r1 1 32
    store 8 r1 sp 16
    r3 = load 8 sp 16
    call quickSort arg1 arg2 r3
    r1 = load 8 sp 8
    r1 = add r1 1 32
    store 8 r1 sp 24
    r2 = load 8 sp 24
    call quickSort arg1 r2 arg3
    br .if.end

  .if.end:
    ret 0
end quickSort

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
    call quickSort r1 0 r3
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
