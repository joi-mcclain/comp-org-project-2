.data
  userInput:      .space  10000
  emptyInput:     .asciiz "Input is empty."
  longInput:      .asciiz "Input is too long"
  invalidInput:   .asciiz "Invalid base-33 number."
  numericInput:   .space 4
.text
  main:
    a $a0, userInput
    li $v0, 8
    syscall
    li $t1, 10
    li $t2, 32
    li $s2, 0
  spacesCheck:
    lb $t0, 0($a0)
    beq $t0, $t1, spacesFound 
    beq $t0, $t2, skip
    beqz $t0, spacesFound
    bne $s2, $zero, printLongInput 
    li $s2, 1
    la $a1, numericInput
    sb $t0, 0($a1)
    lb $t0, 1($a0)
    sb $t0, 1($a1)
    lb $t0, 2($a0)
    sb $t0, 2($a1)
