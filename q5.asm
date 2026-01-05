.data @ Área de Dados
string: .asciz "socorrammesubinoonibusemmarrocos" @ String a ser analisada

.text @ Área do Código
.global _start
_start:
	LDR r0,=string @ Carrega o endereço da string no r0
	MOV r1,r0 @ r1 será levado ao ultimo caractere 
	
fim_string:
	LDRB r2,[r1] @ carrega o caractere endereçado em r1
	CMP r2,#0 @ verifica se o caractere atual é o vazio '/0'
	
	SUBEQ r1,r1,#1 @ caso r1 endereçe o vazio,subtraimos em 1 para ele represewntqar o ultimo caractere
	BEQ check
	
	ADD r1,r1,#1 @ Avança para o prox caractere
	B fim_string
	
check:
	CMP r0,r1 @ compara o dois ponteiros (r0 -> esq para dir e r1 -> dir para esq)
	BGE palindromo @ caso os ponteiros sejam iguais ou se cruzarem, ele reconhece como palindromo
	
	LDRB r2,[r0] @ r2 = string[r0]
	LDRB r3,[r1] @ r3 = string[r1]
	CMP r2,r3 @ compara os caracteres,se forem diferentes = não é palindromo
	BNE nao_palindromo
	
	ADD r0,r0,#1 @ avança um caractere para direita
	SUB r1,r1,#1 @ volta um caractere para esquerda
	B check
	
palindromo:
	B palindromo

nao_palindromo:
	B nao_palindromo
