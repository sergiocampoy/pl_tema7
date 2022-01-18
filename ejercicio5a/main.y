%{
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

// Declaración de funciones/variables de yacc
void yyerror (const char *msg);
int yylex(void);
char* yytext;

// Pila
#define MAX_TS 500
int TS[MAX_TS];
const uint TOPE = 0;
uint pos = 0;

// Inserta un valor en la pila
void push(int val)
{
    TS[pos] = val;
    pos++;
}

// Devuelve el último valor de la pila y lo borra
int pop()
{
    if (pos > 0)
    {
        pos--;
    }
    return TS[pos];
}

// Define el tipo de yylval
typedef struct
{
    int mnp;
} attr;
#define YYSTYPE attr

int max(int a, int b)
{
    if (a > b)
        return a;
    return b;
}

%}

// Tabla de tokens
%token APAR
%token CPAR
%token X
%start s

%%

s:              APAR a CPAR    {
                    $$.mnp = $2.mnp + 1;
                    printf("S.mnp = %d", $$.mnp);
    }
        ;
a:              APAR a a CPAR  { $$.mnp = max($2.mnp, $2.mnp) + 1; }
        |       X              { $$.mnp = 0; }
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
