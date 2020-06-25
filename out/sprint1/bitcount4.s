
; Function countSetBits
start countSetBits 1:
  .entry:
    ; init sp!
    sp = sub sp 64 64
    r9 = add sp 56 64
    r2 = and arg1 255 32
    r3 = and r2 2147483648 64
    r3 = sub 0 r3 64
    r3 = or r3 r2 64
    r5 = mul r3 4 64
    r5 = add 20480 r5 64
    r6 = mul r5 1 64
    r7 = load 4 r6 0
    r1 = udiv arg1 256 32
    r16 = and r1 255 32
    r5 = and r16 2147483648 64
    r5 = sub 0 r5 64
    r15 = or r5 r16 64
    r8 = mul r15 4 64
    r8 = add 20480 r8 64
    r14 = mul r8 1 64
    r13 = load 4 r14 0
    r12 = add r7 r13 32
    r8 = udiv arg1 65536 32
    r11 = and r8 255 32
    r5 = and r11 2147483648 64
    r5 = sub 0 r5 64
    r10 = or r5 r11 64
    call countSetBits.outline r10 r12 arg1 r9
    r5 = load 4 r9 0
    ret r5
end countSetBits

; Function main
start main 0:
  .entry:
    ; init sp!
    sp = sub sp 64 64
    r1 = malloc 1024
    store 4 0 20480 0
    store 8 0 sp 0
    br .for.cond

  .for.cond:
    r2 = load 8 sp 0
    r4 = icmp slt r2 256 32
    br r4 .for.body .for.end

  .for.body:
    r6 = and r2 1 32
    r8 = sdiv r2 2 32
    r1 = and r8 2147483648 64
    r1 = sub 0 r1 64
    r1 = or r1 r8 64
    r5 = mul r1 4 64
    r5 = add 20480 r5 64
    r7 = mul r5 1 64
    r16 = load 4 r7 0
    r15 = add r6 r16 32
    r5 = and r2 2147483648 64
    r5 = sub 0 r5 64
    r14 = or r5 r2 64
    r3 = mul r14 4 64
    r3 = add 20480 r3 64
    r13 = mul r3 1 64
    store 4 r15 r13 0
    r3 = add r2 1 32
    store 8 r3 sp 0
    br .for.cond

  .for.end:
    r5 = call read
    r12 = and r5 4294967295 64
    r11 = call countSetBits r12
    r2 = and r11 2147483648 64
    r2 = sub 0 r2 64
    r10 = or r2 r11 64
    call write r10
    ret 0
end main

; Function countSetBits.outline
start countSetBits.outline 4:
  .newFuncRoot:
    r2 = mul arg1 4 64
    r2 = add 20480 r2 64
    r15 = mul r2 1 64
    r14 = load 4 r15 0
    r16 = add arg2 r14 32
    r9 = udiv arg3 16777216 32
    r5 = and r9 2147483648 64
    r5 = sub 0 r5 64
    r13 = or r5 r9 64
    r6 = mul r13 4 64
    r6 = add 20480 r6 64
    r12 = mul r6 1 64
    r11 = load 4 r12 0
    r10 = add r16 r11 32
    store 4 r10 arg4 0
    ret 0
end countSetBits.outline
