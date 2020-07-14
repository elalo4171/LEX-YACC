%{
#include <stdio.h>
#include <string.h>

void yyerror(char *c);
#include "y.tab.h"

%}

%%

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

%%

int yywrap(){
return 1;
}

