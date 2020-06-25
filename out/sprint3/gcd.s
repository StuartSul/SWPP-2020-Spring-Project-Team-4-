
; Function gcd
start gcd 2:
  .entry:
    r7 = mul arg1 1 64
    r8 = mul arg2 1 64
    br .tailrecurse

  .tailrecurse:
    r12 = icmp eq r7 0 64
    r11 = mul r8 1 64
    br r12 .return .if.end

  .return:
    ret r11

  .if.end:
    r13 = icmp eq r8 0 64
    r11 = mul r7 1 64
    br r13 .return .if.end3

  .if.end3:
    r14 = icmp ugt r7 r8 64
    br r14 .if.then5 .if.else

  .if.then5:
    r15 = urem r7 r8 64
    r9 = mul r15 1 64
    r10 = mul r8 1 64
    br .if.end7

  .if.else:
    r16 = urem r8 r7 64
    r9 = mul r7 1 64
    r10 = mul r16 1 64
    br .if.end7

  .if.end7:
    r7 = mul r9 1 64
    r8 = mul r10 1 64
    br .tailrecurse
end gcd

; Function main
start main 0:
  .entry:
    r10 = call read
    r11 = call read
    r5 = mul r10 1 64
    r6 = mul r11 1 64
    br .tailrecurse.i

  .tailrecurse.i:
    r12 = icmp eq r5 0 64
    r9 = mul r6 1 64
    br r12 .gcd.exit .if.end.i

  .gcd.exit:
    call write r9
    ret 0

  .if.end.i:
    r13 = icmp eq r6 0 64
    r9 = mul r5 1 64
    br r13 .gcd.exit .if.end3.i

  .if.end3.i:
    r14 = icmp ugt r5 r6 64
    br r14 .if.then5.i .if.else.i

  .if.then5.i:
    r15 = urem r5 r6 64
    r7 = mul r15 1 64
    r8 = mul r6 1 64
    br .if.end7.i

  .if.else.i:
    r16 = urem r6 r5 64
    r7 = mul r5 1 64
    r8 = mul r16 1 64
    br .if.end7.i

  .if.end7.i:
    r5 = mul r7 1 64
    r6 = mul r8 1 64
    br .tailrecurse.i
end main
