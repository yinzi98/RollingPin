%%
definition_or_statement :
    function_definition {

    }
|   statement{

    }
;

function_definition : 
    kwFunction tokIdent opLP parameter_list opRP block {

	}
|   kwFunction tokIdent opLP opRP block {

	}
;

paramerter_list : 
    tokIdent {

	}
|   parameter_list opCOMMA tokIdent {

	}
;

argument_list : 
    expression {
        
	}
|   argument_list opCOMMA expression {

	}
;

statement_list : 
    statement {

    }
|   statement_list statement {
    
    }
;

expression : 
    logical_or_expression {

    }
|   tokIdent opASS expression {

	}
;

logical_or_expression : 
    logical_and_expression {

    }
|   logical_or_expression opOR logical_and_expression {

	}
;

logical_and_expression : 
    equality_expression {

    }
|   logical_and_expression opAND equality_expression {
    
	}
;

equality_expression : 
    relational_expression {

    }
|   equality_expression opEQ relational_expression {

	}
|   equality_expression opNE releational_expression {

	}
;

relational_expression : 
    additive_expression {

    }
|   relational_expression opGT additive_expression {

	}
|   relational_expression opGE additive_expression {

	}
|   relational_expression opLT additive_expression {

	}
|   relational_expression opLE additive_expression {

	}
;

additive_expression : 
    multiplicative_expression {

    }
|   additive_expression opADD multiplicative_expression {

	}
|   additive_expression opSUB multiplicative_expression {

    }
;

multiplicative_expression : 
    unary_expression {

    }
|   multiplicative_expression opMUL unary_expression {
    
	}
|   multiplicative_expression opDIV unary_expression {

	}
|   multiplicative_expression opMOD unary_expression {

	}
;

unary_expression : 
    primary_expression {

    }
|   SUB unary_expression {

	}
;

primary_expression : 
    tokIdent opLP argument_list opRP {

	}
|   tokIdent opLP opRP {

	}
|   opLP expression opRP {

	}
|   tokIdent {

	}
|   INT_LITERAL {

    }
|   DOUBLE_LITERAL {

    }
|   STRING_LITERAL {

    }
|   TRUE_T {
    
	}
|   FALSE_T {

	}
|   NULL_T {

	}
;

statement : 
    expression SEMICOLON {
        
	}
|   global_statement {

    }
|   if_statement {

    }
|   while_statement {

    }
|   for_statement {

    }
|   return_statement {

    }
|   break_statement {

    }
|   continue_statement {

    }
;

global_statement : 
    GLOBAL_T identifier_list SEMICOLON {

	}
;

identifier_list : 
    tokIdent {

	}
|   identifier_list opCOMMA tokIdent {

	}
;

if_statement :

%%