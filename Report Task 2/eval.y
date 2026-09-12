%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%token NUMBER

%%

input:
      expr { printf("Result = %d\n", $1); }
    ;

expr:
      expr '+' term   { $$ = $1 + $3; }
    | expr '-' term   { $$ = $1 - $3; }
    | term            { $$ = $1; }
    ;

term:
      term '*' factor { $$ = $1 * $3; }
    | term '/' factor {
                        if ($3 == 0) {
                            yyerror("Division by zero");
                            $$ = 0;
                        } else {
                            $$ = $1 / $3;
                        }
                      }
    | factor          { $$ = $1; }
    ;

factor:
      NUMBER          { $$ = $1; }
    | '(' expr ')'    { $$ = $2; }
    ;

%%

void yyerror(const char *s)
{
    printf("Error: %s\n", s);
}

int main()
{
    return yyparse();
}
