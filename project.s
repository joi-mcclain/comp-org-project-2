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
