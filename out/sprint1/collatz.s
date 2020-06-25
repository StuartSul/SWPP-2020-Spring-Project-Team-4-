
; Function collatz
start collatz 2:
  .entry:
    ; init sp!
    sp = sub sp 64 64
    call write arg2
    r2 = icmp ule arg2 1 32
    store 8 arg2 sp 8
    br r2 .return .if.end

  .return:
    r3 = load 8 sp 8
    ret r3

  .if.end:
    r4 = load 2 arg1 0
    r5 = and r4 32768 64
    r5 = sub 0 r5 64
    r5 = or r5 r4 64
    r7 = icmp slt r5 0 32
    store 8 4294967295 sp 8
    br r7 .return .if.end6

  .if.end6:
    r16 = load 2 arg1 0
    r8 = and r16 32768 64
    r8 = sub 0 r8 64
    r8 = or r8 r16 64
    r15 = add r8 1 32
    r14 = and r15 65535 64
    store 2 r14 arg1 0
    r13 = urem arg2 2 32
    r12 = icmp eq r13 0 32
    br r12 .cond.true .cond.false

  .cond.true:
    r6 = udiv arg2 2 32
    store 8 r6 sp 56
    br .cond.end

  .cond.false:
    r11 = mul 3 arg2 32
    r10 = add r11 1 32
    store 8 r10 sp 56
    br .cond.end

  .cond.end:
    r3 = load 8 sp 56
    r9 = call collatz arg1 r3
    store 8 r9 sp 8
    br .return
end collatz

; Function main
start main 0:
  .entry:
    ; init sp!
    sp = sub sp 8 64
    r11 = add sp 0 64
    r15 = call read
    r14 = and r15 4294967295 64
    store 2 0 r11 0
    r16 = call collatz r11 r14
    r13 = load 2 r11 0
    r1 = and r13 32768 64
    r1 = sub 0 r1 64
    r12 = or r1 r13 64
    call write r12
    ret 0
end main
