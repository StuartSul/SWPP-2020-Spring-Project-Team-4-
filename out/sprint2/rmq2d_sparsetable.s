
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

; Function floorlog2
start floorlog2 1:
  .entry:
    r14 = call count_leading_zeros arg1
    r15 = sub 32 r14 32
    r16 = sub r15 1 32
    ret r16
end floorlog2

; Function input
start input 2:
  .entry:
    r11 = load 8 20480 0
    r12 = load 4 20488 0
    r13 = mul arg1 r12 32
    r14 = add r13 arg2 32
    r5 = udiv r14 2147483648 64
    r5 = mul r5 18446744071562067968 64
    r5 = or r5 r14 64
    r8 = mul r5 4 64
    r15 = add r11 r8 64
    ret r15
end input

; Function width
start width 1:
  .entry:
    r13 = load 4 20488 0
    r14 = shl 1 arg1 32
    r15 = sub r13 r14 32
    r16 = add r15 1 32
    ret r16
end width

; Function height
start height 1:
  .entry:
    r13 = load 4 20496 0
    r14 = shl 1 arg1 32
    r15 = sub r13 r14 32
    r16 = add r15 1 32
    ret r16
end height

; Function A
start A 2:
  .entry:
    r10 = load 8 20504 0
    r11 = load 4 20512 0
    r12 = add r11 1 32
    r13 = mul arg1 r12 32
    r14 = add r13 arg2 32
    r6 = udiv r14 2147483648 64
    r6 = mul r6 18446744071562067968 64
    r6 = or r6 r14 64
    r9 = mul r6 8 64
    r15 = add r10 r9 64
    ret r15
end A

; Function P
start P 4:
  .entry:
    r9 = call A arg1 arg2
    r10 = load 8 r9 0
    r11 = call width arg2
    r12 = mul arg3 r11 32
    r13 = add r12 arg4 32
    r6 = udiv r13 2147483648 64
    r6 = mul r6 18446744071562067968 64
    r6 = or r6 r13 64
    r1 = mul r6 4 64
    r14 = add r10 r1 64
    r15 = load 4 r14 0
    ret r15
end P

; Function preprocess
start preprocess 0:
  .entry:
    ; init sp!
    sp = sub sp 96 64
    r1 = load 4 20496 0
    r4 = call floorlog2 r1
    store 4 r4 20520 0
    r7 = load 4 20488 0
    r3 = call floorlog2 r7
    store 4 r3 20512 0
    r8 = load 4 20520 0
    r8 = add r8 1 32
    r5 = udiv r8 2147483648 64
    r5 = mul r5 18446744071562067968 64
    r5 = or r5 r8 64
    r5 = mul 8 r5 64
    r6 = add r3 1 32
    r2 = udiv r6 2147483648 64
    r2 = mul r2 18446744071562067968 64
    r2 = or r2 r6 64
    r5 = mul r5 r2 64
    r1 = call malloc_upto_8 r5
    store 8 r1 20504 0
    r7 = load 8 20480 0
    r3 = call A 0 0
    store 8 r7 r3 0
    store 8 0 sp 0
    br .for.cond

  .for.cond:
    r8 = load 8 sp 0
    r15 = load 4 20520 0
    r16 = icmp sle r8 r15 32
    store 8 0 sp 16
    br r16 .for.body .for.cond27

  .for.body:
    r8 = load 8 sp 0
    r6 = icmp eq r8 0 32
    store 8 r6 sp 8
    store 8 0 sp 24
    br .for.cond8

  .for.cond27:
    r2 = load 8 sp 16
    r5 = load 4 20520 0
    r5 = icmp sle r2 r5 32
    br r5 .for.body30 .for.end112

  .for.cond8:
    r1 = load 8 sp 24
    r4 = load 4 20512 0
    r4 = icmp sle r1 r4 32
    br r4 .for.body11 .for.end

  .for.body30:
    r2 = load 8 sp 16
    r7 = icmp eq r2 0 32
    store 8 r7 sp 32
    r2 = load 8 sp 16
    r9 = sub r2 1 32
    r3 = shl 1 r9 32
    store 8 r3 sp 40
    store 8 0 sp 48
    br .for.cond31

  .for.end112:
    ret 0

  .for.body11:
    r1 = load 8 sp 24
    r8 = icmp eq r1 0 32
    r6 = load 8 sp 8
    r8 = and r6 r8 1
    br r8 .for.inc .if.end

  .for.end:
    r6 = load 8 sp 0
    r2 = add r6 1 32
    store 8 r2 sp 0
    br .for.cond

  .for.cond31:
    r5 = load 8 sp 48
    r1 = load 4 20512 0
    r1 = icmp sle r5 r1 32
    br r1 .for.body34 .for.end109

  .for.inc:
    r4 = load 8 sp 24
    r7 = add r4 1 32
    store 8 r7 sp 24
    br .for.cond8

  .if.end:
    r6 = load 8 sp 0
    r3 = call height r6
    r8 = udiv r3 2147483648 64
    r8 = mul r8 18446744071562067968 64
    r8 = or r8 r3 64
    r8 = mul 4 r8 64
    r4 = load 8 sp 24
    r6 = call width r4
    r2 = udiv r6 2147483648 64
    r2 = mul r2 18446744071562067968 64
    r2 = or r2 r6 64
    r8 = mul r8 r2 64
    r5 = call malloc_upto_8 r8
    r1 = mul r5 1 64
    r4 = load 8 sp 0
    r7 = load 8 sp 24
    r3 = call A r4 r7
    store 8 r1 r3 0
    br .for.inc

  .for.body34:
    r6 = load 8 sp 48
    r2 = icmp eq r6 0 32
    r8 = load 8 sp 32
    r2 = and r8 r2 1
    br r2 .for.inc107 .if.end41

  .for.end109:
    r5 = load 8 sp 16
    r1 = add r5 1 32
    store 8 r1 sp 16
    br .for.cond27

  .for.inc107:
    r6 = load 8 sp 48
    r4 = add r6 1 32
    store 8 r4 sp 48
    br .for.cond31

  .if.end41:
    r5 = load 8 sp 16
    r6 = load 8 sp 48
    r7 = call A r5 r6
    r11 = load 8 r7 0
    r6 = load 8 sp 48
    r3 = icmp ne r6 0 32
    store 8 r3 sp 56
    r6 = load 8 sp 48
    r10 = sub r6 1 32
    r6 = shl 1 r10 32
    store 8 r6 sp 64
    store 8 0 sp 72
    br .for.cond43

  .for.cond43:
    r8 = load 8 sp 72
    r5 = load 8 sp 16
    r2 = call height r5
    r2 = icmp slt r8 r2 32
    br r2 .for.body47 .for.inc107

  .for.body47:
    r5 = load 8 sp 40
    r8 = load 8 sp 72
    r1 = add r8 r5 32
    store 8 r1 sp 80
    store 8 0 sp 88
    br .for.cond48

  .for.cond48:
    r4 = load 8 sp 88
    r7 = load 8 sp 48
    r3 = call width r7
    r3 = icmp slt r4 r3 32
    br r3 .for.body53 .for.cond.cleanup52

  .for.body53:
    r6 = load 8 sp 56
    br r6 .if.then56 .if.else

  .for.cond.cleanup52:
    r8 = load 8 sp 72
    r8 = add r8 1 32
    store 8 r8 sp 72
    br .for.cond43

  .if.then56:
    r2 = load 8 sp 16
    r5 = call A r2 r10
    r12 = load 8 r5 0
    r1 = call width r10
    r4 = load 8 sp 72
    r1 = mul r4 r1 32
    r7 = load 8 sp 88
    r13 = add r1 r7 32
    r3 = udiv r13 2147483648 64
    r3 = mul r3 18446744071562067968 64
    r3 = or r3 r13 64
    r8 = mul r3 4 64
    r6 = add r12 r8 64
    r6 = load 4 r6 0
    r8 = load 8 sp 64
    r2 = add r13 r8 32
    r5 = udiv r2 2147483648 64
    r5 = mul r5 18446744071562067968 64
    r5 = or r5 r2 64
    r1 = mul r5 4 64
    r4 = add r12 r1 64
    r4 = load 4 r4 0
    r1 = call min r6 r4
    r7 = load 8 sp 48
    r3 = call width r7
    r6 = load 8 sp 72
    r3 = mul r6 r3 32
    r8 = load 8 sp 88
    r3 = add r3 r8 32
    r2 = udiv r3 2147483648 64
    r2 = mul r2 18446744071562067968 64
    r2 = or r2 r3 64
    r4 = mul r2 4 64
    r5 = add r11 r4 64
    store 4 r1 r5 0
    br .if.end100

  .if.else:
    r4 = call A r9 0
    r14 = load 8 r4 0
    r1 = call height r9
    r7 = call width 0
    r6 = load 8 sp 72
    r7 = mul r6 r7 32
    r8 = load 8 sp 88
    r7 = add r7 r8 32
    r6 = udiv r7 2147483648 64
    r6 = mul r6 18446744071562067968 64
    r6 = or r6 r7 64
    r3 = mul r6 4 64
    r8 = add r14 r3 64
    r8 = load 4 r8 0
    r3 = load 8 sp 80
    r2 = load 8 sp 88
    r5 = load 8 sp 72
    call preprocess.if.else.split 0 r3 r2 r14 r8 r5 r11
    br .if.end100

  .if.end100:
    r2 = load 8 sp 88
    r4 = add r2 1 32
    store 8 r4 sp 88
    br .for.cond48
end preprocess

; Function main
start main 0:
  .entry:
    ; init sp!
    sp = sub sp 40 64
    r1 = malloc 8
    r1 = malloc 8
    r1 = malloc 8
    r1 = malloc 8
    r1 = malloc 8
    r1 = malloc 8
    r1 = call read
    r1 = urem r1 4294967296 64
    store 4 r1 20496 0
    r6 = call read
    r6 = urem r6 4294967296 64
    store 4 r6 20488 0
    r4 = load 4 20496 0
    r8 = udiv r4 2147483648 64
    r8 = mul r8 18446744071562067968 64
    r8 = or r8 r4 64
    r8 = mul 4 r8 64
    r2 = udiv r6 2147483648 64
    r2 = mul r2 18446744071562067968 64
    r2 = or r2 r6 64
    r8 = mul r8 r2 64
    r7 = call malloc_upto_8 r8
    store 8 r7 20480 0
    store 8 0 sp 0
    br .for.cond

  .for.cond:
    r5 = load 8 sp 0
    r14 = load 4 20496 0
    r15 = icmp slt r5 r14 32
    store 8 0 sp 8
    br r15 .for.cond8 .for.end18

  .for.cond8:
    r1 = load 8 sp 8
    r16 = load 4 20488 0
    r4 = icmp slt r1 r16 32
    br r4 .for.body12 .for.cond.cleanup11

  .for.end18:
    call preprocess
    r6 = call read
    r6 = urem r6 4294967296 64
    r9 = mul r6 1 64
    br .while.cond

  .for.body12:
    r2 = call read
    r2 = urem r2 4294967296 64
    r7 = call input r5 r1
    store 4 r2 r7 0
    r8 = add r1 1 32
    store 8 r8 sp 8
    br .for.cond8

  .for.cond.cleanup11:
    r3 = add r5 1 32
    store 8 r3 sp 0
    br .for.cond

  .while.cond:
    r5 = add r9 4294967295 32
    store 8 r5 sp 16
    r1 = icmp ne r9 0 32
    br r1 .while.body .while.end

  .while.body:
    r4 = call read
    r4 = urem r4 4294967296 64
    store 8 r4 sp 24
    r6 = call read
    r6 = urem r6 4294967296 64
    r2 = call read
    r2 = urem r2 4294967296 64
    r7 = call read
    r7 = urem r7 4294967296 64
    r8 = sub r6 r4 32
    r8 = add r8 1 32
    r10 = call floorlog2 r8
    r3 = sub r7 r2 32
    r3 = add r3 1 32
    r11 = call floorlog2 r3
    r5 = call P r10 r11 r4 r2
    store 8 r5 sp 32
    r1 = add r6 1 32
    r4 = shl 1 r10 32
    r12 = sub r1 r4 32
    r6 = call P r10 r11 r12 r2
    r2 = add r7 1 32
    r7 = shl 1 r11 32
    r13 = sub r2 r7 32
    r8 = load 8 sp 24
    r3 = call P r10 r11 r8 r13
    r5 = call P r10 r11 r12 r13
    r1 = load 8 sp 32
    r4 = call min r1 r6
    r6 = call min r3 r5
    r2 = call min r4 r6
    r7 = udiv r2 2147483648 64
    r7 = mul r7 18446744071562067968 64
    r7 = or r7 r2 64
    call write r7
    r8 = load 8 sp 16
    r9 = mul r8 1 64
    br .while.cond

  .while.end:
    ret 0
end main

; Function preprocess.if.else.split
start preprocess.if.else.split 7:
  .newFuncRoot:
    r5 = call width arg1
    r6 = mul arg2 r5 32
    r7 = add r6 arg3 32
    r4 = udiv r7 2147483648 64
    r4 = mul r4 18446744071562067968 64
    r4 = or r4 r7 64
    r8 = mul arg4 1 64
    r3 = mul r4 4 64
    r8 = add r8 r3 64
    r9 = load 4 r8 0
    r10 = call min arg5 r9
    r11 = call width arg1
    r12 = mul arg6 r11 32
    r13 = add r12 arg3 32
    r3 = udiv r13 2147483648 64
    r3 = mul r3 18446744071562067968 64
    r3 = or r3 r13 64
    r14 = mul arg7 1 64
    r1 = mul r3 4 64
    r14 = add r14 r1 64
    store 4 r10 r14 0
    ret 0
end preprocess.if.else.split
