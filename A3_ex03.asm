	.data
matriz:
	.word	0,	3,	5,	1,	4
		-1,	2,	-1,	1,	-1
		7,	-1,	21,	0,	-8
	.text
main:
	la a0,matriz
	li a1,5
	li a2,3
	li a3,0
multipica_linha_por_coluna:
	beq a3,a2,fim_multiplica
	add a4,a4,a1
	addi a3,a3,1
	j multipica_linha_por_coluna
fim_multiplica:
	#addi a1,a1,-1
	slli a4,a4,2
	add a4,a4,a0
	addi s3,zero,0
	addi s4,zero,-1
percorre_matriz:
	beq a0,a4,resultado
	lw t1,0(a0)
	bne t1,s4, n_eh
	addi s3,s3,1
n_eh:	
	addi a0,a0,4
	j percorre_matriz
resultado:
	mv a0,s3
	nop
