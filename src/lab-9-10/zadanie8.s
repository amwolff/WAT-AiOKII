.data   
	A:	.space 4*91
	B:	.space 4*85

	ns:     .float 3
	np:     .float 6
	g:      .float 9	
.text
	lf	f1, ns
	lf	f2, np
	lf	f3, g

	addi	r1, r0, 31
	movi2fp	f4, r1
	cvti2f	f4, f4

	addi	r2, r0, 44
	movi2fp	f5, r2
	cvti2f	f5, f5

	addi	r3, r0, 21
	movi2fp	f6, r3
	cvti2f	f6, f6

	addi	r4, r0, 7
	movi2fp	f7, r4
	cvti2f	f7, f7

	addi	r5, r0, 22
	movi2fp	f8, r5
	cvti2f	f8, f8

	addi	r6, r0, 32
	movi2fp	f9, r6
	cvti2f	f9, f9

	addi	r7, r0, 71
	movi2fp	f10, r7
	cvti2f	f10, f10
	
	addi	r8, r0, 1
	movi2fp	f11, r8
	cvti2f	f11, f11 ;tymczasowe zapisanie 1 bo bedzie potrzebna pozniej

	addi	r9, r0, 4

again:
	;1 tablica : A[i] = (g+31+44-21)-i/7/22*ns*(32+71)
	;2 tablica : B[i] = A[i+4] + A[i+3] + A[i+6] * A[i+1]
	;f15 i r10 to i
	;r13 i r25 to countery do drugiej tablicy, pierwszy zapewnia,
	;ze tablica zacznie sie zapelniac kiedy r10 = 6
	addf	f12, f3, f4
	divf	f13, f15, f7
	addf	f12, f12, f5
	divf	f13, f13, f8
	subf	f12, f12, f6
	multf	f13, f13, f1
	addf	f14, f9, f10	;f14 to (32+71)
	multf	f13, f13, f14	;f13 to i/7/22*ns*(32+71)
	subf	f12, f12, f13

	sf 	A(r11), f12 	;wazne aby zaczac zapisywac przed zwiekszeniem indeksu o 1

	sgei 	r20, r13, 6	;czesc programu zapelniajaca 2 tablice, najpierw wczytuje potrzebne liczby
	beqz	r20, pass

	mult 	r21, r10, r9
	lf	f20, A(r21)	;f20 = A[i+6]

	subi 	r22, r10, 2
	mult 	r22, r22, r9
	lf	f21, A(r22)	;f21 = A[i+4]

	subi	r23, r10, 3
	mult 	r23, r23, r9
	lf 	f22, A(r23)	;f22 = A[i+3]

	subi	r24, r10, 5
	mult 	r24, r24, r9
	lf 	f23, A(r24)	;f23 = A[i+1]

	multf	f20, f20, f23	;f20 = A[i+6] * A[i+1]
	addf 	f24, f21, f22
	mult 	r26, r25, r9
	addf 	f24, f24, f20
	add 	r25, r25, 1
	sf 	B(r26), f24
pass:
	addf	f15, f15, f11
	addf	f16, f0, f15	;konieczne jest zapisanie countera do innego rejestru przed
	cvtf2i	f16, f16	;przeniesieniem, poniewaz przeniesienie jest niszczace
	movfp2i	r10, f16	;przed przeniesieniem z f do r nalezy przekonwertowac liczbe
	addi 	r13, r13, 1
	mult 	r11, r10, r9

	seqi 	r12, r10, 91
	beqz 	r12, again
	trap 	0