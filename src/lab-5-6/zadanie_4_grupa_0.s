.data
	letters:        .asciiz "bcdefghijklm"
	lettersNumber:  .word   97

	helloText:      .asciiz "Witaj!\nProgram zostal napisany przez wyrobnika z grupy H7X2S1.\nMoj numer stanowiska: 404.\n"
	actionText:     .asciiz "Prosze o podanie znaku:"
	letterText:     .asciiz "%s\n"

	.align 2
	helloTextPtr:   .word   helloText
	actionTextPtr:  .word   actionText
	letterTextPtr:  .word   letterText
	letter:         .word   0

	readBuffer:     .space  64
	readPar:        .word   0
			.word   ReadBuffer
			.word   64

.text
	addi    r14, r0, helloTextPtr
	trap    5

mainLoop:
	addi    r14, r0, actionTextPtr
	trap    5

	addi    r14, r0, readPar
	trap    3

	seqi    r2, r1, 1
	beqz    r2, mainLoop

	lb      r3, readBuffer

	lw      r4, lettersNumber

	add     r5, r0

letterCheckLoop:
	lb      r6, letters(r5)

	seqi    r7, r6, 10
	bnez    r7, mainLoop

	seq     r8, r3, r6
	bnez    r8, break

	addi    r4, r4, 1
	addi    r5, r5, 1
	j       letterCheckLoop

break:
	sw      letter, r3
	addi    r14, r0, letterTextPtr
	trap    5
	j       mainLoop