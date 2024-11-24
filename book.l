%{
#include "book.tab.h"
#include <string.h>
%}

%%

"L:"            { return L_KEY; }
"I:"            { return I_KEY; }
"F:"            { return F_KEY; }
"Y:"            { return Y_KEY; }
"T:"            { return T_KEY; }
"S:"            { return S_KEY; }
"P:"            { return P_KEY; }
"C:"            { return C_KEY; }
[0-9]+          { yylval.numval = atoi(yytext); return NUM; }
([A-Za-z]+([ ][A-Za-z]+)+) { yylval.strval = strdup(yytext); return ALPHA; }
[A-Za-z\s]+     { yylval.strval = strdup(yytext); return ALPHA; }
\n              { return EOL; }
.               { /* Ignore other characters */ }
%%

int yywrap() {
    return 1;
}
