
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
    r6 = load 8 20480 0
    r2 = udiv arg1 2147483648 64
    r2 = mul r2 18446744071562067968 64
    r2 = or r2 arg1 64
    r1 = mul r2 8 64
    r5 = add r6 r1 64
    r7 = load 8 r5 0
    r4 = udiv arg2 2147483648 64
    r4 = mul r4 18446744071562067968 64
    r4 = or r4 arg2 64
    r1 = mul r4 4 64
    r8 = add r7 r1 64
    r9 = load 8 r5 0
    r1 = udiv arg3 2147483648 64
    r1 = mul r1 18446744071562067968 64
    r1 = or r1 arg3 64
    r3 = mul r1 4 64
    r10 = add r9 r3 64
    r11 = add r10 4 64
    r12 = call min_element r8 r11
    r13 = load 4 r12 0
    ret r13
end min_at_row

; Function main
start main 0:
  .entry:
    ; init sp!
    sp = sub sp 72 64
    r1 = malloc 8
    r1 = call read
    r1 = urem r1 4294967296 64
    store 8 r1 sp 0
    r5 = call read
    r5 = urem r5 4294967296 64
    store 8 r5 sp 8
    r3 = udiv r1 2147483648 64
    r3 = mul r3 18446744071562067968 64
    r3 = or r3 r1 64
    r3 = mul 8 r3 64
    r2 = call malloc_upto_8 r3
    store 8 r2 20480 0
    r8 = udiv r5 2147483648 64
    r8 = mul r8 18446744071562067968 64
    r8 = or r8 r5 64
    r12 = mul 4 r8 64
    store 8 0 sp 16
    br .for.cond

  .for.cond:
    r6 = load 8 sp 16
    r1 = load 8 sp 0
    call write r6
    call write r1
    r13 = icmp slt r6 r1 32
    br r13 .for.body .for.end22

  .for.body:
    r14 = call malloc_upto_8 r12
    r4 = mul r14 1 64
    r15 = load 8 20480 0
    r1 = udiv r6 2147483648 64
    r1 = mul r1 18446744071562067968 64
    r1 = or r1 r6 64
    store 8 r1 sp 24
    r5 = mul r1 8 64
    r16 = add r15 r5 64
    store 8 r4 r16 0
    store 8 0 sp 32
    br .for.cond9

  .for.end22:
    r5 = call read
    r5 = urem r5 4294967296 64
    r10 = mul r5 1 64
    br .while.cond

  .for.cond9:
    r2 = load 8 sp 32
    r3 = load 8 sp 8
    r7 = icmp slt r2 r3 32
    br r7 .for.body13 .for.cond.cleanup12

  .while.cond:
    r8 = add r10 4294967295 32
    store 8 r8 sp 40
    r6 = icmp ne r10 0 32
    br r6 .while.body .while.end

  .for.body13:
    r4 = call read
    r4 = urem r4 4294967296 64
    call write r4
    r1 = load 8 20480 0
    r5 = load 8 sp 24
    r2 = mul r5 8 64
    r1 = add r1 r2 64
    r1 = load 8 r1 0
    r2 = load 8 sp 32
    r3 = udiv r2 2147483648 64
    r3 = mul r3 18446744071562067968 64
    r3 = or r3 r2 64
    r7 = mul r3 4 64
    r1 = add r1 r7 64
    store 4 r4 r1 0
    r7 = add r2 1 32
    store 8 r7 sp 32
    br .for.cond9

  .for.cond.cleanup12:
    r8 = load 8 sp 16
    r6 = add r8 1 32
    store 8 r6 sp 16
    br .for.cond

  .while.body:
    r4 = call read
    r4 = urem r4 4294967296 64
    r5 = call read
    r5 = urem r5 4294967296 64
    store 8 r5 sp 48
    r2 = call read
    r2 = urem r2 4294967296 64
    store 8 r2 sp 56
    r3 = call read
    r3 = urem r3 4294967296 64
    store 8 r3 sp 64
    r1 = call min_at_row r4 r2 r3
    r7 = add r4 1 32
    r11 = mul r1 1 64
    r9 = mul r7 1 64
    br .for.cond35

  .while.end:
    ret 0

  .for.cond35:
    r5 = load 8 sp 48
    r8 = icmp sle r9 r5 32
    br r8 .for.body39 .for.cond.cleanup38

  .for.body39:
    r2 = load 8 sp 56
    r3 = load 8 sp 64
    r6 = call min_at_row r9 r2 r3
    r4 = call min r11 r6
    r5 = add r9 1 32
    r11 = mul r4 1 64
    r9 = mul r5 1 64
    br .for.cond35

  .for.cond.cleanup38:
    r2 = udiv r11 2147483648 64
    r2 = mul r2 18446744071562067968 64
    r2 = or r2 r11 64
    call write r2
    r3 = load 8 sp 40
    r10 = mul r3 1 64
    br .while.cond
end main
