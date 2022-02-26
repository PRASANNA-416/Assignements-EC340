# to find minimum value in array and swap with last item 

        .data
        
 array: .word 7 12 5 10 8 9 4 2 15 13
 
 
        .text
        .globl main
        
main:   

        la      $t0, array
        li      $t1, 1
        lw      $s2, 0($t0)
loop:   slti    $t3, $t1, 10         # if i == 10 goto done
        beq     $t3, $zero, done

        lw      $t4, 0($t0)
        slt     $t7, $t4, $s2
        bne     $t7, $zero,Nmin
        addi    $t1, $t1, 1         # i++

Nmin:   
        move    $s2, $t4
        addu    $t0, $t0, 4
        j       loop
        jr      $ra
done:   
        li      $v0, 1              # print min element
        move    $a0, $s2
        syscall

        li      $v0, 11             # print newline character
        li      $a0, 0x0a
        syscall

        jr $ra                      # return from main
        
