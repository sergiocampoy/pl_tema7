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
    int valor;
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
%token A
%token BE
%token CE
%token APAR
%token CPAR
%token LIT
%start s

%%

s:              l n {
                    if ($1.valor == $2.valor)
                        printf("pog\n");
                    else
                        printf("pogn't\n");
                }
        ;
l:              A  A A l      { $$.valor = $4.valor + 3; }
        |       BE A A l      { $$.valor = $4.valor + 2; }
        |       CE A          { $$.valor = 1; }
        ;
n:              APAR LIT CPAR { $$.valor = $2.valor; }
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
