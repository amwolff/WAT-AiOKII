;A[i] = ns*i*69-54-np+65+72-34-(18+86) 
;n = 107

.data
	
	.align 2
  A:    .space 4*107

  ns:   .word 17
  np:   .word 10

  roznica:  .word 0
  max:      .word 0
  suma:     .word 0
  mediana:  .word 0

.text
  ; ...............................
  ; r1 i
  ; r2 A[i]
  ; ...............................
  ; r3 ns
  ; r4 ns * 69
  ; r5 ns * 69 * i
  ; r6 np
  ; r7 18+86
  ; r13 69
  ; ...............................
  ; r12 4
  ; r10 4 * i
  ; ...............................
  ; r28 roznica
  ; r29 max
  ; r30 suma
  ; r31 mediana

  addi r1, r0, 0

  lw r3, ns
  lw r6, np

  addi r12, r0, 4
  addi r13, r0, 69

  mult r4, r3, r13

  addi r7, r0, 18
  addi r7, r7, 86

  

  addi r28, r0, 0
  addi r29, r0, 0
  addi r30, r0, 0
  addi r31, r0, 0

  start:
    mult r5, r4, r1

    add r2, r0, r5
    subi r2, r2, 54
    sub r2, r2, r6
    addi r2, r2, 65
    addi r2, r2, 72
    subi r2, r2, 34
    sub r2, r2, r7

    sub r28, r28, r2

    sgt r8, r2, r29
    beqz r8, e1

    add r29, r0, r2
    e1:

    add r30, r30, r2

    seqi r9, r1, 53
    beqz r9, e2
    
    add r31, r31, r2
    e2:

    mult r10, r1, r12
    sw A(r10), r2

    addi r1, r1, 1

    seqi r11, r1, 107
    beqz r11, start
    
    sw roznica, r28
    sw max, r29
    sw suma, r30
    sw mediana, r31

    trap 0
