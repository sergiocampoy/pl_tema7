%option noyywrap

%{
// Incluye la tabla de símbolos
#include "y.tab.h"
%}

%%

[a-z] return(ELEM);
","   return(SEP);
"("   return(APAR);
")"   return(CPAR);
"["   return(ACOR);
"]"   return(CCOR);

[ \t\n] /* Ignores whitespace */;
. fprintf(stderr, "error lexico: %s\n", yytext);

%%
