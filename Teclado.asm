.data 
     
.text
		playsound:	
	li $a0, 65	#note
    	li $a1, 1000	#time
    	li $a2, 114	#instrument
    	li $a3, 120	#volume	

    	la $v0, 33

    	syscall                #calls service 33, playing music
