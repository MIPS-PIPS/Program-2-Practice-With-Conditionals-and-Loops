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
	li $t0, %decimal # i think this parts wrong its not loading in properly
	li $a1, 90
	bge $t0, $a1, gradeA #if score >= 90 its an A
	
	li $a1, 80
	bge $t0, $a1, gradeB
	
	li $a1, 70
	bge $t0, $a1, gradeC
	
	li $a1, 60
	bge $t0, $a1, gradeD
	
	j gradeF
		

gradeA:
	li $a0, 'A'
	j displayGrade
gradeB:
	li $a0, 'B'
	j displayGrade
gradeC:
	li $a0, 'C'
	j displayGrade
gradeD:
	li $a0, 'D'
	j displayGrade
gradeF:
	li $a0, 'F'
	j displayGrade
	
displayGrade: 
	li $v0, 11
	move $a0, $a0
	syscall
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
	move $s1, $v0
	
	#return score as a letter grade
	returnLetterGrade(s1)
	
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
