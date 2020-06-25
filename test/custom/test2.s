
; Function main
start main 0:
  .entry:
    ; init sp!
    sp = sub sp 344 64
    r9 = call read
    r1 = add r9 0 64
    r2 = add r9 1 64
    r3 = add r9 2 64
    r4 = add r9 3 64
    r5 = add r9 4 64
    r6 = add r9 5 64
    r7 = add r9 6 64
    r8 = add r9 7 64
    store 8 r1 sp 0
    r1 = add r9 8 64
    store 8 r2 sp 8
    r2 = add r9 9 64
    store 8 r3 sp 16
    r3 = add r9 10 64
    store 8 r4 sp 24
    r4 = add r9 11 64
    store 8 r5 sp 32
    r5 = add r9 12 64
    store 8 r6 sp 40
    r6 = add r9 13 64
    store 8 r7 sp 48
    r7 = add r9 14 64
    store 8 r8 sp 56
    r8 = add r9 15 64
    store 8 r1 sp 64
    r1 = add r9 16 64
    store 8 r2 sp 72
    r2 = add r9 17 64
    store 8 r3 sp 80
    r3 = add r9 18 64
    store 8 r4 sp 88
    r4 = add r9 19 64
    store 8 r5 sp 96
    r5 = add r9 20 64
    store 8 r6 sp 104
    r6 = add r9 21 64
    store 8 r7 sp 112
    r7 = add r9 22 64
    store 8 r8 sp 120
    r8 = add r9 23 64
    store 8 r1 sp 128
    r1 = add r9 24 64
    store 8 r2 sp 136
    r2 = add r9 25 64
    store 8 r3 sp 144
    r3 = add r9 26 64
    store 8 r4 sp 152
    r4 = add r9 27 64
    store 8 r5 sp 160
    r5 = add r9 28 64
    store 8 r6 sp 168
    r6 = add r9 29 64
    store 8 r7 sp 176
    r7 = add r9 30 64
    store 8 r8 sp 184
    r8 = add r9 31 64
    store 8 r1 sp 192
    r1 = add r9 32 64
    store 8 r2 sp 200
    r2 = add r9 33 64
    store 8 r3 sp 208
    r3 = add r9 34 64
    store 8 r4 sp 216
    r4 = add r9 35 64
    store 8 r5 sp 224
    r5 = add r9 36 64
    store 8 r6 sp 232
    r6 = add r9 37 64
    store 8 r7 sp 240
    r7 = add r9 38 64
    store 8 r8 sp 248
    r8 = add r9 39 64
    store 8 r1 sp 256
    r16 = add r9 40 64
    r15 = add r9 41 64
    r14 = add r9 42 64
    r13 = add r9 43 64
    r12 = add r9 44 64
    r11 = add r9 45 64
    r10 = add r9 46 64
    r1 = add r9 47 64
    store 8 r2 sp 264
    r2 = add r9 48 64
    store 8 r3 sp 272
    r3 = add r9 49 64
    store 8 r4 sp 280
    r4 = load 8 sp 0
    call write r4
    store 8 r5 sp 288
    r5 = load 8 sp 8
    call write r5
    store 8 r6 sp 296
    r6 = load 8 sp 16
    call write r6
    store 8 r7 sp 304
    r7 = load 8 sp 24
    call write r7
    store 8 r8 sp 312
    r8 = load 8 sp 32
    call write r8
    store 8 r1 sp 320
    r1 = load 8 sp 40
    call write r1
    store 8 r2 sp 328
    r2 = load 8 sp 48
    call write r2
    store 8 r3 sp 336
    r3 = load 8 sp 56
    call write r3
    store 8 r4 sp 0
    r4 = load 8 sp 64
    call write r4
    store 8 r5 sp 8
    r5 = load 8 sp 72
    call write r5
    store 8 r6 sp 16
    r6 = load 8 sp 80
    call write r6
    store 8 r7 sp 24
    r7 = load 8 sp 88
    call write r7
    store 8 r8 sp 32
    r8 = load 8 sp 96
    call write r8
    store 8 r1 sp 40
    r1 = load 8 sp 104
    call write r1
    store 8 r2 sp 48
    r2 = load 8 sp 112
    call write r2
    store 8 r3 sp 56
    r3 = load 8 sp 120
    call write r3
    store 8 r4 sp 64
    r4 = load 8 sp 128
    call write r4
    store 8 r5 sp 72
    r5 = load 8 sp 136
    call write r5
    store 8 r6 sp 80
    r6 = load 8 sp 144
    call write r6
    store 8 r7 sp 88
    r7 = load 8 sp 152
    call write r7
    store 8 r8 sp 96
    r8 = load 8 sp 160
    call write r8
    store 8 r1 sp 104
    r1 = load 8 sp 168
    call write r1
    store 8 r2 sp 112
    r2 = load 8 sp 176
    call write r2
    store 8 r3 sp 120
    r3 = load 8 sp 184
    call write r3
    store 8 r4 sp 128
    r4 = load 8 sp 192
    call write r4
    store 8 r5 sp 136
    r5 = load 8 sp 200
    call write r5
    store 8 r6 sp 144
    r6 = load 8 sp 208
    call write r6
    store 8 r7 sp 152
    r7 = load 8 sp 216
    call write r7
    store 8 r8 sp 160
    r8 = load 8 sp 224
    call write r8
    store 8 r1 sp 168
    r1 = load 8 sp 232
    call write r1
    store 8 r2 sp 176
    r2 = load 8 sp 240
    call write r2
    store 8 r3 sp 184
    r3 = load 8 sp 248
    call write r3
    store 8 r4 sp 192
    r4 = load 8 sp 256
    call write r4
    store 8 r5 sp 200
    r5 = load 8 sp 264
    call write r5
    store 8 r6 sp 208
    r6 = load 8 sp 272
    call write r6
    store 8 r7 sp 216
    r7 = load 8 sp 280
    call write r7
    store 8 r8 sp 224
    r8 = load 8 sp 288
    call write r8
    store 8 r1 sp 232
    r1 = load 8 sp 296
    call write r1
    store 8 r2 sp 240
    r2 = load 8 sp 304
    call write r2
    store 8 r3 sp 248
    r3 = load 8 sp 312
    call write r3
    call write r16
    call write r15
    call write r14
    call write r13
    call write r12
    call write r11
    call write r10
    store 8 r4 sp 256
    r4 = load 8 sp 320
    call write r4
    store 8 r5 sp 264
    r5 = load 8 sp 328
    call write r5
    store 8 r6 sp 272
    r6 = load 8 sp 336
    call write r6
    ret 0
end main
