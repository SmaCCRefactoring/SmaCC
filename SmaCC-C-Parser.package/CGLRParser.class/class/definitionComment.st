generated
definitionComment
"<H>
	: [a-fA-F0-9]
	;
<IS>
	: [uUlL]	
	;
<D>
	: [0-9]
	;
<E>
	: [Ee][\+\-]?<D>+	
	;
<FS>
	: [fFlL]	
	;
<ELLIPSIS> 
	: \.\.\. 
	;
<comment>
	: (\/\* [^\*]* \*+ ([^\/\*] [^\*]* \*+)* \/)
	;
<LETTER>
	: [a-zA-Z_] 
	;
<DIGIT> 
	: [0-9] 
	;
<IDENTIFIER>
	: <LETTER> (<LETTER>|<DIGIT>)*
	;
<CONSTANT>
	: (0[xX]<H>+<IS>?) 
	| (<D>+<IS>?) 
	| (<D>+<E><FS>?) 
	| <D>*\.<D>+<E>?<FS>? 
	| (L? \' ( (\\ .) | ([^\\\""]) )+ \')
	;
<STRING_LITERAL>
	: L? \"" ( (\\ .) | ([^\\\""]) )* \""
	;
<LEFT_BLOCK>
	: \[ | (\< \:)
	;
<RIGHT_BLOCK>
	: \] | (\: \>)	
	;
<LEFT_BRACE>
	: \{ | (\< \%)
	;
<RIGHT_BRACE>
	: \} | (\% \>)
	;
<whitespace>
	: \s+
	;

%glr ;
%root Abstract;
%prefix CGLR;
%suffix Node;
%annotate_tokens;

translationUnit
	: external_declaration 'declaration' {{}}
	| translationUnit external_declaration 'declaration' {{}}
	;
primary_expression
	: identifier 'symbol' {{IdentifierExpression}}
	| <CONSTANT> {{Constant}}
	| <STRING_LITERAL> {{StringLiteral}}
	| ""("" expression 'expression' "")"" {{ParenthesizedExpression}}
	;
postfix_expression
	: primary_expression
	| postfix_expression 'array' <LEFT_BLOCK> expression 'index' <RIGHT_BLOCK> {{Array}}
	| postfix_expression 'f' ""("" "")"" {{Call}}
	| postfix_expression 'f' ""("" argument_expression_list "")"" {{Call}}
	| postfix_expression 'object' ""."" identifier 'member' {{Point}}
	| postfix_expression 'pointer' ""->"" identifier 'member' {{Arrow}}
	| postfix_expression 'object' ""++"" {{Increment}}
	| postfix_expression 'object' ""--"" {{Decrement}}
	;
argument_expression_list
	: assignment_expression 'argument'
	| argument_expression_list "","" assignment_expression 'argument'
	;
unary_expression
	: postfix_expression
	| ""++"" 'op' unary_expression 'expr' {{}}
	| ""--"" 'op' unary_expression 'expr' {{}}
	| unary_operator 'op' cast_expression 'expr' {{}}
	| ""sizeof"" unary_expression 'expr' {{}}
	| ""sizeof"" ""("" type_name 'type' "")"" 'expr' {{}}
	;
unary_operator
	: ""&""
	| ""*""
	| ""+""
	| ""-""
	| ""~""
	| ""!""
	;
cast_expression
	: unary_expression
	| ""("" type_name 'type' "")"" cast_expression 'expr' {{}}
	;
multiplicative_expression
	: cast_expression
	| multiplicative_expression 'left' ""*"" 'op' cast_expression 'right' {{Binary}}
	| multiplicative_expression 'left' ""/"" 'op' cast_expression 'right' {{Binary}}
	| multiplicative_expression 'left' ""%"" 'op' cast_expression 'right' {{Binary}}
	;
additive_expression
	: multiplicative_expression
	| additive_expression 'left' ""+"" 'op' multiplicative_expression 'right' {{Binary}}
	| additive_expression 'left' ""-"" 'op' multiplicative_expression 'right' {{Binary}}
	;
shift_expression
	: additive_expression
	| shift_expression 'left' ""<<"" 'op' additive_expression 'right' {{Binary}}
	| shift_expression 'left' "">>"" 'op' additive_expression 'right' {{Binary}}
	;
relational_expression
	: shift_expression
	| relational_expression 'left' ""<"" 'op' shift_expression 'right' {{Binary}}
	| relational_expression 'left' "">"" 'op' shift_expression 'right' {{Binary}}
	| relational_expression 'left' ""<="" 'op' shift_expression 'right' {{Binary}}
	| relational_expression 'left' "">="" 'op' shift_expression 'right' {{Binary}}
	;
equality_expression
	: relational_expression
	| equality_expression 'left' ""=="" 'op' relational_expression 'right' {{Binary}}
	| equality_expression 'left' ""!="" 'op' relational_expression 'right' {{Binary}}
	;
and_expression
	: equality_expression
	| and_expression 'left' ""&"" 'op' equality_expression 'right' {{Binary}}
	;
exclusive_or_expression
	: and_expression
	| exclusive_or_expression 'left' ""^"" 'op' and_expression 'right' {{Binary}}
	;
inclusive_or_expression
	: exclusive_or_expression
	| inclusive_or_expression 'left' ""|"" 'op' exclusive_or_expression 'right' {{Binary}}
	;
logical_and_expression
	: inclusive_or_expression
	| logical_and_expression 'left' ""&&"" 'op' inclusive_or_expression 'right' {{Binary}}
	;
logical_or_expression
	: logical_and_expression
	| logical_or_expression 'left' ""||"" 'op' logical_and_expression 'right' {{Binary}}
	;
conditional_expression
	: logical_or_expression
	| logical_or_expression 'condition' ""?"" expression 'then' "":"" conditional_expression 'else' {{Ternary}} 
	;
assignment_expression
	: conditional_expression
	| unary_expression 'lvalue' assignment_operator 'op' assignment_expression 'rvalue' {{Assignment}}
	;
assignment_operator
	: ""=""
	| ""*=""
	| ""/=""
	| ""%=""
	| ""+=""
	| ""-=""
	| ""<<=""
	| "">>=""
	| ""&=""
	| ""^=""
	| ""|=""
	;
expression
	: assignment_expression 'expression' {{}}
	| expression "","" assignment_expression 'expression' {{}}
	; 
constant_expression
	: conditional_expression
	;
declaration
	: declaration_specifiers "";"" {{}}
	| init_declaration "";"" {{}}
	;
init_declaration
	: declaration_specifiers init_declarator_list 
	;
declaration_specifiers
	: storage_class_specifier 'specifier'
	| storage_class_specifier 'specifier' declaration_specifiers
	| type_specifier 'specifier'
	| type_specifier 'specifier' declaration_specifiers
	| type_qualifier 'specifier'
	| type_qualifier 'specifier' declaration_specifiers
	;
init_declarator_list
	: init_declarator 'declarator'
	| init_declarator_list "","" init_declarator 'declarator'
	;
init_declarator
	: declarator 'declarator' {{}}
	| declarator 'declarator' ""="" initializer 'initializer' {{}}
	;
storage_class_specifier
	: ""typedef""
	| ""extern""
	| ""static""
	| ""auto""
	| ""register""
	;
type_specifier
	: ""void""
	| ""char""
	| ""short""
	| ""int""
	| ""long""
	| ""float""
	| ""double""
	| ""signed""
	| ""unsigned""
	| struct_or_union_specifier
	| enum_specifier
	| typename
	;
struct_or_union_specifier
	: struct_or_union 'prefix' identifier 'symbol' <LEFT_BRACE> struct_declaration_list <RIGHT_BRACE> {{}}
	| struct_or_union 'prefix' <LEFT_BRACE> struct_declaration_list <RIGHT_BRACE> {{}}
	| struct_or_union 'prefix' identifier 'symbol' {{}}
	;
struct_or_union
	: ""struct""
	| ""union""
	;
struct_declaration_list
	: struct_declaration 'member'
	| struct_declaration_list struct_declaration 'member'
	;
struct_declaration
	: specifier_qualifier_list struct_declarator_list "";"" {{}}
	;
specifier_qualifier_list
	: type_specifier 'specifier' specifier_qualifier_list
	| type_specifier 'specifier'
	| type_qualifier 'qualifier' specifier_qualifier_list
	| type_qualifier 'qualifier'
	;
struct_declarator_list
	: struct_declarator 'declarator'
	| struct_declarator_list "","" struct_declarator 'declarator'
	;
struct_declarator
	: declarator 'declarator' {{}}
	| "":"" constant_expression 'size' {{}}
	| declarator 'declarator' "":"" constant_expression 'size' {{}}
	;
enum_specifier
	: ""enum"" <LEFT_BRACE> enumerator_list <RIGHT_BRACE> {{Enum}}
	| ""enum"" identifier 'identifier' <LEFT_BRACE> enumerator_list <RIGHT_BRACE> {{Enum}} 
	| ""enum"" identifier 'identifier' {{Enum}}
	;
enumerator_list
	: enumerator 'enumerator'
	| enumerator_list "","" enumerator 'enumerator'
	;
enumerator
	: identifier 'symbol' {{}}
	| identifier 'symbol' ""="" constant_expression 'expr' {{}}
	;
type_qualifier
	: ""const""
	| ""volatile""
	;
declarator
	: pointer direct_declarator 'direct' {{}}
	| direct_declarator 'direct' {{}}
	;
direct_declarator
	: identifier 'identifier'
	| typename 'identifier'
	| ""("" declarator 'declarator' "")"" {{FunctionPointerDeclarator}}
	| direct_declarator 'declarator' <LEFT_BLOCK> constant_expression 'size' <RIGHT_BLOCK> {{ArrayDeclarator}}
	| direct_declarator 'declarator' <LEFT_BLOCK> <RIGHT_BLOCK> {{ArrayDeclarator}}
	| direct_declarator 'declarator' ""("" parameter_type_list "")"" {{FunctionDeclarator}}
	| direct_declarator 'declarator' ""("" identifier_list "")"" {{FunctionDeclarator}}
	| direct_declarator 'declarator' ""("" "")"" {{FunctionDeclarator}}
	;
pointer
	: ""*"" 'pointer'
	| ""*"" 'pointer' type_qualifier_list
	| ""*"" 'pointer' pointer
	| ""*"" 'pointer' type_qualifier_list pointer
	;
type_qualifier_list
	: type_qualifier 'qualifier'
	| type_qualifier_list type_qualifier 'qualifier'
	;
parameter_type_list
	: parameter_list
	| parameter_list "","" <ELLIPSIS> 'ellipsis'
	;
parameter_list
	: parameter_declaration 'parameter'
	| parameter_list "","" parameter_declaration 'parameter'
	;
parameter_declaration
	: declaration_specifiers 'specifier' declarator 'declarator' {{}}
	| declaration_specifiers 'specifier' abstract_declarator 'declarator' {{}}
	| declaration_specifiers 'specifier' {{}}
	;
identifier_list
	: identifier 'identifier'
	| typename 'identifier'
	| identifier_list "","" identifier 'identifier'
	| identifier_list "","" typename 'identifier'
	;
type_name
	: specifier_qualifier_list {{}}
	| specifier_qualifier_list abstract_declarator 'abstract' {{}}
	;
abstract_declarator
	: pointer {{}}
	| direct_abstract_declarator 'direct' {{}}
	| pointer direct_abstract_declarator 'direct' {{}}
	;
direct_abstract_declarator
	: ""("" abstract_declarator 'declarator' "")"" {{FunctionPointerDeclarator}}
	| <LEFT_BLOCK> <RIGHT_BLOCK> {{ArrayDeclarator}}
	| <LEFT_BLOCK> constant_expression 'size' <RIGHT_BLOCK> {{ArrayDeclarator}}
	| direct_abstract_declarator 'declarator' <LEFT_BLOCK> <RIGHT_BLOCK> {{ArrayDeclarator}}
	| direct_abstract_declarator 'declarator' <LEFT_BLOCK> constant_expression 'size' <RIGHT_BLOCK> {{ArrayDeclarator}}
	| ""("" "")"" {{FunctionDeclarator}}
	| ""("" parameter_type_list "")"" {{FunctionDeclarator}}
	| direct_abstract_declarator 'declarator' ""("" "")"" {{FunctionDeclarator}}
	| direct_abstract_declarator 'declarator' ""("" parameter_type_list "")"" {{FunctionDeclarator}}
	;
initializer
	: assignment_expression
	| <LEFT_BRACE> initializer_list <RIGHT_BRACE> {{}}
	| <LEFT_BRACE> initializer_list "","" <RIGHT_BRACE> {{}}
	;
initializer_list
	: initializer 'initializer'
	| initializer_list "","" initializer 'initializer'
	;
statement
	: labeled_statement
	| compound_statement
	| expression_statement
	| selection_statement
	| iteration_statement
	| jump_statement
	;
labeled_statement
	: identifier 'label' "":"" statement 'statement' {{}} 
	| ""case"" constant_expression 'case' "":"" statement 'statement' {{}}
	| ""default"" 'case' "":"" statement 'statement' {{}}
	;
compound_statement
	: <LEFT_BRACE> <RIGHT_BRACE> {{}}
	| <LEFT_BRACE> statement_list <RIGHT_BRACE> {{}}
	| <LEFT_BRACE> declaration_list <RIGHT_BRACE> {{}}
	| <LEFT_BRACE> declaration_list statement_list <RIGHT_BRACE> {{}}
	;
declaration_list
	: declaration 'declaration'
	| declaration_list declaration 'declaration'
	;
statement_list
	: statement 'statement'
	| statement_list statement 'statement'
	;
expression_statement
	: "";"" {{}}
	| expression 'expression' "";"" {{}}
	;
selection_statement
	: ""if"" ""("" expression 'if' "")"" statement 'then' {{}}
	| ""if"" ""("" expression 'if' "")"" statement 'then' ""else"" statement 'else' {{}}
	| ""switch"" ""("" expression 'if' "")"" statement 'statement' {{SwitchStatement}}
	;
iteration_statement
	: ""while"" ""("" expression 'while' "")"" statement 'statement' {{WhileStatement}}
	| ""do"" statement 'statement' ""while"" ""("" expression 'while' "")"" "";"" {{DoStatement}}
	| ""for"" ""("" expression_statement 'init' expression_statement 'until' "")"" statement 'statement' {{ForStatement}} 
	| ""for"" ""("" expression_statement 'init' expression_statement 'until' expression 'step' "")"" statement 'statement' {{ForStatement}}
	;
jump_statement
	: ""goto"" identifier 'label' "";"" {{GotoStatement}}
	| ""continue"" "";"" {{ContinueStatement}}
	| ""break"" "";"" {{BreakStatement}}
	| ""return"" "";"" {{ReturnStatement}}
	| ""return"" expression 'expr' "";"" {{ReturnStatement}}
	;
external_declaration
	: function_definition
	| declaration
	;
function_definition
	: declaration_specifiers 'specifiers' declarator 'declarator' declaration_list 'arguments' compound_statement 'body' {{}}
	| declaration_specifiers 'specifiers' declarator 'declarator' compound_statement 'body' {{}}
	| declarator 'declarator' declaration_list 'arguments' compound_statement 'body' {{}}
	| declarator 'declarator' compound_statement 'body' {{}}
	;
identifier: <IDENTIFIER> 'symbol' {{}};
typename: <IDENTIFIER> 'symbol' {{}};"