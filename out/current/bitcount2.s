
; Function countSetBits
start countSetBits 1:
  .entry:
    ; init sp!
    sp = sub sp 8 64
    store 8 0 sp 0
    r11 = mul arg1 1 64
    br .tailrecurse

  .tailrecurse:
    r1 = load 8 sp 0
    r12 = icmp eq r11 0 32
    br r12 .return .if.else

  .return:
    ret r1

  .if.else:
    r13 = and r11 1 32
    r14 = udiv r11 2 32
    r15 = add r13 r1 32
    store 8 r15 sp 0
    r11 = mul r14 1 64
    br .tailrecurse
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
    br .tailrecurse.i

  .tailrecurse.i:
    r3 = load 8 sp 0
    r9 = icmp eq r8 0 32
    br r9 .countSetBits.exit .if.else.i

  .countSetBits.exit:
    r4 = udiv r3 2147483648 64
    r4 = mul r4 18446744071562067968 64
    r4 = or r4 r3 64
    call write r4
    ret 0

  .if.else.i:
    r10 = and r8 1 32
    r11 = udiv r8 2 32
    r12 = add r10 r3 32
    store 8 r12 sp 0
    r8 = mul r11 1 64
    br .tailrecurse.i
end main
