%{
#include <iostream>
#include <string>



int yywrap() {
    return 1; 
}

}%

%start COMMENT STRING_LITERAL_STATE

%% 

/* Keywords, not save the string values for them */
<INITIAL>"for"             { return kwFor;         }
<INITIAL>"while"           { return kwWhere;       }
<INITIAL>"break"           { return kwBreak;       }
<INITIAL>"continue"        { return kwContinue;    }
<INITIAL>"if"              { return kwIf;          }
<INITIAL>"elif"            { return kwElsif;       }
<INITIAL>"else"            { return kwElse;        }
<INITIAL>"func"            { return kwFunction;    }
<INITIAL>"return"          { return kwReturn;      }

<INITIAL>"true"            { return kwTrue;        }
<INITIAL>"false"           { return kwFalse;       }


/* Operators, not save the string values for them */

<INITIAL>"+"             { return opADD;         }
<INITIAL>"-"             { return opSUB;         }
<INITIAL>"*"             { return opMUL;         }
<INITIAL>"/"             { return opDIV;         }
<INITIAL>"%"             { return opMOD;         }
<INITIAL>"&&"			 { return opAND;   		 }
<INITIAL>"||"            { return opOR;			 }

<INITIAL>"="             { return opASS;         }
<INITIAL>"=="            { return opEQ;          }
<INITIAL>"!="            { return opNE;          }
<INITIAL>">"             { return opGT;          }
<INITIAL>">="            { return opGE;          }
<INITIAL>"<"             { return opLT;          }
<INITIAL>"<="            { return opLE;          }

<INITIAL>","             { return opCOMMA;       }
<INITIAL>";"             { return opSEMICOLON;   }

<INITIAL>"("             { return opLP;            }
<INITIAL>")"             { return opRP;            }
<INITIAL>"{"             { return opLC;            }
<INITIAL>"}"             { return opRC;            }

<INITIAL>[ \t] ;

<INITIAL># {
	BEGIN COMMENT;
}

<INITIAL>[A-Za-z_][A-Za-z_0-9]* {
	yylval.identifier = dupYYText(yytext);
	return tokIdent;
}


%%