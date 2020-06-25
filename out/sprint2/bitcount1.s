
; Function countSetBits
start countSetBits 1:
  .entry:
    ; init sp!
    sp = sub sp 8 64
    store 8 0 sp 0
    r11 = mul arg1 1 64
    br .while.cond

  .while.cond:
    r1 = load 8 sp 0
    r12 = icmp ne r11 0 32
    br r12 .while.body .while.end

  .while.body:
    r13 = and r11 1 32
    r14 = add r1 r13 32
    r15 = udiv r11 2 32
    store 8 r14 sp 0
    r11 = mul r15 1 64
    br .while.cond

  .while.end:
    ret r1
end countSetBits

; Function main
start main 0:
  .entry:
    r13 = call read
    r2 = urem r13 4294967296 64
    r14 = call countSetBits r2
    call write r14
    ret 0
end main
