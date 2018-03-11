.data
		.word 14
	first:  .word 16
		.word 80
		.word 87
		.word 179
		.word 181
	second: .word 245
		.word 255
	Table:  .word 271
		.word 287
		.word 295

.text
	lw      r1, first-0x4

	lw      r2, first

	addi    r20, r0, 8
	lw      r3, 4096(r20)

	lw      r4, 4108

	lw      r5, 0x1010

	lw      r6, second-4

	lw      r7, second

	addi    r8, r0, 246

	addi    r21, r0, 28
	lw      r9, 4096(r21)

	addi    r10, r0, 262

	addi    r22, r0, 0
	lw      r11, Table(r22)

	addi    r22, r0, 4
	lw      r12, Table(r22)

	addi    r22, r22, 4
	lw      r13, Table(r22)

	trap 0