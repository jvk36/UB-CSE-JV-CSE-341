.data
  finish: .asciiz "\nGoodbye!"
  prompt1: .asciiz "\nEnter x1: "
  prompt2: .asciiz "\nEnter y1: "
  prompt3: .asciiz "\nEnter x2: "
  prompt4: .asciiz "\nEnter y2: "
  operation: .asciiz "\nEnter the operation (1:Continue, 0: Exit): "
  invalid: .asciiz "Invalid Operation. Please Try Again."
  out: .asciiz "\nEuclidean Distance is: "
  newline: .asciiz "\n"

.text
j main

main:
      li $v0, 4
      la $a0, prompt1
      syscall

      li $v0, 5
      syscall

      move $t0, $v0

      li $v0, 4
      la $a0, prompt2
      syscall

      li $v0, 5
      syscall

      move $t1, $v0

      li $v0, 4
      la $a0, prompt3
      syscall

      li $v0, 5
      syscall

      move $t2, $v0

      li $v0, 4
      la $a0, prompt4
      syscall

      li $v0, 5
      syscall

      move $t3, $v0

      sub $t5, $t0, $t1
      mul $t5, $t5, $t5
      sub $t6, $t2, $t3
      mul $t6, $t6, $t6
      add $t7, $t5, $t6

      mtc1 $t7, $f0
      cvt.s.w $f1, $f0
      sqrt.s $f2, $f1

      li $v0, 4
      la $a0, out
      syscall

      li $v0, 2
      mov.s $f12, $f2
      syscall

Tryagain:
      li $v0, 4
      la $a0, operation
      syscall

      li $v0, 5
      syscall

      move $t2, $v0

      beq $t2, 1, Continue
      beq $t2, 0, Exit

      li $v0, 4
      la $a0, invalid
      syscall
      j Tryagain

Continue: 
      j main

Exit:
      li $v0, 4
      la $a0, finish
      syscall

      li $v0, 10
      syscall
