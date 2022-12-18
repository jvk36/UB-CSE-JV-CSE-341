.data
  finish: .asciiz "\nThe program has executed correctly."
  prompt1: .asciiz "\nEnter the first two digit number: "
  buffer1: .space 64
  prompt2: .asciiz "\nEnter the second two digit number: "
  buffer2: .space 64
  out: .asciiz "\nResult is: "
  newline: .asciiz "\n"

.text
j main

main:
      li $v0, 4
      la $a0, prompt1
      syscall

      li $v0, 8
      la $a0, buffer1
      li $a1, 64
      syscall

      lb $t0, 0($a0)
      lb $t1, 1($a0)

      li $v0, 4
      la $a0, prompt2
      syscall

      li $v0, 8
      la $a0, buffer2
      li $a1, 64
      syscall

      lb $t2, 0($a0)
      lb $t3, 1($a0)

      move $t5, $0

      bne $t0, $t2, Result1
      j Else
      Result1: addi $t5, $t5, 1

      Else:bne $t1, $t3, Result2
      j Rest

      Result2: addi $t5, $t5, 1

      Rest:li $v0, 4
        la $a0, out
        syscall

        li $v0, 1
        move $a0, $t5
        syscall

      j main

      j Exit

Exit:
    li $v0, 4
    la $a0, finish
    syscall

    li $v0, 10
    syscall
