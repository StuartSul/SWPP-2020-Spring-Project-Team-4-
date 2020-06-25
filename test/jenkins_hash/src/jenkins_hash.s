
; Function malloc_upto_8
start malloc_upto_8 1:
  .entry:
    ; init sp!
    sp = sub sp 32 64
    r1 = add arg1 7 64
    store 8 r1 sp 0
    r1 = load 8 sp 0
    r1 = udiv r1 8 64
    store 8 r1 sp 8
    r1 = load 8 sp 8
    r1 = mul r1 8 64
    store 8 r1 sp 16
    r1 = load 8 sp 16
    r1 = malloc r1
    store 8 r1 sp 24
    r1 = load 8 sp 24
    ret r1
end malloc_upto_8

; Function jenkins_one_at_a_time_hash
start jenkins_one_at_a_time_hash 3:
  .entry:
    ; init sp!
    sp = sub sp 160 64
    store 8 0 sp 8
    store 8 arg1 sp 24
    r1 = load 8 sp 8
    store 8 r1 sp 0
    r1 = load 8 sp 24
    store 8 r1 sp 16
    br .while.cond

  .while.cond:
    r1 = load 8 sp 0
    r1 = icmp ne r1 arg3 64
    store 8 r1 sp 32
    r1 = load 8 sp 32
    br r1 .while.body .while.end

  .while.body:
    r1 = load 8 sp 0
    r1 = add r1 1 64
    store 8 r1 sp 40
    r2 = load 8 sp 0
    r1 = add arg2 r2 64
    store 8 r1 sp 48
    r1 = load 8 sp 48
    r1 = load 1 r1 0
    store 8 r1 sp 56
    r1 = load 8 sp 56
    store 8 r1 sp 64
    r1 = load 8 sp 16
    r2 = load 8 sp 64
    r1 = add r1 r2 32
    store 8 r1 sp 72
    r1 = load 8 sp 72
    r1 = shl r1 10 32
    store 8 r1 sp 80
    r1 = load 8 sp 72
    r2 = load 8 sp 80
    r1 = add r1 r2 32
    store 8 r1 sp 88
    r1 = load 8 sp 88
    r1 = lshr r1 6 32
    store 8 r1 sp 96
    r1 = load 8 sp 88
    r2 = load 8 sp 96
    r1 = xor r1 r2 32
    store 8 r1 sp 104
    r1 = load 8 sp 40
    store 8 r1 sp 8
    r1 = load 8 sp 104
    store 8 r1 sp 24
    r1 = load 8 sp 8
    store 8 r1 sp 0
    r1 = load 8 sp 24
    store 8 r1 sp 16
    br .while.cond

  .while.end:
    r1 = load 8 sp 16
    r1 = shl r1 3 32
    store 8 r1 sp 112
    r1 = load 8 sp 16
    r2 = load 8 sp 112
    r1 = add r1 r2 32
    store 8 r1 sp 120
    r1 = load 8 sp 120
    r1 = lshr r1 11 32
    store 8 r1 sp 128
    r1 = load 8 sp 120
    r2 = load 8 sp 128
    r1 = xor r1 r2 32
    store 8 r1 sp 136
    r1 = load 8 sp 136
    r1 = shl r1 15 32
    store 8 r1 sp 144
    r1 = load 8 sp 136
    r2 = load 8 sp 144
    r1 = add r1 r2 32
    store 8 r1 sp 152
    r1 = load 8 sp 152
    ret r1
end jenkins_one_at_a_time_hash

; Function main
start main 0:
  .entry:
    ; init sp!
    sp = sub sp 160 64
    r1 = call read
    store 8 r1 sp 0
    r1 = load 8 sp 0
    r1 = icmp eq r1 0 64
    store 8 r1 sp 8
    r1 = load 8 sp 8
    br r1 .if.then .if.end

  .if.then:
    call write 0
    br .cleanup

  .if.end:
    r1 = load 8 sp 0
    r1 = call malloc_upto_8 r1
    store 8 r1 sp 16
    store 8 0 sp 32
    r1 = load 8 sp 32
    store 8 r1 sp 24
    br .for.cond

  .for.cond:
    r1 = load 8 sp 24
    r2 = and r1 2147483648 64
    r2 = sub 0 r2 64
    r1 = or r2 r1 64
    store 8 r1 sp 40
    r1 = load 8 sp 40
    r2 = load 8 sp 0
    r1 = icmp ult r1 r2 64
    store 8 r1 sp 48
    r1 = load 8 sp 48
    br r1 .for.body .for.cond.cleanup

  .for.cond.cleanup:
    br .for.end

  .for.body:
    r1 = call read
    store 8 r1 sp 56
    r1 = load 8 sp 56
    r1 = and r1 255 64
    store 8 r1 sp 64
    r1 = load 8 sp 24
    r2 = and r1 2147483648 64
    r2 = sub 0 r2 64
    r1 = or r2 r1 64
    store 8 r1 sp 72
    r1 = load 8 sp 16
    r2 = load 8 sp 72
    r1 = add r1 r2 64
    store 8 r1 sp 80
    r1 = load 8 sp 64
    r2 = load 8 sp 80
    store 1 r1 r2 0
    br .for.inc

  .for.inc:
    r1 = load 8 sp 24
    r1 = add r1 1 32
    store 8 r1 sp 88
    r1 = load 8 sp 88
    store 8 r1 sp 32
    r1 = load 8 sp 32
    store 8 r1 sp 24
    br .for.cond

  .for.end:
    store 8 0 sp 104
    store 8 0 sp 120
    r1 = load 8 sp 104
    store 8 r1 sp 96
    r1 = load 8 sp 120
    store 8 r1 sp 112
    br .for.cond7

  .for.cond7:
    r1 = load 8 sp 112
    r1 = icmp slt r1 10 32
    store 8 r1 sp 128
    r1 = load 8 sp 128
    br r1 .for.body11 .for.cond.cleanup10

  .for.cond.cleanup10:
    br .for.end15

  .for.body11:
    r1 = load 8 sp 96
    r2 = load 8 sp 16
    r3 = load 8 sp 0
    r1 = call jenkins_one_at_a_time_hash r1 r2 r3
    store 8 r1 sp 136
    br .for.inc13

  .for.inc13:
    r1 = load 8 sp 112
    r1 = add r1 1 32
    store 8 r1 sp 144
    r1 = load 8 sp 136
    store 8 r1 sp 104
    r1 = load 8 sp 144
    store 8 r1 sp 120
    r1 = load 8 sp 104
    store 8 r1 sp 96
    r1 = load 8 sp 120
    store 8 r1 sp 112
    br .for.cond7

  .for.end15:
    r1 = load 8 sp 96
    store 8 r1 sp 152
    r1 = load 8 sp 152
    call write r1
    r1 = load 8 sp 16
    free r1
    br .cleanup

  .cleanup:
    ret 0
end main
