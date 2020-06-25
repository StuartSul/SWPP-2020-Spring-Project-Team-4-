
; Function get_inputs
start get_inputs 1:
  .entry:
    ; init sp!
    sp = sub sp 16 64
    r11 = icmp eq arg1 0 64
    store 8 0 sp 0
    br r11 .return .if.end

  .return:
    r2 = load 8 sp 0
    ret r2

  .if.end:
    r12 = mul arg1 8 64
    r13 = malloc r12
    r1 = mul r13 1 64
    store 8 0 sp 8
    br .for.cond

  .for.cond:
    r4 = load 8 sp 8
    r7 = icmp ult r4 arg1 64
    store 8 r1 sp 0
    br r7 .for.body .return

  .for.body:
    r8 = call read
    r3 = mul r4 8 64
    r9 = add r1 r3 64
    store 8 r8 r9 0
    r10 = add r4 1 64
    reset stack
    store 8 r10 sp 8
    br .for.cond
end get_inputs

; Function sort
start sort 2:
  .entry:
    ; init sp!
    sp = sub sp 8 64
    r1 = icmp eq arg1 0 64
    br r1 .for.end15 .if.end

  .for.end15:
    ret 0

  .if.end:
    r14 = sub arg1 1 64
    store 8 0 sp 0
    br .for.cond

  .for.cond:
    r5 = load 8 sp 0
    r15 = icmp ult r5 arg1 64
    r9 = mul r14 1 64
    br r15 .for.cond2 .for.end15

  .for.cond2:
    r16 = icmp ugt r9 r5 64
    br r16 .for.body5 .for.cond.cleanup4

  .for.body5:
    r10 = mul arg2 1 64
    r4 = mul r9 8 64
    r10 = add r10 r4 64
    r11 = load 8 r10 0
    r7 = sub r9 1 64
    r12 = mul arg2 1 64
    r3 = mul r7 8 64
    r12 = add r12 r3 64
    r13 = load 8 r12 0
    r6 = icmp ult r11 r13 64
    br r6 .if.then9 .if.end13

  .for.cond.cleanup4:
    r4 = add r5 1 64
    store 8 r4 sp 0
    br .for.cond

  .if.then9:
    store 8 r13 r10 0
    store 8 r11 r12 0
    br .if.end13

  .if.end13:
    r8 = add r9 18446744073709551615 64
    r9 = mul r8 1 64
    br .for.cond2
end sort

; Function put_inputs
start put_inputs 2:
  .entry:
    ; init sp!
    sp = sub sp 8 64
    r15 = icmp eq arg1 0 64
    store 8 0 sp 0
    br r15 .for.end .for.cond

  .for.end:
    ret 0

  .for.cond:
    r2 = load 8 sp 0
    r11 = icmp ult r2 arg1 64
    br r11 .for.body .for.end

  .for.body:
    r12 = mul arg2 1 64
    r7 = mul r2 8 64
    r12 = add r12 r7 64
    r13 = load 8 r12 0
    call write r13
    r14 = add r2 1 64
    store 8 r14 sp 0
    br .for.cond
end put_inputs

; Function main
start main 0:
  .entry:
    r14 = call read
    r16 = icmp eq r14 0 64
    br r16 .cleanup .if.end

  .cleanup:
    ret 0

  .if.end:
    r15 = call get_inputs r14
    call sort r14 r15
    call put_inputs r14 r15
    br .cleanup
end main
