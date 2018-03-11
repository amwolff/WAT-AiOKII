;0, 18, 57, 63, 86, 97, 137, 180, 183, 259, 284, 284, 299

.data
	HelloText:      .asciiz "Witaj!\nProgram zostal napisany przez wyrobnika z grupy H7X2S1.\nMoj numer stanowiska: 404.\n"
	NumbersText:    .asciiz "Suma: %d\nRoznica: %d\nIloczyn: %d\nSrednia: %d\n"

	.align 2
	HelloTextPtr:   .word HelloText
	NumbersTextPtr: .word NumbersText
	Total:          .word 0
	Difference:     .word 0
	Product:        .word 0
	Mean:           .word 0

.text
	addi    r14, r0, HelloTextPtr
	trap    5

	addi    r1, r0, 0
	addi    r2, r0, 18
	addi    r3, r0, 57
	addi    r4, r0, 63
	addi    r5, r0, 86
	addi    r6, r0, 97
	addi    r7, r0, 137
	addi    r8, r0, 180
	addi    r9, r0, 183
	addi    r10, r0, 259
	addi    r11, r0, 284
	addi    r12, r0, 284
	addi    r13, r0, 299

	add     r15, r5, r9
	add     r15, r15, r13

	sw      Total, r15

	sub     r16, r13, r10
	sub     r16, r16, r6

	sw      Difference, r16

	mult    r17, r7, r12
	mult    r17, r17, r8

	sw      Product, r17

	add     r18, r7, r4
	add     r18, r18, r9

	addi    r19, r0, 3

	div     r20, r18, r19

	sw      Mean, r20

	addi    r14, r0, NumbersTextPtr
	trap    5

	trap    0