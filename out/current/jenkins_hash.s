
; Function malloc_upto_8
start malloc_upto_8 1:
  .entry:
    r13 = add arg1 7 64
    r14 = udiv r13 8 64
    r15 = mul r14 8 64
    r16 = malloc r15
    ret r16
end malloc_upto_8

; Function jenkins_one_at_a_time_hash
start jenkins_one_at_a_time_hash 3:
  .entry:
    ; init sp!
    sp = sub sp 8 64
    store 8 0 sp 0
    r9 = mul arg1 1 64
    br .while.cond

  .while.cond:
    r1 = load 8 sp 0
    r12 = icmp ne r1 arg3 64
    br r12 .while.body .while.end

  .while.body:
    r13 = add r1 1 64
    r14 = add arg2 r1 64
    r15 = load 1 r14 0
    r10 = add r9 r15 32
    r16 = mul r10 1024 32
    r11 = add r10 r16 32
    r2 = udiv r11 64 32
    r2 = xor r11 r2 32
    store 8 r13 sp 0
    r9 = mul r2 1 64
    br .while.cond

  .while.end:
    r3 = mul r9 8 32
    r3 = add r9 r3 32
    r4 = udiv r3 2048 32
    r4 = xor r3 r4 32
    r5 = mul r4 32768 32
    r5 = add r4 r5 32
    ret r5
end jenkins_one_at_a_time_hash

; Function main
start main 0:
  .entry:
    ; init sp!
    sp = sub sp 16 64
    r9 = call read
    r15 = icmp eq r9 0 64
    br r15 .if.then .if.end

  .if.then:
    call write 0
    br .cleanup

  .if.end:
    r16 = add r9 7 64
    r2 = udiv r16 8 64
    r2 = mul r2 8 64
    r10 = malloc r2
    store 8 0 sp 0
    br .for.cond

  .cleanup:
    ret 0

  .for.cond:
    r3 = load 8 sp 0
    r4 = udiv r3 2147483648 64
    r4 = mul r4 18446744071562067968 64
    r4 = or r4 r3 64
    store 8 r4 sp 8
    r11 = icmp ult r4 r9 64
    br r11 .for.body .for.body11

  .for.body:
    r12 = call read
    r5 = urem r12 256 64
    r4 = load 8 sp 8
    r13 = add r10 r4 64
    reset heap
    store 1 r5 r13 0
    reset stack
    r3 = load 8 sp 0
    r14 = add r3 1 32
    store 8 r14 sp 0
    br .for.cond

  .for.body11:
    r6 = call jenkins_one_at_a_time_hash 0 r10 r9
    r7 = call jenkins_one_at_a_time_hash r6 r10 r9
    r8 = call jenkins_one_at_a_time_hash r7 r10 r9
    r1 = call jenkins_one_at_a_time_hash r8 r10 r9
    r2 = call jenkins_one_at_a_time_hash r1 r10 r9
    r4 = call jenkins_one_at_a_time_hash r2 r10 r9
    r5 = call jenkins_one_at_a_time_hash r4 r10 r9
    r3 = call jenkins_one_at_a_time_hash r5 r10 r9
    r6 = call jenkins_one_at_a_time_hash r3 r10 r9
    r7 = call jenkins_one_at_a_time_hash r6 r10 r9
    call write r7
    free r10
    br .cleanup
end main
