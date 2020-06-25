
; Function print_bit
start print_bit 1:
  .entry:
    ; init sp!
    sp = sub sp 8 64
    store 8 63 sp 0
    br .for.cond

  .for.cond:
    r1 = load 8 sp 0
    r12 = icmp sge r1 0 64
    br r12 .for.body .for.cond.cleanup

  .for.cond.cleanup:
    br .for.end

  .for.body:
    r11 = lshr arg1 r1 64
    r10 = and r11 1 64
    call write r10
    br .for.inc

  .for.inc:
    r9 = add r1 18446744073709551615 64
    store 8 r9 sp 0
    br .for.cond

  .for.end:
    call write 10
    ret 0
end print_bit

; Function main
start main 0:
  .entry:
    r9 = call read
    call print_bit r9
    ret 0
end main
