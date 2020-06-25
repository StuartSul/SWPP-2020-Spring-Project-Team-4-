
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
    br r11 .for.cond1.preheader .for.end22

  .for.cond1.preheader:
    r1 = load 8 sp 0
    r9 = mul r1 arg1 32
    store 8 0 sp 8
    br .for.cond1

  .for.end22:
    ret 0

  .for.cond1:
    r2 = load 8 sp 8
    r12 = icmp ult r2 arg1 32
    br r12 .for.cond4.preheader .for.inc20

  .for.cond4.preheader:
    r13 = add r9 r2 32
    r10 = mul arg2 1 64
    r3 = mul r13 8 64
    r10 = add r10 r3 64
    store 8 0 sp 16
    br .for.cond4

  .for.inc20:
    r1 = load 8 sp 0
    r14 = add r1 1 32
    store 8 r14 sp 0
    br .for.cond

  .for.cond4:
    r4 = load 8 sp 16
    r15 = icmp ult r4 arg1 32
    br r15 .for.body6 .for.inc17

  .for.body6:
    r16 = add r9 r4 32
    r5 = mul arg3 1 64
    r6 = mul r16 8 64
    r5 = add r5 r6 64
    r5 = load 8 r5 0
    r7 = mul r4 arg1 32
    r7 = add r7 r2 32
    r8 = mul arg4 1 64
    r3 = mul r7 8 64
    r8 = add r8 r3 64
    r8 = load 8 r8 0
    r5 = mul r5 r8 64
    r6 = load 8 r10 0
    r6 = add r6 r5 64
    store 8 r6 r10 0
    r3 = add r4 1 32
    store 8 r3 sp 16
    br .for.cond4

  .for.inc17:
    r1 = add r2 1 32
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
    br r6 .for.cond1.preheader .for.end6

  .for.cond1.preheader:
    r7 = mul r1 arg1 32
    store 8 0 sp 8
    br .for.cond1

  .for.end6:
    ret 0

  .for.cond1:
    r2 = load 8 sp 8
    r8 = icmp ult r2 arg1 32
    br r8 .for.body3 .for.inc4

  .for.body3:
    r9 = call read
    r10 = add r7 r2 32
    r11 = mul arg2 1 64
    r3 = mul r10 8 64
    r11 = add r11 r3 64
    store 8 r9 r11 0
    r12 = add r2 1 32
    store 8 r12 sp 8
    br .for.cond1

  .for.inc4:
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
    br r6 .for.cond1.preheader .for.end6

  .for.cond1.preheader:
    r7 = mul r1 arg1 32
    store 8 0 sp 8
    br .for.cond1

  .for.end6:
    ret 0

  .for.cond1:
    r2 = load 8 sp 8
    r8 = icmp ult r2 arg1 32
    br r8 .for.body3 .for.inc4

  .for.body3:
    r9 = add r7 r2 32
    r10 = mul arg2 1 64
    r3 = mul r9 8 64
    r10 = add r10 r3 64
    r11 = load 8 r10 0
    call write r11
    r12 = add r2 1 32
    store 8 r12 sp 8
    br .for.cond1

  .for.inc4:
    r13 = add r1 1 32
    store 8 r13 sp 0
    br .for.cond
end print_mat

; Function main
start main 0:
  .entry:
    ; init sp!
    sp = sub sp 64 64
    r2 = call read
    r2 = urem r2 4294967296 64
    store 8 r2 sp 0
    r3 = mul r2 r2 32
    r9 = mul r3 8 64
    r4 = malloc r9
    store 8 r4 sp 8
    r6 = malloc r9
    store 8 r6 sp 16
    r8 = malloc r9
    store 8 r8 sp 24
    store 8 0 sp 32
    br .for.cond.i3

  .for.cond.i3:
    r2 = load 8 sp 32
    r3 = load 8 sp 0
    r10 = icmp ult r2 r3 32
    store 8 0 sp 40
    br r10 .for.cond1.i7.preheader .for.cond.i

  .for.cond1.i7.preheader:
    r2 = load 8 sp 32
    r3 = load 8 sp 0
    r11 = mul r2 r3 32
    store 8 0 sp 48
    br .for.cond1.i7

  .for.cond.i:
    r4 = load 8 sp 40
    r3 = load 8 sp 0
    r12 = icmp ult r4 r3 32
    br r12 .for.cond1.i.preheader .read_mat.exit

  .for.cond1.i7:
    r5 = load 8 sp 48
    r3 = load 8 sp 0
    r13 = icmp ult r5 r3 32
    br r13 .for.body3.i13 .for.end.i15

  .for.cond1.i.preheader:
    r4 = load 8 sp 40
    r3 = load 8 sp 0
    r14 = mul r4 r3 32
    store 8 0 sp 56
    br .for.cond1.i

  .read_mat.exit:
    r6 = load 8 sp 8
    r3 = load 8 sp 0
    r7 = load 8 sp 16
    r1 = load 8 sp 24
    call matmul r3 r1 r6 r7
    call print_mat r3 r1
    ret 0

  .for.body3.i13:
    r15 = call read
    r5 = load 8 sp 48
    r16 = add r11 r5 32
    r6 = load 8 sp 8
    r2 = mul r16 8 64
    r8 = add r6 r2 64
    store 8 r15 r8 0
    r2 = add r5 1 32
    store 8 r2 sp 48
    br .for.cond1.i7

  .for.end.i15:
    r4 = load 8 sp 32
    r7 = add r4 1 32
    store 8 r7 sp 32
    br .for.cond.i3

  .for.cond1.i:
    r3 = load 8 sp 56
    r1 = load 8 sp 0
    r6 = icmp ult r3 r1 32
    br r6 .for.body3.i .for.end.i

  .for.body3.i:
    r8 = call read
    r5 = add r14 r3 32
    r2 = load 8 sp 16
    r7 = mul r5 8 64
    r4 = add r2 r7 64
    store 8 r8 r4 0
    r7 = add r3 1 32
    store 8 r7 sp 56
    br .for.cond1.i

  .for.end.i:
    r1 = load 8 sp 40
    r6 = add r1 1 32
    store 8 r6 sp 40
    br .for.cond.i
end main
