# EvenOdd takes in an integer as user input and prints Even if the input integer is even, printing
# Odd otherwise
#
# @author Rohan Thakur
# @version 11/10/21
    .data
initialPrompt:  .asciiz "Enter an integer, and I will tell you its parity: "
oddMsg:     .asciiz "Odd"
evenMsg:    .asciiz "Even"
    .text
    .globl main
main:
    # prompts the user for an integer
    li $v0, 4
    la $a0, initialPrompt
    syscall

    # takes in the integer as user input
    li $v0, 5
    syscall
    move $t0, $v0

    # bitwise ANDs the input integer with 1
    andi $t0, $t0, 1

    # prints Even if the input integer is even, odd otherwise
    beq $t0, 1, odd
    la $a0, evenMsg
    j after
odd:
    la $a0, oddMsg
after:
    li $v0, 4
    syscall

    # normal program termination
    li $v0, 10
    syscall
