; A[i] = np*90*np+ns+(98-21)-np-np+(65*i)
; n = 84
; mediana, min, suma, różnica
.data
	.align 2
	tab:        .space 4*84

	ns:         .word 15
	np:         .word 59
	g:          .word 4

	mediana:    .word 0
	min:        .word 0
	suma:       .word 0
	roznica:    .word 0

.text
	add     r1, r0, 4

loop:   
	add     r3, r0, r0

	lw      r4, np
	addi    r5, r0, 90
	mult    r6, r4, r5
	mult    r7, r6, r4
	add     r3, r3, r7

	lw      r8, ns
	add     r3, r3, r8

	addi    r9, r0, 98
	subi    r10, r9, 21
	add     r3, r3, r10

	sub     r3, r3, r4

	sub     r3, r3, r4

	addi    r11, r0, 65
	mult    r12, r11, r2
	add     r3, r3, r12

	mult    r13, r2, r1
	sw      tab(r13), r3

	seqi    r14, r2, 41
	beqz    r14, continue0
	add     r15, r0, r3

continue0:
	seqi    r16, r2, 42
	beqz    r16, continue1
	add     r17, r0, r3

	add     r18, r15, r17
	addi    r19, r0, 2
	div     r28, r18, r19

continue1:
	seqi    r20, r2, 0
	beqz    r20, continue2
	add     r29, r0, r3

continue2:
	sle     r21, r3, r29
	beqz    r21, continue3
	add     r29, r0, r3

continue3:
	add     r30, r30, r3

	sub     r31, r31, r3

	seqi    r22, r2, 83
	addi    r2, r2, 1
	beqz    r22, loop

	sw      mediana, r28
	sw      min, r29
	sw      suma, r30
	sw      roznica, r31

	trap    0