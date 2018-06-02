; g = 0
; A[i] = (53-84-(i/3/(g+97)+78*12*(14-i)))
; n = 93
; 
; g = 0
; B[i] = A[i+2] + A[i+0] * A[i+5] - A[i+4]
; m = n-6
.data
	tabA:   .space 4*93
	tabB:   .space 4*87

.text
	; wartość przesunięcia zapisu do tablicy
	addi    r1, r0, 4
	; w r2 będzie trzymany numer indeksu
loopA:
	; f4 to wartość A[i], zerowane po każdym zapisie, przy nowej iteracji
	addf    f4, f0, f0

	addi    r3, r0, 53
	movi2fp f1, r3
	cvti2f  f1, f1
	addi    r4, r0, 84
	movi2fp f2, r4
	cvti2f  f2, f2
	; A[i] = 53 - 84
	subf    f4, f1, f2

	addi    r5, r0, 97
	movi2fp f3, r5
	cvti2f  f3, f3
	addi    r6, r0, 3
	movi2fp f5, r6
	cvti2f  f5, f5
	; f6 = 3 ÷ (0+97)
	divf    f6, f5, f3

	; konwersja aktualnego indeksu (r2) na wartość zmiennoprzecinkową (f7)
	movi2fp f7, r2
	cvti2f  f7, f7

	divf    f8, f7, f6

	; parę dalszych działań
	addi    r7, r0, 78
	movi2fp f9, r7
	cvti2f  f9, f9
	addi    r8, r0, 12
	movi2fp f10, r8
	cvti2f  f10, f10
	multf   f11, f9, f10

	addi    r9, r0, 14
	movi2fp f12, r9
	cvti2f  f12, f12
	subf    f13, f12, f7

	multf   f14, f11, f13

	addf    f15, f8, f14

	; A[i] = poprzednia wartość A[i] (zmodyfikowana w 27 linijce) minus
	; reszta działań
	subf    f4, f4, f15

	; obliczanie przesunięcia wskaźnika zapisu w pamięci dla tablicy A
	; (numer iteracji * 4 [bajty])
	mult    r10, r2, r1
	sf      tabA(r10), f4

	; instrukcja warunkowa kończąca pętlę (lub robiąca skok do kolejnej
	; iteracji)
	seqi    r11, r2, 92
	addi    r2, r2, 1
	beqz    r11, loopA

	; wartości przesunięć zapisu do drugiej tablicy
	addi    r12, r0, 2
	addi    r13, r0, 5
	addi    r14, r0, 4
loopB:
	addf    f16, f0, f0

	add     r16, r15, r12
	mult    r17, r16, r1
	lf      f17, tabA(r17)
	addf    f16, f16, f17

	mult    r18, r15, r1
	lf      f18, tabA(r18)
	add     r19, r15, r13
	mult    r20, r19, r1
	lf      f19, tabA(r20)
	multf   f20, f18, f19
	addf    f16, f16, f20

	add     r21, r15, r14
	mult    r22, r21, r1
	lf      f21, tabA(r22)
	subf    f16, f16, f21

	mult    r23, r15, r1
	sf      tabB(r23), f16

	seqi    r24, r15, 86
	addi    r15, r15, 1
	beqz    r24, loopB

	trap    0