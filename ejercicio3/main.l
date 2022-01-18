%option noyywrap

%{
// Incluye la tabla de símbolos
#include "y.tab.h"
%}

%%

"("   return(APAR);
"["   return(ACOR);
")"   return(CPAR);
"]"   return(CCOR);
,     return(SEP);
[a-z] return(ELEM);

[ \t\n] /* Ignores whitespace */;
. fprintf(stderr, "error lexico: %s\n", yytext);

%%
