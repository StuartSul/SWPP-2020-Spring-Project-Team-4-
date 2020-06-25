
; Function gcd
start gcd 2:
  .entry:
    ; init sp!
    sp = sub sp 24 64
    r12 = icmp eq arg1 0 64
    store 8 arg2 sp 0
    br r12 .return .if.end

  .return:
    r2 = load 8 sp 0
    ret r2

  .if.end:
    r11 = icmp eq arg2 0 64
    store 8 arg1 sp 0
    br r11 .return .if.end3

  .if.end3:
    r10 = icmp ugt arg1 arg2 64
    br r10 .if.then5 .if.else

  .if.then5:
    r13 = urem arg1 arg2 64
    store 8 r13 sp 8
    store 8 arg2 sp 16
    br .if.end7

  .if.else:
    r9 = urem arg2 arg1 64
    store 8 arg1 sp 8
    store 8 r9 sp 16
    br .if.end7

  .if.end7:
    r7 = load 8 sp 8
    r1 = load 8 sp 16
    r8 = call gcd r7 r1
    store 8 r8 sp 0
    br .return
end gcd

; Function main
start main 0:
  .entry:
    r16 = call read
    r15 = call read
    r14 = call gcd r16 r15
    call write r14
    ret 0
end main
