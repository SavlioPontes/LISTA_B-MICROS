.data
array: .word 2, 5, 8, 12, 16, 23, 38, 56, 72, 91

.text
.global _start
_start:
    LDR r0, =array     @ base do array
    MOV r1, #0         @ inicio 
    MOV r2, #9         @ fim 
    MOV r3, #23        @ valor procurado

busca:
    CMP r1, r2 @ Caso o valor do inicio seja maior que o fim não tem array valido para a busca
    BGT nao_encontrado

    ADD r4, r1, r2	   @ r4 = (inicio + fim)
    LSR r4, r4, #1     @ meio = r4/2

    LSL r6, r4, #2     @ mov do endereço = meio * 4
    LDR r5, [r0, r6]   @ array[meio] = ele parte do primeiro elemento e passa ate o elem desejado r5  r0+r6

    CMP r5, r3 @ elem = array[meio] comparado com o valor desejado
    BEQ encontrado
    BLT maior          @ valor > array[meio]
    BGT menor          @ valor < array[meio]

maior:
    ADD r1, r4, #1     @ inicio = meio + 1
    B busca

menor:
    SUB r2, r4, #1     @ fim = meio - 1
    B busca

encontrado:
    B encontrado       @ achou (r4 tem o índice)

nao_encontrado:
    B nao_encontrado @ o inicio foi maior que o fim,vasculhamos e não achamos o valor desejado
	
