%option noyywrap

%{
// Incluye la tabla de símbolos
#include "y.tab.h"
%}

%%

"("      return(APAR);
")"      return(CPAR);
[a-z]    return(X);

[ \t\n]  /* Ignores whitespace */;
.        fprintf(stderr, "error lexico: %s\n", yytext);

%%
