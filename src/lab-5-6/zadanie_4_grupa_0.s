.data
	HelloText:      .asciiz "Witaj!\nProgram zostal napisany przez wyrobnika z grupy H7X2S1.\nMoj numer stanowiska: 404.\n"
	ActionText:     .asciiz "Prosze o podanie znaku:"

	.align 2
	HelloTextPtr:   .word HelloText
	ActionTextPtr:  .word ActionText

	buffer:         .space  64
	par:            .word   0
			.word   buffer
			.word   64

.text
	addi    r14, r0, HelloTextPtr
	trap    5
start:
	addi    r14, r0, ActionTextPtr
	trap    5

	addi    r14, r0, par
	trap    3

	snei    r1, buffer, 4
	beqz    r1, start

	; j     start

	trap    0