%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);

int valid = 1;
%}

%token NUMBER

%%

input:
      expr
    ;

expr:
      expr '+' term
    | expr '-' term
    | term
    ;

term:
      term '*' factor
    | term '/' factor
    | factor
    ;

factor:
      NUMBER
    | '(' expr ')'
    ;

%%

void yyerror(const char *s)
{
    valid = 0;
}

int main()
{
    yyparse();

    if (valid)
        printf("Valid Expression\n");
    else
        printf("Invalid Expression\n");

    return 0;
}
