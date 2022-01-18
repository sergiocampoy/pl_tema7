%{
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

// Declaración de funciones/variables de yacc
void yyerror (const char *msg);
int yylex(void);
char* yytext;

%}

// Tabla de tokens
// %token NOMBRE
%token FIN
%token ABRE
%token CIERRA
%token LIT

%%

s:              a FIN          { $$ = $1; printf("%d", $$); }
        ;
a:              ABRE a CIERRA  { $$ = $2; }
        |       LIT            { $$ = atoi(yytext); }
        ;

%%

#include "lex.yy.c"

void yyerror(const char *msg)
{
    fprintf(stderr, "error sintactico\n");
}

int main()
{
    yyparse();
    return 0;
}
