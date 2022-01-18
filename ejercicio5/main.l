%option noyywrap

%{
// Incluye la tabla de símbolos
#include "y.tab.h"
%}

%%

b        return(BE);
a|[c-z]    return(OTRA);

[ \t\n]  /* Ignores whitespace */;
.        fprintf(stderr, "error lexico: %s\n", yytext);

%%
