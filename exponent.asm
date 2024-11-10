# CS 2640
# 11/9/2024
# Program 2: Practice With Conditionals and Loops
# Brandon Tseng, Michael Wu, Jonathan Dang
# Github Repository

# take two ints from user
# find result of x to power of y
# include main, looping, exit label

.data
	prompt: .asciiz "This program asks the user to input a value for 'x' and 'y'.\nThen, it finds the value of x to the power of y.\nFor example, 2 to the power 3 is 8."
	input1: .asciiz "Enter a number for 'x': "
	input2: .asciiz "Enter a number for 'y': "
	output: .asciiz "'x' to the power 'y' is: "
.text
main:
	#print prompt
	li $v0, 4
	la $a0, prompt
	syscall
	
	#ask for x
	li $v0, 4
	la $a0, input1
	syscall
	
	#store x
	li $v0, 5
	syscall
	move $t0, $v0
	
	#ask for y
	li $v0, 4
	la $a0, input2
	syscall
	
	#store y
	li $v0, 5
	syscall
	move $t1, $v0
	
	
	li $t2, 1 #initialize result
	li $t3, 0 #initialize loop counter
	
	#print output text
	li $v0, 4
	la $a0, output
	syscall
	#print outputted num
	
	

loop:
	mul $t2, $t2, $t0
	addi $t3, $t3, 1
	beq $t2, $t1, exit
	j loop
exit:
	li $v0, 10
	syscall