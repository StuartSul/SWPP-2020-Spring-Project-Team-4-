; ModuleID = '/tmp/a.ll'
source_filename = "custom/test2.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.14.0"

; Function Attrs: nounwind ssp uwtable
define i32 @main() #0 {
entry:
  %call = call i64 (...) @read()
  %add = add i64 %call, 0
  %add1 = add i64 %call, 1
  %add2 = add i64 %call, 2
  %add3 = add i64 %call, 3
  %add4 = add i64 %call, 4
  %add5 = add i64 %call, 5
  %add6 = add i64 %call, 6
  %add7 = add i64 %call, 7
  %add8 = add i64 %call, 8
  %add9 = add i64 %call, 9
  %add10 = add i64 %call, 10
  %add11 = add i64 %call, 11
  %add12 = add i64 %call, 12
  %add13 = add i64 %call, 13
  %add14 = add i64 %call, 14
  %add15 = add i64 %call, 15
  %add16 = add i64 %call, 16
  %add17 = add i64 %call, 17
  %add18 = add i64 %call, 18
  %add19 = add i64 %call, 19
  %add20 = add i64 %call, 20
  %add21 = add i64 %call, 21
  %add22 = add i64 %call, 22
  %add23 = add i64 %call, 23
  %add24 = add i64 %call, 24
  %add25 = add i64 %call, 25
  %add26 = add i64 %call, 26
  %add27 = add i64 %call, 27
  %add28 = add i64 %call, 28
  %add29 = add i64 %call, 29
  %add30 = add i64 %call, 30
  %add31 = add i64 %call, 31
  %add32 = add i64 %call, 32
  %add33 = add i64 %call, 33
  %add34 = add i64 %call, 34
  %add35 = add i64 %call, 35
  %add36 = add i64 %call, 36
  %add37 = add i64 %call, 37
  %add38 = add i64 %call, 38
  %add39 = add i64 %call, 39
  %add40 = add i64 %call, 40
  %add41 = add i64 %call, 41
  %add42 = add i64 %call, 42
  %add43 = add i64 %call, 43
  %add44 = add i64 %call, 44
  %add45 = add i64 %call, 45
  %add46 = add i64 %call, 46
  %add47 = add i64 %call, 47
  %add48 = add i64 %call, 48
  %add49 = add i64 %call, 49
  call void @write(i64 %add)
  call void @write(i64 %add1)
  call void @write(i64 %add2)
  call void @write(i64 %add3)
  call void @write(i64 %add4)
  call void @write(i64 %add5)
  call void @write(i64 %add6)
  call void @write(i64 %add7)
  call void @write(i64 %add8)
  call void @write(i64 %add9)
  call void @write(i64 %add10)
  call void @write(i64 %add11)
  call void @write(i64 %add12)
  call void @write(i64 %add13)
  call void @write(i64 %add14)
  call void @write(i64 %add15)
  call void @write(i64 %add16)
  call void @write(i64 %add17)
  call void @write(i64 %add18)
  call void @write(i64 %add19)
  call void @write(i64 %add20)
  call void @write(i64 %add21)
  call void @write(i64 %add22)
  call void @write(i64 %add23)
  call void @write(i64 %add24)
  call void @write(i64 %add25)
  call void @write(i64 %add26)
  call void @write(i64 %add27)
  call void @write(i64 %add28)
  call void @write(i64 %add29)
  call void @write(i64 %add30)
  call void @write(i64 %add31)
  call void @write(i64 %add32)
  call void @write(i64 %add33)
  call void @write(i64 %add34)
  call void @write(i64 %add35)
  call void @write(i64 %add36)
  call void @write(i64 %add37)
  call void @write(i64 %add38)
  call void @write(i64 %add39)
  call void @write(i64 %add40)
  call void @write(i64 %add41)
  call void @write(i64 %add42)
  call void @write(i64 %add43)
  call void @write(i64 %add44)
  call void @write(i64 %add45)
  call void @write(i64 %add46)
  call void @write(i64 %add47)
  call void @write(i64 %add48)
  call void @write(i64 %add49)
  ret i32 0
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

declare i64 @read(...) #2

declare void @write(i64) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 10, i32 14]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{!"clang version 10.0.1 (https://github.com/llvm/llvm-project 92d5c1be9ee93850c0a8903f05f36a23ee835dc2)"}
