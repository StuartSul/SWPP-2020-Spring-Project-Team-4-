; ModuleID = '/tmp/a.ll'
source_filename = "./polygon_area/src/polygon_area.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.15.0"

; Function Attrs: nounwind ssp uwtable
define i64 @area(i32* %points, i32 %n) #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %rem.0 = phi i64 [ 0, %entry ], [ %add20, %for.inc ]
  %total.0 = phi i64 [ 0, %entry ], [ %add18, %for.inc ]
  %cmp = icmp ult i32 %i.0, %n
  br i1 %cmp, label %for.body, label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond
  br label %for.end

for.body:                                         ; preds = %for.cond
  %add = add i32 %i.0, 1
  %rem1 = urem i32 %add, %n
  %mul = mul i32 %i.0, 2
  %idxprom = zext i32 %mul to i64
  %arrayidx = getelementptr inbounds i32, i32* %points, i64 %idxprom
  %0 = load i32, i32* %arrayidx, align 4
  %conv = zext i32 %0 to i64
  %mul2 = mul i32 %i.0, 2
  %add3 = add i32 %mul2, 1
  %idxprom4 = zext i32 %add3 to i64
  %arrayidx5 = getelementptr inbounds i32, i32* %points, i64 %idxprom4
  %1 = load i32, i32* %arrayidx5, align 4
  %conv6 = zext i32 %1 to i64
  %mul7 = mul i32 %rem1, 2
  %idxprom8 = zext i32 %mul7 to i64
  %arrayidx9 = getelementptr inbounds i32, i32* %points, i64 %idxprom8
  %2 = load i32, i32* %arrayidx9, align 4
  %conv10 = zext i32 %2 to i64
  %mul11 = mul i32 %rem1, 2
  %add12 = add i32 %mul11, 1
  %idxprom13 = zext i32 %add12 to i64
  %arrayidx14 = getelementptr inbounds i32, i32* %points, i64 %idxprom13
  %3 = load i32, i32* %arrayidx14, align 4
  %conv15 = zext i32 %3 to i64
  %mul16 = mul nsw i64 %conv, %conv15
  %mul17 = mul nsw i64 %conv6, %conv10
  %sub = sub nsw i64 %mul16, %mul17
  %div = sdiv i64 %sub, 2
  %add18 = add i64 %total.0, %div
  %rem19 = srem i64 %sub, 2
  %add20 = add nsw i64 %rem.0, %rem19
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add i32 %i.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond.cleanup
  %div21 = sdiv i64 %rem.0, 2
  %add22 = add i64 %total.0, %div21
  ret i64 %add22
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind ssp uwtable
define i32 @main() #0 {
entry:
  %call = call i64 (...) @read()
  %cmp = icmp eq i64 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @write(i64 0)
  br label %cleanup

if.end:                                           ; preds = %entry
  %mul = mul i64 8, %call
  %call1 = call noalias i8* @malloc(i64 %mul) #4
  %0 = bitcast i8* %call1 to i32*
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %i.0 = phi i32 [ 0, %if.end ], [ %inc, %for.inc ]
  %conv = sext i32 %i.0 to i64
  %mul2 = mul i64 2, %call
  %cmp3 = icmp ult i64 %conv, %mul2
  br i1 %cmp3, label %for.body, label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond
  br label %for.end

for.body:                                         ; preds = %for.cond
  %call5 = call i64 (...) @read()
  %conv6 = trunc i64 %call5 to i32
  %idxprom = sext i32 %i.0 to i64
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 %idxprom
  store i32 %conv6, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond.cleanup
  %conv7 = trunc i64 %call to i32
  %call8 = call i64 @area(i32* %0, i32 %conv7)
  call void @write(i64 %call8)
  %1 = bitcast i32* %0 to i8*
  call void @free(i8* %1)
  br label %cleanup

cleanup:                                          ; preds = %for.end, %if.then
  ret i32 0
}

declare i64 @read(...) #2

declare void @write(i64) #2

; Function Attrs: allocsize(0)
declare noalias i8* @malloc(i64) #3

declare void @free(i8*) #2

attributes #0 = { nounwind ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { allocsize(0) "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { allocsize(0) }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 10, i32 15]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{!"clang version 10.0.0 (git@github.com:llvm/llvm-project.git d32170dbd5b0d54436537b6b75beaf44324e0c28)"}
