
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
    br r11 .for.cond2.preheader .for.end19

  .for.cond2.preheader:
    r1 = load 8 sp 0
    r12 = add arg2 r1 32
    r13 = mul r12 arg1 32
    r9 = add r13 arg3 32
    r10 = mul r1 4 32
    r14 = mul arg4 1 64
    r2 = mul r9 8 64
    r14 = add r14 r2 64
    r15 = load 8 r14 0
    r3 = udiv r10 2147483648 64
    r3 = mul r3 18446744071562067968 64
    r3 = or r3 r10 64
    r16 = mul arg5 1 64
    r4 = mul r3 8 64
    r16 = add r16 r4 64
    store 8 r15 r16 0
    r5 = add r9 1 32
    r6 = mul arg4 1 64
    r7 = mul r5 8 64
    r6 = add r6 r7 64
    r6 = load 8 r6 0
    r8 = add r10 1 32
    r2 = udiv r8 2147483648 64
    r2 = mul r2 18446744071562067968 64
    r2 = or r2 r8 64
    r4 = mul arg5 1 64
    r7 = mul r2 8 64
    r4 = add r4 r7 64
    store 8 r6 r4 0
    r7 = add r9 2 32
    r1 = mul arg4 1 64
    r3 = mul r7 8 64
    r1 = add r1 r3 64
    r1 = load 8 r1 0
    r3 = add r10 2 32
    r5 = udiv r3 2147483648 64
    r5 = mul r5 18446744071562067968 64
    r5 = or r5 r3 64
    r8 = mul arg5 1 64
    r2 = mul r5 8 64
    r8 = add r8 r2 64
    store 8 r1 r8 0
    r2 = add r9 3 32
    r6 = mul arg4 1 64
    r4 = mul r2 8 64
    r6 = add r6 r4 64
    r6 = load 8 r6 0
    r4 = add r10 3 32
    r7 = udiv r4 2147483648 64
    r7 = mul r7 18446744071562067968 64
    r7 = or r7 r4 64
    r3 = mul arg5 1 64
    r5 = mul r7 8 64
    r3 = add r3 r5 64
    store 8 r6 r3 0
    r5 = load 8 sp 0
    r1 = add r5 1 8
    store 8 r1 sp 0
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
    br r15 .for.cond2.preheader .for.end20

  .for.cond2.preheader:
    r1 = load 8 sp 0
    r9 = mul r1 4 32
    r16 = add arg2 r1 32
    r2 = mul r16 arg1 32
    r10 = add r2 arg3 32
    r3 = udiv r9 2147483648 64
    r3 = mul r3 18446744071562067968 64
    r3 = or r3 r9 64
    r4 = mul arg5 1 64
    r5 = mul r3 8 64
    r4 = add r4 r5 64
    r4 = load 8 r4 0
    r11 = mul arg4 1 64
    r6 = mul r10 8 64
    r11 = add r11 r6 64
    r7 = load 8 r11 0
    r7 = add r7 r4 64
    store 8 r7 r11 0
    r8 = add r9 1 32
    r5 = udiv r8 2147483648 64
    r5 = mul r5 18446744071562067968 64
    r5 = or r5 r8 64
    r6 = mul arg5 1 64
    r1 = mul r5 8 64
    r6 = add r6 r1 64
    r6 = load 8 r6 0
    r1 = add r10 1 32
    r12 = mul arg4 1 64
    r2 = mul r1 8 64
    r12 = add r12 r2 64
    r2 = load 8 r12 0
    r2 = add r2 r6 64
    store 8 r2 r12 0
    r3 = add r9 2 32
    r4 = udiv r3 2147483648 64
    r4 = mul r4 18446744071562067968 64
    r4 = or r4 r3 64
    r7 = mul arg5 1 64
    r8 = mul r4 8 64
    r7 = add r7 r8 64
    r7 = load 8 r7 0
    r8 = add r10 2 32
    r13 = mul arg4 1 64
    r5 = mul r8 8 64
    r13 = add r13 r5 64
    r5 = load 8 r13 0
    r5 = add r5 r7 64
    store 8 r5 r13 0
    r1 = add r9 3 32
    r6 = udiv r1 2147483648 64
    r6 = mul r6 18446744071562067968 64
    r6 = or r6 r1 64
    r2 = mul arg5 1 64
    r3 = mul r6 8 64
    r2 = add r2 r3 64
    r2 = load 8 r2 0
    r3 = add r10 3 32
    r14 = mul arg4 1 64
    r4 = mul r3 8 64
    r14 = add r14 r4 64
    r4 = load 8 r14 0
    r4 = add r4 r2 64
    store 8 r4 r14 0
    r8 = load 8 sp 0
    r7 = add r8 1 8
    store 8 r7 sp 0
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
    br r10 .for.cond2.preheader .for.end33

  .for.cond2.preheader:
    r1 = load 8 sp 0
    r9 = mul r1 4 32
    store 8 0 sp 8
    br .for.cond2

  .for.end33:
    ret 0

  .for.cond2:
    r2 = load 8 sp 8
    r11 = icmp slt r2 4 32
    br r11 .for.cond7.preheader .for.inc31

  .for.cond7.preheader:
    r3 = udiv r9 2147483648 64
    r3 = mul r3 18446744071562067968 64
    r3 = or r3 r9 64
    r12 = mul arg2 1 64
    r4 = mul r3 8 64
    r12 = add r12 r4 64
    r13 = load 8 r12 0
    r2 = load 8 sp 8
    r5 = udiv r2 2147483648 64
    r5 = mul r5 18446744071562067968 64
    r5 = or r5 r2 64
    r14 = mul arg3 1 64
    r6 = mul r5 8 64
    r14 = add r14 r6 64
    r15 = load 8 r14 0
    r16 = mul r13 r15 64
    r7 = add r9 1 32
    r8 = udiv r7 2147483648 64
    r8 = mul r8 18446744071562067968 64
    r8 = or r8 r7 64
    r4 = mul arg2 1 64
    r6 = mul r8 8 64
    r4 = add r4 r6 64
    r4 = load 8 r4 0
    r6 = add 4 r2 32
    r1 = udiv r6 2147483648 64
    r1 = mul r1 18446744071562067968 64
    r1 = or r1 r6 64
    r3 = mul arg3 1 64
    r5 = mul r1 8 64
    r3 = add r3 r5 64
    r3 = load 8 r3 0
    r4 = mul r4 r3 64
    r4 = add r16 r4 64
    store 8 r4 sp 16
    r5 = add r9 2 32
    r7 = udiv r5 2147483648 64
    r7 = mul r7 18446744071562067968 64
    r7 = or r7 r5 64
    r8 = mul arg2 1 64
    r2 = mul r7 8 64
    r8 = add r8 r2 64
    r8 = load 8 r8 0
    r2 = load 8 sp 8
    r6 = add 8 r2 32
    r1 = udiv r6 2147483648 64
    r1 = mul r1 18446744071562067968 64
    r1 = or r1 r6 64
    r3 = mul arg3 1 64
    r4 = mul r1 8 64
    r3 = add r3 r4 64
    r3 = load 8 r3 0
    r8 = mul r8 r3 64
    r4 = load 8 sp 16
    r4 = add r4 r8 64
    store 8 r4 sp 24
    r5 = add r9 3 32
    r7 = udiv r5 2147483648 64
    r7 = mul r7 18446744071562067968 64
    r7 = or r7 r5 64
    r2 = mul arg2 1 64
    r6 = mul r7 8 64
    r2 = add r2 r6 64
    r2 = load 8 r2 0
    r6 = load 8 sp 8
    r1 = add 12 r6 32
    r3 = udiv r1 2147483648 64
    r3 = mul r3 18446744071562067968 64
    r3 = or r3 r1 64
    r8 = mul arg3 1 64
    r4 = mul r3 8 64
    r8 = add r8 r4 64
    r8 = load 8 r8 0
    r2 = mul r2 r8 64
    r4 = load 8 sp 24
    r4 = add r4 r2 64
    r5 = add r9 r6 32
    r7 = udiv r5 2147483648 64
    r7 = mul r7 18446744071562067968 64
    r7 = or r7 r5 64
    r1 = mul arg1 1 64
    r3 = mul r7 8 64
    r1 = add r1 r3 64
    store 8 r4 r1 0
    r3 = add r6 1 8
    store 8 r3 sp 8
    br .for.cond2

  .for.inc31:
    r8 = load 8 sp 0
    r2 = add r8 1 8
    store 8 r2 sp 0
    br .for.cond
end mask_mul

; Function matmul
start matmul 4:
  .entry:
    ; init sp!
    sp = sub sp 408 64
    r1 = add sp 24 64
    r2 = add sp 152 64
    r3 = add sp 280 64
    r9 = mul r2 1 64
    r10 = mul r3 1 64
    r11 = mul r1 1 64
    store 8 0 sp 0
    br .for.cond

  .for.cond:
    r4 = load 8 sp 0
    r12 = icmp ult r4 arg1 32
    store 8 0 sp 8
    br r12 .for.cond1 .for.end17

  .for.cond1:
    r5 = load 8 sp 8
    r13 = icmp ult r5 arg1 32
    store 8 0 sp 16
    br r13 .for.cond4 .for.inc15

  .for.end17:
    ret 0

  .for.cond4:
    r6 = load 8 sp 16
    r14 = icmp ult r6 arg1 32
    br r14 .for.body6 .for.inc12

  .for.inc15:
    r15 = add r4 4 32
    store 8 r15 sp 0
    br .for.cond

  .for.body6:
    call copy_mask arg1 r4 r6 arg3 r9
    call copy_mask arg1 r6 r5 arg4 r10
    call mask_mul r11 r9 r10
    call add_mask arg1 r4 r5 arg2 r11
    r16 = add r6 4 32
    store 8 r16 sp 16
    br .for.cond4

  .for.inc12:
    r7 = add r5 4 32
    store 8 r7 sp 8
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
    r3 = urem r2 4 32
    r3 = icmp ne r3 0 32
    br r3 .cleanup .if.end

  .cleanup:
    ret 0

  .if.end:
    r2 = load 8 sp 0
    r4 = mul r2 r2 32
    r9 = mul r4 8 64
    r5 = malloc r9
    store 8 r5 sp 8
    r7 = malloc r9
    store 8 r7 sp 16
    r1 = malloc r9
    store 8 r1 sp 24
    store 8 0 sp 32
    br .for.cond.i3

  .for.cond.i3:
    r2 = load 8 sp 32
    r4 = load 8 sp 0
    r10 = icmp ult r2 r4 32
    store 8 0 sp 40
    br r10 .for.cond1.i7.preheader .for.cond.i

  .for.cond1.i7.preheader:
    r2 = load 8 sp 32
    r4 = load 8 sp 0
    r11 = mul r2 r4 32
    store 8 0 sp 48
    br .for.cond1.i7

  .for.cond.i:
    r5 = load 8 sp 40
    r4 = load 8 sp 0
    r12 = icmp ult r5 r4 32
    br r12 .for.cond1.i.preheader .read_mat.exit

  .for.cond1.i7:
    r6 = load 8 sp 48
    r4 = load 8 sp 0
    r13 = icmp ult r6 r4 32
    br r13 .for.body3.i13 .for.end.i15

  .for.cond1.i.preheader:
    r5 = load 8 sp 40
    r4 = load 8 sp 0
    r14 = mul r5 r4 32
    store 8 0 sp 56
    br .for.cond1.i

  .read_mat.exit:
    r7 = load 8 sp 8
    r4 = load 8 sp 0
    r8 = load 8 sp 16
    r3 = load 8 sp 24
    call matmul r4 r3 r7 r8
    call print_mat r4 r3
    br .cleanup

  .for.body3.i13:
    r15 = call read
    r6 = load 8 sp 48
    r16 = add r11 r6 32
    r7 = load 8 sp 8
    r2 = mul r16 8 64
    r1 = add r7 r2 64
    store 8 r15 r1 0
    r2 = add r6 1 32
    store 8 r2 sp 48
    br .for.cond1.i7

  .for.end.i15:
    r5 = load 8 sp 32
    r8 = add r5 1 32
    store 8 r8 sp 32
    br .for.cond.i3

  .for.cond1.i:
    r4 = load 8 sp 56
    r3 = load 8 sp 0
    r7 = icmp ult r4 r3 32
    br r7 .for.body3.i .for.end.i

  .for.body3.i:
    r1 = call read
    r6 = add r14 r4 32
    r2 = load 8 sp 16
    r8 = mul r6 8 64
    r5 = add r2 r8 64
    store 8 r1 r5 0
    r8 = add r4 1 32
    store 8 r8 sp 56
    br .for.cond1.i

  .for.end.i:
    r3 = load 8 sp 40
    r7 = add r3 1 32
    store 8 r7 sp 40
    br .for.cond.i
end main
