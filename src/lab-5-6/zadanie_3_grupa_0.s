; 48, 48, 15, 24, 43, 30, 40, 12, 20, 23, 8, 37, 9

.data

.text
	addi    r1, r0, 48
	addi    r2, r0, 48
	addi    r3, r0, 15
	addi    r4, r0, 24
	addi    r5, r0, 43
	addi    r6, r0, 30
	addi    r7, r0, 40
	addi    r8, r0, 12
	addi    r9, r0, 20
	addi    r10, r0, 23
	addi    r11, r0, 8
	addi    r12, r0, 37
	addi    r13, r0, 9

	sle     r20, r0, r1

	sgti    r21, 94, r2

	sle     r22, r2, r3

	sgt     r23, r3, r4
	bnez    r23, continue0
	addi    r23, r0, -51

	continue0:
	sne     r24, r4, r5
	bnez    r24, continue1
	addi    r24, r0, -55

	continue1:
	sgei    r25, r5, 89
	bnez    r25, continue2
	addi    r25, r0, -43

	continue2:
	slei    r14, r0, 63
	seqi    r15, 53, 58
	or      r26, r14, r15

	sge     r14, r2, r3
	sgt     r15, r4, r5
	and     r27, r14, r15

	seq     r14, r4, r5
	slt     r15, r6, r7
	and     r28, r14, r15

	sne     r14, r6, r7
	sgt     r15, r8, r9
	or      r16, r14, r15
	bnez    r16, ifTrue0
	addi    r29, r0, -92

	ifTrue0:
	addi    r29, r0, 74

	sgti    r14, r8, 62
	seqi    r15, 39, 9
	and     r16, r14, r15
	bnez    r16, ifTrue1
	addi    r30, r0, -68

	ifTrue1:
	addi    r30, r0, 21

	sgti    r14, 67, 83
	snei    r15, 27, 80
	and     r16, r14, r15
	bnez    r16, ifTrue2
	addi    r31, r0, -46

	ifTrue2:
	addi    r31, r0, 23

	trap    0