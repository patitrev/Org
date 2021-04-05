	.data
vetor:	.word	3,-3,2,10,5,-34,0,6
msg_virgula:
	.asciz	", "
msg_nova_linha:
	.asciz "\n"
	.text
main:
	la a4, vetor		#referencia o endereço inicial do vetor em a4
	li a1, 28		#a1 recebe o tomanho do vetor
	jal f_imprime		#imprime o vetor inicial
	
	add a3,a4,a1		#endereço limite para fazer as comparações na função
	
f_bubble:			#função bubble sort para ordenar o vetor de forma crescente
	mv a2,a4		#adiciona o endereço inicial do vetor em a2 para poder percorrer dentro do loop
	beq a2,a3,fim_f_bubble	#vetor já está ordenado
loop:
	beq a2,a3,fim_loop	
	lw t0,0(a2)		#adiciona oss valores em t0 e t1 para comparar
	lw t1,4(a2)
	blt t0,t1, no_swap	#se já tiverem ordenados não faz swap
	sw t1,0(a2)		
	sw t0,4(a2)		#se não estiverem em ordem troca os dois valores dentro do vetor
no_swap:
	addi a2,a2,4		# vai para a proxima posição do vetor para ser analizada no loop
	j loop
fim_loop:	
	addi a3,a3,-4		#"ultimo" elemnto já está ordenado começa a ordenar o próximo
	j f_bubble		
fim_f_bubble:
	jal f_imprime
	j fim

f_imprime:
	mv a2,a4
	add a3,a4,a1
loop_imprime:
	blt a3,a2, fim_imprime
	lw s3,0(a2)
	add 	a0, zero, s3  # imprime inteiro
	li 	a7, 1
	ecall
	la 	a0, msg_virgula  # imprime virgula para separar
	li 	a7,4
	ecall
	addi a2,a2,4
	j loop_imprime
fim_imprime:
	la 	a0, msg_nova_linha  # imprime nova linha
	li 	a7, 4
	ecall	
	
	ret 
fim:	nop



	
	