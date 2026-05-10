%{
#include<stdio.h>
%}

%%
[b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z]   { printf("%s is a consonant\n", yytext); }
[aeiouAEIOU]                       { printf("%s is a vowel\n", yytext); }
[ \t\n]                            ;
.                                  { printf("Invalid input\n"); }
%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter letters:\n");
    yylex();
    return 0;
}
