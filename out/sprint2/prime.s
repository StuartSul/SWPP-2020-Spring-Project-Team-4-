
; Function check_with_primes
start check_with_primes 1:
  .entry:
    ; init sp!
    sp = sub sp 32 64
    r12 = load 8 20480 0
    store 8 0 sp 0
    r9 = mul r12 1 64
    br .while.cond

  .while.cond:
    r2 = load 8 sp 0
    r13 = icmp ne r9 0 64
    br r13 .while.body .cleanup5.loopexit1

  .while.body:
    r11 = load 8 r9 0
    r14 = mul r11 r11 64
    r15 = icmp ugt r14 arg1 64
    store 8 r2 sp 8
    store 8 3 sp 16
    r10 = mul r9 1 64
    br r15 .cleanup .if.end

  .cleanup5.loopexit1:
    store 8 1 sp 24
    br .cleanup5

  .cleanup:
    r3 = load 8 sp 8
    r5 = load 8 sp 16
    store 8 r3 sp 24
    store 8 r3 sp 0
    r9 = mul r10 1 64
    switch r5 0 .while.cond 3 .cleanup5.loopexit1 .cleanup5

  .if.end:
    r16 = urem arg1 r11 64
    r8 = icmp eq r16 0 64
    store 8 0 sp 8
    store 8 1 sp 16
    r10 = mul r9 1 64
    br r8 .cleanup .if.end4

  .cleanup5:
    r6 = load 8 sp 24
    ret r6

  .if.end4:
    r4 = add r9 8 64
    r4 = load 8 r4 0
    store 8 r2 sp 8
    store 8 0 sp 16
    r10 = mul r4 1 64
    br .cleanup
end check_with_primes

; Function add_primes
start add_primes 1:
  .entry:
    ; init sp!
    sp = sub sp 16 64
    store 8 0 sp 0
    br .while.cond

  .while.cond:
    r13 = load 8 20488 0
    r14 = load 8 20488 0
    r15 = mul r13 r14 64
    r16 = icmp ult r15 arg1 64
    store 8 1 sp 8
    br r16 .while.body .return

  .while.body:
    r7 = load 8 20488 0
    r10 = add r7 1 64
    store 8 r10 20488 0
    r4 = call check_with_primes r10
    r4 = icmp ne r4 0 64
    r1 = load 8 sp 0
    r9 = mul r1 1 64
    br r4 .if.then .if.end5

  .return:
    r6 = load 8 sp 8
    ret r6

  .if.then:
    r3 = malloc 16
    r2 = mul r3 1 64
    r8 = load 8 20488 0
    store 8 r8 r2 0
    r5 = add r2 8 64
    store 8 0 r5 0
    r1 = mul r2 1 64
    r7 = load 8 20496 0
    r7 = add r7 8 64
    store 8 r1 r7 0
    store 8 r2 20496 0
    r6 = load 8 20488 0
    r6 = urem arg1 r6 64
    r11 = icmp eq r6 0 64
    reset stack
    r4 = load 8 sp 0
    r12 = select r11 0 r4
    r9 = mul r12 1 64
    store 8 r12 sp 8
    br r11 .return .if.end5

  .if.end5:
    store 8 r9 sp 0
    br .while.cond
end add_primes

; Function is_prime
start is_prime 1:
  .entry:
    ; init sp!
    sp = sub sp 8 64
    r13 = call check_with_primes arg1
    r14 = icmp eq r13 0 64
    store 8 0 sp 0
    br r14 .return .if.end

  .return:
    r3 = load 8 sp 0
    ret r3

  .if.end:
    r15 = call add_primes arg1
    store 8 r15 sp 0
    br .return
end is_prime

; Function main
start main 0:
  .entry:
    ; init sp!
    sp = sub sp 8 64
    r1 = malloc 8
    r1 = malloc 8
    r1 = malloc 8
    r11 = malloc 16
    r2 = mul r11 1 64
    store 8 r2 20480 0
    store 8 2 r2 0
    r12 = load 8 20480 0
    r13 = add r12 8 64
    store 8 0 r13 0
    r14 = load 8 20480 0
    store 8 r14 20496 0
    store 8 2 20488 0
    br .while.body

  .while.body:
    r7 = call read
    r8 = icmp eq r7 0 64
    store 8 3 sp 0
    br r8 .cleanup .if.end

  .cleanup:
    r6 = load 8 sp 0
    r9 = icmp eq r6 0 32
    br r9 .while.body .while.end

  .if.end:
    r10 = call is_prime r7
    call write r10
    store 8 0 sp 0
    br .cleanup

  .while.end:
    ret 0
end main
