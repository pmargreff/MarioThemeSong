.data 
message1: .asciiz"Digite o número correspondente ao instrumento:\n1 - Piano \n2 - Xilofone \n3 - Flauta \n4 - Teclado com efeitos"
message2: .asciiz"Número inválido, digite novamente:\n1 - Piano \n2 - Xilofone \n3 - Flauta \n4 - Teclado com efeitos"
notes:	.word 64,64,72,64,67,55,72,55,52,57,59,58,57,55,64,67,69,65,67,64,72,62,59,72,55,52,57,59,58,57,55,64,67,69,65,67,64,72,62,59,67,66,65,63,64,56,57,72,57,72,62,67,66,65,63,64,72,72,72,67,66,65,63,64,56,57,72,57,72,62,63,62,72,67,66,65,63,64,56,57,72,57,72,62,67,66,65,63,64,72,72,72,67,66,65,63,64,56,57,72,57,72,62,63,62,72,72,57,72,62,64,72,57,55,72,57,72,62,64,72,57,72,62,64,72,57,55,72,57,72,72,62,64,64,72,55,56,57,65,65,57,59,69,69,69,67,65,64,72,57,55,64,72,55,56,57,65,65,57,59,65,65,65,64,62,72,64,72,55,56,65,65,57,59,69,69,69,67,65,64,72,57,55,64,72,55,56,57,65,65,57,59,65,65,65,64,62,72,72,57,72,62,64,72,57,55,72,57,72,62,64,72,57,72,62,64,72,57,55,64,64,64,72,64,67,55,72,55,52,57,59,57,56,59,57,55
pauseTime:  .word 40,40,100,40,40,100,40,40,160,100,40,100,40,40,40,40,40,40,40,100,40,40,40,40,40,160,100,40,100,40,40,40,40,40,40,40,100,40,40,40,160,40,40,40,40,40,100,40,100,40,40,160,40,40,40,40,40,100,40,40,220,40,40,40,40,40,40,40,100,40,40,160,100,40,270,40,40,40,40,40,40,40,100,40,40,160,40,40,40,40,100,40,40,160,40,40,40,40,100,40,40,100,40,40,160,100,40,220,40,40,100,40,40,40,40,40,100,40,40,100,40,40,40,320,40,40,100,40,40,40,40,40,100,40,40,100,40,40,100,100,40,160,100,40,100,40,40,40,40,40,40,40,100,40,40,40,40,40,160,100,40,100,40,40,40,40,40,40,40,100,40,40,40,40,40,40,160,40,40,40,40,40,100,40,40,40,40,40,40,40,40,40,100,40,40,100,40,40,40,40,100,40,40,40,40,40,40,270,40,40,100,40,40,40,40,40,100,40,40,40,40,40,40,40,40,40,100,40,40,160,40,40,40,40,40,100,40,40,40,40,40,40,220,40,40,100,40,40,40,40,40,100,40,40,100,40,40,270,40,40,100,40,40,40,40,100,40,40,100,40,40,100,100,40,40,160,40,40,40,40,40,100,40,40,40,40,40,40,40,40,100,40,40,100,40,40,40,100,40,40,40,40,40,40
noteTime: .word 100,180,100,100,180,250,250,250,100,180,180,100,100,180,100,100,100,180,100,100,180,100,100,250,250,180,100,180,180,100,100,180,100,100,100,180,100,100,180,100,100,250,100,100,100,180,100,100,100,100,100,100,100,100,100,100,180,100,180,100,250,100,100,100,180,100,100,100,100,100,100,100,180,250,250,100,100,100,180,100,100,100,100,100,100,100,100,100,180,100,180,100,250,100,100,100,180,100,100,100,100,100,100,100,180,250,250,100,180,100,100,180,100,180,100,250,100,180,100,100,100,100,100,180,100,100,180,100,180,100,250,100,180,100,100,180,250,250,250,100,180,180,100,100,180,100,100,100,180,100,100,180,100,100,250,250,100,180,180,100,100,180,180,180,100,180,100,100,180,100,100,250,100,180,100,180,100,180,100,250,180,100,180,180,100,100,180,100,250,100,180,100,180,100,180,100,250,100,180,100,180,180,100,250,100,180,100,180,100,180,100,250,180,180,100,180,180,100,100,180,100,250,100,180,100,180,100,180,100,250,100,180,100,180,180,100,250,100,180,100,100,180,100,180,100,250,100,180,100,100,100,100,100,180,100,100,180,100,180,100,250,100,180,100,100,180,250,250,100,180,100,180,100,180,100,250,180,180,100,180,180,100,100,180,100,250,100,180,100,180,100,180,100,250,100,180,100,180,180,100,250
#notes: .byte 64
filein: .asciiz "entrada.txt"      # filename for input

.text

la $a0, message1
ori $v0, 51
syscall

INVALIDA:move $t2, $a0 #preenche com instrumentos 
beq $t2, 1, PIANO
nop
beq $t2, 2, XILOFONE
nop
beq $t2, 3, FLAUTA
nop
beq $t2, 4, TECLADO
nop

#opção invalida.
la $a0, message2
ori $v0, 51
syscall
j INVALIDA
nop

PIANO: ori $t2, $zero, 2
j OK
nop
XILOFONE: ori $t2, $zero, 10
j OK
nop
FLAUTA: ori $t2, $zero, 70
j OK
nop
TECLADO: ori $t2, $zero, 100
OK: nop



#open a file for reading
#li   $v0, 13       	# system call for open file
#la   $a0, filein      	# board file name
#li   $a1, 0	        # Open for reading
#li   $a2, 0
#syscall            	# open a file (file descriptor returned in $v0)
#move $s6, $v0      	# save the file descriptor 


#read from file
#li   $v0, 14       	# system call for read from file
#move $a0, $s6      	# file descriptor 
#la   $a1, notes   	# address of buffer to which to read
#li   $a2, 64  		# hardcoded buffer length
#syscall            	# read from file

# Close the file 
#li   $v0, 16       	# system call for close file
#move $a0, $s6      	# file descriptor to close
#syscall            	# close file

#convert notes to integers
#la $t0, notes
#lw $t1, ($t0)		#load the first byte

#convert:
#srl $t1, $t1, 24	#desloca 24 bits para a esquerd
#sw $t1, ($t0)
#addi, $t0, $t0, 4
#lw $t1, ($t0)
#bne $t1, $zero, convert
#nop 

la $t0, notes	#load notes adress
lw $t1, ($t0)	#load first note

la $t6, pauseTime
lw $t3, ($t6)

la $t4, pauseTime
lw $t5, ($t4)
		noteLoop:
jal playsound	#call the playsound function
nop	

jal pause
nop
	afterPlaysound:
addi $t0, $t0, 4	#move pointer to next world
addi $t6, $t6, 4
addi $t4, $t4, 4
lw $t1, ($t0)		#load the note
lw $t3, ($t6)
lw $t5, ($t4)

bne $t4, $zero noteLoop
nop

j end
nop

	playsound:	
move $a0, $t1
move $a1, $a3	#time in milisseconds
move $a2, $t2	#instrument selecionado
li $a3, 120	#volume	
la $v0, 33
#2 piano, 10 chromatic percussion, 70 Reed , 100 synth effects, 
syscall         #calls service 33, playing music
jr $ra		#come back afterPlaysound
nop

	pause:
move $a0, $t3
li $v0, 32
syscall 
jr $ra
nop

#stop the pregram	
	end:
li $v0, 10
syscall
