section .data
	msg_entrada db 'Introduza o seu nome: ',0xA ,0xD
    tam_e equ $- msg_entrada
    msg_saida db 'O nome Inserido é: '
    tam_s equ $- msg_saida


section .bss
section .text
global _start
_start:
	mov EAX, 0x4 ;instrui sobre a necessidade da fazer uma saída
	mov EBX, 0x1 ;Específica que se deve usar o mecanismo de saída padrão
	mov ECX, msg_entrada ; A especificaçºao da mensagem que se pretende imprimir
	mov EDX, tam_e ; O tamanho da mensagem que se pretende imprimir
	int 0x80 ; Autorização de interrupção (call kernel)

    mov EAX, 0x4 ;instrui sobre a necessidade da fazer uma saída
	mov EBX, 0x1 ;Específica que se deve usar o mecanismo de saída padrão
	mov ECX, msg_saida ; A especificaçºao da mensagem que se pretende imprimir
	mov EDX, tam_s ; O tamanho da mensagem que se pretende imprimir
	int 0x80 ; Autorização de interrupção (call kernel)

	mov EAX, 0x1 ;Pedido de saída do programa
	mov EBX, 0x0 ;O valor do retorno do sistema
	int 0x80 ; Autorização de interrupção (call kernel)
