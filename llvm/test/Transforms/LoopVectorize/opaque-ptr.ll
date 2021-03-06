; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -S -loop-vectorize -force-vector-width=2 -opaque-pointers < %s | FileCheck %s

; TODO: This still crashes with inbounds on the GEPs.
define void @test(ptr %p1.start, ptr %p2.start, ptr %p1.end) {
; CHECK-LABEL: @test(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    br label [[LOOP:%.*]]
; CHECK:       loop:
; CHECK-NEXT:    [[P1:%.*]] = phi ptr [ [[P1_START:%.*]], [[ENTRY:%.*]] ], [ [[P1_NEXT:%.*]], [[LOOP]] ]
; CHECK-NEXT:    [[P2:%.*]] = phi ptr [ [[P2_START:%.*]], [[ENTRY]] ], [ [[P2_NEXT:%.*]], [[LOOP]] ]
; CHECK-NEXT:    [[P1_VAL:%.*]] = load float, ptr [[P1]], align 4
; CHECK-NEXT:    [[P2_VAL:%.*]] = load float, ptr [[P2]], align 4
; CHECK-NEXT:    [[SUM:%.*]] = fadd float [[P1_VAL]], [[P2_VAL]]
; CHECK-NEXT:    store float [[SUM]], ptr [[P1]], align 4
; CHECK-NEXT:    [[P1_NEXT]] = getelementptr float, ptr [[P1]], i64 1
; CHECK-NEXT:    [[P2_NEXT]] = getelementptr float, ptr [[P2]], i64 1
; CHECK-NEXT:    [[C:%.*]] = icmp ne ptr [[P1_NEXT]], [[P1_END:%.*]]
; CHECK-NEXT:    br i1 [[C]], label [[LOOP]], label [[EXIT:%.*]]
; CHECK:       exit:
; CHECK-NEXT:    ret void
;
entry:
  br label %loop

loop:
  %p1 = phi ptr [ %p1.start, %entry ], [ %p1.next, %loop ]
  %p2 = phi ptr [ %p2.start, %entry ], [ %p2.next, %loop ]
  %p1.val = load float, ptr %p1
  %p2.val = load float, ptr %p2
  %sum = fadd float %p1.val, %p2.val
  store float %sum, ptr %p1
  %p1.next = getelementptr float, ptr %p1, i64 1
  %p2.next = getelementptr float, ptr %p2, i64 1
  %c = icmp ne ptr %p1.next, %p1.end
  br i1 %c, label %loop, label %exit

exit:
  ret void
}
