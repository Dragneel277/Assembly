%include '/home/dragneel277/Desktop/Assembly/lib.inc'
section .data
	msg_num1 db 'Introduza o numero 1',0xA,0xD
    tam_msg1 equ $- msg_num1
    msg_num2 db 'Introduza o numero 2',0xA,0xD
	tam_msg2 equ $- msg_num2
    msg_resultado db 'O resultado da soma é : '
    tam_msg_res equ $- msg_resultado

section .bss
    num1 resb 2
    num2 resb 2
    resultado resb 1

section .text

global _start
_start:

    ;ASKS FOr first value
	mov eax, OP_WRITE ;instrui sobre a necessidade da fazer uma saída
	mov ebx, OUTPUT ;Específica que se deve usar o mecanismo de saída padrão
	mov ecx, msg_num1 ; A especificaçºao da mensagem que se pretende imprimir
	mov edx, tam_msg1 ; O tamanho da mensagem que se pretende imprimir
	int SYS_CALL ; Autorização de interrupção (call kernel)

    ;INPUT the first number
    mov eax, OP_READ ;Instrui sobre a necessidade de fazer entrada
    mov ebx, INPUT ;
    mov ecx, num1;
    mov edx, 2;
    int SYS_CALL;

    ;ASKS FOR THE 2 VALUE
	mov eax, OP_WRITE ;instrui sobre a necessidade da fazer uma saída
	mov ebx, OUTPUT ;Específica que se deve usar o mecanismo de saída padrão
	mov ecx, msg_num2 ; A especificaçºao da mensagem que se pretende imprimir
	mov edx, tam_msg2 ; O tamanho da mensagem que se pretende imprimir
	int SYS_CALL ; Autorização de interrupção (call kernel)

    ;INPUT the second number
    mov eax, OP_READ ;Instrui sobre a necessidade de fazer entrada
    mov ebx, INPUT ;
    mov ecx, num2;
    mov edx, 2;
    int SYS_CALL;



    ;=========MOvintar Valores Para os registadores
    mov eax, [num1];Movimentar o Valor Direto em num1 para eax;
    sub eax, '0';
    mov ebx, [num2];Movimentar o Valor Direto em num2 para ebx;
    sub ebx, '0';

    ;========Adicionar o valor 
    add eax, ebx;  adicionar ebx em eax
    add eax, '0';
    mov [resultado],eax;


   
     ;====Prints final Result
	mov eax, OP_WRITE ;instrui sobre a necessidade da fazer uma saída
	mov ebx, OUTPUT ;Específica que se deve usar o mecanismo de saída padrão
	mov ecx, msg_resultado ; A especificaçºao da mensagem que se pretende imprimir
	mov edx, tam_msg_res ; O tamanho da mensagem que se pretende imprimir
	int SYS_CALL ; Autorização de interrupção (call kernel)

    ;====Prints final Result
	mov eax, OP_WRITE ;instrui sobre a necessidade da fazer uma saída
	mov ebx, OUTPUT ;Específica que se deve usar o mecanismo de saída padrão
	mov ecx, resultado ; A especificaçºao da mensagem que se pretende imprimir
	mov edx, 1 ; O tamanho da mensagem que se pretende imprimir
	int SYS_CALL ; Autorização de interrupção (call kernel)


    ;=========Chamada SAida DO Programa
	mov eax, 0x1 ;Pedido de saída do programa
	mov ebx, 0x0 ;O valor do retorno do sistema
	int SYS_CALL ; Autorização de interrupção (call kernel)
