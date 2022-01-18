%option noyywrap

%{
// Incluye la tabla de símbolos
#include "y.tab.h"
%}

%%

a return(A);
b return(B);
c return(C);


[ \t\n] /* Ignores whitespace */;
. fprintf(stderr, "error lexico: %s\n", yytext);

%%
