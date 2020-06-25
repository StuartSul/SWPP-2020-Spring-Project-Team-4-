
; Function check_with_primes
start check_with_primes 1:
  .entry:
    ; init sp!
    sp = sub sp 16 64
    r12 = load 8 20480 0
    r9 = mul r12 1 64
    br .while.cond

  .while.cond:
    r13 = icmp ne r9 0 64
    br r13 .while.body .cleanup5.loopexit1

  .while.body:
    r11 = load 8 r9 0
    r14 = mul r11 r11 64
    r15 = icmp ugt r14 arg1 64
    reset stack
    store 8 3 sp 0
    r10 = mul r9 1 64
    br r15 .cleanup .if.end

  .cleanup5.loopexit1:
    store 8 1 sp 8
    br .cleanup5

  .cleanup:
    r1 = load 8 sp 0
    store 8 0 sp 8
    r9 = mul r10 1 64
    switch r1 0 .while.cond 3 .cleanup5.loopexit1 .cleanup5

  .if.end:
    r16 = urem arg1 r11 64
    r2 = icmp eq r16 0 64
    store 8 1 sp 0
    r10 = mul r9 1 64
    br r2 .cleanup .if.end4

  .cleanup5:
    r3 = load 8 sp 8
    ret r3

  .if.end4:
    r4 = add r9 8 64
    r4 = load 8 r4 0
    store 8 0 sp 0
    r10 = mul r4 1 64
    br .cleanup
end check_with_primes

; Function add_primes
start add_primes 1:
  .entry:
    ; init sp!
    sp = sub sp 8 64
    br .while.cond

  .while.cond:
    r10 = load 8 20488 0
    r11 = load 8 20488 0
    r12 = mul r10 r11 64
    r13 = icmp ult r12 arg1 64
    reset stack
    store 8 1 sp 0
    br r13 .while.body .return

  .while.body:
    reset heap
    r14 = load 8 20488 0
    r9 = add r14 1 64
    store 8 r9 20488 0
    r15 = call check_with_primes r9
    r16 = icmp ne r15 0 64
    br r16 .if.then .if.end5

  .return:
    reset stack
    r1 = load 8 sp 0
    ret r1

  .if.then:
    r2 = malloc 16
    r3 = mul r2 1 64
    reset heap
    r4 = load 8 20488 0
    store 8 r4 r3 0
    r5 = add r3 8 64
    store 8 0 r5 0
    r6 = mul r3 1 64
    r7 = load 8 20496 0
    r7 = add r7 8 64
    store 8 r6 r7 0
    store 8 r3 20496 0
    r8 = load 8 20488 0
    r8 = urem arg1 r8 64
    r8 = icmp eq r8 0 64
    reset stack
    store 8 0 sp 0
    br r8 .return .if.end5

  .if.end5:
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
    r1 = load 8 sp 0
    ret r1

  .if.end:
    r15 = call add_primes arg1
    store 8 r15 sp 0
    br .return
end is_prime

; Function main
start main 0:
  .entry:
    ; init sp!
    sp = sub sp 16 64
    r1 = malloc 8
    r1 = malloc 8
    r1 = malloc 8
    r15 = malloc 16
    r2 = mul r15 1 64
    store 8 r2 20480 0
    store 8 2 r2 0
    r16 = load 8 20480 0
    r3 = add r16 8 64
    store 8 0 r3 0
    r4 = load 8 20480 0
    store 8 r4 20496 0
    store 8 2 20488 0
    br .while.body

  .while.body:
    r9 = call read
    r10 = icmp eq r9 0 64
    reset stack
    store 8 3 sp 0
    br r10 .cleanup .if.end

  .cleanup:
    r5 = load 8 sp 0
    r11 = icmp eq r5 0 32
    br r11 .while.body .while.end

  .if.end:
    r12 = call check_with_primes r9
    r13 = icmp eq r12 0 64
    store 8 0 sp 8
    br r13 .is_prime.exit .if.end.i

  .while.end:
    ret 0

  .is_prime.exit:
    r6 = load 8 sp 8
    call write r6
    store 8 0 sp 0
    br .cleanup

  .if.end.i:
    r14 = call add_primes r9
    store 8 r14 sp 8
    br .is_prime.exit
end main
