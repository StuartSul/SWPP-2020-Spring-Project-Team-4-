
; Function malloc_upto_8
start malloc_upto_8 1:
  .entry:
    r13 = add arg1 7 64
    r14 = udiv r13 8 64
    r15 = mul r14 8 64
    r16 = malloc r15
    ret r16
end malloc_upto_8

; Function min
start min 2:
  .entry:
    r15 = icmp slt arg1 arg2 32
    r16 = select r15 arg1 arg2
    ret r16
end min

; Function initA
start initA 0:
  .entry:
    ; init sp!
    sp = sub sp 72 64
    r1 = load 4 20480 0
    r2 = udiv r1 2147483648 64
    r2 = mul r2 18446744071562067968 64
    r2 = or r2 r1 64
    reset stack
    store 8 r2 sp 0
    store 8 0 sp 8
    br .while.cond

  .while.cond:
    r3 = load 8 sp 8
    r4 = urem r3 4294967296 64
    store 8 r4 sp 16
    r16 = shl 1 r4 32
    r5 = udiv r16 2147483648 64
    r5 = mul r5 18446744071562067968 64
    r5 = or r5 r16 64
    r2 = load 8 sp 0
    r5 = icmp sle r5 r2 64
    br r5 .while.body .while.end

  .while.body:
    r3 = load 8 sp 8
    r6 = add r3 1 64
    store 8 r6 sp 8
    br .while.cond

  .while.end:
    r4 = load 8 sp 16
    reset heap
    store 4 r4 20488 0
    r7 = udiv r4 2147483648 64
    r7 = mul r7 18446744071562067968 64
    r7 = or r7 r4 64
    r7 = mul 8 r7 64
    r7 = add r7 7 64
    r7 = udiv r7 8 64
    r7 = mul r7 8 64
    r8 = malloc r7
    r1 = mul r8 1 64
    reset stack
    store 8 r1 sp 24
    reset heap
    store 8 r1 20496 0
    r2 = load 8 20504 0
    store 8 r2 r1 0
    r15 = load 4 20480 0
    r5 = udiv r15 2147483648 64
    r5 = mul r5 18446744071562067968 64
    r5 = or r5 r15 64
    reset stack
    store 8 r5 sp 32
    store 8 1 sp 40
    br .while.cond5

  .while.cond5:
    r3 = load 8 sp 40
    r6 = urem r3 4294967296 64
    r9 = shl 1 r6 32
    r4 = udiv r9 2147483648 64
    r4 = mul r4 18446744071562067968 64
    r4 = or r4 r9 64
    r5 = load 8 sp 32
    r4 = icmp sle r4 r5 64
    br r4 .while.body12 .while.end36

  .while.body12:
    r10 = sub r15 r9 32
    r7 = add r10 1 32
    r8 = udiv r7 2147483648 64
    r8 = mul r8 18446744071562067968 64
    r8 = or r8 r7 64
    r8 = mul 4 r8 64
    r8 = add r8 7 64
    r8 = udiv r8 8 64
    r8 = mul r8 8 64
    r2 = malloc r8
    r1 = mul r2 1 64
    r3 = load 8 sp 24
    r11 = mul r3 1 64
    r6 = load 8 sp 40
    r5 = mul r6 8 64
    r11 = add r11 r5 64
    store 8 r1 r11 0
    r5 = sub r6 1 64
    r4 = mul r5 8 64
    r12 = add r3 r4 64
    r4 = sdiv r9 2 32
    store 8 r4 sp 48
    store 8 0 sp 56
    br .for.cond

  .while.end36:
    ret 0

  .for.cond:
    r7 = load 8 sp 56
    r8 = icmp sle r7 r10 32
    br r8 .for.body .for.end

  .for.body:
    r2 = load 8 r12 0
    r7 = load 8 sp 56
    r1 = udiv r7 2147483648 64
    r1 = mul r1 18446744071562067968 64
    r1 = or r1 r7 64
    store 8 r1 sp 64
    r6 = mul r1 4 64
    r2 = add r2 r6 64
    r13 = load 4 r2 0
    r6 = load 8 r12 0
    r4 = load 8 sp 48
    r3 = add r7 r4 32
    r5 = udiv r3 2147483648 64
    r5 = mul r5 18446744071562067968 64
    r5 = or r5 r3 64
    r8 = mul r5 4 64
    r6 = add r6 r8 64
    r14 = load 4 r6 0
    r8 = icmp slt r13 r14 32
    r8 = select r8 r13 r14
    r1 = load 8 r11 0
    r2 = load 8 sp 64
    r7 = mul r2 4 64
    r1 = add r1 r7 64
    store 4 r8 r1 0
    r7 = load 8 sp 56
    r4 = add r7 1 32
    store 8 r4 sp 56
    br .for.cond

  .for.end:
    r3 = load 8 sp 40
    r5 = add r3 1 64
    store 8 r5 sp 40
    br .while.cond5
end initA

; Function count_leading_zeros
start count_leading_zeros 1:
  .entry:
    ; init sp!
    sp = sub sp 16 64
    store 8 0 sp 0
    store 8 31 sp 8
    br .for.cond

  .for.cond:
    r1 = load 8 sp 0
    r2 = load 8 sp 8
    r9 = icmp sge r2 0 32
    br r9 .for.body .for.end

  .for.body:
    r10 = shl 1 r2 32
    r11 = and arg1 r10 32
    r12 = icmp ne r11 0 32
    br r12 .for.end .if.end

  .for.end:
    ret r1

  .if.end:
    r13 = add r1 1 32
    r14 = add r2 4294967295 32
    store 8 r13 sp 0
    store 8 r14 sp 8
    br .for.cond
end count_leading_zeros

; Function main
start main 0:
  .entry:
    ; init sp!
    sp = sub sp 72 64
    r1 = malloc 8
    r1 = malloc 8
    r1 = malloc 8
    r1 = malloc 8
    r2 = call read
    r2 = urem r2 4294967296 64
    store 8 r2 sp 0
    reset heap
    store 4 r2 20480 0
    r3 = udiv r2 2147483648 64
    r3 = mul r3 18446744071562067968 64
    r3 = or r3 r2 64
    r3 = mul 4 r3 64
    r3 = add r3 7 64
    r3 = udiv r3 8 64
    r3 = mul r3 8 64
    r4 = malloc r3
    r5 = mul r4 1 64
    reset stack
    store 8 r5 sp 8
    reset heap
    store 8 r5 20504 0
    reset stack
    store 8 0 sp 16
    br .for.cond

  .for.cond:
    r6 = load 8 sp 16
    r2 = load 8 sp 0
    r12 = icmp slt r6 r2 32
    br r12 .for.body .for.end

  .for.body:
    r13 = call read
    r7 = urem r13 4294967296 64
    r6 = load 8 sp 16
    r8 = udiv r6 2147483648 64
    r8 = mul r8 18446744071562067968 64
    r8 = or r8 r6 64
    r5 = load 8 sp 8
    r1 = mul r8 4 64
    r14 = add r5 r1 64
    store 4 r7 r14 0
    r15 = add r6 1 32
    store 8 r15 sp 16
    br .for.cond

  .for.end:
    call initA
    r1 = call read
    r1 = urem r1 4294967296 64
    reset heap
    r16 = load 8 20496 0
    r9 = mul r1 1 64
    br .while.cond

  .while.cond:
    r3 = add r9 4294967295 32
    reset stack
    store 8 r3 sp 24
    r4 = icmp ne r9 0 32
    br r4 .while.body .while.end

  .while.body:
    r2 = call read
    r2 = urem r2 4294967296 64
    store 8 r2 sp 32
    r5 = call read
    r5 = urem r5 4294967296 64
    store 8 r5 sp 40
    r8 = sub r5 r2 32
    r8 = add r8 1 32
    store 8 r8 sp 48
    store 8 0 sp 56
    store 8 31 sp 64
    br .for.cond.i

  .while.end:
    ret 0

  .for.cond.i:
    r6 = load 8 sp 64
    r1 = icmp sge r6 0 32
    br r1 .for.body.i .count_leading_zeros.exit

  .for.body.i:
    r6 = load 8 sp 64
    r3 = shl 1 r6 32
    r8 = load 8 sp 48
    r3 = and r8 r3 32
    r3 = icmp ne r3 0 32
    br r3 .count_leading_zeros.exit .if.end.i

  .count_leading_zeros.exit:
    r7 = load 8 sp 56
    r4 = sub 32 r7 32
    r10 = sub r4 1 32
    r5 = udiv r10 2147483648 64
    r5 = mul r5 18446744071562067968 64
    r5 = or r5 r10 64
    r2 = mul r5 8 64
    r11 = add r16 r2 64
    r2 = load 8 r11 0
    r1 = load 8 sp 32
    r6 = udiv r1 2147483648 64
    r6 = mul r6 18446744071562067968 64
    r6 = or r6 r1 64
    r8 = mul r6 4 64
    r2 = add r2 r8 64
    r2 = load 4 r2 0
    r8 = load 8 r11 0
    r3 = shl 1 r10 32
    r7 = load 8 sp 40
    r3 = sub r7 r3 32
    r3 = add r3 1 32
    r4 = udiv r3 2147483648 64
    r4 = mul r4 18446744071562067968 64
    r4 = or r4 r3 64
    r5 = mul r4 4 64
    r8 = add r8 r5 64
    r8 = load 4 r8 0
    r5 = call min r2 r8
    r1 = udiv r5 2147483648 64
    r1 = mul r1 18446744071562067968 64
    r1 = or r1 r5 64
    call write r1
    r6 = load 8 sp 24
    r9 = mul r6 1 64
    br .while.cond

  .if.end.i:
    r7 = load 8 sp 56
    r3 = add r7 1 32
    r4 = load 8 sp 64
    r2 = add r4 4294967295 32
    store 8 r3 sp 56
    store 8 r2 sp 64
    br .for.cond.i
end main
