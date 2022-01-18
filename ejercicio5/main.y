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
    int nbs;
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
%token BE
%token OTRA
%start s

%%

s:              c            { printf("Correcto\n"); }
        ;
c:              m            { $$.nbs = $1.nbs; }
        |       c m          {
    $$.nbs = 0;
    if ($2.nbs == 1)
        $$.nbs = $1.nbs + 1;
    if ($$.nbs == 3) {
        printf("Too many b's\n");
        exit(1);
    }
 }
        |       /* lambda */
        ;
m:              BE           { $$.nbs = 1; }
        |       OTRA         { $$.nbs = 0; }
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
