; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=i686-unknown-unknown | FileCheck %s --check-prefix=X86
; RUN: llc < %s -mtriple=x86_64-unknown-unknown | FileCheck %s --check-prefix=X64

%0 = type { i32, i32, i32, i32 }
%1 = type { i1, i1, i1, i32 }

define fastcc %0 @ReturnBigStruct() nounwind readnone {
; X86-LABEL: ReturnBigStruct:
; X86:       # BB#0: # %entry
; X86-NEXT:    movl $24601, 12(%ecx) # imm = 0x6019
; X86-NEXT:    movl $48, 8(%ecx)
; X86-NEXT:    movl $24, 4(%ecx)
; X86-NEXT:    movl $12, (%ecx)
; X86-NEXT:    movl %ecx, %eax
; X86-NEXT:    retl
;
; X64-LABEL: ReturnBigStruct:
; X64:       # BB#0: # %entry
; X64-NEXT:    movabsq $105660490448944, %rax # imm = 0x601900000030
; X64-NEXT:    movq %rax, 8(%rdi)
; X64-NEXT:    movabsq $103079215116, %rax # imm = 0x180000000C
; X64-NEXT:    movq %rax, (%rdi)
; X64-NEXT:    movq %rdi, %rax
; X64-NEXT:    retq
entry:
  %0 = insertvalue %0 zeroinitializer, i32 12, 0
  %1 = insertvalue %0 %0, i32 24, 1
  %2 = insertvalue %0 %1, i32 48, 2
  %3 = insertvalue %0 %2, i32 24601, 3
  ret %0 %3
}


define fastcc %1 @ReturnBigStruct2() nounwind readnone {
; X86-LABEL: ReturnBigStruct2:
; X86:       # BB#0: # %entry
; X86-NEXT:    movl $48, 4(%ecx)
; X86-NEXT:    movb $1, 2(%ecx)
; X86-NEXT:    movw $256, (%ecx) # imm = 0x100
; X86-NEXT:    movl %ecx, %eax
; X86-NEXT:    retl
;
; X64-LABEL: ReturnBigStruct2:
; X64:       # BB#0: # %entry
; X64-NEXT:    movl $48, 4(%rdi)
; X64-NEXT:    movb $1, 2(%rdi)
; X64-NEXT:    movw $256, (%rdi) # imm = 0x100
; X64-NEXT:    movq %rdi, %rax
; X64-NEXT:    retq
entry:
  %0 = insertvalue %1 zeroinitializer, i1 false, 0
  %1 = insertvalue %1 %0, i1 true, 1
  %2 = insertvalue %1 %1, i1 true, 2
  %3 = insertvalue %1 %2, i32 48, 3
  ret %1 %3
}
