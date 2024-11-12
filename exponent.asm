# CS 2640
# 11/9/2024
# Program 2: Practice With Conditionals and Loops
# Brandon Tseng, Michael Wu, Jonathan Dang
# Github Repository: https://github.com/MIPS-PIPS/Program-2-Practice-With-Conditionals-and-Loops/tree/main

# Take two ints from user
# Find result of x to power of y
# Include main, looping, exit label

.data
	prompt: .asciiz "This program asks the user to input a value for 'x' and 'y'.\nThen, it finds the value of x to the power of y.\nFor example, 2 to the power 3 is 8.\n\n"
	input1: .asciiz "\nEnter a number for 'x': "
	input2: .asciiz "\nEnter a number for 'y': "
	result: .asciiz "\n'x' to the power 'y' is: "
	
.text
main:
	# Print prompt
	li $v0, 4
	la $a0, prompt
	syscall
	
	# Ask for x ($t0)
	li $v0, 4
	la $a0, input1
	syscall
	
	# Store x ($t0)
	li $v0, 5
	syscall
	move $t0, $v0
	
	# Ask for y ($t1)
	li $v0, 4
	la $a0, input2
	syscall
	
	# Store y ($t1)
	li $v0, 5
	syscall
	move $t1, $v0
	
	# Initialize result number
	li $t2, 1 
	
	# Initialize loop counter (equal to y)
	move $t3, $t1
	
loop:
	# Loop to perform exponential operation
	beqz $t3, exit
	mul $t2, $t2, $t0
	subi $t3, $t3, 1
	j loop
	
exit:
	# Print result text
	li $v0, 4
	la $a0, result
	syscall
	
	# Print result number
	li $v0, 1
	move $a0, $t2
	syscall

	# Quit program
	li $v0, 10
	syscall
