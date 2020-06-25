
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

; Function floorlog2
start floorlog2 1:
  .entry:
    ; init sp!
    sp = sub sp 16 64
    store 8 0 sp 0
    store 8 31 sp 8
    br .for.cond.i

  .for.cond.i:
    r1 = load 8 sp 0
    r2 = load 8 sp 8
    r7 = icmp sge r2 0 32
    br r7 .for.body.i .count_leading_zeros.exit

  .for.body.i:
    r8 = shl 1 r2 32
    r9 = and arg1 r8 32
    r10 = icmp ne r9 0 32
    br r10 .count_leading_zeros.exit .if.end.i

  .count_leading_zeros.exit:
    r13 = sub 32 r1 32
    r14 = sub r13 1 32
    ret r14

  .if.end.i:
    r11 = add r1 1 32
    r12 = add r2 4294967295 32
    store 8 r11 sp 0
    store 8 r12 sp 8
    br .for.cond.i
end floorlog2

; Function input
start input 2:
  .entry:
    r11 = load 8 20480 0
    r12 = load 4 20488 0
    r13 = mul arg1 r12 32
    r14 = add r13 arg2 32
    r1 = udiv r14 2147483648 64
    r1 = mul r1 18446744071562067968 64
    r1 = or r1 r14 64
    r2 = mul r1 4 64
    r15 = add r11 r2 64
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
    r1 = udiv r14 2147483648 64
    r1 = mul r1 18446744071562067968 64
    r1 = or r1 r14 64
    r2 = mul r1 8 64
    r15 = add r10 r2 64
    ret r15
end A

; Function P
start P 4:
  .entry:
    r9 = load 8 20504 0
    r10 = load 4 20512 0
    r11 = add r10 1 32
    r12 = mul arg1 r11 32
    r13 = add r12 arg2 32
    r1 = udiv r13 2147483648 64
    r1 = mul r1 18446744071562067968 64
    r1 = or r1 r13 64
    r2 = mul r1 8 64
    r14 = add r9 r2 64
    r15 = load 8 r14 0
    r16 = load 4 20488 0
    r3 = shl 1 arg2 32
    r3 = sub r16 r3 32
    r3 = add r3 1 32
    r3 = mul arg3 r3 32
    r3 = add r3 arg4 32
    r4 = udiv r3 2147483648 64
    r4 = mul r4 18446744071562067968 64
    r4 = or r4 r3 64
    r6 = mul r4 4 64
    r5 = add r15 r6 64
    r5 = load 4 r5 0
    ret r5
end P

; Function preprocess
start preprocess 0:
  .entry:
    ; init sp!
    sp = sub sp 184 64
    r1 = load 4 20496 0
    reset stack
    store 8 r1 sp 0
    store 8 0 sp 8
    store 8 31 sp 16
    br .for.cond.i.i4

  .for.cond.i.i4:
    r3 = load 8 sp 16
    r4 = icmp sge r3 0 32
    br r4 .for.body.i.i9 .floorlog2.exit16

  .for.body.i.i9:
    r3 = load 8 sp 16
    r5 = shl 1 r3 32
    r1 = load 8 sp 0
    r5 = and r1 r5 32
    r5 = icmp ne r5 0 32
    br r5 .floorlog2.exit16 .if.end.i.i13

  .floorlog2.exit16:
    r2 = load 8 sp 8
    r6 = sub 32 r2 32
    r6 = sub r6 1 32
    store 8 r6 sp 24
    reset heap
    store 4 r6 20520 0
    r7 = load 4 20488 0
    reset stack
    store 8 r7 sp 32
    store 8 0 sp 40
    store 8 31 sp 48
    br .for.cond.i.i

  .if.end.i.i13:
    r2 = load 8 sp 8
    r8 = add r2 1 32
    r3 = load 8 sp 16
    r4 = add r3 4294967295 32
    store 8 r8 sp 8
    store 8 r4 sp 16
    br .for.cond.i.i4

  .for.cond.i.i:
    r5 = load 8 sp 48
    r6 = icmp sge r5 0 32
    br r6 .for.body.i.i .floorlog2.exit

  .for.body.i.i:
    r5 = load 8 sp 48
    r7 = shl 1 r5 32
    r2 = load 8 sp 32
    r7 = and r2 r7 32
    r7 = icmp ne r7 0 32
    br r7 .floorlog2.exit .if.end.i.i

  .floorlog2.exit:
    r1 = load 8 sp 40
    r3 = sub 32 r1 32
    r8 = sub r3 1 32
    store 8 r8 sp 56
    reset heap
    store 4 r8 20512 0
    r4 = load 4 20520 0
    r4 = add r4 1 32
    r6 = udiv r4 2147483648 64
    r6 = mul r6 18446744071562067968 64
    r6 = or r6 r4 64
    r6 = mul 8 r6 64
    r5 = udiv r3 2147483648 64
    r5 = mul r5 18446744071562067968 64
    r5 = or r5 r3 64
    r6 = mul r6 r5 64
    r2 = call malloc_upto_8 r6
    store 8 r2 20504 0
    r1 = load 8 20480 0
    r8 = call A 0 0
    store 8 r1 r8 0
    reset stack
    store 8 0 sp 64
    br .for.cond

  .if.end.i.i:
    r4 = load 8 sp 40
    r3 = add r4 1 32
    r5 = load 8 sp 48
    r6 = add r5 4294967295 32
    store 8 r3 sp 40
    store 8 r6 sp 48
    br .for.cond.i.i

  .for.cond:
    r2 = load 8 sp 64
    r7 = load 8 sp 24
    r1 = icmp sle r2 r7 32
    br r1 .for.cond8.preheader .for.end26

  .for.cond8.preheader:
    r2 = load 8 sp 64
    r8 = icmp eq r2 0 32
    store 8 r8 sp 72
    r4 = shl 1 r2 32
    store 8 r4 sp 80
    store 8 0 sp 104
    br .for.cond8

  .for.end26:
    reset heap
    r5 = load 4 20520 0
    reset stack
    store 8 r5 sp 88
    reset heap
    r3 = load 4 20512 0
    reset stack
    store 8 r3 sp 96
    store 8 0 sp 112
    br .for.cond27

  .for.cond8:
    r6 = load 8 sp 104
    r7 = load 8 sp 56
    r1 = icmp sle r6 r7 32
    br r1 .for.body11 .for.inc24

  .for.cond27:
    r8 = load 8 sp 112
    r5 = load 8 sp 88
    r2 = icmp sle r8 r5 32
    br r2 .for.cond31.preheader .for.end112

  .for.body11:
    r6 = load 8 sp 104
    r4 = icmp eq r6 0 32
    r3 = load 8 sp 72
    r4 = and r3 r4 1
    br r4 .for.inc .if.end

  .for.inc24:
    r7 = load 8 sp 64
    r1 = add r7 1 32
    store 8 r1 sp 64
    br .for.cond

  .for.cond31.preheader:
    r8 = load 8 sp 112
    r5 = icmp eq r8 0 32
    store 8 r5 sp 120
    r2 = shl 1 r8 32
    store 8 r2 sp 128
    r10 = sub r8 1 32
    r6 = shl 1 r10 32
    store 8 r6 sp 136
    store 8 0 sp 144
    br .for.cond31

  .for.end112:
    ret 0

  .for.inc:
    r3 = load 8 sp 104
    r4 = add r3 1 32
    store 8 r4 sp 104
    br .for.cond8

  .if.end:
    reset heap
    r7 = load 4 20496 0
    reset stack
    r1 = load 8 sp 80
    r7 = sub r7 r1 32
    r7 = add r7 1 32
    r5 = udiv r7 2147483648 64
    r5 = mul r5 18446744071562067968 64
    r5 = or r5 r7 64
    r5 = mul 4 r5 64
    reset heap
    r2 = load 4 20488 0
    reset stack
    r3 = load 8 sp 104
    r8 = shl 1 r3 32
    r2 = sub r2 r8 32
    r2 = add r2 1 32
    r6 = udiv r2 2147483648 64
    r6 = mul r6 18446744071562067968 64
    r6 = or r6 r2 64
    r5 = mul r5 r6 64
    r5 = add r5 7 64
    r5 = udiv r5 8 64
    r5 = mul r5 8 64
    r4 = malloc r5
    r1 = mul r4 1 64
    reset heap
    r7 = load 8 20504 0
    r3 = load 4 20512 0
    r3 = add r3 1 32
    reset stack
    r8 = load 8 sp 64
    r3 = mul r8 r3 32
    r2 = load 8 sp 104
    r3 = add r3 r2 32
    r6 = udiv r3 2147483648 64
    r6 = mul r6 18446744071562067968 64
    r6 = or r6 r3 64
    r5 = mul r6 8 64
    r7 = add r7 r5 64
    store 8 r1 r7 0
    br .for.inc

  .for.cond31:
    r5 = load 8 sp 144
    r4 = load 8 sp 96
    r8 = icmp sle r5 r4 32
    br r8 .for.body34 .for.inc110

  .for.body34:
    r5 = load 8 sp 144
    r2 = icmp eq r5 0 32
    r3 = load 8 sp 120
    r2 = and r3 r2 1
    br r2 .for.inc107 .if.end41

  .for.inc110:
    r6 = load 8 sp 112
    r1 = add r6 1 32
    store 8 r1 sp 112
    br .for.cond27

  .for.inc107:
    r5 = load 8 sp 144
    r7 = add r5 1 32
    store 8 r7 sp 144
    br .for.cond31

  .if.end41:
    reset heap
    r4 = load 8 20504 0
    r8 = load 4 20512 0
    r8 = add r8 1 32
    reset stack
    r6 = load 8 sp 112
    r8 = mul r6 r8 32
    r5 = load 8 sp 144
    r8 = add r8 r5 32
    r3 = udiv r8 2147483648 64
    r3 = mul r3 18446744071562067968 64
    r3 = or r3 r8 64
    r2 = mul r3 8 64
    r4 = add r4 r2 64
    r11 = load 8 r4 0
    r9 = shl 1 r5 32
    r2 = icmp ne r5 0 32
    store 8 r2 sp 152
    r12 = sub r5 1 32
    r13 = shl 1 r12 32
    store 8 0 sp 160
    br .for.cond43

  .for.cond43:
    r1 = load 8 sp 160
    reset heap
    r7 = load 4 20496 0
    reset stack
    r6 = load 8 sp 128
    r7 = sub r7 r6 32
    r7 = add r7 1 32
    r7 = icmp slt r1 r7 32
    br r7 .for.cond48.preheader .for.inc107

  .for.cond48.preheader:
    r8 = load 8 sp 136
    r1 = load 8 sp 160
    r3 = add r1 r8 32
    store 8 r3 sp 168
    store 8 0 sp 176
    br .for.cond48

  .for.cond48:
    r4 = load 8 sp 176
    reset heap
    r2 = load 4 20488 0
    r2 = sub r2 r9 32
    r2 = add r2 1 32
    r2 = icmp slt r4 r2 32
    br r2 .for.body53 .for.inc104

  .for.body53:
    r14 = load 8 20504 0
    r5 = load 4 20512 0
    r15 = add r5 1 32
    reset stack
    r6 = load 8 sp 152
    br r6 .if.then56 .if.else

  .for.inc104:
    r1 = load 8 sp 160
    r7 = add r1 1 32
    store 8 r7 sp 160
    br .for.cond43

  .if.then56:
    r8 = load 8 sp 112
    r3 = mul r8 r15 32
    r3 = add r3 r12 32
    r4 = udiv r3 2147483648 64
    r4 = mul r4 18446744071562067968 64
    r4 = or r4 r3 64
    r5 = mul r4 8 64
    r2 = add r14 r5 64
    r16 = load 8 r2 0
    reset heap
    r5 = load 4 20488 0
    r5 = sub r5 r13 32
    r5 = add r5 1 32
    reset stack
    r1 = load 8 sp 160
    r5 = mul r1 r5 32
    r6 = load 8 sp 176
    r5 = add r5 r6 32
    r7 = udiv r5 2147483648 64
    r7 = mul r7 18446744071562067968 64
    r7 = or r7 r5 64
    r3 = mul r7 4 64
    r8 = add r16 r3 64
    r8 = load 4 r8 0
    r3 = add r5 r13 32
    r4 = udiv r3 2147483648 64
    r4 = mul r4 18446744071562067968 64
    r4 = or r4 r3 64
    r1 = mul r4 4 64
    r2 = add r16 r1 64
    r2 = load 4 r2 0
    r1 = icmp slt r8 r2 32
    r1 = select r1 r8 r2
    reset heap
    r6 = load 4 20488 0
    r6 = sub r6 r9 32
    r6 = add r6 1 32
    reset stack
    r7 = load 8 sp 160
    r6 = mul r7 r6 32
    r5 = load 8 sp 176
    r6 = add r6 r5 32
    r3 = udiv r6 2147483648 64
    r3 = mul r3 18446744071562067968 64
    r3 = or r3 r6 64
    r8 = mul r3 4 64
    r4 = add r11 r8 64
    store 4 r1 r4 0
    br .for.inc101

  .if.else:
    r8 = mul r10 r15 32
    r2 = udiv r8 2147483648 64
    r2 = mul r2 18446744071562067968 64
    r2 = or r2 r8 64
    r5 = mul r2 8 64
    r7 = add r14 r5 64
    r7 = load 8 r7 0
    reset heap
    r5 = load 4 20488 0
    r5 = sub r5 r9 32
    r5 = add r5 1 32
    reset stack
    r6 = load 8 sp 160
    r5 = mul r6 r5 32
    r3 = load 8 sp 176
    r5 = add r5 r3 32
    r1 = udiv r5 2147483648 64
    r1 = mul r1 18446744071562067968 64
    r1 = or r1 r5 64
    r8 = mul r1 4 64
    r4 = add r7 r8 64
    r4 = load 4 r4 0
    reset heap
    r8 = load 4 20488 0
    r8 = sub r8 r9 32
    r8 = add r8 1 32
    reset stack
    r2 = load 8 sp 168
    r8 = mul r2 r8 32
    r8 = add r8 r3 32
    r6 = udiv r8 2147483648 64
    r6 = mul r6 18446744071562067968 64
    r6 = or r6 r8 64
    r1 = mul r6 4 64
    r5 = add r7 r1 64
    r5 = load 4 r5 0
    r1 = icmp slt r4 r5 32
    r1 = select r1 r4 r5
    reset heap
    r2 = load 4 20488 0
    r2 = sub r2 r9 32
    r2 = add r2 1 32
    reset stack
    r3 = load 8 sp 160
    r2 = mul r3 r2 32
    r8 = load 8 sp 176
    r2 = add r2 r8 32
    r7 = udiv r2 2147483648 64
    r7 = mul r7 18446744071562067968 64
    r7 = or r7 r2 64
    r4 = mul r7 4 64
    r6 = add r11 r4 64
    store 4 r1 r6 0
    br .for.inc101

  .for.inc101:
    r8 = load 8 sp 176
    r4 = add r8 1 32
    store 8 r4 sp 176
    br .for.cond48
end preprocess

; Function main
start main 0:
  .entry:
    ; init sp!
    sp = sub sp 128 64
    r1 = malloc 8
    r1 = malloc 8
    r1 = malloc 8
    r1 = malloc 8
    r1 = malloc 8
    r1 = malloc 8
    r2 = call read
    r2 = urem r2 4294967296 64
    store 8 r2 sp 0
    reset heap
    store 4 r2 20496 0
    r3 = call read
    r3 = urem r3 4294967296 64
    reset stack
    store 8 r3 sp 8
    reset heap
    store 4 r3 20488 0
    r4 = load 4 20496 0
    r5 = udiv r4 2147483648 64
    r5 = mul r5 18446744071562067968 64
    r5 = or r5 r4 64
    r5 = mul 4 r5 64
    r6 = udiv r3 2147483648 64
    r6 = mul r6 18446744071562067968 64
    r6 = or r6 r3 64
    r5 = mul r5 r6 64
    r5 = add r5 7 64
    r5 = udiv r5 8 64
    r5 = mul r5 8 64
    r7 = malloc r5
    store 8 r7 20480 0
    reset stack
    store 8 0 sp 16
    br .for.cond

  .for.cond:
    r1 = load 8 sp 16
    r2 = load 8 sp 0
    r14 = icmp slt r1 r2 32
    store 8 0 sp 24
    br r14 .for.cond8 .for.end18

  .for.cond8:
    r4 = load 8 sp 24
    r3 = load 8 sp 8
    r15 = icmp slt r4 r3 32
    br r15 .for.body12 .for.inc16

  .for.end18:
    call preprocess
    r6 = call read
    r6 = urem r6 4294967296 64
    r9 = mul r6 1 64
    br .while.cond

  .for.body12:
    r16 = call read
    r5 = urem r16 4294967296 64
    reset heap
    r7 = load 8 20480 0
    r8 = load 4 20488 0
    reset stack
    r1 = load 8 sp 16
    r8 = mul r1 r8 32
    r4 = load 8 sp 24
    r8 = add r8 r4 32
    r2 = udiv r8 2147483648 64
    r2 = mul r2 18446744071562067968 64
    r2 = or r2 r8 64
    r3 = mul r2 4 64
    r7 = add r7 r3 64
    store 4 r5 r7 0
    r3 = add r4 1 32
    store 8 r3 sp 24
    br .for.cond8

  .for.inc16:
    r1 = load 8 sp 16
    r6 = add r1 1 32
    store 8 r6 sp 16
    br .for.cond

  .while.cond:
    r8 = add r9 4294967295 32
    store 8 r8 sp 32
    r2 = icmp ne r9 0 32
    br r2 .while.body .while.end

  .while.body:
    r5 = call read
    r5 = urem r5 4294967296 64
    store 8 r5 sp 40
    r7 = call read
    r7 = urem r7 4294967296 64
    store 8 r7 sp 48
    r4 = call read
    r4 = urem r4 4294967296 64
    store 8 r4 sp 56
    r3 = call read
    r3 = urem r3 4294967296 64
    store 8 r3 sp 64
    r1 = sub r7 r5 32
    r1 = add r1 1 32
    store 8 r1 sp 72
    store 8 0 sp 80
    store 8 31 sp 88
    br .for.cond.i.i6

  .while.end:
    ret 0

  .for.cond.i.i6:
    r8 = load 8 sp 88
    r2 = icmp sge r8 0 32
    br r2 .for.body.i.i11 .floorlog2.exit18

  .for.body.i.i11:
    r8 = load 8 sp 88
    r4 = shl 1 r8 32
    r1 = load 8 sp 72
    r4 = and r1 r4 32
    r4 = icmp ne r4 0 32
    br r4 .floorlog2.exit18 .if.end.i.i15

  .floorlog2.exit18:
    r6 = load 8 sp 80
    r3 = sub 32 r6 32
    r10 = sub r3 1 32
    r7 = load 8 sp 64
    r5 = load 8 sp 56
    r2 = sub r7 r5 32
    r2 = add r2 1 32
    store 8 r2 sp 96
    store 8 0 sp 104
    store 8 31 sp 112
    br .for.cond.i.i

  .if.end.i.i15:
    r6 = load 8 sp 80
    r8 = add r6 1 32
    r1 = load 8 sp 88
    r4 = add r1 4294967295 32
    store 8 r8 sp 80
    store 8 r4 sp 88
    br .for.cond.i.i6

  .for.cond.i.i:
    r7 = load 8 sp 112
    r5 = icmp sge r7 0 32
    br r5 .for.body.i.i .floorlog2.exit

  .for.body.i.i:
    r7 = load 8 sp 112
    r2 = shl 1 r7 32
    r6 = load 8 sp 96
    r2 = and r6 r2 32
    r2 = icmp ne r2 0 32
    br r2 .floorlog2.exit .if.end.i.i

  .floorlog2.exit:
    r3 = load 8 sp 104
    r1 = sub 32 r3 32
    r11 = sub r1 1 32
    r8 = load 8 sp 40
    r4 = load 8 sp 56
    r5 = call P r10 r11 r8 r4
    store 8 r5 sp 120
    r7 = load 8 sp 48
    r6 = add r7 1 32
    r2 = shl 1 r10 32
    r12 = sub r6 r2 32
    r3 = call P r10 r11 r12 r4
    r1 = load 8 sp 64
    r8 = add r1 1 32
    r5 = shl 1 r11 32
    r13 = sub r8 r5 32
    r7 = load 8 sp 40
    r6 = call P r10 r11 r7 r13
    r2 = call P r10 r11 r12 r13
    r4 = load 8 sp 120
    r1 = call min r4 r3
    r8 = call min r6 r2
    r5 = call min r1 r8
    r7 = udiv r5 2147483648 64
    r7 = mul r7 18446744071562067968 64
    r7 = or r7 r5 64
    call write r7
    r4 = load 8 sp 32
    r9 = mul r4 1 64
    br .while.cond

  .if.end.i.i:
    r3 = load 8 sp 104
    r6 = add r3 1 32
    r2 = load 8 sp 112
    r1 = add r2 4294967295 32
    store 8 r6 sp 104
    store 8 r1 sp 112
    br .for.cond.i.i
end main
