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
    char lex;
} attr;
#define YYSTYPE attr

int max(int a, int b)
{
    if (a > b)
        return a;
    return b;
}

int prof;

%}

// Tabla de tokens
%token APAR
%token CPAR
%token X
%start s

%%

/* Con variables globales
s:              APAR { prof = 1; } a CPAR { prof -= 1; }
        ;
a:              APAR { prof += 1; } a a CPAR { prof -= 1; }
        |       X { printf("%c - %d\n", $1.lex, prof); }
        ;
*/

/* Versión teórica
s:              APAR {a.prof = 1} a CPAR
        ;
a:              APAR {a1.prof = a.prof+1; a2.prof = a.prof+2} a a CPAR
        |       X
        ;
*/

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
