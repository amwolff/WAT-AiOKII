;A[i] = g*np+(i/6)/(np-75-26-g-g-80)
;n= 108

;B[i] = A[i+3] * A[i+6] - A[i+2] * A[i+4]
;m= 102

.data
  .align 2
  A:  .space 4*108
  B:	.space 4*102

.text
  ; ...............................
  ; r1 i
  ; r4 4
  ; r5 i*4
  ; ...............................
  ; f1 A[i]
  ; f2 B[i]
  ; ...............................
  ; f3 np
  ; f4 g
  ; f5 g*np
  ; f6 75
  ; f7 26
  ; f8 80
  ; f9 np-75-26-g-g-80
  ; f10 6
  ; f11 i
  ; f12 i/6
  ; f13 (i/6)/(np-75-26-g-g-80)
  ; ...............................
  ; f14 A[i+3]
  ; f15 A[i+6]
  ; f16 A[i+2]
  ; f17 A[i+4]
  ; f18 A[i+3] * A[i+6]
  ; f19 A[i+2] * A[i+4]

  addi r1, r0, 0
  addi r4, r0, 4

  addi r2, r0, 14
  movi2fp f3, r2
  cvti2f  f3, f3

  addi r2, r0, 25
  movi2fp f4, r2
  cvti2f  f4, f4

  addi r2, r0, 75
  movi2fp f6, r2
  cvti2f  f6, f6

  addi r2, r0, 26
  movi2fp f7, r2
  cvti2f  f7, f7

  addi r2, r0, 80
  movi2fp f8, r2
  cvti2f  f8, f8

  addi r2, r0, 6
  movi2fp f10, r2
  cvti2f  f10, f10

  tabA:
  multf f5, f4, f3

  subf f9, f3, f6
  subf f9, f9, f7
  subf f9, f9, f4
  subf f9, f9, f4
  subf f9, f9, f8

  movi2fp f11, r1
  cvti2f  f11, f11

  divf f12, f11, f10

  divf f13, f12, f9

  addf f1, f13, f5

  mult r5, r1, r4
  sf A(r5), f1

  addi r1, r1, 1

  seqi r3, r1, 108
  beqz r3, tabA

  addi r1, r0, 0

  tabB:
    addi r6, r1, 3
    mult r6, r6, r4
    lf f14, A(r6) 

    addi r6, r1, 6
    mult r6, r6, r4
    lf f15, A(r6) 

    addi r6, r1, 2
    mult r6, r6, r4
    lf f16, A(r6) 

    addi r6, r1, 4
    mult r6, r6, r4
    lf f17, A(r6) 

    multf f18, f14, f15

    multf f19, f16, f17

    subf f2, f18, f19

    mult r5, r1, r4
    sf B(r5), f2

    addi r1, r1, 1

    seqi r3, r1, 102
    beqz r3, tabB

  trap 0