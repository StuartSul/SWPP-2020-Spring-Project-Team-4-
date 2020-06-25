
; Function matmul
start matmul 4:
  .entry:
    ; init sp!
    sp = sub sp 416 64
    store 8 0 sp 0
    br .for.cond

  .for.cond:
    r1 = load 8 sp 0
    r4 = icmp ult r1 arg1 32
    br r4 .for.body .for.end425

  .for.body:
    r1 = load 8 sp 0
    r8 = mul r1 arg1 32
    store 8 r8 sp 8
    r1 = load 8 sp 0
    r5 = add r1 1 32
    r5 = mul r5 arg1 32
    store 8 r5 sp 16
    r1 = load 8 sp 0
    r6 = add r1 2 32
    r6 = mul r6 arg1 32
    store 8 r6 sp 24
    r1 = load 8 sp 0
    r2 = add r1 3 32
    r2 = mul r2 arg1 32
    store 8 r2 sp 32
    store 8 0 sp 40
    br .for.cond1

  .for.end425:
    ret 0

  .for.cond1:
    r7 = load 8 sp 40
    r3 = icmp ult r7 arg1 32
    br r3 .for.body3 .for.end422

  .for.body3:
    r8 = load 8 sp 8
    r7 = load 8 sp 40
    r9 = add r8 r7 32
    r1 = mul arg2 1 64
    r4 = mul r9 8 64
    r1 = add r1 r4 64
    store 8 r1 sp 48
    r4 = add r9 1 32
    r8 = mul arg2 1 64
    r5 = mul r4 8 64
    r8 = add r8 r5 64
    store 8 r8 sp 56
    r5 = add r9 2 32
    r6 = mul arg2 1 64
    r7 = mul r5 8 64
    r6 = add r6 r7 64
    store 8 r6 sp 64
    r7 = add r9 3 32
    r2 = mul arg2 1 64
    r3 = mul r7 8 64
    r2 = add r2 r3 64
    store 8 r2 sp 72
    r3 = load 8 sp 16
    r1 = load 8 sp 40
    r10 = add r3 r1 32
    r4 = mul arg2 1 64
    r8 = mul r10 8 64
    r4 = add r4 r8 64
    store 8 r4 sp 80
    r8 = add r10 1 32
    r5 = mul arg2 1 64
    r6 = mul r8 8 64
    r5 = add r5 r6 64
    store 8 r5 sp 88
    r6 = add r10 2 32
    r7 = mul arg2 1 64
    r2 = mul r6 8 64
    r7 = add r7 r2 64
    store 8 r7 sp 96
    r2 = add r10 3 32
    r3 = mul arg2 1 64
    r1 = mul r2 8 64
    r3 = add r3 r1 64
    store 8 r3 sp 104
    r1 = load 8 sp 24
    r4 = load 8 sp 40
    r11 = add r1 r4 32
    r8 = mul arg2 1 64
    r5 = mul r11 8 64
    r8 = add r8 r5 64
    store 8 r8 sp 112
    r5 = add r11 1 32
    r6 = mul arg2 1 64
    r7 = mul r5 8 64
    r6 = add r6 r7 64
    store 8 r6 sp 120
    r7 = add r11 2 32
    r2 = mul arg2 1 64
    r3 = mul r7 8 64
    r2 = add r2 r3 64
    store 8 r2 sp 128
    r3 = add r11 3 32
    r1 = mul arg2 1 64
    r4 = mul r3 8 64
    r1 = add r1 r4 64
    store 8 r1 sp 136
    r4 = load 8 sp 32
    r8 = load 8 sp 40
    r12 = add r4 r8 32
    r5 = mul arg2 1 64
    r6 = mul r12 8 64
    r5 = add r5 r6 64
    store 8 r5 sp 144
    r6 = add r12 1 32
    r7 = mul arg2 1 64
    r2 = mul r6 8 64
    r7 = add r7 r2 64
    store 8 r7 sp 152
    r2 = add r12 2 32
    r3 = mul arg2 1 64
    r1 = mul r2 8 64
    r3 = add r3 r1 64
    store 8 r3 sp 160
    r1 = add r12 3 32
    r4 = mul arg2 1 64
    r8 = mul r1 8 64
    r4 = add r4 r8 64
    store 8 r4 sp 168
    store 8 0 sp 176
    br .for.cond4

  .for.end422:
    r8 = load 8 sp 0
    r5 = add r8 4 32
    store 8 r5 sp 0
    br .for.cond

  .for.cond4:
    r6 = load 8 sp 176
    r7 = icmp ult r6 arg1 32
    br r7 .for.body6 .for.end

  .for.body6:
    r2 = load 8 sp 8
    r6 = load 8 sp 176
    r13 = add r2 r6 32
    r3 = mul arg3 1 64
    r1 = mul r13 8 64
    r3 = add r3 r1 64
    r14 = load 8 r3 0
    r1 = add r13 1 32
    r4 = mul arg3 1 64
    r8 = mul r1 8 64
    r4 = add r4 r8 64
    r15 = load 8 r4 0
    r8 = add r13 2 32
    r5 = mul arg3 1 64
    r6 = mul r8 8 64
    r5 = add r5 r6 64
    r16 = load 8 r5 0
    r6 = add r13 3 32
    r7 = mul arg3 1 64
    r2 = mul r6 8 64
    r7 = add r7 r2 64
    r7 = load 8 r7 0
    store 8 r7 sp 184
    r2 = load 8 sp 16
    r3 = load 8 sp 176
    r1 = add r2 r3 32
    r4 = mul arg3 1 64
    r8 = mul r1 8 64
    r4 = add r4 r8 64
    r4 = load 8 r4 0
    store 8 r4 sp 192
    r8 = add r1 1 32
    r5 = mul arg3 1 64
    r6 = mul r8 8 64
    r5 = add r5 r6 64
    r5 = load 8 r5 0
    store 8 r5 sp 200
    r6 = add r1 2 32
    r7 = mul arg3 1 64
    r2 = mul r6 8 64
    r7 = add r7 r2 64
    r7 = load 8 r7 0
    store 8 r7 sp 208
    r2 = add r1 3 32
    r3 = mul arg3 1 64
    r1 = mul r2 8 64
    r3 = add r3 r1 64
    r3 = load 8 r3 0
    store 8 r3 sp 216
    r1 = load 8 sp 24
    r4 = load 8 sp 176
    r8 = add r1 r4 32
    r5 = mul arg3 1 64
    r6 = mul r8 8 64
    r5 = add r5 r6 64
    r5 = load 8 r5 0
    store 8 r5 sp 224
    r6 = add r8 1 32
    r7 = mul arg3 1 64
    r2 = mul r6 8 64
    r7 = add r7 r2 64
    r7 = load 8 r7 0
    store 8 r7 sp 232
    r2 = add r8 2 32
    r3 = mul arg3 1 64
    r1 = mul r2 8 64
    r3 = add r3 r1 64
    r3 = load 8 r3 0
    store 8 r3 sp 240
    r1 = add r8 3 32
    r4 = mul arg3 1 64
    r8 = mul r1 8 64
    r4 = add r4 r8 64
    r4 = load 8 r4 0
    store 8 r4 sp 248
    r8 = load 8 sp 32
    r5 = load 8 sp 176
    r6 = add r8 r5 32
    r7 = mul arg3 1 64
    r2 = mul r6 8 64
    r7 = add r7 r2 64
    r7 = load 8 r7 0
    store 8 r7 sp 256
    r2 = add r6 1 32
    r3 = mul arg3 1 64
    r1 = mul r2 8 64
    r3 = add r3 r1 64
    r3 = load 8 r3 0
    store 8 r3 sp 264
    r1 = add r6 2 32
    r4 = mul arg3 1 64
    r8 = mul r1 8 64
    r4 = add r4 r8 64
    r4 = load 8 r4 0
    store 8 r4 sp 272
    r8 = add r6 3 32
    r5 = mul arg3 1 64
    r6 = mul r8 8 64
    r5 = add r5 r6 64
    r5 = load 8 r5 0
    store 8 r5 sp 280
    r6 = load 8 sp 176
    r7 = mul r6 arg1 32
    r2 = load 8 sp 40
    r7 = add r7 r2 32
    r3 = mul arg4 1 64
    r1 = mul r7 8 64
    r3 = add r3 r1 64
    r3 = load 8 r3 0
    store 8 r3 sp 288
    r1 = add r7 1 32
    r4 = mul arg4 1 64
    r8 = mul r1 8 64
    r4 = add r4 r8 64
    r4 = load 8 r4 0
    store 8 r4 sp 296
    r8 = add r7 2 32
    r5 = mul arg4 1 64
    r6 = mul r8 8 64
    r5 = add r5 r6 64
    r5 = load 8 r5 0
    store 8 r5 sp 304
    r6 = add r7 3 32
    r2 = mul arg4 1 64
    r7 = mul r6 8 64
    r2 = add r2 r7 64
    r2 = load 8 r2 0
    store 8 r2 sp 312
    r7 = load 8 sp 176
    r3 = add r7 1 32
    r3 = mul r3 arg1 32
    r1 = load 8 sp 40
    r3 = add r3 r1 32
    r4 = mul arg4 1 64
    r8 = mul r3 8 64
    r4 = add r4 r8 64
    r4 = load 8 r4 0
    store 8 r4 sp 320
    r8 = add r3 1 32
    r5 = mul arg4 1 64
    r6 = mul r8 8 64
    r5 = add r5 r6 64
    r5 = load 8 r5 0
    store 8 r5 sp 328
    r6 = add r3 2 32
    r2 = mul arg4 1 64
    r7 = mul r6 8 64
    r2 = add r2 r7 64
    r2 = load 8 r2 0
    store 8 r2 sp 336
    r7 = add r3 3 32
    r1 = mul arg4 1 64
    r3 = mul r7 8 64
    r1 = add r1 r3 64
    r1 = load 8 r1 0
    store 8 r1 sp 344
    r3 = load 8 sp 176
    r4 = add r3 2 32
    r4 = mul r4 arg1 32
    r8 = load 8 sp 40
    r4 = add r4 r8 32
    r5 = mul arg4 1 64
    r6 = mul r4 8 64
    r5 = add r5 r6 64
    r5 = load 8 r5 0
    store 8 r5 sp 352
    r6 = add r4 1 32
    r2 = mul arg4 1 64
    r7 = mul r6 8 64
    r2 = add r2 r7 64
    r2 = load 8 r2 0
    store 8 r2 sp 360
    r7 = add r4 2 32
    r1 = mul arg4 1 64
    r3 = mul r7 8 64
    r1 = add r1 r3 64
    r1 = load 8 r1 0
    store 8 r1 sp 368
    r3 = add r4 3 32
    r8 = mul arg4 1 64
    r4 = mul r3 8 64
    r8 = add r8 r4 64
    r8 = load 8 r8 0
    store 8 r8 sp 376
    r4 = load 8 sp 176
    r5 = add r4 3 32
    r5 = mul r5 arg1 32
    r6 = load 8 sp 40
    r5 = add r5 r6 32
    r2 = mul arg4 1 64
    r7 = mul r5 8 64
    r2 = add r2 r7 64
    r2 = load 8 r2 0
    store 8 r2 sp 384
    r7 = add r5 1 32
    r1 = mul arg4 1 64
    r3 = mul r7 8 64
    r1 = add r1 r3 64
    r1 = load 8 r1 0
    store 8 r1 sp 392
    r3 = add r5 2 32
    r8 = mul arg4 1 64
    r4 = mul r3 8 64
    r8 = add r8 r4 64
    r8 = load 8 r8 0
    store 8 r8 sp 400
    r4 = add r5 3 32
    r6 = mul arg4 1 64
    r5 = mul r4 8 64
    r6 = add r6 r5 64
    r6 = load 8 r6 0
    store 8 r6 sp 408
    r5 = load 8 sp 288
    r2 = mul r14 r5 64
    r7 = load 8 sp 320
    r1 = mul r15 r7 64
    r2 = add r2 r1 64
    r3 = load 8 sp 352
    r8 = mul r16 r3 64
    r2 = add r2 r8 64
    r4 = load 8 sp 184
    r6 = load 8 sp 384
    r5 = mul r4 r6 64
    r2 = add r2 r5 64
    r7 = load 8 sp 48
    r1 = load 8 r7 0
    r1 = add r1 r2 64
    store 8 r1 r7 0
    r3 = load 8 sp 296
    r8 = mul r14 r3 64
    r4 = load 8 sp 328
    r6 = mul r15 r4 64
    r8 = add r8 r6 64
    r5 = load 8 sp 360
    r2 = mul r16 r5 64
    r8 = add r8 r2 64
    r7 = load 8 sp 184
    r1 = load 8 sp 392
    r3 = mul r7 r1 64
    r8 = add r8 r3 64
    r4 = load 8 sp 56
    r6 = load 8 r4 0
    r6 = add r6 r8 64
    store 8 r6 r4 0
    r5 = load 8 sp 304
    r2 = mul r14 r5 64
    r7 = load 8 sp 336
    r1 = mul r15 r7 64
    r2 = add r2 r1 64
    r3 = load 8 sp 368
    r8 = mul r16 r3 64
    r2 = add r2 r8 64
    r4 = load 8 sp 184
    r6 = load 8 sp 400
    r5 = mul r4 r6 64
    r2 = add r2 r5 64
    r7 = load 8 sp 64
    r1 = load 8 r7 0
    r1 = add r1 r2 64
    store 8 r1 r7 0
    r3 = load 8 sp 312
    r8 = mul r14 r3 64
    r4 = load 8 sp 344
    r6 = mul r15 r4 64
    r8 = add r8 r6 64
    r5 = load 8 sp 376
    r2 = mul r16 r5 64
    r8 = add r8 r2 64
    r7 = load 8 sp 184
    r1 = load 8 sp 408
    r3 = mul r7 r1 64
    r8 = add r8 r3 64
    r4 = load 8 sp 72
    r6 = load 8 r4 0
    r6 = add r6 r8 64
    store 8 r6 r4 0
    r5 = load 8 sp 192
    r2 = load 8 sp 288
    r7 = mul r5 r2 64
    r1 = load 8 sp 200
    r3 = load 8 sp 320
    r8 = mul r1 r3 64
    r7 = add r7 r8 64
    r4 = load 8 sp 208
    r6 = load 8 sp 352
    r5 = mul r4 r6 64
    r7 = add r7 r5 64
    r2 = load 8 sp 216
    r1 = load 8 sp 384
    r3 = mul r2 r1 64
    r7 = add r7 r3 64
    r8 = load 8 sp 80
    r4 = load 8 r8 0
    r4 = add r4 r7 64
    store 8 r4 r8 0
    r6 = load 8 sp 192
    r5 = load 8 sp 296
    r2 = mul r6 r5 64
    r1 = load 8 sp 200
    r3 = load 8 sp 328
    r7 = mul r1 r3 64
    r2 = add r2 r7 64
    r8 = load 8 sp 208
    r4 = load 8 sp 360
    r6 = mul r8 r4 64
    r2 = add r2 r6 64
    r5 = load 8 sp 216
    r1 = load 8 sp 392
    r3 = mul r5 r1 64
    r2 = add r2 r3 64
    r7 = load 8 sp 88
    r8 = load 8 r7 0
    r8 = add r8 r2 64
    store 8 r8 r7 0
    r4 = load 8 sp 192
    r6 = load 8 sp 304
    r5 = mul r4 r6 64
    r1 = load 8 sp 200
    r3 = load 8 sp 336
    r2 = mul r1 r3 64
    r5 = add r5 r2 64
    r7 = load 8 sp 208
    r8 = load 8 sp 368
    r4 = mul r7 r8 64
    r5 = add r5 r4 64
    r6 = load 8 sp 216
    r1 = load 8 sp 400
    r3 = mul r6 r1 64
    r5 = add r5 r3 64
    r2 = load 8 sp 96
    r7 = load 8 r2 0
    r7 = add r7 r5 64
    store 8 r7 r2 0
    r8 = load 8 sp 192
    r4 = load 8 sp 312
    r6 = mul r8 r4 64
    r1 = load 8 sp 200
    r3 = load 8 sp 344
    r5 = mul r1 r3 64
    r6 = add r6 r5 64
    r2 = load 8 sp 208
    r7 = load 8 sp 376
    r8 = mul r2 r7 64
    r6 = add r6 r8 64
    r4 = load 8 sp 216
    r1 = load 8 sp 408
    r3 = mul r4 r1 64
    r6 = add r6 r3 64
    r5 = load 8 sp 104
    r2 = load 8 r5 0
    r2 = add r2 r6 64
    store 8 r2 r5 0
    r7 = load 8 sp 224
    r8 = load 8 sp 288
    r4 = mul r7 r8 64
    r1 = load 8 sp 232
    r3 = load 8 sp 320
    r6 = mul r1 r3 64
    r4 = add r4 r6 64
    r5 = load 8 sp 240
    r2 = load 8 sp 352
    r7 = mul r5 r2 64
    r4 = add r4 r7 64
    r8 = load 8 sp 248
    r1 = load 8 sp 384
    r3 = mul r8 r1 64
    r4 = add r4 r3 64
    r6 = load 8 sp 112
    r5 = load 8 r6 0
    r5 = add r5 r4 64
    store 8 r5 r6 0
    r2 = load 8 sp 224
    r7 = load 8 sp 296
    r8 = mul r2 r7 64
    r1 = load 8 sp 232
    r3 = load 8 sp 328
    r4 = mul r1 r3 64
    r8 = add r8 r4 64
    r6 = load 8 sp 240
    r5 = load 8 sp 360
    r2 = mul r6 r5 64
    r8 = add r8 r2 64
    r7 = load 8 sp 248
    r1 = load 8 sp 392
    r3 = mul r7 r1 64
    r8 = add r8 r3 64
    r4 = load 8 sp 120
    r6 = load 8 r4 0
    r6 = add r6 r8 64
    store 8 r6 r4 0
    r5 = load 8 sp 224
    r2 = load 8 sp 304
    r7 = mul r5 r2 64
    r1 = load 8 sp 232
    r3 = load 8 sp 336
    r8 = mul r1 r3 64
    r7 = add r7 r8 64
    r4 = load 8 sp 240
    r6 = load 8 sp 368
    r5 = mul r4 r6 64
    r7 = add r7 r5 64
    r2 = load 8 sp 248
    r1 = load 8 sp 400
    r3 = mul r2 r1 64
    r7 = add r7 r3 64
    r8 = load 8 sp 128
    r4 = load 8 r8 0
    r4 = add r4 r7 64
    store 8 r4 r8 0
    r6 = load 8 sp 224
    r5 = load 8 sp 312
    r2 = mul r6 r5 64
    r1 = load 8 sp 232
    r3 = load 8 sp 344
    r7 = mul r1 r3 64
    r2 = add r2 r7 64
    r8 = load 8 sp 240
    r4 = load 8 sp 376
    r6 = mul r8 r4 64
    r2 = add r2 r6 64
    r5 = load 8 sp 248
    r1 = load 8 sp 408
    r3 = mul r5 r1 64
    r2 = add r2 r3 64
    r7 = load 8 sp 136
    r8 = load 8 r7 0
    r8 = add r8 r2 64
    store 8 r8 r7 0
    r4 = load 8 sp 256
    r6 = load 8 sp 288
    r5 = mul r4 r6 64
    r1 = load 8 sp 264
    r3 = load 8 sp 320
    r2 = mul r1 r3 64
    r5 = add r5 r2 64
    r7 = load 8 sp 272
    r8 = load 8 sp 352
    r4 = mul r7 r8 64
    r5 = add r5 r4 64
    r6 = load 8 sp 280
    r1 = load 8 sp 384
    r3 = mul r6 r1 64
    r5 = add r5 r3 64
    r2 = load 8 sp 144
    r7 = load 8 r2 0
    r7 = add r7 r5 64
    store 8 r7 r2 0
    r8 = load 8 sp 256
    r4 = load 8 sp 296
    r6 = mul r8 r4 64
    r1 = load 8 sp 264
    r3 = load 8 sp 328
    r5 = mul r1 r3 64
    r6 = add r6 r5 64
    r2 = load 8 sp 272
    r7 = load 8 sp 360
    r8 = mul r2 r7 64
    r6 = add r6 r8 64
    r4 = load 8 sp 280
    r1 = load 8 sp 392
    r3 = mul r4 r1 64
    r6 = add r6 r3 64
    r5 = load 8 sp 152
    r2 = load 8 r5 0
    r2 = add r2 r6 64
    store 8 r2 r5 0
    r7 = load 8 sp 256
    r8 = load 8 sp 304
    r4 = mul r7 r8 64
    r1 = load 8 sp 264
    r3 = load 8 sp 336
    r6 = mul r1 r3 64
    r4 = add r4 r6 64
    r5 = load 8 sp 272
    r2 = load 8 sp 368
    r7 = mul r5 r2 64
    r4 = add r4 r7 64
    r8 = load 8 sp 280
    r1 = load 8 sp 400
    r3 = mul r8 r1 64
    r4 = add r4 r3 64
    r6 = load 8 sp 160
    r5 = load 8 r6 0
    r5 = add r5 r4 64
    store 8 r5 r6 0
    r2 = load 8 sp 256
    r7 = load 8 sp 312
    r8 = mul r2 r7 64
    r1 = load 8 sp 264
    r3 = load 8 sp 344
    r4 = mul r1 r3 64
    r8 = add r8 r4 64
    r6 = load 8 sp 272
    r5 = load 8 sp 376
    r2 = mul r6 r5 64
    r8 = add r8 r2 64
    r7 = load 8 sp 280
    r1 = load 8 sp 408
    r3 = mul r7 r1 64
    r8 = add r8 r3 64
    r4 = load 8 sp 168
    r6 = load 8 r4 0
    r6 = add r6 r8 64
    store 8 r6 r4 0
    r5 = load 8 sp 176
    r2 = add r5 4 32
    store 8 r2 sp 176
    br .for.cond4

  .for.end:
    r7 = load 8 sp 40
    r1 = add r7 4 32
    store 8 r1 sp 40
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
