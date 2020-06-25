
; Function area
start area 2:
  .entry:
    ; init sp!
    sp = sub sp 24 64
    store 8 0 sp 0
    store 8 0 sp 8
    store 8 0 sp 16
    br .for.cond

  .for.cond:
    r1 = load 8 sp 0
    r13 = icmp ult r1 arg2 32
    br r13 .for.body .for.end

  .for.body:
    r1 = load 8 sp 0
    r9 = add r1 1 32
    r14 = urem r9 arg2 32
    r10 = mul r1 2 32
    r15 = mul arg1 1 64
    r4 = mul r10 4 64
    r15 = add r15 r4 64
    r16 = load 4 r15 0
    r5 = add r10 1 32
    r6 = mul arg1 1 64
    r7 = mul r5 4 64
    r6 = add r6 r7 64
    r6 = load 4 r6 0
    r11 = mul r14 2 32
    r8 = mul arg1 1 64
    r4 = mul r11 4 64
    r8 = add r8 r4 64
    r8 = load 4 r8 0
    r7 = add r11 1 32
    r4 = mul arg1 1 64
    r2 = mul r7 4 64
    r4 = add r4 r2 64
    r4 = load 4 r4 0
    r2 = mul r16 r4 64
    r3 = mul r6 r8 64
    r12 = sub r2 r3 64
    r1 = sdiv r12 2 64
    r5 = load 8 sp 16
    r1 = add r5 r1 64
    r7 = srem r12 2 64
    r4 = load 8 sp 8
    r7 = add r4 r7 64
    store 8 r9 sp 0
    store 8 r7 sp 8
    store 8 r1 sp 16
    br .for.cond

  .for.end:
    r4 = load 8 sp 8
    r6 = sdiv r4 2 64
    r5 = load 8 sp 16
    r6 = add r5 r6 64
    ret r6
end area

; Function main
start main 0:
  .entry:
    ; init sp!
    sp = sub sp 8 64
    r9 = call read
    r16 = icmp eq r9 0 64
    br r16 .if.then .if.end

  .if.then:
    call write 0
    br .cleanup

  .if.end:
    r2 = mul 8 r9 64
    r15 = malloc r2
    r3 = mul r15 1 64
    r10 = mul 2 r9 64
    store 8 0 sp 0
    br .for.cond

  .cleanup:
    ret 0

  .for.cond:
    r4 = load 8 sp 0
    r5 = udiv r4 2147483648 64
    r5 = mul r5 18446744071562067968 64
    r5 = or r5 r4 64
    r11 = icmp ult r5 r10 64
    br r11 .for.body .for.end

  .for.body:
    r12 = call read
    r6 = urem r12 4294967296 64
    r7 = mul r5 4 64
    r13 = add r3 r7 64
    reset heap
    store 4 r6 r13 0
    r14 = add r4 1 32
    reset stack
    store 8 r14 sp 0
    br .for.cond

  .for.end:
    r8 = urem r9 4294967296 64
    r1 = call area r3 r8
    call write r1
    free r15
    br .cleanup
end main
