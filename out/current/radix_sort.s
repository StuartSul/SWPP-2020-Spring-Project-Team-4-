
; Function malloc_upto_8
start malloc_upto_8 1:
  .entry:
    r13 = add arg1 7 64
    r14 = udiv r13 8 64
    r15 = mul r14 8 64
    r16 = malloc r15
    ret r16
end malloc_upto_8

; Function getMax
start getMax 2:
  .entry:
    ; init sp!
    sp = sub sp 8 64
    r9 = load 4 arg1 0
    store 8 1 sp 0
    r6 = mul r9 1 64
    br .for.cond

  .for.cond:
    r1 = load 8 sp 0
    r10 = icmp slt r1 arg2 32
    br r10 .for.body .for.end

  .for.body:
    r2 = udiv r1 2147483648 64
    r2 = mul r2 18446744071562067968 64
    r2 = or r2 r1 64
    r8 = mul arg1 1 64
    r3 = mul r2 4 64
    r8 = add r8 r3 64
    r11 = load 4 r8 0
    r12 = icmp sgt r11 r6 32
    r7 = mul r6 1 64
    br r12 .if.then .for.inc

  .for.end:
    ret r6

  .if.then:
    r13 = load 4 r8 0
    r7 = mul r13 1 64
    br .for.inc

  .for.inc:
    r14 = add r1 1 32
    store 8 r14 sp 0
    r6 = mul r7 1 64
    br .for.cond
end getMax

; Function countSort
start countSort 3:
  .entry:
    ; init sp!
    sp = sub sp 128 64
    r10 = add sp 88 64
    r1 = udiv arg2 2147483648 64
    r1 = mul r1 18446744071562067968 64
    r1 = or r1 arg2 64
    r1 = mul 4 r1 64
    r2 = call malloc_upto_8 r1
    store 8 r2 sp 0
    store 8 r2 sp 8
    r4 = mul r10 1 64
    store 8 r4 sp 16
    store 4 0 r4 0
    r14 = add r10 4 64
    store 4 0 r14 0
    r15 = add r10 8 64
    store 4 0 r15 0
    r16 = add r10 12 64
    store 4 0 r16 0
    r5 = add r10 16 64
    store 8 r5 sp 24
    store 4 0 r5 0
    r6 = add r10 20 64
    store 8 r6 sp 32
    store 4 0 r6 0
    r7 = add r10 24 64
    store 8 r7 sp 40
    store 4 0 r7 0
    r8 = add r10 28 64
    store 8 r8 sp 48
    store 4 0 r8 0
    r1 = add r10 32 64
    store 8 r1 sp 56
    store 4 0 r1 0
    r2 = add r10 36 64
    store 8 r2 sp 64
    store 4 0 r2 0
    store 8 0 sp 72
    br .for.cond2

  .for.cond2:
    r3 = load 8 sp 72
    r4 = icmp slt r3 arg2 32
    br r4 .for.body5 .for.body17

  .for.body5:
    r3 = load 8 sp 72
    r5 = udiv r3 2147483648 64
    r5 = mul r5 18446744071562067968 64
    r5 = or r5 r3 64
    r6 = mul arg1 1 64
    r7 = mul r5 4 64
    r6 = add r6 r7 64
    r6 = load 4 r6 0
    r6 = sdiv r6 arg3 32
    r6 = srem r6 10 32
    r7 = udiv r6 2147483648 64
    r7 = mul r7 18446744071562067968 64
    r7 = or r7 r6 64
    r8 = mul r7 4 64
    r12 = add r10 r8 64
    r8 = load 4 r12 0
    r8 = add r8 1 32
    store 4 r8 r12 0
    r1 = add r3 1 32
    store 8 r1 sp 72
    br .for.cond2

  .for.body17:
    r2 = load 8 sp 16
    r4 = load 4 r2 0
    r5 = load 4 r14 0
    r5 = add r5 r4 32
    store 4 r5 r14 0
    r6 = load 4 r15 0
    r6 = add r6 r5 32
    store 4 r6 r15 0
    r7 = load 4 r16 0
    r7 = add r7 r6 32
    store 4 r7 r16 0
    r8 = load 8 sp 24
    r3 = load 4 r8 0
    r3 = add r3 r7 32
    store 4 r3 r8 0
    r1 = load 8 sp 32
    r2 = load 4 r1 0
    r2 = add r2 r3 32
    store 4 r2 r1 0
    r4 = load 8 sp 40
    r5 = load 4 r4 0
    r5 = add r5 r2 32
    store 4 r5 r4 0
    r6 = load 8 sp 48
    r7 = load 4 r6 0
    r7 = add r7 r5 32
    store 4 r7 r6 0
    r8 = load 8 sp 56
    r3 = load 4 r8 0
    r3 = add r3 r7 32
    store 4 r3 r8 0
    r1 = load 8 sp 64
    r2 = load 4 r1 0
    r2 = add r2 r3 32
    store 4 r2 r1 0
    r4 = sub arg2 1 32
    r9 = mul r4 1 64
    br .for.cond26

  .for.cond26:
    r5 = icmp sge r9 0 32
    store 8 0 sp 80
    br r5 .for.body29 .for.cond50

  .for.body29:
    r6 = udiv r9 2147483648 64
    r6 = mul r6 18446744071562067968 64
    r6 = or r6 r9 64
    r11 = mul arg1 1 64
    r7 = mul r6 4 64
    r11 = add r11 r7 64
    r7 = load 4 r11 0
    r8 = load 4 r11 0
    r8 = sdiv r8 arg3 32
    r8 = srem r8 10 32
    r3 = udiv r8 2147483648 64
    r3 = mul r3 18446744071562067968 64
    r3 = or r3 r8 64
    r1 = mul r3 4 64
    r2 = add r10 r1 64
    r2 = load 4 r2 0
    r2 = sub r2 1 32
    r1 = udiv r2 2147483648 64
    r1 = mul r1 18446744071562067968 64
    r1 = or r1 r2 64
    r4 = load 8 sp 8
    r6 = mul r1 4 64
    r5 = add r4 r6 64
    store 4 r7 r5 0
    r6 = load 4 r11 0
    r6 = sdiv r6 arg3 32
    r6 = srem r6 10 32
    r8 = udiv r6 2147483648 64
    r8 = mul r8 18446744071562067968 64
    r8 = or r8 r6 64
    r3 = mul r8 4 64
    r13 = add r10 r3 64
    r3 = load 4 r13 0
    r3 = add r3 4294967295 32
    store 4 r3 r13 0
    r2 = add r9 4294967295 32
    r9 = mul r2 1 64
    br .for.cond26

  .for.cond50:
    r4 = load 8 sp 80
    r1 = icmp slt r4 arg2 32
    br r1 .for.body53 .for.end60

  .for.body53:
    r7 = udiv r4 2147483648 64
    r7 = mul r7 18446744071562067968 64
    r7 = or r7 r4 64
    r5 = load 8 sp 8
    r8 = mul r7 4 64
    r6 = add r5 r8 64
    r6 = load 4 r6 0
    r8 = mul arg1 1 64
    r3 = mul r7 4 64
    r8 = add r8 r3 64
    store 4 r6 r8 0
    r3 = add r4 1 32
    store 8 r3 sp 80
    br .for.cond50

  .for.end60:
    r2 = load 8 sp 0
    free r2
    ret 0
end countSort

; Function radixSort
start radixSort 2:
  .entry:
    ; init sp!
    sp = sub sp 16 64
    r12 = load 4 arg1 0
    store 8 1 sp 0
    r9 = mul r12 1 64
    br .for.cond.i

  .for.cond.i:
    r1 = load 8 sp 0
    r13 = icmp slt r1 arg2 32
    store 8 1 sp 8
    br r13 .for.body.i .for.cond

  .for.body.i:
    r2 = udiv r1 2147483648 64
    r2 = mul r2 18446744071562067968 64
    r2 = or r2 r1 64
    r11 = mul arg1 1 64
    r3 = mul r2 4 64
    r11 = add r11 r3 64
    r14 = load 4 r11 0
    r15 = icmp sgt r14 r9 32
    r10 = mul r9 1 64
    br r15 .if.then.i .if.end.i

  .for.cond:
    r4 = load 8 sp 8
    r16 = sdiv r9 r4 32
    r5 = icmp sgt r16 0 32
    br r5 .for.body .for.end

  .if.then.i:
    r6 = load 4 r11 0
    r10 = mul r6 1 64
    br .if.end.i

  .if.end.i:
    r7 = add r1 1 32
    store 8 r7 sp 0
    r9 = mul r10 1 64
    br .for.cond.i

  .for.body:
    call countSort arg1 arg2 r4
    r8 = mul r4 10 32
    store 8 r8 sp 8
    br .for.cond

  .for.end:
    ret 0
end radixSort

; Function main
start main 0:
  .entry:
    ; init sp!
    sp = sub sp 56 64
    r11 = call read
    r2 = mul 4 r11 64
    r2 = add r2 7 64
    r2 = udiv r2 8 64
    r2 = mul r2 8 64
    r3 = malloc r2
    store 8 r3 sp 0
    r4 = mul r3 1 64
    store 8 0 sp 8
    br .for.cond

  .for.cond:
    r5 = load 8 sp 8
    r6 = udiv r5 2147483648 64
    r6 = mul r6 18446744071562067968 64
    r6 = or r6 r5 64
    store 8 r6 sp 16
    r13 = icmp ult r6 r11 64
    br r13 .for.body .for.end

  .for.body:
    r14 = call read
    r7 = urem r14 4294967296 64
    r15 = mul r4 1 64
    r6 = load 8 sp 16
    r8 = mul r6 4 64
    r15 = add r15 r8 64
    reset heap
    store 4 r7 r15 0
    reset stack
    r5 = load 8 sp 8
    r16 = add r5 1 32
    store 8 r16 sp 8
    br .for.cond

  .for.end:
    r1 = urem r11 4294967296 64
    store 8 r1 sp 24
    reset heap
    r8 = load 4 r4 0
    reset stack
    store 8 1 sp 32
    r9 = mul r8 1 64
    br .for.cond.i.i

  .for.cond.i.i:
    r2 = load 8 sp 32
    r1 = load 8 sp 24
    r3 = icmp slt r2 r1 32
    store 8 1 sp 40
    br r3 .for.body.i.i .for.cond.i

  .for.body.i.i:
    r2 = load 8 sp 32
    r6 = udiv r2 2147483648 64
    r6 = mul r6 18446744071562067968 64
    r6 = or r6 r2 64
    r7 = mul r6 4 64
    r12 = add r4 r7 64
    reset heap
    r7 = load 4 r12 0
    r7 = icmp sgt r7 r9 32
    r10 = mul r9 1 64
    br r7 .if.then.i.i .if.end.i.i

  .for.cond.i:
    reset stack
    r5 = load 8 sp 40
    r8 = sdiv r9 r5 32
    r8 = icmp sgt r8 0 32
    store 8 0 sp 48
    br r8 .for.body.i .for.cond7

  .if.then.i.i:
    reset heap
    r1 = load 4 r12 0
    r10 = mul r1 1 64
    br .if.end.i.i

  .if.end.i.i:
    reset stack
    r2 = load 8 sp 32
    r3 = add r2 1 32
    store 8 r3 sp 32
    r9 = mul r10 1 64
    br .for.cond.i.i

  .for.body.i:
    r6 = load 8 sp 24
    r5 = load 8 sp 40
    call countSort r4 r6 r5
    r7 = mul r5 10 32
    store 8 r7 sp 40
    br .for.cond.i

  .for.cond7:
    r8 = load 8 sp 48
    r1 = udiv r8 2147483648 64
    r1 = mul r1 18446744071562067968 64
    r1 = or r1 r8 64
    r2 = icmp ult r1 r11 64
    br r2 .for.body12 .for.end18

  .for.body12:
    r6 = mul r1 4 64
    r3 = add r4 r6 64
    reset heap
    r3 = load 4 r3 0
    r6 = udiv r3 2147483648 64
    r6 = mul r6 18446744071562067968 64
    r6 = or r6 r3 64
    call write r6
    r5 = add r8 1 32
    reset stack
    store 8 r5 sp 48
    br .for.cond7

  .for.end18:
    r7 = load 8 sp 0
    free r7
    ret 0
end main
