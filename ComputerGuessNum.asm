# ComputerGuessNum asks the user to think of an integer between 0 and 500, inclusive, asks the user
# if the guess was too high, too low, or correct for each guess, and continues to refine its guess
# until the program guesses the correct number
#
# @author Rohan Thakur
# @version 11/3/21
    .data
initialPrompt:  .asciiz "Think of a number between 0 and 500, inclusive, and I will try to guess
                         it\n"
    .text
    .globl main
main:

