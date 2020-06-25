
; Function countSetBits
start countSetBits 1:
  .entry:
    ; init sp!
    sp = sub sp 8 64
    r11 = icmp eq arg1 0 32
    store 8 0 sp 0
    br r11 .return .if.else

  .return:
    r2 = load 8 sp 0
    ret r2

  .if.else:
    r12 = and arg1 1 32
    r13 = udiv arg1 2 32
    r14 = call countSetBits r13
    r15 = add r12 r14 32
    store 8 r15 sp 0
    br .return
end countSetBits

; Function main
start main 0:
  .entry:
    r13 = call read
    r2 = urem r13 4294967296 64
    r14 = call countSetBits r2
    r6 = udiv r14 2147483648 64
    r6 = mul r6 18446744071562067968 64
    r6 = or r6 r14 64
    call write r6
    ret 0
end main
