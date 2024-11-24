%{
#include <stdio.h>
#include <stdlib.h>

extern int yylex();
extern void yyerror(const char *s);
extern FILE *yyin;
%}

%union {
    char *strval;
    int numval;
} 
%token C_KEY L_KEY I_KEY F_KEY Y_KEY T_KEY S_KEY P_KEY EOL
%token<strval> ALPHA
%token<numval> NUM

%%

input : /* empty */
      | input alp_record  { printf("apa record\n"); }
      | input mla_record  { printf("mla record\n"); }
      | input chicago_record  { printf("chicago record\n"); }
      | input error EOL { yyerror("Syntax error"); }
      ;

alp_record : L_KEY ALPHA EOL I_KEY ALPHA EOL Y_KEY NUM EOL T_KEY ALPHA EOL S_KEY ALPHA EOL P_KEY  ALPHA EOL
        |L_KEY ALPHA EOL I_KEY ALPHA EOL Y_KEY NUM EOL T_KEY ALPHA EOL S_KEY ALPHA EOL P_KEY  ALPHA
            ;

mla_record : L_KEY ALPHA EOL F_KEY ALPHA  EOL T_KEY ALPHA EOL S_KEY ALPHA EOL P_KEY  ALPHA EOL  Y_KEY NUM EOL
        |L_KEY ALPHA EOL F_KEY ALPHA  EOL T_KEY ALPHA EOL S_KEY ALPHA EOL P_KEY  ALPHA EOL  Y_KEY NUM 
            ;
chicago_record:L_KEY ALPHA EOL F_KEY ALPHA  EOL T_KEY ALPHA EOL S_KEY ALPHA EOL C_KEY  ALPHA EOL P_KEY  ALPHA EOL  Y_KEY NUM EOL
        |L_KEY ALPHA EOL F_KEY ALPHA  EOL T_KEY ALPHA EOL S_KEY ALPHA EOL C_KEY  ALPHA EOL P_KEY  ALPHA EOL  Y_KEY NUM 
            ;
%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    yyin = fopen("f.txt", "r"); 
    if (!yyin) {
        fprintf(stderr, "Error opening file.\n");
        return 1;
    }
    yyparse();
    fclose(yyin);  
    return 0;
}
