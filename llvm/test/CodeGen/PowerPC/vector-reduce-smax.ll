; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -verify-machineinstrs -ppc-asm-full-reg-names -ppc-vsr-nums-as-vr \
; RUN:   -mcpu=pwr9 -mtriple=powerpc64le < %s | FileCheck %s --check-prefix=PWR9LE
; RUN: llc -verify-machineinstrs -ppc-asm-full-reg-names -ppc-vsr-nums-as-vr \
; RUN:   -mcpu=pwr9 -mtriple=powerpc64 < %s | FileCheck %s --check-prefix=PWR9BE
; RUN: llc -verify-machineinstrs -ppc-asm-full-reg-names -ppc-vsr-nums-as-vr \
; RUN:   -mcpu=pwr10 -mtriple=powerpc64le < %s | FileCheck %s --check-prefix=PWR10LE
; RUN: llc -verify-machineinstrs -ppc-asm-full-reg-names -ppc-vsr-nums-as-vr \
; RUN:   -mcpu=pwr10 -mtriple=powerpc64 < %s | FileCheck %s --check-prefix=PWR10BE

;;
;; Vectors of type i8
;;
define dso_local i8 @v2i8(<2 x i8> %a) local_unnamed_addr #0 {
; PWR9LE-LABEL: v2i8:
; PWR9LE:       # %bb.0: # %entry
; PWR9LE-NEXT:    vspltb v3, v2, 14
; PWR9LE-NEXT:    li r3, 0
; PWR9LE-NEXT:    vmaxsb v2, v2, v3
; PWR9LE-NEXT:    vextubrx r3, r3, v2
; PWR9LE-NEXT:    blr
;
; PWR9BE-LABEL: v2i8:
; PWR9BE:       # %bb.0: # %entry
; PWR9BE-NEXT:    vspltb v3, v2, 1
; PWR9BE-NEXT:    li r3, 0
; PWR9BE-NEXT:    vmaxsb v2, v2, v3
; PWR9BE-NEXT:    vextublx r3, r3, v2
; PWR9BE-NEXT:    blr
;
; PWR10LE-LABEL: v2i8:
; PWR10LE:       # %bb.0: # %entry
; PWR10LE-NEXT:    vspltb v3, v2, 14
; PWR10LE-NEXT:    li r3, 0
; PWR10LE-NEXT:    vmaxsb v2, v2, v3
; PWR10LE-NEXT:    vextubrx r3, r3, v2
; PWR10LE-NEXT:    blr
;
; PWR10BE-LABEL: v2i8:
; PWR10BE:       # %bb.0: # %entry
; PWR10BE-NEXT:    vspltb v3, v2, 1
; PWR10BE-NEXT:    li r3, 0
; PWR10BE-NEXT:    vmaxsb v2, v2, v3
; PWR10BE-NEXT:    vextublx r3, r3, v2
; PWR10BE-NEXT:    blr
entry:
  %0 = call i8 @llvm.vector.reduce.smax.v2i8(<2 x i8> %a)
  ret i8 %0
}

define dso_local i8 @v4i8(<4 x i8> %a) local_unnamed_addr #0 {
; PWR9LE-LABEL: v4i8:
; PWR9LE:       # %bb.0: # %entry
; PWR9LE-NEXT:    vsplth v3, v2, 6
; PWR9LE-NEXT:    li r3, 0
; PWR9LE-NEXT:    vmaxsb v2, v2, v3
; PWR9LE-NEXT:    vspltb v3, v2, 14
; PWR9LE-NEXT:    vmaxsb v2, v2, v3
; PWR9LE-NEXT:    vextubrx r3, r3, v2
; PWR9LE-NEXT:    blr
;
; PWR9BE-LABEL: v4i8:
; PWR9BE:       # %bb.0: # %entry
; PWR9BE-NEXT:    vsplth v3, v2, 1
; PWR9BE-NEXT:    li r3, 0
; PWR9BE-NEXT:    vmaxsb v2, v2, v3
; PWR9BE-NEXT:    vspltb v3, v2, 1
; PWR9BE-NEXT:    vmaxsb v2, v2, v3
; PWR9BE-NEXT:    vextublx r3, r3, v2
; PWR9BE-NEXT:    blr
;
; PWR10LE-LABEL: v4i8:
; PWR10LE:       # %bb.0: # %entry
; PWR10LE-NEXT:    vsplth v3, v2, 6
; PWR10LE-NEXT:    li r3, 0
; PWR10LE-NEXT:    vmaxsb v2, v2, v3
; PWR10LE-NEXT:    vspltb v3, v2, 14
; PWR10LE-NEXT:    vmaxsb v2, v2, v3
; PWR10LE-NEXT:    vextubrx r3, r3, v2
; PWR10LE-NEXT:    blr
;
; PWR10BE-LABEL: v4i8:
; PWR10BE:       # %bb.0: # %entry
; PWR10BE-NEXT:    vsplth v3, v2, 1
; PWR10BE-NEXT:    li r3, 0
; PWR10BE-NEXT:    vmaxsb v2, v2, v3
; PWR10BE-NEXT:    vspltb v3, v2, 1
; PWR10BE-NEXT:    vmaxsb v2, v2, v3
; PWR10BE-NEXT:    vextublx r3, r3, v2
; PWR10BE-NEXT:    blr
entry:
  %0 = call i8 @llvm.vector.reduce.smax.v4i8(<4 x i8> %a)
  ret i8 %0
}

define dso_local i8 @v8i8(<8 x i8> %a) local_unnamed_addr #0 {
; PWR9LE-LABEL: v8i8:
; PWR9LE:       # %bb.0: # %entry
; PWR9LE-NEXT:    xxspltw v3, v2, 2
; PWR9LE-NEXT:    li r3, 0
; PWR9LE-NEXT:    vmaxsb v2, v2, v3
; PWR9LE-NEXT:    vsplth v3, v2, 6
; PWR9LE-NEXT:    vmaxsb v2, v2, v3
; PWR9LE-NEXT:    vspltb v3, v2, 14
; PWR9LE-NEXT:    vmaxsb v2, v2, v3
; PWR9LE-NEXT:    vextubrx r3, r3, v2
; PWR9LE-NEXT:    blr
;
; PWR9BE-LABEL: v8i8:
; PWR9BE:       # %bb.0: # %entry
; PWR9BE-NEXT:    xxspltw v3, v2, 1
; PWR9BE-NEXT:    li r3, 0
; PWR9BE-NEXT:    vmaxsb v2, v2, v3
; PWR9BE-NEXT:    vsplth v3, v2, 1
; PWR9BE-NEXT:    vmaxsb v2, v2, v3
; PWR9BE-NEXT:    vspltb v3, v2, 1
; PWR9BE-NEXT:    vmaxsb v2, v2, v3
; PWR9BE-NEXT:    vextublx r3, r3, v2
; PWR9BE-NEXT:    blr
;
; PWR10LE-LABEL: v8i8:
; PWR10LE:       # %bb.0: # %entry
; PWR10LE-NEXT:    xxspltw v3, v2, 2
; PWR10LE-NEXT:    li r3, 0
; PWR10LE-NEXT:    vmaxsb v2, v2, v3
; PWR10LE-NEXT:    vsplth v3, v2, 6
; PWR10LE-NEXT:    vmaxsb v2, v2, v3
; PWR10LE-NEXT:    vspltb v3, v2, 14
; PWR10LE-NEXT:    vmaxsb v2, v2, v3
; PWR10LE-NEXT:    vextubrx r3, r3, v2
; PWR10LE-NEXT:    blr
;
; PWR10BE-LABEL: v8i8:
; PWR10BE:       # %bb.0: # %entry
; PWR10BE-NEXT:    xxspltw v3, v2, 1
; PWR10BE-NEXT:    li r3, 0
; PWR10BE-NEXT:    vmaxsb v2, v2, v3
; PWR10BE-NEXT:    vsplth v3, v2, 1
; PWR10BE-NEXT:    vmaxsb v2, v2, v3
; PWR10BE-NEXT:    vspltb v3, v2, 1
; PWR10BE-NEXT:    vmaxsb v2, v2, v3
; PWR10BE-NEXT:    vextublx r3, r3, v2
; PWR10BE-NEXT:    blr
entry:
  %0 = call i8 @llvm.vector.reduce.smax.v8i8(<8 x i8> %a)
  ret i8 %0
}

define dso_local i8 @v16i8(<16 x i8> %a) local_unnamed_addr #0 {
; PWR9LE-LABEL: v16i8:
; PWR9LE:       # %bb.0: # %entry
; PWR9LE-NEXT:    xxswapd v3, v2
; PWR9LE-NEXT:    li r3, 0
; PWR9LE-NEXT:    vmaxsb v2, v2, v3
; PWR9LE-NEXT:    xxspltw v3, v2, 2
; PWR9LE-NEXT:    vmaxsb v2, v2, v3
; PWR9LE-NEXT:    vsplth v3, v2, 6
; PWR9LE-NEXT:    vmaxsb v2, v2, v3
; PWR9LE-NEXT:    vspltb v3, v2, 14
; PWR9LE-NEXT:    vmaxsb v2, v2, v3
; PWR9LE-NEXT:    vextubrx r3, r3, v2
; PWR9LE-NEXT:    blr
;
; PWR9BE-LABEL: v16i8:
; PWR9BE:       # %bb.0: # %entry
; PWR9BE-NEXT:    xxswapd v3, v2
; PWR9BE-NEXT:    li r3, 0
; PWR9BE-NEXT:    vmaxsb v2, v2, v3
; PWR9BE-NEXT:    xxspltw v3, v2, 1
; PWR9BE-NEXT:    vmaxsb v2, v2, v3
; PWR9BE-NEXT:    vsplth v3, v2, 1
; PWR9BE-NEXT:    vmaxsb v2, v2, v3
; PWR9BE-NEXT:    vspltb v3, v2, 1
; PWR9BE-NEXT:    vmaxsb v2, v2, v3
; PWR9BE-NEXT:    vextublx r3, r3, v2
; PWR9BE-NEXT:    blr
;
; PWR10LE-LABEL: v16i8:
; PWR10LE:       # %bb.0: # %entry
; PWR10LE-NEXT:    xxswapd v3, v2
; PWR10LE-NEXT:    li r3, 0
; PWR10LE-NEXT:    vmaxsb v2, v2, v3
; PWR10LE-NEXT:    xxspltw v3, v2, 2
; PWR10LE-NEXT:    vmaxsb v2, v2, v3
; PWR10LE-NEXT:    vsplth v3, v2, 6
; PWR10LE-NEXT:    vmaxsb v2, v2, v3
; PWR10LE-NEXT:    vspltb v3, v2, 14
; PWR10LE-NEXT:    vmaxsb v2, v2, v3
; PWR10LE-NEXT:    vextubrx r3, r3, v2
; PWR10LE-NEXT:    blr
;
; PWR10BE-LABEL: v16i8:
; PWR10BE:       # %bb.0: # %entry
; PWR10BE-NEXT:    xxswapd v3, v2
; PWR10BE-NEXT:    li r3, 0
; PWR10BE-NEXT:    vmaxsb v2, v2, v3
; PWR10BE-NEXT:    xxspltw v3, v2, 1
; PWR10BE-NEXT:    vmaxsb v2, v2, v3
; PWR10BE-NEXT:    vsplth v3, v2, 1
; PWR10BE-NEXT:    vmaxsb v2, v2, v3
; PWR10BE-NEXT:    vspltb v3, v2, 1
; PWR10BE-NEXT:    vmaxsb v2, v2, v3
; PWR10BE-NEXT:    vextublx r3, r3, v2
; PWR10BE-NEXT:    blr
entry:
  %0 = call i8 @llvm.vector.reduce.smax.v16i8(<16 x i8> %a)
  ret i8 %0
}

declare i8 @llvm.vector.reduce.smax.v2i8(<2 x i8>) #0
declare i8 @llvm.vector.reduce.smax.v4i8(<4 x i8>) #0
declare i8 @llvm.vector.reduce.smax.v8i8(<8 x i8>) #0
declare i8 @llvm.vector.reduce.smax.v16i8(<16 x i8>) #0

;;
;; Vectors of type i16
;;
define dso_local i16 @v2i16(<2 x i16> %a) local_unnamed_addr #0 {
; PWR9LE-LABEL: v2i16:
; PWR9LE:       # %bb.0: # %entry
; PWR9LE-NEXT:    vsplth v3, v2, 6
; PWR9LE-NEXT:    li r3, 0
; PWR9LE-NEXT:    vmaxsh v2, v2, v3
; PWR9LE-NEXT:    vextuhrx r3, r3, v2
; PWR9LE-NEXT:    blr
;
; PWR9BE-LABEL: v2i16:
; PWR9BE:       # %bb.0: # %entry
; PWR9BE-NEXT:    vsplth v3, v2, 1
; PWR9BE-NEXT:    li r3, 0
; PWR9BE-NEXT:    vmaxsh v2, v2, v3
; PWR9BE-NEXT:    vextuhlx r3, r3, v2
; PWR9BE-NEXT:    blr
;
; PWR10LE-LABEL: v2i16:
; PWR10LE:       # %bb.0: # %entry
; PWR10LE-NEXT:    vsplth v3, v2, 6
; PWR10LE-NEXT:    li r3, 0
; PWR10LE-NEXT:    vmaxsh v2, v2, v3
; PWR10LE-NEXT:    vextuhrx r3, r3, v2
; PWR10LE-NEXT:    blr
;
; PWR10BE-LABEL: v2i16:
; PWR10BE:       # %bb.0: # %entry
; PWR10BE-NEXT:    vsplth v3, v2, 1
; PWR10BE-NEXT:    li r3, 0
; PWR10BE-NEXT:    vmaxsh v2, v2, v3
; PWR10BE-NEXT:    vextuhlx r3, r3, v2
; PWR10BE-NEXT:    blr
entry:
  %0 = call i16 @llvm.vector.reduce.smax.v2i16(<2 x i16> %a)
  ret i16 %0
}

define dso_local i16 @v4i16(<4 x i16> %a) local_unnamed_addr #0 {
; PWR9LE-LABEL: v4i16:
; PWR9LE:       # %bb.0: # %entry
; PWR9LE-NEXT:    xxspltw v3, v2, 2
; PWR9LE-NEXT:    li r3, 0
; PWR9LE-NEXT:    vmaxsh v2, v2, v3
; PWR9LE-NEXT:    vsplth v3, v2, 6
; PWR9LE-NEXT:    vmaxsh v2, v2, v3
; PWR9LE-NEXT:    vextuhrx r3, r3, v2
; PWR9LE-NEXT:    blr
;
; PWR9BE-LABEL: v4i16:
; PWR9BE:       # %bb.0: # %entry
; PWR9BE-NEXT:    xxspltw v3, v2, 1
; PWR9BE-NEXT:    li r3, 0
; PWR9BE-NEXT:    vmaxsh v2, v2, v3
; PWR9BE-NEXT:    vsplth v3, v2, 1
; PWR9BE-NEXT:    vmaxsh v2, v2, v3
; PWR9BE-NEXT:    vextuhlx r3, r3, v2
; PWR9BE-NEXT:    blr
;
; PWR10LE-LABEL: v4i16:
; PWR10LE:       # %bb.0: # %entry
; PWR10LE-NEXT:    xxspltw v3, v2, 2
; PWR10LE-NEXT:    li r3, 0
; PWR10LE-NEXT:    vmaxsh v2, v2, v3
; PWR10LE-NEXT:    vsplth v3, v2, 6
; PWR10LE-NEXT:    vmaxsh v2, v2, v3
; PWR10LE-NEXT:    vextuhrx r3, r3, v2
; PWR10LE-NEXT:    blr
;
; PWR10BE-LABEL: v4i16:
; PWR10BE:       # %bb.0: # %entry
; PWR10BE-NEXT:    xxspltw v3, v2, 1
; PWR10BE-NEXT:    li r3, 0
; PWR10BE-NEXT:    vmaxsh v2, v2, v3
; PWR10BE-NEXT:    vsplth v3, v2, 1
; PWR10BE-NEXT:    vmaxsh v2, v2, v3
; PWR10BE-NEXT:    vextuhlx r3, r3, v2
; PWR10BE-NEXT:    blr
entry:
  %0 = call i16 @llvm.vector.reduce.smax.v4i16(<4 x i16> %a)
  ret i16 %0
}

define dso_local i16 @v8i16(<8 x i16> %a) local_unnamed_addr #0 {
; PWR9LE-LABEL: v8i16:
; PWR9LE:       # %bb.0: # %entry
; PWR9LE-NEXT:    xxswapd v3, v2
; PWR9LE-NEXT:    li r3, 0
; PWR9LE-NEXT:    vmaxsh v2, v2, v3
; PWR9LE-NEXT:    xxspltw v3, v2, 2
; PWR9LE-NEXT:    vmaxsh v2, v2, v3
; PWR9LE-NEXT:    vsplth v3, v2, 6
; PWR9LE-NEXT:    vmaxsh v2, v2, v3
; PWR9LE-NEXT:    vextuhrx r3, r3, v2
; PWR9LE-NEXT:    blr
;
; PWR9BE-LABEL: v8i16:
; PWR9BE:       # %bb.0: # %entry
; PWR9BE-NEXT:    xxswapd v3, v2
; PWR9BE-NEXT:    li r3, 0
; PWR9BE-NEXT:    vmaxsh v2, v2, v3
; PWR9BE-NEXT:    xxspltw v3, v2, 1
; PWR9BE-NEXT:    vmaxsh v2, v2, v3
; PWR9BE-NEXT:    vsplth v3, v2, 1
; PWR9BE-NEXT:    vmaxsh v2, v2, v3
; PWR9BE-NEXT:    vextuhlx r3, r3, v2
; PWR9BE-NEXT:    blr
;
; PWR10LE-LABEL: v8i16:
; PWR10LE:       # %bb.0: # %entry
; PWR10LE-NEXT:    xxswapd v3, v2
; PWR10LE-NEXT:    li r3, 0
; PWR10LE-NEXT:    vmaxsh v2, v2, v3
; PWR10LE-NEXT:    xxspltw v3, v2, 2
; PWR10LE-NEXT:    vmaxsh v2, v2, v3
; PWR10LE-NEXT:    vsplth v3, v2, 6
; PWR10LE-NEXT:    vmaxsh v2, v2, v3
; PWR10LE-NEXT:    vextuhrx r3, r3, v2
; PWR10LE-NEXT:    blr
;
; PWR10BE-LABEL: v8i16:
; PWR10BE:       # %bb.0: # %entry
; PWR10BE-NEXT:    xxswapd v3, v2
; PWR10BE-NEXT:    li r3, 0
; PWR10BE-NEXT:    vmaxsh v2, v2, v3
; PWR10BE-NEXT:    xxspltw v3, v2, 1
; PWR10BE-NEXT:    vmaxsh v2, v2, v3
; PWR10BE-NEXT:    vsplth v3, v2, 1
; PWR10BE-NEXT:    vmaxsh v2, v2, v3
; PWR10BE-NEXT:    vextuhlx r3, r3, v2
; PWR10BE-NEXT:    blr
entry:
  %0 = call i16 @llvm.vector.reduce.smax.v8i16(<8 x i16> %a)
  ret i16 %0
}

define dso_local i16 @v16i16(<16 x i16> %a) local_unnamed_addr #0 {
; PWR9LE-LABEL: v16i16:
; PWR9LE:       # %bb.0: # %entry
; PWR9LE-NEXT:    vmaxsh v2, v2, v3
; PWR9LE-NEXT:    li r3, 0
; PWR9LE-NEXT:    xxswapd v3, v2
; PWR9LE-NEXT:    vmaxsh v2, v2, v3
; PWR9LE-NEXT:    xxspltw v3, v2, 2
; PWR9LE-NEXT:    vmaxsh v2, v2, v3
; PWR9LE-NEXT:    vsplth v3, v2, 6
; PWR9LE-NEXT:    vmaxsh v2, v2, v3
; PWR9LE-NEXT:    vextuhrx r3, r3, v2
; PWR9LE-NEXT:    blr
;
; PWR9BE-LABEL: v16i16:
; PWR9BE:       # %bb.0: # %entry
; PWR9BE-NEXT:    vmaxsh v2, v2, v3
; PWR9BE-NEXT:    li r3, 0
; PWR9BE-NEXT:    xxswapd v3, v2
; PWR9BE-NEXT:    vmaxsh v2, v2, v3
; PWR9BE-NEXT:    xxspltw v3, v2, 1
; PWR9BE-NEXT:    vmaxsh v2, v2, v3
; PWR9BE-NEXT:    vsplth v3, v2, 1
; PWR9BE-NEXT:    vmaxsh v2, v2, v3
; PWR9BE-NEXT:    vextuhlx r3, r3, v2
; PWR9BE-NEXT:    blr
;
; PWR10LE-LABEL: v16i16:
; PWR10LE:       # %bb.0: # %entry
; PWR10LE-NEXT:    vmaxsh v2, v2, v3
; PWR10LE-NEXT:    li r3, 0
; PWR10LE-NEXT:    xxswapd v3, v2
; PWR10LE-NEXT:    vmaxsh v2, v2, v3
; PWR10LE-NEXT:    xxspltw v3, v2, 2
; PWR10LE-NEXT:    vmaxsh v2, v2, v3
; PWR10LE-NEXT:    vsplth v3, v2, 6
; PWR10LE-NEXT:    vmaxsh v2, v2, v3
; PWR10LE-NEXT:    vextuhrx r3, r3, v2
; PWR10LE-NEXT:    blr
;
; PWR10BE-LABEL: v16i16:
; PWR10BE:       # %bb.0: # %entry
; PWR10BE-NEXT:    vmaxsh v2, v2, v3
; PWR10BE-NEXT:    li r3, 0
; PWR10BE-NEXT:    xxswapd v3, v2
; PWR10BE-NEXT:    vmaxsh v2, v2, v3
; PWR10BE-NEXT:    xxspltw v3, v2, 1
; PWR10BE-NEXT:    vmaxsh v2, v2, v3
; PWR10BE-NEXT:    vsplth v3, v2, 1
; PWR10BE-NEXT:    vmaxsh v2, v2, v3
; PWR10BE-NEXT:    vextuhlx r3, r3, v2
; PWR10BE-NEXT:    blr
entry:
  %0 = call i16 @llvm.vector.reduce.smax.v16i16(<16 x i16> %a)
  ret i16 %0
}

declare i16 @llvm.vector.reduce.smax.v2i16(<2 x i16>) #0
declare i16 @llvm.vector.reduce.smax.v4i16(<4 x i16>) #0
declare i16 @llvm.vector.reduce.smax.v8i16(<8 x i16>) #0
declare i16 @llvm.vector.reduce.smax.v16i16(<16 x i16>) #0

;;
;; Vectors of type i32
;;
define dso_local i32 @v2i32(<2 x i32> %a) local_unnamed_addr #0 {
; PWR9LE-LABEL: v2i32:
; PWR9LE:       # %bb.0: # %entry
; PWR9LE-NEXT:    xxspltw v3, v2, 2
; PWR9LE-NEXT:    li r3, 0
; PWR9LE-NEXT:    vmaxsw v2, v2, v3
; PWR9LE-NEXT:    vextuwrx r3, r3, v2
; PWR9LE-NEXT:    blr
;
; PWR9BE-LABEL: v2i32:
; PWR9BE:       # %bb.0: # %entry
; PWR9BE-NEXT:    xxspltw v3, v2, 1
; PWR9BE-NEXT:    li r3, 0
; PWR9BE-NEXT:    vmaxsw v2, v2, v3
; PWR9BE-NEXT:    vextuwlx r3, r3, v2
; PWR9BE-NEXT:    blr
;
; PWR10LE-LABEL: v2i32:
; PWR10LE:       # %bb.0: # %entry
; PWR10LE-NEXT:    xxspltw v3, v2, 2
; PWR10LE-NEXT:    li r3, 0
; PWR10LE-NEXT:    vmaxsw v2, v2, v3
; PWR10LE-NEXT:    vextuwrx r3, r3, v2
; PWR10LE-NEXT:    blr
;
; PWR10BE-LABEL: v2i32:
; PWR10BE:       # %bb.0: # %entry
; PWR10BE-NEXT:    xxspltw v3, v2, 1
; PWR10BE-NEXT:    li r3, 0
; PWR10BE-NEXT:    vmaxsw v2, v2, v3
; PWR10BE-NEXT:    vextuwlx r3, r3, v2
; PWR10BE-NEXT:    blr
entry:
  %0 = call i32 @llvm.vector.reduce.smax.v2i32(<2 x i32> %a)
  ret i32 %0
}

define dso_local i32 @v4i32(<4 x i32> %a) local_unnamed_addr #0 {
; PWR9LE-LABEL: v4i32:
; PWR9LE:       # %bb.0: # %entry
; PWR9LE-NEXT:    xxswapd v3, v2
; PWR9LE-NEXT:    li r3, 0
; PWR9LE-NEXT:    vmaxsw v2, v2, v3
; PWR9LE-NEXT:    xxspltw v3, v2, 2
; PWR9LE-NEXT:    vmaxsw v2, v2, v3
; PWR9LE-NEXT:    vextuwrx r3, r3, v2
; PWR9LE-NEXT:    blr
;
; PWR9BE-LABEL: v4i32:
; PWR9BE:       # %bb.0: # %entry
; PWR9BE-NEXT:    xxswapd v3, v2
; PWR9BE-NEXT:    li r3, 0
; PWR9BE-NEXT:    vmaxsw v2, v2, v3
; PWR9BE-NEXT:    xxspltw v3, v2, 1
; PWR9BE-NEXT:    vmaxsw v2, v2, v3
; PWR9BE-NEXT:    vextuwlx r3, r3, v2
; PWR9BE-NEXT:    blr
;
; PWR10LE-LABEL: v4i32:
; PWR10LE:       # %bb.0: # %entry
; PWR10LE-NEXT:    xxswapd v3, v2
; PWR10LE-NEXT:    li r3, 0
; PWR10LE-NEXT:    vmaxsw v2, v2, v3
; PWR10LE-NEXT:    xxspltw v3, v2, 2
; PWR10LE-NEXT:    vmaxsw v2, v2, v3
; PWR10LE-NEXT:    vextuwrx r3, r3, v2
; PWR10LE-NEXT:    blr
;
; PWR10BE-LABEL: v4i32:
; PWR10BE:       # %bb.0: # %entry
; PWR10BE-NEXT:    xxswapd v3, v2
; PWR10BE-NEXT:    li r3, 0
; PWR10BE-NEXT:    vmaxsw v2, v2, v3
; PWR10BE-NEXT:    xxspltw v3, v2, 1
; PWR10BE-NEXT:    vmaxsw v2, v2, v3
; PWR10BE-NEXT:    vextuwlx r3, r3, v2
; PWR10BE-NEXT:    blr
entry:
  %0 = call i32 @llvm.vector.reduce.smax.v4i32(<4 x i32> %a)
  ret i32 %0
}

define dso_local i32 @v8i32(<8 x i32> %a) local_unnamed_addr #0 {
; PWR9LE-LABEL: v8i32:
; PWR9LE:       # %bb.0: # %entry
; PWR9LE-NEXT:    vmaxsw v2, v2, v3
; PWR9LE-NEXT:    li r3, 0
; PWR9LE-NEXT:    xxswapd v3, v2
; PWR9LE-NEXT:    vmaxsw v2, v2, v3
; PWR9LE-NEXT:    xxspltw v3, v2, 2
; PWR9LE-NEXT:    vmaxsw v2, v2, v3
; PWR9LE-NEXT:    vextuwrx r3, r3, v2
; PWR9LE-NEXT:    blr
;
; PWR9BE-LABEL: v8i32:
; PWR9BE:       # %bb.0: # %entry
; PWR9BE-NEXT:    vmaxsw v2, v2, v3
; PWR9BE-NEXT:    li r3, 0
; PWR9BE-NEXT:    xxswapd v3, v2
; PWR9BE-NEXT:    vmaxsw v2, v2, v3
; PWR9BE-NEXT:    xxspltw v3, v2, 1
; PWR9BE-NEXT:    vmaxsw v2, v2, v3
; PWR9BE-NEXT:    vextuwlx r3, r3, v2
; PWR9BE-NEXT:    blr
;
; PWR10LE-LABEL: v8i32:
; PWR10LE:       # %bb.0: # %entry
; PWR10LE-NEXT:    vmaxsw v2, v2, v3
; PWR10LE-NEXT:    li r3, 0
; PWR10LE-NEXT:    xxswapd v3, v2
; PWR10LE-NEXT:    vmaxsw v2, v2, v3
; PWR10LE-NEXT:    xxspltw v3, v2, 2
; PWR10LE-NEXT:    vmaxsw v2, v2, v3
; PWR10LE-NEXT:    vextuwrx r3, r3, v2
; PWR10LE-NEXT:    blr
;
; PWR10BE-LABEL: v8i32:
; PWR10BE:       # %bb.0: # %entry
; PWR10BE-NEXT:    vmaxsw v2, v2, v3
; PWR10BE-NEXT:    li r3, 0
; PWR10BE-NEXT:    xxswapd v3, v2
; PWR10BE-NEXT:    vmaxsw v2, v2, v3
; PWR10BE-NEXT:    xxspltw v3, v2, 1
; PWR10BE-NEXT:    vmaxsw v2, v2, v3
; PWR10BE-NEXT:    vextuwlx r3, r3, v2
; PWR10BE-NEXT:    blr
entry:
  %0 = call i32 @llvm.vector.reduce.smax.v8i32(<8 x i32> %a)
  ret i32 %0
}

define dso_local i32 @v16i32(<16 x i32> %a) local_unnamed_addr #0 {
; PWR9LE-LABEL: v16i32:
; PWR9LE:       # %bb.0: # %entry
; PWR9LE-NEXT:    vmaxsw v3, v3, v5
; PWR9LE-NEXT:    vmaxsw v2, v2, v4
; PWR9LE-NEXT:    li r3, 0
; PWR9LE-NEXT:    vmaxsw v2, v2, v3
; PWR9LE-NEXT:    xxswapd v3, v2
; PWR9LE-NEXT:    vmaxsw v2, v2, v3
; PWR9LE-NEXT:    xxspltw v3, v2, 2
; PWR9LE-NEXT:    vmaxsw v2, v2, v3
; PWR9LE-NEXT:    vextuwrx r3, r3, v2
; PWR9LE-NEXT:    blr
;
; PWR9BE-LABEL: v16i32:
; PWR9BE:       # %bb.0: # %entry
; PWR9BE-NEXT:    vmaxsw v3, v3, v5
; PWR9BE-NEXT:    vmaxsw v2, v2, v4
; PWR9BE-NEXT:    li r3, 0
; PWR9BE-NEXT:    vmaxsw v2, v2, v3
; PWR9BE-NEXT:    xxswapd v3, v2
; PWR9BE-NEXT:    vmaxsw v2, v2, v3
; PWR9BE-NEXT:    xxspltw v3, v2, 1
; PWR9BE-NEXT:    vmaxsw v2, v2, v3
; PWR9BE-NEXT:    vextuwlx r3, r3, v2
; PWR9BE-NEXT:    blr
;
; PWR10LE-LABEL: v16i32:
; PWR10LE:       # %bb.0: # %entry
; PWR10LE-NEXT:    vmaxsw v3, v3, v5
; PWR10LE-NEXT:    vmaxsw v2, v2, v4
; PWR10LE-NEXT:    li r3, 0
; PWR10LE-NEXT:    vmaxsw v2, v2, v3
; PWR10LE-NEXT:    xxswapd v3, v2
; PWR10LE-NEXT:    vmaxsw v2, v2, v3
; PWR10LE-NEXT:    xxspltw v3, v2, 2
; PWR10LE-NEXT:    vmaxsw v2, v2, v3
; PWR10LE-NEXT:    vextuwrx r3, r3, v2
; PWR10LE-NEXT:    blr
;
; PWR10BE-LABEL: v16i32:
; PWR10BE:       # %bb.0: # %entry
; PWR10BE-NEXT:    vmaxsw v3, v3, v5
; PWR10BE-NEXT:    vmaxsw v2, v2, v4
; PWR10BE-NEXT:    li r3, 0
; PWR10BE-NEXT:    vmaxsw v2, v2, v3
; PWR10BE-NEXT:    xxswapd v3, v2
; PWR10BE-NEXT:    vmaxsw v2, v2, v3
; PWR10BE-NEXT:    xxspltw v3, v2, 1
; PWR10BE-NEXT:    vmaxsw v2, v2, v3
; PWR10BE-NEXT:    vextuwlx r3, r3, v2
; PWR10BE-NEXT:    blr
entry:
  %0 = call i32 @llvm.vector.reduce.smax.v16i32(<16 x i32> %a)
  ret i32 %0
}

declare i32 @llvm.vector.reduce.smax.v2i32(<2 x i32>) #0
declare i32 @llvm.vector.reduce.smax.v4i32(<4 x i32>) #0
declare i32 @llvm.vector.reduce.smax.v8i32(<8 x i32>) #0
declare i32 @llvm.vector.reduce.smax.v16i32(<16 x i32>) #0

;;
;; Vectors of type i64
;;
define dso_local i64 @v2i64(<2 x i64> %a) local_unnamed_addr #0 {
; PWR9LE-LABEL: v2i64:
; PWR9LE:       # %bb.0: # %entry
; PWR9LE-NEXT:    xxswapd v3, v2
; PWR9LE-NEXT:    vmaxsd v2, v2, v3
; PWR9LE-NEXT:    mfvsrld r3, v2
; PWR9LE-NEXT:    blr
;
; PWR9BE-LABEL: v2i64:
; PWR9BE:       # %bb.0: # %entry
; PWR9BE-NEXT:    xxswapd v3, v2
; PWR9BE-NEXT:    vmaxsd v2, v2, v3
; PWR9BE-NEXT:    mfvsrd r3, v2
; PWR9BE-NEXT:    blr
;
; PWR10LE-LABEL: v2i64:
; PWR10LE:       # %bb.0: # %entry
; PWR10LE-NEXT:    xxswapd v3, v2
; PWR10LE-NEXT:    vmaxsd v2, v2, v3
; PWR10LE-NEXT:    mfvsrld r3, v2
; PWR10LE-NEXT:    blr
;
; PWR10BE-LABEL: v2i64:
; PWR10BE:       # %bb.0: # %entry
; PWR10BE-NEXT:    xxswapd v3, v2
; PWR10BE-NEXT:    vmaxsd v2, v2, v3
; PWR10BE-NEXT:    mfvsrd r3, v2
; PWR10BE-NEXT:    blr
entry:
  %0 = call i64 @llvm.vector.reduce.smax.v2i64(<2 x i64> %a)
  ret i64 %0
}

define dso_local i64 @v4i64(<4 x i64> %a) local_unnamed_addr #0 {
; PWR9LE-LABEL: v4i64:
; PWR9LE:       # %bb.0: # %entry
; PWR9LE-NEXT:    vmaxsd v2, v2, v3
; PWR9LE-NEXT:    xxswapd v3, v2
; PWR9LE-NEXT:    vmaxsd v2, v2, v3
; PWR9LE-NEXT:    mfvsrld r3, v2
; PWR9LE-NEXT:    blr
;
; PWR9BE-LABEL: v4i64:
; PWR9BE:       # %bb.0: # %entry
; PWR9BE-NEXT:    vmaxsd v2, v2, v3
; PWR9BE-NEXT:    xxswapd v3, v2
; PWR9BE-NEXT:    vmaxsd v2, v2, v3
; PWR9BE-NEXT:    mfvsrd r3, v2
; PWR9BE-NEXT:    blr
;
; PWR10LE-LABEL: v4i64:
; PWR10LE:       # %bb.0: # %entry
; PWR10LE-NEXT:    vmaxsd v2, v2, v3
; PWR10LE-NEXT:    xxswapd v3, v2
; PWR10LE-NEXT:    vmaxsd v2, v2, v3
; PWR10LE-NEXT:    mfvsrld r3, v2
; PWR10LE-NEXT:    blr
;
; PWR10BE-LABEL: v4i64:
; PWR10BE:       # %bb.0: # %entry
; PWR10BE-NEXT:    vmaxsd v2, v2, v3
; PWR10BE-NEXT:    xxswapd v3, v2
; PWR10BE-NEXT:    vmaxsd v2, v2, v3
; PWR10BE-NEXT:    mfvsrd r3, v2
; PWR10BE-NEXT:    blr
entry:
  %0 = call i64 @llvm.vector.reduce.smax.v4i64(<4 x i64> %a)
  ret i64 %0
}

define dso_local i64 @v8i64(<8 x i64> %a) local_unnamed_addr #0 {
; PWR9LE-LABEL: v8i64:
; PWR9LE:       # %bb.0: # %entry
; PWR9LE-NEXT:    vmaxsd v2, v2, v4
; PWR9LE-NEXT:    vmaxsd v3, v3, v5
; PWR9LE-NEXT:    vmaxsd v2, v2, v3
; PWR9LE-NEXT:    xxswapd v3, v2
; PWR9LE-NEXT:    vmaxsd v2, v2, v3
; PWR9LE-NEXT:    mfvsrld r3, v2
; PWR9LE-NEXT:    blr
;
; PWR9BE-LABEL: v8i64:
; PWR9BE:       # %bb.0: # %entry
; PWR9BE-NEXT:    vmaxsd v2, v2, v4
; PWR9BE-NEXT:    vmaxsd v3, v3, v5
; PWR9BE-NEXT:    vmaxsd v2, v2, v3
; PWR9BE-NEXT:    xxswapd v3, v2
; PWR9BE-NEXT:    vmaxsd v2, v2, v3
; PWR9BE-NEXT:    mfvsrd r3, v2
; PWR9BE-NEXT:    blr
;
; PWR10LE-LABEL: v8i64:
; PWR10LE:       # %bb.0: # %entry
; PWR10LE-NEXT:    vmaxsd v2, v2, v4
; PWR10LE-NEXT:    vmaxsd v3, v3, v5
; PWR10LE-NEXT:    vmaxsd v2, v2, v3
; PWR10LE-NEXT:    xxswapd v3, v2
; PWR10LE-NEXT:    vmaxsd v2, v2, v3
; PWR10LE-NEXT:    mfvsrld r3, v2
; PWR10LE-NEXT:    blr
;
; PWR10BE-LABEL: v8i64:
; PWR10BE:       # %bb.0: # %entry
; PWR10BE-NEXT:    vmaxsd v2, v2, v4
; PWR10BE-NEXT:    vmaxsd v3, v3, v5
; PWR10BE-NEXT:    vmaxsd v2, v2, v3
; PWR10BE-NEXT:    xxswapd v3, v2
; PWR10BE-NEXT:    vmaxsd v2, v2, v3
; PWR10BE-NEXT:    mfvsrd r3, v2
; PWR10BE-NEXT:    blr
entry:
  %0 = call i64 @llvm.vector.reduce.smax.v8i64(<8 x i64> %a)
  ret i64 %0
}

define dso_local i64 @v16i64(<16 x i64> %a) local_unnamed_addr #0 {
; PWR9LE-LABEL: v16i64:
; PWR9LE:       # %bb.0: # %entry
; PWR9LE-NEXT:    vmaxsd v3, v3, v7
; PWR9LE-NEXT:    vmaxsd v5, v5, v9
; PWR9LE-NEXT:    vmaxsd v2, v2, v6
; PWR9LE-NEXT:    vmaxsd v4, v4, v8
; PWR9LE-NEXT:    vmaxsd v2, v2, v4
; PWR9LE-NEXT:    vmaxsd v3, v3, v5
; PWR9LE-NEXT:    vmaxsd v2, v2, v3
; PWR9LE-NEXT:    xxswapd v3, v2
; PWR9LE-NEXT:    vmaxsd v2, v2, v3
; PWR9LE-NEXT:    mfvsrld r3, v2
; PWR9LE-NEXT:    blr
;
; PWR9BE-LABEL: v16i64:
; PWR9BE:       # %bb.0: # %entry
; PWR9BE-NEXT:    vmaxsd v3, v3, v7
; PWR9BE-NEXT:    vmaxsd v5, v5, v9
; PWR9BE-NEXT:    vmaxsd v2, v2, v6
; PWR9BE-NEXT:    vmaxsd v4, v4, v8
; PWR9BE-NEXT:    vmaxsd v2, v2, v4
; PWR9BE-NEXT:    vmaxsd v3, v3, v5
; PWR9BE-NEXT:    vmaxsd v2, v2, v3
; PWR9BE-NEXT:    xxswapd v3, v2
; PWR9BE-NEXT:    vmaxsd v2, v2, v3
; PWR9BE-NEXT:    mfvsrd r3, v2
; PWR9BE-NEXT:    blr
;
; PWR10LE-LABEL: v16i64:
; PWR10LE:       # %bb.0: # %entry
; PWR10LE-NEXT:    vmaxsd v3, v3, v7
; PWR10LE-NEXT:    vmaxsd v5, v5, v9
; PWR10LE-NEXT:    vmaxsd v2, v2, v6
; PWR10LE-NEXT:    vmaxsd v4, v4, v8
; PWR10LE-NEXT:    vmaxsd v2, v2, v4
; PWR10LE-NEXT:    vmaxsd v3, v3, v5
; PWR10LE-NEXT:    vmaxsd v2, v2, v3
; PWR10LE-NEXT:    xxswapd v3, v2
; PWR10LE-NEXT:    vmaxsd v2, v2, v3
; PWR10LE-NEXT:    mfvsrld r3, v2
; PWR10LE-NEXT:    blr
;
; PWR10BE-LABEL: v16i64:
; PWR10BE:       # %bb.0: # %entry
; PWR10BE-NEXT:    vmaxsd v3, v3, v7
; PWR10BE-NEXT:    vmaxsd v5, v5, v9
; PWR10BE-NEXT:    vmaxsd v2, v2, v6
; PWR10BE-NEXT:    vmaxsd v4, v4, v8
; PWR10BE-NEXT:    vmaxsd v2, v2, v4
; PWR10BE-NEXT:    vmaxsd v3, v3, v5
; PWR10BE-NEXT:    vmaxsd v2, v2, v3
; PWR10BE-NEXT:    xxswapd v3, v2
; PWR10BE-NEXT:    vmaxsd v2, v2, v3
; PWR10BE-NEXT:    mfvsrd r3, v2
; PWR10BE-NEXT:    blr
entry:
  %0 = call i64 @llvm.vector.reduce.smax.v16i64(<16 x i64> %a)
  ret i64 %0
}

declare i64 @llvm.vector.reduce.smax.v2i64(<2 x i64>) #0
declare i64 @llvm.vector.reduce.smax.v4i64(<4 x i64>) #0
declare i64 @llvm.vector.reduce.smax.v8i64(<8 x i64>) #0
declare i64 @llvm.vector.reduce.smax.v16i64(<16 x i64>) #0


attributes #0 = { nounwind }
