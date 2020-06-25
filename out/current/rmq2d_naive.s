
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

; Function min_element
start min_element 2:
  .entry:
    r9 = mul arg1 1 64
    r10 = mul arg1 1 64
    br .while.cond

  .while.cond:
    r11 = icmp ne r9 arg2 64
    br r11 .while.body .while.end

  .while.body:
    r12 = load 4 r9 0
    r13 = load 4 r10 0
    r14 = icmp slt r12 r13 32
    r15 = select r14 r9 r10
    r16 = add r9 4 64
    r9 = mul r16 1 64
    r10 = mul r15 1 64
    br .while.cond

  .while.end:
    ret r10
end min_element

; Function min_at_row
start min_at_row 3:
  .entry:
    r1 = load 8 20480 0
    r2 = udiv arg1 2147483648 64
    r2 = mul r2 18446744071562067968 64
    r2 = or r2 arg1 64
    r3 = mul r2 8 64
    r1 = add r1 r3 64
    r4 = load 8 r1 0
    r5 = udiv arg2 2147483648 64
    r5 = mul r5 18446744071562067968 64
    r5 = or r5 arg2 64
    r6 = mul r5 4 64
    r11 = add r4 r6 64
    r7 = load 8 r1 0
    r8 = udiv arg3 2147483648 64
    r8 = mul r8 18446744071562067968 64
    r8 = or r8 arg3 64
    r3 = mul r8 4 64
    r7 = add r7 r3 64
    r12 = add r7 4 64
    r9 = mul r11 1 64
    r10 = mul r11 1 64
    br .while.cond.i

  .while.cond.i:
    r13 = icmp ne r9 r12 64
    br r13 .while.body.i .min_element.exit

  .while.body.i:
    r14 = load 4 r9 0
    r15 = load 4 r10 0
    r16 = icmp slt r14 r15 32
    r6 = select r16 r9 r10
    r3 = add r9 4 64
    r9 = mul r3 1 64
    r10 = mul r6 1 64
    br .while.cond.i

  .min_element.exit:
    r2 = load 4 r10 0
    ret r2
end min_at_row

; Function main
start main 0:
  .entry:
    ; init sp!
    sp = sub sp 96 64
    r1 = malloc 8
    r2 = call read
    r2 = urem r2 4294967296 64
    store 8 r2 sp 0
    r3 = call read
    r3 = urem r3 4294967296 64
    store 8 r3 sp 8
    r4 = udiv r2 2147483648 64
    r4 = mul r4 18446744071562067968 64
    r4 = or r4 r2 64
    r4 = mul 8 r4 64
    r4 = add r4 7 64
    r4 = udiv r4 8 64
    r4 = mul r4 8 64
    r5 = malloc r4
    r6 = mul r5 1 64
    store 8 r6 sp 16
    reset heap
    store 8 r6 20480 0
    r7 = udiv r3 2147483648 64
    r7 = mul r7 18446744071562067968 64
    r7 = or r7 r3 64
    r7 = mul 4 r7 64
    r7 = add r7 7 64
    r7 = udiv r7 8 64
    r7 = mul r7 8 64
    reset stack
    store 8 r7 sp 24
    store 8 0 sp 32
    br .for.cond

  .for.cond:
    r8 = load 8 sp 32
    r2 = load 8 sp 0
    r1 = icmp slt r8 r2 32
    br r1 .for.body .for.end22

  .for.body:
    r7 = load 8 sp 24
    r4 = malloc r7
    r5 = mul r4 1 64
    r8 = load 8 sp 32
    r6 = udiv r8 2147483648 64
    r6 = mul r6 18446744071562067968 64
    r6 = or r6 r8 64
    r3 = load 8 sp 16
    r2 = mul r6 8 64
    r16 = add r3 r2 64
    store 8 r5 r16 0
    store 8 0 sp 40
    br .for.cond9

  .for.end22:
    r2 = call read
    r2 = urem r2 4294967296 64
    r14 = mul r2 1 64
    br .while.cond

  .for.cond9:
    r1 = load 8 sp 40
    r7 = load 8 sp 8
    r4 = icmp slt r1 r7 32
    br r4 .for.body13 .for.inc20

  .while.cond:
    r8 = add r14 4294967295 32
    store 8 r8 sp 48
    r3 = icmp ne r14 0 32
    br r3 .while.body .while.end

  .for.body13:
    r6 = call read
    r6 = urem r6 4294967296 64
    r5 = load 8 r16 0
    r1 = load 8 sp 40
    r2 = udiv r1 2147483648 64
    r2 = mul r2 18446744071562067968 64
    r2 = or r2 r1 64
    r7 = mul r2 4 64
    r5 = add r5 r7 64
    store 4 r6 r5 0
    r7 = add r1 1 32
    store 8 r7 sp 40
    br .for.cond9

  .for.inc20:
    r4 = load 8 sp 32
    r8 = add r4 1 32
    store 8 r8 sp 32
    br .for.cond

  .while.body:
    r3 = call read
    r3 = urem r3 4294967296 64
    store 8 r3 sp 56
    r2 = call read
    r2 = urem r2 4294967296 64
    store 8 r2 sp 64
    r6 = call read
    r6 = urem r6 4294967296 64
    r5 = call read
    r5 = urem r5 4294967296 64
    reset heap
    r1 = load 8 20480 0
    r7 = udiv r3 2147483648 64
    r7 = mul r7 18446744071562067968 64
    r7 = or r7 r3 64
    r4 = mul r7 8 64
    r1 = add r1 r4 64
    r4 = load 8 r1 0
    r8 = udiv r6 2147483648 64
    r8 = mul r8 18446744071562067968 64
    r8 = or r8 r6 64
    reset stack
    store 8 r8 sp 72
    r2 = mul r8 4 64
    r4 = add r4 r2 64
    r2 = load 8 r1 0
    r3 = udiv r5 2147483648 64
    r3 = mul r3 18446744071562067968 64
    r3 = or r3 r5 64
    store 8 r3 sp 80
    r7 = mul r3 4 64
    r2 = add r2 r7 64
    r2 = add r2 4 64
    store 8 r2 sp 88
    r9 = mul r4 1 64
    r11 = mul r4 1 64
    br .while.cond.i.i

  .while.end:
    ret 0

  .while.cond.i.i:
    r2 = load 8 sp 88
    r7 = icmp ne r9 r2 64
    br r7 .while.body.i.i .min_at_row.exit

  .while.body.i.i:
    r6 = load 4 r9 0
    r8 = load 4 r11 0
    r6 = icmp slt r6 r8 32
    r6 = select r6 r9 r11
    r1 = add r9 4 64
    r9 = mul r1 1 64
    r11 = mul r6 1 64
    br .while.cond.i.i

  .min_at_row.exit:
    r5 = load 4 r11 0
    r3 = load 8 sp 56
    r4 = add r3 1 32
    r15 = mul r5 1 64
    r12 = mul r4 1 64
    br .for.cond35

  .for.cond35:
    r2 = load 8 sp 64
    r7 = icmp sle r12 r2 32
    br r7 .for.body39 .for.end44

  .for.body39:
    reset heap
    r8 = load 8 20480 0
    r1 = udiv r12 2147483648 64
    r1 = mul r1 18446744071562067968 64
    r1 = or r1 r12 64
    r6 = mul r1 8 64
    r8 = add r8 r6 64
    r6 = load 8 r8 0
    reset stack
    r3 = load 8 sp 72
    r5 = mul r3 4 64
    r6 = add r6 r5 64
    r5 = load 8 r8 0
    r4 = load 8 sp 80
    r2 = mul r4 4 64
    r5 = add r5 r2 64
    r5 = add r5 4 64
    r10 = mul r6 1 64
    r13 = mul r6 1 64
    br .while.cond.i.i15

  .for.end44:
    r2 = udiv r15 2147483648 64
    r2 = mul r2 18446744071562067968 64
    r2 = or r2 r15 64
    call write r2
    r7 = load 8 sp 48
    r14 = mul r7 1 64
    br .while.cond

  .while.cond.i.i15:
    r1 = icmp ne r10 r5 64
    br r1 .while.body.i.i17 .min_at_row.exit22

  .while.body.i.i17:
    r3 = load 4 r10 0
    r8 = load 4 r13 0
    r3 = icmp slt r3 r8 32
    r3 = select r3 r10 r13
    r4 = add r10 4 64
    r10 = mul r4 1 64
    r13 = mul r3 1 64
    br .while.cond.i.i15

  .min_at_row.exit22:
    r6 = load 4 r13 0
    r2 = call min r15 r6
    r7 = add r12 1 32
    r15 = mul r2 1 64
    r12 = mul r7 1 64
    br .for.cond35
end main
