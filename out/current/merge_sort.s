
; Function malloc_upto_8
start malloc_upto_8 1:
  .entry:
    r13 = add arg1 7 64
    r14 = udiv r13 8 64
    r15 = mul r14 8 64
    r16 = malloc r15
    ret r16
end malloc_upto_8

; Function merge
start merge 4:
  .entry:
    ; init sp!
    sp = sub sp 96 64
    r1 = sub arg3 arg2 32
    r16 = add r1 1 32
    r2 = sub arg4 arg3 32
    store 8 r2 sp 0
    r3 = udiv r16 2147483648 64
    r3 = mul r3 18446744071562067968 64
    r3 = or r3 r16 64
    r3 = mul 4 r3 64
    r3 = add r3 7 64
    r3 = udiv r3 8 64
    r3 = mul r3 8 64
    r4 = malloc r3
    store 8 r4 sp 8
    store 8 r4 sp 16
    r6 = udiv r2 2147483648 64
    r6 = mul r6 18446744071562067968 64
    r6 = or r6 r2 64
    r6 = mul 4 r6 64
    r6 = add r6 7 64
    r6 = udiv r6 8 64
    r6 = mul r6 8 64
    r7 = malloc r6
    store 8 r7 sp 24
    store 8 r7 sp 32
    store 8 0 sp 40
    br .for.cond

  .for.cond:
    r1 = load 8 sp 40
    r3 = icmp slt r1 r16 32
    br r3 .for.body .for.cond9.preheader

  .for.body:
    r1 = load 8 sp 40
    r4 = add arg2 r1 32
    r5 = udiv r4 2147483648 64
    r5 = mul r5 18446744071562067968 64
    r5 = or r5 r4 64
    r2 = mul arg1 1 64
    r6 = mul r5 4 64
    r2 = add r2 r6 64
    r2 = load 4 r2 0
    r6 = udiv r1 2147483648 64
    r6 = mul r6 18446744071562067968 64
    r6 = or r6 r1 64
    r7 = load 8 sp 16
    r3 = mul r6 4 64
    r8 = add r7 r3 64
    store 4 r2 r8 0
    r3 = add r1 1 32
    store 8 r3 sp 40
    br .for.cond

  .for.cond9.preheader:
    r4 = add arg3 1 32
    store 8 r4 sp 48
    store 8 0 sp 56
    br .for.cond9

  .for.cond9:
    r5 = load 8 sp 56
    r7 = load 8 sp 0
    r6 = icmp slt r5 r7 32
    store 8 0 sp 64
    store 8 0 sp 72
    r9 = mul arg2 1 64
    br r6 .for.body12 .while.cond

  .for.body12:
    r4 = load 8 sp 48
    r5 = load 8 sp 56
    r2 = add r4 r5 32
    r8 = udiv r2 2147483648 64
    r8 = mul r8 18446744071562067968 64
    r8 = or r8 r2 64
    r1 = mul arg1 1 64
    r3 = mul r8 4 64
    r1 = add r1 r3 64
    r1 = load 4 r1 0
    r3 = udiv r5 2147483648 64
    r3 = mul r3 18446744071562067968 64
    r3 = or r3 r5 64
    r7 = load 8 sp 32
    r4 = mul r3 4 64
    r6 = add r7 r4 64
    store 4 r1 r6 0
    r4 = add r5 1 32
    store 8 r4 sp 56
    br .for.cond9

  .while.cond:
    r2 = load 8 sp 64
    r8 = load 8 sp 72
    r7 = icmp slt r8 r16 32
    r3 = load 8 sp 0
    r1 = icmp slt r2 r3 32
    r7 = select r7 r1 0
    r10 = mul r9 1 64
    r11 = mul r8 1 64
    br r7 .while.body .while.cond43

  .while.body:
    r8 = load 8 sp 72
    r6 = udiv r8 2147483648 64
    r6 = mul r6 18446744071562067968 64
    r6 = or r6 r8 64
    r5 = load 8 sp 16
    r2 = mul r6 4 64
    r4 = add r5 r2 64
    store 8 r4 sp 80
    r2 = load 4 r4 0
    r3 = load 8 sp 64
    r1 = udiv r3 2147483648 64
    r1 = mul r1 18446744071562067968 64
    r1 = or r1 r3 64
    r7 = load 8 sp 32
    r5 = mul r1 4 64
    r8 = add r7 r5 64
    store 8 r8 sp 88
    r5 = load 4 r8 0
    r2 = icmp sle r2 r5 32
    br r2 .if.then .if.else

  .while.cond43:
    r6 = icmp slt r11 r16 32
    r13 = mul r10 1 64
    r3 = load 8 sp 64
    r12 = mul r3 1 64
    br r6 .while.body46 .while.cond54

  .if.then:
    r4 = load 8 sp 80
    r7 = load 4 r4 0
    r1 = udiv r9 2147483648 64
    r1 = mul r1 18446744071562067968 64
    r1 = or r1 r9 64
    r8 = mul arg1 1 64
    r5 = mul r1 4 64
    r8 = add r8 r5 64
    store 4 r7 r8 0
    r5 = load 8 sp 72
    r2 = add r5 1 32
    r3 = load 8 sp 64
    r14 = mul r3 1 64
    r15 = mul r2 1 64
    br .if.end

  .if.else:
    r6 = load 8 sp 88
    r4 = load 4 r6 0
    r1 = udiv r9 2147483648 64
    r1 = mul r1 18446744071562067968 64
    r1 = or r1 r9 64
    r7 = mul arg1 1 64
    r8 = mul r1 4 64
    r7 = add r7 r8 64
    store 4 r4 r7 0
    r3 = load 8 sp 64
    r8 = add r3 1 32
    r14 = mul r8 1 64
    r5 = load 8 sp 72
    r15 = mul r5 1 64
    br .if.end

  .while.body46:
    r2 = udiv r11 2147483648 64
    r2 = mul r2 18446744071562067968 64
    r2 = or r2 r11 64
    r6 = load 8 sp 16
    r4 = mul r2 4 64
    r1 = add r6 r4 64
    r1 = load 4 r1 0
    r4 = udiv r10 2147483648 64
    r4 = mul r4 18446744071562067968 64
    r4 = or r4 r10 64
    r7 = mul arg1 1 64
    r3 = mul r4 4 64
    r7 = add r7 r3 64
    store 4 r1 r7 0
    r3 = add r11 1 32
    r8 = add r10 1 32
    r10 = mul r8 1 64
    r11 = mul r3 1 64
    br .while.cond43

  .while.cond54:
    r5 = load 8 sp 0
    r6 = icmp slt r12 r5 32
    br r6 .while.body57 .while.end64

  .if.end:
    r2 = add r9 1 32
    store 8 r14 sp 64
    store 8 r15 sp 72
    r9 = mul r2 1 64
    br .while.cond

  .while.body57:
    r4 = udiv r12 2147483648 64
    r4 = mul r4 18446744071562067968 64
    r4 = or r4 r12 64
    r1 = load 8 sp 32
    r8 = mul r4 4 64
    r7 = add r1 r8 64
    r7 = load 4 r7 0
    r8 = udiv r13 2147483648 64
    r8 = mul r8 18446744071562067968 64
    r8 = or r8 r13 64
    r3 = mul arg1 1 64
    r5 = mul r8 4 64
    r3 = add r3 r5 64
    store 4 r7 r3 0
    r5 = add r12 1 32
    r6 = add r13 1 32
    r13 = mul r6 1 64
    r12 = mul r5 1 64
    br .while.cond54

  .while.end64:
    r2 = load 8 sp 8
    free r2
    r1 = load 8 sp 24
    free r1
    ret 0
end merge

; Function mergeSort
start mergeSort 3:
  .entry:
    r13 = icmp slt arg2 arg3 32
    br r13 .if.then .if.end

  .if.then:
    r14 = sub arg3 arg2 32
    r15 = sdiv r14 2 32
    r12 = add arg2 r15 32
    call mergeSort arg1 arg2 r12
    r16 = add r12 1 32
    call mergeSort arg1 r16 arg3
    call merge arg1 arg2 r12 arg3
    ret 0

  .if.end:
    ret 0
end mergeSort

; Function main
start main 0:
  .entry:
    ; init sp!
    sp = sub sp 32 64
    r9 = call read
    r2 = mul 4 r9 64
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
    r10 = icmp ult r6 r9 64
    br r10 .for.body .for.end

  .for.body:
    r11 = call read
    r7 = urem r11 4294967296 64
    r12 = mul r4 1 64
    r6 = load 8 sp 16
    r8 = mul r6 4 64
    r12 = add r12 r8 64
    reset heap
    store 4 r7 r12 0
    r13 = add r5 1 32
    reset stack
    store 8 r13 sp 8
    br .for.cond

  .for.end:
    r1 = sub r9 1 64
    r1 = urem r1 4294967296 64
    call mergeSort r4 0 r1
    store 8 0 sp 24
    br .for.cond7

  .for.cond7:
    r8 = load 8 sp 24
    r2 = udiv r8 2147483648 64
    r2 = mul r2 18446744071562067968 64
    r2 = or r2 r8 64
    r14 = icmp ult r2 r9 64
    br r14 .for.body12 .for.end18

  .for.body12:
    r3 = mul r2 4 64
    r15 = add r4 r3 64
    reset heap
    r16 = load 4 r15 0
    r3 = udiv r16 2147483648 64
    r3 = mul r3 18446744071562067968 64
    r3 = or r3 r16 64
    call write r3
    r6 = add r8 1 32
    reset stack
    store 8 r6 sp 24
    br .for.cond7

  .for.end18:
    r7 = load 8 sp 0
    free r7
    ret 0
end main
