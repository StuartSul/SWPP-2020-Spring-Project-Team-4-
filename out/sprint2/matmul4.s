
; Function copy_mask
start copy_mask 5:
  .entry:
    ; init sp!
    sp = sub sp 8 64
    store 8 0 sp 0
    br .for.cond

  .for.cond:
    r1 = load 8 sp 0
    r11 = icmp slt r1 4 32
    br r11 .for.body .for.end19

  .for.body:
    r1 = load 8 sp 0
    r12 = add arg2 r1 32
    r13 = mul r12 arg1 32
    r9 = add r13 arg3 32
    r1 = load 8 sp 0
    r10 = mul r1 4 32
    r14 = mul arg4 1 64
    r4 = mul r9 8 64
    r14 = add r14 r4 64
    r15 = load 8 r14 0
    r6 = udiv r10 2147483648 64
    r6 = mul r6 18446744071562067968 64
    r6 = or r6 r10 64
    r16 = mul arg5 1 64
    r2 = mul r6 8 64
    r16 = add r16 r2 64
    store 8 r15 r16 0
    r3 = add r9 1 32
    r5 = mul arg4 1 64
    r8 = mul r3 8 64
    r5 = add r5 r8 64
    r5 = load 8 r5 0
    r7 = add r10 1 32
    r4 = udiv r7 2147483648 64
    r4 = mul r4 18446744071562067968 64
    r4 = or r4 r7 64
    r2 = mul arg5 1 64
    r8 = mul r4 8 64
    r2 = add r2 r8 64
    store 8 r5 r2 0
    r8 = add r9 2 32
    r1 = mul arg4 1 64
    r6 = mul r8 8 64
    r1 = add r1 r6 64
    r1 = load 8 r1 0
    r6 = add r10 2 32
    r3 = udiv r6 2147483648 64
    r3 = mul r3 18446744071562067968 64
    r3 = or r3 r6 64
    r7 = mul arg5 1 64
    r5 = mul r3 8 64
    r7 = add r7 r5 64
    store 8 r1 r7 0
    r5 = add r9 3 32
    r4 = mul arg4 1 64
    r2 = mul r5 8 64
    r4 = add r4 r2 64
    r4 = load 8 r4 0
    r2 = add r10 3 32
    r8 = udiv r2 2147483648 64
    r8 = mul r8 18446744071562067968 64
    r8 = or r8 r2 64
    r1 = mul arg5 1 64
    r6 = mul r8 8 64
    r1 = add r1 r6 64
    store 8 r4 r1 0
    r6 = load 8 sp 0
    r3 = add r6 1 8
    store 8 r3 sp 0
    br .for.cond

  .for.end19:
    ret 0
end copy_mask

; Function add_mask
start add_mask 5:
  .entry:
    ; init sp!
    sp = sub sp 8 64
    store 8 0 sp 0
    br .for.cond

  .for.cond:
    r1 = load 8 sp 0
    r15 = icmp slt r1 4 32
    br r15 .for.body .for.end20

  .for.body:
    r1 = load 8 sp 0
    r9 = mul r1 4 32
    r1 = load 8 sp 0
    r16 = add arg2 r1 32
    r2 = mul r16 arg1 32
    r10 = add r2 arg3 32
    r6 = udiv r9 2147483648 64
    r6 = mul r6 18446744071562067968 64
    r6 = or r6 r9 64
    r8 = mul arg5 1 64
    r4 = mul r6 8 64
    r8 = add r8 r4 64
    r8 = load 8 r8 0
    r11 = mul arg4 1 64
    r3 = mul r10 8 64
    r11 = add r11 r3 64
    r4 = load 8 r11 0
    r4 = add r4 r8 64
    store 8 r4 r11 0
    r3 = add r9 1 32
    r5 = udiv r3 2147483648 64
    r5 = mul r5 18446744071562067968 64
    r5 = or r5 r3 64
    r7 = mul arg5 1 64
    r1 = mul r5 8 64
    r7 = add r7 r1 64
    r7 = load 8 r7 0
    r1 = add r10 1 32
    r12 = mul arg4 1 64
    r2 = mul r1 8 64
    r12 = add r12 r2 64
    r2 = load 8 r12 0
    r2 = add r2 r7 64
    store 8 r2 r12 0
    r6 = add r9 2 32
    r8 = udiv r6 2147483648 64
    r8 = mul r8 18446744071562067968 64
    r8 = or r8 r6 64
    r3 = mul arg5 1 64
    r4 = mul r8 8 64
    r3 = add r3 r4 64
    r3 = load 8 r3 0
    r4 = add r10 2 32
    r13 = mul arg4 1 64
    r5 = mul r4 8 64
    r13 = add r13 r5 64
    r5 = load 8 r13 0
    r5 = add r5 r3 64
    store 8 r5 r13 0
    r7 = add r9 3 32
    r1 = udiv r7 2147483648 64
    r1 = mul r1 18446744071562067968 64
    r1 = or r1 r7 64
    r2 = mul arg5 1 64
    r6 = mul r1 8 64
    r2 = add r2 r6 64
    r2 = load 8 r2 0
    r6 = add r10 3 32
    r14 = mul arg4 1 64
    r8 = mul r6 8 64
    r14 = add r14 r8 64
    r8 = load 8 r14 0
    r8 = add r8 r2 64
    store 8 r8 r14 0
    r3 = load 8 sp 0
    r4 = add r3 1 8
    store 8 r4 sp 0
    br .for.cond

  .for.end20:
    ret 0
end add_mask

; Function mask_mul
start mask_mul 3:
  .entry:
    ; init sp!
    sp = sub sp 32 64
    store 8 0 sp 0
    br .for.cond

  .for.cond:
    r1 = load 8 sp 0
    r10 = icmp slt r1 4 32
    br r10 .for.body .for.end33

  .for.body:
    r1 = load 8 sp 0
    r9 = mul r1 4 32
    store 8 0 sp 8
    br .for.cond2

  .for.end33:
    ret 0

  .for.cond2:
    r7 = load 8 sp 8
    r11 = icmp slt r7 4 32
    br r11 .for.body6 .for.end30

  .for.body6:
    r4 = udiv r9 2147483648 64
    r4 = mul r4 18446744071562067968 64
    r4 = or r4 r9 64
    r12 = mul arg2 1 64
    r8 = mul r4 8 64
    r12 = add r12 r8 64
    r13 = load 8 r12 0
    r7 = load 8 sp 8
    r5 = udiv r7 2147483648 64
    r5 = mul r5 18446744071562067968 64
    r7 = load 8 sp 8
    r5 = or r5 r7 64
    r14 = mul arg3 1 64
    r2 = mul r5 8 64
    r14 = add r14 r2 64
    r15 = load 8 r14 0
    r16 = mul r13 r15 64
    r8 = add r9 1 32
    r6 = udiv r8 2147483648 64
    r6 = mul r6 18446744071562067968 64
    r6 = or r6 r8 64
    r3 = mul arg2 1 64
    r2 = mul r6 8 64
    r3 = add r3 r2 64
    r3 = load 8 r3 0
    r7 = load 8 sp 8
    r2 = add 4 r7 32
    r1 = udiv r2 2147483648 64
    r1 = mul r1 18446744071562067968 64
    r1 = or r1 r2 64
    r7 = mul arg3 1 64
    r4 = mul r1 8 64
    r7 = add r7 r4 64
    r7 = load 8 r7 0
    r3 = mul r3 r7 64
    r3 = add r16 r3 64
    store 8 r3 sp 16
    r4 = add r9 2 32
    r5 = udiv r4 2147483648 64
    r5 = mul r5 18446744071562067968 64
    r5 = or r5 r4 64
    r8 = mul arg2 1 64
    r6 = mul r5 8 64
    r8 = add r8 r6 64
    r8 = load 8 r8 0
    r6 = load 8 sp 8
    r2 = add 8 r6 32
    r1 = udiv r2 2147483648 64
    r1 = mul r1 18446744071562067968 64
    r1 = or r1 r2 64
    r7 = mul arg3 1 64
    r3 = mul r1 8 64
    r7 = add r7 r3 64
    r7 = load 8 r7 0
    r8 = mul r8 r7 64
    r3 = load 8 sp 16
    r3 = add r3 r8 64
    store 8 r3 sp 24
    r4 = add r9 3 32
    r5 = udiv r4 2147483648 64
    r5 = mul r5 18446744071562067968 64
    r5 = or r5 r4 64
    r6 = mul arg2 1 64
    r2 = mul r5 8 64
    r6 = add r6 r2 64
    r6 = load 8 r6 0
    r2 = load 8 sp 8
    r1 = add 12 r2 32
    r7 = udiv r1 2147483648 64
    r7 = mul r7 18446744071562067968 64
    r7 = or r7 r1 64
    r8 = mul arg3 1 64
    r3 = mul r7 8 64
    r8 = add r8 r3 64
    r8 = load 8 r8 0
    r6 = mul r6 r8 64
    r3 = load 8 sp 24
    r3 = add r3 r6 64
    r4 = add r9 r2 32
    r5 = udiv r4 2147483648 64
    r5 = mul r5 18446744071562067968 64
    r5 = or r5 r4 64
    r2 = mul arg1 1 64
    r1 = mul r5 8 64
    r2 = add r2 r1 64
    store 8 r3 r2 0
    r1 = load 8 sp 8
    r7 = add r1 1 8
    store 8 r7 sp 8
    br .for.cond2

  .for.end30:
    r8 = load 8 sp 0
    r6 = add r8 1 8
    store 8 r6 sp 0
    br .for.cond
end mask_mul

; Function matmul
start matmul 4:
  .entry:
    ; init sp!
    sp = sub sp 408 64
    r1 = add sp 24 64
    r3 = add sp 152 64
    r5 = add sp 280 64
    r9 = mul r3 1 64
    r10 = mul r5 1 64
    r11 = mul r1 1 64
    store 8 0 sp 0
    br .for.cond

  .for.cond:
    r8 = load 8 sp 0
    r12 = icmp ult r8 arg1 32
    store 8 0 sp 8
    br r12 .for.cond1 .for.end17

  .for.cond1:
    r7 = load 8 sp 8
    r13 = icmp ult r7 arg1 32
    store 8 0 sp 16
    br r13 .for.cond4 .for.end14

  .for.end17:
    ret 0

  .for.cond4:
    r2 = load 8 sp 16
    r14 = icmp ult r2 arg1 32
    br r14 .for.body6 .for.end

  .for.end14:
    r15 = add r8 4 32
    store 8 r15 sp 0
    br .for.cond

  .for.body6:
    call copy_mask arg1 r8 r2 arg3 r9
    call copy_mask arg1 r2 r7 arg4 r10
    call mask_mul r11 r9 r10
    call add_mask arg1 r8 r7 arg2 r11
    r16 = add r2 4 32
    store 8 r16 sp 16
    br .for.cond4

  .for.end:
    r4 = add r7 4 32
    store 8 r4 sp 8
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
    r10 = call read
    r2 = urem r10 4294967296 64
    r11 = urem r2 4 32
    r12 = icmp ne r11 0 32
    br r12 .cleanup .if.end

  .cleanup:
    ret 0

  .if.end:
    r13 = mul r2 r2 32
    r9 = mul r13 8 64
    r14 = malloc r9
    r5 = mul r14 1 64
    r15 = malloc r9
    r8 = mul r15 1 64
    r16 = malloc r9
    r4 = mul r16 1 64
    call read_mat r2 r5
    call read_mat r2 r8
    call matmul r2 r4 r5 r8
    call print_mat r2 r4
    br .cleanup
end main
