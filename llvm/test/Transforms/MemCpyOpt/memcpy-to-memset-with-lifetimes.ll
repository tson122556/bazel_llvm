; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -basic-aa -memcpyopt -instcombine -S < %s -verify-memoryssa | FileCheck %s

target datalayout = "e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @foo([8 x i64]* noalias nocapture sret([8 x i64]) dereferenceable(64) %sret) {
; CHECK-LABEL: @foo(
; CHECK-NEXT:  entry-block:
; CHECK-NEXT:    [[SRET1:%.*]] = bitcast [8 x i64]* [[SRET:%.*]] to i8*
; CHECK-NEXT:    call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(64) [[SRET1]], i8 0, i64 64, i1 false)
; CHECK-NEXT:    ret void
;
entry-block:
  %a = alloca [8 x i64], align 8
  %a.cast = bitcast [8 x i64]* %a to i8*
  call void @llvm.lifetime.start.p0i8(i64 64, i8* %a.cast)
  call void @llvm.memset.p0i8.i64(i8* align 8 %a.cast, i8 0, i64 64, i1 false)
  %sret.cast = bitcast [8 x i64]* %sret to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %sret.cast, i8* align 8 %a.cast, i64 64, i1 false)
  call void @llvm.lifetime.end.p0i8(i64 64, i8* %a.cast)
  ret void

}

define void @bar([8 x i64]* noalias nocapture sret([8 x i64]) dereferenceable(64) %sret, [8 x i64]* noalias nocapture dereferenceable(64) %out) {
; CHECK-LABEL: @bar(
; CHECK-NEXT:  entry-block:
; CHECK-NEXT:    [[A:%.*]] = alloca [8 x i64], align 8
; CHECK-NEXT:    [[A_CAST:%.*]] = bitcast [8 x i64]* [[A]] to i8*
; CHECK-NEXT:    call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull [[A_CAST]])
; CHECK-NEXT:    call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(64) [[A_CAST]], i8 0, i64 64, i1 false)
; CHECK-NEXT:    [[SRET_CAST:%.*]] = bitcast [8 x i64]* [[SRET:%.*]] to i8*
; CHECK-NEXT:    call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(64) [[SRET_CAST]], i8 0, i64 64, i1 false)
; CHECK-NEXT:    call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(32) [[A_CAST]], i8 42, i64 32, i1 false)
; CHECK-NEXT:    [[OUT_CAST:%.*]] = bitcast [8 x i64]* [[OUT:%.*]] to i8*
; CHECK-NEXT:    call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(64) [[OUT_CAST]], i8* noundef nonnull align 8 dereferenceable(64) [[A_CAST]], i64 64, i1 false)
; CHECK-NEXT:    call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull [[A_CAST]])
; CHECK-NEXT:    ret void
;
entry-block:
  %a = alloca [8 x i64], align 8
  %a.cast = bitcast [8 x i64]* %a to i8*
  call void @llvm.lifetime.start.p0i8(i64 64, i8* %a.cast)
  call void @llvm.memset.p0i8.i64(i8* align 8 %a.cast, i8 0, i64 64, i1 false)
  %sret.cast = bitcast [8 x i64]* %sret to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %sret.cast, i8* align 8 %a.cast, i64 64, i1 false)
  call void @llvm.memset.p0i8.i64(i8* align 8 %a.cast, i8 42, i64 32, i1 false)
  %out.cast = bitcast [8 x i64]* %out to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %out.cast, i8* align 8 %a.cast, i64 64, i1 false)
  call void @llvm.lifetime.end.p0i8(i64 64, i8* %a.cast)
  ret void

}

declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) nounwind

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i1) nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i1) nounwind
