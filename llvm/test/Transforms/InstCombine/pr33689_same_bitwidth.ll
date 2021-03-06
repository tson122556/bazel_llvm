; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -S -passes=instcombine %s -o - | FileCheck %s

; All the "useless" instructions should be removed and we shouldn't crash.

target datalayout = "p:16:16"

%i64_t = type i64

@a = external global i16
@b = external global i16*

define void @f(i1 %cond) {
; CHECK-LABEL: @f(
; CHECK-NEXT:  bb0:
; CHECK-NEXT:    [[T12:%.*]] = alloca [2 x i32], align 8
; CHECK-NEXT:    [[T12_SUB:%.*]] = getelementptr inbounds [2 x i32], [2 x i32]* [[T12]], i16 0, i16 0
; CHECK-NEXT:    br i1 [[COND:%.*]], label [[BB1:%.*]], label [[BB2:%.*]]
; CHECK:       bb1:
; CHECK-NEXT:    unreachable
; CHECK:       bb2:
; CHECK-NEXT:    [[T9:%.*]] = load i16*, i16** @b, align 2
; CHECK-NEXT:    store i16 0, i16* [[T9]], align 2
; CHECK-NEXT:    [[T10:%.*]] = load i32, i32* [[T12_SUB]], align 8
; CHECK-NEXT:    [[T11:%.*]] = add i32 [[T10]], -1
; CHECK-NEXT:    store i32 [[T11]], i32* [[T12_SUB]], align 8
; CHECK-NEXT:    ret void
;
bb0:
  %t1 = alloca %i64_t
  %t2 = bitcast %i64_t* %t1 to i32*
  %useless3 = bitcast %i64_t* %t1 to i16*
  %useless4 = getelementptr inbounds i16, i16* %useless3, i16 undef
  %useless5 = bitcast i16* %useless4 to i32*
  br i1 %cond, label %bb1, label %bb2

bb1:                                              ; preds = %bb0
  %useless6 = insertvalue [1 x i32*] undef, i32* %t2, 0
  %useless7 = insertvalue [1 x i32*] %useless6, i32* null, 0
  %t8 = ptrtoint i32* %t2 to i16
  store i16 %t8, i16* @a
  unreachable

bb2:                                              ; preds = %bb0
  %t9 = load i16*, i16** @b
  store i16 0, i16* %t9
  %t10 = load i32, i32* %t2
  %t11 = sub i32 %t10, 1
  store i32 %t11, i32* %t2
  ret void
}
