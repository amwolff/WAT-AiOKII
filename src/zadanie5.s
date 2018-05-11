.data   
	;wazne aby adres sie zgadzal
	.align 2 
	TABLE:  .space 4*100

	ns:     .word 7
	np:     .word 14
	g:      .word 21

	roznica:        .word 0
	min:           	.word 0
	mediana:	.word 0
	max:		.word 0
.text
	add 	r2,r0, r0

again:
	lw	r10, ns      ;w zadaniu jest napisane, ze te liczby maja byc z pamieci, no to sa
	lw	r11, np
	lw	r12, g

	add 	r4, r0, r10
	mult 	r4, r4, r11
	mult 	r4, r4, r12
	sub 	r4, r4, 38

	lw 	r5, ns ;r5 = ns
	subi 	r5, r5, 1 ;r5 = (ns-1)

	sub 	r4, r4, r5
	subi 	r4, r4, 57
	subi 	r4, r4, 73

	mult 	r6, r2, r10 ;i*ns

	sub 	r4, r4, r6

	addi 	r13, r0, 4
	mult 	r14, r2, r13
	sw 	0x1000(r14), r4 ;tu laduje liczby do tablicy znajdujacej sie na poczatku data,
			   	;r14 to przesuniecie indeks*4

	;roznica
	sub 	r28, r28, r4

	;min
	bnez 	r16, first_min ;zeby chociaz raz zostal wykonany
	addi 	r16, r0, 1
	add 	r29, r0, r4
first_min:
	sgt 	r15, r29, r4
	beqz 	r15, min_no_change
	add 	r29, r0, r4
min_no_change: 

	;mediana
	seqi 	r15, r2, 49
	beqz 	r15, mediana_skip_1 ;czeka na liczbe na 49 indeksie
	add 	r30, r0, r4
mediana_skip_1:
	seqi 	r15, r2, 50
	beqz 	r15, mediana_skip_2 ;czeka na liczbe na 50 indeksie
	addi 	r20, r0, 2
	add 	r30, r30, r4
	div 	r30, r30, r20
mediana_skip_2:

	;max
	slt 	r15, r31, r4
	beqz 	r15, max_no_change
	add 	r31, r0, r4
max_no_change:

	addi 	r2, r2, 1
	seqi 	r3, r2, 100
	bnez 	r3, table_end ;konczy jezeli indeks zmieni sie na 100
	beqz 	r3, again
table_end:

	trap 	0