# Max3 takes in three integers from the user and prints out the value of the greatest integer via
# the use of subroutines
#
# @author Rohan Thakur
# @version 11/30/21
    .data
prompt0:    .asciiz  "Enter an integer: "
prompt1:    .asciiz "Enter another integer: "
prompt2:    .asciiz "Enter another integer, and I will tell you the value of the greatest integer: "
newLine:    .asciiz "\n"
    .text
    .globl main
main:
    # asks the user for the first integer and saves it as an argument
    li $v0, 4
    la $a0, prompt0
    syscall
    li $v0, 5
    syscall
    move $a1, $v0

    # asks the user for the second integer and saves it as an argument
    li $v0, 4
    la $a0, prompt1
    syscall
    li $v0, 5
    syscall
    move $a2, $v0

    # asks the user for the third integer and saves it as an argument
    li $v0, 4
    la $a0, prompt2
    syscall
    li $v0, 5
    syscall
    move $a3, $v0

    # gets the greatest integer and prints it out followed by a new line character
    jal max3
    move $a0, $v0
    li $v0, 1
    syscall
    li $v0, 4
    la $a0, newLine
    syscall

    # normal program termination
    li $v0, 10
    syscall

# returns the greatest integer out of the three input integers
max3:
    # stores the return address on the stack
    sub $sp, $sp, 4
    sw $ra, ($sp)

    # gets the greatest integer of the first two input integers
    jal max2
    move $a1, $v0

    # returns the greatest integer across the three input integers
    move $a2, $a3
    jal max2
    lw $ra, ($sp)
    add $sp, $sp, 4
    jr $ra

# returns the greater integer out of the two input integers
max2:
    bge $a1, $a2, big1
    move $v0, $a2
    j max2End
big1:
    move $v0, $a1
max2End:
    jr $ra
