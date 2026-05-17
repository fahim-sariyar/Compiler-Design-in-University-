%{
#include <stdio.h>

int vowel = 0;
int consonant = 0;
int total = 0;
%}

%%

[aAeEiIoOuU]   { vowel++; total++; }

[a-zA-Z]       { consonant++; total++; }

[0-9]          { total++; }

[ \t]          { total++; }

\n             { return 0; }

.              { total++; }

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter a string : ");
    yylex();

    printf("Total Vowels      : %d\n", vowel);
    printf("Total Consonants  : %d\n", consonant);
    printf("Total Characters  : %d\n", total);

    return 0;
}
