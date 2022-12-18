.data
	numbers: .asciiz "Please input your first nubmer.\n" 
	sayback: .asciiz "\nYou number definitely was \n"
	.align 2
	input1_hold: .space 4
.text
main:
	li $v0, 4
	la $a0, numbers
	syscall
	
	li $v0, 5
	syscall
	
	la $t0, input1_hold
	sw $v0, 0($t0)

	li $v0, 4
	la $a0, sayback
	syscall

	li $v0, 1
	lw $a0, 0($t0)
	syscall

	li $v0, 10
	syscall
	