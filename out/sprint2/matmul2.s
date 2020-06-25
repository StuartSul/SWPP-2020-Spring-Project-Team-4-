
; Function matmul
start matmul 4:
  .entry:
    ; init sp!
    sp = sub sp 24 64
    store 8 0 sp 0
    br .for.cond

  .for.cond:
    r1 = load 8 sp 0
    r11 = icmp ult r1 arg1 32
    br r11 .for.body .for.end22

  .for.body:
    r1 = load 8 sp 0
    r9 = mul r1 arg1 32
    store 8 0 sp 8
    br .for.cond1

  .for.end22:
    ret 0

  .for.cond1:
    r7 = load 8 sp 8
    r12 = icmp ult r7 arg1 32
    br r12 .for.body3 .for.end19

  .for.body3:
    r13 = add r9 r7 32
    r10 = mul arg2 1 64
    r6 = mul r13 8 64
    r10 = add r10 r6 64
    store 8 0 sp 16
    br .for.cond4

  .for.end19:
    r1 = load 8 sp 0
    r14 = add r1 1 32
    store 8 r14 sp 0
    br .for.cond

  .for.cond4:
    r3 = load 8 sp 16
    r15 = icmp ult r3 arg1 32
    br r15 .for.body6 .for.end

  .for.body6:
    r16 = add r9 r3 32
    r4 = mul arg3 1 64
    r5 = mul r16 8 64
    r4 = add r4 r5 64
    r4 = load 8 r4 0
    r5 = mul r3 arg1 32
    r5 = add r5 r7 32
    r8 = mul arg4 1 64
    r6 = mul r5 8 64
    r8 = add r8 r6 64
    r8 = load 8 r8 0
    r4 = mul r4 r8 64
    r6 = load 8 r10 0
    r6 = add r6 r4 64
    store 8 r6 r10 0
    r2 = add r3 1 32
    store 8 r2 sp 16
    br .for.cond4

  .for.end:
    r1 = add r7 1 32
    store 8 r1 sp 8
    br .for.cond1
end matmul

; Function read_mat
start read_mat 2:
  .entry:
    ; init sp!
    sp = sub sp 16 64
    store 8 0 sp 0
    br .for.cond

  .for.cond:
    r1 = load 8 sp 0
    r6 = icmp ult r1 arg1 32
    br r6 .for.body .for.end6

  .for.body:
    r7 = mul r1 arg1 32
    store 8 0 sp 8
    br .for.cond1

  .for.end6:
    ret 0

  .for.cond1:
    r3 = load 8 sp 8
    r8 = icmp ult r3 arg1 32
    br r8 .for.body3 .for.end

  .for.body3:
    r9 = call read
    r10 = add r7 r3 32
    r11 = mul arg2 1 64
    r4 = mul r10 8 64
    r11 = add r11 r4 64
    store 8 r9 r11 0
    r12 = add r3 1 32
    store 8 r12 sp 8
    br .for.cond1

  .for.end:
    r13 = add r1 1 32
    store 8 r13 sp 0
    br .for.cond
end read_mat

; Function print_mat
start print_mat 2:
  .entry:
    ; init sp!
    sp = sub sp 16 64
    store 8 0 sp 0
    br .for.cond

  .for.cond:
    r1 = load 8 sp 0
    r6 = icmp ult r1 arg1 32
    br r6 .for.body .for.end6

  .for.body:
    r7 = mul r1 arg1 32
    store 8 0 sp 8
    br .for.cond1

  .for.end6:
    ret 0

  .for.cond1:
    r3 = load 8 sp 8
    r8 = icmp ult r3 arg1 32
    br r8 .for.body3 .for.end

  .for.body3:
    r9 = add r7 r3 32
    r10 = mul arg2 1 64
    r2 = mul r9 8 64
    r10 = add r10 r2 64
    r11 = load 8 r10 0
    call write r11
    r12 = add r3 1 32
    store 8 r12 sp 8
    br .for.cond1

  .for.end:
    r13 = add r1 1 32
    store 8 r13 sp 0
    br .for.cond
end print_mat

; Function main
start main 0:
  .entry:
    r7 = call read
    r2 = urem r7 4294967296 64
    r8 = mul r2 r2 32
    r6 = mul r8 8 64
    r9 = malloc r6
    r5 = mul r9 1 64
    r10 = malloc r6
    r4 = mul r10 1 64
    r11 = malloc r6
    r1 = mul r11 1 64
    call read_mat r2 r5
    call read_mat r2 r4
    call matmul r2 r1 r5 r4
    call print_mat r2 r1
    ret 0
end main
