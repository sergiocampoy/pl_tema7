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
    char lex;
    int na;
} attr;

#define YYSTYPE attr

%}

// Tabla de tokens
// %token NOMBRE
%token MAY
%token MIN
%token DIG
%start s

%%

s:              MAY x        {
                    $$.na = $2.na;
                    if ($1.lex == 'A')
                        $$.na += 1;
                    printf("S.na = %d\n", $$.na);
}
        |       x            { $$.na = $1.na;  printf("S.na = %d\n", $$.na); }
        |       DIG y        { $$.na = $2.na; printf("S.na = %d\n", $$.na); }
        ;
x:              x MIN        {
                    $$.na = $1.na;
                    if ($2.lex == 'a')
                        $$.na += 1;
 }
        |       /* lambda */ { $$.na = 0; }
        ;
y:              DIG y        { $$.na = $2.na; }
        |       /* lambda */ { $$.na = 0; }
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
