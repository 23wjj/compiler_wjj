%{
#include <string>
#include <iostream>
#include "ast.hpp"
#include "parser.hpp"
#define SAVE_TOKEN yylval.string = new std::string(yytext, yyleng)
#define TOKEN(t) (yylval.token = t)
extern "C" int yywrap() {return 1;}
%}

%option outfile="lexer.cpp"

%%

"="                     { std::cout<<"ASSIGN"<<std::endl; return TOKEN(ASSIGN);}
"=="                    return TOKEN(EQ);
"!="                    return TOKEN(NEQ);
"<"                     return TOKEN(LT);
"<="                    return TOKEN(LE);
">"                     return TOKEN(GT);
">="                    return TOKEN(GE);
"("                     { std::cout<<"LPAREN"<<std::endl; return TOKEN(LPAREN);}
")"                     { std::cout<<"RPAREN"<<std::endl; return TOKEN(RPAREN);}
"["                     return TOKEN(LBRACKET);
"]"                     return TOKEN(RBRACKET);
"{"                     { std::cout<<"LBRACE"<<std::endl; return TOKEN(LBRACE);}
"}"                     { std::cout<<"RBRACE"<<std::endl; return TOKEN(RBRACE);}
","                     return TOKEN(COMMA);
";"                     { std::cout<<"COMMA"<<std::endl; return TOKEN(SEMI);}
"+"                     return TOKEN(PLUS);
"-"                     return TOKEN(MINUS);
"*"                     return TOKEN(MUL);
"/"                     return TOKEN(DIV);
"%"                     return TOKEN(MOD);
"&&"                    return TOKEN(AND);
"||"                    return TOKEN(OR);
"&"                     return TOKEN(ADDR);
"if"                    return TOKEN(IF);
"else"                  return TOKEN(ELSE);
"while"                 return TOKEN(WHILE);
"return"                { std::cout<<"return"<<std::endl; return TOKEN(RETURN);}
"break"                 return TOKEN(BREAK);
[a-zA-Z_][a-zA-Z0-9_]*  {SAVE_TOKEN; std::cout<<yylval.string<<std::endl; return IDENTIFIER;}
[0-9]+                  SAVE_TOKEN; return INTEGER;
[0-9]+\.[0-9]*           SAVE_TOKEN; return DOUBLE;
["].*["]	            SAVE_TOKEN; return STRING;
"\'"[^\\']"\'"	        SAVE_TOKEN; return CHARACTER;
[ \t\n]                 { ;}
.                       { printf("Unknown token!\n"); std::cout<<yylval.string<<std::endl;}

%%