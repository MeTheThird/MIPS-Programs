    .data
    .text 0x00400000
    .globl main
main:
    li $v0, 5
    syscall
    move $t0, $v0

    li $v0, 5
    syscall
    move $t1, $v0

    mult $t0, $t1
    mflo $a0
    li $v0, 1
    syscall

    li $v0, 10
    syscall
