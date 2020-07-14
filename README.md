# Lex y Yacc
Comandos para crear y ejecutar en Ubuntu 

```
lex calc.l
bison calc.y -dy
gcc -ocal lex.yy.c calc.tab.c -ll
./cal
```



Lex y Yacc los estoy usando para generar una gramatica como la del lenguaje de programacion C.
En el archivo calc.l es donde tengo toda la deteccion de tokens y lo que regresan.

```
"if"	{return IF;}
"while"	{return WHILE;}
"printf" {return PRINT;}
["]	{return COMILLA;}
"void" {return VOID;}
"int" {return NUMBER;}
[0-9]+ {
	yylval=yytext[0]; return INT;
}
[,]	{return COMA;}
[{]	{return LLLAVE;}
[}]	{return RLLAVE;}
[(]	{return LPARE;}
[)]	{return RPARE;}
[;]	{return PC;}
[a-z][_a-zA-Z0-9]*^$& {
	return ID;
}
[=] {
	return IGUAL;
}
[+] { return SUMA; }
[\n] { return EOL; }
([a-zA-Z0-9]+\s)*	{return STRING;} 
. ;
```
Estos son los tokens que detecto.

En el archivo calc.y tengo todas la gramatica y las posible conbinaciones que son posible.

```

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
 
```