; 0₆, 18₁, 57₅, 63₄, 86₁, 97₇, 137₂, 180₈, 183₂, 259₃, 284₉, 284₉, 299₉

.data
			.word 0
			.word 57
			.word 63
			.word 97
	first:  .word 137
			.word 180
	second: .word 183
			.word 259
	Table:  .word 284
			.word 284
			.word 299

.text
	lw      r1, 0x1000 ; (4096)h = 0x1000

	addi    r2, r0, 18

	lw      r3, 4100 ; 4096 + 4 = 4100

	lw      r4, first-0x8 ; (8)h = 0x8

	addi    r5, r0, 86

	addi    r20, r0, 12
	lw      r6, 4096(r20)

	lw      r7, first

	addi    r21, r0, 20
	lw      r8, 4096(r21)

	lw      r9, second

	lw      r10, second+4

	addi    r22, r0, 0
	lw      r11, Table(r22)

	addi    r22, r0, 4
	lw      r12, Table(r22)

	addi    r22, r0, 4
	lw      r13, Table(r22)

	trap    0