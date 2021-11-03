# PrintRange prints out each integer in a range where the lower bound, upper bound, and step amount
# are taken in as input from the user and are all integers
#
# @author Rohan Thakur
# @version 10/29/21
    .data
newLine:    .asciiz "\n"
    .text
    .globl main
main:
    # takes in the lower bound integer as user input
    li $v0, 5
    syscall
    move $t0, $v0

    # takes in the upper bound integer as user input
    li $v0, 5
    syscall
    move $t1, $v0

    # takes in the integer step amount as user input
    li $v0, 5
    syscall
    move $t2, $v0

# prints each integer in the range specified by the user
printRange:
    bgt $t0, $t1, after
    move $a0, $t0
    li $v0, 1
    syscall
    la $a0, newLine
    li $v0, 4
    syscall
    addu $t0, $t0, $t2
    j printRange
after:
    # normal program termination
    li $v0, 10
    syscall
