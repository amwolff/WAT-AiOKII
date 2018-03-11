; 62₈, 84₂, 100₂, 119₁, 133₁, 134₃, 152₆, 158₄, 164₇, 232₅, 232₉, 238₉, 261₉

.data
		.word 62
	first:  .word 84
	second: .word 100
		.word 134
		.word 152
		.word 158
		.word 164
		.word 232
	Table:  .word 232
		.word 238
		.word 261

.text
	addi    r21, r0, 0
	lw      r1, 4096(r21)

	lw      r2, first

	lw      r3, second

	addi    r4, r0, 119

	addi    r5, r0, 133

	lw      r6, second+4

	lw      r7, 0x1010 ; (4096 + 16)h = 0x1010

	lw      r8, second+0x3 ; (3)h = 0x3

	addi    r20, r0, 24
	lw      r9, 4096(r20)

	lw      r10, 4124 ; 4096 + 24 = 4124

	addi    r22, r0, 0
	lw      r11, Table(r22)

	addi    r22, r0, 4
	lw      r11, Table(r22)

	addi    r22, r22, 4
	lw      r11, Table(r22)

	trap 0