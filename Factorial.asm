# Factorial takes in a non-negative integer and prints out the value of the factorial of that
# integer
#
# @author Rohan Thakur
# @version 11/30/21
    .data
initialPrompt:  .asciiz "Enter a non-negative integer, and I will tell you its factorial: "
newLine:    .asciiz "\n"
    .text
    .globl main
main:
    # asks the user for an integer and saves it as an argument
    li $v0, 4
    la $a0, initialPrompt
    syscall
    li $v0, 5
    syscall
    move $a1, $v0

    # gets the factorial of the input integer and prints it out followed by a new line character
    jal factorial
    move $a0, $v0
    li $v0, 1
    syscall
    li $v0, 4
    la $a0, newLine
    syscall

    # normal program termination
    li $v0, 10
    syscall

# returns the factorial of the input integer
factorial:
    # goes to the base case if the argument is 0
    beq $a1, 0, baseCase

    # stores the return address and argument on the stack
    sub $sp, $sp, 8
    sw $ra, ($sp)
    sw $a1, 4($sp)

    # decrements the argument before calling factorial again
    sub $a1, $a1, 1
    jal factorial

    # pops the return address and argument value off the stack
    lw $ra, ($sp)
    lw $a1, 4($sp)
    add $sp, $sp, 8

    # returns the argument integer multiplied by the factorial of the integer one less than the
    # argument integer
    mult $v0, $a1
    mflo $v0
    jr $ra

# returns 1 for the base case
baseCase:
    li $v0, 1
    jr $ra
