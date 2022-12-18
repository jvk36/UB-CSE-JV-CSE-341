.data
  finish: .asciiz "The program has executed correctly."
  prompt: .asciiz "Enter the number of fib: "
  out: .asciiz "Output: "
  newline: .asciiz "\n"

.text

main:
      li $v0, 4
      la $a0, prompt
      syscall

      li $v0, 5
      syscall

      move $a0, $v0
      jal fib_n

      move $t0, $a0

      li $v0, 4
      la $a0, out
      syscall

      li $v0, 1
      move $a0, $t0
      syscall

      li $v0, 4
      la $a0, newline
      syscall

      j DONE

fib_n:


      move $t1,$0
      addi $t2,$0, 1

      beq $a0, $t1, Exit
      beq $a0, $t2, Exit

      move $t0,$a0
      addi $t0, $t0, -1

LOOP:
      slt $t3, $0, $t0
      beq $t3, 0, Exit

      add $a0, $t1, $t2

      move $t1, $t2
      move $t2, $a0

      addi $t0, $t0,-1

      j LOOP

Exit:
      move $v0, $a0
      jr $ra

DONE:

    li  $v0, 4
    la $a0, finish # This instruction moves the string finish described above in the .data section into $a0.
    syscall

    li $v0,10
    syscall
