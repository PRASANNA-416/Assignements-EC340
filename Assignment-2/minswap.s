# to find minimum value in array and swap with last item 

        .data
        
 array: .word 7 12 5 10 8 9 4 2 15 13
 
 
        .text
        .globl main
        
main:   

        li      $t0, 0              # min = 0
        li      $t1, 0              # i (index) = 0
        li      $t8, 0              #temp variable for swapping

loop:   slti    $t3, $t1, 10         # if i == 10 goto done
        beq     $t3, $zero, done

        la      $s0, array          # base addressof array in $s0 
        sll     $t6, $t1, 2
        add     $s0, $s0, $t6
        lw      $t4, 0($s0)         #here instead of $t4 , maybe $a0
        
        move    $a1,$t4
        la      $a2,$s0
        slt      $t7, $t4, $t0
        bne      $t7, $zero,calmin

        addi    $t1, $t1, 1         # i++
        j       loop

calmin: move    $t0, $a1
        la      $t8, $a2
        jr $ra

done:   lw      $t7, 0($a2)
        sw      $t7, 0($t8)
        sw      $a1, 0($a2)
        
        li      $v0, 1              # print min element
        move    $a0, $a1
        syscall

        li      $v0, 11             # print newline character
        li      $a0, 0x0a
        syscall

        jr $ra                      # return from main
        
