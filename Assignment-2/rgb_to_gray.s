pixels:
        .word   65536
        .word   65793
        .word   6
        .word   13107
        .word   780
        .word   7342163
        .word   2705817
        .word   -1
rgb_to_gray:
        addiu   $sp,$sp,-8
        sw      $fp,4($sp)
        move    $fp,$sp
        sw      $4,8($fp)
        sw      $5,12($fp)
        sw      $6,16($fp)
        lw      $3,8($fp)
        lw      $2,12($fp)
        nop
        addu    $3,$3,$2
        lw      $2,16($fp)
        nop
        addu    $3,$3,$2
        li      $2,3                        # 0x3
        div     $0,$3,$2
        bne     $2,$0,1f
        nop
        break   7
        mfhi    $2
        mflo    $2
        move    $sp,$fp
        lw      $fp,4($sp)
        addiu   $sp,$sp,8
        jr      $31
        nop

main:
        addiu   $sp,$sp,-56
        sw      $31,52($sp)
        sw      $fp,48($sp)
        move    $fp,$sp
        sw      $0,24($fp)
        b       $L4
        nop

$L5:
        lui     $2,%hi(pixels)
        lw      $3,24($fp)
        nop
        sll     $3,$3,2
        addiu   $2,$2,%lo(pixels)
        addu    $2,$3,$2
        lw      $2,0($2)
        nop
        sw      $2,28($fp)
        lw      $2,28($fp)
        nop
        andi    $2,$2,0xff
        sw      $2,32($fp)
        lw      $2,28($fp)
        nop
        sra     $2,$2,8
        andi    $2,$2,0xff
        sw      $2,36($fp)
        lw      $2,28($fp)
        nop
        sra     $2,$2,16
        andi    $2,$2,0xff
        sw      $2,40($fp)
        lw      $6,32($fp)
        lw      $5,36($fp)
        lw      $4,40($fp)
        jal     rgb_to_gray
        nop

        sw      $2,44($fp)
        lw      $2,24($fp)
        nop
        addiu   $2,$2,1
        sw      $2,24($fp)
$L4:
        lui     $2,%hi(pixels)
        lw      $3,24($fp)
        nop
        sll     $3,$3,2
        addiu   $2,$2,%lo(pixels)
        addu    $2,$3,$2
        lw      $3,0($2)
        li      $2,-1                 # 0xffffffffffffffff
        bne     $3,$2,$L5
        nop

        move    $2,$0
        move    $sp,$fp
        lw      $31,52($sp)
        lw      $fp,48($sp)
        addiu   $sp,$sp,56
        jr      $31
        nop
