
; Function countSetBits
start countSetBits 1:
  .entry:
    ; init sp!
    sp = sub sp 8 64
    r15 = icmp eq arg1 0 32
    store 8 0 sp 0
    br r15 .return .if.else

  .return:
    r2 = load 8 sp 0
    ret r2

  .if.else:
    r14 = and arg1 1 32
    r11 = udiv arg1 2 32
    r13 = call countSetBits r11
    r12 = add r14 r13 32
    store 8 r12 sp 0
    br .return
end countSetBits

; Function main
start main 0:
  .entry:
    r16 = call read
    r15 = and r16 4294967295 64
    r14 = call countSetBits r15
    r1 = and r14 2147483648 64
    r1 = sub 0 r1 64
    r13 = or r1 r14 64
    call write r13
    ret 0
end main
