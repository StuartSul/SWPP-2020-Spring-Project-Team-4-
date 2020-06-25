
; Function insert
start insert 2:
  .entry:
    ; init sp!
    sp = sub sp 24 64
    store 8 0 sp 0
    r9 = mul arg1 1 64
    br .while.cond

  .while.cond:
    r11 = load 8 r9 0
    r14 = icmp ugt r11 arg2 64
    br r14 .if.then .if.else

  .if.then:
    r12 = add r9 8 64
    r15 = load 8 r12 0
    r2 = mul r15 1 64
    r16 = icmp eq r2 0 64
    store 8 2 sp 8
    r1 = load 8 sp 0
    store 8 r1 sp 16
    r10 = mul r2 1 64
    br r16 .if.then2 .cleanup

  .if.else:
    r3 = icmp ult r11 arg2 64
    store 8 1 sp 8
    store 8 0 sp 16
    r10 = mul r9 1 64
    br r3 .if.then7 .cleanup

  .if.then2:
    r4 = malloc 24
    r5 = mul r4 1 64
    reset heap
    store 8 arg2 r5 0
    r6 = add r5 8 64
    store 8 0 r6 0
    r7 = add r5 16 64
    store 8 0 r7 0
    store 8 r5 r12 0
    reset stack
    store 8 1 sp 8
    store 8 1 sp 16
    r10 = mul r9 1 64
    br .cleanup

  .cleanup:
    r1 = load 8 sp 8
    r2 = load 8 sp 16
    r1 = icmp eq r1 2 32
    store 8 r2 sp 0
    r9 = mul r10 1 64
    br r1 .while.cond .cleanup19

  .if.then7:
    r13 = add r9 16 64
    r3 = load 8 r13 0
    r4 = icmp eq r3 0 64
    r6 = load 8 sp 0
    store 8 2 sp 8
    store 8 r6 sp 16
    r10 = mul r3 1 64
    br r4 .if.then10 .cleanup

  .cleanup19:
    ret r2

  .if.then10:
    r7 = malloc 24
    r5 = mul r7 1 64
    reset heap
    store 8 arg2 r5 0
    r8 = add r5 8 64
    store 8 0 r8 0
    r1 = add r5 16 64
    store 8 0 r1 0
    store 8 r5 r13 0
    reset stack
    store 8 1 sp 8
    store 8 1 sp 16
    r10 = mul r9 1 64
    br .cleanup
end insert

; Function adjust
start adjust 1:
  .entry:
    ; init sp!
    sp = sub sp 16 64
    r14 = mul arg1 1 64
    r14 = add r14 8 64
    r15 = load 8 r14 0
    r1 = mul r15 1 64
    r16 = icmp eq r1 0 64
    store 8 r1 sp 0
    store 8 0 sp 8
    br r16 .if.then .while.cond

  .if.then:
    r2 = mul arg1 1 64
    r2 = add r2 16 64
    r2 = load 8 r2 0
    r9 = mul r2 1 64
    br .cleanup

  .while.cond:
    r3 = load 8 sp 0
    r4 = load 8 sp 8
    r10 = add r3 16 64
    r11 = load 8 r10 0
    r12 = icmp ne r11 0 64
    br r12 .while.body .while.end

  .cleanup:
    ret r9

  .while.body:
    r13 = load 8 r10 0
    store 8 r13 sp 0
    store 8 r3 sp 8
    br .while.cond

  .while.end:
    r7 = icmp ne r4 0 64
    r9 = mul r3 1 64
    br r7 .if.then6 .cleanup

  .if.then6:
    r8 = add r3 8 64
    r8 = load 8 r8 0
    r1 = add r4 16 64
    store 8 r8 r1 0
    r9 = mul r3 1 64
    br .cleanup
end adjust

; Function remove
start remove 2:
  .entry:
    ; init sp!
    sp = sub sp 32 64
    r1 = load 8 arg1 0
    r1 = icmp eq r1 arg2 64
    store 8 0 sp 8
    r9 = mul arg1 1 64
    store 8 0 sp 0
    br r1 .cleanup24 .while.cond

  .cleanup24:
    r2 = load 8 sp 0
    ret r2

  .while.cond:
    r11 = load 8 r9 0
    r14 = icmp ugt r11 arg2 64
    br r14 .if.then2 .if.else

  .if.then2:
    r12 = add r9 8 64
    r15 = load 8 r12 0
    r4 = mul r15 1 64
    r16 = icmp eq r4 0 64
    store 8 1 sp 16
    store 8 0 sp 24
    r10 = mul r9 1 64
    br r16 .cleanup .if.end5

  .if.else:
    r5 = icmp ult r11 arg2 64
    store 8 0 sp 16
    r3 = load 8 sp 8
    store 8 r3 sp 24
    r10 = mul r9 1 64
    br r5 .if.then11 .cleanup

  .cleanup:
    r6 = load 8 sp 16
    r7 = load 8 sp 24
    store 8 r7 sp 0
    switch r6 0 .while.cond.backedge 2 .while.cond.backedge .cleanup24

  .if.end5:
    r8 = load 8 r4 0
    r8 = icmp eq r8 arg2 64
    store 8 2 sp 16
    r3 = load 8 sp 8
    store 8 r3 sp 24
    r10 = mul r4 1 64
    br r8 .if.then7 .cleanup

  .if.then11:
    r13 = add r9 16 64
    r1 = load 8 r13 0
    r2 = icmp eq r1 0 64
    store 8 1 sp 16
    store 8 0 sp 24
    r10 = mul r9 1 64
    br r2 .cleanup .if.end15

  .while.cond.backedge:
    r7 = load 8 sp 24
    store 8 r7 sp 8
    r9 = mul r10 1 64
    br .while.cond

  .if.then7:
    r5 = call adjust r4
    store 8 r5 r12 0
    free r4
    store 8 1 sp 16
    store 8 1 sp 24
    r10 = mul r9 1 64
    br .cleanup

  .if.end15:
    r3 = load 8 r1 0
    r3 = icmp eq r3 arg2 64
    r8 = load 8 sp 8
    store 8 2 sp 16
    store 8 r8 sp 24
    r10 = mul r1 1 64
    br r3 .if.then17 .cleanup

  .if.then17:
    r2 = call adjust r1
    store 8 r2 r13 0
    free r1
    store 8 1 sp 16
    store 8 1 sp 24
    r10 = mul r9 1 64
    br .cleanup
end remove

; Function traverse
start traverse 1:
  .entry:
    r8 = mul arg1 1 64
    br .tailrecurse

  .tailrecurse:
    r9 = icmp eq r8 0 64
    br r9 .return .if.end

  .return:
    ret 0

  .if.end:
    r10 = load 8 r8 0
    r11 = add r8 8 64
    r12 = load 8 r11 0
    r1 = mul r12 1 64
    r13 = add r8 16 64
    r14 = load 8 r13 0
    r2 = mul r14 1 64
    call traverse r1
    call write r10
    r8 = mul r2 1 64
    br .tailrecurse
end traverse

; Function main
start main 0:
  .entry:
    ; init sp!
    sp = sub sp 8 64
    r15 = malloc 24
    r2 = mul r15 1 64
    r16 = call read
    store 8 r16 r2 0
    r3 = add r2 8 64
    store 8 0 r3 0
    r4 = add r2 16 64
    store 8 0 r4 0
    r10 = call read
    reset stack
    store 8 0 sp 0
    br .for.cond

  .for.cond:
    r5 = load 8 sp 0
    r11 = icmp ult r5 r10 64
    br r11 .for.body .for.end

  .for.body:
    r12 = call read
    r9 = call read
    r13 = icmp eq r12 0 64
    br r13 .if.then .if.else

  .for.end:
    call traverse r2
    ret 0

  .if.then:
    r6 = call insert r2 r9
    br .for.inc

  .if.else:
    r7 = call remove r2 r9
    br .for.inc

  .for.inc:
    r14 = add r5 1 64
    store 8 r14 sp 0
    br .for.cond
end main
