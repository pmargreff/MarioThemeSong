.data 
message1: .asciiz"Digite o número correspondente ao instrumento:\n1 - Piano \n2 - Xilofone \n3 - Flauta \n4 - Teclado com efeitos"
message2: .asciiz"Número inválido, digite novamente:\n1 - Piano \n2 - Xilofone \n3 - Flauta \n4 - Teclado com efeitos"
#notes:	.word 64,64,60,64,67,55,72,55,52,57,59,58,57,55,64,67,69,65,67,64,60,62,59,60,55,52,57,59,58,57,55,64,67,69,65,67,64,60,62,59,67,66,65,63,64,56,57,60,57,60,62,67,66,65,63,64,72,72,72,67,66,65,63,64,56,57,60,57,60,62,63,62,60,67,66,65,63,64,56,57,60,57,60,62,67,66,65,63,64,72,72,72,67,66,65,63,64,56,57,60,57,60,62,63,62,60,60,57,60,62,64,60,57,55,60,57,60,62,64,60,57,60,62,64,60,57,55,60,57,60,60,62,64,64,60,55,56,57,65,65,57,59,69,69,69,67,65,64,60,57,55,64,60,55,56,57,65,65,57,59,65,65,65,64,62,60,64,60,55,56,65,65,57,59,69,69,69,67,65,64,60,57,55,64,60,55,56,57,65,65,57,59,65,65,65,64,62,60,60,57,60,62,64,60,57,55,60,57,60,62,64,60,57,60,62,64,60,57,55,64,64,64,60,64,67,55,60,55,52,57,59,57,56,59,57,55,0
notes: .word 55,55,58,60,55,55,53,54,55,55,58,60,55,55,53,54,72,69,64,72,57,51,72,57,50,72,62,58,55,66,59,55,65,58,55,64,63,62,63,72,55,63,72,54,63,72,53,51,53,58,55,62,58,55,61,58,55,72,53,55,63,72,55,63,72,54,63,72,53,51,53

filein: .asciiz "mario.txt"      # filename for input
#notes: .word 256
.text

#call the first message
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
#li   $a2, 1200	# hardcoded buffer length
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

		noteLoop:
jal playsound	#call the playsound function
nop	
	afterPlaysound:
addi $t0, $t0, 4	#move pointer to next world
lw $t1, ($t0)		#load the note

bne $t1, $zero noteLoop
nop

j end
nop

	playsound:	
move $a0, $t1	#note
li $a1, 400
move $a2, $t2	#instrument selecionado
li $a3, 120	#volume	
la $v0, 33
, 
syscall         #calls service 33, playing music
jr $ra		#come back afterPlaysound
nop

#stop the pregram	
	end:
li $v0, 10
syscall
