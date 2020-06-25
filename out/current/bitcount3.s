
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
    r13 = sub r11 1 32
    r14 = and r11 r13 32
    r15 = add r1 1 32
    store 8 r15 sp 0
    r11 = mul r14 1 64
    br .while.cond

  .while.end:
    ret r1
end countSetBits

; Function main
start main 0:
  .entry:
    ; init sp!
    sp = sub sp 8 64
    r13 = call read
    r2 = urem r13 4294967296 64
    store 8 0 sp 0
    r8 = mul r2 1 64
    br .while.cond.i

  .while.cond.i:
    r3 = load 8 sp 0
    r9 = icmp ne r8 0 32
    br r9 .while.body.i .countSetBits.exit

  .while.body.i:
    r10 = sub r8 1 32
    r11 = and r8 r10 32
    r12 = add r3 1 32
    store 8 r12 sp 0
    r8 = mul r11 1 64
    br .while.cond.i

  .countSetBits.exit:
    call write r3
    ret 0
end main
