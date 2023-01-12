section .data
gender DB 'M'
section .text
   	global _start        	
_start:                   			;ponto de inicialização
   	mov	edx,1		 	;tamanho da mensagem
   	mov	ecx, gender    ;a mensagem
   	mov	ebx,1		  	;definição de saída padrão
   	mov	eax,4		  	;chamada do sistema para escrita
   	int	0x80		  		;call kernel

   	mov	eax,1		  	;chamada do sistema para sair (sys_exit)
   	int	0x80		  		;call kernel