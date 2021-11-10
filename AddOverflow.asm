# AddOverflow asks the user for two integers and prints out the sum of the two integers, allowing
# for overflow in the addition
#
# @author Rohan Thakur
# @version 11/9/21
    .data
askNum0:    .asciiz "Enter an integer: "
askNum1:    .asciiz "Enter another integer: "
newLine:    .asciiz "\n"
    .text
    .globl main
main:
    # asks the user to enter an integer and stores it
    la $a0, askNum0
    li $v0, 4
    syscall
    li $v0, 5
    syscall
    move $s1, $v0

    # asks the user to enter another integer and stores it
    la $a0, askNum1
    li $v0, 4
    syscall
    li $v0, 5
    syscall
    move $s2, $v0

    # stores the initial position of the stack pointer
    move $s0, $sp

    # stores the value 10 for division
    li $t0, 10

    # initializes the register that stores carryover to 0
    li $s3, 0

# begins the process of generating the next digit by adding the units digit of the two input
# integers, storing the units digit of that addition on the stack, storing the value of that
# addition mod 10 in the carryover register, then repeating this process after setting each input
# integer to the value of the quotient when they are divided by 10
nextDigit:
    # if the first number has been reduced to 0, check the second number; if not, generate the next
    # digit in the addition
    beq $s1, 0, checkNum
    j generateNextDigit
checkNum:
    # if the second number has also been reduced to 0, print out the result of the addition
    beq $s2, 0, printResult
generateNextDigit:
    # store the values of modding each input integer by 10, set each input integer to the quotient
    # when they are divided by 10
    div $s1, $t0
    mfhi $t1
    mflo $s1
    div $s2, $t0
    mfhi $t2
    mflo $s2

    # calculate and store the next digit in the addition, store the carryover value
    add $t1, $t1, $t2
    add $t1, $t1, $s3
    div $t1, $t0
    mfhi $t1
    mflo $s3

    # push the value of the next digit in the addition onto the stack
    sub $sp, $sp, 4
    sw $t1, ($sp)

    # continue the addition on the next digit
    j nextDigit

printResult:
    # if there is carryover left, push it onto the stack before printing out the sum
    beq $s3, 0, printSum
    sub $sp, $sp, 4
    sw $s3, ($sp)
printSum:
    # print out the sum one digit at a time by traversing the stack
    beq $sp, $s0, endProgram
    li $v0, 1
    lw $a0, ($sp)
    add $sp, $sp, 4
    syscall
    j printSum
endProgram:
    # normal program termination
    li $v0, 10
    syscall
