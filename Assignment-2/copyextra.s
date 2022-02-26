
	.data
arraysrc: .word 1 2 3 4 5 6 7 8 9 10

	.text
	.globl main


main:
	la $s0, arraysrc
	la $t0, 0x10010050

	li $t1,0 #index
loop:
	slti $t2,$t1,10
	beq $t2,$zero,done

	lw $t3,0($s0)
	sw $t3,0($t0)

	addi $s0,$s0,4
	addi $t0,$t0,4
	addi $t1,$t1,1
	j loop

done:

	jr $ra

