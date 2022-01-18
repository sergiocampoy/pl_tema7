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
    int na;
} attr;

#define YYSTYPE attr

%}

// Tabla de tokens
// %token NOMBRE
%token A
%token B
%token C
%start s

%%

s:              A x B    {
                    $$.na = $2.na + 1;
                    printf("S.na = %d\n", $$.na);
}
        ;
x:              A x x    { $$.na = 1 + $2.na + $3.na; }
        |       B A x A  { $$.na = $3.na + 2; }
        |       C y      { $$.na = $2.na; }
        ;
y:              C y      { $$.na = $2.na; }
        |       A        { $$.na = 1; }
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
