# to find minimum value in array and swap with last item 

        .data
        
 array: .word 7 12 5 10 8 9 4 2 15 13
 
 
        .text
        .globl main
        
main:   

        ## min = 0;
        ## for(i=0; i<5; i++);
        ##    sum = sum + array[i];

        li      $t0, 0              # min = 0
        li      $t1, 0              # i (index) = 0
        li      $t8, 0              #temp variable for swapping

loop:   slti    $t3, $t1, 10         # if i == 10 goto done
        beq     $t3, $zero, done

        la      $t5, array          # fetch a[i]
        sll     $t6, $t1, 2
        add     $t5, $t5, $t6
        lw      $t4, 0($t5)
        
        slt      $t7, $t4, $t0
        bnq      $t7, $zero,MIN

        addi    $t1, $t1, 1         # i++
        j       loop

MIN:    lw      $t0, $t4
        lw      $t8, $t5
        jr $ra

done:   lw      $t7, 0($t5)
        sw      $t7, 0($t8)
        sw      $t4, 0($t5)
        
        li      $v0, 1              # print min element
        move    $a0, $t4
        syscall

        li      $v0, 11             # print newline character
        li      $a0, 0x0a
        syscall

        jr $ra                      # return from main
        
