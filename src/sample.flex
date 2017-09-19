import java.io.*;
%%
%standalone
%class lexer    //name of the generated java file
%public
%line           //turn on line counting
%column			//turn on column counting

DIGIT       = [0-9]
LETTER      = [a-zA-Z]
WHITESPACE  = [ \t\n]      // space, tab, newline
%%

int
    { System.out.println("Keyword " + yytext()); }
{LETTER}({LETTER}|{DIGIT})*
    { System.out.println("ID " + yytext()); }
{DIGIT}+
    { System.out.println("Integer"); }
"="
    { System.out.println("ASSIGN"); }
{WHITESPACE}*
    { }
.
    { System.out.println("Bad Char"); }