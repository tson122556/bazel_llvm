; This testcase ensures that CFL AA handles escaped values no more conservative than it should

; RUN: opt < %s -aa-pipeline=cfl-steens-aa -passes=aa-eval -print-all-alias-modref-info -disable-output 2>&1 | FileCheck %s

; CHECK-LABEL: Function: test_local
; CHECK: NoAlias: i32* %a, i32* %b
; CHECK: MayAlias: i32* %a, i32* %aAlias
; CHECK: NoAlias: i32* %aAlias, i32* %b
define void @test_local() {
	%a = alloca i32, align 4
	%b = alloca i32, align 4
	%aint = ptrtoint i32* %a to i64
	%aAlias = inttoptr i64 %aint to i32*
	ret void
}

; CHECK-LABEL: Function: test_global_param
; CHECK: NoAlias: i32* %a, i32** %x
; CHECK: MayAlias: i32* %a, i32* %xload
; CHECK: MayAlias: i32* %a, i32* %gload
; CHECK: MayAlias: i32* %gload, i32* %xload
; CHECK: MayAlias: i32** %x, i32** @ext_global
; CHECK: NoAlias: i32* %a, i32** @ext_global
@ext_global = external global i32*
define void @test_global_param(i32** %x) {
	%a = alloca i32, align 4
	%aint = ptrtoint i32* %a to i64
	%xload = load i32*, i32** %x
	%gload = load i32*, i32** @ext_global
	ret void
}

declare void @external_func(i32**)
; CHECK-LABEL: Function: test_external_call
; CHECK: NoAlias: i32* %b, i32* %x
; CHECK: NoAlias: i32* %b, i32** %a
; CHECK: MayAlias: i32* %c, i32* %x
; CHECK: MayAlias: i32* %c, i32** %a
; CHECK: NoAlias: i32* %b, i32* %c
define void @test_external_call(i32* %x) {
	%a = alloca i32*, align 8
	%b = alloca i32, align 4
	call void @external_func(i32** %a)
	%c = load i32*, i32** %a
	ret void
}

declare void @external_func_readonly(i32**) readonly
; CHECK-LABEL: Function: test_external_call_func_readonly
; CHECK: MayAlias: i32* %c, i32* %x
; CHECK: NoAlias: i32* %c, i32** %a
define void @test_external_call_func_readonly(i32* %x) {
	%a = alloca i32*, align 8
	%b = alloca i32, align 4
	store i32* %x, i32** %a, align 4
	call void @external_func_readonly(i32** %a)
	%c = load i32*, i32** %a
	ret void
}

; CHECK-LABEL: Function: test_external_call_callsite_readonly
; CHECK: MayAlias: i32* %c, i32* %x
; CHECK: NoAlias: i32* %c, i32** %a
define void @test_external_call_callsite_readonly(i32* %x) {
	%a = alloca i32*, align 8
	%b = alloca i32, align 4
	store i32* %x, i32** %a, align 4
	call void @external_func(i32** %a) readonly
	%c = load i32*, i32** %a
	ret void
}

declare i32* @external_func_normal_return(i32*)
; CHECK-LABEL: Function: test_external_call_normal_return
; CHECK: MayAlias: i32* %c, i32* %x
; CHECK: MayAlias: i32* %a, i32* %c
define void @test_external_call_normal_return(i32* %x) {
	%a = alloca i32, align 8
	%b = alloca i32, align 4
	%c = call i32* @external_func_normal_return(i32* %a)
	ret void
}

declare noalias i32* @external_func_noalias_return(i32*)
; CHECK-LABEL: Function: test_external_call_noalias_return
; CHECK: NoAlias: i32* %c, i32* %x
; CHECK: NoAlias: i32* %a, i32* %c
define void @test_external_call_noalias_return(i32* %x) {
	%a = alloca i32, align 8
	%b = alloca i32, align 4
	%c = call i32* @external_func_noalias_return(i32* %a)
	ret void
}
