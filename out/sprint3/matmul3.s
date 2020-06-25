
; Function matmul
start matmul 4:
  .entry:
    ; init sp!
    sp = sub sp 416 64
    store 8 0 sp 0
    br .for.cond

  .for.cond:
    r1 = load 8 sp 0
    r2 = icmp ult r1 arg1 32
    br r2 .for.cond1.preheader .for.end425

  .for.cond1.preheader:
    r1 = load 8 sp 0
    r3 = mul r1 arg1 32
    store 8 r3 sp 8
    r4 = add r1 1 32
    r4 = mul r4 arg1 32
    store 8 r4 sp 16
    r5 = add r1 2 32
    r5 = mul r5 arg1 32
    store 8 r5 sp 24
    r6 = add r1 3 32
    r6 = mul r6 arg1 32
    store 8 r6 sp 32
    store 8 0 sp 40
    br .for.cond1

  .for.end425:
    ret 0

  .for.cond1:
    r7 = load 8 sp 40
    r8 = icmp ult r7 arg1 32
    br r8 .for.cond4.preheader .for.inc423

  .for.cond4.preheader:
    r3 = load 8 sp 8
    r7 = load 8 sp 40
    r9 = add r3 r7 32
    r2 = mul arg2 1 64
    r4 = mul r9 8 64
    r2 = add r2 r4 64
    store 8 r2 sp 48
    r4 = add r9 1 32
    r5 = mul arg2 1 64
    r1 = mul r4 8 64
    r5 = add r5 r1 64
    store 8 r5 sp 56
    r1 = add r9 2 32
    r6 = mul arg2 1 64
    r8 = mul r1 8 64
    r6 = add r6 r8 64
    store 8 r6 sp 64
    r8 = add r9 3 32
    r3 = mul arg2 1 64
    r7 = mul r8 8 64
    r3 = add r3 r7 64
    store 8 r3 sp 72
    r7 = load 8 sp 16
    r2 = load 8 sp 40
    r10 = add r7 r2 32
    r5 = mul arg2 1 64
    r4 = mul r10 8 64
    r5 = add r5 r4 64
    store 8 r5 sp 80
    r4 = add r10 1 32
    r6 = mul arg2 1 64
    r1 = mul r4 8 64
    r6 = add r6 r1 64
    store 8 r6 sp 88
    r1 = add r10 2 32
    r3 = mul arg2 1 64
    r8 = mul r1 8 64
    r3 = add r3 r8 64
    store 8 r3 sp 96
    r8 = add r10 3 32
    r7 = mul arg2 1 64
    r2 = mul r8 8 64
    r7 = add r7 r2 64
    store 8 r7 sp 104
    r2 = load 8 sp 24
    r5 = load 8 sp 40
    r11 = add r2 r5 32
    r6 = mul arg2 1 64
    r4 = mul r11 8 64
    r6 = add r6 r4 64
    store 8 r6 sp 112
    r4 = add r11 1 32
    r3 = mul arg2 1 64
    r1 = mul r4 8 64
    r3 = add r3 r1 64
    store 8 r3 sp 120
    r1 = add r11 2 32
    r7 = mul arg2 1 64
    r8 = mul r1 8 64
    r7 = add r7 r8 64
    store 8 r7 sp 128
    r8 = add r11 3 32
    r2 = mul arg2 1 64
    r5 = mul r8 8 64
    r2 = add r2 r5 64
    store 8 r2 sp 136
    r5 = load 8 sp 32
    r6 = load 8 sp 40
    r12 = add r5 r6 32
    r3 = mul arg2 1 64
    r4 = mul r12 8 64
    r3 = add r3 r4 64
    store 8 r3 sp 144
    r4 = add r12 1 32
    r7 = mul arg2 1 64
    r1 = mul r4 8 64
    r7 = add r7 r1 64
    store 8 r7 sp 152
    r1 = add r12 2 32
    r2 = mul arg2 1 64
    r8 = mul r1 8 64
    r2 = add r2 r8 64
    store 8 r2 sp 160
    r8 = add r12 3 32
    r5 = mul arg2 1 64
    r6 = mul r8 8 64
    r5 = add r5 r6 64
    store 8 r5 sp 168
    store 8 0 sp 176
    br .for.cond4

  .for.inc423:
    r6 = load 8 sp 0
    r3 = add r6 4 32
    store 8 r3 sp 0
    br .for.cond

  .for.cond4:
    r7 = load 8 sp 176
    r4 = icmp ult r7 arg1 32
    br r4 .for.body6 .for.inc420

  .for.body6:
    r2 = load 8 sp 8
    r7 = load 8 sp 176
    r13 = add r2 r7 32
    r1 = mul arg3 1 64
    r5 = mul r13 8 64
    r1 = add r1 r5 64
    r14 = load 8 r1 0
    r5 = add r13 1 32
    r8 = mul arg3 1 64
    r6 = mul r5 8 64
    r8 = add r8 r6 64
    r15 = load 8 r8 0
    r6 = add r13 2 32
    r3 = mul arg3 1 64
    r4 = mul r6 8 64
    r3 = add r3 r4 64
    r16 = load 8 r3 0
    r4 = add r13 3 32
    r2 = mul arg3 1 64
    r7 = mul r4 8 64
    r2 = add r2 r7 64
    r2 = load 8 r2 0
    store 8 r2 sp 184
    r7 = load 8 sp 16
    r1 = load 8 sp 176
    r5 = add r7 r1 32
    r8 = mul arg3 1 64
    r6 = mul r5 8 64
    r8 = add r8 r6 64
    r8 = load 8 r8 0
    store 8 r8 sp 192
    r6 = add r5 1 32
    r3 = mul arg3 1 64
    r4 = mul r6 8 64
    r3 = add r3 r4 64
    r3 = load 8 r3 0
    store 8 r3 sp 200
    r4 = add r5 2 32
    r2 = mul arg3 1 64
    r7 = mul r4 8 64
    r2 = add r2 r7 64
    r2 = load 8 r2 0
    store 8 r2 sp 208
    r7 = add r5 3 32
    r1 = mul arg3 1 64
    r8 = mul r7 8 64
    r1 = add r1 r8 64
    r1 = load 8 r1 0
    store 8 r1 sp 216
    r8 = load 8 sp 24
    r6 = load 8 sp 176
    r3 = add r8 r6 32
    r4 = mul arg3 1 64
    r2 = mul r3 8 64
    r4 = add r4 r2 64
    r4 = load 8 r4 0
    store 8 r4 sp 224
    r2 = add r3 1 32
    r5 = mul arg3 1 64
    r7 = mul r2 8 64
    r5 = add r5 r7 64
    r5 = load 8 r5 0
    store 8 r5 sp 232
    r7 = add r3 2 32
    r1 = mul arg3 1 64
    r8 = mul r7 8 64
    r1 = add r1 r8 64
    r1 = load 8 r1 0
    store 8 r1 sp 240
    r8 = add r3 3 32
    r6 = mul arg3 1 64
    r4 = mul r8 8 64
    r6 = add r6 r4 64
    r6 = load 8 r6 0
    store 8 r6 sp 248
    r4 = load 8 sp 32
    r2 = load 8 sp 176
    r5 = add r4 r2 32
    r7 = mul arg3 1 64
    r1 = mul r5 8 64
    r7 = add r7 r1 64
    r7 = load 8 r7 0
    store 8 r7 sp 256
    r1 = add r5 1 32
    r3 = mul arg3 1 64
    r8 = mul r1 8 64
    r3 = add r3 r8 64
    r3 = load 8 r3 0
    store 8 r3 sp 264
    r8 = add r5 2 32
    r6 = mul arg3 1 64
    r4 = mul r8 8 64
    r6 = add r6 r4 64
    r6 = load 8 r6 0
    store 8 r6 sp 272
    r4 = add r5 3 32
    r2 = mul arg3 1 64
    r7 = mul r4 8 64
    r2 = add r2 r7 64
    r2 = load 8 r2 0
    store 8 r2 sp 280
    r7 = load 8 sp 176
    r1 = mul r7 arg1 32
    r3 = load 8 sp 40
    r1 = add r1 r3 32
    r8 = mul arg4 1 64
    r6 = mul r1 8 64
    r8 = add r8 r6 64
    r8 = load 8 r8 0
    store 8 r8 sp 288
    r6 = add r1 1 32
    r5 = mul arg4 1 64
    r4 = mul r6 8 64
    r5 = add r5 r4 64
    r5 = load 8 r5 0
    store 8 r5 sp 296
    r4 = add r1 2 32
    r2 = mul arg4 1 64
    r7 = mul r4 8 64
    r2 = add r2 r7 64
    r2 = load 8 r2 0
    store 8 r2 sp 304
    r7 = add r1 3 32
    r3 = mul arg4 1 64
    r8 = mul r7 8 64
    r3 = add r3 r8 64
    r3 = load 8 r3 0
    store 8 r3 sp 312
    r8 = load 8 sp 176
    r6 = add r8 1 32
    r6 = mul r6 arg1 32
    r5 = load 8 sp 40
    r6 = add r6 r5 32
    r4 = mul arg4 1 64
    r2 = mul r6 8 64
    r4 = add r4 r2 64
    r4 = load 8 r4 0
    store 8 r4 sp 320
    r2 = add r6 1 32
    r1 = mul arg4 1 64
    r7 = mul r2 8 64
    r1 = add r1 r7 64
    r1 = load 8 r1 0
    store 8 r1 sp 328
    r7 = add r6 2 32
    r3 = mul arg4 1 64
    r8 = mul r7 8 64
    r3 = add r3 r8 64
    r3 = load 8 r3 0
    store 8 r3 sp 336
    r8 = add r6 3 32
    r5 = mul arg4 1 64
    r4 = mul r8 8 64
    r5 = add r5 r4 64
    r5 = load 8 r5 0
    store 8 r5 sp 344
    r4 = load 8 sp 176
    r2 = add r4 2 32
    r2 = mul r2 arg1 32
    r1 = load 8 sp 40
    r2 = add r2 r1 32
    r7 = mul arg4 1 64
    r3 = mul r2 8 64
    r7 = add r7 r3 64
    r7 = load 8 r7 0
    store 8 r7 sp 352
    r3 = add r2 1 32
    r6 = mul arg4 1 64
    r8 = mul r3 8 64
    r6 = add r6 r8 64
    r6 = load 8 r6 0
    store 8 r6 sp 360
    r8 = add r2 2 32
    r5 = mul arg4 1 64
    r4 = mul r8 8 64
    r5 = add r5 r4 64
    r5 = load 8 r5 0
    store 8 r5 sp 368
    r4 = add r2 3 32
    r1 = mul arg4 1 64
    r7 = mul r4 8 64
    r1 = add r1 r7 64
    r1 = load 8 r1 0
    store 8 r1 sp 376
    r7 = load 8 sp 176
    r3 = add r7 3 32
    r3 = mul r3 arg1 32
    r6 = load 8 sp 40
    r3 = add r3 r6 32
    r8 = mul arg4 1 64
    r5 = mul r3 8 64
    r8 = add r8 r5 64
    r8 = load 8 r8 0
    store 8 r8 sp 384
    r5 = add r3 1 32
    r2 = mul arg4 1 64
    r4 = mul r5 8 64
    r2 = add r2 r4 64
    r2 = load 8 r2 0
    store 8 r2 sp 392
    r4 = add r3 2 32
    r1 = mul arg4 1 64
    r7 = mul r4 8 64
    r1 = add r1 r7 64
    r1 = load 8 r1 0
    store 8 r1 sp 400
    r7 = add r3 3 32
    r6 = mul arg4 1 64
    r8 = mul r7 8 64
    r6 = add r6 r8 64
    r6 = load 8 r6 0
    store 8 r6 sp 408
    r8 = load 8 sp 288
    r5 = mul r14 r8 64
    r2 = load 8 sp 320
    r4 = mul r15 r2 64
    r5 = add r5 r4 64
    r1 = load 8 sp 352
    r3 = mul r16 r1 64
    r5 = add r5 r3 64
    r7 = load 8 sp 184
    r6 = load 8 sp 384
    r8 = mul r7 r6 64
    r5 = add r5 r8 64
    r2 = load 8 sp 48
    r4 = load 8 r2 0
    r4 = add r4 r5 64
    store 8 r4 r2 0
    r1 = load 8 sp 296
    r3 = mul r14 r1 64
    r7 = load 8 sp 328
    r6 = mul r15 r7 64
    r3 = add r3 r6 64
    r8 = load 8 sp 360
    r5 = mul r16 r8 64
    r3 = add r3 r5 64
    r4 = load 8 sp 184
    r2 = load 8 sp 392
    r1 = mul r4 r2 64
    r3 = add r3 r1 64
    r7 = load 8 sp 56
    r6 = load 8 r7 0
    r6 = add r6 r3 64
    store 8 r6 r7 0
    r8 = load 8 sp 304
    r5 = mul r14 r8 64
    r4 = load 8 sp 336
    r2 = mul r15 r4 64
    r5 = add r5 r2 64
    r1 = load 8 sp 368
    r3 = mul r16 r1 64
    r5 = add r5 r3 64
    r6 = load 8 sp 184
    r7 = load 8 sp 400
    r8 = mul r6 r7 64
    r5 = add r5 r8 64
    r4 = load 8 sp 64
    r2 = load 8 r4 0
    r2 = add r2 r5 64
    store 8 r2 r4 0
    r1 = load 8 sp 312
    r3 = mul r14 r1 64
    r6 = load 8 sp 344
    r7 = mul r15 r6 64
    r3 = add r3 r7 64
    r8 = load 8 sp 376
    r5 = mul r16 r8 64
    r3 = add r3 r5 64
    r2 = load 8 sp 184
    r4 = load 8 sp 408
    r1 = mul r2 r4 64
    r3 = add r3 r1 64
    r6 = load 8 sp 72
    r7 = load 8 r6 0
    r7 = add r7 r3 64
    store 8 r7 r6 0
    r8 = load 8 sp 192
    r5 = load 8 sp 288
    r2 = mul r8 r5 64
    r4 = load 8 sp 200
    r1 = load 8 sp 320
    r3 = mul r4 r1 64
    r2 = add r2 r3 64
    r7 = load 8 sp 208
    r6 = load 8 sp 352
    r8 = mul r7 r6 64
    r2 = add r2 r8 64
    r5 = load 8 sp 216
    r4 = load 8 sp 384
    r1 = mul r5 r4 64
    r2 = add r2 r1 64
    r3 = load 8 sp 80
    r7 = load 8 r3 0
    r7 = add r7 r2 64
    store 8 r7 r3 0
    r6 = load 8 sp 192
    r8 = load 8 sp 296
    r5 = mul r6 r8 64
    r4 = load 8 sp 200
    r1 = load 8 sp 328
    r2 = mul r4 r1 64
    r5 = add r5 r2 64
    r7 = load 8 sp 208
    r3 = load 8 sp 360
    r6 = mul r7 r3 64
    r5 = add r5 r6 64
    r8 = load 8 sp 216
    r4 = load 8 sp 392
    r1 = mul r8 r4 64
    r5 = add r5 r1 64
    r2 = load 8 sp 88
    r7 = load 8 r2 0
    r7 = add r7 r5 64
    store 8 r7 r2 0
    r3 = load 8 sp 192
    r6 = load 8 sp 304
    r8 = mul r3 r6 64
    r4 = load 8 sp 200
    r1 = load 8 sp 336
    r5 = mul r4 r1 64
    r8 = add r8 r5 64
    r7 = load 8 sp 208
    r2 = load 8 sp 368
    r3 = mul r7 r2 64
    r8 = add r8 r3 64
    r6 = load 8 sp 216
    r4 = load 8 sp 400
    r1 = mul r6 r4 64
    r8 = add r8 r1 64
    r5 = load 8 sp 96
    r7 = load 8 r5 0
    r7 = add r7 r8 64
    store 8 r7 r5 0
    r2 = load 8 sp 192
    r3 = load 8 sp 312
    r6 = mul r2 r3 64
    r4 = load 8 sp 200
    r1 = load 8 sp 344
    r8 = mul r4 r1 64
    r6 = add r6 r8 64
    r7 = load 8 sp 208
    r5 = load 8 sp 376
    r2 = mul r7 r5 64
    r6 = add r6 r2 64
    r3 = load 8 sp 216
    r4 = load 8 sp 408
    r1 = mul r3 r4 64
    r6 = add r6 r1 64
    r8 = load 8 sp 104
    r7 = load 8 r8 0
    r7 = add r7 r6 64
    store 8 r7 r8 0
    r5 = load 8 sp 224
    r2 = load 8 sp 288
    r3 = mul r5 r2 64
    r4 = load 8 sp 232
    r1 = load 8 sp 320
    r6 = mul r4 r1 64
    r3 = add r3 r6 64
    r7 = load 8 sp 240
    r8 = load 8 sp 352
    r5 = mul r7 r8 64
    r3 = add r3 r5 64
    r2 = load 8 sp 248
    r4 = load 8 sp 384
    r1 = mul r2 r4 64
    r3 = add r3 r1 64
    r6 = load 8 sp 112
    r7 = load 8 r6 0
    r7 = add r7 r3 64
    store 8 r7 r6 0
    r8 = load 8 sp 224
    r5 = load 8 sp 296
    r2 = mul r8 r5 64
    r4 = load 8 sp 232
    r1 = load 8 sp 328
    r3 = mul r4 r1 64
    r2 = add r2 r3 64
    r7 = load 8 sp 240
    r6 = load 8 sp 360
    r8 = mul r7 r6 64
    r2 = add r2 r8 64
    r5 = load 8 sp 248
    r4 = load 8 sp 392
    r1 = mul r5 r4 64
    r2 = add r2 r1 64
    r3 = load 8 sp 120
    r7 = load 8 r3 0
    r7 = add r7 r2 64
    store 8 r7 r3 0
    r6 = load 8 sp 224
    r8 = load 8 sp 304
    r5 = mul r6 r8 64
    r4 = load 8 sp 232
    r1 = load 8 sp 336
    r2 = mul r4 r1 64
    r5 = add r5 r2 64
    r7 = load 8 sp 240
    r3 = load 8 sp 368
    r6 = mul r7 r3 64
    r5 = add r5 r6 64
    r8 = load 8 sp 248
    r4 = load 8 sp 400
    r1 = mul r8 r4 64
    r5 = add r5 r1 64
    r2 = load 8 sp 128
    r7 = load 8 r2 0
    r7 = add r7 r5 64
    store 8 r7 r2 0
    r3 = load 8 sp 224
    r6 = load 8 sp 312
    r8 = mul r3 r6 64
    r4 = load 8 sp 232
    r1 = load 8 sp 344
    r5 = mul r4 r1 64
    r8 = add r8 r5 64
    r7 = load 8 sp 240
    r2 = load 8 sp 376
    r3 = mul r7 r2 64
    r8 = add r8 r3 64
    r6 = load 8 sp 248
    r4 = load 8 sp 408
    r1 = mul r6 r4 64
    r8 = add r8 r1 64
    r5 = load 8 sp 136
    r7 = load 8 r5 0
    r7 = add r7 r8 64
    store 8 r7 r5 0
    r2 = load 8 sp 256
    r3 = load 8 sp 288
    r6 = mul r2 r3 64
    r4 = load 8 sp 264
    r1 = load 8 sp 320
    r8 = mul r4 r1 64
    r6 = add r6 r8 64
    r7 = load 8 sp 272
    r5 = load 8 sp 352
    r2 = mul r7 r5 64
    r6 = add r6 r2 64
    r3 = load 8 sp 280
    r4 = load 8 sp 384
    r1 = mul r3 r4 64
    r6 = add r6 r1 64
    r8 = load 8 sp 144
    r7 = load 8 r8 0
    r7 = add r7 r6 64
    store 8 r7 r8 0
    r5 = load 8 sp 256
    r2 = load 8 sp 296
    r3 = mul r5 r2 64
    r4 = load 8 sp 264
    r1 = load 8 sp 328
    r6 = mul r4 r1 64
    r3 = add r3 r6 64
    r7 = load 8 sp 272
    r8 = load 8 sp 360
    r5 = mul r7 r8 64
    r3 = add r3 r5 64
    r2 = load 8 sp 280
    r4 = load 8 sp 392
    r1 = mul r2 r4 64
    r3 = add r3 r1 64
    r6 = load 8 sp 152
    r7 = load 8 r6 0
    r7 = add r7 r3 64
    store 8 r7 r6 0
    r8 = load 8 sp 256
    r5 = load 8 sp 304
    r2 = mul r8 r5 64
    r4 = load 8 sp 264
    r1 = load 8 sp 336
    r3 = mul r4 r1 64
    r2 = add r2 r3 64
    r7 = load 8 sp 272
    r6 = load 8 sp 368
    r8 = mul r7 r6 64
    r2 = add r2 r8 64
    r5 = load 8 sp 280
    r4 = load 8 sp 400
    r1 = mul r5 r4 64
    r2 = add r2 r1 64
    r3 = load 8 sp 160
    r7 = load 8 r3 0
    r7 = add r7 r2 64
    store 8 r7 r3 0
    r6 = load 8 sp 256
    r8 = load 8 sp 312
    r5 = mul r6 r8 64
    r4 = load 8 sp 264
    r1 = load 8 sp 344
    r2 = mul r4 r1 64
    r5 = add r5 r2 64
    r7 = load 8 sp 272
    r3 = load 8 sp 376
    r6 = mul r7 r3 64
    r5 = add r5 r6 64
    r8 = load 8 sp 280
    r4 = load 8 sp 408
    r1 = mul r8 r4 64
    r5 = add r5 r1 64
    r2 = load 8 sp 168
    r7 = load 8 r2 0
    r7 = add r7 r5 64
    store 8 r7 r2 0
    r3 = load 8 sp 176
    r6 = add r3 4 32
    store 8 r6 sp 176
    br .for.cond4

  .for.inc420:
    r8 = load 8 sp 40
    r4 = add r8 4 32
    store 8 r4 sp 40
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
