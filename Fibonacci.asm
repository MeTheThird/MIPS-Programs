# Fibonacci takes in a non-negative integer n and prints out the nth Fibonacci number
#
# @author Rohan Thakur
# @version 11/30/21
    .data
initialPrompt:  .ascii "Enter a non-negative integer, and I will give you the Fibonacci number at "
                .asciiz "that index: "
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

    # gets the fibonacci number at the input integer's index and prints it out followed by a new
    # line character
    jal fibonacci
    move $a0, $v0
    li $v0, 1
    syscall
    li $v0, 4
    la $a0, newLine
    syscall

    # normal program termination
    li $v0, 10
    syscall

# returns the fibonacci number at the input integer's index
fibonacci:
    # goes to the base case if the argument is less than or equal to 1
    ble $a1, 1, baseCase

    # stores the return address and argument on the stack
    sub $sp, $sp, 12
    sw $ra, ($sp)
    sw $a1, 4($sp)

    # calls fibonacci on the argument minus one and pushes the return value onto the stack
    sub $a1, $a1, 1
    jal fibonacci
    sw $v0, 8($sp)

    # calls fibonacci on the argument minus two and pushes the return value onto the stack
    lw $a1, 4($sp)
    sub $a1, $a1, 2
    jal fibonacci

    # pops the result from the fibonacci call on the argument minus one, the return address, and the
    # argument value off the stack
    lw $t0, 8($sp)
    lw $ra, ($sp)
    lw $a1, 4($sp)
    add $sp, $sp, 12

    # returns the current fibonacci number
    add $v0, $t0, $v0
    jr $ra

# returns the argument for the base case
baseCase:
    move $v0, $a1
    jr $ra
