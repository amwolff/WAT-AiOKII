; ns = 15
; np = 59
;
; g = 4
; A[i] = i/np+66*89-25+ns+25+i+(ns/g)
; n = 119
;
; g = 4
; B[i] = A[i+5] + A[i+0] - A[i+4] / A[i+2]
; m = n-6
.data
	tabA:   .space 4*119
	tabB:   .space 4*113

.text

	addi    r1, r0, 4
loopA:
	addf    f4, f0, f0

	movi2fp f1, r2
	cvti2f  f1, f1

	addi    r3, r0, 59
	movi2fp f2, r3
	cvti2f  f2, f2

	divf    f4, f1, f2

	addi    r4, r0, 66
	movi2fp f3, r4
	cvti2f  f3, f3
	addi    r5, r0, 89
	movi2fp f5, r5
	cvti2f  f5, f5

	multf   f6, f3, f5

	addf    f4, f4, f6

	addi    r6, r0, 25
	movi2fp f7, r6
	cvti2f  f7, f7

	subf    f4, f4, f7

	addi    r7, r0, 15
	movi2fp f8, r7
	cvti2f  f8, f8

	addf    f4, f4, f8

	addf    f4, f4, f7

	addf    f4, f4, f1

	addi    r8, r0, 4
	movi2fp f9, r8
	cvti2f  f9, f9

	divf    f10, f8, f9

	addf    f4, f4, f10

	mult    r9, r2, r1
	sf      tabA(r9), f4

	seqi    r10, r2, 118
	addi    r2, r2, 1
	beqz    r10, loopA

loopB:
	addf    f11, f0, f0

	addi    r12, r11, 5
	mult    r13, r12, r1
	lf      f12, tabA(r13)

	movf    f11, f12

	mult    r14, r11, r1
	lf      f13, tabA(r14)

	addf    f11, f11, f13

	addi    r15, r11, 4
	mult    r16, r15, r1
	lf      f14, tabA(r16)
	addi    r17, r11, 2
	mult    r18, r17, r1
	lf      f15, tabA(r18)

	divf    f16, f14, f15

	subf    f11, f11, f16

	mult    r19, r11, r1
	sf      tabB(r19), f11

	seqi    r20, r11, 112
	addi    r11, r11, 1
	beqz    r20, loopB

	trap    0