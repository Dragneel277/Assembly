%include '/home/dragneel277/Desktop/Assembly/lib.inc'

section .data
	msg_num1 db 'Introduza o numero 1',0xA,0xD
    tam_msg1 equ $- msg_num1

    msg_num2 db 'Introduza o numero 2',0xA,0xD
	tam_msg2 equ $- msg_num2

    msg_num3 db 'O resultado da divisão -> '
	tam_msg3 equ $- msg_num3


section .bss
num1 resb 2
num2 resb 2
res resb 1

section	.text
	
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


   mov ax ,[num1]
   sub ax ,'0'
	
   mov bl ,[num2]
   sub bl ,'0'

   div bl
   add ax ,'0'
	
   mov  [res], ax 

   ;ASKS FOr first value
	mov eax, OP_WRITE ;instrui sobre a necessidade da fazer uma saída
	mov ebx, OUTPUT ;Específica que se deve usar o mecanismo de saída padrão
	mov ecx, msg_num3 ; A especificaçºao da mensagem que se pretende imprimir
	mov edx, tam_msg3 ; O tamanho da mensagem que se pretende imprimir
	int SYS_CALL ; Autorização de interrupção (call kernel)
	
   mov	ecx,res
   mov	edx, OUTPUT
   mov	ebx,OUTPUT	;file descriptor (stdout)
   mov	eax,OP_WRITE	;system call number (sys_write)
   int  SYS_CALL	;call kernel
	
   mov	eax,OUTPUT	;system call number (sys_exit)
   int	SYS_CALL	;call kernel
