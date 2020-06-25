
; Function get_inputs
start get_inputs 1:
  .entry:
    ; init sp!
    sp = sub sp 16 64
    r11 = icmp eq arg1 0 64
    store 8 0 sp 0
    br r11 .return .if.end

  .return:
    r1 = load 8 sp 0
    ret r1

  .if.end:
    r12 = mul arg1 8 64
    r13 = malloc r12
    r2 = mul r13 1 64
    store 8 0 sp 8
    br .for.cond

  .for.cond:
    r3 = load 8 sp 8
    r7 = icmp ult r3 arg1 64
    store 8 r2 sp 0
    br r7 .for.body .return

  .for.body:
    r8 = call read
    r4 = mul r3 8 64
    r9 = add r2 r4 64
    reset heap
    store 8 r8 r9 0
    r10 = add r3 1 64
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
    br r1 .for.end15 .for.cond.preheader

  .for.end15:
    ret 0

  .for.cond.preheader:
    r14 = sub arg1 1 64
    store 8 0 sp 0
    br .for.cond

  .for.cond:
    r2 = load 8 sp 0
    r15 = icmp ult r2 arg1 64
    r9 = mul r14 1 64
    br r15 .for.cond2 .for.end15

  .for.cond2:
    r16 = icmp ugt r9 r2 64
    br r16 .for.body5 .for.inc14

  .for.body5:
    r10 = mul arg2 1 64
    r3 = mul r9 8 64
    r10 = add r10 r3 64
    r11 = load 8 r10 0
    r4 = sub r9 1 64
    r12 = mul arg2 1 64
    r5 = mul r4 8 64
    r12 = add r12 r5 64
    r13 = load 8 r12 0
    r6 = icmp ult r11 r13 64
    br r6 .if.then9 .for.inc

  .for.inc14:
    r7 = add r2 1 64
    store 8 r7 sp 0
    br .for.cond

  .if.then9:
    store 8 r13 r10 0
    store 8 r11 r12 0
    br .for.inc

  .for.inc:
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
    r1 = load 8 sp 0
    r11 = icmp ult r1 arg1 64
    br r11 .for.body .for.end

  .for.body:
    r12 = mul arg2 1 64
    r2 = mul r1 8 64
    r12 = add r12 r2 64
    r13 = load 8 r12 0
    call write r13
    r14 = add r1 1 64
    store 8 r14 sp 0
    br .for.cond
end put_inputs

; Function main
start main 0:
  .entry:
    ; init sp!
    sp = sub sp 8 64
    r7 = call read
    r12 = icmp eq r7 0 64
    br r12 .cleanup .if.end.i

  .cleanup:
    ret 0

  .if.end.i:
    r13 = mul r7 8 64
    r14 = malloc r13
    r2 = mul r14 1 64
    store 8 0 sp 0
    br .for.cond.i

  .for.cond.i:
    r3 = load 8 sp 0
    r8 = icmp ult r3 r7 64
    br r8 .for.body.i .get_inputs.exit

  .for.body.i:
    r9 = call read
    r4 = mul r3 8 64
    r10 = add r2 r4 64
    reset heap
    store 8 r9 r10 0
    r11 = add r3 1 64
    reset stack
    store 8 r11 sp 0
    br .for.cond.i

  .get_inputs.exit:
    call sort r7 r2
    call put_inputs r7 r2
    br .cleanup
end main
