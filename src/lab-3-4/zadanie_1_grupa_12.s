.data
			.word 87
	first:  .word 110
			.word 112
	second: .word 130
			.word 144
			.word 149
			.word 184
			.word 199
	Table:  .word 247
			.word 292
			.word 299

.text
	addi    r1, r0, 42

	addi    r20, r0, 0
	lw      r2, 4096(r20)

	lw      r3, first

	lw      r4, 4104 ; 4096 + 8 = 4104

	lw      r5, second

	lw      r6, second+4

	lw      r7, 0x1014

	lw      r8, second+0xC

	addi    r21, r0, 28
	lw      r9, 4096(r21)

	addi    r10, r0, 245

	addi    r22, r0, 0
	lw      r11, Table(r22)

	addi    r22, r0, 4
	lw      r12, Table(r22)

	addi    r22, r0, 4
	lw      r13, Table(r22)

trap 0