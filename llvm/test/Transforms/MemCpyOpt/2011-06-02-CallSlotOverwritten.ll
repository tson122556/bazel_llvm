; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -basic-aa -memcpyopt -S -verify-memoryssa | FileCheck %s
; PR10067
; Make sure the call+copy isn't optimized in such a way that
; %ret ends up with the wrong value.

target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:128:128-n8:16:32"
target triple = "i386-apple-darwin10"

%struct1 = type { i32, i32 }
%struct2 = type { %struct1, i8* }

declare void @bar(%struct1* nocapture sret(%struct1) %agg.result) nounwind

define i32 @foo() nounwind {
; CHECK-LABEL: @foo(
; CHECK-NEXT:    [[X:%.*]] = alloca [[STRUCT1:%.*]], align 8
; CHECK-NEXT:    [[Y:%.*]] = alloca [[STRUCT2:%.*]], align 8
; CHECK-NEXT:    call void @bar(%struct1* sret(%struct1) [[X]]) [[ATTR0:#.*]]
; CHECK-NEXT:    [[GEPN1:%.*]] = getelementptr inbounds [[STRUCT2]], %struct2* [[Y]], i32 0, i32 0, i32 0
; CHECK-NEXT:    store i32 0, i32* [[GEPN1]], align 8
; CHECK-NEXT:    [[GEPN2:%.*]] = getelementptr inbounds [[STRUCT2]], %struct2* [[Y]], i32 0, i32 0, i32 1
; CHECK-NEXT:    store i32 0, i32* [[GEPN2]], align 4
; CHECK-NEXT:    [[BIT1:%.*]] = bitcast %struct1* [[X]] to i64*
; CHECK-NEXT:    [[BIT2:%.*]] = bitcast %struct2* [[Y]] to i64*
; CHECK-NEXT:    [[LOAD:%.*]] = load i64, i64* [[BIT1]], align 8
; CHECK-NEXT:    store i64 [[LOAD]], i64* [[BIT2]], align 8
; CHECK-NEXT:    [[GEP1:%.*]] = getelementptr [[STRUCT2]], %struct2* [[Y]], i32 0, i32 0, i32 0
; CHECK-NEXT:    [[RET:%.*]] = load i32, i32* [[GEP1]], align 4
; CHECK-NEXT:    ret i32 [[RET]]
;
  %x = alloca %struct1, align 8
  %y = alloca %struct2, align 8
  call void @bar(%struct1* sret(%struct1) %x) nounwind

  %gepn1 = getelementptr inbounds %struct2, %struct2* %y, i32 0, i32 0, i32 0
  store i32 0, i32* %gepn1, align 8
  %gepn2 = getelementptr inbounds %struct2, %struct2* %y, i32 0, i32 0, i32 1
  store i32 0, i32* %gepn2, align 4

  %bit1 = bitcast %struct1* %x to i64*
  %bit2 = bitcast %struct2* %y to i64*
  %load = load i64, i64* %bit1, align 8
  store i64 %load, i64* %bit2, align 8


  %gep1 = getelementptr %struct2, %struct2* %y, i32 0, i32 0, i32 0
  %ret = load i32, i32* %gep1
  ret i32 %ret
}
