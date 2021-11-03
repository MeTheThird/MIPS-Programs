# UserGuessNum generates a random integer between 0 and 500, inclusive, and asks the user to
# repeatedly guess the integer that was generated, printing out "too high" or "too low"
# appropriately to give the user feedback on each of their guesses
#
# @author Rohan Thakur
# @version 11/3/21
    .data
guessQuestion:  .asciiz "What is your integer guess between 0 and 500, inclusive? "
tooHigh:    .asciiz "Too high\n"
tooLow:     .asciiz "Too low\n"
success:     .asciiz "Success!\n"
    .text
    .globl main
main:
    # generates and stores a random number between 0 and 500, inclusive
    li $a1, 501
    li $v0, 42
    syscall
    move $t0, $a0

    # prints the generated random number for testing purposes
    # li $v0, 1
    # syscall

guess:
    # asks the user for an integer guess
    la $a0, guessQuestion
    li $v0, 4
    syscall
    # reads in a user-input integer
    li $v0, 5
    syscall
    # prints success and terminates the program if the user guesses correctly
    beq $v0, $t0, victory
    # prints out whether the user's guess was too high or too low
    bgt $v0, $t0, tooLarge
    la $a0, tooLow
    # asks for the user's guess again
    j guessAgain
tooLarge:
    la $a0, tooHigh
guessAgain:
    li $v0, 4
    syscall
    j guess
victory:
    # prints the success message
    la $a0, success
    li $v0, 4
    syscall

    # normal program termination
    li $v0, 10
    syscall
