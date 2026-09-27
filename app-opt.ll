; ModuleID = 'app.c'
source_filename = "app.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree norecurse nosync nounwind sspstrong memory(argmem: readwrite) uwtable
define dso_local void @step(ptr noundef captures(none) %0, ptr noundef readonly captures(none) %1) local_unnamed_addr #0 {
  %3 = getelementptr nuw i8, ptr %0, i64 1540
  %4 = getelementptr i8, ptr %0, i64 293372
  %5 = getelementptr i8, ptr %1, i64 4
  %6 = getelementptr i8, ptr %1, i64 294908
  %7 = icmp ult ptr %3, %6
  %8 = icmp ult ptr %5, %4
  %9 = and i1 %7, %8
  br label %10

10:                                               ; preds = %2, %57
  %11 = phi i64 [ 1, %2 ], [ %58, %57 ]
  %12 = mul nuw nsw i64 %11, 384
  br i1 %9, label %13, label %15

13:                                               ; preds = %15, %10
  %14 = phi i64 [ 1, %10 ], [ 377, %15 ]
  br label %60

15:                                               ; preds = %10, %15
  %16 = phi i64 [ %54, %15 ], [ 0, %10 ]
  %17 = or disjoint i64 %16, 1
  %18 = add nuw nsw i64 %17, %12
  %19 = getelementptr i32, ptr %1, i64 %18
  %20 = getelementptr i8, ptr %19, i64 -4
  %21 = getelementptr i8, ptr %19, i64 12
  %22 = load <4 x i32>, ptr %20, align 4, !tbaa !5, !alias.scope !9
  %23 = load <4 x i32>, ptr %21, align 4, !tbaa !5, !alias.scope !9
  %24 = getelementptr inbounds nuw i8, ptr %19, i64 4
  %25 = getelementptr inbounds nuw i8, ptr %19, i64 20
  %26 = load <4 x i32>, ptr %24, align 4, !tbaa !5, !alias.scope !9
  %27 = load <4 x i32>, ptr %25, align 4, !tbaa !5, !alias.scope !9
  %28 = add nsw <4 x i32> %26, %22
  %29 = add nsw <4 x i32> %27, %23
  %30 = getelementptr i8, ptr %19, i64 -1536
  %31 = getelementptr i8, ptr %19, i64 -1520
  %32 = load <4 x i32>, ptr %30, align 4, !tbaa !5, !alias.scope !9
  %33 = load <4 x i32>, ptr %31, align 4, !tbaa !5, !alias.scope !9
  %34 = add nsw <4 x i32> %28, %32
  %35 = add nsw <4 x i32> %29, %33
  %36 = getelementptr inbounds nuw i8, ptr %19, i64 1536
  %37 = getelementptr inbounds nuw i8, ptr %19, i64 1552
  %38 = load <4 x i32>, ptr %36, align 4, !tbaa !5, !alias.scope !9
  %39 = load <4 x i32>, ptr %37, align 4, !tbaa !5, !alias.scope !9
  %40 = add nsw <4 x i32> %34, %38
  %41 = add nsw <4 x i32> %35, %39
  %42 = ashr <4 x i32> %40, splat (i32 1)
  %43 = ashr <4 x i32> %41, splat (i32 1)
  %44 = getelementptr inbounds nuw i32, ptr %0, i64 %18
  %45 = getelementptr inbounds nuw i8, ptr %44, i64 16
  %46 = load <4 x i32>, ptr %44, align 4, !tbaa !5, !alias.scope !12, !noalias !9
  %47 = load <4 x i32>, ptr %45, align 4, !tbaa !5, !alias.scope !12, !noalias !9
  %48 = sub nsw <4 x i32> %42, %46
  %49 = sub nsw <4 x i32> %43, %47
  %50 = ashr <4 x i32> %48, splat (i32 7)
  %51 = ashr <4 x i32> %49, splat (i32 7)
  %52 = sub nsw <4 x i32> %48, %50
  %53 = sub nsw <4 x i32> %49, %51
  store <4 x i32> %52, ptr %44, align 4, !tbaa !5, !alias.scope !12, !noalias !9
  store <4 x i32> %53, ptr %45, align 4, !tbaa !5, !alias.scope !12, !noalias !9
  %54 = add nuw i64 %16, 8
  %55 = icmp eq i64 %54, 376
  br i1 %55, label %13, label %15, !llvm.loop !14

56:                                               ; preds = %57
  ret void

57:                                               ; preds = %60
  %58 = add nuw nsw i64 %11, 1
  %59 = icmp eq i64 %58, 191
  br i1 %59, label %56, label %10, !llvm.loop !18

60:                                               ; preds = %13, %60
  %61 = phi i64 [ %81, %60 ], [ %14, %13 ]
  %62 = add nuw nsw i64 %61, %12
  %63 = getelementptr i32, ptr %1, i64 %62
  %64 = getelementptr i8, ptr %63, i64 -4
  %65 = load i32, ptr %64, align 4, !tbaa !5
  %66 = getelementptr inbounds nuw i8, ptr %63, i64 4
  %67 = load i32, ptr %66, align 4, !tbaa !5
  %68 = add nsw i32 %67, %65
  %69 = getelementptr i8, ptr %63, i64 -1536
  %70 = load i32, ptr %69, align 4, !tbaa !5
  %71 = add nsw i32 %68, %70
  %72 = getelementptr inbounds nuw i8, ptr %63, i64 1536
  %73 = load i32, ptr %72, align 4, !tbaa !5
  %74 = add nsw i32 %71, %73
  %75 = ashr i32 %74, 1
  %76 = getelementptr inbounds nuw i32, ptr %0, i64 %62
  %77 = load i32, ptr %76, align 4, !tbaa !5
  %78 = sub nsw i32 %75, %77
  %79 = ashr i32 %78, 7
  %80 = sub nsw i32 %78, %79
  store i32 %80, ptr %76, align 4, !tbaa !5
  %81 = add nuw nsw i64 %61, 1
  %82 = icmp eq i64 %81, 383
  br i1 %82, label %57, label %60, !llvm.loop !19
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #1

; Function Attrs: nounwind sspstrong uwtable
define dso_local void @spawnBlob(ptr noundef writeonly captures(none) %0) local_unnamed_addr #2 {
  %2 = tail call i32 (...) @simRand() #8
  %3 = srem i32 %2, 500
  %4 = add nsw i32 %3, 1150
  %5 = tail call i32 (...) @simRand() #8
  %6 = srem i32 %5, 1536
  %7 = trunc nsw i32 %6 to i16
  %8 = sdiv i16 %7, 4
  %9 = sext i16 %8 to i64
  %10 = tail call i32 (...) @simRand() #8
  %11 = srem i32 %10, 768
  %12 = trunc nsw i32 %11 to i16
  %13 = sdiv i16 %12, 4
  %14 = sext i16 %13 to i64
  %15 = mul nsw i64 %14, 1536
  %16 = getelementptr i8, ptr %0, i64 %15
  %17 = getelementptr i32, ptr %16, i64 %9
  store i32 %4, ptr %17, align 4, !tbaa !5
  ret void
}

declare i32 @simRand(...) local_unnamed_addr #3

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(none) uwtable
define dso_local noundef i32 @clamp(i32 noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #4 {
  %4 = icmp slt i32 %0, %1
  %5 = tail call i32 @llvm.smin.i32(i32 %0, i32 %2)
  %6 = select i1 %4, i32 %1, i32 %5
  ret i32 %6
}

; Function Attrs: nounwind sspstrong uwtable
define dso_local void @render(ptr noundef readonly captures(none) %0) local_unnamed_addr #2 {
  br label %2

2:                                                ; preds = %1, %15
  %3 = phi i64 [ 0, %1 ], [ %16, %15 ]
  %4 = shl nsw i64 %3, 2
  %5 = mul nuw nsw i64 %3, 1536
  %6 = getelementptr inbounds nuw i8, ptr %0, i64 %5
  %7 = trunc nuw nsw i64 %4 to i32
  %8 = trunc i64 %4 to i32
  %9 = or disjoint i32 %8, 1
  %10 = trunc i64 %4 to i32
  %11 = or disjoint i32 %10, 2
  %12 = trunc i64 %4 to i32
  %13 = or disjoint i32 %12, 3
  br label %18

14:                                               ; preds = %15
  ret void

15:                                               ; preds = %18
  %16 = add nuw nsw i64 %3, 1
  %17 = icmp eq i64 %16, 192
  br i1 %17, label %14, label %2, !llvm.loop !20

18:                                               ; preds = %2, %18
  %19 = phi i64 [ 0, %2 ], [ %35, %18 ]
  %20 = getelementptr inbounds nuw i32, ptr %6, i64 %19
  %21 = load i32, ptr %20, align 4, !tbaa !5
  %22 = ashr i32 %21, 2
  %23 = tail call i32 @llvm.smax.i32(i32 %22, i32 0)
  %24 = tail call i32 @llvm.umin.i32(i32 %23, i32 255)
  %25 = mul nuw nsw i32 %24, 65793
  %26 = or disjoint i32 %25, -16777216
  %27 = shl nsw i64 %19, 2
  %28 = trunc nuw nsw i64 %27 to i32
  tail call void @simPutPixel(i32 noundef %28, i32 noundef %7, i32 noundef %26) #8
  %29 = trunc i64 %27 to i32
  %30 = or disjoint i32 %29, 1
  tail call void @simPutPixel(i32 noundef %30, i32 noundef %7, i32 noundef %26) #8
  %31 = trunc i64 %27 to i32
  %32 = or disjoint i32 %31, 2
  tail call void @simPutPixel(i32 noundef %32, i32 noundef %7, i32 noundef %26) #8
  %33 = trunc i64 %27 to i32
  %34 = or disjoint i32 %33, 3
  tail call void @simPutPixel(i32 noundef %34, i32 noundef %7, i32 noundef %26) #8
  tail call void @simPutPixel(i32 noundef %28, i32 noundef %9, i32 noundef %26) #8
  tail call void @simPutPixel(i32 noundef %30, i32 noundef %9, i32 noundef %26) #8
  tail call void @simPutPixel(i32 noundef %32, i32 noundef %9, i32 noundef %26) #8
  tail call void @simPutPixel(i32 noundef %34, i32 noundef %9, i32 noundef %26) #8
  tail call void @simPutPixel(i32 noundef %28, i32 noundef %11, i32 noundef %26) #8
  tail call void @simPutPixel(i32 noundef %30, i32 noundef %11, i32 noundef %26) #8
  tail call void @simPutPixel(i32 noundef %32, i32 noundef %11, i32 noundef %26) #8
  tail call void @simPutPixel(i32 noundef %34, i32 noundef %11, i32 noundef %26) #8
  tail call void @simPutPixel(i32 noundef %28, i32 noundef %13, i32 noundef %26) #8
  tail call void @simPutPixel(i32 noundef %30, i32 noundef %13, i32 noundef %26) #8
  tail call void @simPutPixel(i32 noundef %32, i32 noundef %13, i32 noundef %26) #8
  tail call void @simPutPixel(i32 noundef %34, i32 noundef %13, i32 noundef %26) #8
  %35 = add nuw nsw i64 %19, 1
  %36 = icmp eq i64 %35, 384
  br i1 %36, label %15, label %18, !llvm.loop !21
}

declare void @simPutPixel(i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: noreturn nounwind sspstrong uwtable
define dso_local void @app() local_unnamed_addr #5 {
  %1 = alloca [73728 x i32], align 16
  %2 = alloca [73728 x i32], align 16
  call void @llvm.lifetime.start.p0(ptr nonnull %1) #8
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(294912) %1, i8 0, i64 294912, i1 false)
  call void @llvm.lifetime.start.p0(ptr nonnull %2) #8
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(294912) %2, i8 0, i64 294912, i1 false)
  br label %3

3:                                                ; preds = %119, %0
  %4 = phi ptr [ %2, %0 ], [ %5, %119 ]
  %5 = phi ptr [ %1, %0 ], [ %4, %119 ]
  %6 = tail call i32 (...) @simRand() #8
  %7 = srem i32 %6, 500
  %8 = add nsw i32 %7, 1150
  %9 = tail call i32 (...) @simRand() #8
  %10 = srem i32 %9, 1536
  %11 = trunc nsw i32 %10 to i16
  %12 = sdiv i16 %11, 4
  %13 = sext i16 %12 to i64
  %14 = tail call i32 (...) @simRand() #8
  %15 = srem i32 %14, 768
  %16 = trunc nsw i32 %15 to i16
  %17 = sdiv i16 %16, 4
  %18 = sext i16 %17 to i64
  %19 = mul nsw i64 %18, 1536
  %20 = getelementptr i8, ptr %4, i64 %19
  %21 = getelementptr i32, ptr %20, i64 %13
  store i32 %8, ptr %21, align 4, !tbaa !5
  %22 = getelementptr i8, ptr %5, i64 1540
  %23 = getelementptr i8, ptr %5, i64 293372
  %24 = getelementptr i8, ptr %4, i64 1536
  %25 = getelementptr i8, ptr %4, i64 293368
  %26 = getelementptr i8, ptr %4, i64 1544
  %27 = getelementptr i8, ptr %4, i64 293376
  %28 = getelementptr nuw i8, ptr %4, i64 4
  %29 = getelementptr i8, ptr %4, i64 291836
  %30 = getelementptr i8, ptr %4, i64 3076
  %31 = getelementptr i8, ptr %4, i64 294908
  %32 = icmp ult ptr %22, %25
  %33 = icmp ult ptr %24, %23
  %34 = and i1 %32, %33
  %35 = icmp ult ptr %22, %27
  %36 = icmp ult ptr %26, %23
  %37 = and i1 %35, %36
  %38 = or i1 %34, %37
  %39 = icmp ult ptr %22, %29
  %40 = icmp ult ptr %28, %23
  %41 = and i1 %39, %40
  %42 = or i1 %38, %41
  %43 = icmp ult ptr %22, %31
  %44 = icmp ult ptr %30, %23
  %45 = and i1 %43, %44
  %46 = or i1 %42, %45
  br label %47

47:                                               ; preds = %93, %3
  %48 = phi i64 [ 1, %3 ], [ %94, %93 ]
  %49 = mul nuw nsw i64 %48, 384
  br i1 %46, label %50, label %52

50:                                               ; preds = %52, %47
  %51 = phi i64 [ 1, %47 ], [ 377, %52 ]
  br label %96

52:                                               ; preds = %47, %52
  %53 = phi i64 [ %91, %52 ], [ 0, %47 ]
  %54 = or disjoint i64 %53, 1
  %55 = add nuw nsw i64 %54, %49
  %56 = getelementptr i32, ptr %4, i64 %55
  %57 = getelementptr i8, ptr %56, i64 -4
  %58 = getelementptr i8, ptr %56, i64 12
  %59 = load <4 x i32>, ptr %57, align 16, !tbaa !5, !alias.scope !22
  %60 = load <4 x i32>, ptr %58, align 16, !tbaa !5, !alias.scope !22
  %61 = getelementptr inbounds nuw i8, ptr %56, i64 4
  %62 = getelementptr inbounds nuw i8, ptr %56, i64 20
  %63 = load <4 x i32>, ptr %61, align 8, !tbaa !5, !alias.scope !25
  %64 = load <4 x i32>, ptr %62, align 8, !tbaa !5, !alias.scope !25
  %65 = add nsw <4 x i32> %63, %59
  %66 = add nsw <4 x i32> %64, %60
  %67 = getelementptr i8, ptr %56, i64 -1536
  %68 = getelementptr i8, ptr %56, i64 -1520
  %69 = load <4 x i32>, ptr %67, align 4, !tbaa !5, !alias.scope !27
  %70 = load <4 x i32>, ptr %68, align 4, !tbaa !5, !alias.scope !27
  %71 = add nsw <4 x i32> %65, %69
  %72 = add nsw <4 x i32> %66, %70
  %73 = getelementptr inbounds nuw i8, ptr %56, i64 1536
  %74 = getelementptr inbounds nuw i8, ptr %56, i64 1552
  %75 = load <4 x i32>, ptr %73, align 4, !tbaa !5, !alias.scope !29
  %76 = load <4 x i32>, ptr %74, align 4, !tbaa !5, !alias.scope !29
  %77 = add nsw <4 x i32> %71, %75
  %78 = add nsw <4 x i32> %72, %76
  %79 = ashr <4 x i32> %77, splat (i32 1)
  %80 = ashr <4 x i32> %78, splat (i32 1)
  %81 = getelementptr inbounds nuw i32, ptr %5, i64 %55
  %82 = getelementptr inbounds nuw i8, ptr %81, i64 16
  %83 = load <4 x i32>, ptr %81, align 4, !tbaa !5, !alias.scope !31, !noalias !33
  %84 = load <4 x i32>, ptr %82, align 4, !tbaa !5, !alias.scope !31, !noalias !33
  %85 = sub nsw <4 x i32> %79, %83
  %86 = sub nsw <4 x i32> %80, %84
  %87 = ashr <4 x i32> %85, splat (i32 7)
  %88 = ashr <4 x i32> %86, splat (i32 7)
  %89 = sub nsw <4 x i32> %85, %87
  %90 = sub nsw <4 x i32> %86, %88
  store <4 x i32> %89, ptr %81, align 4, !tbaa !5, !alias.scope !31, !noalias !33
  store <4 x i32> %90, ptr %82, align 4, !tbaa !5, !alias.scope !31, !noalias !33
  %91 = add nuw i64 %53, 8
  %92 = icmp eq i64 %91, 376
  br i1 %92, label %50, label %52, !llvm.loop !34

93:                                               ; preds = %96
  %94 = add nuw nsw i64 %48, 1
  %95 = icmp eq i64 %94, 191
  br i1 %95, label %119, label %47, !llvm.loop !18

96:                                               ; preds = %50, %96
  %97 = phi i64 [ %117, %96 ], [ %51, %50 ]
  %98 = add nuw nsw i64 %97, %49
  %99 = getelementptr i32, ptr %4, i64 %98
  %100 = getelementptr i8, ptr %99, i64 -4
  %101 = load i32, ptr %100, align 4, !tbaa !5
  %102 = getelementptr inbounds nuw i8, ptr %99, i64 4
  %103 = load i32, ptr %102, align 4, !tbaa !5
  %104 = add nsw i32 %103, %101
  %105 = getelementptr i8, ptr %99, i64 -1536
  %106 = load i32, ptr %105, align 4, !tbaa !5
  %107 = add nsw i32 %104, %106
  %108 = getelementptr inbounds nuw i8, ptr %99, i64 1536
  %109 = load i32, ptr %108, align 4, !tbaa !5
  %110 = add nsw i32 %107, %109
  %111 = ashr i32 %110, 1
  %112 = getelementptr inbounds nuw i32, ptr %5, i64 %98
  %113 = load i32, ptr %112, align 4, !tbaa !5
  %114 = sub nsw i32 %111, %113
  %115 = ashr i32 %114, 7
  %116 = sub nsw i32 %114, %115
  store i32 %116, ptr %112, align 4, !tbaa !5
  %117 = add nuw nsw i64 %97, 1
  %118 = icmp eq i64 %117, 383
  br i1 %118, label %93, label %96, !llvm.loop !35

119:                                              ; preds = %93
  call void @render(ptr noundef nonnull %5)
  tail call void (...) @simFlush() #8
  br label %3
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr writeonly captures(none), i8, i64, i1 immarg) #6

declare void @simFlush(...) local_unnamed_addr #3

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smin.i32(i32, i32) #7

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #7

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.umin.i32(i32, i32) #7

attributes #0 = { nofree norecurse nosync nounwind sspstrong memory(argmem: readwrite) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nounwind sspstrong uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn nounwind sspstrong uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #7 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #8 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}
!llvm.errno.tbaa = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"clang version 22.1.8"}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!10}
!10 = distinct !{!10, !11}
!11 = distinct !{!11, !"LVerDomain"}
!12 = !{!13}
!13 = distinct !{!13, !11}
!14 = distinct !{!14, !15, !16, !17}
!15 = !{!"llvm.loop.mustprogress"}
!16 = !{!"llvm.loop.isvectorized", i32 1}
!17 = !{!"llvm.loop.unroll.runtime.disable"}
!18 = distinct !{!18, !15}
!19 = distinct !{!19, !15, !16}
!20 = distinct !{!20, !15}
!21 = distinct !{!21, !15}
!22 = !{!23}
!23 = distinct !{!23, !24}
!24 = distinct !{!24, !"LVerDomain"}
!25 = !{!26}
!26 = distinct !{!26, !24}
!27 = !{!28}
!28 = distinct !{!28, !24}
!29 = !{!30}
!30 = distinct !{!30, !24}
!31 = !{!32}
!32 = distinct !{!32, !24}
!33 = !{!23, !26, !28, !30}
!34 = distinct !{!34, !15, !16, !17}
!35 = distinct !{!35, !15, !16}
