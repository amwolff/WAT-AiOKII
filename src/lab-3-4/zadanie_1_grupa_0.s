; 81₈, 110₁, 119₃, 151₅, 169₆, 175₇, 205₄, 236₁, 239₂, 251₂, 266₉, 279₉, 282₉

.data
		.word 81
		.word 119
		.word 151
		.word 169
		.word 175
		.word 205
	first:  .word 239
	second: .word 251
	Table:  .word 266
		.word 279
		.word 282

.text
	addi    r21, r0, 0
	lw      r1, 4096(r21)

	addi    r2, r0, 110

	lw      r3, first-20

	lw      r4, 4104 ; 4096 + 8 = 4104

	lw      r5, 0x100C ; (4096 + 12)h = 0x100C

	addi    r20, r0, 16
	lw      r6, 4096(r20)

	lw      r7, first-0x4 ; (4)h = 0x4

	addi    r8, r0, 236

	lw      r9, first

	lw      r10, second

	addi    r22, r0, 0
	lw      r11, Table(r22)

	addi    r22, r0, 4
	lw      r12, Table(r22)

	addi    r22, r22, 4
	lw      r13, Table(r22)

	trap    0