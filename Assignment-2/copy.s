#to copy contents of one array to another
        .data

array1:  .word 4 1 6 8 9 10 12 14 16 18
array2:  .word 2 3 5 7 1 11 13 15 17 19


        .text
        .globl main

main:   

        # base address of array to which element have to be copied is $t0
        #base address of array from which elements are copied is $s0
        la	$s0, array1
	la	$t0, array2 
	li	$t1, 1

loop:   slti    $t5, $t1, 10
        beq     $t5, $zero, done
       	lw	$t3, 0($s0)
	sw	$t3, 0($t0)
	addu 	$s0, $s0, 4
	addu	$t0, $t0, 4
	addi 	$t1, $t1, 1
        j       loop


done:   li      $v0, 1              # print array
        move    $a0, $t0
        syscall

        li      $v0, 11             # print newline character
        li      $a0, 0x0a
        syscall

        jr $ra                      # return from main
