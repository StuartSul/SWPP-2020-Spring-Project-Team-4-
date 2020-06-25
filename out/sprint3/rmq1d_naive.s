
; Function malloc_upto_8
start malloc_upto_8 1:
  .entry:
    r13 = add arg1 7 64
    r14 = udiv r13 8 64
    r15 = mul r14 8 64
    r16 = malloc r15
    ret r16
end malloc_upto_8

; Function min_element
start min_element 2:
  .entry:
    r11 = load 4 arg1 0
    r8 = mul arg1 1 64
    r9 = mul r11 1 64
    br .while.cond

  .while.cond:
    r12 = icmp ne r8 arg2 64
    br r12 .while.body .while.end

  .while.body:
    r13 = load 4 r8 0
    r14 = icmp slt r13 r9 32
    r10 = mul r9 1 64
    br r14 .if.then .if.end

  .while.end:
    ret r9

  .if.then:
    r15 = load 4 r8 0
    r10 = mul r15 1 64
    br .if.end

  .if.end:
    r16 = add r8 4 64
    r8 = mul r16 1 64
    r9 = mul r10 1 64
    br .while.cond
end min_element

; Function main
start main 0:
  .entry:
    ; init sp!
    sp = sub sp 24 64
    r2 = call read
    r2 = urem r2 4294967296 64
    store 8 r2 sp 0
    r3 = udiv r2 2147483648 64
    r3 = mul r3 18446744071562067968 64
    r3 = or r3 r2 64
    r3 = mul 4 r3 64
    r3 = add r3 7 64
    r3 = udiv r3 8 64
    r3 = mul r3 8 64
    r4 = malloc r3
    r5 = mul r4 1 64
    store 8 0 sp 8
    br .for.cond

  .for.cond:
    r6 = load 8 sp 8
    r2 = load 8 sp 0
    r10 = icmp slt r6 r2 32
    r11 = call read
    r7 = urem r11 4294967296 64
    store 8 r7 sp 16
    r9 = mul r7 1 64
    br r10 .for.body .while.cond

  .for.body:
    r6 = load 8 sp 8
    r8 = udiv r6 2147483648 64
    r8 = mul r8 18446744071562067968 64
    r8 = or r8 r6 64
    r1 = mul r8 4 64
    r12 = add r5 r1 64
    r7 = load 8 sp 16
    reset heap
    store 4 r7 r12 0
    r13 = add r6 1 32
    reset stack
    store 8 r13 sp 8
    br .for.cond

  .while.cond:
    r14 = add r9 4294967295 32
    r15 = icmp ne r9 0 32
    br r15 .codeRepl .while.end

  .codeRepl:
    r16 = call read
    r1 = urem r16 4294967296 64
    r3 = call read
    r3 = urem r3 4294967296 64
    r4 = udiv r1 2147483648 64
    r4 = mul r4 18446744071562067968 64
    r4 = or r4 r1 64
    r8 = mul r4 4 64
    r2 = add r5 r8 64
    r8 = udiv r3 2147483648 64
    r8 = mul r8 18446744071562067968 64
    r8 = or r8 r3 64
    r6 = mul r8 4 64
    r7 = add r5 r6 64
    r7 = add r7 4 64
    r6 = call min_element r2 r7
    r1 = udiv r6 2147483648 64
    r1 = mul r1 18446744071562067968 64
    r1 = or r1 r6 64
    call write r1
    r9 = mul r14 1 64
    br .while.cond

  .while.end:
    ret 0
end main

; Function main.while.body
start main.while.body 1:
  .newFuncRoot:
    r1 = call read
    r1 = urem r1 4294967296 64
    r2 = call read
    r2 = urem r2 4294967296 64
    r3 = udiv r1 2147483648 64
    r3 = mul r3 18446744071562067968 64
    r3 = or r3 r1 64
    r12 = mul arg1 1 64
    r4 = mul r3 4 64
    r12 = add r12 r4 64
    r5 = udiv r2 2147483648 64
    r5 = mul r5 18446744071562067968 64
    r5 = or r5 r2 64
    r6 = mul arg1 1 64
    r7 = mul r5 4 64
    r6 = add r6 r7 64
    r13 = add r6 4 64
    r14 = load 4 r12 0
    r9 = mul r12 1 64
    r10 = mul r14 1 64
    br .while.cond.i

  .while.cond.i:
    r15 = icmp ne r9 r13 64
    br r15 .while.body.i .min_element.exit

  .while.body.i:
    r16 = load 4 r9 0
    r8 = icmp slt r16 r10 32
    r11 = mul r10 1 64
    br r8 .if.then.i .if.end.i

  .min_element.exit:
    r4 = udiv r10 2147483648 64
    r4 = mul r4 18446744071562067968 64
    r4 = or r4 r10 64
    call write r4
    ret 0

  .if.then.i:
    r7 = load 4 r9 0
    r11 = mul r7 1 64
    br .if.end.i

  .if.end.i:
    r1 = add r9 4 64
    r9 = mul r1 1 64
    r10 = mul r11 1 64
    br .while.cond.i
end main.while.body
