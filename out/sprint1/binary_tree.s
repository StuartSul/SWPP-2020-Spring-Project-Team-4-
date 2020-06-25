
; Function insert
start insert 2:
  .entry:
    ; init sp!
    sp = sub sp 168 64
    store 8 arg1 sp 0
    store 8 0 sp 8
    br .while.cond

  .while.cond:
    r1 = load 8 sp 0
    r12 = load 8 r1 0
    r3 = icmp ugt r12 arg2 64
    br r3 .if.then .if.else

  .if.then:
    r1 = load 8 sp 0
    r1 = load 8 sp 0
    r4 = mul r1 1 64
    r5 = add r4 8 64
    r6 = mul r5 1 64
    r7 = load 8 r6 0
    r13 = mul r7 1 64
    r2 = icmp eq r13 0 64
    r4 = load 8 sp 8
    store 8 r13 sp 96
    store 8 2 sp 104
    store 8 r4 sp 112
    br r2 .if.then2 .cleanup

  .if.else:
    r8 = icmp ult r12 arg2 64
    r1 = load 8 sp 0
    store 8 r1 sp 96
    store 8 1 sp 104
    store 8 0 sp 112
    br r8 .if.then7 .cleanup

  .if.then2:
    r5 = malloc 24
    r10 = mul r5 1 64
    store 8 arg2 r10 0
    r1 = load 8 sp 0
    store 8 r1 sp 0
    r1 = mul r10 1 64
    store 8 r3 sp 16
    r3 = add r1 8 64
    r1 = mul r3 1 64
    store 8 0 r1 0
    r3 = mul r10 1 64
    store 8 r6 sp 24
    r6 = add r3 16 64
    r3 = mul r6 1 64
    store 8 0 r3 0
    r6 = mul r10 1 64
    store 8 r7 sp 32
    r7 = load 8 sp 0
    store 8 r2 sp 40
    r2 = mul r7 1 64
    r4 = load 8 sp 8
    store 8 r4 sp 8
    r4 = add r2 8 64
    r2 = mul r4 1 64
    store 8 r6 r2 0
    store 8 r7 sp 96
    store 8 1 sp 104
    store 8 1 sp 112
    br .cleanup

  .cleanup:
    r4 = load 8 sp 104
    store 8 r8 sp 48
    store 8 r5 sp 56
    r14 = icmp eq r4 2 32
    r5 = load 8 sp 96
    r8 = load 8 sp 112
    store 8 r5 sp 0
    store 8 r8 sp 8
    br r14 .while.cond .cleanup19

  .if.then7:
    r7 = load 8 sp 0
    store 8 r1 sp 64
    r1 = mul r7 1 64
    store 8 r3 sp 72
    r3 = add r1 16 64
    r1 = mul r3 1 64
    r3 = load 8 r1 0
    r11 = mul r3 1 64
    store 8 r6 sp 80
    store 8 r2 sp 88
    r2 = icmp eq r11 0 64
    r6 = load 8 sp 8
    store 8 r11 sp 96
    store 8 2 sp 104
    store 8 r6 sp 112
    br r2 .if.then10 .cleanup

  .cleanup19:
    r5 = load 8 sp 112
    ret r5

  .if.then10:
    r4 = malloc 24
    r9 = mul r4 1 64
    store 8 arg2 r9 0
    r8 = mul r9 1 64
    store 8 r7 sp 0
    r7 = add r8 8 64
    r8 = mul r7 1 64
    store 8 0 r8 0
    r7 = mul r9 1 64
    store 8 r1 sp 120
    r1 = add r7 16 64
    r7 = mul r1 1 64
    store 8 0 r7 0
    r16 = mul r9 1 64
    r1 = load 8 sp 0
    store 8 r3 sp 128
    r3 = mul r1 1 64
    store 8 r2 sp 136
    r2 = add r3 16 64
    r15 = mul r2 1 64
    store 8 r16 r15 0
    store 8 r1 sp 96
    store 8 1 sp 104
    store 8 1 sp 112
    br .cleanup
end insert

; Function adjust
start adjust 1:
  .entry:
    ; init sp!
    sp = sub sp 104 64
    r1 = mul arg1 1 64
    r2 = add r1 8 64
    r3 = mul r2 1 64
    r4 = load 8 r3 0
    r9 = mul r4 1 64
    r6 = icmp eq r9 0 64
    store 8 r9 sp 48
    store 8 0 sp 56
    br r6 .if.then .while.cond

  .if.then:
    r7 = mul arg1 1 64
    r8 = add r7 16 64
    r1 = mul r8 1 64
    r2 = load 8 r1 0
    r5 = mul r2 1 64
    store 8 r5 sp 80
    br .cleanup

  .while.cond:
    r7 = load 8 sp 48
    r8 = mul r7 1 64
    store 8 r3 sp 0
    r3 = add r8 16 64
    r16 = mul r3 1 64
    r15 = load 8 r16 0
    r8 = mul r15 1 64
    store 8 r4 sp 8
    r4 = icmp ne r8 0 64
    br r4 .while.body .while.end

  .cleanup:
    r3 = load 8 sp 80
    ret r3

  .while.body:
    store 8 r6 sp 16
    r6 = mul r7 1 64
    store 8 r1 sp 24
    r1 = add r6 16 64
    r14 = mul r1 1 64
    r13 = load 8 r14 0
    r6 = mul r13 1 64
    r1 = load 8 sp 48
    store 8 r6 sp 48
    store 8 r1 sp 56
    br .while.cond

  .while.end:
    r7 = load 8 sp 56
    store 8 r2 sp 32
    store 8 r5 sp 40
    r5 = icmp ne r7 0 64
    r1 = load 8 sp 48
    store 8 r1 sp 80
    br r5 .if.then6 .cleanup

  .if.then6:
    r1 = load 8 sp 48
    r1 = load 8 sp 48
    r1 = load 8 sp 48
    r2 = mul r1 1 64
    r3 = add r2 8 64
    r12 = mul r3 1 64
    r11 = load 8 r12 0
    r2 = mul r7 1 64
    r3 = add r2 16 64
    r10 = mul r3 1 64
    store 8 r11 r10 0
    r1 = load 8 sp 48
    r1 = load 8 sp 48
    store 8 r1 sp 80
    br .cleanup
end adjust

; Function remove
start remove 2:
  .entry:
    ; init sp!
    sp = sub sp 184 64
    r1 = load 8 arg1 0
    r3 = icmp eq r1 arg2 64
    store 8 arg1 sp 24
    store 8 0 sp 32
    store 8 0 sp 16
    br r3 .cleanup24 .while.cond

  .cleanup24:
    r4 = load 8 sp 16
    ret r4

  .while.cond:
    r5 = load 8 sp 24
    r11 = load 8 r5 0
    r7 = icmp ugt r11 arg2 64
    br r7 .if.then2 .if.else

  .if.then2:
    r5 = load 8 sp 24
    r5 = load 8 sp 24
    r5 = load 8 sp 24
    r8 = mul r5 1 64
    r2 = add r8 8 64
    r6 = mul r2 1 64
    r8 = load 8 r6 0
    r10 = mul r8 1 64
    store 8 r1 sp 0
    r1 = icmp eq r10 0 64
    r5 = load 8 sp 24
    r5 = load 8 sp 24
    store 8 r5 sp 80
    store 8 1 sp 88
    store 8 0 sp 96
    br r1 .cleanup .if.end5

  .if.else:
    store 8 r3 sp 8
    r3 = icmp ult r11 arg2 64
    r2 = load 8 sp 32
    r5 = load 8 sp 24
    r5 = load 8 sp 24
    store 8 r5 sp 80
    store 8 0 sp 88
    store 8 r2 sp 96
    store 8 r4 sp 16
    br r3 .if.then11 .cleanup

  .cleanup:
    r4 = load 8 sp 96
    store 8 r4 sp 16
    r5 = load 8 sp 24
    r5 = load 8 sp 24
    store 8 r5 sp 24
    r5 = load 8 sp 80
    store 8 r5 sp 24
    store 8 r4 sp 32
    store 8 r5 sp 24
    store 8 r4 sp 32
    r2 = load 8 sp 88
    switch r2 0 .while.cond 2 .while.cond .cleanup24

  .if.end5:
    store 8 r7 sp 40
    r7 = load 8 r10 0
    store 8 r6 sp 48
    store 8 r8 sp 56
    r8 = icmp eq r7 arg2 64
    r6 = load 8 sp 32
    store 8 r10 sp 80
    store 8 2 sp 88
    store 8 r6 sp 96
    br r8 .if.then7 .cleanup

  .if.then11:
    r5 = load 8 sp 24
    r2 = mul r5 1 64
    r4 = add r2 16 64
    r2 = mul r4 1 64
    r4 = load 8 r2 0
    r9 = mul r4 1 64
    store 8 r1 sp 64
    store 8 r3 sp 72
    r3 = icmp eq r9 0 64
    store 8 r5 sp 80
    store 8 1 sp 88
    store 8 0 sp 96
    br r3 .cleanup .if.end15

  .if.then7:
    r1 = call adjust r10
    store 8 r7 sp 104
    r7 = mul r1 1 64
    store 8 r8 sp 112
    r5 = load 8 sp 24
    r5 = load 8 sp 24
    r5 = load 8 sp 24
    r8 = mul r5 1 64
    r6 = load 8 sp 32
    store 8 r6 sp 32
    r6 = add r8 8 64
    r8 = mul r6 1 64
    store 8 r7 r8 0
    r6 = mul r10 1 64
    free r6
    r5 = load 8 sp 24
    r5 = load 8 sp 24
    store 8 r5 sp 80
    store 8 1 sp 88
    store 8 1 sp 96
    br .cleanup

  .if.end15:
    r5 = load 8 sp 24
    r5 = load 8 sp 24
    store 8 r5 sp 24
    r5 = load 8 r9 0
    store 8 r2 sp 120
    store 8 r4 sp 128
    r16 = icmp eq r5 arg2 64
    r4 = load 8 sp 32
    store 8 r9 sp 80
    store 8 2 sp 88
    store 8 r4 sp 96
    br r16 .if.then17 .cleanup

  .if.then17:
    r15 = call adjust r9
    r14 = mul r15 1 64
    r2 = load 8 sp 24
    store 8 r3 sp 136
    r3 = mul r2 1 64
    store 8 r1 sp 144
    r1 = add r3 16 64
    r13 = mul r1 1 64
    store 8 r14 r13 0
    r12 = mul r9 1 64
    free r12
    store 8 r2 sp 80
    store 8 1 sp 88
    store 8 1 sp 96
    br .cleanup
end remove

; Function traverse
start traverse 1:
  .entry:
    r16 = icmp eq arg1 0 64
    br r16 .return .if.end

  .return:
    ret 0

  .if.end:
    r14 = load 8 arg1 0
    r2 = mul arg1 1 64
    r3 = add r2 8 64
    r13 = mul r3 1 64
    r12 = load 8 r13 0
    r15 = mul r12 1 64
    r4 = mul arg1 1 64
    r5 = add r4 16 64
    r11 = mul r5 1 64
    r10 = load 8 r11 0
    r9 = mul r10 1 64
    call traverse r15
    call write r14
    call traverse r9
    br .return
end traverse

; Function main
start main 0:
  .entry:
    ; init sp!
    sp = sub sp 48 64
    r1 = malloc 24
    r9 = mul r1 1 64
    r2 = call read
    store 8 r2 r9 0
    r3 = mul r9 1 64
    r4 = add r3 8 64
    r16 = mul r4 1 64
    store 8 0 r16 0
    r5 = mul r9 1 64
    r6 = add r5 16 64
    r15 = mul r6 1 64
    store 8 0 r15 0
    r14 = call read
    store 8 0 sp 16
    br .for.cond

  .for.cond:
    r7 = load 8 sp 16
    r13 = icmp ult r7 r14 64
    br r13 .for.body .for.end

  .for.body:
    r3 = call read
    r10 = call read
    r12 = icmp eq r3 0 64
    br r12 .if.then .if.else

  .for.end:
    call traverse r9
    ret 0

  .if.then:
    r5 = call insert r9 r10
    br .for.inc

  .if.else:
    r6 = call remove r9 r10
    br .for.inc

  .for.inc:
    r11 = add r7 1 64
    store 8 r11 sp 16
    br .for.cond
end main
