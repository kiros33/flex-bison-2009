/*
  Example 1-6. Calculator scanner fb1-5.l
*/

/* generate header file */
%option header-file = "scanner.h"

/* generate implementation file */
%option outfile = "scanner.cpp"

%option always-interactive nounistd

/* Visual Studio 빌드시 라이브러리 추가
   C:\cygwin64\usr\local\lib\liby.a
   C:\cygwin64\usr\local\lib\libfl.a
   64비트만 빌드됨
*/
/* %option noyywrap */

/* %option c++ */

/* recognize tokens for the calculator and print them out */

%{
	#include "parser.h"
%}

%%
"+" { return ADD; }
"-" { return SUB; }
"*" { return MUL; }
"/" { return DIV; }
"|" { return ABS; }
[0-9]+ { yylval = atoi(yytext); return NUMBER; }
\n { return EOL; }
[ \t] { /* ignore whitespace */ }
"(" { return OP; }
")" { return CP; }
"//".* { /* ignore comments */ }
. { printf("Mystery character %c\n", *yytext); }
%%
