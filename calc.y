%{
#include <stdio.h>

void yyerror(char *c);
int yylex(void);

%}

%token INT SUMA EOL ID IGUAL NUMBER PC VOID LPARE RPARE LLLAVE RLLAVE COMA STRING PRINT COMILLA IF WHILE

%%

PROGRAMA: 
	PROGRAMA EXPRESSION EOL;
	 |
EXPRESSION:
	|INT
	|NUMBER ID IGUAL ID PC  {printf("Asignacion valida\n");}
	|ID IGUAL ID PC	{printf("Asignacion valida\n");}
	|ID IGUAL EXPRESSION PC {printf("Asignacion valida\n");}
	|DECLARACION
	|METODO
	|NUMBER ID IGUAL DATO SUMA DATO PC {printf("Asignacion \n");}
	|ID IGUAL DATO SUMA DATO PC {printf("Asignacion\n");}
	|PRINT LPARE STRING RPARE PC {printf("ES UN PRINT");}
	|CICLOW
	|DECISION
;	
DATO:	INT
	|ID;
DECLARACION:
	ID
	|NUMBER DECLARACION PC	{printf("Declaracion\n");}
	|NUMBER DECLARACION COMA DECLARACION PC {printf("DELCARACION \n");}
	|IDCOMA DECLARACION
	|IDCOMA
	
IDCOMA:ID COMA 
CICLOW: WHILE LPARE EXPRESSION RPARE BLOQUE {printf("CICLO WHILE\n");}
	|WHILE LPARE RPARE BLOQUE {printf("CICLO WHILE\n");}
DECISION: IF LPARE DECLARACION RPARE BLOQUE {printf("IF\n");}
METODO: VOID ID LPARE DECLARACION RPARE BLOQUE	{printf("DECLARACION DE METODO\n");}
	|VOID ID LPARE RPARE BLOQUE {printf("METODO DECLARADO\n");}
;
BLOQUE: LLLAVE EXPRESSION RLLAVE	{printf("Bloque de codigo\n");}
 
%%

void yyerror(char *c){
	printf("Cadena no valida %s\n",c);
}

int main (){
while(1){
 yyparse();
}
 return 0;
}

