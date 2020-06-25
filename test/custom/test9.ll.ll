; ModuleID = '/tmp/a.ll'
source_filename = "custom/test9.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.14.0"

@.str = private unnamed_addr constant [25 x i8] c"This is for SWPP Spring\0A\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"SWPP\00", align 1

; Function Attrs: nounwind ssp uwtable
define i32 @my_strlen(i8* %str) #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %cmp = icmp slt i32 %i.0, 10000
  br i1 %cmp, label %for.body, label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond
  br label %cleanup

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64
  %arrayidx = getelementptr inbounds i8, i8* %str, i64 %idxprom
  %0 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %0 to i32
  %cmp1 = icmp eq i32 %conv, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  br label %cleanup

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %inc = add nsw i32 %i.0, 1
  br label %for.cond

cleanup:                                          ; preds = %if.then, %for.cond.cleanup
  %cleanup.dest.slot.0 = phi i32 [ 1, %if.then ], [ 2, %for.cond.cleanup ]
  switch i32 %cleanup.dest.slot.0, label %unreachable [
    i32 2, label %for.end
    i32 1, label %return
  ]

for.end:                                          ; preds = %cleanup
  br label %return

return:                                           ; preds = %for.end, %cleanup
  %retval.1 = phi i32 [ %i.0, %cleanup ], [ -1, %for.end ]
  ret i32 %retval.1

unreachable:                                      ; preds = %cleanup
  ret i32 0
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind ssp uwtable
define i32 @cntdiffchr(i8* %str) #0 {
entry:
  %call = call i32 @my_strlen(i8* %str)
  br label %for.cond

for.cond:                                         ; preds = %for.inc11, %entry
  %cnt.0 = phi i32 [ 0, %entry ], [ %cnt.1, %for.inc11 ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc12, %for.inc11 ]
  %cmp = icmp slt i32 %i.0, %call
  br i1 %cmp, label %for.body, label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond
  br label %for.end14

for.body:                                         ; preds = %for.cond
  %inc = add nsw i32 %cnt.0, 1
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc10, %for.inc ]
  %cmp2 = icmp slt i32 %j.0, %i.0
  br i1 %cmp2, label %for.body4, label %for.cond.cleanup3

for.cond.cleanup3:                                ; preds = %for.cond1
  br label %cleanup

for.body4:                                        ; preds = %for.cond1
  %idxprom = sext i32 %j.0 to i64
  %arrayidx = getelementptr inbounds i8, i8* %str, i64 %idxprom
  %0 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %0 to i32
  %idxprom5 = sext i32 %i.0 to i64
  %arrayidx6 = getelementptr inbounds i8, i8* %str, i64 %idxprom5
  %1 = load i8, i8* %arrayidx6, align 1
  %conv7 = sext i8 %1 to i32
  %cmp8 = icmp eq i32 %conv, %conv7
  br i1 %cmp8, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %dec = add nsw i32 %inc, -1
  br label %cleanup

if.end:                                           ; preds = %for.body4
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %inc10 = add nsw i32 %j.0, 1
  br label %for.cond1

cleanup:                                          ; preds = %if.then, %for.cond.cleanup3
  %cnt.1 = phi i32 [ %dec, %if.then ], [ %inc, %for.cond.cleanup3 ]
  br label %for.end

for.end:                                          ; preds = %cleanup
  br label %for.inc11

for.inc11:                                        ; preds = %for.end
  %inc12 = add nsw i32 %i.0, 1
  br label %for.cond

for.end14:                                        ; preds = %for.cond.cleanup
  ret i32 %cnt.0
}

; Function Attrs: nounwind ssp uwtable
define i32 @naiveMatching(i8* %str, i8* %pattern) #0 {
entry:
  %call = call i32 @my_strlen(i8* %str)
  %call1 = call i32 @my_strlen(i8* %pattern)
  br label %for.cond

for.cond:                                         ; preds = %for.inc17, %entry
  %retval.0 = phi i32 [ 0, %entry ], [ %retval.1, %for.inc17 ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc18, %for.inc17 ]
  %sub = sub nsw i32 %call, %call1
  %add = add nsw i32 %sub, 1
  %cmp = icmp slt i32 %i.0, %add
  br i1 %cmp, label %for.body, label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond
  br label %cleanup19

for.body:                                         ; preds = %for.cond
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %j.0 = phi i32 [ 0, %for.body ], [ %inc, %for.inc ]
  %cmp3 = icmp slt i32 %j.0, %call1
  br i1 %cmp3, label %for.body5, label %for.cond.cleanup4

for.cond.cleanup4:                                ; preds = %for.cond2
  br label %cleanup

for.body5:                                        ; preds = %for.cond2
  %add6 = add nsw i32 %i.0, %j.0
  %idxprom = sext i32 %add6 to i64
  %arrayidx = getelementptr inbounds i8, i8* %str, i64 %idxprom
  %0 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %0 to i32
  %idxprom7 = sext i32 %j.0 to i64
  %arrayidx8 = getelementptr inbounds i8, i8* %pattern, i64 %idxprom7
  %1 = load i8, i8* %arrayidx8, align 1
  %conv9 = sext i8 %1 to i32
  %cmp10 = icmp ne i32 %conv, %conv9
  br i1 %cmp10, label %if.then, label %if.end

if.then:                                          ; preds = %for.body5
  br label %cleanup

if.end:                                           ; preds = %for.body5
  %sub12 = sub nsw i32 %call1, 1
  %cmp13 = icmp eq i32 %j.0, %sub12
  br i1 %cmp13, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.end
  br label %cleanup

if.end16:                                         ; preds = %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end16
  %inc = add nsw i32 %j.0, 1
  br label %for.cond2

cleanup:                                          ; preds = %if.then15, %if.then, %for.cond.cleanup4
  %retval.1 = phi i32 [ %retval.0, %if.then ], [ %i.0, %if.then15 ], [ %retval.0, %for.cond.cleanup4 ]
  %cleanup.dest.slot.0 = phi i32 [ 5, %if.then ], [ 1, %if.then15 ], [ 5, %for.cond.cleanup4 ]
  switch i32 %cleanup.dest.slot.0, label %cleanup19 [
    i32 5, label %for.end
  ]

for.end:                                          ; preds = %cleanup
  br label %for.inc17

for.inc17:                                        ; preds = %for.end
  %inc18 = add nsw i32 %i.0, 1
  br label %for.cond

cleanup19:                                        ; preds = %cleanup, %for.cond.cleanup
  %retval.2 = phi i32 [ %retval.1, %cleanup ], [ %retval.0, %for.cond.cleanup ]
  %cleanup.dest.slot.1 = phi i32 [ %cleanup.dest.slot.0, %cleanup ], [ 2, %for.cond.cleanup ]
  switch i32 %cleanup.dest.slot.1, label %cleanup22 [
    i32 2, label %for.end21
  ]

for.end21:                                        ; preds = %cleanup19
  br label %cleanup22

cleanup22:                                        ; preds = %for.end21, %cleanup19
  %retval.3 = phi i32 [ %retval.2, %cleanup19 ], [ -1, %for.end21 ]
  ret i32 %retval.3
}

; Function Attrs: nounwind ssp uwtable
define i32 @kmpMatching(i8* %str, i8* %pattern) #0 {
entry:
  %call = call i32 @my_strlen(i8* %str)
  %call1 = call i32 @my_strlen(i8* %pattern)
  %0 = zext i32 %call1 to i64
  %vla = alloca i32, i64 %0, align 16
  %arrayidx = getelementptr inbounds i32, i32* %vla, i64 0
  store i32 -1, i32* %arrayidx, align 16
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %j.0 = phi i32 [ 0, %entry ], [ %j.1, %if.end ]
  %k.0 = phi i32 [ -1, %entry ], [ %k.1, %if.end ]
  %cmp = icmp slt i32 %j.0, %call1
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %cmp2 = icmp eq i32 %k.0, -1
  br i1 %cmp2, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %while.body
  %idxprom = sext i32 %j.0 to i64
  %arrayidx3 = getelementptr inbounds i8, i8* %pattern, i64 %idxprom
  %1 = load i8, i8* %arrayidx3, align 1
  %conv = sext i8 %1 to i32
  %idxprom4 = sext i32 %k.0 to i64
  %arrayidx5 = getelementptr inbounds i8, i8* %pattern, i64 %idxprom4
  %2 = load i8, i8* %arrayidx5, align 1
  %conv6 = sext i8 %2 to i32
  %cmp7 = icmp eq i32 %conv, %conv6
  br i1 %cmp7, label %if.then, label %if.else

if.then:                                          ; preds = %lor.lhs.false, %while.body
  %inc = add nsw i32 %j.0, 1
  %inc9 = add nsw i32 %k.0, 1
  %idxprom10 = sext i32 %inc to i64
  %arrayidx11 = getelementptr inbounds i32, i32* %vla, i64 %idxprom10
  store i32 %inc9, i32* %arrayidx11, align 4
  br label %if.end

if.else:                                          ; preds = %lor.lhs.false
  %idxprom12 = sext i32 %k.0 to i64
  %arrayidx13 = getelementptr inbounds i32, i32* %vla, i64 %idxprom12
  %3 = load i32, i32* %arrayidx13, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %j.1 = phi i32 [ %inc, %if.then ], [ %j.0, %if.else ]
  %k.1 = phi i32 [ %inc9, %if.then ], [ %3, %if.else ]
  br label %while.cond

while.end:                                        ; preds = %while.cond
  br label %while.cond14

while.cond14:                                     ; preds = %if.end39, %while.end
  %i.0 = phi i32 [ 0, %while.end ], [ %i.1, %if.end39 ]
  %j.2 = phi i32 [ 0, %while.end ], [ %j.3, %if.end39 ]
  %cmp15 = icmp slt i32 %i.0, %call
  br i1 %cmp15, label %while.body17, label %while.end40

while.body17:                                     ; preds = %while.cond14
  %cmp18 = icmp eq i32 %j.2, -1
  br i1 %cmp18, label %if.then29, label %lor.lhs.false20

lor.lhs.false20:                                  ; preds = %while.body17
  %idxprom21 = sext i32 %i.0 to i64
  %arrayidx22 = getelementptr inbounds i8, i8* %str, i64 %idxprom21
  %4 = load i8, i8* %arrayidx22, align 1
  %conv23 = sext i8 %4 to i32
  %idxprom24 = sext i32 %j.2 to i64
  %arrayidx25 = getelementptr inbounds i8, i8* %pattern, i64 %idxprom24
  %5 = load i8, i8* %arrayidx25, align 1
  %conv26 = sext i8 %5 to i32
  %cmp27 = icmp eq i32 %conv23, %conv26
  br i1 %cmp27, label %if.then29, label %if.else32

if.then29:                                        ; preds = %lor.lhs.false20, %while.body17
  %inc30 = add nsw i32 %i.0, 1
  %inc31 = add nsw i32 %j.2, 1
  br label %if.end35

if.else32:                                        ; preds = %lor.lhs.false20
  %idxprom33 = sext i32 %j.2 to i64
  %arrayidx34 = getelementptr inbounds i32, i32* %vla, i64 %idxprom33
  %6 = load i32, i32* %arrayidx34, align 4
  br label %if.end35

if.end35:                                         ; preds = %if.else32, %if.then29
  %i.1 = phi i32 [ %inc30, %if.then29 ], [ %i.0, %if.else32 ]
  %j.3 = phi i32 [ %inc31, %if.then29 ], [ %6, %if.else32 ]
  %cmp36 = icmp eq i32 %j.3, %call1
  br i1 %cmp36, label %if.then38, label %if.end39

if.then38:                                        ; preds = %if.end35
  %sub = sub nsw i32 %i.1, %call1
  br label %cleanup

if.end39:                                         ; preds = %if.end35
  br label %while.cond14

while.end40:                                      ; preds = %while.cond14
  br label %cleanup

cleanup:                                          ; preds = %while.end40, %if.then38
  %retval.0 = phi i32 [ %sub, %if.then38 ], [ -1, %while.end40 ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
declare i8* @llvm.stacksave() #2

; Function Attrs: nounwind
declare void @llvm.stackrestore(i8*) #2

; Function Attrs: nounwind ssp uwtable
define i32 @boyer_mooreMatching(i8* %str, i8* %pattern) #0 {
entry:
  %skip = alloca [1000 x i32], align 16
  %call = call i32 @my_strlen(i8* %str)
  %call1 = call i32 @my_strlen(i8* %pattern)
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %cmp = icmp slt i32 %i.0, 1000
  br i1 %cmp, label %for.body, label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond
  br label %for.end

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64
  %arrayidx = getelementptr inbounds [1000 x i32], [1000 x i32]* %skip, i64 0, i64 %idxprom
  store i32 %call1, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond.cleanup
  %sub = sub nsw i32 %call1, 2
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc18, %for.end
  %i2.0 = phi i32 [ %sub, %for.end ], [ %dec, %for.inc18 ]
  %cmp4 = icmp sge i32 %i2.0, 0
  br i1 %cmp4, label %for.body6, label %for.cond.cleanup5

for.cond.cleanup5:                                ; preds = %for.cond3
  br label %for.end19

for.body6:                                        ; preds = %for.cond3
  %idxprom7 = sext i32 %i2.0 to i64
  %arrayidx8 = getelementptr inbounds i8, i8* %pattern, i64 %idxprom7
  %0 = load i8, i8* %arrayidx8, align 1
  %idxprom9 = sext i8 %0 to i64
  %arrayidx10 = getelementptr inbounds [1000 x i32], [1000 x i32]* %skip, i64 0, i64 %idxprom9
  %1 = load i32, i32* %arrayidx10, align 4
  %cmp11 = icmp eq i32 %1, %call1
  br i1 %cmp11, label %if.then, label %if.end

if.then:                                          ; preds = %for.body6
  %sub12 = sub nsw i32 %call1, 1
  %sub13 = sub nsw i32 %sub12, %i2.0
  %idxprom14 = sext i32 %i2.0 to i64
  %arrayidx15 = getelementptr inbounds i8, i8* %pattern, i64 %idxprom14
  %2 = load i8, i8* %arrayidx15, align 1
  %idxprom16 = sext i8 %2 to i64
  %arrayidx17 = getelementptr inbounds [1000 x i32], [1000 x i32]* %skip, i64 0, i64 %idxprom16
  store i32 %sub13, i32* %arrayidx17, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body6
  br label %for.inc18

for.inc18:                                        ; preds = %if.end
  %dec = add nsw i32 %i2.0, -1
  br label %for.cond3

for.end19:                                        ; preds = %for.cond.cleanup5
  br label %for.cond21

for.cond21:                                       ; preds = %for.inc51, %for.end19
  %retval.0 = phi i32 [ 0, %for.end19 ], [ %retval.1, %for.inc51 ]
  %i20.0 = phi i32 [ 0, %for.end19 ], [ %inc52, %for.inc51 ]
  %sub22 = sub nsw i32 %call, %call1
  %add = add nsw i32 %sub22, 1
  %cmp23 = icmp slt i32 %i20.0, %add
  br i1 %cmp23, label %for.body25, label %for.cond.cleanup24

for.cond.cleanup24:                               ; preds = %for.cond21
  br label %cleanup53

for.body25:                                       ; preds = %for.cond21
  %sub26 = sub nsw i32 %call1, 1
  %add27 = add nsw i32 %i20.0, %call1
  %sub28 = sub nsw i32 %add27, 1
  br label %while.cond

while.cond:                                       ; preds = %while.body, %for.body25
  %j.0 = phi i32 [ %sub26, %for.body25 ], [ %dec37, %while.body ]
  %k.0 = phi i32 [ %sub28, %for.body25 ], [ %dec38, %while.body ]
  %cmp29 = icmp sge i32 %j.0, 0
  br i1 %cmp29, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %idxprom30 = sext i32 %k.0 to i64
  %arrayidx31 = getelementptr inbounds i8, i8* %str, i64 %idxprom30
  %3 = load i8, i8* %arrayidx31, align 1
  %conv = sext i8 %3 to i32
  %idxprom32 = sext i32 %j.0 to i64
  %arrayidx33 = getelementptr inbounds i8, i8* %pattern, i64 %idxprom32
  %4 = load i8, i8* %arrayidx33, align 1
  %conv34 = sext i8 %4 to i32
  %cmp35 = icmp eq i32 %conv, %conv34
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %5 = phi i1 [ false, %while.cond ], [ %cmp35, %land.rhs ]
  br i1 %5, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %dec37 = add nsw i32 %j.0, -1
  %dec38 = add nsw i32 %k.0, -1
  br label %while.cond

while.end:                                        ; preds = %land.end
  %cmp39 = icmp slt i32 %j.0, 0
  br i1 %cmp39, label %if.then41, label %if.end42

if.then41:                                        ; preds = %while.end
  br label %cleanup

if.end42:                                         ; preds = %while.end
  %add43 = add nsw i32 %i20.0, %call1
  %sub44 = sub nsw i32 %add43, 1
  %idxprom45 = sext i32 %sub44 to i64
  %arrayidx46 = getelementptr inbounds i8, i8* %pattern, i64 %idxprom45
  %6 = load i8, i8* %arrayidx46, align 1
  %idxprom47 = sext i8 %6 to i64
  %arrayidx48 = getelementptr inbounds [1000 x i32], [1000 x i32]* %skip, i64 0, i64 %idxprom47
  %7 = load i32, i32* %arrayidx48, align 4
  %add49 = add nsw i32 %i20.0, %7
  br label %cleanup

cleanup:                                          ; preds = %if.end42, %if.then41
  %retval.1 = phi i32 [ %i20.0, %if.then41 ], [ %retval.0, %if.end42 ]
  %i20.1 = phi i32 [ %i20.0, %if.then41 ], [ %add49, %if.end42 ]
  %cleanup.dest.slot.0 = phi i32 [ 1, %if.then41 ], [ 0, %if.end42 ]
  switch i32 %cleanup.dest.slot.0, label %cleanup53 [
    i32 0, label %cleanup.cont
  ]

cleanup.cont:                                     ; preds = %cleanup
  br label %for.inc51

for.inc51:                                        ; preds = %cleanup.cont
  %inc52 = add nsw i32 %i20.1, 1
  br label %for.cond21

cleanup53:                                        ; preds = %cleanup, %for.cond.cleanup24
  %retval.2 = phi i32 [ %retval.1, %cleanup ], [ %retval.0, %for.cond.cleanup24 ]
  %cleanup.dest.slot.1 = phi i32 [ %cleanup.dest.slot.0, %cleanup ], [ 8, %for.cond.cleanup24 ]
  switch i32 %cleanup.dest.slot.1, label %cleanup56 [
    i32 8, label %for.end55
  ]

for.end55:                                        ; preds = %cleanup53
  br label %cleanup56

cleanup56:                                        ; preds = %for.end55, %cleanup53
  %retval.3 = phi i32 [ %retval.2, %cleanup53 ], [ 0, %for.end55 ]
  ret i32 %retval.3
}

; Function Attrs: nounwind ssp uwtable
define i32 @main() #0 {
entry:
  %result = alloca [3 x i32], align 4
  %call = call i32 @naiveMatching(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0))
  %arrayidx = getelementptr inbounds [3 x i32], [3 x i32]* %result, i64 0, i64 0
  store i32 %call, i32* %arrayidx, align 4
  %call1 = call i32 @kmpMatching(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0))
  %arrayidx2 = getelementptr inbounds [3 x i32], [3 x i32]* %result, i64 0, i64 1
  store i32 %call1, i32* %arrayidx2, align 4
  %call3 = call i32 @boyer_mooreMatching(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0))
  %arrayidx4 = getelementptr inbounds [3 x i32], [3 x i32]* %result, i64 0, i64 2
  store i32 %call3, i32* %arrayidx4, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %cmp = icmp slt i32 %i.0, 3
  br i1 %cmp, label %for.body, label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond
  br label %for.end

for.body:                                         ; preds = %for.cond
  %idxprom = sext i32 %i.0 to i64
  %arrayidx5 = getelementptr inbounds [3 x i32], [3 x i32]* %result, i64 0, i64 %idxprom
  %0 = load i32, i32* %arrayidx5, align 4
  %conv = sext i32 %0 to i64
  call void @write(i64 %conv)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond.cleanup
  ret i32 0
}

declare void @write(i64) #3

attributes #0 = { nounwind ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { nounwind }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 10, i32 14]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{!"clang version 10.0.1 (https://github.com/llvm/llvm-project 92d5c1be9ee93850c0a8903f05f36a23ee835dc2)"}
