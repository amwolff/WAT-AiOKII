; A[i] = 63+89+g+72+ns*i+ns*np*(68+ns)
; n = 98
; różnica, średnia, max, min
.data
	.align 2
	tab:            .space 4*98

	ns:             .word 0
	np:             .word 0
	g:              .word 0

	roznica:        .word 0
	srednia:        .word 0
	max:            .word 0
	min:            .word 0

.text
	; ...............................
	; r1: i
	; r2: A[i]
	; ...............................
	; r3: g
	; r4: ns
	; r5: ns * i
	; r6: np
	; r7: ns * np
	; r8: 68 + ns
	; r9: ns * np * (68 + ns)
	; ...............................
	; r28: roznica
	; r29: srednia
	; r30: max
	; r31: min
	; r14: A[i] > max ? 0 : 1
	; r15: A[i] < min ? 0 : 1
	; ...............................
	; r16: 4
	; r17: 4 * i
	; ...............................
	; r18: i = ((n = 98) - 1) ? 0 : 1
	; ...............................
	; r19: (n = 98)
	; ...............................
	addi    r16, r0, 4
loop:
	addi    r2, r2, 63

	addi    r2, r2, 89

	lw      r3, g
	add     r2, r2, r3

	addi    r2, r2, 72

	lw      r4, ns
	mult    r5, r4, r1
	add     r2, r2, r5

	lw      r6, np
	mult    r7, r4, r6
	addi    r8, r4, 68
	mult    r9, r7, r8
	add     r2, r2, r9

	sub     r28, r28, r2
	
	add     r29, r29, r2
	
	sgt     r14, r2, r30
	beqz    r14, continue0
	addi    r30, r0, r2

continue0:
	slt     r15, r2, r31
	beqz    r15, continue1
	addi    r31, r0, r2

continue1:
	mult    r17, r16, r1
	sw      tab(r17), r2

	addi    r1, r1, 1
	seqi    r18, r1, 97
	beqz    r18, loop

	sw      roznica, r28

	addi    r19, r0, 98
	div     r29, r29, r19
	sw      srednia, r29

	sw      max, r30

	sw      min, r31

	trap    0