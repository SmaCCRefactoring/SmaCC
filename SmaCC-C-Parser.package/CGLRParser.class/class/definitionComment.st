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


translationUnit
	: external_declaration {{}}
	| translationUnit external_declaration {{}}
	;
primary_expression
	: identifier
	| <CONSTANT> {{Constant}}
	| <STRING_LITERAL> {{StringLiteral}}
	| ""("" expression "")""
	;
postfix_expression
	: primary_expression
	| postfix_expression <LEFT_BLOCK> expression <RIGHT_BLOCK> {{Array}}
	| postfix_expression ""("" "")"" {{Call}}
	| postfix_expression ""("" argument_expression_list "")"" {{Call}}
	| postfix_expression ""."" identifier {{Point}}
	| postfix_expression ""->"" identifier {{Arrow}}
	| postfix_expression ""++"" {{Increment}}
	| postfix_expression ""--"" {{Decrement}}
	;
argument_expression_list
	: assignment_expression
	| argument_expression_list "","" assignment_expression
	;
unary_expression
	: postfix_expression
	| ""++"" unary_expression {{}}
	| ""--"" unary_expression {{}}
	| unary_operator cast_expression {{}}
	| ""sizeof"" unary_expression {{}}
	| ""sizeof"" ""("" type_name "")"" {{}}
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
	| ""("" type_name "")"" cast_expression {{}}
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
	: assignment_expression
	| expression "","" assignment_expression
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
	: storage_class_specifier
	| storage_class_specifier declaration_specifiers
	| type_specifier
	| type_specifier declaration_specifiers
	| type_qualifier
	| type_qualifier declaration_specifiers
	;
init_declarator_list
	: init_declarator
	| init_declarator_list "","" init_declarator
	;
init_declarator
	: declarator
	| declarator ""="" initializer
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
	: struct_or_union identifier <LEFT_BRACE> struct_declaration_list <RIGHT_BRACE>
	| struct_or_union <LEFT_BRACE> struct_declaration_list <RIGHT_BRACE>
	| struct_or_union identifier
	;
struct_or_union
	: ""struct""
	| ""union""
	;
struct_declaration_list
	: struct_declaration
	| struct_declaration_list struct_declaration
	;
struct_declaration
	: specifier_qualifier_list struct_declarator_list "";""
	;
specifier_qualifier_list
	: type_specifier specifier_qualifier_list
	| type_specifier
	| type_qualifier specifier_qualifier_list
	| type_qualifier
	;
struct_declarator_list
	: struct_declarator
	| struct_declarator_list "","" struct_declarator
	;
struct_declarator
	: declarator
	| "":"" constant_expression
	| declarator "":"" constant_expression
	;
enum_specifier
	: ""enum"" <LEFT_BRACE> enumerator_list <RIGHT_BRACE>
	| ""enum"" identifier <LEFT_BRACE> enumerator_list <RIGHT_BRACE> 
	| ""enum"" identifier
	;
enumerator_list
	: enumerator
	| enumerator_list "","" enumerator
	;
enumerator
	: identifier
	| identifier ""="" constant_expression
	;
type_qualifier
	: ""const""
	| ""volatile""
	;
declarator
	: pointer direct_declarator
	| direct_declarator
	;
direct_declarator
	: identifier
	| typename
	| ""("" declarator "")""
	| direct_declarator <LEFT_BLOCK> constant_expression <RIGHT_BLOCK>
	| direct_declarator <LEFT_BLOCK> <RIGHT_BLOCK>
	| direct_declarator ""("" parameter_type_list "")""
	| direct_declarator ""("" identifier_list "")""
	| direct_declarator ""("" "")""
	;
pointer
	: ""*""
	| ""*"" type_qualifier_list
	| ""*"" pointer
	| ""*"" type_qualifier_list pointer
	;
type_qualifier_list
	: type_qualifier
	| type_qualifier_list type_qualifier
	;
parameter_type_list
	: parameter_list
	| parameter_list "","" <ELLIPSIS>
	;
parameter_list
	: parameter_declaration
	| parameter_list "","" parameter_declaration
	;
parameter_declaration
	: declaration_specifiers declarator
	| declaration_specifiers abstract_declarator
	| declaration_specifiers
	;
identifier_list
	: identifier
	| typename
	| identifier_list "","" identifier
	| identifier_list "","" typename
	;
type_name
	: specifier_qualifier_list
	| specifier_qualifier_list abstract_declarator
	;
abstract_declarator
	: pointer
	| direct_abstract_declarator
	| pointer direct_abstract_declarator
	;
direct_abstract_declarator
	: ""("" abstract_declarator "")""
	| <LEFT_BLOCK> <RIGHT_BLOCK>
	| <LEFT_BLOCK> constant_expression <RIGHT_BLOCK>
	| direct_abstract_declarator <LEFT_BLOCK> <RIGHT_BLOCK>
	| direct_abstract_declarator <LEFT_BLOCK> constant_expression <RIGHT_BLOCK>
	| ""("" "")""
	| ""("" parameter_type_list "")""
	| direct_abstract_declarator ""("" "")""
	| direct_abstract_declarator ""("" parameter_type_list "")""
	;
initializer
	: assignment_expression
	| <LEFT_BRACE> initializer_list <RIGHT_BRACE>
	| <LEFT_BRACE> initializer_list "","" <RIGHT_BRACE>
	;
initializer_list
	: initializer
	| initializer_list "","" initializer
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
	: identifier "":"" statement
	| ""case"" constant_expression "":"" statement
	| ""default"" "":"" statement
	;
compound_statement
	: <LEFT_BRACE> <RIGHT_BRACE>
	| <LEFT_BRACE> statement_list <RIGHT_BRACE>
	| <LEFT_BRACE> declaration_list <RIGHT_BRACE>
	| <LEFT_BRACE> declaration_list statement_list <RIGHT_BRACE>
	;
declaration_list
	: declaration
	| declaration_list declaration
	;
statement_list
	: statement
	| statement_list statement
	;
expression_statement
	: "";""
	| expression "";""
	;
selection_statement
	: ""if"" ""("" expression "")"" statement
	| ""if"" ""("" expression "")"" statement ""else"" statement
	| ""switch"" ""("" expression "")"" statement
	;
iteration_statement
	: ""while"" ""("" expression "")"" statement
	| ""do"" statement ""while"" ""("" expression "")"" "";""
	| ""for"" ""("" expression_statement expression_statement "")"" statement
	| ""for"" ""("" expression_statement expression_statement expression "")"" statement
	;
jump_statement
	: ""goto"" identifier "";""
	| ""continue"" "";""
	| ""break"" "";""
	| ""return"" "";""
	| ""return"" expression "";""
	;
external_declaration
	: function_definition
	| declaration
	;
function_definition
	: declaration_specifiers declarator declaration_list compound_statement {{}}
	| declaration_specifiers declarator compound_statement {{}}
	| declarator declaration_list compound_statement {{}}
	| declarator compound_statement {{}}
	;
identifier: <IDENTIFIER> {{}};
typename: <IDENTIFIER> {{}};"