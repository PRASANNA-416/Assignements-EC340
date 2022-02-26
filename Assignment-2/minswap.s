# to find minimum value in array and swap with last item 

        .data
        
 array: .word 7 12 5 10 8 9 4 2 15 13
 
 
        .text
        .globl main
        
main:   

        la      $s0, array
        li      $t1, 1
        lw      $s2, 0($s0)
loop:   slti    $t3, $t1, 10         # if i == 10 goto done
        beq     $t3, $zero, done

        lw      $t4, 0($s0)
        slt     $t6, $t4, $s2
        bne     $t6, $zero,Nmin
        addi    $t1, $t1, 1         # i++
        addu    $s0, $s0, 4
        j       loop

Nmin:   
        move    $s2,$t4
        add     $s3,$t1,$zero
        #lw     $s3,0($s0)
        j       loop

done:   
        lw      $t5, 0($s0)
        sw      $s2, 0($s0)
        nor     $s3, $s3, $zero
        addi    $s3,$s3,1
        addi    $s3, $s3,10
        sll     $s3 , $s3 , 2
        nor     $s3,  $s3, $zero
        addi    $s3, $s3,1
        add     $s0 ,$s0, $s3
        sw      $t5, 0($s0)

        
        li      $v0, 1              # print min element
        move    $a0, $s2
        syscall

        li      $v0, 11             # print newline character
        li      $a0, 0x0a
        syscall

        jr $ra                      # return from main
        

