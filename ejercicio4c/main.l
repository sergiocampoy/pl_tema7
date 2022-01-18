%option noyywrap

%{
// Incluye la tabla de símbolos
#include "y.tab.h"
%}

%%

[A-Z] yylval.lex = yytext[0]; return(MAY);
[a-z] yylval.lex = yytext[0]; return(MIN);
[0-9] yylval.lex = yytext[0]; return(DIG);

[ \t\n] /* Ignores whitespace */;
. fprintf(stderr, "error lexico: %s\n", yytext);

%%
