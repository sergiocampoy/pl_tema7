%option noyywrap

%{
// Incluye la tabla de símbolos
#include "y.tab.h"
%}

%%

[Aa]     return(A);
[Bb]     return(BE);
[Cc]     return(CE);
\(       return(APAR);
\)       return(CPAR);
[0-9]*   yylval.valor = atoi(yytext); return(LIT);


[ \t\n]  /* Ignores whitespace */;
.        fprintf(stderr, "error lexico: %s\n", yytext);

%%
