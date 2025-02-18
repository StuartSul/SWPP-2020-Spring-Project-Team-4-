; ModuleID = '/tmp/a.ll'
source_filename = "./quick_sort/src/quick_sort.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.15.0"

; Function Attrs: nounwind ssp uwtable
define i8* @malloc_upto_8(i64 %x) #0 {
entry:
  %add = add i64 %x, 7
  %div = udiv i64 %add, 8
  %mul = mul i64 %div, 8
  %call = call noalias i8* @malloc(i64 %mul) #4
  ret i8* %call
}

; Function Attrs: allocsize(0)
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind ssp uwtable
define void @swap(i32* %a, i32* %b) #0 {
entry:
  %0 = load i32, i32* %a, align 4
  %1 = load i32, i32* %b, align 4
  store i32 %1, i32* %a, align 4
  store i32 %0, i32* %b, align 4
  ret void
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind ssp uwtable
define i32 @partition(i32* %arr, i32 %low, i32 %high) #0 {
entry:
  %idxprom = sext i32 %high to i64
  %arrayidx = getelementptr inbounds i32, i32* %arr, i64 %idxprom
  %0 = load i32, i32* %arrayidx, align 4
  %sub = sub nsw i32 %low, 1
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ %sub, %entry ], [ %i.1, %for.inc ]
  %j.0 = phi i32 [ %low, %entry ], [ %inc9, %for.inc ]
  %sub1 = sub nsw i32 %high, 1
  %cmp = icmp sle i32 %j.0, %sub1
  br i1 %cmp, label %for.body, label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond
  br label %for.end

for.body:                                         ; preds = %for.cond
  %idxprom2 = sext i32 %j.0 to i64
  %arrayidx3 = getelementptr inbounds i32, i32* %arr, i64 %idxprom2
  %1 = load i32, i32* %arrayidx3, align 4
  %cmp4 = icmp slt i32 %1, %0
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1
  %idxprom5 = sext i32 %inc to i64
  %arrayidx6 = getelementptr inbounds i32, i32* %arr, i64 %idxprom5
  %idxprom7 = sext i32 %j.0 to i64
  %arrayidx8 = getelementptr inbounds i32, i32* %arr, i64 %idxprom7
  call void @swap(i32* %arrayidx6, i32* %arrayidx8)
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %i.1 = phi i32 [ %inc, %if.then ], [ %i.0, %for.body ]
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %inc9 = add nsw i32 %j.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond.cleanup
  %add = add nsw i32 %i.0, 1
  %idxprom10 = sext i32 %add to i64
  %arrayidx11 = getelementptr inbounds i32, i32* %arr, i64 %idxprom10
  %idxprom12 = sext i32 %high to i64
  %arrayidx13 = getelementptr inbounds i32, i32* %arr, i64 %idxprom12
  call void @swap(i32* %arrayidx11, i32* %arrayidx13)
  %add14 = add nsw i32 %i.0, 1
  ret i32 %add14
}

; Function Attrs: nounwind ssp uwtable
define void @quickSort(i32* %arr, i32 %low, i32 %high) #0 {
entry:
  %cmp = icmp slt i32 %low, %high
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i32 @partition(i32* %arr, i32 %low, i32 %high)
  %sub = sub nsw i32 %call, 1
  call void @quickSort(i32* %arr, i32 %low, i32 %sub)
  %add = add nsw i32 %call, 1
  call void @quickSort(i32* %arr, i32 %add, i32 %high)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

; Function Attrs: nounwind ssp uwtable
define i32 @main() #0 {
entry:
  %call = call i64 (...) @read()
  %mul = mul i64 4, %call
  %call1 = call i8* @malloc_upto_8(i64 %mul)
  %0 = bitcast i8* %call1 to i32*
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %conv = sext i32 %i.0 to i64
  %cmp = icmp ult i64 %conv, %call
  br i1 %cmp, label %for.body, label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond
  br label %for.end

for.body:                                         ; preds = %for.cond
  %call3 = call i64 (...) @read()
  %conv4 = trunc i64 %call3 to i32
  %idxprom = sext i32 %i.0 to i64
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 %idxprom
  store i32 %conv4, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond.cleanup
  %sub = sub i64 %call, 1
  %conv5 = trunc i64 %sub to i32
  call void @quickSort(i32* %0, i32 0, i32 %conv5)
  br label %for.cond7

for.cond7:                                        ; preds = %for.inc16, %for.end
  %i6.0 = phi i32 [ 0, %for.end ], [ %inc17, %for.inc16 ]
  %conv8 = sext i32 %i6.0 to i64
  %cmp9 = icmp ult i64 %conv8, %call
  br i1 %cmp9, label %for.body12, label %for.cond.cleanup11

for.cond.cleanup11:                               ; preds = %for.cond7
  br label %for.end18

for.body12:                                       ; preds = %for.cond7
  %idxprom13 = sext i32 %i6.0 to i64
  %arrayidx14 = getelementptr inbounds i32, i32* %0, i64 %idxprom13
  %1 = load i32, i32* %arrayidx14, align 4
  %conv15 = sext i32 %1 to i64
  call void @write(i64 %conv15)
  br label %for.inc16

for.inc16:                                        ; preds = %for.body12
  %inc17 = add nsw i32 %i6.0, 1
  br label %for.cond7

for.end18:                                        ; preds = %for.cond.cleanup11
  %2 = bitcast i32* %0 to i8*
  call void @free(i8* %2)
  ret i32 0
}

declare i64 @read(...) #3

declare void @write(i64) #3

declare void @free(i8*) #3

attributes #0 = { nounwind ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { allocsize(0) "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { allocsize(0) }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 10, i32 15]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{!"clang version 10.0.0 (git@github.com:llvm/llvm-project.git d32170dbd5b0d54436537b6b75beaf44324e0c28)"}
