%{
    #include<cstdio>
    #include<string>
    #include<cstdlib>
    #include <vector>
    #include "ast.hpp"
    Block *root;

    void yyerror(const char *s){
        std::printf("ERROR: %s\n", s);
        std::exit(1);
    };
    int yylex();
    // extern int yylineno;
%}

%define parse.error verbose

%union{
    Block *block_type;
    Expression *expr_type;
    Statement *stmt_type;
    Identifier *id;
    VariableDeclaration *var_decl;
    std::vector<VariableDeclaration*> *varvec;
    std::vector<Expression*> *exprvec;
    std::string *string;
    int token;

}

%token <string> IDENTIFIER
%token <token> EQ NEQ LT LE GT GE
%token <token> LPAREN RPAREN LBRACKET RBRACKET LBRACE RBRACE
%token <token> COMMA SEMI
%token <token> PLUS MINUS MUL DIV MOD AND OR
%token <token> ADDR
%token <token> IF ELSE WHILE RETURN BREAK
%token <string> INTEGER DOUBLE CHARACTER STRING

%nonassoc IF
%nonassoc ELSE

%left COMMA           //8
%right ASSIGN         //7
%left OR              //6
%left AND             //5
%left EQ NEQ          //4
%left LT LE GT GE     //3
%left PLUS MINUS      //2
%left MUL DIV MOD     //1
%left LPAREN RPAREN LBRACKET RBRACKET //0

%type <id> identifier
%type <expr_type> expr
%type <varvec> decl_args
%type <exprvec> call_args
%type <block_type> program stmts block
%type <stmt_type> stmt var_decl func_decl

%start program

%%

program : stmts {
            root = $1;
            std::printf("begin parsing!\n");
        };

stmts : stmt {
            $$ = new Block();
            $$->statements.push_back($<stmt_type>1);
            std::printf("stmt\n");
        }|
        stmts stmt{
            $1->statements.push_back($<stmt_type>2);
        };

stmt : var_decl SEMI {
            std::printf("vardecl\n");
       }|
       func_decl {
            std::printf("funcdecl\n");
       }|
       expr SEMI {
            $$ = new ExpressionStatement(*$1);
       }|
       RETURN SEMI {
            $$ = new ReturnStatement();
            std::printf("return\n");
       }|
       RETURN expr SEMI {
            $$ = new ReturnStatement($2);
            std::printf("return\n");
       }|
       BREAK SEMI {
            $$ = new BreakStatement();
       }|
       IF LPAREN expr RPAREN block ELSE block{
            $$ = new IfStatement($3, $5, $7);
       }|
       IF LPAREN expr RPAREN block{
            $$ = new IfStatement($3, $5);
       }|
       WHILE LPAREN expr RPAREN block {
            $$ = new WhileStatement($3, $5);
       }|
       WHILE error RPAREN {
            yyerror("PAREN not match in while condition!\n");
       }|
       IF error RPAREN block{
            yyerror("PAREN not match in if condition!\n");
       };


block : LBRACE stmts RBRACE {
            $$ = $2;
            std::printf("block!\n");
        }|
        LBRACE RBRACE{
            $$ = new Block();
        }|
        LBRACE error{
            yyerror("BRACE not match in block!\n");
        };

var_decl : identifier identifier{
            $$ = new VariableDeclaration(*$1, *$2);
         }|
         identifier identifier ASSIGN expr{
            $$ = new VariableDeclaration(*$1, *$2, $4);
         }|
         identifier identifier LBRACKET INTEGER RBRACKET{
            $$ = new VariableDeclaration(*$1, *$2, atoi($4->c_str()));
         };

func_decl : identifier identifier LPAREN decl_args RPAREN block{
                $$ = new FunctionDeclaration(*$1, *$2, *$4, *$6);
                std::printf("funcdecl\n");
            }|
            identifier identifier error RPAREN{
                yyerror("PAREN not match in function args declaration!\n");
            };

decl_args : { $$ = new VariableList();
          }|
          var_decl {
            $$ = new VariableList();
            $$->push_back($<var_decl>1);
          }|
          decl_args COMMA var_decl{
            $1->push_back($<var_decl>3);
          };

identifier : IDENTIFIER {
                $$ = new Identifier(*$1);
            };

call_args:{
            $$ = new std::vector<Expression*>();
        }|
        expr {
            $$ = new std::vector<Expression*>();
            $$->push_back($1);
        }|
        call_args COMMA expr {
            $1->push_back($3);
        };

expr : identifier ASSIGN expr{
            $$ = new Assignment(*$<id>1, *$3);
        }|
        identifier LPAREN call_args RPAREN{
            $$ = new FunctionCall(*$1, *$3);
        }|
        identifier{
            $$ = $1;
        }|
        ADDR identifier{
            $$ = new Address(*$2);
        }|
        identifier LBRACKET expr RBRACKET {  // a[0]
             $$ = new Array(*$1, *$3);
        }|
        identifier LBRACKET expr RBRACKET ASSIGN expr{ //a[0]=1
             $$ = new ArrayAssignment(*$1, *$3, *$6);
        }|
        INTEGER {
            $$ = new Integer(atoi($1->c_str()));
        }|
        DOUBLE {
            $$ = new Double(atof($1->c_str()));
        }|
        CHARACTER {
            $$ = new Char(*$1);
            delete $1;
        }|
        STRING {
            $$ = new String(*$1);
            delete $1;
        }|
        expr DIV expr{
            $$ = new BinaryOperate(*$1, $2, *$3);
        } |
        expr MUL expr{
            $$ = new BinaryOperate(*$1, $2, *$3);
        }|
        expr MOD expr{
            $$ = new BinaryOperate(*$1, $2, *$3);
        }|
        expr PLUS expr{
            $$ = new BinaryOperate(*$1, $2, *$3);
        }|
        expr MINUS expr{
            $$ = new BinaryOperate(*$1, $2, *$3);
        }|
        expr GT expr{
            $$ = new BinaryOperate(*$1, $2, *$3);
        }|
        expr GE expr{
            $$ = new BinaryOperate(*$1, $2, *$3);
        }|
        expr LT expr{
            $$ = new BinaryOperate(*$1, $2, *$3);
        }|
        expr LE expr{
            $$ = new BinaryOperate(*$1, $2, *$3);
        }|
        expr EQ expr{
           $$ = new BinaryOperate(*$1, $2, *$3);
        }|
        expr NEQ expr{
            $$ = new BinaryOperate(*$1, $2, *$3);
        }|
        expr AND expr{
            $$ = new BinaryOperate(*$1, $2, *$3);
        }|
        expr OR expr{
            $$ = new BinaryOperate(*$1, $2, *$3);
        };

%%