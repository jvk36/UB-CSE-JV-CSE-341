.data
  finish: .asciiz "\nGoodbye!"
  prompt0: .asciiz "\nEnter the length of the strings whose Hamming Distance is to be computed: "
  prompt1: .asciiz "\nEnter the first number: "
  buffer1: .space 64
  prompt2: .asciiz "\nEnter the second number: "
  buffer2: .space 64
  operation: .asciiz "\nEnter the operation (1:Continue, 0: Exit): "
  invalid: .asciiz "Invalid Operation. Please Try Again."
  out: .asciiz "\nHamming Distance is: "
  newline: .asciiz "\n"

.text
j main

main:
      li $v0, 4
      la $a0, prompt0
      syscall

      li $v0, 5
      syscall
      move $t0, $v0

      li $v0, 4
      la $a0, prompt1
      syscall

      li $v0, 8
      la $a0, buffer1
      li $a1, 64
      syscall
      move $t1, $a0

      li $v0, 4
      la $a0, prompt2
      syscall

      li $v0, 8
      la $a0, buffer2
      li $a1, 64
      syscall
      move $t2, $a0

      move $t3, $0
      move $t4, $0
loop: 
      lb $t5, 0($t1)
      lb $t6, 0($t2)
      addi $t1, $t1, 1
      addi $t2, $t2, 1

      bne $t5, $t6, AddSum
      j SkipSum
AddSum:
      addi $t4, $t4, 1
SkipSum:
      addi $t3, $t3, 1
      bne $t3, $t0, loop

      li $v0, 4
      la $a0, out
      syscall

      li $v0, 1
      move $a0, $t4
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
