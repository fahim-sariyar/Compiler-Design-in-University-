%option noyywrap

%{
#include "validity.tab.h"
%}

%%

[0-9]+          { return NUMBER; }
[+\-*/()]        { return yytext[0]; }
[ \t\n]+         ;
.                { return yytext[0]; }

%%
