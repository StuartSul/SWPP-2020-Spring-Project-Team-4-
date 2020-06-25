
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
    sp = sub sp 48 64
    r9 = add sp 40 64
    r2 = load 4 20480 0
    r5 = udiv r2 2147483648 64
    r5 = mul r5 18446744071562067968 64
    r5 = or r5 r2 64
    store 8 0 sp 0
    br .while.cond

  .while.cond:
    r7 = load 8 sp 0
    r3 = urem r7 4294967296 64
    r12 = shl 1 r3 32
    r1 = udiv r12 2147483648 64
    r1 = mul r1 18446744071562067968 64
    r1 = or r1 r12 64
    r13 = icmp sle r1 r5 64
    br r13 .while.body .while.end

  .while.body:
    r14 = add r7 1 64
    store 8 r14 sp 0
    br .while.cond

  .while.end:
    store 4 r3 20488 0
    r8 = udiv r3 2147483648 64
    r8 = mul r8 18446744071562067968 64
    r8 = or r8 r3 64
    r8 = mul 8 r8 64
    r4 = call malloc_upto_8 r8
    r6 = mul r4 1 64
    store 8 r6 20496 0
    r2 = load 8 20504 0
    store 8 r2 r6 0
    store 8 1 sp 8
    br .while.cond5

  .while.cond5:
    r5 = load 8 sp 8
    r7 = urem r5 4294967296 64
    r15 = shl 1 r7 32
    r3 = udiv r15 2147483648 64
    r3 = mul r3 18446744071562067968 64
    r3 = or r3 r15 64
    r16 = load 4 20480 0
    r1 = udiv r16 2147483648 64
    r1 = mul r1 18446744071562067968 64
    r1 = or r1 r16 64
    r3 = icmp sle r3 r1 64
    br r3 .codeRepl .while.end36

  .codeRepl:
    r5 = load 8 sp 8
    call initA.while.body12 r5 r9
    r10 = load 4 r9 0
    r5 = load 8 sp 8
    r11 = sub r5 1 64
    r8 = sdiv r10 2 32
    store 8 r8 sp 16
    store 8 0 sp 24
    br .for.cond

  .while.end36:
    ret 0

  .for.cond:
    r4 = load 8 sp 24
    r6 = load 4 20480 0
    r6 = sub r6 r10 32
    r6 = icmp sle r4 r6 32
    br r6 .for.body .for.cond.cleanup

  .for.body:
    r2 = load 8 20496 0
    r5 = mul r11 8 64
    r2 = add r2 r5 64
    r2 = load 8 r2 0
    r4 = load 8 sp 24
    r5 = udiv r4 2147483648 64
    r5 = mul r5 18446744071562067968 64
    r4 = load 8 sp 24
    r5 = or r5 r4 64
    store 8 r5 sp 32
    r7 = mul r5 4 64
    r2 = add r2 r7 64
    r2 = load 4 r2 0
    r7 = load 8 20496 0
    r1 = mul r11 8 64
    r7 = add r7 r1 64
    r7 = load 8 r7 0
    r4 = load 8 sp 24
    r8 = load 8 sp 16
    r1 = add r4 r8 32
    r3 = udiv r1 2147483648 64
    r3 = mul r3 18446744071562067968 64
    r3 = or r3 r1 64
    r8 = mul r3 4 64
    r7 = add r7 r8 64
    r7 = load 4 r7 0
    r8 = call min r2 r7
    r4 = load 8 20496 0
    r6 = load 8 sp 8
    r5 = mul r6 8 64
    r4 = add r4 r5 64
    r4 = load 8 r4 0
    r5 = load 8 sp 32
    r2 = mul r5 4 64
    r4 = add r4 r2 64
    store 4 r8 r4 0
    r2 = load 8 sp 24
    r1 = add r2 1 32
    store 8 r1 sp 24
    br .for.cond

  .for.cond.cleanup:
    r6 = load 8 sp 8
    r3 = add r6 1 64
    store 8 r3 sp 8
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
    r3 = load 8 sp 8
    r9 = icmp sge r3 0 32
    br r9 .for.body .for.end

  .for.body:
    r10 = shl 1 r3 32
    r11 = and arg1 r10 32
    r12 = icmp ne r11 0 32
    br r12 .for.end .if.end

  .for.end:
    ret r1

  .if.end:
    r13 = add r1 1 32
    r14 = add r3 4294967295 32
    store 8 r13 sp 0
    store 8 r14 sp 8
    br .for.cond
end count_leading_zeros

; Function main
start main 0:
  .entry:
    ; init sp!
    sp = sub sp 16 64
    r1 = malloc 8
    r1 = malloc 8
    r1 = malloc 8
    r1 = malloc 8
    r1 = call read
    r1 = urem r1 4294967296 64
    store 4 r1 20480 0
    r7 = udiv r1 2147483648 64
    r7 = mul r7 18446744071562067968 64
    r7 = or r7 r1 64
    r7 = mul 4 r7 64
    r5 = call malloc_upto_8 r7
    store 8 r5 20504 0
    store 8 0 sp 0
    br .for.cond

  .for.cond:
    r6 = load 8 sp 0
    r11 = load 4 20480 0
    r12 = icmp slt r6 r11 32
    br r12 .for.body .for.end

  .for.body:
    r13 = call read
    r4 = urem r13 4294967296 64
    r14 = load 8 20504 0
    r3 = udiv r6 2147483648 64
    r3 = mul r3 18446744071562067968 64
    r3 = or r3 r6 64
    r8 = mul r3 4 64
    r15 = add r14 r8 64
    store 4 r4 r15 0
    r16 = add r6 1 32
    store 8 r16 sp 0
    br .for.cond

  .for.end:
    call initA
    r8 = call read
    r8 = urem r8 4294967296 64
    r9 = mul r8 1 64
    br .while.cond

  .while.cond:
    r1 = add r9 4294967295 32
    store 8 r1 sp 8
    r5 = icmp ne r9 0 32
    br r5 .while.body .while.end

  .while.body:
    r2 = call read
    r2 = urem r2 4294967296 64
    r7 = call read
    r7 = urem r7 4294967296 64
    r6 = sub r7 r2 32
    r6 = add r6 1 32
    r4 = call count_leading_zeros r6
    r4 = sub 32 r4 32
    r3 = load 8 20496 0
    r10 = sub r4 1 32
    r8 = udiv r10 2147483648 64
    r8 = mul r8 18446744071562067968 64
    r8 = or r8 r10 64
    r1 = mul r8 8 64
    r3 = add r3 r1 64
    r3 = load 8 r3 0
    r1 = udiv r2 2147483648 64
    r1 = mul r1 18446744071562067968 64
    r1 = or r1 r2 64
    r5 = mul r1 4 64
    r3 = add r3 r5 64
    r3 = load 4 r3 0
    r5 = load 8 20496 0
    r2 = mul r8 8 64
    r5 = add r5 r2 64
    r5 = load 8 r5 0
    r2 = shl 1 r10 32
    r2 = sub r7 r2 32
    r2 = add r2 1 32
    r7 = udiv r2 2147483648 64
    r7 = mul r7 18446744071562067968 64
    r7 = or r7 r2 64
    r6 = mul r7 4 64
    r5 = add r5 r6 64
    r5 = load 4 r5 0
    r6 = call min r3 r5
    r4 = udiv r6 2147483648 64
    r4 = mul r4 18446744071562067968 64
    r4 = or r4 r6 64
    call write r4
    r8 = load 8 sp 8
    r9 = mul r8 1 64
    br .while.cond

  .while.end:
    ret 0
end main

; Function initA.while.body12
start initA.while.body12 2:
  .newFuncRoot:
    r1 = urem arg1 4294967296 64
    r6 = shl 1 r1 32
    store 4 r6 arg2 0
    r7 = load 4 20480 0
    r8 = sub r7 r6 32
    r9 = add r8 1 32
    r4 = udiv r9 2147483648 64
    r4 = mul r4 18446744071562067968 64
    r4 = or r4 r9 64
    r10 = mul 4 r4 64
    r11 = call malloc_upto_8 r10
    r2 = mul r11 1 64
    r12 = load 8 20496 0
    r3 = mul arg1 8 64
    r13 = add r12 r3 64
    store 8 r2 r13 0
    ret 0
end initA.while.body12
