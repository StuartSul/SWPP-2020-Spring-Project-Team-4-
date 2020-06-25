
; Function malloc_upto_8
start malloc_upto_8 1:
  .entry:
    r13 = add arg1 7 64
    r14 = udiv r13 8 64
    r15 = mul r14 8 64
    r16 = malloc r15
    ret r16
end malloc_upto_8

; Function swap
start swap 2:
  .entry:
    r15 = load 4 arg1 0
    r16 = load 4 arg2 0
    store 4 r16 arg1 0
    store 4 r15 arg2 0
    ret 0
end swap

; Function partition
start partition 3:
  .entry:
    ; init sp!
    sp = sub sp 8 64
    r1 = udiv arg3 2147483648 64
    r1 = mul r1 18446744071562067968 64
    r1 = or r1 arg3 64
    r15 = mul arg1 1 64
    r2 = mul r1 4 64
    r15 = add r15 r2 64
    r16 = load 4 r15 0
    r3 = sub arg2 1 32
    r4 = sub arg3 1 32
    store 8 r4 sp 0
    r10 = mul r3 1 64
    r9 = mul arg2 1 64
    br .for.cond

  .for.cond:
    r4 = load 8 sp 0
    r5 = icmp sle r9 r4 32
    br r5 .for.body .for.end

  .for.body:
    r6 = udiv r9 2147483648 64
    r6 = mul r6 18446744071562067968 64
    r6 = or r6 r9 64
    r12 = mul arg1 1 64
    r7 = mul r6 4 64
    r12 = add r12 r7 64
    r8 = load 4 r12 0
    r8 = icmp slt r8 r16 32
    r11 = mul r10 1 64
    br r8 .if.then .for.inc

  .for.end:
    r2 = add r10 1 32
    r7 = udiv r2 2147483648 64
    r7 = mul r7 18446744071562067968 64
    r7 = or r7 r2 64
    r1 = mul arg1 1 64
    r3 = mul r7 4 64
    r1 = add r1 r3 64
    r3 = load 4 r1 0
    r4 = load 4 r15 0
    store 4 r4 r1 0
    store 4 r3 r15 0
    ret r2

  .if.then:
    r13 = add r10 1 32
    r5 = udiv r13 2147483648 64
    r5 = mul r5 18446744071562067968 64
    r5 = or r5 r13 64
    r14 = mul arg1 1 64
    r6 = mul r5 4 64
    r14 = add r14 r6 64
    r6 = load 4 r14 0
    r8 = load 4 r12 0
    store 4 r8 r14 0
    store 4 r6 r12 0
    r11 = mul r13 1 64
    br .for.inc

  .for.inc:
    r7 = add r9 1 32
    r10 = mul r11 1 64
    r9 = mul r7 1 64
    br .for.cond
end partition

; Function quickSort
start quickSort 3:
  .entry:
    r12 = mul arg2 1 64
    br .tailrecurse

  .tailrecurse:
    r14 = icmp slt r12 arg3 32
    br r14 .if.then .if.end

  .if.then:
    r13 = call partition arg1 r12 arg3
    r15 = sub r13 1 32
    call quickSort arg1 r12 r15
    r16 = add r13 1 32
    r12 = mul r16 1 64
    br .tailrecurse

  .if.end:
    ret 0
end quickSort

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
    call quickSort r4 0 r1
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
