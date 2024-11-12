# CS 2640
# 11/9/2024
# Program 2: Practice With Conditionals and Loops
# Brandon Tseng, Michael Wu, Jonathan Dang
# Github Repository: https://github.com/MIPS-PIPS/Program-2-Practice-With-Conditionals-and-Loops/tree/main

# return letter grade from user input
# user menu, main label, looping label, exit label
# way for user to continue getting letter grades or choose to exit
# invalid input handling

.macro returnLetterGrade(%decimal)

	move $t0, %decimal
				
	li $a1, 90
	bge $t0, $a1, gradeA #if score >= 90 its an A
	
	li $a1, 80
	bge $t0, $a1, gradeB #if score >= 80 its a B
	
	li $a1, 70
	bge $t0, $a1, gradeC #if score >= 70 its a C
	
	li $a1, 60
	bge $t0, $a1, gradeD #if score >= 60 its a D
	
	j gradeF #if score >= 0 its a F
	
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

.macro exit
	li $v0, 4
	la $a0, exitMessage
	syscall
	
    	li $v0, 10
    	syscall
.end_macro 

.data
	menuPrompt: .asciiz "\n---------------MAIN MENU---------------\n(1) Get Letter Grade\n(2) Exit Program\n\nEnter '1' or '2' for your selection: "
	enterScore: .asciiz "\n---------------------------------------\n\nPlease enter a score as in integer value: "
	scoreOutput: .asciiz "The grade is: "
	reEnterScore: .asciiz "\n---------------------------------------\n\nWould you like to enter a new score?\n(Y)Yes	(N)No\n\nEnter 'Y' or 'N' for your selection: "
	invalidInput: .asciiz "\nPlease enter a valid input\n"
	exitMessage: .asciiz "\nThe progam will now exit."
	newline: .asciiz "\n\n"
.text
main:

	j loop

invalidMenuChoice:
	li $v0, 4
	la $a0, invalidInput
	syscall

loop:
	#print menu and get menu selection
    li $v0, 4
    la $a0, menuPrompt
    syscall
    
	# get menu selection
    li $v0, 5
    syscall
    move $s0, $v0
    	
	beq $s0, 1, getLetterGrade #get letter grade if input == 1
    beq $s0, 2, exitProgram #exit if input == 2
    j invalidMenuChoice
    
invalidScore:
	li $v0, 4
	la $a0, invalidInput
	syscall
	
getLetterGrade:
    #prompt for score
	li $v0, 4
	la $a0, enterScore
	syscall
    	
    # get score
    li $v0, 5
    syscall
    move $s1, $v0
    	
    bgt $s1, 100, invalidScore
    blt $s1, 0, invalidScore 
	
	# print result
	li $v0, 4
	la $a0, scoreOutput
	syscall
	#return score as a letter grade
	returnLetterGrade($s1)
	
reEnterScorePrompt:
	#reenter score prompt
	li $v0, 4
	la $a0, reEnterScore
	syscall
	
	# get if user wants to reenter score
	li $v0, 12
	syscall
	move $s1, $v0
	
	beq $s1, 'Y', getLetterGrade
	beq $s1, 'N', loop
	
	# newline
	li $v0, 4
	la $a0, newline
	syscall
	
	#invalid input
	li $v0, 4
	la $a0, invalidInput
	syscall
	j reEnterScorePrompt

exitProgram:
	exit
