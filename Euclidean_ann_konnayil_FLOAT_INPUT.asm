.data
  finish: .asciiz "\nGoodbye!"
  prompt1: .asciiz "\nEnter x1: "
  prompt2: .asciiz "\nEnter x2: "
  prompt3: .asciiz "\nEnter y1: "
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

      li $v0, 6
      syscall

      mov.s $f1, $f0

      li $v0, 4
      la $a0, prompt2
      syscall

      li $v0, 6
      syscall

      mov.s $f2, $f0

      li $v0, 4
      la $a0, prompt3
      syscall

      li $v0, 6
      syscall

      mov.s $f3, $f0

      li $v0, 4
      la $a0, prompt4
      syscall

      li $v0, 6
      syscall

      mov.s $f4, $f0

      sub.s $f5, $f1, $f3
      mul.s $f5, $f5, $f5
      sub.s $f6, $f2, $f4
      mul.s $f6, $f6, $f6
      add.s $f7, $f5, $f6

      sqrt.s $f8, $f7

      li $v0, 4
      la $a0, out
      syscall

      li $v0, 2
      mov.s $f12, $f8
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
