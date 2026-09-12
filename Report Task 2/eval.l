%{
#include <stdio.h>
#include <stdlib.h>
#include "eval.tab.h"
%}

%%

[0-9]+              { yylval = atoi(yytext); return NUMBER; }
[+\-*/()]           { return yytext[0]; }
[ \t\n]+            ;
.                   { return yytext[0]; }

%%

int yywrap(void)
{
    return 1;
}
