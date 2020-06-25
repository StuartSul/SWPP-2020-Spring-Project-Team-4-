
; Function countSetBitsRec
start countSetBitsRec 1:
  .entry:
    ; init sp!
    sp = sub sp 8 64
    r15 = icmp eq 0 arg1 32
    br r15 .if.then .if.end

  .if.then:
    r13 = load 4 20480 0
    store 8 r13 sp 0
    br .cleanup

  .if.end:
    r12 = and arg1 15 32
    r4 = and r12 2147483648 64
    r4 = sub 0 r4 64
    r14 = or r4 r12 64
    r5 = mul r14 4 64
    r5 = add 20480 r5 64
    r11 = mul r5 1 64
    r10 = load 4 r11 0
    r6 = udiv arg1 16 32
    r9 = call countSetBitsRec r6
    r8 = add r10 r9 32
    store 8 r8 sp 0
    br .cleanup

  .cleanup:
    r3 = load 8 sp 0
    ret r3
end countSetBitsRec

; Function main
start main 0:
  .entry:
    ; init sp!
    sp = sub sp 88 64
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
    store 8 20496 sp 0
    store 4 3 20524 0
    store 8 20500 sp 8
    store 4 2 20528 0
    store 8 20504 sp 16
    store 4 3 20532 0
    store 8 20508 sp 24
    store 4 3 20536 0
    store 8 20512 sp 32
    store 4 4 20540 0
    r15 = call read
    r14 = and r15 4294967295 64
    r13 = call countSetBitsRec r14
    call write r13
    ret 0
end main
