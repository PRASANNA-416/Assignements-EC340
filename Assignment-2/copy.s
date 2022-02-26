	# Calculate and print the sum of an integer array

        .data

array:  .word 1 2 3 4 5

        .text
        .globl main

main:   

        # base address of array to which element have to be copied is $t0
        #base address of array from which elements are copied is $s0
        li      $t1, 0              # i (index) = 0

loop:   slti    $t5, $t1, 10
        beq     $t5, $zero, done
        add     $t2, $t1, $s0
        lbu     $t3, 0($t2)
        add     $t4, $t1, $t0
        sb      $t3, 0($t4)
        addi    $t1, $t1, 1
        j       loop


done:   li      $v0, 1              # print sum
        move    $a0, $t0
        syscall

        li      $v0, 11             # print newline character
        li      $a0, 0x0a
        syscall

        jr $ra                      # return from main
