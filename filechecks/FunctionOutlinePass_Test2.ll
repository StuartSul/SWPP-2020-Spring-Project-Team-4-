; ModuleID = '/tmp/a.ll'
source_filename = "/Users/jaeeun/Desktop/llvm_10/team_repo/test/ftest2.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.14.0"

@arr = external global [5 x i32], align 16

; Function Attrs: nounwind ssp uwtable
define i32 @weirdCounter(i32 %n) #0 {
; CHECK: start weirdCounter 1:
entry:

  br label %for.cond

for.cond:                                        ; preds = %for.inc, %entry


  %i.0 = phi i32 [ 1, %entry ], [ %inc, %for.inc ]
  %cmp = icmp slt i32 %i.0, %n
  br i1 %cmp, label %for.body, label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond
  br label %for.end

for.body:                                         ; preds = %for.cond
  %sub = sub nsw i32 %i.0, 1
  %idxprom = sext i32 %sub to i64
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* @arr, i64 0, i64 %idxprom
  %0 = load i32, i32* %arrayidx, align 4
  %sub1 = sub nsw i32 %i.0, 1
  %idxprom2 = sext i32 %sub1 to i64
  %arrayidx3 = getelementptr inbounds [5 x i32], [5 x i32]* @arr, i64 0, i64 %idxprom2
  %1 = load i32, i32* %arrayidx3, align 4
  %mul = mul nsw i32 %1, 2
  %sub4 = sub nsw i32 %mul, 1
  %add = add nsw i32 %0, %sub4
  %sub5 = sub nsw i32 %i.0, 1
  %idxprom6 = sext i32 %sub5 to i64
  %arrayidx7 = getelementptr inbounds [5 x i32], [5 x i32]* @arr, i64 0, i64 %idxprom6
  %2 = load i32, i32* %arrayidx7, align 4
  %mul8 = mul nsw i32 %2, 4
  %add9 = add nsw i32 %add, %mul8
  %idxprom10 = sext i32 %i.0 to i64
  %arrayidx11 = getelementptr inbounds [5 x i32], [5 x i32]* @arr, i64 0, i64 %idxprom10
  store i32 %add9, i32* %arrayidx11, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond.cleanup

  %shr = ashr i32 %n, 1
  %idxprom12 = sext i32 %shr to i64
  %arrayidx13 = getelementptr inbounds [5 x i32], [5 x i32]* @arr, i64 0, i64 %idxprom12
  %3 = load i32, i32* %arrayidx13, align 4
  %shr14 = ashr i32 %n, 1
  %idxprom15 = sext i32 %shr14 to i64
  %arrayidx16 = getelementptr inbounds [5 x i32], [5 x i32]* @arr, i64 0, i64 %idxprom15
  %4 = load i32, i32* %arrayidx16, align 4
  %add17 = add nsw i32 %3, %4
  %idxprom18 = sext i32 %n to i64
  %arrayidx19 = getelementptr inbounds [5 x i32], [5 x i32]* @arr, i64 0, i64 %idxprom18
  %5 = load i32, i32* %arrayidx19, align 4
  %add20 = add nsw i32 %add17, %5
  %sub21 = sub nsw i32 %n, 1
  %idxprom22 = sext i32 %sub21 to i64
  %arrayidx23 = getelementptr inbounds [5 x i32], [5 x i32]* @arr, i64 0, i64 %idxprom22
  %6 = load i32, i32* %arrayidx23, align 4
  %add24 = add nsw i32 %add20, %6
  ret i32 %add24
}




; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind ssp uwtable
define i32 @main() #0 {

entry:
  store i32 1, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @arr, i64 0, i64 0), align 16
  store i32 1, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @arr, i64 0, i64 1), align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry

  %i.0 = phi i32 [ 2, %entry ], [ %inc, %for.inc ]
  %cmp = icmp slt i32 %i.0, 5
  br i1 %cmp, label %for.body, label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond
  br label %for.end

for.body:                                         ; preds = %for.cond
  %sub = sub nsw i32 %i.0, 2
  %idxprom = sext i32 %sub to i64
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* @arr, i64 0, i64 %idxprom
  %0 = load i32, i32* %arrayidx, align 4
  %idxprom1 = sext i32 %i.0 to i64
  %arrayidx2 = getelementptr inbounds [5 x i32], [5 x i32]* @arr, i64 0, i64 %idxprom1
  %1 = load i32, i32* %arrayidx2, align 4
  %add = add nsw i32 %1, %0
  store i32 %add, i32* %arrayidx2, align 4
  %sub3 = sub nsw i32 %i.0, 1
  %idxprom4 = sext i32 %sub3 to i64
  %arrayidx5 = getelementptr inbounds [5 x i32], [5 x i32]* @arr, i64 0, i64 %idxprom4
  %2 = load i32, i32* %arrayidx5, align 4
  %idxprom6 = sext i32 %i.0 to i64
  %arrayidx7 = getelementptr inbounds [5 x i32], [5 x i32]* @arr, i64 0, i64 %idxprom6
  %3 = load i32, i32* %arrayidx7, align 4
  %add8 = add nsw i32 %3, %2
  store i32 %add8, i32* %arrayidx7, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1
  br label %for.cond

for.end:                                         ; preds = %for.cond.cleanup
  %call = call i64 (...) @read()
  %conv = trunc i64 %call to i32
  %call9 = call i32 @weirdCounter(i32 %conv)
  %conv10 = sext i32 %call9 to i64
  call void @write(i64 %conv10)
  ret i32 0
}

; CHECK-NOT:  start main.for.body [[SCOPE:[0-10]+]]:
; CHECK-NOT: .newFuncRoot:
; CHECK-NOT:  end main.for.body

; CHECK-NOT:  start weirdCounter.for.body [[SCOPE:[0-10]+]]:
; CHECK-NOT: .newFuncRoot:
; CHECK-NOT:  end weirdCounter.for.body


declare void @write(i64) #2

declare i64 @read(...) #2

attributes #0 = { nounwind ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 10, i32 14]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{!"clang version 10.0.1 (https://github.com/llvm/llvm-project.git edbe962459da6e3b7b4168118f93a77847b54e02)"}
