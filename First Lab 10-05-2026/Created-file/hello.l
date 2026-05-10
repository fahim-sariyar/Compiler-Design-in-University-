%{
#include<stdio.h>
%}

%%
[\n] {
printf("Hello world\n");}


%%

int yywrap() {
    return 1;
}

int main() {
    yylex();
    return 0;
}
