.data
  finish: .asciiz "\nThe program has executed correctly."
  prompt1: .asciiz "\nEnter the first number: "
  prompt2: .asciiz "Enter the second number: "
  operation: .asciiz "Enter the operation (1:+, 2:-, 3:*, 4,/, 0: Exit): "
  invalid: .asciiz "Invalid input try something else."
  out: .asciiz "\nResult is: "
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
      la $a0, operation
      syscall

      li $v0, 5
      syscall

      move $t2, $v0

      beq $t2, 1, Add
      beq $t2, 2, Sub
      beq $t2, 3, Mul
      beq $t2, 4, Div
      beq $t2, 0, Else

      li $v0, 4
      la $a0, invalid
      syscall

      j main

      Add:add $t2, $t0, $t1

          li $v0, 4
          la $a0, out
          syscall

          li $v0, 1
          move $a0, $t2
          syscall
          j main

      Sub:sub $t2, $t0, $t1

          li $v0, 4
          la $a0, out
          syscall

          li $v0, 1
          move $a0, $t2
          syscall
          j main

      Mul:mul $t2, $t0, $t1

          li $v0, 4
          la $a0, out
          syscall

          li $v0, 1
          move $a0, $t2
          syscall
          j main

      Div:div $t2, $t0, $t1

          li $v0, 4
          la $a0, out
          syscall

          li $v0, 1
          move $a0, $t2
          syscall
          j main

      j main

      Else: j Exit

Exit:
    li $v0, 4
    la $a0, finish
    syscall

    li $v0, 10
    syscall
