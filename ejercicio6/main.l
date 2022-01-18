%option noyywrap

%{
// Incluye la tabla de símbolos
#include "y.tab.h"
%}

%%

"("      return(APAR);
")"      return(CPAR);
x        return(X);
y        return(Y);

[ \t\n]  /* Ignores whitespace */;
.        fprintf(stderr, "error lexico: %s\n", yytext);

%%
