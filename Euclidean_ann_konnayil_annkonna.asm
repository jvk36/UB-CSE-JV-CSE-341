.data
  finish: .asciiz "\nThe program has executed correctly."
  prompt1: .asciiz "\nEnter x1: "
  prompt2: .asciiz "\nEnter y1: "
  prompt3: .asciiz "\nEnter x2: "
  prompt4: .asciiz "\nEnter y2: "
  operation: .asciiz "\nEnter the operation (1:+, 2:-, 3:*, 4,/, 0: Exit): "
  invalid: .asciiz "Invalid input try something else."
  out1: .asciiz "\nInteger value of floating point representation is: "
  out2: .asciiz "\nInteger(truncated) value of result is: "
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

      sub $t5, $t0, $t1
      mul $t5, $t5, $t5

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

      sub $t6, $t2, $t3
      mul $t6, $t6, $t6
      add $t7, $t5, $t6

      mtc1 $t7, $f0
      cvt.s.w $f1, $f0
      sqrt.s $f2, $f1

      li $v0, 4
      la $a0, out1
      syscall

      li $v0, 1
      mfc1 $t7, $f2
      move $a0, $t7
      syscall

      li $v0, 4
      la $a0, out2
      syscall

      li $v0, 1
      cvt.w.s $f3, $f2
      mfc1 $t8, $f3
      move $a0, $t8
      syscall

      j main

      Else: j Exit

Exit:
    li $v0, 4
    la $a0, finish
    syscall

    li $v0, 10
    syscall
