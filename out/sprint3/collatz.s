
; Function collatz
start collatz 2:
  .entry:
    ; init sp!
    sp = sub sp 8 64
    r9 = mul arg2 1 64
    br .tailrecurse

  .tailrecurse:
    call write r9
    r11 = icmp ule r9 1 32
    store 8 r9 sp 0
    br r11 .return .if.end

  .return:
    r1 = load 8 sp 0
    ret r1

  .if.end:
    r12 = load 2 arg1 0
    r2 = udiv r12 32768 64
    r2 = mul r2 18446744073709518848 64
    r2 = or r2 r12 64
    r13 = icmp slt r2 0 32
    store 8 4294967295 sp 0
    br r13 .return .if.end6

  .if.end6:
    r14 = load 2 arg1 0
    r3 = udiv r14 32768 64
    r3 = mul r3 18446744073709518848 64
    r3 = or r3 r14 64
    r15 = add r3 1 32
    r4 = urem r15 65536 64
    store 2 r4 arg1 0
    r16 = urem r9 2 32
    r5 = icmp eq r16 0 32
    br r5 .cond.true .cond.false

  .cond.true:
    r6 = udiv r9 2 32
    r10 = mul r6 1 64
    br .cond.end

  .cond.false:
    r7 = mul 3 r9 32
    r7 = add r7 1 32
    r10 = mul r7 1 64
    br .cond.end

  .cond.end:
    r9 = mul r10 1 64
    br .tailrecurse
end collatz

; Function main
start main 0:
  .entry:
    ; init sp!
    sp = sub sp 8 64
    r11 = add sp 0 64
    r12 = call read
    r2 = urem r12 4294967296 64
    store 2 0 r11 0
    r14 = call collatz r11 r2
    r13 = load 2 r11 0
    r3 = udiv r13 32768 64
    r3 = mul r3 18446744073709518848 64
    r3 = or r3 r13 64
    call write r3
    ret 0
end main
