; g = 0
; A[i] = (53-84-(i/3/(g+97)+78*12*(14-i)))
; n = 92
;
; g = 0
; B[i] = A[i+2] + A[i+0] * A[i+5] - A[i+4]
; m= n-8

.data
	tabA:   .space 8*92
	tabB:   .space 8*86

.text
	addi    r1, r0, 8

loopA:
	addd    f2, f0, f0

	addi    r3, r0, 53
	movi2fp f2, r3
	cvti2d  f2, f2

	addi    r4, r0, 84
	movi2fp f4, r4
	cvti2d  f4, f4

	; A[i] = 53 - 84
	subd    f2, f2, f4

	; teraz trochę magii
	movi2fp f4, r2
	cvti2d  f4, f4

	addi    r5, r0, 3
	movi2fp f6, r5
	cvti2d  f6, f6

	divd    f4, f4, f6

	addi    r6, r0, 97
	movi2fp f6, r6
	cvti2d  f6, f6

	divd    f4, f4, f6

	addi    r7, r0, 78
	movi2fp f6, r7
	cvti2d  f6, f6

	addi    r8, r0, 12
	movi2fp f8,     r8
	cvti2d  f8, f8

	addi    r9, r0, 14
	movi2fp f10, r9
	cvti2d  f10, f10

	movi2fp f12, r2
	cvti2d  f12, f12

	subd    f10, f10, f12

	multd   f6, f6, f8

	multd   f6, f6, f10

	addd    f4, f4, f10

	; 53-84-(i/3/(g+97)+78*12*(14-i))
	subd    f2, f2, f4

	mult    r10, r2, r1
	sd              tabA(r10), f2

	seqi    r11, r2, 92
	addi    r2, r2, 1
	beqz    r11, loopA

loopB:
	addd    f2, f0, f0

	addi    r13, r12, 2
	mult    r14, r13, r1
	ld              f4, tabA(r14)
	movf    f2, f4

	mult    r15, r12, r1
	ld              f4, tabA(r15)

	addi    r16, r12, 5
	mult    r17, r16, r1
	ld              f6, tabA(r17)

	multd   f4, f4, f6

	addd    f2, f2, f4

	addi    r18, r12, 4
	mult    r19, r18, r1
	ld              f4, tabA(r19)
	subd    f2, f2, f4

	mult    r20, r12, r1
	sd              tabB(r20), f2

	seqi    r21, r12, 86
	addi    r12, r12, 1
	beqz    r21, loopB

	trap    0