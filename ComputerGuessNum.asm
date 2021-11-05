# ComputerGuessNum asks the user to think of an integer between 0 and 500, inclusive, asks the user
# if the guess was too high, too low, or correct for each guess, and continues to refine its guess
# until the program guesses the correct number
#
# @author Rohan Thakur
# @version 11/3/21
    .data
initialPrompt:  .ascii "Think of an integer between 0 and 500, inclusive, and I will try to guess "
                .asciiz "it\n"
guessMsg:  .asciiz "My guess is "
getFeedbackPrompt:  .ascii "\nEnter 0 if my guess was too low, 1 if my guess was too high, or 2 if "
                    .asciiz "my guess was correct: "
successMsg:    .asciiz "Success!\n"
    .text
    .globl main
main:
    # prints out the initial prompt asking the user to think of an integer between 0 and 500
    li $v0, 4
    la $a0, initialPrompt
    syscall

    # initializes the lower bound and upper bound of the range in which the user's number may lie to
    # 0 and 500, respectively
    li $t0, 0
    li $t1, 500

guess:
    addu $t2, $t0, $t1
    div $t2, $t2, 2
    li $v0, 4
    la $a0, guessMsg
    syscall
    li $v0, 1
    move $a0, $t2
    syscall
    li $v0, 4
    la $a0, getFeedbackPrompt
    syscall
    li $v0, 5
    syscall

    beq $v0, 2, endProgram

    beq $v0, 1, hi
    addu $t2, $t2, 1
    move $t0, $t2
    j guess
hi:
    subu $t2, $t2, 1
    move $t1, $t2
    j guess
endProgram:
    li $v0, 4
    la $a0, successMsg
    syscall

    li $v0, 10
    syscall
