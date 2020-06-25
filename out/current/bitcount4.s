
; Function countSetBits
start countSetBits 1:
  .entry:
    r9 = and arg1 255 32
    r1 = udiv r9 2147483648 64
    r1 = mul r1 18446744071562067968 64
    r1 = or r1 r9 64
    r2 = mul r1 4 64
    r10 = add 20480 r2 64
    r11 = load 4 r10 0
    r12 = udiv arg1 256 32
    r13 = and r12 255 32
    r3 = udiv r13 2147483648 64
    r3 = mul r3 18446744071562067968 64
    r3 = or r3 r13 64
    r4 = mul r3 4 64
    r14 = add 20480 r4 64
    r15 = load 4 r14 0
    r16 = add r11 r15 32
    r5 = udiv arg1 65536 32
    r5 = and r5 255 32
    r6 = udiv r5 2147483648 64
    r6 = mul r6 18446744071562067968 64
    r6 = or r6 r5 64
    r8 = mul r6 4 64
    r7 = add 20480 r8 64
    r7 = load 4 r7 0
    r7 = add r16 r7 32
    r2 = udiv arg1 16777216 32
    r4 = udiv r2 2147483648 64
    r4 = mul r4 18446744071562067968 64
    r4 = or r4 r2 64
    r1 = mul r4 4 64
    r8 = add 20480 r1 64
    r8 = load 4 r8 0
    r7 = add r7 r8 32
    ret r7
end countSetBits

; Function main
start main 0:
  .entry:
    ; init sp!
    sp = sub sp 8 64
    r1 = malloc 1024
    store 4 0 20480 0
    reset stack
    store 8 0 sp 0
    br .for.cond

  .for.cond:
    r3 = load 8 sp 0
    r9 = icmp slt r3 256 32
    br r9 .for.body .for.end

  .for.body:
    r10 = and r3 1 32
    r11 = sdiv r3 2 32
    r4 = udiv r11 2147483648 64
    r4 = mul r4 18446744071562067968 64
    r4 = or r4 r11 64
    r5 = mul r4 4 64
    r12 = add 20480 r5 64
    r13 = load 4 r12 0
    r14 = add r10 r13 32
    r6 = udiv r3 2147483648 64
    r6 = mul r6 18446744071562067968 64
    r6 = or r6 r3 64
    r7 = mul r6 4 64
    r15 = add 20480 r7 64
    store 4 r14 r15 0
    r16 = add r3 1 32
    store 8 r16 sp 0
    br .for.cond

  .for.end:
    r8 = call read
    r8 = urem r8 4294967296 64
    r1 = call countSetBits r8
    r2 = udiv r1 2147483648 64
    r2 = mul r2 18446744071562067968 64
    r2 = or r2 r1 64
    call write r2
    ret 0
end main
