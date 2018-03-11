.data
			.word 40
			.word 90
			.word 94
			.word 130
	first:  .word 140
			.word 154
	second: .word 159
			.word 177
	Table:  .word 189
			.word 257
			.word 297

.text
	addi    r1, r0, 14

	lw      r2, first-16

	lw      r3, first-0xC

	addi    r20, r0, 8
	lw      r4, 4096(r20)

	lw      r5, 0x100C ; 4096 + 12 = 4108

	lw      r6, first

	lw      r7, 4116 ; 4096 + 20 = 4116

	lw      r8, second

	addi    r21, r0, 28
	lw      r9, 4096(r21)

	addi    r10, r0, 189

	addi    r22, r0, 0
	lw      r11, Table(r22)

	addi    r22, r0, 4
	lw      r12, Table(r22)

	addi    r22, r0, 4
	lw      r13, Table(r22)

	trap 0