# defining array,loading RGB values and convrting to grey
        .data

array:  .word 0x00123456 0x00FFFFFF 0x00111111 0x001B5DF0

        .text
        .globl main

main:   

        ## for(i=0; i<4; i++);
        ##    rgb2grey();

        li      $t0, 0              # i (index) = 0
	  la     $t1, array 		# base address of array stored in t1


loop:   slti $t2, $t0, 4
	   beq $t2,$zero, done

         lw     $a1, 0($t1)		# fetch rgbword[i] into arguement
         addi    $t1, $t1, 4		# increment address
	   addi   $t0,$t0,1		# index++

	   addi $sp,$sp,-12				# saving vars to stack
	   sw	    $t0,8($sp)
	   sw	    $t1,4($sp)
	   sw	    $t2,0($sp)
	   jal rgb2grey
								# restoring vars

	   addi $sp,$sp,12
	   lw	    $t0,-4($sp)
	   lw	    $t1,-8($sp)
	   lw	    $t2,-12($sp)

	   j loop
rgb2grey:	
		addi $t0,$zero,0xff
		add $t1,$zero,$a1 # taking arguement to $t1 to use
		and $t2,$t0,$t1	# blue
		srl $t1,$t1,8	
		and $t3,$t0,$t1	# green
		srl $t1,$t1,8
		and $t4,$t0,$t1	# red
		
		add $t2,$t2,$t3	# blue+green
		add $t2,$t2,$t4	# blue+green+red
		addi $t5,$zero,3
		divu $t2,$t5

		mflo $v1

		li $v0,1    #prepare system call 
		move $a0,$a1 #copy a1 to a0 
		syscall      #print RGB 

		li      $v0, 11      # print space character
        	li      $a0, 0x20
        	syscall

		li $v0,1     #prepare system call 
		move $a0,$v1 #copy v1 to a0 
		syscall      #print grey 

		li      $v0, 11      # print newline character
        	li      $a0, 0x0a
        	syscall

		j $ra		 #return to main

		
	   

done:   

        jr $ra                      # return from main
