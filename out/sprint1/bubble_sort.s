
; Function get_inputs
start get_inputs 1:
  .entry:
    ; init sp!
    sp = sub sp 16 64
    r14 = icmp eq arg1 0 64
    store 8 0 sp 0
    br r14 .return .if.end

  .return:
    r2 = load 8 sp 0
    ret r2

  .if.end:
    r13 = mul arg1 8 64
    r12 = malloc r13
    r7 = mul r12 1 64
    store 8 0 sp 8
    br .for.cond

  .for.cond:
    r4 = load 8 sp 8
    r11 = icmp ult r4 arg1 64
    store 8 r7 sp 0
    br r11 .for.body .return

  .for.body:
    r10 = call read
    r6 = mul r7 1 64
    r1 = mul r4 8 64
    r1 = add r6 r1 64
    r9 = mul r1 1 64
    store 8 r10 r9 0
    r8 = add r4 1 64
    store 8 r8 sp 8
    br .for.cond
end get_inputs

; Function sort
start sort 2:
  .entry:
    ; init sp!
    sp = sub sp 72 64
    r2 = icmp eq arg1 0 64
    store 8 0 sp 8
    br r2 .for.end15 .for.cond

  .for.end15:
    ret 0

  .for.cond:
    r3 = load 8 sp 8
    r5 = icmp ult r3 arg1 64
    br r5 .for.body .for.end15

  .for.body:
    r7 = sub arg1 1 64
    store 8 r7 sp 24
    store 8 r7 sp 32
    br .for.cond2

  .for.cond2:
    r8 = load 8 sp 32
    r3 = load 8 sp 8
    r4 = icmp ugt r8 r3 64
    br r4 .for.body5 .for.inc14

  .for.body5:
    r6 = mul arg2 1 64
    r1 = mul r8 8 64
    r1 = add r6 r1 64
    r6 = mul r1 1 64
    r10 = load 8 r6 0
    store 8 r2 sp 0
    r2 = sub r8 1 64
    r1 = mul arg2 1 64
    store 8 r3 sp 8
    r3 = mul r2 8 64
    r3 = add r1 r3 64
    r1 = mul r3 1 64
    r9 = load 8 r1 0
    store 8 r5 sp 16
    r16 = icmp ult r10 r9 64
    br r16 .if.then9 .for.inc

  .for.inc14:
    r5 = load 8 sp 8
    r7 = load 8 sp 24
    store 8 r7 sp 24
    r11 = add r5 1 64
    store 8 r11 sp 8
    br .for.cond

  .if.then9:
    r7 = mul arg2 1 64
    r3 = mul r8 8 64
    r3 = add r7 r3 64
    r15 = mul r3 1 64
    store 8 r9 r15 0
    r14 = sub r8 1 64
    r7 = mul arg2 1 64
    r3 = mul r14 8 64
    r3 = add r7 r3 64
    r13 = mul r3 1 64
    store 8 r10 r13 0
    br .for.inc

  .for.inc:
    r12 = add r8 18446744073709551615 64
    store 8 r12 sp 32
    br .for.cond2
end sort

; Function put_inputs
start put_inputs 2:
  .entry:
    ; init sp!
    sp = sub sp 8 64
    r14 = icmp eq arg1 0 64
    store 8 0 sp 0
    br r14 .for.end .for.cond

  .for.end:
    ret 0

  .for.cond:
    r2 = load 8 sp 0
    r13 = icmp ult r2 arg1 64
    br r13 .for.body .for.end

  .for.body:
    r4 = mul arg2 1 64
    r5 = mul r2 8 64
    r5 = add r4 r5 64
    r15 = mul r5 1 64
    r12 = load 8 r15 0
    call write r12
    r11 = add r2 1 64
    store 8 r11 sp 0
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
