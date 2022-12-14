"
I am the C parser
"
Class {
	#name : #CParser,
	#superclass : #SmaCCParser,
	#category : 'SmaCC-C-Parser'
}

{ #category : #'generated-accessing' }
CParser class >> cacheId [
	^'2017-12-12T16:51:43.28242+01:00'
]

{ #category : #generated }
CParser class >> definitionComment [
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
]

{ #category : #'file types' }
CParser class >> fileExtension [
	^ '.c'
]

{ #category : #'file types' }
CParser class >> fileExtensionType [
	^ 'C files'
]

{ #category : #'generated-accessing' }
CParser class >> scannerClass [
	^CScanner
]

{ #category : #generated }
CParser class >> startingStateFortranslationUnit [
	^ 1
]

{ #category : #scanning }
CParser >> addTypeName: aString [
	scanner addTypeName: aString
]

{ #category : #'generated-reduction actions' }
CParser >> reduceActionForenum_specifier3: nodes [
	self addTypeName: (nodes at: 2) value.
	^ self reduceFor: nodes
]

{ #category : #'generated-reduction actions' }
CParser >> reduceActionForinit_declaration1: nodes [
	(nodes at: 1) first value = 'typedef'
		ifTrue: [ 1 to: (nodes at: 2) size by: 2 do: [ :i | self addTypeName: ((nodes at: 2) at: i) value ] ].
	^ self reduceFor: nodes
]

{ #category : #generated }
CParser >> reduceTable [
^#(
	#(127 1 #reduceFor:) 
	#(111 1 #reduceFor:) 
	#(117 1 #reduceFor:) 
	#(110 1 #reduceFor:) 
	#(109 1 #reduceFor:) 
	#(128 1 #reduceFor:) 
	#(151 1 #reduceFor:) 
	#(133 1 #reduceFor:) 
	#(113 1 #reduceFor:) 
	#(120 1 #reduceFor:) 
	#(131 1 #reduceFor:) 
	#(127 2 #reduceFor:) 
	#(116 2 #reduceActionForenum_specifier3:) 
	#(107 2 #reduceFor:) 
	#(133 2 #reduceFor:) 
	#(146 1 #reduceFor:) 
	#(147 2 #reduceFor:) 
	#(115 2 #reduceActionForenum_specifier3:) 
	#(120 2 #reduceFor:) 
	#(113 2 #reduceFor:) 
	#(106 2 #reduceActionForinit_declaration1:) 
	#(108 1 #reduceFor:) 
	#(112 1 #reduceFor:) 
	#(128 3 #reduceFor:) 
	#(131 2 #reduceFor:) 
	#(127 3 #reduceFor:) 
	#(126 1 #reduceFor:) 
	#(125 1 #reduceFor:) 
	#(89 1 #reduceFor:) 
	#(140 1 #reduceFor:) 
	#(85 1 #reduceFor:) 
	#(139 2 #reduceFor:) 
	#(88 1 #reduceFor:) 
	#(84 1 #reduceFor:) 
	#(105 1 #reduceFor:) 
	#(90 1 #reduceFor:) 
	#(92 1 #reduceFor:) 
	#(93 1 #reduceFor:) 
	#(94 1 #reduceFor:) 
	#(95 1 #reduceFor:) 
	#(96 1 #reduceFor:) 
	#(97 1 #reduceFor:) 
	#(98 1 #reduceFor:) 
	#(99 1 #reduceFor:) 
	#(100 1 #reduceFor:) 
	#(101 1 #reduceFor:) 
	#(102 1 #reduceFor:) 
	#(87 1 #reduceFor:) 
	#(144 1 #reduceFor:) 
	#(145 1 #reduceFor:) 
	#(146 2 #reduceFor:) 
	#(147 3 #reduceFor:) 
	#(122 1 #reduceFor:) 
	#(119 1 #reduceFor:) 
	#(130 1 #reduceFor:) 
	#(129 1 #reduceFor:) 
	#(134 1 #reduceFor:) 
	#(132 1 #reduceFor:) 
	#(104 1 #reduceFor:) 
	#(116 4 #reduceFor:) 
	#(143 2 #reduceFor:) 
	#(88 2 #reduceFor:) 
	#(91 1 #reduceFor:) 
	#(84 2 #reduceFor:) 
	#(103 1 #reduceFor:) 
	#(140 2 #reduceFor:) 
	#(139 3 #reduceFor:) 
	#(145 2 #reduceFor:) 
	#(122 2 #reduceFor:) 
	#(115 4 #reduceFor:) 
	#(119 2 #reduceFor:) 
	#(124 1 #reduceFor:) 
	#(123 1 #reduceFor:) 
	#(128 4 #reduceFor:) 
	#(134 2 #reduceFor:) 
	#(135 1 #reduceFor:) 
	#(108 3 #reduceFor:) 
	#(114 1 #reduceFor:) 
	#(112 3 #reduceFor:) 
	#(147 4 #reduceFor:) 
	#(116 5 #reduceActionForenum_specifier3:) 
	#(126 3 #reduceFor:) 
	#(125 3 #reduceFor:) 
	#(143 3 #reduceFor:) 
	#(85 3 #reduceFor:) 
	#(91 2 #reduceFor:) 
	#(138 3 #reduceFor:) 
	#(84 3 #reduceFor:) 
	#(86 1 #reduceFor:) 
	#(87 3 #reduceFor:) 
	#(92 3 #reduceFor:) 
	#(93 3 #reduceFor:) 
	#(94 3 #reduceFor:) 
	#(95 3 #reduceFor:) 
	#(96 3 #reduceFor:) 
	#(97 3 #reduceFor:) 
	#(98 3 #reduceFor:) 
	#(99 3 #reduceFor:) 
	#(100 3 #reduceFor:) 
	#(101 3 #reduceFor:) 
	#(105 3 #reduceFor:) 
	#(139 4 #reduceFor:) 
	#(115 5 #reduceActionForenum_specifier3:) 
	#(124 2 #reduceFor:) 
	#(121 3 #reduceFor:) 
	#(130 3 #reduceFor:) 
	#(129 3 #reduceFor:) 
	#(132 3 #reduceFor:) 
	#(136 2 #reduceFor:) 
	#(135 2 #reduceFor:) 
	#(137 1 #reduceFor:) 
	#(88 4 #reduceFor:) 
	#(90 4 #reduceFor:) 
	#(138 4 #reduceFor:) 
	#(84 4 #reduceFor:) 
	#(124 3 #reduceFor:) 
	#(123 3 #reduceFor:) 
	#(136 3 #reduceFor:) 
	#(114 3 #reduceFor:) 
	#(141 5 #reduceFor:) 
	#(142 5 #reduceFor:) 
	#(86 3 #reduceFor:) 
	#(102 5 #reduceFor:) 
	#(136 4 #reduceFor:) 
	#(114 4 #reduceFor:) 
	#(137 3 #reduceFor:) 
	#(142 6 #reduceFor:) 
	#(141 7 #reduceFor:) 
	#(142 7 #reduceFor:)
	).
]

{ #category : #generated }
CParser >> symbolNames [
	^ #('"^"' '"|"' '"=="' '"!="' '"&&"' '">"' '"<="' '">="' '"||"' '"%="' '"+="' '"*="' '"/="' '">>"' '"?"' '":"' '"="' '"<"' '"return"' '"--"' '","' '"->"' '"++"' '"sizeof"' '"("' '")"' '"."' '"&"' '"/"' '"%"' '"~"' '"!"' '"<<"' '"*"' '"+"' '"-"' '"-="' '"case"' '"default"' '"const"' '"volatile"' '"if"' '"struct"' '"union"' '"enum"' '"else"' '"continue"' '"break"' '"for"' '"goto"' '"unsigned"' '"switch"' '"while"' '"do"' '"<<="' '"signed"' '"typedef"' '"extern"' '"|="' '";"' '"double"' '">>="' '"&="' '"^="' '"static"' '"long"' '"float"' '"int"' '"auto"' '"short"' '"char"' '"register"' '"void"' '<ELLIPSIS>' '<comment>' '<IDENTIFIER>' '<CONSTANT>' '<STRING_LITERAL>' '<LEFT_BLOCK>' '<RIGHT_BLOCK>' '<LEFT_BRACE>' '<RIGHT_BRACE>' '<whitespace>' 'postfix_expression' 'primary_expression' 'argument_expression_list' 'assignment_expression' 'unary_expression' 'unary_operator' 'cast_expression' 'type_name' 'multiplicative_expression' 'additive_expression' 'shift_expression' 'relational_expression' 'equality_expression' 'and_expression' 'exclusive_or_expression' 'inclusive_or_expression' 'logical_and_expression' 'logical_or_expression' 'conditional_expression' 'assignment_operator' 'constant_expression' 'expression' 'init_declaration' 'declaration' 'init_declarator_list' 'storage_class_specifier' 'type_specifier' 'type_qualifier' 'init_declarator' 'declarator' 'initializer' 'struct_or_union_specifier' 'enum_specifier' 'struct_or_union' 'B e g i n' 'struct_declaration_list' 'translationUnit' 'struct_declaration' 'specifier_qualifier_list' 'struct_declarator_list' 'struct_declarator' 'enumerator_list' 'enumerator' 'pointer' 'direct_declarator' 'parameter_type_list' 'identifier_list' 'type_qualifier_list' 'parameter_list' 'declaration_specifiers' 'parameter_declaration' 'abstract_declarator' 'direct_abstract_declarator' 'initializer_list' 'labeled_statement' 'compound_statement' 'expression_statement' 'selection_statement' 'iteration_statement' 'jump_statement' 'statement' 'statement_list' 'declaration_list' 'function_definition' 'E O F' 'error' '<TypeName>' 'external_declaration')
]

{ #category : #generated }
CParser >> transitionTable [
^#(
#[1 0 9 0 25 0 13 0 34 0 17 0 40 0 21 0 41 0 25 0 43 0 29 0 44 0 33 0 45 0 37 0 51 0 41 0 56 0 45 0 57 0 49 0 58 0 53 0 61 0 57 0 65 0 61 0 66 0 65 0 67 0 69 0 68 0 73 0 69 0 77 0 70 0 81 0 71 0 85 0 72 0 89 0 73 0 93 0 76 0 97 0 106 0 101 0 107 0 105 0 109 0 109 0 110 0 113 0 111 0 117 0 113 0 121 0 115 0 125 0 116 0 129 0 117 0 133 0 120 0 137 0 127 0 141 0 128 0 145 0 133 0 149 0 147 0 153 0 150 0 157 0 151] 
#[1 0 9 0 25 0 13 0 34 0 93 0 76 0 161 0 113 0 137 0 127 0 141 0 128] 
#[1 0 6 0 21 0 6 0 25 0 6 0 26 0 13 0 34 0 17 0 40 0 21 0 41 0 6 0 76 0 6 0 79 0 165 0 111 0 169 0 127 0 173 0 131] 
#[0 0 10 0 16 0 21 0 25 0 26 0 34 0 40 0 41 0 43 0 44 0 45 0 51 0 56 0 57 0 58 0 60 0 61 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 76 0 79 0 150] 
#[0 0 10 0 16 0 21 0 25 0 26 0 34 0 40 0 41 0 43 0 44 0 45 0 51 0 56 0 57 0 58 0 60 0 61 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 76 0 79 0 150] 
#[0 0 14 0 76 0 81] 
#[0 0 14 0 76 0 81] 
#[1 0 177 0 76 0 181 0 81] 
#[0 0 18 0 16 0 21 0 25 0 26 0 34 0 40 0 41 0 43 0 44 0 45 0 51 0 56 0 57 0 58 0 60 0 61 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 76 0 79 0 150] 
#[0 0 18 0 16 0 21 0 25 0 26 0 34 0 40 0 41 0 43 0 44 0 45 0 51 0 56 0 57 0 58 0 60 0 61 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 76 0 79 0 150] 
#[0 0 22 0 21 0 25 0 26 0 34 0 40 0 41 0 43 0 44 0 45 0 51 0 56 0 57 0 58 0 60 0 61 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 76 0 79 0 150] 
#[0 0 22 0 21 0 25 0 26 0 34 0 40 0 41 0 43 0 44 0 45 0 51 0 56 0 57 0 58 0 60 0 61 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 76 0 79 0 150] 
#[0 0 18 0 16 0 21 0 25 0 26 0 34 0 40 0 41 0 43 0 44 0 45 0 51 0 56 0 57 0 58 0 60 0 61 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 76 0 79 0 150] 
#[0 0 22 0 21 0 25 0 26 0 34 0 40 0 41 0 43 0 44 0 45 0 51 0 56 0 57 0 58 0 60 0 61 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 76 0 79 0 150] 
#[0 0 18 0 16 0 21 0 25 0 26 0 34 0 40 0 41 0 43 0 44 0 45 0 51 0 56 0 57 0 58 0 60 0 61 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 76 0 79 0 150] 
#[0 0 18 0 16 0 21 0 25 0 26 0 34 0 40 0 41 0 43 0 44 0 45 0 51 0 56 0 57 0 58 0 60 0 61 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 76 0 79 0 150] 
#[0 0 18 0 16 0 21 0 25 0 26 0 34 0 40 0 41 0 43 0 44 0 45 0 51 0 56 0 57 0 58 0 60 0 61 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 76 0 79 0 150] 
#[0 0 22 0 21 0 25 0 26 0 34 0 40 0 41 0 43 0 44 0 45 0 51 0 56 0 57 0 58 0 60 0 61 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 76 0 79 0 150] 
#[0 0 18 0 16 0 21 0 25 0 26 0 34 0 40 0 41 0 43 0 44 0 45 0 51 0 56 0 57 0 58 0 60 0 61 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 76 0 79 0 150] 
#[0 0 18 0 16 0 21 0 25 0 26 0 34 0 40 0 41 0 43 0 44 0 45 0 51 0 56 0 57 0 58 0 60 0 61 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 76 0 79 0 150] 
#[0 0 22 0 21 0 25 0 26 0 34 0 40 0 41 0 43 0 44 0 45 0 51 0 56 0 57 0 58 0 60 0 61 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 76 0 79 0 150] 
#[0 0 18 0 16 0 21 0 25 0 26 0 34 0 40 0 41 0 43 0 44 0 45 0 51 0 56 0 57 0 58 0 60 0 61 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 76 0 79 0 150] 
#[0 0 26 0 16 0 17 0 21 0 25 0 26 0 40 0 41 0 43 0 44 0 45 0 51 0 56 0 57 0 58 0 60 0 61 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 79 0 81 0 150] 
#[0 0 185 0 60] 
#[0 0 30 0 25 0 34 0 40 0 41 0 43 0 44 0 45 0 51 0 56 0 57 0 58 0 61 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 76 0 148 0 150] 
#[1 0 34 0 21 0 34 0 25 0 34 0 26 0 34 0 34 0 17 0 40 0 21 0 41 0 25 0 43 0 29 0 44 0 33 0 45 0 37 0 51 0 41 0 56 0 45 0 57 0 49 0 58 0 34 0 60 0 53 0 61 0 57 0 65 0 61 0 66 0 65 0 67 0 69 0 68 0 73 0 69 0 77 0 70 0 81 0 71 0 85 0 72 0 89 0 73 0 34 0 76 0 34 0 79 0 105 0 109 0 109 0 110 0 113 0 111 0 121 0 115 0 125 0 116 0 129 0 117 0 189 0 133 0 153 0 150] 
#[1 0 34 0 21 0 34 0 25 0 34 0 26 0 34 0 34 0 17 0 40 0 21 0 41 0 25 0 43 0 29 0 44 0 33 0 45 0 37 0 51 0 41 0 56 0 45 0 57 0 49 0 58 0 34 0 60 0 53 0 61 0 57 0 65 0 61 0 66 0 65 0 67 0 69 0 68 0 73 0 69 0 77 0 70 0 81 0 71 0 85 0 72 0 89 0 73 0 34 0 76 0 34 0 79 0 105 0 109 0 109 0 110 0 113 0 111 0 121 0 115 0 125 0 116 0 129 0 117 0 193 0 133 0 153 0 150] 
#[1 0 34 0 21 0 34 0 25 0 34 0 26 0 34 0 34 0 17 0 40 0 21 0 41 0 25 0 43 0 29 0 44 0 33 0 45 0 37 0 51 0 41 0 56 0 45 0 57 0 49 0 58 0 34 0 60 0 53 0 61 0 57 0 65 0 61 0 66 0 65 0 67 0 69 0 68 0 73 0 69 0 77 0 70 0 81 0 71 0 85 0 72 0 89 0 73 0 34 0 76 0 34 0 79 0 105 0 109 0 109 0 110 0 113 0 111 0 121 0 115 0 125 0 116 0 129 0 117 0 197 0 133 0 153 0 150] 
#[1 0 17 0 40 0 21 0 41 0 25 0 43 0 29 0 44 0 33 0 45 0 37 0 51 0 41 0 56 0 45 0 57 0 49 0 58 0 53 0 61 0 57 0 65 0 61 0 66 0 65 0 67 0 69 0 68 0 73 0 69 0 77 0 70 0 81 0 71 0 85 0 72 0 89 0 73 0 201 0 81 0 97 0 106 0 205 0 107 0 105 0 109 0 109 0 110 0 113 0 111 0 121 0 115 0 125 0 116 0 129 0 117 0 209 0 133 0 213 0 139 0 217 0 146 0 153 0 150] 
#[0 0 18 0 16 0 21 0 25 0 26 0 34 0 40 0 41 0 43 0 44 0 45 0 51 0 56 0 57 0 58 0 60 0 61 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 76 0 79 0 150] 
#[0 0 18 0 16 0 21 0 25 0 26 0 34 0 40 0 41 0 43 0 44 0 45 0 51 0 56 0 57 0 58 0 60 0 61 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 76 0 79 0 150] 
#[1 0 221 0 76 0 225 0 81] 
#[1 0 9 0 25 0 13 0 34 0 17 0 40 0 21 0 41 0 25 0 43 0 29 0 44 0 33 0 45 0 37 0 51 0 41 0 56 0 45 0 57 0 49 0 58 0 53 0 61 0 57 0 65 0 61 0 66 0 65 0 67 0 69 0 68 0 73 0 69 0 77 0 70 0 81 0 71 0 85 0 72 0 89 0 73 0 93 0 76 0 97 0 106 0 101 0 107 0 105 0 109 0 109 0 110 0 113 0 111 0 117 0 113 0 121 0 115 0 125 0 116 0 129 0 117 0 137 0 127 0 141 0 128 0 145 0 133 0 149 0 147 0 0 0 148 0 153 0 150 0 229 0 151] 
#[1 0 9 0 25 0 93 0 76 0 233 0 128] 
#[1 0 38 0 16 0 38 0 17 0 38 0 21 0 237 0 25 0 38 0 26 0 38 0 40 0 38 0 41 0 38 0 43 0 38 0 44 0 38 0 45 0 38 0 51 0 38 0 56 0 38 0 57 0 38 0 58 0 38 0 60 0 38 0 61 0 38 0 65 0 38 0 66 0 38 0 67 0 38 0 68 0 38 0 69 0 38 0 70 0 38 0 71 0 38 0 72 0 38 0 73 0 241 0 79 0 38 0 81 0 38 0 150] 
#[1 0 9 0 25 0 13 0 34 0 245 0 60 0 93 0 76 0 249 0 108 0 253 0 112 1 1 0 113 0 137 0 127 0 141 0 128] 
#[0 0 30 0 25 0 34 0 40 0 41 0 43 0 44 0 45 0 51 0 56 0 57 0 58 0 61 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 76 0 148 0 150] 
#[0 0 18 0 16 0 21 0 25 0 26 0 34 0 40 0 41 0 43 0 44 0 45 0 51 0 56 0 57 0 58 0 60 0 61 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 76 0 79 0 150] 
#[0 0 42 0 25 0 34 0 40 0 41 0 43 0 44 0 45 0 51 0 56 0 57 0 58 0 61 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 76 0 148 0 150] 
#[0 1 5 0 26] 
#[0 0 46 0 21 0 25 0 26 0 34 0 40 0 41 0 76 0 79] 
#[0 0 50 0 21 0 25 0 26 0 76 0 79] 
#[1 0 50 0 21 0 50 0 25 0 50 0 26 0 13 0 34 0 17 0 40 0 21 0 41 0 50 0 76 0 50 0 79 1 9 0 111 1 13 0 127] 
#[1 0 54 0 16 0 54 0 21 0 54 0 25 0 54 0 26 0 54 0 34 0 54 0 40 0 54 0 41 0 54 0 43 0 54 0 44 0 54 0 45 0 54 0 51 0 54 0 56 0 54 0 57 0 54 0 58 0 54 0 60 0 54 0 61 0 54 0 65 0 54 0 66 0 54 0 67 0 54 0 68 0 54 0 69 0 54 0 70 0 54 0 71 0 54 0 72 0 54 0 73 0 54 0 76 0 54 0 79 1 17 0 81 0 54 0 150] 
#[1 1 21 0 76 1 25 0 125 1 29 0 126] 
#[0 0 58 0 19 0 20 0 23 0 24 0 25 0 28 0 31 0 32 0 34 0 35 0 36 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 57 0 58 0 60 0 61 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 76 0 77 0 78 0 81 0 82 0 148 0 150] 
#[0 0 62 0 21 0 25 0 26 0 34 0 60 0 76 0 79] 
#[0 0 62 0 21 0 25 0 26 0 34 0 60 0 76 0 79] 
#[0 0 62 0 21 0 25 0 26 0 34 0 60 0 76 0 79] 
#[1 1 33 0 19 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 1 77 0 38 1 81 0 39 0 17 0 40 0 21 0 41 1 85 0 42 0 25 0 43 0 29 0 44 0 33 0 45 1 89 0 47 1 93 0 48 1 97 0 49 1 101 0 50 0 37 0 51 1 105 0 52 1 109 0 53 1 113 0 54 0 41 0 56 0 45 0 57 0 49 0 58 1 117 0 60 0 53 0 61 0 57 0 65 0 61 0 66 0 65 0 67 0 69 0 68 0 73 0 69 0 77 0 70 0 81 0 71 0 85 0 72 0 89 0 73 1 121 0 76 1 125 0 77 1 129 0 78 0 201 0 81 1 133 0 82 1 137 0 84 1 141 0 85 1 145 0 87 1 149 0 88 1 153 0 89 1 157 0 90 1 161 0 92 1 165 0 93 1 169 0 94 1 173 0 95 1 177 0 96 1 181 0 97 1 185 0 98 1 189 0 99 1 193 0 100 1 197 0 101 1 201 0 102 1 205 0 105 0 97 0 106 0 205 0 107 0 105 0 109 0 109 0 110 0 113 0 111 0 121 0 115 0 125 0 116 0 129 0 117 0 209 0 133 1 209 0 138 1 213 0 139 1 217 0 140 1 221 0 141 1 225 0 142 1 229 0 143 1 233 0 144 1 237 0 145 1 241 0 146 0 153 0 150] 
#[0 0 66 0 19 0 20 0 23 0 24 0 25 0 28 0 31 0 32 0 34 0 35 0 36 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 57 0 58 0 60 0 61 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 76 0 77 0 78 0 81 0 82 0 150] 
#[1 0 9 0 25 0 13 0 34 0 245 0 60 0 93 0 76 0 249 0 108 0 253 0 112 1 245 0 113 0 137 0 127 0 141 0 128] 
#[0 0 70 0 25 0 34 0 40 0 41 0 43 0 44 0 45 0 51 0 56 0 57 0 58 0 61 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 76 0 148 0 150] 
#[1 0 17 0 40 0 21 0 41 0 25 0 43 0 29 0 44 0 33 0 45 0 37 0 51 0 41 0 56 0 45 0 57 0 49 0 58 0 53 0 61 0 57 0 65 0 61 0 66 0 65 0 67 0 69 0 68 0 73 0 69 0 77 0 70 0 81 0 71 0 85 0 72 0 89 0 73 0 201 0 81 0 97 0 106 1 249 0 107 0 105 0 109 0 109 0 110 0 113 0 111 0 121 0 115 0 125 0 116 0 129 0 117 0 209 0 133 1 253 0 139 0 153 0 150] 
#[1 0 74 0 16 0 74 0 21 0 74 0 25 0 74 0 26 0 74 0 34 0 74 0 40 0 74 0 41 0 74 0 43 0 74 0 44 0 74 0 45 0 74 0 51 0 74 0 56 0 74 0 57 0 74 0 58 0 74 0 60 0 74 0 61 0 74 0 65 0 74 0 66 0 74 0 67 0 74 0 68 0 74 0 69 0 74 0 70 0 74 0 71 0 74 0 72 0 74 0 73 0 74 0 76 0 74 0 79 2 1 0 81 0 74 0 150] 
#[1 0 17 0 40 0 21 0 41 0 25 0 43 0 29 0 44 0 33 0 45 0 37 0 51 0 41 0 56 0 53 0 61 0 61 0 66 0 65 0 67 0 69 0 68 0 77 0 70 0 81 0 71 0 89 0 73 2 5 0 110 2 9 0 111 0 121 0 115 0 125 0 116 0 129 0 117 2 13 0 119 2 17 0 121 2 21 0 122 0 153 0 150] 
#[0 0 78 0 25 0 34 0 40 0 41 0 43 0 44 0 45 0 51 0 56 0 57 0 58 0 61 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 76 0 148 0 150] 
#[1 0 82 0 16 0 82 0 17 0 82 0 21 0 237 0 25 0 82 0 26 0 82 0 40 0 82 0 41 0 82 0 43 0 82 0 44 0 82 0 45 0 82 0 51 0 82 0 56 0 82 0 57 0 82 0 58 0 82 0 60 0 82 0 61 0 82 0 65 0 82 0 66 0 82 0 67 0 82 0 68 0 82 0 69 0 82 0 70 0 82 0 71 0 82 0 72 0 82 0 73 0 241 0 79 0 82 0 81 0 82 0 150] 
#[1 2 25 0 26 0 17 0 40 0 21 0 41 0 25 0 43 0 29 0 44 0 33 0 45 0 37 0 51 0 41 0 56 0 45 0 57 0 49 0 58 0 53 0 61 0 57 0 65 0 61 0 66 0 65 0 67 0 69 0 68 0 73 0 69 0 77 0 70 0 81 0 71 0 85 0 72 0 89 0 73 2 29 0 76 0 105 0 109 0 109 0 110 0 113 0 111 0 121 0 115 0 125 0 116 0 129 0 117 2 33 0 129 2 37 0 130 2 41 0 132 2 45 0 133 2 49 0 134 0 153 0 150] 
#[1 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 2 53 0 76 1 125 0 77 1 129 0 78 2 57 0 80 1 137 0 84 1 141 0 85 2 61 0 88 1 153 0 89 1 157 0 90 1 161 0 92 1 165 0 93 1 169 0 94 1 173 0 95 1 177 0 96 1 181 0 97 1 185 0 98 1 189 0 99 1 193 0 100 1 197 0 101 2 65 0 102 2 69 0 104] 
#[0 0 58 0 19 0 20 0 23 0 24 0 25 0 28 0 31 0 32 0 34 0 35 0 36 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 57 0 58 0 60 0 61 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 76 0 77 0 78 0 81 0 82 0 148 0 150] 
#[1 2 73 0 21 0 86 0 60] 
#[0 0 90 0 21 0 60] 
#[1 2 77 0 17 0 94 0 21 0 17 0 40 0 21 0 41 0 25 0 43 0 29 0 44 0 33 0 45 0 37 0 51 0 41 0 56 0 45 0 57 0 49 0 58 0 94 0 60 0 53 0 61 0 57 0 65 0 61 0 66 0 65 0 67 0 69 0 68 0 73 0 69 0 77 0 70 0 81 0 71 0 85 0 72 0 89 0 73 0 201 0 81 0 97 0 106 0 205 0 107 0 105 0 109 0 109 0 110 0 113 0 111 0 121 0 115 0 125 0 116 0 129 0 117 0 209 0 133 2 81 0 139 2 85 0 146 0 153 0 150] 
#[0 0 98 0 16 0 17 0 21 0 25 0 26 0 40 0 41 0 43 0 44 0 45 0 51 0 56 0 57 0 58 0 60 0 61 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 79 0 81 0 150] 
#[0 0 102 0 21 0 25 0 26 0 34 0 40 0 41 0 76 0 79] 
#[0 0 106 0 21 0 25 0 26 0 76 0 79] 
#[1 1 21 0 76 2 89 0 125 1 29 0 126] 
#[1 2 93 0 17 0 110 0 21 0 110 0 82] 
#[1 2 97 0 21 2 101 0 82] 
#[0 0 114 0 21 0 82] 
#[1 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 2 105 0 60 2 53 0 76 1 125 0 77 1 129 0 78 1 137 0 84 1 141 0 85 1 145 0 87 1 149 0 88 1 153 0 89 1 157 0 90 1 161 0 92 1 165 0 93 1 169 0 94 1 173 0 95 1 177 0 96 1 181 0 97 1 185 0 98 1 189 0 99 1 193 0 100 1 197 0 101 1 201 0 102 2 109 0 105] 
#[1 1 37 0 20 1 41 0 23 1 45 0 24 2 113 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 2 53 0 76 1 125 0 77 1 129 0 78 1 137 0 84 1 141 0 85 2 117 0 88 1 153 0 89] 
#[1 1 37 0 20 1 41 0 23 1 45 0 24 2 113 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 2 53 0 76 1 125 0 77 1 129 0 78 1 137 0 84 1 141 0 85 2 121 0 88 1 153 0 89] 
#[1 1 37 0 20 1 41 0 23 1 45 0 24 2 125 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 2 53 0 76 1 125 0 77 1 129 0 78 1 137 0 84 1 141 0 85 2 129 0 88 1 153 0 89] 
#[1 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 0 17 0 40 0 21 0 41 0 25 0 43 0 29 0 44 0 33 0 45 0 37 0 51 0 41 0 56 0 53 0 61 0 61 0 66 0 65 0 67 0 69 0 68 0 77 0 70 0 81 0 71 0 89 0 73 2 53 0 76 1 125 0 77 1 129 0 78 1 137 0 84 1 141 0 85 1 145 0 87 1 149 0 88 1 153 0 89 1 157 0 90 2 133 0 91 1 161 0 92 1 165 0 93 1 169 0 94 1 173 0 95 1 177 0 96 1 181 0 97 1 185 0 98 1 189 0 99 1 193 0 100 1 197 0 101 1 201 0 102 2 137 0 105 2 5 0 110 2 9 0 111 0 121 0 115 0 125 0 116 0 129 0 117 2 141 0 122 0 153 0 150] 
#[0 0 118 0 20 0 23 0 24 0 25 0 28 0 31 0 32 0 34 0 35 0 36 0 76 0 77 0 78] 
#[0 0 118 0 20 0 23 0 24 0 25 0 28 0 31 0 32 0 34 0 35 0 36 0 76 0 77 0 78] 
#[0 0 118 0 20 0 23 0 24 0 25 0 28 0 31 0 32 0 34 0 35 0 36 0 76 0 77 0 78] 
#[0 0 118 0 20 0 23 0 24 0 25 0 28 0 31 0 32 0 34 0 35 0 36 0 76 0 77 0 78] 
#[0 0 118 0 20 0 23 0 24 0 25 0 28 0 31 0 32 0 34 0 35 0 36 0 76 0 77 0 78] 
#[0 0 118 0 20 0 23 0 24 0 25 0 28 0 31 0 32 0 34 0 35 0 36 0 76 0 77 0 78] 
#[1 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 2 53 0 76 1 125 0 77 1 129 0 78 1 137 0 84 1 141 0 85 2 61 0 88 1 153 0 89 1 157 0 90 1 161 0 92 1 165 0 93 1 169 0 94 1 173 0 95 1 177 0 96 1 181 0 97 1 185 0 98 1 189 0 99 1 193 0 100 1 197 0 101 2 65 0 102 2 145 0 104] 
#[0 2 149 0 16] 
#[0 2 153 0 25] 
#[0 2 157 0 60] 
#[0 2 161 0 60] 
#[0 2 165 0 25] 
#[0 2 169 0 76] 
#[0 2 173 0 25] 
#[0 2 177 0 25] 
#[1 1 33 0 19 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 1 77 0 38 1 81 0 39 1 85 0 42 1 89 0 47 1 93 0 48 1 97 0 49 1 101 0 50 1 105 0 52 1 109 0 53 1 113 0 54 1 117 0 60 1 121 0 76 1 125 0 77 1 129 0 78 0 201 0 81 1 137 0 84 1 141 0 85 1 145 0 87 1 149 0 88 1 153 0 89 1 157 0 90 1 161 0 92 1 165 0 93 1 169 0 94 1 173 0 95 1 177 0 96 1 181 0 97 1 185 0 98 1 189 0 99 1 193 0 100 1 197 0 101 1 201 0 102 1 205 0 105 1 209 0 138 1 213 0 139 1 217 0 140 1 221 0 141 1 225 0 142 1 229 0 143 2 181 0 144] 
#[0 0 122 0 19 0 20 0 23 0 24 0 25 0 26 0 28 0 31 0 32 0 34 0 35 0 36 0 38 0 39 0 42 0 46 0 47 0 48 0 49 0 50 0 52 0 53 0 54 0 60 0 76 0 77 0 78 0 81 0 82] 
#[1 0 126 0 1 0 126 0 2 0 126 0 3 0 126 0 4 0 126 0 5 0 126 0 6 0 126 0 7 0 126 0 8 0 126 0 9 0 126 0 10 0 126 0 11 0 126 0 12 0 126 0 13 0 126 0 14 0 126 0 15 2 185 0 16 0 126 0 17 0 126 0 18 0 126 0 20 0 126 0 21 0 126 0 22 0 126 0 23 0 126 0 25 0 126 0 27 0 126 0 28 0 126 0 29 0 126 0 30 0 126 0 33 0 126 0 34 0 126 0 35 0 126 0 36 0 126 0 37 0 126 0 55 0 126 0 59 0 126 0 60 0 126 0 62 0 126 0 63 0 126 0 64 0 126 0 79] 
#[0 0 126 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 33 0 34 0 35 0 36 0 37 0 55 0 59 0 60 0 62 0 63 0 64 0 79 0 80 0 82] 
#[0 0 126 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 33 0 34 0 35 0 36 0 37 0 55 0 59 0 60 0 62 0 63 0 64 0 79 0 80 0 82] 
#[0 0 130 0 19 0 20 0 23 0 24 0 25 0 28 0 31 0 32 0 34 0 35 0 36 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 57 0 58 0 60 0 61 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 76 0 77 0 78 0 81 0 82 0 148 0 150] 
#[1 0 134 0 1 0 134 0 2 0 134 0 3 0 134 0 4 0 134 0 5 0 134 0 6 0 134 0 7 0 134 0 8 0 134 0 9 0 134 0 10 0 134 0 11 0 134 0 12 0 134 0 13 0 134 0 14 0 134 0 15 0 134 0 16 0 134 0 17 0 134 0 18 2 189 0 20 0 134 0 21 2 193 0 22 2 197 0 23 2 201 0 25 0 134 0 26 2 205 0 27 0 134 0 28 0 134 0 29 0 134 0 30 0 134 0 33 0 134 0 34 0 134 0 35 0 134 0 36 0 134 0 37 0 134 0 55 0 134 0 59 0 134 0 60 0 134 0 62 0 134 0 63 0 134 0 64 2 209 0 79 0 134 0 80 0 134 0 82] 
#[0 0 138 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 33 0 34 0 35 0 36 0 37 0 55 0 59 0 60 0 62 0 63 0 64 0 79 0 80 0 82] 
#[0 0 142 0 16 0 21 0 26 0 60 0 80] 
#[1 0 146 0 1 0 146 0 2 0 146 0 3 0 146 0 4 0 146 0 5 0 146 0 6 0 146 0 7 0 146 0 8 0 146 0 9 2 213 0 10 2 217 0 11 2 221 0 12 2 225 0 13 0 146 0 14 0 146 0 15 0 146 0 16 2 229 0 17 0 146 0 18 0 146 0 21 0 146 0 26 0 146 0 28 0 146 0 29 0 146 0 30 0 146 0 33 0 146 0 34 0 146 0 35 0 146 0 36 2 233 0 37 2 237 0 55 2 241 0 59 0 146 0 60 2 245 0 62 2 249 0 63 2 253 0 64 0 146 0 80 0 146 0 82 3 1 0 103] 
#[1 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 2 53 0 76 1 125 0 77 1 129 0 78 1 137 0 84 1 141 0 85 2 61 0 88 1 153 0 89 3 5 0 90] 
#[0 0 150 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 14 0 15 0 16 0 18 0 21 0 26 0 28 0 29 0 30 0 33 0 34 0 35 0 36 0 60 0 80 0 82] 
#[1 0 154 0 1 0 154 0 2 0 154 0 3 0 154 0 4 0 154 0 5 0 154 0 6 0 154 0 7 0 154 0 8 0 154 0 9 0 154 0 14 0 154 0 15 0 154 0 16 0 154 0 18 0 154 0 21 0 154 0 26 0 154 0 28 3 9 0 29 3 13 0 30 0 154 0 33 3 17 0 34 0 154 0 35 0 154 0 36 0 154 0 60 0 154 0 80 0 154 0 82] 
#[1 0 158 0 1 0 158 0 2 0 158 0 3 0 158 0 4 0 158 0 5 0 158 0 6 0 158 0 7 0 158 0 8 0 158 0 9 0 158 0 14 0 158 0 15 0 158 0 16 0 158 0 18 0 158 0 21 0 158 0 26 0 158 0 28 0 158 0 33 3 21 0 35 3 25 0 36 0 158 0 60 0 158 0 80 0 158 0 82] 
#[1 0 162 0 1 0 162 0 2 0 162 0 3 0 162 0 4 0 162 0 5 0 162 0 6 0 162 0 7 0 162 0 8 0 162 0 9 3 29 0 14 0 162 0 15 0 162 0 16 0 162 0 18 0 162 0 21 0 162 0 26 0 162 0 28 3 33 0 33 0 162 0 60 0 162 0 80 0 162 0 82] 
#[1 0 166 0 1 0 166 0 2 0 166 0 3 0 166 0 4 0 166 0 5 3 37 0 6 3 41 0 7 3 45 0 8 0 166 0 9 0 166 0 15 0 166 0 16 3 49 0 18 0 166 0 21 0 166 0 26 0 166 0 28 0 166 0 60 0 166 0 80 0 166 0 82] 
#[1 0 170 0 1 0 170 0 2 3 53 0 3 3 57 0 4 0 170 0 5 0 170 0 9 0 170 0 15 0 170 0 16 0 170 0 21 0 170 0 26 0 170 0 28 0 170 0 60 0 170 0 80 0 170 0 82] 
#[1 0 174 0 1 0 174 0 2 0 174 0 5 0 174 0 9 0 174 0 15 0 174 0 16 0 174 0 21 0 174 0 26 3 61 0 28 0 174 0 60 0 174 0 80 0 174 0 82] 
#[1 3 65 0 1 0 178 0 2 0 178 0 5 0 178 0 9 0 178 0 15 0 178 0 16 0 178 0 21 0 178 0 26 0 178 0 60 0 178 0 80 0 178 0 82] 
#[1 3 69 0 2 0 182 0 5 0 182 0 9 0 182 0 15 0 182 0 16 0 182 0 21 0 182 0 26 0 182 0 60 0 182 0 80 0 182 0 82] 
#[1 3 73 0 5 0 186 0 9 0 186 0 15 0 186 0 16 0 186 0 21 0 186 0 26 0 186 0 60 0 186 0 80 0 186 0 82] 
#[1 3 77 0 9 3 81 0 15 0 190 0 16 0 190 0 21 0 190 0 26 0 190 0 60 0 190 0 80 0 190 0 82] 
#[0 0 194 0 16 0 21 0 26 0 60 0 80 0 82] 
#[1 3 85 0 21 3 89 0 60] 
#[0 0 198 0 19 0 20 0 23 0 24 0 25 0 28 0 31 0 32 0 34 0 35 0 36 0 38 0 39 0 42 0 46 0 47 0 48 0 49 0 50 0 52 0 53 0 54 0 60 0 76 0 77 0 78 0 81 0 82] 
#[0 0 198 0 19 0 20 0 23 0 24 0 25 0 28 0 31 0 32 0 34 0 35 0 36 0 38 0 39 0 42 0 46 0 47 0 48 0 49 0 50 0 52 0 53 0 54 0 60 0 76 0 77 0 78 0 81 0 82] 
#[0 0 198 0 19 0 20 0 23 0 24 0 25 0 28 0 31 0 32 0 34 0 35 0 36 0 38 0 39 0 42 0 46 0 47 0 48 0 49 0 50 0 52 0 53 0 54 0 60 0 76 0 77 0 78 0 81 0 82] 
#[0 0 198 0 19 0 20 0 23 0 24 0 25 0 28 0 31 0 32 0 34 0 35 0 36 0 38 0 39 0 42 0 46 0 47 0 48 0 49 0 50 0 52 0 53 0 54 0 60 0 76 0 77 0 78 0 81 0 82] 
#[0 0 198 0 19 0 20 0 23 0 24 0 25 0 28 0 31 0 32 0 34 0 35 0 36 0 38 0 39 0 42 0 46 0 47 0 48 0 49 0 50 0 52 0 53 0 54 0 60 0 76 0 77 0 78 0 81 0 82] 
#[0 0 198 0 19 0 20 0 23 0 24 0 25 0 28 0 31 0 32 0 34 0 35 0 36 0 38 0 39 0 42 0 46 0 47 0 48 0 49 0 50 0 52 0 53 0 54 0 60 0 76 0 77 0 78 0 81 0 82] 
#[0 0 202 0 19 0 20 0 23 0 24 0 25 0 28 0 31 0 32 0 34 0 35 0 36 0 38 0 39 0 42 0 47 0 48 0 49 0 50 0 52 0 53 0 54 0 60 0 76 0 77 0 78 0 81 0 82] 
#[1 1 33 0 19 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 1 77 0 38 1 81 0 39 1 85 0 42 1 89 0 47 1 93 0 48 1 97 0 49 1 101 0 50 1 105 0 52 1 109 0 53 1 113 0 54 1 117 0 60 1 121 0 76 1 125 0 77 1 129 0 78 0 201 0 81 3 93 0 82 1 137 0 84 1 141 0 85 1 145 0 87 1 149 0 88 1 153 0 89 1 157 0 90 1 161 0 92 1 165 0 93 1 169 0 94 1 173 0 95 1 177 0 96 1 181 0 97 1 185 0 98 1 189 0 99 1 193 0 100 1 197 0 101 1 201 0 102 1 205 0 105 1 209 0 138 1 213 0 139 1 217 0 140 1 221 0 141 1 225 0 142 1 229 0 143 3 97 0 144] 
#[1 1 33 0 19 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 1 77 0 38 1 81 0 39 0 17 0 40 0 21 0 41 1 85 0 42 0 25 0 43 0 29 0 44 0 33 0 45 1 89 0 47 1 93 0 48 1 97 0 49 1 101 0 50 0 37 0 51 1 105 0 52 1 109 0 53 1 113 0 54 0 41 0 56 0 45 0 57 0 49 0 58 1 117 0 60 0 53 0 61 0 57 0 65 0 61 0 66 0 65 0 67 0 69 0 68 0 73 0 69 0 77 0 70 0 81 0 71 0 85 0 72 0 89 0 73 1 121 0 76 1 125 0 77 1 129 0 78 0 201 0 81 3 101 0 82 1 137 0 84 1 141 0 85 1 145 0 87 1 149 0 88 1 153 0 89 1 157 0 90 1 161 0 92 1 165 0 93 1 169 0 94 1 173 0 95 1 177 0 96 1 181 0 97 1 185 0 98 1 189 0 99 1 193 0 100 1 197 0 101 1 201 0 102 1 205 0 105 0 97 0 106 1 249 0 107 0 105 0 109 0 109 0 110 0 113 0 111 0 121 0 115 0 125 0 116 0 129 0 117 0 209 0 133 1 209 0 138 1 213 0 139 1 217 0 140 1 221 0 141 1 225 0 142 1 229 0 143 1 233 0 144 3 105 0 145 0 153 0 150] 
#[1 2 77 0 17 0 94 0 21 0 94 0 60] 
#[0 0 206 0 19 0 20 0 23 0 24 0 25 0 28 0 31 0 32 0 34 0 35 0 36 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 57 0 58 0 60 0 61 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 76 0 77 0 78 0 81 0 82 0 150] 
#[0 0 210 0 25 0 34 0 40 0 41 0 43 0 44 0 45 0 51 0 56 0 57 0 58 0 61 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 76 0 148 0 150] 
#[1 0 17 0 40 0 21 0 41 0 25 0 43 0 29 0 44 0 33 0 45 0 37 0 51 0 41 0 56 0 53 0 61 0 61 0 66 0 65 0 67 0 69 0 68 0 77 0 70 0 81 0 71 0 89 0 73 2 5 0 110 2 9 0 111 0 121 0 115 0 125 0 116 0 129 0 117 3 109 0 119 2 17 0 121 2 21 0 122 0 153 0 150] 
#[1 0 214 0 16 0 214 0 25 0 214 0 26 0 214 0 34 0 17 0 40 0 21 0 41 0 25 0 43 0 29 0 44 0 33 0 45 0 37 0 51 0 41 0 56 0 53 0 61 0 61 0 66 0 65 0 67 0 69 0 68 0 77 0 70 0 81 0 71 0 89 0 73 0 214 0 76 0 214 0 79 2 5 0 110 2 9 0 111 0 121 0 115 0 125 0 116 0 129 0 117 3 113 0 122 0 153 0 150] 
#[1 0 214 0 16 0 214 0 25 0 214 0 26 0 214 0 34 0 17 0 40 0 21 0 41 0 25 0 43 0 29 0 44 0 33 0 45 0 37 0 51 0 41 0 56 0 53 0 61 0 61 0 66 0 65 0 67 0 69 0 68 0 77 0 70 0 81 0 71 0 89 0 73 0 214 0 76 0 214 0 79 2 5 0 110 2 9 0 111 0 121 0 115 0 125 0 116 0 129 0 117 3 117 0 122 0 153 0 150] 
#[1 0 17 0 40 0 21 0 41 0 25 0 43 0 29 0 44 0 33 0 45 0 37 0 51 0 41 0 56 0 53 0 61 0 61 0 66 0 65 0 67 0 69 0 68 0 77 0 70 0 81 0 71 0 89 0 73 3 121 0 82 2 5 0 110 2 9 0 111 0 121 0 115 0 125 0 116 0 129 0 117 3 125 0 121 2 21 0 122 0 153 0 150] 
#[0 0 218 0 40 0 41 0 43 0 44 0 45 0 51 0 56 0 61 0 66 0 67 0 68 0 70 0 71 0 73 0 82 0 150] 
#[1 3 129 0 16 0 9 0 25 0 13 0 34 0 93 0 76 3 133 0 113 3 137 0 123 3 141 0 124 0 137 0 127 0 141 0 128] 
#[0 0 98 0 16 0 17 0 21 0 25 0 26 0 40 0 41 0 43 0 44 0 45 0 51 0 56 0 57 0 58 0 60 0 61 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 79 0 81 0 150] 
#[0 0 222 0 21 0 26] 
#[0 3 145 0 26] 
#[1 3 149 0 21 3 153 0 26] 
#[1 3 157 0 21 0 226 0 26] 
#[1 0 230 0 21 3 161 0 25 0 230 0 26 0 13 0 34 0 93 0 76 3 165 0 79 3 169 0 113 3 173 0 127 0 141 0 128 3 177 0 135 3 181 0 136] 
#[0 0 234 0 21 0 26] 
#[0 0 126 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 33 0 34 0 35 0 36 0 37 0 55 0 59 0 60 0 62 0 63 0 64 0 79 0 80 0 82] 
#[0 0 98 0 16 0 17 0 21 0 25 0 26 0 40 0 41 0 43 0 44 0 45 0 51 0 56 0 57 0 58 0 60 0 61 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 79 0 81 0 150] 
#[0 0 146 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 21 0 26 0 28 0 29 0 30 0 33 0 34 0 35 0 36 0 37 0 55 0 59 0 60 0 62 0 63 0 64 0 80 0 82] 
#[0 0 238 0 16 0 21 0 60 0 80 0 82] 
#[0 3 185 0 80] 
#[1 0 9 0 25 0 13 0 34 0 93 0 76 3 189 0 112 1 245 0 113 0 137 0 127 0 141 0 128] 
#[1 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 2 53 0 76 1 125 0 77 1 129 0 78 3 193 0 81 1 137 0 84 1 141 0 85 3 197 0 87 1 149 0 88 1 153 0 89 1 157 0 90 1 161 0 92 1 165 0 93 1 169 0 94 1 173 0 95 1 177 0 96 1 181 0 97 1 185 0 98 1 189 0 99 1 193 0 100 1 197 0 101 1 201 0 102 3 201 0 114] 
#[0 0 210 0 25 0 34 0 40 0 41 0 43 0 44 0 45 0 51 0 56 0 57 0 58 0 61 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 76 0 148 0 150] 
#[1 0 17 0 40 0 21 0 41 0 25 0 43 0 29 0 44 0 33 0 45 0 37 0 51 0 41 0 56 0 45 0 57 0 49 0 58 0 53 0 61 0 57 0 65 0 61 0 66 0 65 0 67 0 69 0 68 0 73 0 69 0 77 0 70 0 81 0 71 0 85 0 72 0 89 0 73 0 201 0 81 0 97 0 106 1 249 0 107 0 105 0 109 0 109 0 110 0 113 0 111 0 121 0 115 0 125 0 116 0 129 0 117 0 209 0 133 3 205 0 139 0 153 0 150] 
#[1 2 97 0 21 3 209 0 82] 
#[1 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 2 53 0 76 1 125 0 77 1 129 0 78 1 137 0 84 1 141 0 85 2 61 0 88 1 153 0 89 1 157 0 90 1 161 0 92 1 165 0 93 1 169 0 94 1 173 0 95 1 177 0 96 1 181 0 97 1 185 0 98 1 189 0 99 1 193 0 100 1 197 0 101 2 65 0 102 3 213 0 104] 
#[1 1 21 0 76 3 217 0 126] 
#[0 0 242 0 16 0 21 0 25 0 26 0 34 0 40 0 41 0 43 0 44 0 45 0 51 0 56 0 57 0 58 0 60 0 61 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 76 0 79 0 150] 
#[0 0 246 0 19 0 20 0 23 0 24 0 25 0 28 0 31 0 32 0 34 0 35 0 36 0 38 0 39 0 42 0 46 0 47 0 48 0 49 0 50 0 52 0 53 0 54 0 60 0 76 0 77 0 78 0 81 0 82] 
#[1 3 85 0 21 3 221 0 60] 
#[1 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 2 53 0 76 1 125 0 77 1 129 0 78 1 137 0 84 1 141 0 85 1 145 0 87 1 149 0 88 1 153 0 89 1 157 0 90 1 161 0 92 1 165 0 93 1 169 0 94 1 173 0 95 1 177 0 96 1 181 0 97 1 185 0 98 1 189 0 99 1 193 0 100 1 197 0 101 1 201 0 102 2 137 0 105] 
#[0 0 250 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 21 0 26 0 28 0 29 0 30 0 33 0 34 0 35 0 36 0 37 0 55 0 59 0 60 0 62 0 63 0 64 0 80 0 82] 
#[0 0 250 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 21 0 26 0 28 0 29 0 30 0 33 0 34 0 35 0 36 0 37 0 55 0 59 0 60 0 62 0 63 0 64 0 80 0 82] 
#[1 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 0 17 0 40 0 21 0 41 0 25 0 43 0 29 0 44 0 33 0 45 0 37 0 51 0 41 0 56 0 53 0 61 0 61 0 66 0 65 0 67 0 69 0 68 0 77 0 70 0 81 0 71 0 89 0 73 2 53 0 76 1 125 0 77 1 129 0 78 1 137 0 84 1 141 0 85 1 145 0 87 1 149 0 88 1 153 0 89 1 157 0 90 3 225 0 91 1 161 0 92 1 165 0 93 1 169 0 94 1 173 0 95 1 177 0 96 1 181 0 97 1 185 0 98 1 189 0 99 1 193 0 100 1 197 0 101 1 201 0 102 2 137 0 105 2 5 0 110 2 9 0 111 0 121 0 115 0 125 0 116 0 129 0 117 2 141 0 122 0 153 0 150] 
#[0 0 250 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 21 0 26 0 28 0 29 0 30 0 33 0 34 0 35 0 36 0 37 0 55 0 59 0 60 0 62 0 63 0 64 0 80 0 82] 
#[0 3 229 0 26] 
#[1 3 85 0 21 3 233 0 26] 
#[1 3 237 0 25 0 254 0 26 0 13 0 34 3 165 0 79 3 241 0 127 3 245 0 135 3 181 0 136] 
#[0 3 249 0 16] 
#[1 1 33 0 19 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 1 77 0 38 1 81 0 39 1 85 0 42 1 89 0 47 1 93 0 48 1 97 0 49 1 101 0 50 1 105 0 52 1 109 0 53 1 113 0 54 1 117 0 60 1 121 0 76 1 125 0 77 1 129 0 78 0 201 0 81 1 137 0 84 1 141 0 85 1 145 0 87 1 149 0 88 1 153 0 89 1 157 0 90 1 161 0 92 1 165 0 93 1 169 0 94 1 173 0 95 1 177 0 96 1 181 0 97 1 185 0 98 1 189 0 99 1 193 0 100 1 197 0 101 1 201 0 102 1 205 0 105 1 209 0 138 1 213 0 139 1 217 0 140 1 221 0 141 1 225 0 142 1 229 0 143 3 253 0 144] 
#[1 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 2 53 0 76 1 125 0 77 1 129 0 78 1 137 0 84 1 141 0 85 1 145 0 87 1 149 0 88 1 153 0 89 1 157 0 90 1 161 0 92 1 165 0 93 1 169 0 94 1 173 0 95 1 177 0 96 1 181 0 97 1 185 0 98 1 189 0 99 1 193 0 100 1 197 0 101 1 201 0 102 4 1 0 105] 
#[0 0 246 0 19 0 20 0 23 0 24 0 25 0 28 0 31 0 32 0 34 0 35 0 36 0 38 0 39 0 42 0 46 0 47 0 48 0 49 0 50 0 52 0 53 0 54 0 60 0 76 0 77 0 78 0 81 0 82] 
#[0 0 246 0 19 0 20 0 23 0 24 0 25 0 28 0 31 0 32 0 34 0 35 0 36 0 38 0 39 0 42 0 46 0 47 0 48 0 49 0 50 0 52 0 53 0 54 0 60 0 76 0 77 0 78 0 81 0 82] 
#[1 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 1 117 0 60 2 53 0 76 1 125 0 77 1 129 0 78 1 137 0 84 1 141 0 85 1 145 0 87 1 149 0 88 1 153 0 89 1 157 0 90 1 161 0 92 1 165 0 93 1 169 0 94 1 173 0 95 1 177 0 96 1 181 0 97 1 185 0 98 1 189 0 99 1 193 0 100 1 197 0 101 1 201 0 102 1 205 0 105 4 5 0 140] 
#[0 4 9 0 60] 
#[1 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 2 53 0 76 1 125 0 77 1 129 0 78 1 137 0 84 1 141 0 85 1 145 0 87 1 149 0 88 1 153 0 89 1 157 0 90 1 161 0 92 1 165 0 93 1 169 0 94 1 173 0 95 1 177 0 96 1 181 0 97 1 185 0 98 1 189 0 99 1 193 0 100 1 197 0 101 1 201 0 102 4 13 0 105] 
#[1 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 2 53 0 76 1 125 0 77 1 129 0 78 1 137 0 84 1 141 0 85 1 145 0 87 1 149 0 88 1 153 0 89 1 157 0 90 1 161 0 92 1 165 0 93 1 169 0 94 1 173 0 95 1 177 0 96 1 181 0 97 1 185 0 98 1 189 0 99 1 193 0 100 1 197 0 101 1 201 0 102 4 17 0 105] 
#[0 4 21 0 53] 
#[1 1 33 0 19 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 1 77 0 38 1 81 0 39 1 85 0 42 1 89 0 47 1 93 0 48 1 97 0 49 1 101 0 50 1 105 0 52 1 109 0 53 1 113 0 54 1 117 0 60 1 121 0 76 1 125 0 77 1 129 0 78 0 201 0 81 1 137 0 84 1 141 0 85 1 145 0 87 1 149 0 88 1 153 0 89 1 157 0 90 1 161 0 92 1 165 0 93 1 169 0 94 1 173 0 95 1 177 0 96 1 181 0 97 1 185 0 98 1 189 0 99 1 193 0 100 1 197 0 101 1 201 0 102 1 205 0 105 1 209 0 138 1 213 0 139 1 217 0 140 1 221 0 141 1 225 0 142 1 229 0 143 4 25 0 144] 
#[0 1 2 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 33 0 34 0 35 0 36 0 37 0 55 0 59 0 60 0 62 0 63 0 64 0 79 0 80 0 82] 
#[0 4 29 0 76] 
#[0 1 2 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 33 0 34 0 35 0 36 0 37 0 55 0 59 0 60 0 62 0 63 0 64 0 79 0 80 0 82] 
#[1 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 4 33 0 26 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 2 53 0 76 1 125 0 77 1 129 0 78 1 137 0 84 1 141 0 85 4 37 0 86 4 41 0 87 1 149 0 88 1 153 0 89 1 157 0 90 1 161 0 92 1 165 0 93 1 169 0 94 1 173 0 95 1 177 0 96 1 181 0 97 1 185 0 98 1 189 0 99 1 193 0 100 1 197 0 101 1 201 0 102] 
#[0 4 45 0 76] 
#[1 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 2 53 0 76 1 125 0 77 1 129 0 78 1 137 0 84 1 141 0 85 1 145 0 87 1 149 0 88 1 153 0 89 1 157 0 90 1 161 0 92 1 165 0 93 1 169 0 94 1 173 0 95 1 177 0 96 1 181 0 97 1 185 0 98 1 189 0 99 1 193 0 100 1 197 0 101 1 201 0 102 4 49 0 105] 
#[0 1 6 0 20 0 23 0 24 0 25 0 28 0 31 0 32 0 34 0 35 0 36 0 76 0 77 0 78] 
#[0 1 6 0 20 0 23 0 24 0 25 0 28 0 31 0 32 0 34 0 35 0 36 0 76 0 77 0 78] 
#[0 1 6 0 20 0 23 0 24 0 25 0 28 0 31 0 32 0 34 0 35 0 36 0 76 0 77 0 78] 
#[0 1 6 0 20 0 23 0 24 0 25 0 28 0 31 0 32 0 34 0 35 0 36 0 76 0 77 0 78] 
#[0 1 6 0 20 0 23 0 24 0 25 0 28 0 31 0 32 0 34 0 35 0 36 0 76 0 77 0 78] 
#[0 1 6 0 20 0 23 0 24 0 25 0 28 0 31 0 32 0 34 0 35 0 36 0 76 0 77 0 78] 
#[0 1 6 0 20 0 23 0 24 0 25 0 28 0 31 0 32 0 34 0 35 0 36 0 76 0 77 0 78] 
#[0 1 6 0 20 0 23 0 24 0 25 0 28 0 31 0 32 0 34 0 35 0 36 0 76 0 77 0 78] 
#[0 1 6 0 20 0 23 0 24 0 25 0 28 0 31 0 32 0 34 0 35 0 36 0 76 0 77 0 78] 
#[0 1 6 0 20 0 23 0 24 0 25 0 28 0 31 0 32 0 34 0 35 0 36 0 76 0 77 0 78] 
#[0 1 6 0 20 0 23 0 24 0 25 0 28 0 31 0 32 0 34 0 35 0 36 0 76 0 77 0 78] 
#[1 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 2 53 0 76 1 125 0 77 1 129 0 78 1 137 0 84 1 141 0 85 4 53 0 87 1 149 0 88 1 153 0 89 1 157 0 90 1 161 0 92 1 165 0 93 1 169 0 94 1 173 0 95 1 177 0 96 1 181 0 97 1 185 0 98 1 189 0 99 1 193 0 100 1 197 0 101 1 201 0 102] 
#[0 0 250 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 21 0 26 0 28 0 29 0 30 0 33 0 34 0 35 0 36 0 37 0 55 0 59 0 60 0 62 0 63 0 64 0 80 0 82] 
#[1 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 2 53 0 76 1 125 0 77 1 129 0 78 1 137 0 84 1 141 0 85 2 61 0 88 1 153 0 89 4 57 0 90] 
#[1 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 2 53 0 76 1 125 0 77 1 129 0 78 1 137 0 84 1 141 0 85 2 61 0 88 1 153 0 89 4 61 0 90] 
#[1 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 2 53 0 76 1 125 0 77 1 129 0 78 1 137 0 84 1 141 0 85 2 61 0 88 1 153 0 89 4 65 0 90] 
#[1 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 2 53 0 76 1 125 0 77 1 129 0 78 1 137 0 84 1 141 0 85 2 61 0 88 1 153 0 89 1 157 0 90 4 69 0 92] 
#[1 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 2 53 0 76 1 125 0 77 1 129 0 78 1 137 0 84 1 141 0 85 2 61 0 88 1 153 0 89 1 157 0 90 4 73 0 92] 
#[1 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 2 53 0 76 1 125 0 77 1 129 0 78 1 137 0 84 1 141 0 85 2 61 0 88 1 153 0 89 1 157 0 90 1 161 0 92 4 77 0 93] 
#[1 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 2 53 0 76 1 125 0 77 1 129 0 78 1 137 0 84 1 141 0 85 2 61 0 88 1 153 0 89 1 157 0 90 1 161 0 92 4 81 0 93] 
#[1 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 2 53 0 76 1 125 0 77 1 129 0 78 1 137 0 84 1 141 0 85 2 61 0 88 1 153 0 89 1 157 0 90 1 161 0 92 1 165 0 93 4 85 0 94] 
#[1 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 2 53 0 76 1 125 0 77 1 129 0 78 1 137 0 84 1 141 0 85 2 61 0 88 1 153 0 89 1 157 0 90 1 161 0 92 1 165 0 93 4 89 0 94] 
#[1 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 2 53 0 76 1 125 0 77 1 129 0 78 1 137 0 84 1 141 0 85 2 61 0 88 1 153 0 89 1 157 0 90 1 161 0 92 1 165 0 93 4 93 0 94] 
#[1 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 2 53 0 76 1 125 0 77 1 129 0 78 1 137 0 84 1 141 0 85 2 61 0 88 1 153 0 89 1 157 0 90 1 161 0 92 1 165 0 93 4 97 0 94] 
#[1 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 2 53 0 76 1 125 0 77 1 129 0 78 1 137 0 84 1 141 0 85 2 61 0 88 1 153 0 89 1 157 0 90 1 161 0 92 1 165 0 93 1 169 0 94 4 101 0 95] 
#[1 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 2 53 0 76 1 125 0 77 1 129 0 78 1 137 0 84 1 141 0 85 2 61 0 88 1 153 0 89 1 157 0 90 1 161 0 92 1 165 0 93 1 169 0 94 4 105 0 95] 
#[1 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 2 53 0 76 1 125 0 77 1 129 0 78 1 137 0 84 1 141 0 85 2 61 0 88 1 153 0 89 1 157 0 90 1 161 0 92 1 165 0 93 1 169 0 94 1 173 0 95 4 109 0 96] 
#[1 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 2 53 0 76 1 125 0 77 1 129 0 78 1 137 0 84 1 141 0 85 2 61 0 88 1 153 0 89 1 157 0 90 1 161 0 92 1 165 0 93 1 169 0 94 1 173 0 95 1 177 0 96 4 113 0 97] 
#[1 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 2 53 0 76 1 125 0 77 1 129 0 78 1 137 0 84 1 141 0 85 2 61 0 88 1 153 0 89 1 157 0 90 1 161 0 92 1 165 0 93 1 169 0 94 1 173 0 95 1 177 0 96 1 181 0 97 4 117 0 98] 
#[1 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 2 53 0 76 1 125 0 77 1 129 0 78 1 137 0 84 1 141 0 85 2 61 0 88 1 153 0 89 1 157 0 90 1 161 0 92 1 165 0 93 1 169 0 94 1 173 0 95 1 177 0 96 1 181 0 97 1 185 0 98 4 121 0 99] 
#[1 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 2 53 0 76 1 125 0 77 1 129 0 78 1 137 0 84 1 141 0 85 2 61 0 88 1 153 0 89 1 157 0 90 1 161 0 92 1 165 0 93 1 169 0 94 1 173 0 95 1 177 0 96 1 181 0 97 1 185 0 98 1 189 0 99 4 125 0 100] 
#[1 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 2 53 0 76 1 125 0 77 1 129 0 78 1 137 0 84 1 141 0 85 1 145 0 87 1 149 0 88 1 153 0 89 1 157 0 90 1 161 0 92 1 165 0 93 1 169 0 94 1 173 0 95 1 177 0 96 1 181 0 97 1 185 0 98 1 189 0 99 1 193 0 100 1 197 0 101 1 201 0 102 4 129 0 105] 
#[1 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 2 53 0 76 1 125 0 77 1 129 0 78 1 137 0 84 1 141 0 85 4 133 0 87 1 149 0 88 1 153 0 89 1 157 0 90 1 161 0 92 1 165 0 93 1 169 0 94 1 173 0 95 1 177 0 96 1 181 0 97 1 185 0 98 1 189 0 99 1 193 0 100 1 197 0 101 1 201 0 102] 
#[0 1 10 0 19 0 20 0 23 0 24 0 25 0 26 0 28 0 31 0 32 0 34 0 35 0 36 0 38 0 39 0 42 0 46 0 47 0 48 0 49 0 50 0 52 0 53 0 54 0 60 0 76 0 77 0 78 0 81 0 82] 
#[0 1 14 0 19 0 20 0 23 0 24 0 25 0 28 0 31 0 32 0 34 0 35 0 36 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 57 0 58 0 60 0 61 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 76 0 77 0 78 0 81 0 82 0 148 0 150] 
#[0 1 18 0 19 0 20 0 23 0 24 0 25 0 28 0 31 0 32 0 34 0 35 0 36 0 38 0 39 0 42 0 47 0 48 0 49 0 50 0 52 0 53 0 54 0 60 0 76 0 77 0 78 0 81 0 82] 
#[0 1 14 0 19 0 20 0 23 0 24 0 25 0 28 0 31 0 32 0 34 0 35 0 36 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 57 0 58 0 60 0 61 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 76 0 77 0 78 0 81 0 82 0 148 0 150] 
#[1 1 33 0 19 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 1 77 0 38 1 81 0 39 1 85 0 42 1 89 0 47 1 93 0 48 1 97 0 49 1 101 0 50 1 105 0 52 1 109 0 53 1 113 0 54 1 117 0 60 1 121 0 76 1 125 0 77 1 129 0 78 0 201 0 81 4 137 0 82 1 137 0 84 1 141 0 85 1 145 0 87 1 149 0 88 1 153 0 89 1 157 0 90 1 161 0 92 1 165 0 93 1 169 0 94 1 173 0 95 1 177 0 96 1 181 0 97 1 185 0 98 1 189 0 99 1 193 0 100 1 197 0 101 1 201 0 102 1 205 0 105 1 209 0 138 1 213 0 139 1 217 0 140 1 221 0 141 1 225 0 142 1 229 0 143 3 97 0 144] 
#[1 0 17 0 40 0 21 0 41 0 25 0 43 0 29 0 44 0 33 0 45 0 37 0 51 0 41 0 56 0 53 0 61 0 61 0 66 0 65 0 67 0 69 0 68 0 77 0 70 0 81 0 71 0 89 0 73 4 141 0 82 2 5 0 110 2 9 0 111 0 121 0 115 0 125 0 116 0 129 0 117 3 125 0 121 2 21 0 122 0 153 0 150] 
#[0 1 22 0 16 0 25 0 26 0 34 0 76 0 79] 
#[0 1 22 0 16 0 25 0 26 0 34 0 76 0 79] 
#[0 1 26 0 16 0 21 0 25 0 26 0 34 0 40 0 41 0 43 0 44 0 45 0 51 0 56 0 57 0 58 0 60 0 61 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 76 0 79 0 150] 
#[0 1 30 0 40 0 41 0 43 0 44 0 45 0 51 0 56 0 61 0 66 0 67 0 68 0 70 0 71 0 73 0 82 0 150] 
#[1 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 2 53 0 76 1 125 0 77 1 129 0 78 1 137 0 84 1 141 0 85 2 61 0 88 1 153 0 89 1 157 0 90 1 161 0 92 1 165 0 93 1 169 0 94 1 173 0 95 1 177 0 96 1 181 0 97 1 185 0 98 1 189 0 99 1 193 0 100 1 197 0 101 2 65 0 102 4 145 0 104] 
#[1 4 149 0 16 1 34 0 21 1 34 0 60] 
#[1 4 153 0 21 4 157 0 60] 
#[0 1 38 0 21 0 60] 
#[0 1 42 0 16 0 17 0 21 0 25 0 26 0 40 0 41 0 43 0 44 0 45 0 51 0 56 0 57 0 58 0 60 0 61 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 79 0 81 0 150] 
#[0 4 161 0 76] 
#[0 1 42 0 16 0 17 0 21 0 25 0 26 0 40 0 41 0 43 0 44 0 45 0 51 0 56 0 57 0 58 0 60 0 61 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 79 0 81 0 150] 
#[1 0 17 0 40 0 21 0 41 0 25 0 43 0 29 0 44 0 33 0 45 0 37 0 51 0 41 0 56 0 45 0 57 0 49 0 58 0 53 0 61 0 57 0 65 0 61 0 66 0 65 0 67 0 69 0 68 0 73 0 69 0 77 0 70 0 81 0 71 0 85 0 72 0 89 0 73 4 165 0 74 0 105 0 109 0 109 0 110 0 113 0 111 0 121 0 115 0 125 0 116 0 129 0 117 2 45 0 133 4 169 0 134 0 153 0 150] 
#[1 3 161 0 25 4 173 0 26 0 13 0 34 0 17 0 40 0 21 0 41 0 25 0 43 0 29 0 44 0 33 0 45 0 37 0 51 0 41 0 56 0 45 0 57 0 49 0 58 0 53 0 61 0 57 0 65 0 61 0 66 0 65 0 67 0 69 0 68 0 73 0 69 0 77 0 70 0 81 0 71 0 85 0 72 0 89 0 73 0 93 0 76 3 165 0 79 0 105 0 109 0 109 0 110 0 113 0 111 0 161 0 113 0 121 0 115 0 125 0 116 0 129 0 117 3 173 0 127 0 141 0 128 4 177 0 129 2 41 0 132 2 45 0 133 2 49 0 134 4 181 0 135 3 181 0 136 0 153 0 150] 
#[1 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 2 53 0 76 1 125 0 77 1 129 0 78 4 185 0 80 1 137 0 84 1 141 0 85 2 61 0 88 1 153 0 89 1 157 0 90 1 161 0 92 1 165 0 93 1 169 0 94 1 173 0 95 1 177 0 96 1 181 0 97 1 185 0 98 1 189 0 99 1 193 0 100 1 197 0 101 2 65 0 102 4 189 0 104] 
#[0 1 46 0 21 0 26] 
#[1 1 50 0 21 3 161 0 25 1 50 0 26 0 93 0 76 3 165 0 79 0 233 0 128 4 193 0 136] 
#[0 1 46 0 21 0 26] 
#[1 1 50 0 21 4 197 0 25 1 50 0 26 4 201 0 79] 
#[0 1 42 0 16 0 17 0 21 0 25 0 26 0 40 0 41 0 43 0 44 0 45 0 51 0 56 0 57 0 58 0 60 0 61 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 79 0 81 0 150] 
#[0 1 54 0 21 0 60] 
#[1 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 2 53 0 76 1 125 0 77 1 129 0 78 3 193 0 81 1 137 0 84 1 141 0 85 3 197 0 87 1 149 0 88 1 153 0 89 1 157 0 90 1 161 0 92 1 165 0 93 1 169 0 94 1 173 0 95 1 177 0 96 1 181 0 97 1 185 0 98 1 189 0 99 1 193 0 100 1 197 0 101 1 201 0 102 4 205 0 114 4 209 0 137] 
#[0 1 58 0 21 0 60 0 82] 
#[0 1 62 0 21 0 60] 
#[0 1 66 0 25 0 34 0 40 0 41 0 43 0 44 0 45 0 51 0 56 0 57 0 58 0 61 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 76 0 148 0 150] 
#[0 1 70 0 16 0 21 0 25 0 26 0 34 0 40 0 41 0 43 0 44 0 45 0 51 0 56 0 57 0 58 0 60 0 61 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 76 0 79 0 150] 
#[0 1 74 0 21 0 82] 
#[0 1 78 0 21 0 82] 
#[0 1 82 0 19 0 20 0 23 0 24 0 25 0 28 0 31 0 32 0 34 0 35 0 36 0 38 0 39 0 42 0 46 0 47 0 48 0 49 0 50 0 52 0 53 0 54 0 60 0 76 0 77 0 78 0 81 0 82] 
#[0 4 213 0 26] 
#[1 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 2 53 0 76 1 125 0 77 1 129 0 78 1 137 0 84 1 141 0 85 2 61 0 88 1 153 0 89 4 217 0 90] 
#[0 1 86 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 33 0 34 0 35 0 36 0 37 0 55 0 59 0 60 0 62 0 63 0 64 0 79 0 80 0 82] 
#[1 3 237 0 25 4 173 0 26 0 13 0 34 0 17 0 40 0 21 0 41 0 25 0 43 0 29 0 44 0 33 0 45 0 37 0 51 0 41 0 56 0 45 0 57 0 49 0 58 0 53 0 61 0 57 0 65 0 61 0 66 0 65 0 67 0 69 0 68 0 73 0 69 0 77 0 70 0 81 0 71 0 85 0 72 0 89 0 73 3 165 0 79 0 105 0 109 0 109 0 110 0 113 0 111 0 121 0 115 0 125 0 116 0 129 0 117 3 241 0 127 4 177 0 129 2 41 0 132 2 45 0 133 2 49 0 134 4 181 0 135 3 181 0 136 0 153 0 150] 
#[1 3 237 0 25 1 50 0 26 3 165 0 79 4 193 0 136] 
#[0 1 90 0 26] 
#[1 1 33 0 19 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 1 77 0 38 1 81 0 39 1 85 0 42 1 89 0 47 1 93 0 48 1 97 0 49 1 101 0 50 1 105 0 52 1 109 0 53 1 113 0 54 1 117 0 60 1 121 0 76 1 125 0 77 1 129 0 78 0 201 0 81 1 137 0 84 1 141 0 85 1 145 0 87 1 149 0 88 1 153 0 89 1 157 0 90 1 161 0 92 1 165 0 93 1 169 0 94 1 173 0 95 1 177 0 96 1 181 0 97 1 185 0 98 1 189 0 99 1 193 0 100 1 197 0 101 1 201 0 102 1 205 0 105 1 209 0 138 1 213 0 139 1 217 0 140 1 221 0 141 1 225 0 142 1 229 0 143 4 221 0 144] 
#[0 1 94 0 19 0 20 0 23 0 24 0 25 0 28 0 31 0 32 0 34 0 35 0 36 0 38 0 39 0 42 0 46 0 47 0 48 0 49 0 50 0 52 0 53 0 54 0 60 0 76 0 77 0 78 0 81 0 82] 
#[1 3 85 0 21 4 225 0 26] 
#[1 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 1 117 0 60 2 53 0 76 1 125 0 77 1 129 0 78 1 137 0 84 1 141 0 85 1 145 0 87 1 149 0 88 1 153 0 89 1 157 0 90 1 161 0 92 1 165 0 93 1 169 0 94 1 173 0 95 1 177 0 96 1 181 0 97 1 185 0 98 1 189 0 99 1 193 0 100 1 197 0 101 1 201 0 102 1 205 0 105 4 229 0 140] 
#[0 1 82 0 19 0 20 0 23 0 24 0 25 0 28 0 31 0 32 0 34 0 35 0 36 0 38 0 39 0 42 0 46 0 47 0 48 0 49 0 50 0 52 0 53 0 54 0 60 0 76 0 77 0 78 0 81 0 82] 
#[1 3 85 0 21 4 233 0 26] 
#[1 3 85 0 21 4 237 0 26] 
#[0 4 241 0 25] 
#[0 1 94 0 19 0 20 0 23 0 24 0 25 0 28 0 31 0 32 0 34 0 35 0 36 0 38 0 39 0 42 0 46 0 47 0 48 0 49 0 50 0 52 0 53 0 54 0 60 0 76 0 77 0 78 0 81 0 82] 
#[0 1 98 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 33 0 34 0 35 0 36 0 37 0 55 0 59 0 60 0 62 0 63 0 64 0 79 0 80 0 82] 
#[0 1 98 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 33 0 34 0 35 0 36 0 37 0 55 0 59 0 60 0 62 0 63 0 64 0 79 0 80 0 82] 
#[1 4 245 0 21 4 249 0 26] 
#[0 1 102 0 21 0 26] 
#[0 1 98 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 33 0 34 0 35 0 36 0 37 0 55 0 59 0 60 0 62 0 63 0 64 0 79 0 80 0 82] 
#[1 3 85 0 21 4 253 0 80] 
#[0 1 106 0 16 0 21 0 26 0 60 0 80 0 82] 
#[0 1 110 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 14 0 15 0 16 0 18 0 21 0 26 0 28 0 29 0 30 0 33 0 34 0 35 0 36 0 60 0 80 0 82] 
#[0 1 110 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 14 0 15 0 16 0 18 0 21 0 26 0 28 0 29 0 30 0 33 0 34 0 35 0 36 0 60 0 80 0 82] 
#[0 1 110 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 14 0 15 0 16 0 18 0 21 0 26 0 28 0 29 0 30 0 33 0 34 0 35 0 36 0 60 0 80 0 82] 
#[1 1 114 0 1 1 114 0 2 1 114 0 3 1 114 0 4 1 114 0 5 1 114 0 6 1 114 0 7 1 114 0 8 1 114 0 9 1 114 0 14 1 114 0 15 1 114 0 16 1 114 0 18 1 114 0 21 1 114 0 26 1 114 0 28 3 9 0 29 3 13 0 30 1 114 0 33 3 17 0 34 1 114 0 35 1 114 0 36 1 114 0 60 1 114 0 80 1 114 0 82] 
#[1 1 114 0 1 1 114 0 2 1 114 0 3 1 114 0 4 1 114 0 5 1 114 0 6 1 114 0 7 1 114 0 8 1 114 0 9 1 114 0 14 1 114 0 15 1 114 0 16 1 114 0 18 1 114 0 21 1 114 0 26 1 114 0 28 3 9 0 29 3 13 0 30 1 114 0 33 3 17 0 34 1 114 0 35 1 114 0 36 1 114 0 60 1 114 0 80 1 114 0 82] 
#[1 1 118 0 1 1 118 0 2 1 118 0 3 1 118 0 4 1 118 0 5 1 118 0 6 1 118 0 7 1 118 0 8 1 118 0 9 1 118 0 14 1 118 0 15 1 118 0 16 1 118 0 18 1 118 0 21 1 118 0 26 1 118 0 28 1 118 0 33 3 21 0 35 3 25 0 36 1 118 0 60 1 118 0 80 1 118 0 82] 
#[1 1 118 0 1 1 118 0 2 1 118 0 3 1 118 0 4 1 118 0 5 1 118 0 6 1 118 0 7 1 118 0 8 1 118 0 9 1 118 0 14 1 118 0 15 1 118 0 16 1 118 0 18 1 118 0 21 1 118 0 26 1 118 0 28 1 118 0 33 3 21 0 35 3 25 0 36 1 118 0 60 1 118 0 80 1 118 0 82] 
#[1 1 122 0 1 1 122 0 2 1 122 0 3 1 122 0 4 1 122 0 5 1 122 0 6 1 122 0 7 1 122 0 8 1 122 0 9 3 29 0 14 1 122 0 15 1 122 0 16 1 122 0 18 1 122 0 21 1 122 0 26 1 122 0 28 3 33 0 33 1 122 0 60 1 122 0 80 1 122 0 82] 
#[1 1 122 0 1 1 122 0 2 1 122 0 3 1 122 0 4 1 122 0 5 1 122 0 6 1 122 0 7 1 122 0 8 1 122 0 9 3 29 0 14 1 122 0 15 1 122 0 16 1 122 0 18 1 122 0 21 1 122 0 26 1 122 0 28 3 33 0 33 1 122 0 60 1 122 0 80 1 122 0 82] 
#[1 1 122 0 1 1 122 0 2 1 122 0 3 1 122 0 4 1 122 0 5 1 122 0 6 1 122 0 7 1 122 0 8 1 122 0 9 3 29 0 14 1 122 0 15 1 122 0 16 1 122 0 18 1 122 0 21 1 122 0 26 1 122 0 28 3 33 0 33 1 122 0 60 1 122 0 80 1 122 0 82] 
#[1 1 122 0 1 1 122 0 2 1 122 0 3 1 122 0 4 1 122 0 5 1 122 0 6 1 122 0 7 1 122 0 8 1 122 0 9 3 29 0 14 1 122 0 15 1 122 0 16 1 122 0 18 1 122 0 21 1 122 0 26 1 122 0 28 3 33 0 33 1 122 0 60 1 122 0 80 1 122 0 82] 
#[1 1 126 0 1 1 126 0 2 1 126 0 3 1 126 0 4 1 126 0 5 3 37 0 6 3 41 0 7 3 45 0 8 1 126 0 9 1 126 0 15 1 126 0 16 3 49 0 18 1 126 0 21 1 126 0 26 1 126 0 28 1 126 0 60 1 126 0 80 1 126 0 82] 
#[1 1 126 0 1 1 126 0 2 1 126 0 3 1 126 0 4 1 126 0 5 3 37 0 6 3 41 0 7 3 45 0 8 1 126 0 9 1 126 0 15 1 126 0 16 3 49 0 18 1 126 0 21 1 126 0 26 1 126 0 28 1 126 0 60 1 126 0 80 1 126 0 82] 
#[1 1 130 0 1 1 130 0 2 3 53 0 3 3 57 0 4 1 130 0 5 1 130 0 9 1 130 0 15 1 130 0 16 1 130 0 21 1 130 0 26 1 130 0 28 1 130 0 60 1 130 0 80 1 130 0 82] 
#[1 1 134 0 1 1 134 0 2 1 134 0 5 1 134 0 9 1 134 0 15 1 134 0 16 1 134 0 21 1 134 0 26 3 61 0 28 1 134 0 60 1 134 0 80 1 134 0 82] 
#[1 3 65 0 1 1 138 0 2 1 138 0 5 1 138 0 9 1 138 0 15 1 138 0 16 1 138 0 21 1 138 0 26 1 138 0 60 1 138 0 80 1 138 0 82] 
#[1 3 69 0 2 1 142 0 5 1 142 0 9 1 142 0 15 1 142 0 16 1 142 0 21 1 142 0 26 1 142 0 60 1 142 0 80 1 142 0 82] 
#[1 3 73 0 5 1 146 0 9 1 146 0 15 1 146 0 16 1 146 0 21 1 146 0 26 1 146 0 60 1 146 0 80 1 146 0 82] 
#[1 5 1 0 16 3 85 0 21] 
#[0 1 150 0 16 0 21 0 26 0 60 0 80] 
#[0 1 154 0 19 0 20 0 23 0 24 0 25 0 28 0 31 0 32 0 34 0 35 0 36 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 56 0 57 0 58 0 60 0 61 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 76 0 77 0 78 0 81 0 82 0 148 0 150] 
#[0 1 158 0 16 0 21 0 25 0 26 0 34 0 40 0 41 0 43 0 44 0 45 0 51 0 56 0 57 0 58 0 60 0 61 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 76 0 79 0 150] 
#[0 1 162 0 21 0 60] 
#[1 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 2 53 0 76 1 125 0 77 1 129 0 78 1 137 0 84 1 141 0 85 2 61 0 88 1 153 0 89 1 157 0 90 1 161 0 92 1 165 0 93 1 169 0 94 1 173 0 95 1 177 0 96 1 181 0 97 1 185 0 98 1 189 0 99 1 193 0 100 1 197 0 101 2 65 0 102 5 5 0 104] 
#[1 3 129 0 16 0 9 0 25 0 13 0 34 0 93 0 76 3 133 0 113 5 9 0 124 0 137 0 127 0 141 0 128] 
#[0 1 166 0 40 0 41 0 43 0 44 0 45 0 51 0 56 0 61 0 66 0 67 0 68 0 70 0 71 0 73 0 82 0 150] 
#[0 1 170 0 21 0 26] 
#[0 1 174 0 26] 
#[0 1 178 0 21 0 26] 
#[0 1 182 0 21 0 25 0 26 0 79] 
#[0 5 13 0 26] 
#[0 5 17 0 26] 
#[0 1 182 0 21 0 25 0 26 0 79] 
#[0 5 21 0 80] 
#[1 1 186 0 21 4 197 0 25 1 186 0 26 4 201 0 79] 
#[1 5 25 0 26 0 17 0 40 0 21 0 41 0 25 0 43 0 29 0 44 0 33 0 45 0 37 0 51 0 41 0 56 0 45 0 57 0 49 0 58 0 53 0 61 0 57 0 65 0 61 0 66 0 65 0 67 0 69 0 68 0 73 0 69 0 77 0 70 0 81 0 71 0 85 0 72 0 89 0 73 0 105 0 109 0 109 0 110 0 113 0 111 0 121 0 115 0 125 0 116 0 129 0 117 5 29 0 129 2 41 0 132 2 45 0 133 2 49 0 134 0 153 0 150] 
#[1 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 2 53 0 76 1 125 0 77 1 129 0 78 5 33 0 80 1 137 0 84 1 141 0 85 2 61 0 88 1 153 0 89 1 157 0 90 1 161 0 92 1 165 0 93 1 169 0 94 1 173 0 95 1 177 0 96 1 181 0 97 1 185 0 98 1 189 0 99 1 193 0 100 1 197 0 101 2 65 0 102 5 37 0 104] 
#[0 1 190 0 21 0 82] 
#[1 5 41 0 21 5 45 0 82] 
#[0 1 194 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 21 0 26 0 28 0 29 0 30 0 33 0 34 0 35 0 36 0 37 0 55 0 59 0 60 0 62 0 63 0 64 0 80 0 82] 
#[0 1 198 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 21 0 26 0 28 0 29 0 30 0 33 0 34 0 35 0 36 0 37 0 55 0 59 0 60 0 62 0 63 0 64 0 80 0 82] 
#[0 1 202 0 19 0 20 0 23 0 24 0 25 0 28 0 31 0 32 0 34 0 35 0 36 0 38 0 39 0 42 0 46 0 47 0 48 0 49 0 50 0 52 0 53 0 54 0 60 0 76 0 77 0 78 0 81 0 82] 
#[1 1 33 0 19 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 1 77 0 38 1 81 0 39 1 85 0 42 1 89 0 47 1 93 0 48 1 97 0 49 1 101 0 50 1 105 0 52 1 109 0 53 1 113 0 54 1 117 0 60 1 121 0 76 1 125 0 77 1 129 0 78 0 201 0 81 1 137 0 84 1 141 0 85 1 145 0 87 1 149 0 88 1 153 0 89 1 157 0 90 1 161 0 92 1 165 0 93 1 169 0 94 1 173 0 95 1 177 0 96 1 181 0 97 1 185 0 98 1 189 0 99 1 193 0 100 1 197 0 101 1 201 0 102 1 205 0 105 1 209 0 138 1 213 0 139 1 217 0 140 1 221 0 141 1 225 0 142 1 229 0 143 5 49 0 144] 
#[1 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 5 53 0 26 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 2 53 0 76 1 125 0 77 1 129 0 78 1 137 0 84 1 141 0 85 1 145 0 87 1 149 0 88 1 153 0 89 1 157 0 90 1 161 0 92 1 165 0 93 1 169 0 94 1 173 0 95 1 177 0 96 1 181 0 97 1 185 0 98 1 189 0 99 1 193 0 100 1 197 0 101 1 201 0 102 5 57 0 105] 
#[1 1 33 0 19 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 1 77 0 38 1 81 0 39 1 85 0 42 1 89 0 47 1 93 0 48 1 97 0 49 1 101 0 50 1 105 0 52 1 109 0 53 1 113 0 54 1 117 0 60 1 121 0 76 1 125 0 77 1 129 0 78 0 201 0 81 1 137 0 84 1 141 0 85 1 145 0 87 1 149 0 88 1 153 0 89 1 157 0 90 1 161 0 92 1 165 0 93 1 169 0 94 1 173 0 95 1 177 0 96 1 181 0 97 1 185 0 98 1 189 0 99 1 193 0 100 1 197 0 101 1 201 0 102 1 205 0 105 1 209 0 138 1 213 0 139 1 217 0 140 1 221 0 141 1 225 0 142 1 229 0 143 5 61 0 144] 
#[1 1 33 0 19 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 1 77 0 38 1 81 0 39 1 85 0 42 1 89 0 47 1 93 0 48 1 97 0 49 1 101 0 50 1 105 0 52 1 109 0 53 1 113 0 54 1 117 0 60 1 121 0 76 1 125 0 77 1 129 0 78 0 201 0 81 1 137 0 84 1 141 0 85 1 145 0 87 1 149 0 88 1 153 0 89 1 157 0 90 1 161 0 92 1 165 0 93 1 169 0 94 1 173 0 95 1 177 0 96 1 181 0 97 1 185 0 98 1 189 0 99 1 193 0 100 1 197 0 101 1 201 0 102 1 205 0 105 1 209 0 138 1 213 0 139 1 217 0 140 1 221 0 141 1 225 0 142 1 229 0 143 5 65 0 144] 
#[1 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 2 53 0 76 1 125 0 77 1 129 0 78 1 137 0 84 1 141 0 85 1 145 0 87 1 149 0 88 1 153 0 89 1 157 0 90 1 161 0 92 1 165 0 93 1 169 0 94 1 173 0 95 1 177 0 96 1 181 0 97 1 185 0 98 1 189 0 99 1 193 0 100 1 197 0 101 1 201 0 102 5 69 0 105] 
#[1 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 2 53 0 76 1 125 0 77 1 129 0 78 1 137 0 84 1 141 0 85 5 73 0 87 1 149 0 88 1 153 0 89 1 157 0 90 1 161 0 92 1 165 0 93 1 169 0 94 1 173 0 95 1 177 0 96 1 181 0 97 1 185 0 98 1 189 0 99 1 193 0 100 1 197 0 101 1 201 0 102] 
#[0 1 206 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 33 0 34 0 35 0 36 0 37 0 55 0 59 0 60 0 62 0 63 0 64 0 79 0 80 0 82] 
#[0 1 206 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 20 0 21 0 22 0 23 0 25 0 26 0 27 0 28 0 29 0 30 0 33 0 34 0 35 0 36 0 37 0 55 0 59 0 60 0 62 0 63 0 64 0 79 0 80 0 82] 
#[1 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 2 53 0 76 1 125 0 77 1 129 0 78 1 137 0 84 1 141 0 85 2 61 0 88 1 153 0 89 1 157 0 90 1 161 0 92 1 165 0 93 1 169 0 94 1 173 0 95 1 177 0 96 1 181 0 97 1 185 0 98 1 189 0 99 1 193 0 100 1 197 0 101 5 77 0 102] 
#[0 1 210 0 21 0 60] 
#[0 1 214 0 21 0 60] 
#[0 1 218 0 21 0 25 0 26 0 79] 
#[0 1 218 0 21 0 25 0 26 0 79] 
#[0 1 218 0 21 0 25 0 26 0 79] 
#[0 1 218 0 21 0 25 0 26 0 79] 
#[0 5 81 0 26] 
#[0 1 218 0 21 0 25 0 26 0 79] 
#[0 5 85 0 80] 
#[1 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 2 53 0 76 1 125 0 77 1 129 0 78 3 193 0 81 5 89 0 82 1 137 0 84 1 141 0 85 3 197 0 87 1 149 0 88 1 153 0 89 1 157 0 90 1 161 0 92 1 165 0 93 1 169 0 94 1 173 0 95 1 177 0 96 1 181 0 97 1 185 0 98 1 189 0 99 1 193 0 100 1 197 0 101 1 201 0 102 5 93 0 114] 
#[0 1 222 0 21 0 60 0 82] 
#[1 1 226 0 19 1 226 0 20 1 226 0 23 1 226 0 24 1 226 0 25 1 226 0 28 1 226 0 31 1 226 0 32 1 226 0 34 1 226 0 35 1 226 0 36 1 226 0 38 1 226 0 39 1 226 0 42 5 97 0 46 1 226 0 47 1 226 0 48 1 226 0 49 1 226 0 50 1 226 0 52 1 226 0 53 1 226 0 54 1 226 0 60 1 226 0 76 1 226 0 77 1 226 0 78 1 226 0 81 1 226 0 82] 
#[1 1 33 0 19 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 1 77 0 38 1 81 0 39 1 85 0 42 1 89 0 47 1 93 0 48 1 97 0 49 1 101 0 50 1 105 0 52 1 109 0 53 1 113 0 54 1 117 0 60 1 121 0 76 1 125 0 77 1 129 0 78 0 201 0 81 1 137 0 84 1 141 0 85 1 145 0 87 1 149 0 88 1 153 0 89 1 157 0 90 1 161 0 92 1 165 0 93 1 169 0 94 1 173 0 95 1 177 0 96 1 181 0 97 1 185 0 98 1 189 0 99 1 193 0 100 1 197 0 101 1 201 0 102 1 205 0 105 1 209 0 138 1 213 0 139 1 217 0 140 1 221 0 141 1 225 0 142 1 229 0 143 5 101 0 144] 
#[1 3 85 0 21 5 105 0 26] 
#[0 1 226 0 19 0 20 0 23 0 24 0 25 0 28 0 31 0 32 0 34 0 35 0 36 0 38 0 39 0 42 0 46 0 47 0 48 0 49 0 50 0 52 0 53 0 54 0 60 0 76 0 77 0 78 0 81 0 82] 
#[0 1 230 0 19 0 20 0 23 0 24 0 25 0 28 0 31 0 32 0 34 0 35 0 36 0 38 0 39 0 42 0 46 0 47 0 48 0 49 0 50 0 52 0 53 0 54 0 60 0 76 0 77 0 78 0 81 0 82] 
#[1 3 85 0 21 5 109 0 26] 
#[0 1 234 0 21 0 26] 
#[0 1 238 0 16 0 21 0 26 0 60 0 80 0 82] 
#[0 1 242 0 21 0 25 0 26 0 79] 
#[0 1 242 0 21 0 25 0 26 0 79] 
#[0 1 246 0 21 0 60 0 82] 
#[0 1 250 0 21 0 82] 
#[1 1 33 0 19 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 1 77 0 38 1 81 0 39 1 85 0 42 1 89 0 47 1 93 0 48 1 97 0 49 1 101 0 50 1 105 0 52 1 109 0 53 1 113 0 54 1 117 0 60 1 121 0 76 1 125 0 77 1 129 0 78 0 201 0 81 1 137 0 84 1 141 0 85 1 145 0 87 1 149 0 88 1 153 0 89 1 157 0 90 1 161 0 92 1 165 0 93 1 169 0 94 1 173 0 95 1 177 0 96 1 181 0 97 1 185 0 98 1 189 0 99 1 193 0 100 1 197 0 101 1 201 0 102 1 205 0 105 1 209 0 138 1 213 0 139 1 217 0 140 1 221 0 141 1 225 0 142 1 229 0 143 5 113 0 144] 
#[0 1 254 0 19 0 20 0 23 0 24 0 25 0 28 0 31 0 32 0 34 0 35 0 36 0 38 0 39 0 42 0 46 0 47 0 48 0 49 0 50 0 52 0 53 0 54 0 60 0 76 0 77 0 78 0 81 0 82] 
#[1 1 33 0 19 1 37 0 20 1 41 0 23 1 45 0 24 1 49 0 25 1 53 0 28 1 57 0 31 1 61 0 32 1 65 0 34 1 69 0 35 1 73 0 36 1 77 0 38 1 81 0 39 1 85 0 42 1 89 0 47 1 93 0 48 1 97 0 49 1 101 0 50 1 105 0 52 1 109 0 53 1 113 0 54 1 117 0 60 1 121 0 76 1 125 0 77 1 129 0 78 0 201 0 81 1 137 0 84 1 141 0 85 1 145 0 87 1 149 0 88 1 153 0 89 1 157 0 90 1 161 0 92 1 165 0 93 1 169 0 94 1 173 0 95 1 177 0 96 1 181 0 97 1 185 0 98 1 189 0 99 1 193 0 100 1 197 0 101 1 201 0 102 1 205 0 105 1 209 0 138 1 213 0 139 1 217 0 140 1 221 0 141 1 225 0 142 1 229 0 143 5 117 0 144] 
#[0 5 121 0 60] 
#[0 2 2 0 19 0 20 0 23 0 24 0 25 0 28 0 31 0 32 0 34 0 35 0 36 0 38 0 39 0 42 0 46 0 47 0 48 0 49 0 50 0 52 0 53 0 54 0 60 0 76 0 77 0 78 0 81 0 82] 
#[0 2 6 0 19 0 20 0 23 0 24 0 25 0 28 0 31 0 32 0 34 0 35 0 36 0 38 0 39 0 42 0 46 0 47 0 48 0 49 0 50 0 52 0 53 0 54 0 60 0 76 0 77 0 78 0 81 0 82] 
#[0 2 6 0 19 0 20 0 23 0 24 0 25 0 28 0 31 0 32 0 34 0 35 0 36 0 38 0 39 0 42 0 46 0 47 0 48 0 49 0 50 0 52 0 53 0 54 0 60 0 76 0 77 0 78 0 81 0 82]
	).
]
