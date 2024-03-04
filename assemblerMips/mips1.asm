.data   # setar a variavel/macro printa 

.macro printa(%str)    	#cria a macro que lé a variavel recebida do usuario

.data             # seta a variavel que recebe string
n1: .asciiz "digite um numero"       # texto a ser lido do macro	


.text				# printa a variável dita e move o numero do usuario para o registrador $t0....etc

	li $v0,4      # printa o valor a ser recebido	
	la $a0, n1   # leva a variavel a ser printada para v0	
	syscall 	# executa

		li $v0,5	#le o valor recebido como inteiro	
		syscall      # executa
		move %str, $v0			# guarda o valor recebido de v0 na variavel $str da macro	

.end_macro     #encerra o macro

.macro printe(%result)         #cria outro macro

	.data						#outra variavel a ser criada	 
		n2: .asciiz "resposta: "		# guardar uma variavel string em n2
	.text               # começa uma nova linha de processos
		li $v0, 4	# printa string		
		la $a0, n2 		# envia a variavel a ser printada a v0
		syscall        #executa
		
		li $v0, 1       #printa uma variavel int
		la $a0, (%result)	# envia o valor armazenado em t0 para a variavel %result para v0 printar o valor na tela
		syscall         #executa
.end_macro         #termina o macro


.text    #  executar os comandos das macros

printa($t1)# guarda o valor recebido do usuario em $t1
printa($t2)# guarda o valor recebido do usuario em $t2
printa($t3)# guarda o valor recebido do usuario em $t3
printa($t4)# guarda o valor recebido do usuario em $t4

add $t1, $t1, $t2 #guarda em t1 a soma do valor de t1 e t2		
add $t3, $t3, $t4 #guarda em t3 a soma do valor de t3 e t4
add $t1, $t1, $t3 #guarda em t1 a soma dos valores somados anteriormente armazenados em t1 e t3

printe($t1)  #printa um valor inteiro armazenado em t1
