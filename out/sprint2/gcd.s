
; Function gcd
start gcd 2:
  .entry:
    r11 = icmp eq arg1 0 64
    r8 = mul arg2 1 64
    br r11 .return .if.end

  .return:
    ret r8

  .if.end:
    r12 = icmp eq arg2 0 64
    r8 = mul arg1 1 64
    br r12 .return .if.end3

  .if.end3:
    r13 = icmp ugt arg1 arg2 64
    br r13 .if.then5 .if.else

  .if.then5:
    r14 = urem arg1 arg2 64
    r9 = mul r14 1 64
    r10 = mul arg2 1 64
    br .if.end7

  .if.else:
    r15 = urem arg2 arg1 64
    r9 = mul arg1 1 64
    r10 = mul r15 1 64
    br .if.end7

  .if.end7:
    r16 = call gcd r9 r10
    r8 = mul r16 1 64
    br .return
end gcd

; Function main
start main 0:
  .entry:
    r14 = call read
    r15 = call read
    r16 = call gcd r14 r15
    call write r16
    ret 0
end main
