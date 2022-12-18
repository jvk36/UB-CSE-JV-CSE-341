.data
  finish: .asciiz "The program has executed correctly."
  value_t1: .asciiz "t= "
  value_s2: .asciiz "z= "
  spc: .asciiz " "
  newline: .asciiz "\n"
  itr: .asciiz "The values of the register in the iteration number: "

.text

main:
  addi $t1,$0,10   # value of t=10.
  addi $s2,$0,2    # value of z=2.
  addi $s3,$0,1    # Registers to store the value of iteration number.


  LOOP:
    slt  $t2, $0, $t1
    beq  $t2, 0, DONE

    # Print instruction in MIPS, first load instruction 1 to $v0 (for more information on the instruction numbers refer to the recitation slides) and then
    # move the value you want to print into $a0 (again to understand why we are doing this refer to recitation slides) and then syscall.

    li   $v0, 4
    la $a0, itr # This instruction moves the string itr described above in the .data section into $a0.
    syscall

    li  $v0, 1
    move $a0, $s3 # This instruction moves the value of register $s3 into $a0. $s3 keeps track of the iteration number.
    syscall

    li  $v0, 4
    la $a0, newline # This instruction moves the string spc described above in the .data section into $a0.
    syscall

    li  $v0, 4
    la $a0, newline # This instruction moves the string spc described above in the .data section into $a0.
    syscall

    li  $v0, 4
    la $a0, value_t1 # This instruction moves the string value_$t1 described above in the .data section into $a0.
    syscall

    li  $v0, 1
    move $a0, $t1 # This instruction moves the value of $t1 into $a0.
    syscall

    li  $v0, 4
    la $a0, newline # This instruction moves the string spc described above in the .data section into $a0.
    syscall

    li  $v0, 4
    la $a0, value_s2 # This instruction moves the string value_$t2 described above in the .data section into $a0.
    syscall

    li  $v0, 1
    move $a0, $s2 # This instruction moves the value of register $s2 into $a0.
    syscall

    li  $v0, 4
    la $a0, newline # This instruction moves the string newline described above in the .data section into $a0.
    syscall

    li  $v0, 4
    la $a0, newline # This instruction moves the string newline described above in the .data section into $a0.
    syscall

    add $s2, $s2, $t1
    addi $t1, $t1, -1
    add $s3, $s3, 1

    j LOOP

  DONE:

    li  $v0, 4
    la $a0, finish # This instruction moves the string finish described above in the .data section into $a0.
    syscall

    li $v0,10
    syscall
