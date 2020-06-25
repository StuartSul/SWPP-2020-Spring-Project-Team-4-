
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
    sp = sub sp 8 64
    r16 = call read
    r2 = urem r16 4294967296 64
    r5 = udiv r2 2147483648 64
    r5 = mul r5 18446744071562067968 64
    r5 = or r5 r2 64
    r5 = mul 4 r5 64
    r3 = call malloc_upto_8 r5
    r7 = mul r3 1 64
    store 8 0 sp 0
    br .for.cond

  .for.cond:
    r1 = load 8 sp 0
    r10 = icmp slt r1 r2 32
    r11 = call read
    r8 = urem r11 4294967296 64
    r9 = mul r8 1 64
    br r10 .for.body .while.cond

  .for.body:
    r4 = udiv r1 2147483648 64
    r4 = mul r4 18446744071562067968 64
    r4 = or r4 r1 64
    r6 = mul r4 4 64
    r12 = add r7 r6 64
    store 4 r8 r12 0
    r13 = add r1 1 32
    store 8 r13 sp 0
    br .for.cond

  .while.cond:
    r14 = add r9 4294967295 32
    r15 = icmp ne r9 0 32
    br r15 .codeRepl .while.end

  .codeRepl:
    call main.while.body r7
    r9 = mul r14 1 64
    br .while.cond

  .while.end:
    ret 0
end main

; Function main.while.body
start main.while.body 1:
  .newFuncRoot:
    r6 = call read
    r2 = urem r6 4294967296 64
    r7 = call read
    r5 = urem r7 4294967296 64
    r4 = udiv r2 2147483648 64
    r4 = mul r4 18446744071562067968 64
    r4 = or r4 r2 64
    r8 = mul arg1 1 64
    r1 = mul r4 4 64
    r8 = add r8 r1 64
    r1 = udiv r5 2147483648 64
    r1 = mul r1 18446744071562067968 64
    r1 = or r1 r5 64
    r9 = mul arg1 1 64
    r3 = mul r1 4 64
    r9 = add r9 r3 64
    r10 = add r9 4 64
    r11 = call min_element r8 r10
    r3 = udiv r11 2147483648 64
    r3 = mul r3 18446744071562067968 64
    r3 = or r3 r11 64
    call write r3
    ret 0
end main.while.body
