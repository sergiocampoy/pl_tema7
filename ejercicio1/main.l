%option noyywrap

%{
// Incluye la tabla de símbolos
#include "y.tab.h"
%}

%%

"("     return(ABRE);
")"     return(CIERRA);
"."     return(FIN);
[0-9]+  return(LIT);

[ \t\n] /* Ignores whitespace */;
. fprintf(stderr, "error lexico: %s\n", yytext);

%%
