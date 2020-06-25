
; Function countSetBits
start countSetBits 1:
  .entry:
    ; init sp!
    sp = sub sp 16 64
    store 8 arg1 sp 0
    store 8 0 sp 8
    br .while.cond

  .while.cond:
    r1 = load 8 sp 0
    r14 = icmp ne r1 0 32
    br r14 .while.body .while.end

  .while.body:
    r13 = and r1 1 32
    r4 = load 8 sp 8
    r12 = add r4 r13 32
    r11 = udiv r1 2 32
    store 8 r11 sp 0
    store 8 r12 sp 8
    br .while.cond

  .while.end:
    r7 = load 8 sp 8
    ret r7
end countSetBits

; Function main
start main 0:
  .entry:
    r15 = call read
    r14 = and r15 4294967295 64
    r13 = call countSetBits r14
    call write r13
    ret 0
end main
