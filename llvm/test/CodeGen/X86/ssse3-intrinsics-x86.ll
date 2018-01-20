; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=i386-apple-darwin -mattr=-avx,+ssse3 -show-mc-encoding | FileCheck %s --check-prefix=SSE
; RUN: llc < %s -mtriple=i386-apple-darwin -mattr=+avx2 -show-mc-encoding | FileCheck %s --check-prefix=VCHECK --check-prefix=AVX2
; RUN: llc < %s -mtriple=i386-apple-darwin -mcpu=skx -show-mc-encoding | FileCheck %s --check-prefix=VCHECK --check-prefix=SKX

define <16 x i8> @test_x86_ssse3_pabs_b_128(<16 x i8> %a0) {
; SSE-LABEL: test_x86_ssse3_pabs_b_128:
; SSE:       ## BB#0:
; SSE-NEXT:    pabsb %xmm0, %xmm0 ## encoding: [0x66,0x0f,0x38,0x1c,0xc0]
; SSE-NEXT:    retl ## encoding: [0xc3]
;
; AVX2-LABEL: test_x86_ssse3_pabs_b_128:
; AVX2:       ## BB#0:
; AVX2-NEXT:    vpabsb %xmm0, %xmm0 ## encoding: [0xc4,0xe2,0x79,0x1c,0xc0]
; AVX2-NEXT:    retl ## encoding: [0xc3]
;
; SKX-LABEL: test_x86_ssse3_pabs_b_128:
; SKX:       ## BB#0:
; SKX-NEXT:    vpabsb %xmm0, %xmm0 ## EVEX TO VEX Compression encoding: [0xc4,0xe2,0x79,0x1c,0xc0]
; SKX-NEXT:    retl ## encoding: [0xc3]
  %res = call <16 x i8> @llvm.x86.ssse3.pabs.b.128(<16 x i8> %a0) ; <<16 x i8>> [#uses=1]
  ret <16 x i8> %res
}
declare <16 x i8> @llvm.x86.ssse3.pabs.b.128(<16 x i8>) nounwind readnone


define <4 x i32> @test_x86_ssse3_pabs_d_128(<4 x i32> %a0) {
; SSE-LABEL: test_x86_ssse3_pabs_d_128:
; SSE:       ## BB#0:
; SSE-NEXT:    pabsd %xmm0, %xmm0 ## encoding: [0x66,0x0f,0x38,0x1e,0xc0]
; SSE-NEXT:    retl ## encoding: [0xc3]
;
; AVX2-LABEL: test_x86_ssse3_pabs_d_128:
; AVX2:       ## BB#0:
; AVX2-NEXT:    vpabsd %xmm0, %xmm0 ## encoding: [0xc4,0xe2,0x79,0x1e,0xc0]
; AVX2-NEXT:    retl ## encoding: [0xc3]
;
; SKX-LABEL: test_x86_ssse3_pabs_d_128:
; SKX:       ## BB#0:
; SKX-NEXT:    vpabsd %xmm0, %xmm0 ## EVEX TO VEX Compression encoding: [0xc4,0xe2,0x79,0x1e,0xc0]
; SKX-NEXT:    retl ## encoding: [0xc3]
  %res = call <4 x i32> @llvm.x86.ssse3.pabs.d.128(<4 x i32> %a0) ; <<4 x i32>> [#uses=1]
  ret <4 x i32> %res
}
declare <4 x i32> @llvm.x86.ssse3.pabs.d.128(<4 x i32>) nounwind readnone


define <8 x i16> @test_x86_ssse3_pabs_w_128(<8 x i16> %a0) {
; SSE-LABEL: test_x86_ssse3_pabs_w_128:
; SSE:       ## BB#0:
; SSE-NEXT:    pabsw %xmm0, %xmm0 ## encoding: [0x66,0x0f,0x38,0x1d,0xc0]
; SSE-NEXT:    retl ## encoding: [0xc3]
;
; AVX2-LABEL: test_x86_ssse3_pabs_w_128:
; AVX2:       ## BB#0:
; AVX2-NEXT:    vpabsw %xmm0, %xmm0 ## encoding: [0xc4,0xe2,0x79,0x1d,0xc0]
; AVX2-NEXT:    retl ## encoding: [0xc3]
;
; SKX-LABEL: test_x86_ssse3_pabs_w_128:
; SKX:       ## BB#0:
; SKX-NEXT:    vpabsw %xmm0, %xmm0 ## EVEX TO VEX Compression encoding: [0xc4,0xe2,0x79,0x1d,0xc0]
; SKX-NEXT:    retl ## encoding: [0xc3]
  %res = call <8 x i16> @llvm.x86.ssse3.pabs.w.128(<8 x i16> %a0) ; <<8 x i16>> [#uses=1]
  ret <8 x i16> %res
}
declare <8 x i16> @llvm.x86.ssse3.pabs.w.128(<8 x i16>) nounwind readnone


define <4 x i32> @test_x86_ssse3_phadd_d_128(<4 x i32> %a0, <4 x i32> %a1) {
; SSE-LABEL: test_x86_ssse3_phadd_d_128:
; SSE:       ## BB#0:
; SSE-NEXT:    phaddd %xmm1, %xmm0 ## encoding: [0x66,0x0f,0x38,0x02,0xc1]
; SSE-NEXT:    retl ## encoding: [0xc3]
;
; VCHECK-LABEL: test_x86_ssse3_phadd_d_128:
; VCHECK:       ## BB#0:
; VCHECK-NEXT:    vphaddd %xmm1, %xmm0, %xmm0 ## encoding: [0xc4,0xe2,0x79,0x02,0xc1]
; VCHECK-NEXT:    retl ## encoding: [0xc3]
  %res = call <4 x i32> @llvm.x86.ssse3.phadd.d.128(<4 x i32> %a0, <4 x i32> %a1) ; <<4 x i32>> [#uses=1]
  ret <4 x i32> %res
}
declare <4 x i32> @llvm.x86.ssse3.phadd.d.128(<4 x i32>, <4 x i32>) nounwind readnone


define <8 x i16> @test_x86_ssse3_phadd_sw_128(<8 x i16> %a0, <8 x i16> %a1) {
; SSE-LABEL: test_x86_ssse3_phadd_sw_128:
; SSE:       ## BB#0:
; SSE-NEXT:    phaddsw %xmm1, %xmm0 ## encoding: [0x66,0x0f,0x38,0x03,0xc1]
; SSE-NEXT:    retl ## encoding: [0xc3]
;
; VCHECK-LABEL: test_x86_ssse3_phadd_sw_128:
; VCHECK:       ## BB#0:
; VCHECK-NEXT:    vphaddsw %xmm1, %xmm0, %xmm0 ## encoding: [0xc4,0xe2,0x79,0x03,0xc1]
; VCHECK-NEXT:    retl ## encoding: [0xc3]
  %res = call <8 x i16> @llvm.x86.ssse3.phadd.sw.128(<8 x i16> %a0, <8 x i16> %a1) ; <<8 x i16>> [#uses=1]
  ret <8 x i16> %res
}
declare <8 x i16> @llvm.x86.ssse3.phadd.sw.128(<8 x i16>, <8 x i16>) nounwind readnone


define <8 x i16> @test_x86_ssse3_phadd_w_128(<8 x i16> %a0, <8 x i16> %a1) {
; SSE-LABEL: test_x86_ssse3_phadd_w_128:
; SSE:       ## BB#0:
; SSE-NEXT:    phaddw %xmm1, %xmm0 ## encoding: [0x66,0x0f,0x38,0x01,0xc1]
; SSE-NEXT:    retl ## encoding: [0xc3]
;
; VCHECK-LABEL: test_x86_ssse3_phadd_w_128:
; VCHECK:       ## BB#0:
; VCHECK-NEXT:    vphaddw %xmm1, %xmm0, %xmm0 ## encoding: [0xc4,0xe2,0x79,0x01,0xc1]
; VCHECK-NEXT:    retl ## encoding: [0xc3]
  %res = call <8 x i16> @llvm.x86.ssse3.phadd.w.128(<8 x i16> %a0, <8 x i16> %a1) ; <<8 x i16>> [#uses=1]
  ret <8 x i16> %res
}
declare <8 x i16> @llvm.x86.ssse3.phadd.w.128(<8 x i16>, <8 x i16>) nounwind readnone


define <4 x i32> @test_x86_ssse3_phsub_d_128(<4 x i32> %a0, <4 x i32> %a1) {
; SSE-LABEL: test_x86_ssse3_phsub_d_128:
; SSE:       ## BB#0:
; SSE-NEXT:    phsubd %xmm1, %xmm0 ## encoding: [0x66,0x0f,0x38,0x06,0xc1]
; SSE-NEXT:    retl ## encoding: [0xc3]
;
; VCHECK-LABEL: test_x86_ssse3_phsub_d_128:
; VCHECK:       ## BB#0:
; VCHECK-NEXT:    vphsubd %xmm1, %xmm0, %xmm0 ## encoding: [0xc4,0xe2,0x79,0x06,0xc1]
; VCHECK-NEXT:    retl ## encoding: [0xc3]
  %res = call <4 x i32> @llvm.x86.ssse3.phsub.d.128(<4 x i32> %a0, <4 x i32> %a1) ; <<4 x i32>> [#uses=1]
  ret <4 x i32> %res
}
declare <4 x i32> @llvm.x86.ssse3.phsub.d.128(<4 x i32>, <4 x i32>) nounwind readnone


define <8 x i16> @test_x86_ssse3_phsub_sw_128(<8 x i16> %a0, <8 x i16> %a1) {
; SSE-LABEL: test_x86_ssse3_phsub_sw_128:
; SSE:       ## BB#0:
; SSE-NEXT:    phsubsw %xmm1, %xmm0 ## encoding: [0x66,0x0f,0x38,0x07,0xc1]
; SSE-NEXT:    retl ## encoding: [0xc3]
;
; VCHECK-LABEL: test_x86_ssse3_phsub_sw_128:
; VCHECK:       ## BB#0:
; VCHECK-NEXT:    vphsubsw %xmm1, %xmm0, %xmm0 ## encoding: [0xc4,0xe2,0x79,0x07,0xc1]
; VCHECK-NEXT:    retl ## encoding: [0xc3]
  %res = call <8 x i16> @llvm.x86.ssse3.phsub.sw.128(<8 x i16> %a0, <8 x i16> %a1) ; <<8 x i16>> [#uses=1]
  ret <8 x i16> %res
}
declare <8 x i16> @llvm.x86.ssse3.phsub.sw.128(<8 x i16>, <8 x i16>) nounwind readnone


define <8 x i16> @test_x86_ssse3_phsub_w_128(<8 x i16> %a0, <8 x i16> %a1) {
; SSE-LABEL: test_x86_ssse3_phsub_w_128:
; SSE:       ## BB#0:
; SSE-NEXT:    phsubw %xmm1, %xmm0 ## encoding: [0x66,0x0f,0x38,0x05,0xc1]
; SSE-NEXT:    retl ## encoding: [0xc3]
;
; VCHECK-LABEL: test_x86_ssse3_phsub_w_128:
; VCHECK:       ## BB#0:
; VCHECK-NEXT:    vphsubw %xmm1, %xmm0, %xmm0 ## encoding: [0xc4,0xe2,0x79,0x05,0xc1]
; VCHECK-NEXT:    retl ## encoding: [0xc3]
  %res = call <8 x i16> @llvm.x86.ssse3.phsub.w.128(<8 x i16> %a0, <8 x i16> %a1) ; <<8 x i16>> [#uses=1]
  ret <8 x i16> %res
}
declare <8 x i16> @llvm.x86.ssse3.phsub.w.128(<8 x i16>, <8 x i16>) nounwind readnone


define <8 x i16> @test_x86_ssse3_pmadd_ub_sw_128(<16 x i8> %a0, <16 x i8> %a1) {
; SSE-LABEL: test_x86_ssse3_pmadd_ub_sw_128:
; SSE:       ## BB#0:
; SSE-NEXT:    pmaddubsw %xmm1, %xmm0 ## encoding: [0x66,0x0f,0x38,0x04,0xc1]
; SSE-NEXT:    retl ## encoding: [0xc3]
;
; AVX2-LABEL: test_x86_ssse3_pmadd_ub_sw_128:
; AVX2:       ## BB#0:
; AVX2-NEXT:    vpmaddubsw %xmm1, %xmm0, %xmm0 ## encoding: [0xc4,0xe2,0x79,0x04,0xc1]
; AVX2-NEXT:    retl ## encoding: [0xc3]
;
; SKX-LABEL: test_x86_ssse3_pmadd_ub_sw_128:
; SKX:       ## BB#0:
; SKX-NEXT:    vpmaddubsw %xmm1, %xmm0, %xmm0 ## EVEX TO VEX Compression encoding: [0xc4,0xe2,0x79,0x04,0xc1]
; SKX-NEXT:    retl ## encoding: [0xc3]
  %res = call <8 x i16> @llvm.x86.ssse3.pmadd.ub.sw.128(<16 x i8> %a0, <16 x i8> %a1) ; <<8 x i16>> [#uses=1]
  ret <8 x i16> %res
}
declare <8 x i16> @llvm.x86.ssse3.pmadd.ub.sw.128(<16 x i8>, <16 x i8>) nounwind readnone


; Make sure we don't commute this operation.
define <8 x i16> @test_x86_ssse3_pmadd_ub_sw_128_load_op0(<16 x i8>* %ptr, <16 x i8> %a1) {
; SSE-LABEL: test_x86_ssse3_pmadd_ub_sw_128_load_op0:
; SSE:       ## BB#0:
; SSE-NEXT:    movl {{[0-9]+}}(%esp), %eax ## encoding: [0x8b,0x44,0x24,0x04]
; SSE-NEXT:    movdqa (%eax), %xmm1 ## encoding: [0x66,0x0f,0x6f,0x08]
; SSE-NEXT:    pmaddubsw %xmm0, %xmm1 ## encoding: [0x66,0x0f,0x38,0x04,0xc8]
; SSE-NEXT:    movdqa %xmm1, %xmm0 ## encoding: [0x66,0x0f,0x6f,0xc1]
; SSE-NEXT:    retl ## encoding: [0xc3]
;
; AVX2-LABEL: test_x86_ssse3_pmadd_ub_sw_128_load_op0:
; AVX2:       ## BB#0:
; AVX2-NEXT:    movl {{[0-9]+}}(%esp), %eax ## encoding: [0x8b,0x44,0x24,0x04]
; AVX2-NEXT:    vmovdqa (%eax), %xmm1 ## encoding: [0xc5,0xf9,0x6f,0x08]
; AVX2-NEXT:    vpmaddubsw %xmm0, %xmm1, %xmm0 ## encoding: [0xc4,0xe2,0x71,0x04,0xc0]
; AVX2-NEXT:    retl ## encoding: [0xc3]
;
; SKX-LABEL: test_x86_ssse3_pmadd_ub_sw_128_load_op0:
; SKX:       ## BB#0:
; SKX-NEXT:    movl {{[0-9]+}}(%esp), %eax ## encoding: [0x8b,0x44,0x24,0x04]
; SKX-NEXT:    vmovdqa (%eax), %xmm1 ## EVEX TO VEX Compression encoding: [0xc5,0xf9,0x6f,0x08]
; SKX-NEXT:    vpmaddubsw %xmm0, %xmm1, %xmm0 ## EVEX TO VEX Compression encoding: [0xc4,0xe2,0x71,0x04,0xc0]
; SKX-NEXT:    retl ## encoding: [0xc3]
  %a0 = load <16 x i8>, <16 x i8>* %ptr
  %res = call <8 x i16> @llvm.x86.ssse3.pmadd.ub.sw.128(<16 x i8> %a0, <16 x i8> %a1) ; <<8 x i16>> [#uses=1]
  ret <8 x i16> %res
}


define <8 x i16> @test_x86_ssse3_pmul_hr_sw_128(<8 x i16> %a0, <8 x i16> %a1) {
; SSE-LABEL: test_x86_ssse3_pmul_hr_sw_128:
; SSE:       ## BB#0:
; SSE-NEXT:    pmulhrsw %xmm1, %xmm0 ## encoding: [0x66,0x0f,0x38,0x0b,0xc1]
; SSE-NEXT:    retl ## encoding: [0xc3]
;
; AVX2-LABEL: test_x86_ssse3_pmul_hr_sw_128:
; AVX2:       ## BB#0:
; AVX2-NEXT:    vpmulhrsw %xmm1, %xmm0, %xmm0 ## encoding: [0xc4,0xe2,0x79,0x0b,0xc1]
; AVX2-NEXT:    retl ## encoding: [0xc3]
;
; SKX-LABEL: test_x86_ssse3_pmul_hr_sw_128:
; SKX:       ## BB#0:
; SKX-NEXT:    vpmulhrsw %xmm1, %xmm0, %xmm0 ## EVEX TO VEX Compression encoding: [0xc4,0xe2,0x79,0x0b,0xc1]
; SKX-NEXT:    retl ## encoding: [0xc3]
  %res = call <8 x i16> @llvm.x86.ssse3.pmul.hr.sw.128(<8 x i16> %a0, <8 x i16> %a1) ; <<8 x i16>> [#uses=1]
  ret <8 x i16> %res
}
declare <8 x i16> @llvm.x86.ssse3.pmul.hr.sw.128(<8 x i16>, <8 x i16>) nounwind readnone


define <16 x i8> @test_x86_ssse3_pshuf_b_128(<16 x i8> %a0, <16 x i8> %a1) {
; SSE-LABEL: test_x86_ssse3_pshuf_b_128:
; SSE:       ## BB#0:
; SSE-NEXT:    pshufb %xmm1, %xmm0 ## encoding: [0x66,0x0f,0x38,0x00,0xc1]
; SSE-NEXT:    retl ## encoding: [0xc3]
;
; AVX2-LABEL: test_x86_ssse3_pshuf_b_128:
; AVX2:       ## BB#0:
; AVX2-NEXT:    vpshufb %xmm1, %xmm0, %xmm0 ## encoding: [0xc4,0xe2,0x79,0x00,0xc1]
; AVX2-NEXT:    retl ## encoding: [0xc3]
;
; SKX-LABEL: test_x86_ssse3_pshuf_b_128:
; SKX:       ## BB#0:
; SKX-NEXT:    vpshufb %xmm1, %xmm0, %xmm0 ## EVEX TO VEX Compression encoding: [0xc4,0xe2,0x79,0x00,0xc1]
; SKX-NEXT:    retl ## encoding: [0xc3]
  %res = call <16 x i8> @llvm.x86.ssse3.pshuf.b.128(<16 x i8> %a0, <16 x i8> %a1) ; <<16 x i8>> [#uses=1]
  ret <16 x i8> %res
}
declare <16 x i8> @llvm.x86.ssse3.pshuf.b.128(<16 x i8>, <16 x i8>) nounwind readnone


define <16 x i8> @test_x86_ssse3_psign_b_128(<16 x i8> %a0, <16 x i8> %a1) {
; SSE-LABEL: test_x86_ssse3_psign_b_128:
; SSE:       ## BB#0:
; SSE-NEXT:    psignb %xmm1, %xmm0 ## encoding: [0x66,0x0f,0x38,0x08,0xc1]
; SSE-NEXT:    retl ## encoding: [0xc3]
;
; VCHECK-LABEL: test_x86_ssse3_psign_b_128:
; VCHECK:       ## BB#0:
; VCHECK-NEXT:    vpsignb %xmm1, %xmm0, %xmm0 ## encoding: [0xc4,0xe2,0x79,0x08,0xc1]
; VCHECK-NEXT:    retl ## encoding: [0xc3]
  %res = call <16 x i8> @llvm.x86.ssse3.psign.b.128(<16 x i8> %a0, <16 x i8> %a1) ; <<16 x i8>> [#uses=1]
  ret <16 x i8> %res
}
declare <16 x i8> @llvm.x86.ssse3.psign.b.128(<16 x i8>, <16 x i8>) nounwind readnone


define <4 x i32> @test_x86_ssse3_psign_d_128(<4 x i32> %a0, <4 x i32> %a1) {
; SSE-LABEL: test_x86_ssse3_psign_d_128:
; SSE:       ## BB#0:
; SSE-NEXT:    psignd %xmm1, %xmm0 ## encoding: [0x66,0x0f,0x38,0x0a,0xc1]
; SSE-NEXT:    retl ## encoding: [0xc3]
;
; VCHECK-LABEL: test_x86_ssse3_psign_d_128:
; VCHECK:       ## BB#0:
; VCHECK-NEXT:    vpsignd %xmm1, %xmm0, %xmm0 ## encoding: [0xc4,0xe2,0x79,0x0a,0xc1]
; VCHECK-NEXT:    retl ## encoding: [0xc3]
  %res = call <4 x i32> @llvm.x86.ssse3.psign.d.128(<4 x i32> %a0, <4 x i32> %a1) ; <<4 x i32>> [#uses=1]
  ret <4 x i32> %res
}
declare <4 x i32> @llvm.x86.ssse3.psign.d.128(<4 x i32>, <4 x i32>) nounwind readnone


define <8 x i16> @test_x86_ssse3_psign_w_128(<8 x i16> %a0, <8 x i16> %a1) {
; SSE-LABEL: test_x86_ssse3_psign_w_128:
; SSE:       ## BB#0:
; SSE-NEXT:    psignw %xmm1, %xmm0 ## encoding: [0x66,0x0f,0x38,0x09,0xc1]
; SSE-NEXT:    retl ## encoding: [0xc3]
;
; VCHECK-LABEL: test_x86_ssse3_psign_w_128:
; VCHECK:       ## BB#0:
; VCHECK-NEXT:    vpsignw %xmm1, %xmm0, %xmm0 ## encoding: [0xc4,0xe2,0x79,0x09,0xc1]
; VCHECK-NEXT:    retl ## encoding: [0xc3]
  %res = call <8 x i16> @llvm.x86.ssse3.psign.w.128(<8 x i16> %a0, <8 x i16> %a1) ; <<8 x i16>> [#uses=1]
  ret <8 x i16> %res
}
declare <8 x i16> @llvm.x86.ssse3.psign.w.128(<8 x i16>, <8 x i16>) nounwind readnone
