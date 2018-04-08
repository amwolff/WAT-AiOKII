.data
	helloText:      .asciiz "Witaj!\nProgram zostal napisany przez wyrobnika z grupy H7X2S1.\nMoj numer stanowiska: 404.\n"
	actionText:     .asciiz "Prosze o podanie znaku:"
	outputChar:     .asciiz "\n%c\n"
	readBuffer:     .space 64
	buffer:         .word 0
			.word readBuffer
			.word 64

	.align 2
	helloTextPtr:   .word helloText
	actionTextPtr:  .word actionText
	outputCharPtr:  .word outputChar
	char:           .word 0

.text
	add     r14, r0, helloTextPtr
	trap    5
try:
	add     r14, r0, actionTextPtr
	trap    5

	add     r14, r0, buffer
	trap    3

	add     r2, r0, readBuffer

	lb      r3, 0(r2)
	; grupa 0: b c d e f g h i j k l m -- 98 - 109
	sgei    r4, r3, 98
	slei    r5, r3, 109
	and     r6, r4, r5
	beqz    r6, try

	sw      char, r3
	add     r14, r0, outputCharPtr
	trap    5
	j       try