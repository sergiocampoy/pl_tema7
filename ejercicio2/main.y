%{
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

// Declaración de funciones/variables de yacc
void yyerror (const char *msg);
int yylex(void);
char* yytext;

typedef struct
{
    int ok;
    int tipo;
} attr;

#define YYSTYPE attr

%}

// Tabla de tokens
// %token NOMBRE
%token ELEM
%token SEP
%token APAR
%token CPAR
%token ACOR
%token CCOR
%start lis

%%

lis:            ini ELEM mas fin {
                    $$.ok = ($1.tipo == $4.tipo);
                    if ($$.ok)
                        printf("Son iguales\n");
                    else
                        printf("Son distintos\n");
 }
        ;
mas:            SEP ELEM mas { $$.tipo = $3.tipo; }
        |       /* lambda */
        ;
ini:            APAR { $$.tipo = 1; }
        |       ACOR { $$.tipo = 2; }
        ;
fin:            CPAR { $$.tipo = 1; }
        |       CCOR { $$.tipo = 2; }
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
