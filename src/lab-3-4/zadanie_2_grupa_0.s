; 81, 110, 119, 151, 169, 175, 205, 236, 239, 251, 266, 279, 282

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

	addi    r1, r0, 81
	addi    r2, r0, 110
	addi    r3, r0, 119
	addi    r4, r0, 151
	addi    r5, r0, 169
	addi    r6, r0, 175
	addi    r7, r0, 205
	addi    r8, r0, 236
	addi    r9, r0, 239
	addi    r10, r0, 251
	addi    r11, r0, 266
	addi    r12, r0, 279
	addi    r13, r0, 282

	add     r15, r4, r5
	add     r15, r15, r9

	sw      Total, r15

	sub     r16, r12, r6
	sub     r16, r16, r13

	sw      Difference, r16

	mult    r17, r4, r8
	mult    r17, r17, r13

	sw      Product, r17

	add     r18, r1, r4
	add     r18, r18, r11

	addi    r19, r0, 3

	div     r20, r18, r19

	sw      Mean, r20

	addi    r14, r0, NumbersTextPtr
	trap    5

	trap    0