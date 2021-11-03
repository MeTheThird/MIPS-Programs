# Multiply takes two integers in as user input and outputs their product
#
# @author Rohan Thakur
# @version 10/27/21
    .data
    .text
    .globl main
main:
    # takes in the first integer as user input
    li $v0, 5
    syscall
    move $t0, $v0

    # takes in the second integer as user input
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
