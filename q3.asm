.global _start
_start:
	MOV r0,#28 @ registrador que contem o numero desejado
	MOV r1,#1 @ somador dos divisores(sem considerar o zero,todo numero ja é divisivel por 1)
	MOV r2,#2 @ registrador que vai ate 28 para descobrir os divisores ( a partir do 2, pois ja consideramos o 1)
	
	B loop @ inicia o loop para cada numero 
	
loop:
	 UDIV r3,r0,r2 @ r0/r2 = n = r3
	 MUL r3,r3,r2 @ r3*r2 é o nosso numero do resultado inteiro da multiplicação com o dividendo,queremos resto = 0
	 SUBS r3,r3,r0 @ resto = 28 - r3*r2 atualiza a zero flag,se o resto for 0 ele adiciona o divisor(r2) na soma
	 ADDEQ r1,r1,r2
	 
	 ADD r2,r2,#1 @ incrementa o contador
	 
	 CMP r2,r0 @ compara se o contador já esta no dividendo max(28)
	 BLE loop
	 
	 CMP r1,r0 @ se o nosso somatorio dos dividendos for igual ao r0 = 28, temos um numero perfeito!
	 BEQ n_perfeito
	 BNE n_imperfeito
	 
n_perfeito:
	B n_perfeito
	
n_imperfeito:
	B n_imperfeito
