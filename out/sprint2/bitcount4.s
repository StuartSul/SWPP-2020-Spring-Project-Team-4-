
; Function countSetBits
start countSetBits 1:
  .entry:
    r9 = and arg1 255 32
    r2 = udiv r9 2147483648 64
    r2 = mul r2 18446744071562067968 64
    r2 = or r2 r9 64
    r5 = mul r2 4 64
    r10 = add 20480 r5 64
    r11 = load 4 r10 0
    r12 = udiv arg1 256 32
    r13 = and r12 255 32
    r1 = udiv r13 2147483648 64
    r1 = mul r1 18446744071562067968 64
    r1 = or r1 r13 64
    r5 = mul r1 4 64
    r14 = add 20480 r5 64
    r15 = load 4 r14 0
    r16 = add r11 r15 32
    r8 = udiv arg1 65536 32
    r8 = and r8 255 32
    r7 = udiv r8 2147483648 64
    r7 = mul r7 18446744071562067968 64
    r7 = or r7 r8 64
    r6 = mul r7 4 64
    r4 = add 20480 r6 64
    r4 = load 4 r4 0
    r4 = add r16 r4 32
    r5 = udiv arg1 16777216 32
    r6 = udiv r5 2147483648 64
    r6 = mul r6 18446744071562067968 64
    r6 = or r6 r5 64
    r2 = mul r6 4 64
    r3 = add 20480 r2 64
    r3 = load 4 r3 0
    r4 = add r4 r3 32
    ret r4
end countSetBits

; Function main
start main 0:
  .entry:
    ; init sp!
    sp = sub sp 8 64
    r1 = malloc 1024
    store 4 0 20480 0
    store 8 0 sp 0
    br .for.cond

  .for.cond:
    r4 = load 8 sp 0
    r9 = icmp slt r4 256 32
    br r9 .for.body .for.end

  .for.body:
    r10 = and r4 1 32
    r11 = sdiv r4 2 32
    r6 = udiv r11 2147483648 64
    r6 = mul r6 18446744071562067968 64
    r6 = or r6 r11 64
    r2 = mul r6 4 64
    r12 = add 20480 r2 64
    r13 = load 4 r12 0
    r14 = add r10 r13 32
    r8 = udiv r4 2147483648 64
    r8 = mul r8 18446744071562067968 64
    r8 = or r8 r4 64
    r5 = mul r8 4 64
    r15 = add 20480 r5 64
    store 4 r14 r15 0
    r16 = add r4 1 32
    store 8 r16 sp 0
    br .for.cond

  .for.end:
    r3 = call read
    r3 = urem r3 4294967296 64
    r7 = call countSetBits r3
    r2 = udiv r7 2147483648 64
    r2 = mul r2 18446744071562067968 64
    r2 = or r2 r7 64
    call write r2
    ret 0
end main
