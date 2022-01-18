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
    int nxt;
} attr;
#define YYSTYPE attr

int max(int a, int b)
{
    if (a > b)
        return a;
    return b;
}

int prof;
int nxt;

%}

// Tabla de tokens
%token APAR
%token CPAR
%token X
%token Y
%start s

%%

s:              { prof = 0; } a { $$.nxt = nxt; printf("S.nxt = %d\n", nxt); }
        ;
a:              APAR APAR { prof += 2; } a CPAR { prof--; } a CPAR { prof--; }
        |       X { if (prof == 3) nxt++; } a
        |       Y APAR { prof++; } X { if (prof==3) nxt++; } a CPAR { prof--; }
        |       /* lambda */
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
