%{
#include "rp.hpp"

#include <iostream>
#include <string>

// todo: malloc func
#define SAVE_IDENT(char* str) do {   \
    char* ret = malloc(strlen(str) + 1);    \
    strcpy(ret, str);   \
    return ret; \
} while(0)  \


int yywrap() {
    return 1; 
}

}%

%% 

/* Keywords, not save the string values for them */
for             { return kwFor;         }
while           { return kwWhere;       }
break           { return kwBreak;       }
continue        { return kwContinue;    }
if              { return kwIf;          }
elif            { return kwElsif;       }
else            { return kwElse;        }
func            { return kwFunction;    }
return          { return kwReturn;      }

true            { return kwTrue;        }
false           { return kwFalse;       }


/* Operators, not save the string values for them */

"+"             { return opADD;         }
"-"             { return opSUB;         }
"*"             { return opMUL;         }
"/"             { return opDIV;         }
"%"             { return opMOD;         }

"="             { return opASS;         }
"=="            { return opEQ;          }
"!="            { return opNE;          }
">"             { return opGT;          }
">="            { return opGE;          }
"<"             { return opLT;          }
"<="            { return opLE;          }

","             { return opCOM;         }
";"             { return opSEMICOLON;   }

"("             { return opLP;            }
")"             { return opRP;            }
"{"             { return opLC;            }
"}"             { return opRC;            }

[a-zA-Z_][a-zA-Z0-9_]*  {
    SAVE_IDENT(); return tokIdent;
}

([1-9][0-9]*)|"0" {
    // todo int scanner func
    return tokInt;
}

[0-9]+\.[0-9]+ {
    // todo int scanner func
    return tokDouble;
}


%%