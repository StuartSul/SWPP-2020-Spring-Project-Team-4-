
; Function collatz
start collatz 2:
  .entry:
    ; init sp!
    sp = sub sp 8 64
    call write arg2
    r10 = icmp ule arg2 1 32
    store 8 arg2 sp 0
    br r10 .return .if.end

  .return:
    r2 = load 8 sp 0
    ret r2

  .if.end:
    r11 = load 2 arg1 0
    r6 = udiv r11 32768 64
    r6 = mul r6 18446744073709518848 64
    r6 = or r6 r11 64
    r12 = icmp slt r6 0 32
    store 8 4294967295 sp 0
    br r12 .return .if.end6

  .if.end6:
    r13 = load 2 arg1 0
    r4 = udiv r13 32768 64
    r4 = mul r4 18446744073709518848 64
    r4 = or r4 r13 64
    r14 = add r4 1 32
    r1 = urem r14 65536 64
    store 2 r1 arg1 0
    r15 = urem arg2 2 32
    r16 = icmp eq r15 0 32
    br r16 .cond.true .cond.false

  .cond.true:
    r3 = udiv arg2 2 32
    r9 = mul r3 1 64
    br .cond.end

  .cond.false:
    r5 = mul 3 arg2 32
    r5 = add r5 1 32
    r9 = mul r5 1 64
    br .cond.end

  .cond.end:
    r8 = call collatz arg1 r9
    store 8 r8 sp 0
    br .return
end collatz

; Function main
start main 0:
  .entry:
    ; init sp!
    sp = sub sp 8 64
    r11 = add sp 0 64
    r12 = call read
    r3 = urem r12 4294967296 64
    store 2 0 r11 0
    r14 = call collatz r11 r3
    r13 = load 2 r11 0
    r8 = udiv r13 32768 64
    r8 = mul r8 18446744073709518848 64
    r8 = or r8 r13 64
    call write r8
    ret 0
end main
