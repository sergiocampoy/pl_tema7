%option noyywrap

%{
// Incluye la tabla de símbolos
#include "y.tab.h"
%}

%%

"("      return(APAR);
")"      return(CPAR);
[a-z]    yylval.lex = yytext[0]; return(X);

[ \t\n]  /* Ignores whitespace */;
.        fprintf(stderr, "error lexico: %s\n", yytext);

%%
