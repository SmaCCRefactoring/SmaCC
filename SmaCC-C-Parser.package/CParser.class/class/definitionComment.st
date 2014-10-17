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

%id <TypeName> <IDENTIFIER> <CONSTANT> ;
%left ""else"" ;

translationUnit
	: external_declaration
	| translationUnit external_declaration
	;
primary_expression
	: <IDENTIFIER>
	| <CONSTANT>
	| <STRING_LITERAL>
	| ""("" expression "")""
	;
postfix_expression
	: primary_expression
	| postfix_expression <LEFT_BLOCK> expression <RIGHT_BLOCK>
	| postfix_expression ""("" "")""
	| postfix_expression ""("" argument_expression_list "")""
	| postfix_expression ""."" <IDENTIFIER>
	| postfix_expression ""->"" <IDENTIFIER>
	| postfix_expression ""++""
	| postfix_expression ""--""
	;
argument_expression_list
	: assignment_expression
	| argument_expression_list "","" assignment_expression
	;
unary_expression
	: postfix_expression
	| ""++"" unary_expression
	| ""--"" unary_expression
	| unary_operator cast_expression
	| ""sizeof"" unary_expression
	| ""sizeof"" ""("" type_name "")""
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
	| ""("" type_name "")"" cast_expression
	;
multiplicative_expression
	: cast_expression
	| multiplicative_expression ""*"" cast_expression
	| multiplicative_expression ""/"" cast_expression
	| multiplicative_expression ""%"" cast_expression
	;
additive_expression
	: multiplicative_expression
	| additive_expression ""+"" multiplicative_expression
	| additive_expression ""-"" multiplicative_expression
	;
shift_expression
	: additive_expression
	| shift_expression ""<<"" additive_expression
	| shift_expression "">>"" additive_expression
	;
relational_expression
	: shift_expression
	| relational_expression ""<"" shift_expression
	| relational_expression "">"" shift_expression
	| relational_expression ""<="" shift_expression
	| relational_expression "">="" shift_expression
	;
equality_expression
	: relational_expression
	| equality_expression ""=="" relational_expression
	| equality_expression ""!="" relational_expression
	;
and_expression
	: equality_expression
	| and_expression ""&"" equality_expression
	;
exclusive_or_expression
	: and_expression
	| exclusive_or_expression ""^"" and_expression
	;
inclusive_or_expression
	: exclusive_or_expression
	| inclusive_or_expression ""|"" exclusive_or_expression
	;
logical_and_expression
	: inclusive_or_expression
	| logical_and_expression ""&&"" inclusive_or_expression
	;
logical_or_expression
	: logical_and_expression
	| logical_or_expression ""||"" logical_and_expression
	;
conditional_expression
	: logical_or_expression
	| logical_or_expression ""?"" expression "":"" conditional_expression
	;
assignment_expression
	: conditional_expression
	| unary_expression assignment_operator assignment_expression
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
	: declaration_specifiers "";""
	| init_declaration "";""
	;
init_declaration
	: declaration_specifiers init_declarator_list 
		{'1' first value = 'typedef'
			ifTrue: 
				[1 to: '2' size by: 2 do: [:i | self addTypeName: ('2' at: i) value]].
		self reduceFor: nodes}
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
	| <TypeName>
	;
struct_or_union_specifier
	: struct_or_union <IDENTIFIER> <LEFT_BRACE> struct_declaration_list <RIGHT_BRACE> {self addTypeName: '2' value. self reduceFor: nodes}
	| struct_or_union <LEFT_BRACE> struct_declaration_list <RIGHT_BRACE>
	| struct_or_union <IDENTIFIER> {self addTypeName: '2' value. self reduceFor: nodes}
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
	| ""enum"" <IDENTIFIER> <LEFT_BRACE> enumerator_list <RIGHT_BRACE>  {self addTypeName: '2' value. self reduceFor: nodes}
	| ""enum"" <IDENTIFIER>  {self addTypeName: '2' value. self reduceFor: nodes}
	;
enumerator_list
	: enumerator
	| enumerator_list "","" enumerator
	;
enumerator
	: <IDENTIFIER>
	| <IDENTIFIER> ""="" constant_expression
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
	: <IDENTIFIER>
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
	: <IDENTIFIER>
	| identifier_list "","" <IDENTIFIER>
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
	: <IDENTIFIER> "":"" statement
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
	: ""goto"" <IDENTIFIER> "";""
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
	: declaration_specifiers declarator declaration_list compound_statement
	| declaration_specifiers declarator compound_statement
	| declarator declaration_list compound_statement
	| declarator compound_statement
	;"
