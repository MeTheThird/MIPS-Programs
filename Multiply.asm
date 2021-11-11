# Multiply takes two integers in as user input and outputs their product
#
# @author Rohan Thakur
# @version 11/10/21
    .data
askNum0:    .asciiz "Enter an integer: "
askNum1:    .asciiz "Enter another integer, and I will tell you the two integers' product: "
    .text
    .globl main
main:
    # asks the user to enter an integer and stores it
    la $a0, askNum0
    li $v0, 4
    syscall
    li $v0, 5
    syscall
    move $t0, $v0

    # asks the user to enter another integer and stores it
    la $a0, askNum1
    li $v0, 4
    syscall
    li $v0, 5
    syscall
    move $t1, $v0

    # outputs the product of the two input integers
    mult $t0, $t1
    mflo $a0
    li $v0, 1
    syscall

    # normal program termination
    li $v0, 10
    syscall
