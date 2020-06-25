
; Function countSetBitsRec
start countSetBitsRec 1:
  .entry:
    r7 = icmp eq 0 arg1 32
    br r7 .if.then .if.end

  .if.then:
    r9 = load 4 20480 0
    ret r9

  .if.end:
    r10 = and arg1 15 32
    r1 = udiv r10 2147483648 64
    r1 = mul r1 18446744071562067968 64
    r1 = or r1 r10 64
    r2 = mul r1 4 64
    r11 = add 20480 r2 64
    r12 = load 4 r11 0
    r13 = udiv arg1 16 32
    r14 = call countSetBitsRec r13
    r15 = add r12 r14 32
    ret r15
end countSetBitsRec

; Function main
start main 0:
  .entry:
    r1 = malloc 64
    store 4 0 20480 0
    store 4 1 20484 0
    store 4 1 20488 0
    store 4 2 20492 0
    store 4 1 20496 0
    store 4 2 20500 0
    store 4 2 20504 0
    store 4 3 20508 0
    store 4 1 20512 0
    store 4 2 20516 0
    store 4 2 20520 0
    store 4 3 20524 0
    store 4 2 20528 0
    store 4 3 20532 0
    store 4 3 20536 0
    store 4 4 20540 0
    r2 = call read
    r2 = urem r2 4294967296 64
    r3 = call countSetBitsRec r2
    call write r3
    ret 0
end main
