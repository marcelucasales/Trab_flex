%{
#include <stdio.h>
%}

DIGITOS [0-9]
BLANK [ ]

TIPOIDENT [A-Z][A-Za-z0-9_]*
OBJIDENT [a-z][A-Za-z0-9_]*
COMENT_I [/*]
COMENT_F [*/]
SOMA "+"
SUBTRAI "-"
MULTIPLICA "*"
DIVIDE "/"
IGUAL "="
MENOR "<"
MENORIGUAL "<="
NEGATIVO "~"
PONTOVIRGULA ";"
DOISPONTOS ":"
PONTO "."
VIRGULA ","
ABREPARENTESIS [(]
FECHAPARENTESIS [)]
ABRECHAVE "{"
FECHACHAVE "}"
ATTRIB "<-"
AT "@"
ARROW "=>"

CLASS ^[Cc][Ll][Aa][Ss][Ss]$
ELSE ^[Ee][Ll][Ss][Ee]$
IF ^[Ii][Ff]$
FI ^[Ff][Ii]$
IN ^[Ii][Nn]$
LET ^[Ll][Ee][Tt]$
POOL ^[Pp][Oo][Oo][Ll]$
ESAC ^[Ee][Ss][Aa][Cc]$
OF ^[Oo][Ff]$
NOT ^[Nn][Oo][Tt]$
TRUE ^t[Rr][Uu][Ee]$
FALSE ^f[Aa][Ll][Ss][Ee]$
INHERITS ^[Ii][Nn][Hh][Ee][Rr][Ii][Tt][Ss]$
ISVOID ^[Ii][Ss][Vv][Oo][Ii][Dd]$
THEN ^[Tt][Hh][Ee][Nn]$
WHILE ^[Ww][Hh][Ii][Ll][Ee]$
NEW ^[Nn][Ee][Ww]$
CASE ^[Cc][Aa][Ss][Ee]$
LOOP ^[Ll][Oo][Oo][Pp]$
LETTER [a-zA-Z]

%%

Main {printf("[%s] -> CLASSE PRINCIPAL\n",yytext);}
main {printf("[%s] -> FUNCAO PRINCIPAL\n",yytext);}
{DIGITOS}+ {printf("[%s] -> números inteiros\n",yytext);}
{BLANK} {printf("[%s] -> espaço em branco/vazio\n",yytext);}
{TIPOIDENT} {printf("[%s] -> identificador do tipo que foi criado/modelado para classe\n",yytext);}
{OBJIDENT} {printf("[%s] -> identificador para um objeto que foi criado a partir de uma classe\n",yytext);}
{SOMA} {printf("[%s] -> OPERADOR SOMA\n",yytext);}
{SUBTRAI} {printf("[%s] -> OPERADOR SUBTRACAO\n",yytext);}
{MULTIPLICA} {printf("[%s] -> OPERADOR MULTIPLICACAO\n",yytext);}
{DIVIDE} {printf("[%s] -> OPERADOR DIVISAO\n",yytext);}
{MENORIGUAL} {printf("[%s] -> operador de menor igual\n",yytext);}
{MENOR} {printf("[%s] -> operador de menor\n",yytext);}
{NEGATIVO} {printf("[%s] -> operador de negação\n",yytext);}
{IGUAL} {printf("[%s] -> operador de igual\n",yytext);}
{PONTOVIRGULA} {printf("[%s] -> ponto e vírgula\n",yytext);}
{DOISPONTOS} {printf("[%s] -> dois pontos\n",yytext);}
{PONTO} {printf("[%s] -> ponto\n",yytext);}
{VIRGULA} {printf("[%s] -> vírgula\n",yytext);}
{ABREPARENTESIS} {printf("[%s] -> abre parentesis\n",yytext);}
{FECHAPARENTESIS} {printf("[%s] -> fecha parentesis\n",yytext);}
{ABRECHAVE} {printf("[%s] -> abre chaves\n",yytext);}
{FECHACHAVE} {printf("[%s] -> fecha chaves\n",yytext);}
{ATTRIB} {printf("[%s] -> operador de atribuição\n",yytext);}
{AT} {printf("[%s] -> é um operador da linguagem cool, serve para invocar um método da classe pai\n",yytext);}
{ARROW} {printf("[%s] -> é uma flecha, que faz parte do bloco do operador CASE da linguem cool\n",yytext);}
{CLASS} {printf("[%s] -> palavra chave(reservada) para especificar um novo tipo\n",yytext);}
{ELSE} {printf("[%s] -> operador condiocional ELSE\n",yytext);}
{IF} {printf("[%s] -> operador condiocional IF\n",yytext);}
{NOT} {printf("[%s] -> operador de negação\n",yytext);}
{TRUE} {printf("[%s] -> palavra reservada true(verdade)\n",yytext);}
{FALSE} {printf("[%s] -> palavra reservada false(falso)\n",yytext);}
{INHERITS} {printf("[%s] -> palavra reservada que significa herança\n",yytext);}
{ISVOID} {printf("[%s] -> propriedade isvoid, semelhante ao null em C\n",yytext);}
{THEN} {printf("[%s] -> palavra reservada then(então), antecede uma ação em um bloco if condicional\n",yytext);}
{WHILE} {printf("[%s] -> palavra reservada WHILE que faz parte de uma estrutura de repetição\n",yytext);}
{NEW} {printf("[%s] -> operador que instancia um object na linguagem cool, alocando um espaço em memória para o mesmo\n",yytext);}
{CASE} {printf("[%s] -> operador CASE, feito para diminuir os blocos sucecivos de if/else, ou seja, baseado em uma exrpressão, realiza uma ação que satisfaz algum bloco\n",yytext);}
{LOOP} {printf("[%s] -> palavra reservada que delimita o bloco de código da estrutura de repetição\n",yytext);}
{FI} {printf("[%s] -> palavra reservada que indica o final do bloco condicional else\n",yytext);}
{IN} {printf("[%s] -> operador utilizado no bloco LET, se nenhuma declaração for satisfeita, atribui a variável LET com tal identificador a expreção posterior ao IN\n",yytext);}
{LET} {printf("[%s] -> palavra reservada para inicializar uma variável com um identificador qualquer, a partir de uma expressão\n",yytext);}
{POOL} {printf("[%s] -> palavra reservada que indica o final de uma estrutura de repetição While\n",yytext);}
{ESAC} {printf("[%s] -> palavra reservada que indica o final de um bloco CASE\n",yytext);}
{OF} {printf("[%s] -> palavra reservada que indica o inicio das expressões de um bloco CASE\n",yytext);}
{COMENT_I}+{LETTER}+{COMENT_F} {printf("[%s]) -> comentário\n",yytext);}

%%
int yywrap() {
  return 1;
}

int main() {
	yylex();
	return 0;
}