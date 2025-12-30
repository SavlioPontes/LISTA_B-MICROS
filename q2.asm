.data @ Área de Dados
array: .word 33,4,5,9,90,45,100,49

.text @ Área do Código
.global _start
_start:

	MOV r0,#8 @ tamanho do array
	LDR r1,=array @ registrador(r1) que guarda o endereço do array
	LDR r2,[r1] @ registrador(r2) que vai carregar os elementos do arrya, acessando o valor no endereço do r1
	MOV r3,r2 @ registrador que vai guardar o maior elemento encontrado no momento
	SUB r0,r0,#1 @ diminui o tamanho pois entramaos no loop com o maior valor ja sendo o elemento 0 do array
	
	CMP r0,#1 @ se o array tiver n<=1 elementos o primeiro elem é o maior
	BLE end @ encerra o codigo
	BGT loop @ procura no resto do array o maior elem
	
loop:
	ADD r1,r1,#4 @ avança para o prox elemento do array
	LDR r2,[r1] @ faz o load do r2 no prox elem do array
	CMP r3,r2 @ compara o maior atual(r3) com o atual elem do array
	MOVLT r3,r2 @ se for menor,temos um novo maior elem atual
	SUB r0,r0,#1 @ diminui o tamanho salvo do nosso array
	
	CMP r0,#1 @ se o array nao tiver mais espaço achamos o maior elem
	BLE end
	BGT loop
	
end:
	B end
