.data 
notes:	.word 64,64,64,60,64,67,55,72,55,52,69,71,70,69,55 #array with notes
    
.text
	la $t0, notes	#load notes adress
	lw $t1, ($t0)	#load first note

		noteLoop:
	jal playsound	#call the playsound function
	
		afterPlaysound:
	addi $t0, $t0, 4	#move pointer to next world
	lw $t1, ($t0)		#load the note

	bne $t1, $zero noteLoop
	nop
	
	j end
	nop
		
		playsound:	
	move $a0, $t1
    	li $a1, 150	#time in milisseconds
    	li $a2, 114	#instrument - 114 Percussion
    	li $a3, 120	#volume	

    	la $v0, 33

    	syscall                #calls service 33, playing music

	jr $ra	#come back afterPlaysound
	nop
	
		end:
	li $v0, 10
	syscall