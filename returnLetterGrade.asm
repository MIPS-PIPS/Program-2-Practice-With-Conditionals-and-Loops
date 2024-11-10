# CS 2640
# 11/9/2024
# Program 2: Practice With Conditionals and Loops
# Brandon Tseng, Michael Wu, Jonathan Dang
# Github Repository

# return letter grade from user input
# user menu, main label, looping label, exit label
# way for user to continue getting letter grades or choose to exit
# invalid input handling

.macro returnLetterGrade(%decimal)

.end_macro


.data
	menuPrompt: .asciiz "---------------MAIN MENU---------------\n(1) Get Letter Grade\n(2) Exit Program"
	enterScore: .asciiz "Please enter a score as in integer value: "
	enterSelection: .asciiz "Enter '1' or '2' for your selection: "
	reEnterScore: .asciiz "Would you like to enter a new score?\n (Y)Yes	(N)No\nEnter 'Y' or 'N' for your selection: "
	scoreOutput: .asciiz "The grade is: "
.text
main:
	#print menu and get menu selection
	li $v0, 4
	la $a0, menuPrompt
	syscall
	
	li $v0, 5
	syscall
	move $s0, $v0
	#prompt for score
	li $v0, 4
	la $a0, enterSelection
	syscall
	#return score as a letter grade
	#returnLetterGrade
	
	#reenter score prompt
	li $v0, 4
	la $a0, reEnterScore
	syscall
	
	li $v0, 5
	syscall
	move $s1, $v0
	
	li $v0, 4
	la $a0, reEnterScore
	syscall
loop:

exit:
	li $v0, 10
	syscall