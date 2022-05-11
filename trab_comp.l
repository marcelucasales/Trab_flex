%{
#include <stdio.h>
%}

UPPERCASE_LETTER [A-Z]
LOWERCASE_LETTER [a-z]
LETTER ({LOWERCASE_LETTER}|{UPPERCASE_LETTER})
DIGITOS [0-9]
BLANK (" "|\f|\r|\t|\v)

CLASS (?i:class)
ELSE (?i:else)
IF (?i:if)
FI (?i:fi)
IN (?i:in)
LET (?i:let)
POOL (?i:pool)
ESAC (?i:esac)
OF (?i:of)
NOT (?i:not)
TRUE (t)(?i:rue)
FALSE (f)(?i:alse)
INHERITS (?i:inherits)
ISVOID (?i:isvoid)
THEN (?i:then)
WHILE (?i:while)
NEW (?i:new)
CASE (?i:case)
LOOP (?i:loop)

INT_CONST   {DIGITOS}+
TIPOIDENT ("SELF_TYPE"|{UPPERCASE_LETTER}({LETTER}|{DIGITOS}|"_")*)
OBJIDENT ("self"|{LETTER}({LETTER}|{DIGITOS}|"_")*)
CHAR .|\r
STRINGCHAR [^\"\0\n\\]+
COMENTARIOTXTINICIO [\*]
COMENTARIOTXTFIM [*\]
NOVALINHA \n
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

%%

Main {printf("[%s]) -> CLASSE PRINCIPAL\n",yytext);}
main {printf("[%s]) -> FUNCAO PRINCIPAL\n",yytext);}
{INT_CONST} {printf("[%s]) -> números inteiros\n",yytext);}
{BLANK} {printf("[%s]) -> espaço em branco/vazio\n",yytext);}
{TIPOIDENT} {printf("[%s]) -> identificador do tipo que foi criado/modelado para classe\n",yytext);}
{OBJIDENT} {printf("[%s]) -> identificador para um objeto que foi criado a partir de uma classe\n",yytext);}
{CHAR} {printf("[%s]) -> caracter encontrado\n",yytext);}
{STRINGCHAR} {printf("[%s]) -> caracter de uma string\n",yytext);}
{COMENTARIOTXTINICIO} {printf("[%s]) -> inicio de um comentário\n",yytext);}
{COMENTARIOTXTFIM} {printf("[%s]) -> fim de um comentário\n",yytext);}
{NOVALINHA} {printf("[%s]) -> nova linha\n",yytext);}
{SOMA} {printf("[%s]) -> OPERADOR SOMA\n",yytext);}
{SUBTRAI} {printf("[%s]) -> OPERADOR SUBTRACAO\n",yytext);}
{MULTIPLICA} {printf("[%s]) -> OPERADOR MULTIPLICACAO\n",yytext);}
{DIVIDE} {printf("[%s]) -> OPERADOR DIVISAO\n",yytext);}
{MENORIGUAL} {printf("[%s]) -> operador de menor igual\n",yytext);}
{MENOR} {printf("[%s]) -> operador de menor\n",yytext);}
{NEGATIVO} {printf("[%s]) -> operador de negação\n",yytext);}
{IGUAL} {printf("[%s]) -> operador de igual\n",yytext);}
{PONTOVIRGULA} {printf("[%s]) -> ponto e vírgula\n",yytext);}
{DOISPONTOS} {printf("[%s]) -> dois pontos\n",yytext);}
{PONTO} {printf("[%s]) -> ponto\n",yytext);}
{VIRGULA} {printf("[%s]) -> vírgula\n",yytext);}
{ABREPARENTESIS} {printf("[%s]) -> abre parentesis\n",yytext);}
{FECHAPARENTESIS} {printf("[%s]) -> fecha parentesis\n",yytext);}
{ABRECHAVE} {printf("[%s]) -> abre chaves\n",yytext);}
{FECHACHAVE} {printf("[%s]) -> fecha chaves\n",yytext);}
{ATTRIB} {printf("[%s]) -> operador de atribuição\n",yytext);}
{AT} {printf("[%s]) -> é um operador da linguagem cool, serve para invocar um método da classe pai\n",yytext);}
{ARROW} {printf("[%s]) -> é uma flecha, que faz parte do bloco do operador CASE da linguem cool\n",yytext);}
{CLASS} {printf("[%s]) -> palavra chave(reservada) para especificar um novo tipo\n",yytext);}
{ELSE} {printf("[%s]) -> operador condiocional ELSE\n",yytext);}
{IF} {printf("[%s]) -> operador condiocional IF\n",yytext);}
{NOT} {printf("[%s]) -> operador de negação\n",yytext);}
{TRUE} {printf("[%s]) -> palavra reservada true(verdade)\n",yytext);}
{FALSE} {printf("[%s]) -> palavra reservada false(falso)\n",yytext);}
{INHERITS} {printf("[%s]) -> palavra reservada que significa herança\n",yytext);}
{ISVOID} {printf("[%s]) -> propriedade isvoid, semelhante ao null em C\n",yytext);}
{THEN} {printf("[%s]) -> palavra reservada then(então), antecede uma ação em um bloco if condicional\n",yytext);}
{WHILE} {printf("[%s]) -> palavra reservada WHILE que faz parte de uma estrutura de repetição\n",yytext);}
{NEW} {printf("[%s]) -> operador que instancia um object na linguagem cool, alocando um espaço em memória para o mesmo\n",yytext);}
{CASE} {printf("[%s]) -> operador CASE, feito para diminuir os blocos sucecivos de if/else, ou seja, baseado em uma exrpressão, realiza uma ação que satisfaz algum bloco\n",yytext);}
{LOOP} {printf("[%s]) -> palavra reservada que delimita o bloco de código da estrutura de repetição\n",yytext);}
{FI} {printf("[%s]) -> palavra reservada que indica o final do bloco condicional else\n",yytext);}
{IN} {printf("[%s]) -> operador utilizado no bloco LET, se nenhuma declaração for satisfeita, atribui a variável LET com tal identificador a expreção posterior ao IN\n",yytext);}
{LET} {printf("[%s]) -> palavra reservada para inicializar uma variável com um identificador qualquer, a partir de uma expressão\n",yytext);}
{POOL} {printf("[%s]) -> palavra reservada que indica o final de uma estrutura de repetição While\n",yytext);}
{ESAC} {printf("[%s]) -> palavra reservada que indica o final de um bloco CASE\n",yytext);}
{OF} {printf("[%s]) -> palavra reservada que indica o inicio das expressões de um bloco CASE\n",yytext);}

%%
int yywrap() {
  return 1;
}

int main() {
	yylex();
	return 0;
}