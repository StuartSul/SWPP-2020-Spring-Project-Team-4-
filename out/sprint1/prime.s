
; Function check_with_primes
start check_with_primes 1:
  .entry:
    ; init sp!
    sp = sub sp 64 64
    r1 = load 8 20480 0
    store 8 r1 sp 8
    store 8 0 sp 16
    br .while.cond

  .while.cond:
    r2 = load 8 sp 8
    r4 = icmp ne r2 0 64
    br r4 .while.body .while.end

  .while.body:
    r2 = load 8 sp 8
    r9 = load 8 r2 0
    r16 = mul r9 r9 64
    r15 = icmp ugt r16 arg1 64
    r7 = load 8 sp 16
    store 8 r2 sp 32
    store 8 r7 sp 40
    store 8 3 sp 48
    br r15 .cleanup .if.end

  .while.end:
    store 8 1 sp 56
    br .cleanup5

  .cleanup:
    r8 = load 8 sp 40
    store 8 r8 sp 56
    r3 = load 8 sp 32
    store 8 r3 sp 8
    store 8 r8 sp 16
    r5 = load 8 sp 48
    switch r5 0 .while.cond 3 .while.end .cleanup5

  .if.end:
    r14 = urem arg1 r9 64
    r13 = icmp eq r14 0 64
    r7 = load 8 sp 8
    store 8 r7 sp 32
    store 8 0 sp 40
    store 8 1 sp 48
    br r13 .cleanup .if.end4

  .cleanup5:
    r6 = load 8 sp 56
    ret r6

  .if.end4:
    r7 = load 8 sp 8
    r2 = mul r7 1 64
    r3 = add r2 8 64
    r11 = mul r3 1 64
    r10 = load 8 r11 0
    r12 = mul r10 1 64
    r8 = load 8 sp 16
    store 8 r12 sp 32
    store 8 r8 sp 40
    store 8 0 sp 48
    br .cleanup
end check_with_primes

; Function add_primes
start add_primes 1:
  .entry:
    ; init sp!
    sp = sub sp 120 64
    store 8 0 sp 0
    br .while.cond

  .while.cond:
    r1 = load 8 20488 0
    r2 = load 8 20488 0
    r4 = mul r1 r2 64
    r6 = icmp ult r4 arg1 64
    store 8 1 sp 80
    br r6 .while.body .return

  .while.body:
    r7 = load 8 20488 0
    r3 = add r7 1 64
    store 8 r3 20488 0
    r5 = load 8 20488 0
    r8 = call check_with_primes r5
    store 8 r1 sp 8
    store 8 r2 sp 16
    r2 = icmp ne r8 0 64
    r1 = load 8 sp 0
    store 8 r1 sp 112
    store 8 r4 sp 24
    br r2 .if.then .if.end5

  .return:
    r4 = load 8 sp 80
    ret r4

  .if.then:
    store 8 r6 sp 32
    r6 = malloc 16
    r9 = mul r6 1 64
    store 8 r7 sp 40
    r7 = load 8 20488 0
    store 8 r7 r9 0
    store 8 r3 sp 48
    r3 = mul r9 1 64
    store 8 r5 sp 56
    r5 = add r3 8 64
    r3 = mul r5 1 64
    store 8 0 r3 0
    r16 = mul r9 1 64
    r15 = load 8 20496 0
    r5 = mul r15 1 64
    store 8 r8 sp 64
    r8 = add r5 8 64
    r14 = mul r8 1 64
    store 8 r16 r14 0
    store 8 r9 20496 0
    r13 = load 8 20488 0
    r12 = urem arg1 r13 64
    r10 = icmp eq r12 0 64
    r1 = load 8 sp 0
    r11 = select r10 0 r1
    store 8 r11 sp 112
    store 8 r11 sp 80
    br r10 .return .if.end5

  .if.end5:
    r5 = load 8 sp 112
    store 8 r5 sp 0
    br .while.cond
end add_primes

; Function is_prime
start is_prime 1:
  .entry:
    ; init sp!
    sp = sub sp 8 64
    r15 = call check_with_primes arg1
    r14 = icmp eq r15 0 64
    store 8 0 sp 0
    br r14 .return .if.end

  .return:
    r2 = load 8 sp 0
    ret r2

  .if.end:
    r13 = call add_primes arg1
    store 8 r13 sp 0
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
    r15 = malloc 16
    r14 = mul r15 1 64
    store 8 r14 20480 0
    r13 = load 8 20480 0
    store 8 2 r13 0
    r12 = load 8 20480 0
    r1 = mul r12 1 64
    r2 = add r1 8 64
    r11 = mul r2 1 64
    store 8 0 r11 0
    r10 = load 8 20480 0
    store 8 r10 20496 0
    store 8 2 20488 0
    br .while.body

  .while.body:
    r6 = call read
    r9 = icmp eq r6 0 64
    store 8 3 sp 0
    br r9 .cleanup .if.end

  .cleanup:
    r4 = load 8 sp 0
    r7 = icmp eq r4 0 32
    br r7 .while.body .while.end

  .if.end:
    r8 = call is_prime r6
    call write r8
    store 8 0 sp 0
    br .cleanup

  .while.end:
    ret 0
end main
