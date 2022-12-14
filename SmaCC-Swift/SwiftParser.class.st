Class {
	#name : #SwiftParser,
	#superclass : #SmaCCGLRParser,
	#category : 'SmaCC-Swift'
}

{ #category : #'generated-accessing' }
SwiftParser class >> cacheId [
	^'2017-05-03T21:20:06.107625+02:00'
]

{ #category : #generated }
SwiftParser class >> definitionComment [
"%glr;

%root Parse;
%prefix Swift;
%suffix Node;

%annotate_tokens;

%hierarchy Statement (
	BranchStatement
	ControlTransferStatement
	DeclarationStatement
	ExpressionStatement
	LabeledStatement
	LoopStatement
);
%hierarchy BranchStatement (
	IfStatement
	SwitchStatement
);
%hierarchy LoopStatement (
	DoWhileStatement
	ForStatement
	ForInStatement
	WhileStatement
);
%hierarchy ControlTransferStatement (
	BreakStatement
	ContinueStatement
	FallThroughStatement
	ReturnStatement
);
<whitespace>
	: \s+
	;
<comment>
	: \/\/ [^\r\n]*
	| (\/\* [^\*]* \*+ ([^\/\*] [^\*]* \*+)* \/)
	;
file
	: top_level_declaration {{}}
	;
##############
# Lexical Structure
##############
<id>
	: ([a-zA-Z_]) ([a-zA-Z_0-9])*
	;
<integer>
	: \d+
	;
<implicit_parameter_name>
	: $ <integer>
	;
<identifier>
	: <id>
	| ` <id> `
	| <implicit_parameter_name>
	;
identifier_list
	: <identifier>
	| identifier_list "","" <identifier>
	;
<binary_literal>
	: 0b[01][01_]* 
	;
<octal_literal>
	: 0o[0-7][0-7_]*
	;
<decimal_literal>
	: <integer> (<integer>|_)*
	;
<hexadecimal_literal>
	: 0x[0-9a-fA-F][0-9a-fA-F_]*
	;
<integer_literal>
	: <binary_literal>
	| <octal_literal>
	| <decimal_literal>
	| <hexadecimal_literal>
	;
<decimal_fraction>
	: \. <decimal_literal>
	;
<decimal_exponent>
	: [eE] [-+]? <decimal_literal>
	;
<hexadecimal_digit>
	: [0-9a-fA-F]
	;
<hexadecimal_fraction>
	: \. (<hexadecimal_digit> | _)*
	;
<hexadecimal_exponent>
	: [pP] [-+]? <decimal_literal>
	;
<floating_point_literal>
	: <decimal_literal> <decimal_fraction>? <decimal_exponent>?
	| <hexadecimal_literal> <hexadecimal_fraction>? <hexadecimal_exponent>
	;
<string_character>
	: \\([0\\tnr\""\(] | x <hexadecimal_digit>{2,2} | u <hexadecimal_digit>{4,4} | U <hexadecimal_digit>{8,8}) | [^\\\""\r\n]
	;
<full_string_literal>
	: \"" <string_character> * \""
	;
<start_string_literal>
	: \"" <string_character>* \\ \(
	;
<end_string_literal>
	: \\ \) <string_character>* \""
	;
<middle_string_literal>
	: \) <string_character>* \\ \(
	;
string_literal
	: <full_string_literal>
#	| <start_string_literal> string_expression_literals <end_string_literal>
	;
#string_expression_literals
#	: expression
#	| string_expression_literals <middle_string_literal> expression
#	;
literal
	: <integer_literal>
	| <floating_point_literal>
	| string_literal
	;

<operator>
	: [\/\=\-\+\!\*\%\<\>\&\|\^\~\.] +
	;
binary_operator
	: <operator>
	;
prefix_operator
	: <operator>
	;
postfix_operator
	: <operator>
	;
###############
# Statements
###############
statement
	: expression 'expression' _semicolon {{ExpressionStatement}}
	| declaration 'declaration' _semicolon {{DeclarationStatement}}
	| loop_statement _semicolon {{LoopStatement}}
	| branch_statement _semicolon {{BranchStatement}}
	| labeled_statement _semicolon {{LabeledStatement}}
	| control_transfer_statement _semicolon {{ControlTransferStatement}}
	;
statements
	: statement 'statement'
	| statements statement 'statement'
	;
loop_statement
	: for_statement
	| for_in_statement
	| while_statement
	| do_while_statement
	;
for_statement
	: ""for"" _for_init "";"" _expression 'testExpression' "";"" _expression 'incrementExpression' code_block 'block' {{ForStatement}}
	| ""for"" ""("" _for_init "";"" _expression 'testExpression' "";"" _expression 'incrementExpression' "")"" code_block 'block' {{ForStatement}}
	;
for_init
	: variable_declaration 'expression'
	| expression_list
	;
for_in_statement
	: ""for"" pattern ""in"" expression 'expression' code_block 'block' {{ForInStatement}}
	;
while_statement
	: ""while"" while_condition 'expression' code_block 'block' {{WhileStatement}}
	;
while_condition
	: expression
	| declaration
	;
do_while_statement
	: ""do"" code_block 'block' ""while"" while_condition {{DoWhileStatement}}
	;
branch_statement
	: if_statement
	| switch_statement
	;
if_statement
	: ""if"" if_condition code_block 'then' _else_clause {{IfStatement}}
	;
if_condition
	: expression 'expression'
	| declaration 'expression'
	;
else_clause
	: ""else"" code_block 'else'
	| ""else"" if_statement 'else'
	;
switch_statement
	: ""switch"" expression 'expression' ""{"" _switch_cases ""}"" {{SwitchStatement}}
	;
switch_cases
	: switch_case
	| switch_cases switch_case
	;
switch_case
	: case_label statements
	| case_label "";""
	| default_label statements
	| default_label "";""
	;
case_label
	: ""case"" case_item_list "":""
	;
case_item_list
	: pattern _guard_clause
	| case_item_list "","" pattern _guard_clause
	;
default_label
	: ""default"" "":""
	;
guard_clause
	: ""where"" guard_expression 'expression'
	;
guard_expression
	: expression
	;
labeled_statement
	: statement_label  loop_statement 'statement' {{LabeledStatement}}
	| statement_label switch_statement 'statement' {{LabeledStatement}}
	;
statement_label
	: label_name "":""
	;
label_name
	: <identifier> 'name'
	;
control_transfer_statement
	: break_statement
	| continue_statement
	| fallthrough_statement
	| return_statement
	;
break_statement
	: ""break"" _label_name {{BreakStatement}}
	;
continue_statement
	: ""continue"" _label_name {{ContinueStatement}}
	;
fallthrough_statement
	: ""fallthrough"" {{FallThroughStatement}}
	;
return_statement
	: ""return"" _expression {{ReturnStatement}}
	;
##############
# Generic Parameters and Arguments
##############
generic_parameter_clause
	: ""<"" generic_parameter_list _requirement_clause "">""
	;
generic_parameter_list
	: generic_parameter
	| generic_parameter_list "","" generic_parameter
	;
generic_parameter
	: type_name
	| type_name "":"" type_identifier
	| type_name "":"" protocol_composition_type
	;
requirement_clause
	: ""where"" requirement_list
	;
requirement_list
	: requirement
	| requirement_list "","" requirement
	;
requirement
	: conformance_requirement
	| same_type_requirement
	;
conformance_requirement
	: type_identifier "":"" type_identifier
	| type_identifier "":"" protocol_composition_type
	;
same_type_requirement
	: type_identifier ""=="" type_identifier
	;
generic_argument_clause
	: ""<"" generic_argument_list "">""
	;
generic_argument_list
	: generic_argument
	| generic_argument_list "","" generic_argument
	;
generic_argument
	: type
	;
#################
# Declarations
#################
declaration
	: import_declaration
	| constant_declaration
	| variable_declaration
	| typealias_declaration
	| function_declaration
	| enum_declaration
	| struct_declaration
	| class_declaration
	| protocol_declaration
	| initializer_declaration
	| deinitializer_declaration
	| extension_declaration
	| subscript_declaration
	| operator_declaration
	;
declarations
	: 
	| declarations declaration 'declaration'
	;
declaration_specifiers
	: 
	| declaration_specifiers  declaration_specifier
	;
declaration_specifier
	: ""class""
	| ""mutating""
	| ""nonmutating""
	| ""override""
	| ""static""
	| ""unowned""
	| ""unowned(safe)""
	| ""unowned(unsafe)""
	| ""weak""
	;
top_level_declaration
	: _statements
	;
code_block
	: ""{"" _statements ""}"" {{Block}}
	;
import_declaration
	: _attributes ""import"" _import_kind import_path {{}}
	;
import_kind
	: ""typealias""
	| ""struct""
	| ""class""
	| ""enum""
	| ""protocol""
	| ""var""
	| ""func""
	;
import_path
	: import_path_identifier
	| import_path ""."" import_path_identifier
	;
import_path_identifier
	: <identifier>
	| <operator>
	;
constant_declaration
	: _attributes _declaration_specifiers ""let"" pattern_initializer_list {{}}
	;
pattern_initializer_list
	: pattern_initializer 'inializer'
	| pattern_initializer_list "","" pattern_initializer 'inializer'
	;
pattern_initializer
	: pattern _initializer {{}}
	;
initializer
	: ""="" expression 'expression'
	;
variable_declaration
	: variable_declaration_head pattern_initializer_list {{}}
	| variable_declaration_head variable_name type_annotation code_block 'block' {{}}
	| variable_declaration_head variable_name type_annotation getter_setter_block {{}}
	| variable_declaration_head variable_name type_annotation getter_setter_keyword_block {{}}
	| variable_declaration_head variable_name type_annotation _initializer willSet_didSet_block {{}}
	;
variable_declaration_head
	: _attributes _declaration_specifiers ""var""
	;
variable_name
	: <identifier>
	;
getter_setter_block
	: ""{"" getter_clause _setter_clause ""}""
	| ""{"" setter_clause getter_clause ""}""
	;
getter_clause
	: _attributes ""get"" code_block 'block'
	;
setter_clause
	: _attributes ""set"" _setter_name code_block 'block'
	;
setter_name
	: ""("" <identifier> "")""
	;
getter_setter_keyword_block
	: ""{"" getter_keyword_clause _setter_keyword_clause ""}""
	| ""{"" setter_keyword_clause getter_keyword_clause ""}""
	;
getter_keyword_clause
	: _attributes ""get""
	;
setter_keyword_clause
	: _attributes ""set""
	;
willSet_didSet_block
	: ""{"" willSet_clause _didSet_clause ""}""
	| ""{"" didSet_clause willSet_clause ""}""
	;
willSet_clause
	: _attributes ""willSet"" _setter_name code_block 'block' 
	;
didSet_clause
	: _attributes ""didSet"" _setter_name code_block 'block'
	;
typealias_declaration
	: typealias_head typealias_assignment {{}}
	;
typealias_head
	: ""typealias"" typealias_name
	;
typealias_name
	: <identifier>
	;
typealias_assignment
	: ""="" type
	;
function_declaration
	: function_head function_name _generic_parameter_clause function_signature function_body 'block' {{}}
	;
function_head
	: _attributes _declaration_specifiers ""func"" 
	;
function_name
	: <identifier>
	| <operator>
	;
function_signature
	: parameter_clauses _function_result
	;
function_result
	: ""->"" _attributes type
	;
function_body
	: code_block
	;
parameter_clauses
	:
	| parameter_clauses parameter_clause
	;
parameter_clause
	: ""("" "")""
	| ""("" parameter_list _ellipsis "")""
	;
parameter_list
	: parameter
	| parameter_list "","" parameter
	;
parameter
	: _inout _let _hash parameter_name _local_parameter_name type_annotation _default_argument_clause
	| _inout ""var"" _hash parameter_name _local_parameter_name type_annotation _default_argument_clause
	| _attributes type
	;
parameter_name
	: <identifier>
	| ""_""
	;
local_parameter_name
	: <identifier>
	| ""_""
	;
default_argument_clause
	: ""="" expression 'expression'
	;
enum_declaration
	: _attributes union_style_enum {{}}
	| _attributes raw_value_style_enum {{}}
	;
union_style_enum
	: enum_name _generic_parameter_clause ""{"" _union_style_enum_members ""}""
	;
union_style_enum_members
	: union_style_enum_member
	| union_style_enum_members union_style_enum_member
	;
union_style_enum_member
	: declaration
	| union_style_enum_case_clause
	;
union_style_enum_case_clause
	: _attributes ""case"" union_style_enum_case_list
	;
union_style_enum_case_list
	: union_style_enum_case
	| union_style_enum_case_list "","" union_style_enum_case
	;
union_style_enum_case
	: enum_case_name _tuple_type
	;
enum_name
	: <identifier>
	;
enum_case_name
	: <identifier>
	;
raw_value_style_enum
	: enum_name _generic_parameter_clause "":"" type_identifier ""{"" _raw_value_style_enum_members ""}""
	;
raw_value_style_enum_members
	: raw_value_style_enum_member
	| raw_value_style_enum_members raw_value_style_enum_member
	;
raw_value_style_enum_member
	: declaration
	| raw_value_style_enum_case_clause
	;
raw_value_style_enum_case_clause
	: _attributes ""case"" raw_value_style_enum_case_list
	;
raw_value_style_enum_case_list
	: raw_value_style_enum_case
	| raw_value_style_enum_case_list "","" raw_value_style_enum_case
	;
raw_value_style_enum_case
	: enum_case_name _raw_value_assignment
	;
raw_value_assignment
	: ""="" literal
	;
struct_declaration
	: _attributes ""struct"" struct_name _generic_parameter_clause _type_inheritance_clause struct_body {{}}
	;
struct_name
	: <identifier>
	;
struct_body
	: ""{"" _declarations ""}""
	;
class_declaration
	: _attributes ""class"" class_name _generic_parameter_clause _type_inheritance_clause class_body {{}}
	;
class_name
	: <identifier>
	;
class_body
	: ""{"" _declarations ""}""
	;
protocol_declaration
	: _attributes ""protocol"" protocol_name _type_inheritance_clause protocol_body {{}}
	;
protocol_name
	: <identifier>
	;
protocol_body
	: ""{"" _protocol_member_declarations ""}""
	;
protocol_member_declaration
	: protocol_property_declaration
	| protocol_method_declaration
	| protocol_initializer_declaration
	| protocol_subscript_declaration
	| protocol_association_type_declaration
	;
protocol_member_declarations
	: protocol_member_declaration 'declaration'
	| protocol_member_declarations protocol_member_declaration 'declaration'
	;
protocol_property_declaration
	: variable_declaration_head variable_name type_annotation getter_setter_keyword_block {{}}
	;
protocol_method_declaration
	: function_head function_name _generic_parameter_clause function_signature {{}}
	;
protocol_initializer_declaration
	: initializer_head _generic_parameter_clause parameter_clause {{}}
	;
protocol_subscript_declaration
	: subscript_head subscript_result getter_setter_keyword_block {{}}
	;
protocol_association_type_declaration
	: typealias_head _type_inheritance_clause _typealias_assignment {{}}
	;
initializer_declaration
	: initializer_head _generic_parameter_clause parameter_clause initializer_body 'block' {{}}
	;
initializer_head
	: _attributes _convenience ""init""
	;
initializer_body
	: code_block
	;
deinitializer_declaration
	: _attributes ""deinit"" code_block 'block' {{}}
	;
extension_declaration
	: ""extension"" type_identifier _type_inheritance_clause extension_body {{}}
	;
extension_body
	: ""{"" _declarations ""}""
	;
subscript_declaration
	: subscript_head subscript_result code_block 'block' {{}}
	| subscript_head subscript_result getter_setter_block {{}}
	| subscript_head subscript_result getter_setter_keyword_block {{}}
	;
subscript_head
	: _attributes ""subscript"" parameter_clause
	;
subscript_result
	: ""->"" _attributes type
	;
operator_declaration
	: prefix_operator_declaration
	| postfix_operator_declaration
	| infix_operator_declaration
	;
prefix_operator_declaration
	: ""operator"" ""prefix"" <operator> ""{"" ""}"" {{}}
	;
postfix_operator_declaration
	: ""operator"" ""postfix""  <operator> ""{"" ""}"" {{}}
	;
infix_operator_declaration
	: ""operator"" ""infix"" <operator> ""{"" _infix_operator_attributes ""}"" {{}}
	;
infix_operator_attributes
	: _precedence_clause _associativity_clause
	;
precedence_clause
	: ""precedence"" precedence_level
	;
precedence_level
	: <integer_literal>
	;
associativity_clause
	: ""associativity"" associativity
	;
associativity
	: ""left""
	| ""right""
	| ""none""
	;
######################
# Patterns
######################
pattern
	: wildcard_pattern _type_annotation
	| identifier_pattern _type_annotation
	| value_binding_pattern
	| tuple_pattern _type_annotation
	| enum_case_pattern
	| type_casting_pattern
	| expression_pattern
	;
wildcard_pattern
	: ""_""
	;
identifier_pattern
	: <identifier>
	;
value_binding_pattern
	: ""var"" pattern
	| ""let"" pattern
	;
tuple_pattern
	: ""("" _tuple_pattern_element_list "")""
	;
tuple_pattern_element_list
	: tuple_pattern_element
	| tuple_pattern_element_list "","" tuple_pattern_element
	;
tuple_pattern_element
	: pattern
	;
enum_case_pattern
	: _type_identifier ""."" enum_case_name _tuple_pattern
	;
type_casting_pattern
	: is_pattern
	| as_pattern
	;
is_pattern
	: ""is"" type
	;
as_pattern
	: pattern ""as"" type
	;
expression_pattern
	: expression 'expression'
	;
######################
# Attributes
######################
attribute
	: ""@"" attribute_name _attribute_argument_clause
	;
attribute_name
	: <identifier>
	;
attribute_argument_clause
	: ""("" _balanced_tokens "")""
	;
attributes
	: attribute
	| attributes attribute
	;
balanced_tokens
	: balanced_token
	| balanced_tokens balanced_token
	;
balanced_token
	: ""("" _balanced_tokens "")""
	| ""["" _balanced_tokens ""]""
	| ""{"" _balanced_tokens ""}""
	| <identifier>
	| literal
	| <operator>
	# “Any punctuation except (, ), [, ], {, or }”
	;
expression
	: prefix_expression 
	| prefix_expression binary_expressions {{BinaryExpression}}
	;
expression_list
	: expression 'expression'
	| expression_list "","" expression 'expression'
	;
prefix_expression
	: postfix_expression
	| prefix_operator postfix_expression {{}}
	| in_out_expression
	;
in_out_expression
	: ""&"" <identifier> {{}}
	;
binary_expression
	: binary_operator prefix_expression {{BinaryOperator}}
	| assignment_operator prefix_expression {{AssignmentOperator}}
	| conditional_operator prefix_expression {{CondionalOperator}}
	| type_casting_operator {{TypeCastOperator}}
	;
binary_expressions
	: binary_expression 'operator'
	| binary_expressions binary_expression 'operator'
	;
assignment_operator
	: ""=""
	;
conditional_operator
	: ""?"" expression 'trueExpression' "":""
	;
type_casting_operator
	: ""is"" type 'type'
	| ""as"" type 'type'
	| ""as"" ""?"" type 'type'
	;
primary_expression
	: <identifier> _generic_argument_clause {{}}
	| literal_expression
	| self_expression
	| superclass_expression
	| closure_expression
	| parenthesized_expression
	| implicit_member_expression
	| wildcard_expression
	;
literal_expression
	: literal {{}}
	| array_literal {{}}
	| dictionary_literal {{}}
	| ""__FILE__"" {{}}
	| ""__LINE__"" {{}}
	| ""__COLUMN__"" {{}}
	| ""__FUNCTION__"" {{}}
	;
array_literal
	: ""["" _array_literal_items ""]""
	;
array_literal_items
	: array_literal_item _comma
	| array_literal_item "","" array_literal_items
	;
array_literal_item
	: expression 'expression'
	;
dictionary_literal
	: ""["" dictionary_literal_items ""]""	
	| ""["" "":"" ""]""
	;
dictionary_literal_items
	: dictionary_literal_item _comma
	| dictionary_literal_item "","" dictionary_literal_items
	;
dictionary_literal_item
	: expression 'keyExpression' "":"" expression 'valueExpression'
	;
self_expression
	: ""self"" {{}}
	| ""self"" ""."" <identifier> {{}}
	| ""self"" ""["" expression 'expression' ""]"" {{}}
	| ""self"" ""."" ""init"" {{}}
	;
superclass_expression
	: superclass_method_expression
	| superclass_subscript_expression
	| superclass_initializer_expression
	;
superclass_method_expression
	: ""super"" ""."" <identifier> {{}}
	;
superclass_subscript_expression
	: ""super"" ""["" expression 'expression' ""]"" {{}}
	;
superclass_initializer_expression
	: ""super"" ""."" ""init"" {{}}
	;
closure_expression
	: ""{"" _closure_signature statements ""}"" {{}}
	;
closure_signature
	: parameter_clause _function_result ""in""
	| identifier_list _function_result ""in""
	| capture_list parameter_clause _function_result ""in""
	| capture_list identifier_list _function_result ""in""
	| capture_list ""in""
	;
capture_list
	: ""["" capture_specifier expression 'expression' ""]""
	;
capture_specifier
	: ""weak""
	| ""unowned""
	| ""unowned(safe)""
	| ""unowned(unsafe)""
	;
implicit_member_expression
	: ""."" <identifier> {{}}
	;
parenthesized_expression
	: ""("" _expression_element_list "")""  {{}}
	;
expression_element_list
	: expression_element
	| expression_element_list "","" expression_element
	;
expression_element
	: expression 'expression'
	| <identifier> "":"" expression 'expression' {{NamedExpression}}
	;
wildcard_expression
	: ""_"" {{}}
	;
postfix_expression
	: primary_expression
	| postfix_expression postfix_operator
	| function_call_expression
	| initializer_expression
	| explicit_member_expression
	| postfix_self_expression
	| dynamic_type_expression
	| subscript_expression
	| forced_value_expression
	| optional_chaining_expression
	;
function_call_expression
	: postfix_expression 'expression' parenthesized_expression {{}}
	| postfix_expression 'expression' _parenthesized_expression trailing_closure {{}}
	;
trailing_closure
	: closure_expression
	;
initializer_expression
	: postfix_expression ""."" ""init"" {{}}
	;
explicit_member_expression
	: postfix_expression ""."" <integer_literal> {{}}
	| postfix_expression ""."" <identifier> _generic_argument_clause {{}}
	;
postfix_self_expression
	: postfix_expression ""."" ""self"" {{}}
	;
dynamic_type_expression
	: postfix_expression ""."" ""dynamicType"" {{}}
	;
subscript_expression
	: postfix_expression ""["" expression_list ""]"" {{}}
	;
forced_value_expression
	: postfix_expression 'expression' ""!"" {{}}
	;
optional_chaining_expression
	: postfix_expression 'expression' ""?"" {{}}
	;
######################
# Types
######################
type
	: array_type
	| dictionary_type
	| function_type
	| type_identifier
	| tuple_type
	| optional_type
	| implicitly_unwrapped_optional_type
	| protocol_composition_type
	| metatype_type
	;
type_annotation
	: "":"" _attributes type
	;
type_identifier
	: type_name _generic_argument_clause {{}}
	| type_name _generic_argument_clause ""."" type_identifier {{}}
	;
type_name
	: <identifier>
	;
tuple_type
	: ""("" _tuple_type_body "")"" {{}}
	;
tuple_type_body
	: tuple_type_element_list _ellipsis
	;
tuple_type_element_list
	: tuple_type_element
	| tuple_type_element_list "","" tuple_type_element
	;
tuple_type_element
	: _attributes _inout type
	| _inout element_name type_annotation
	;
element_name
	: <identifier>
	;
function_type
	: type ""->"" type {{}}
	;
array_type
	: ""["" type ""]"" {{}}
	;
dictionary_type
	: ""["" type "":"" type ""]"" {{}}
	;
optional_type
	: type ""?"" {{}}
	;
implicitly_unwrapped_optional_type
	: type ""!"" {{}}
	;
protocol_composition_type
	: ""protocol"" ""<"" _protocol_identifier_list "">"" {{}}
	;
protocol_identifier_list
	: protocol_identifier
	| protocol_identifier_list "","" protocol_identifier
	;
protocol_identifier
	: type_identifier
	;
metatype_type
	: type ""."" ""Type"" {{}}
	| type ""."" ""Protocol"" {{}}
	;
type_inheritance_clause
	: "":"" type_inheritance_list
	;
type_inheritance_list
	: type_identifier
	| type_inheritance_list "","" type_identifier
	;
######################
# Optional items
######################
_array_literal_items
	:
	| array_literal_items
	;
_associativity_clause
	:
	| associativity_clause
	;
_attribute_argument_clause
	:
	| attribute_argument_clause
	;
_attributes
	:
	| attributes
	;
_balanced_tokens
	:
	| balanced_tokens
	;
_binary_expressions
	:
	| binary_expressions
	;
_closure_signature
	:
	| closure_signature
	;
_comma
	:
	| "",""
	;
_convenience
	:
	| ""convenience""
	;
_declaration_specifiers
	:
	| declaration_specifiers
	;
_declarations
	: 
	| declarations
	;
_default_argument_clause
	: 
	| default_argument_clause
	;
_didSet_clause
	:
	| didSet_clause
	;
_ellipsis
	:
	| ""...""
	;
_else_clause
	: 
	| else_clause
	;
_expression
	:
	| expression 'expression'
	;
_expression_element_list
	:
	| expression_element_list
	;
_generic_argument_clause
	:
	| generic_argument_clause
	;
_generic_parameter_clause
	: 
	| generic_parameter_clause
	;
_guard_clause
	:
	| guard_clause
	;
_for_init
	:
	| for_init
	;
_function_result
	:
	| function_result
	;
_hash
	:
	| ""#""
	;
_import_kind
	: 
	| import_kind
	;
_infix_operator_attributes
	:
	| infix_operator_attributes
	;
_initializer
	: 
	| initializer
	;
_inout
	: 
	| ""inout""
	;
_label_name
	: 
	| label_name
	;
_let
	:
	| ""let""
	;
_local_parameter_name
	:
	| local_parameter_name
	;
_parenthesized_expression
	:
	| parenthesized_expression
	;
_precedence_clause
	:
	| precedence_clause
	;
_prefix_operator
	:
	| prefix_operator
	;
_protocol_identifier_list
	: 
	| protocol_identifier_list
	;
_protocol_member_declarations
	:
	| protocol_member_declarations
	;
_raw_value_assignment
	: 
	| raw_value_assignment
	;
_raw_value_style_enum_members
	: 
	| raw_value_style_enum_members
	;
_requirement_clause
	:
	| requirement_clause
	;
_semicolon
	:
	| "";""
	;
_setter_clause
	: 
	| setter_clause
	;
_setter_keyword_clause
	:
	| setter_keyword_clause
	;
_setter_name
	: 
	| setter_name
	;
_statements
	:
	| statements
	;
_switch_cases
	: 
	| switch_cases
	;
_tuple_pattern
	:
	| tuple_pattern
	;
_tuple_pattern_element_list
	: 
	| tuple_pattern_element_list
	;
_tuple_type
	:
	| tuple_type
	;
_tuple_type_body
	:
	| tuple_type_body
	;
_typealias_assignment
	:
	| typealias_assignment
	;
_type_annotation
	:
	| type_annotation
	;
_type_identifier
	:
	| type_identifier
	;
_type_inheritance_clause
	:
	| type_inheritance_clause
	;
_union_style_enum_members
	:
	| union_style_enum_members
	;"
]

{ #category : #'generated-accessing' }
SwiftParser class >> scannerClass [
	^SwiftScanner
]

{ #category : #generated }
SwiftParser class >> startingStateForfile [
	^ 1
]

{ #category : #generated }
SwiftParser >> ambiguousTransitions [
^#(
#[ 0 6 0 109] 
#[ 0 14 0 25] 
#[ 0 14 0 49] 
#[ 0 14 0 57] 
#[ 0 14 0 61] 
#[ 0 14 0 65] 
#[ 0 14 0 69] 
#[ 0 14 0 77] 
#[ 0 14 0 81] 
#[ 0 14 0 85] 
#[ 0 14 0 89] 
#[ 0 14 0 93] 
#[ 0 14 0 97] 
#[ 0 14 1 173] 
#[ 0 14 0 113] 
#[ 0 14 0 117] 
#[ 0 14 0 121] 
#[ 0 14 0 125] 
#[ 0 6 1 173] 
#[ 0 6 1 233] 
#[ 0 30 0 57] 
#[ 0 34 2 89] 
#[ 0 38 2 105] 
#[ 0 38 2 109] 
#[ 0 38 2 113] 
#[ 0 62 2 193] 
#[ 0 62 2 197] 
#[ 0 134 3 25] 
#[ 0 134 0 138] 
#[ 0 166 3 129] 
#[ 0 166 3 137] 
#[ 0 166 3 141] 
#[ 0 25 0 170] 
#[ 0 170 0 174] 
#[ 0 170 3 169] 
#[ 0 170 3 173] 
#[ 0 170 3 177] 
#[ 0 170 3 185] 
#[ 0 22 0 230] 
#[ 0 66 0 234] 
#[ 0 70 0 238] 
#[ 0 242 2 221] 
#[ 0 70 0 238 0 242] 
#[ 1 14 4 109] 
#[ 0 6 1 58] 
#[ 1 86 4 221] 
#[ 0 25 1 114] 
#[ 0 174 1 114] 
#[ 1 114 3 169] 
#[ 1 114 3 173] 
#[ 1 114 3 177] 
#[ 1 114 3 185] 
#[ 1 198 3 129] 
#[ 1 198 3 137] 
#[ 1 198 3 141] 
#[ 1 226 1 230] 
#[ 0 238 1 234] 
#[ 2 2 4 97] 
#[ 0 238 3 233] 
#[ 0 70 0 242] 
#[ 0 218 0 246] 
#[ 0 218 0 246 0 250] 
#[ 2 18 4 97] 
#[ 0 6 4 141] 
#[ 2 30 6 137] 
#[ 2 34 6 169] 
#[ 3 18 6 137] 
#[ 3 50 6 137] 
#[ 3 50 6 141] 
#[ 3 54 6 137] 
#[ 3 54 6 141] 
#[ 1 238 5 225] 
#[ 3 150 6 137] 
#[ 3 158 8 97] 
#[ 4 2 4 6] 
#[ 4 14 4 18] 
#[ 4 34 9 13] 
#[ 4 78 6 137] 
#[ 4 78 6 141] 
#[ 4 150 6 137] 
#[ 4 150 6 141] 
#[ 4 150 6 145] 
#[ 4 150 6 149] 
#[ 4 162 6 137]
	).
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFor_associativity_clause1: nodes [
	| result |
	result := Array new: 4.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFor_attribute_argument_clause1: nodes [
	| result |
	result := Array new: 11.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFor_attributes1: nodes [
	| result |
	result := Array new: 12.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFor_closure_signature1: nodes [
	| result |
	result := Array new: 33.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFor_expression_element_list1: nodes [
	| result |
	result := Array new: 4.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFor_for_init1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFor_generic_argument_clause1: nodes [
	| result |
	result := Array new: 3.
	result at: 2 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFor_generic_parameter_clause1: nodes [
	| result |
	result := Array new: 9.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFor_import_kind1: nodes [
	| result |
	result := Array new: 7.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFor_infix_operator_attributes1: nodes [
	| result |
	result := Array new: 6.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFor_initializer1: nodes [
	| result |
	result := Array new: 2.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFor_protocol_identifier_list1: nodes [
	| result |
	result := Array new: 5.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFor_requirement_clause1: nodes [
	| result |
	result := Array new: 9.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFor_setter_clause1: nodes [
	| result |
	result := Array new: 14.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFor_setter_keyword_clause1: nodes [
	| result |
	result := Array new: 13.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFor_setter_name1: nodes [
	| result |
	result := Array new: 3.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFor_statements1: nodes [
	| result |
	result := OrderedCollection new: 2.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFor_statements2: nodes [
	| result |
	result := nodes at: 1.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFor_switch_cases1: nodes [
	| result |
	result := Array new: 34.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	result at: 30 put: (OrderedCollection new: 2).
	result at: 31 put: (OrderedCollection new: 2).
	result at: 32 put: (OrderedCollection new: 2).
	result at: 33 put: (OrderedCollection new: 2).
	result at: 34 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFor_tuple_pattern_element_list1: nodes [
	| result |
	result := Array new: 29.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFor_type_annotation1: nodes [
	| result |
	result := Array new: 24.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFor_type_inheritance_clause1: nodes [
	| result |
	result := Array new: 6.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFor_typealias_assignment1: nodes [
	| result |
	result := Array new: 25.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	result at: 25 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFor_union_style_enum_members1: nodes [
	| result |
	result := Array new: 57.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	result at: 30 put: (OrderedCollection new: 2).
	result at: 31 put: (OrderedCollection new: 2).
	result at: 32 put: (OrderedCollection new: 2).
	result at: 33 put: (OrderedCollection new: 2).
	result at: 34 put: (OrderedCollection new: 2).
	result at: 35 put: (OrderedCollection new: 2).
	result at: 36 put: (OrderedCollection new: 2).
	result at: 37 put: (OrderedCollection new: 2).
	result at: 38 put: (OrderedCollection new: 2).
	result at: 39 put: (OrderedCollection new: 2).
	result at: 40 put: (OrderedCollection new: 2).
	result at: 41 put: (OrderedCollection new: 2).
	result at: 42 put: (OrderedCollection new: 2).
	result at: 43 put: (OrderedCollection new: 2).
	result at: 44 put: (OrderedCollection new: 2).
	result at: 45 put: (OrderedCollection new: 2).
	result at: 46 put: (OrderedCollection new: 2).
	result at: 47 put: (OrderedCollection new: 2).
	result at: 48 put: (OrderedCollection new: 2).
	result at: 49 put: (OrderedCollection new: 2).
	result at: 50 put: (OrderedCollection new: 2).
	result at: 51 put: (OrderedCollection new: 2).
	result at: 52 put: (OrderedCollection new: 2).
	result at: 53 put: (OrderedCollection new: 2).
	result at: 54 put: (OrderedCollection new: 2).
	result at: 55 put: (OrderedCollection new: 2).
	result at: 56 put: (OrderedCollection new: 2).
	result at: 57 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFor_union_style_enum_members2: nodes [
	| result |
	result := Array new: 57.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	result at: 30 put: (OrderedCollection new: 2).
	result at: 31 put: (OrderedCollection new: 2).
	result at: 32 put: (OrderedCollection new: 2).
	result at: 33 put: (OrderedCollection new: 2).
	result at: 34 put: (OrderedCollection new: 2).
	result at: 35 put: (OrderedCollection new: 2).
	result at: 36 put: (OrderedCollection new: 2).
	result at: 37 put: (OrderedCollection new: 2).
	result at: 38 put: (OrderedCollection new: 2).
	result at: 39 put: (OrderedCollection new: 2).
	result at: 40 put: (OrderedCollection new: 2).
	result at: 41 put: (OrderedCollection new: 2).
	result at: 42 put: (OrderedCollection new: 2).
	result at: 43 put: (OrderedCollection new: 2).
	result at: 44 put: (OrderedCollection new: 2).
	result at: 45 put: (OrderedCollection new: 2).
	result at: 46 put: (OrderedCollection new: 2).
	result at: 47 put: (OrderedCollection new: 2).
	result at: 48 put: (OrderedCollection new: 2).
	result at: 49 put: (OrderedCollection new: 2).
	result at: 50 put: (OrderedCollection new: 2).
	result at: 51 put: (OrderedCollection new: 2).
	result at: 52 put: (OrderedCollection new: 2).
	result at: 53 put: (OrderedCollection new: 2).
	result at: 54 put: (OrderedCollection new: 2).
	result at: 55 put: (OrderedCollection new: 2).
	result at: 56 put: (OrderedCollection new: 2).
	result at: 57 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 1) at: 7) to: (result at: 7).
	self addAll: ((nodes at: 1) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 1) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 1) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 1) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 1) at: 12) to: (result at: 12).
	self addAll: ((nodes at: 1) at: 13) to: (result at: 13).
	self addAll: ((nodes at: 1) at: 14) to: (result at: 14).
	self addAll: ((nodes at: 1) at: 15) to: (result at: 15).
	self addAll: ((nodes at: 1) at: 16) to: (result at: 16).
	self addAll: ((nodes at: 1) at: 17) to: (result at: 17).
	self addAll: ((nodes at: 1) at: 18) to: (result at: 18).
	self addAll: ((nodes at: 1) at: 19) to: (result at: 19).
	self addAll: ((nodes at: 1) at: 20) to: (result at: 20).
	self addAll: ((nodes at: 1) at: 21) to: (result at: 21).
	self addAll: ((nodes at: 1) at: 22) to: (result at: 22).
	self addAll: ((nodes at: 1) at: 23) to: (result at: 23).
	self addAll: ((nodes at: 1) at: 24) to: (result at: 24).
	self addAll: ((nodes at: 1) at: 25) to: (result at: 25).
	self addAll: ((nodes at: 1) at: 26) to: (result at: 26).
	self addAll: ((nodes at: 1) at: 27) to: (result at: 27).
	self addAll: ((nodes at: 1) at: 28) to: (result at: 28).
	self addAll: ((nodes at: 1) at: 29) to: (result at: 29).
	self addAll: ((nodes at: 1) at: 30) to: (result at: 30).
	self addAll: ((nodes at: 1) at: 31) to: (result at: 31).
	self addAll: ((nodes at: 1) at: 32) to: (result at: 32).
	self addAll: ((nodes at: 1) at: 33) to: (result at: 33).
	self addAll: ((nodes at: 1) at: 34) to: (result at: 34).
	self addAll: ((nodes at: 1) at: 35) to: (result at: 35).
	self addAll: ((nodes at: 1) at: 36) to: (result at: 36).
	self addAll: ((nodes at: 1) at: 37) to: (result at: 37).
	self addAll: ((nodes at: 1) at: 38) to: (result at: 38).
	self addAll: ((nodes at: 1) at: 39) to: (result at: 39).
	self addAll: ((nodes at: 1) at: 40) to: (result at: 40).
	self addAll: ((nodes at: 1) at: 41) to: (result at: 41).
	self addAll: ((nodes at: 1) at: 42) to: (result at: 42).
	self addAll: ((nodes at: 1) at: 43) to: (result at: 43).
	self addAll: ((nodes at: 1) at: 44) to: (result at: 44).
	self addAll: ((nodes at: 1) at: 45) to: (result at: 45).
	self addAll: ((nodes at: 1) at: 46) to: (result at: 46).
	self addAll: ((nodes at: 1) at: 47) to: (result at: 47).
	self addAll: ((nodes at: 1) at: 48) to: (result at: 48).
	self addAll: ((nodes at: 1) at: 49) to: (result at: 49).
	self addAll: ((nodes at: 1) at: 50) to: (result at: 57).
	self addAll: ((nodes at: 1) at: 51) to: (result at: 50).
	self addAll: ((nodes at: 1) at: 52) to: (result at: 51).
	self addAll: ((nodes at: 1) at: 53) to: (result at: 52).
	self addAll: ((nodes at: 1) at: 54) to: (result at: 53).
	self addAll: ((nodes at: 1) at: 55) to: (result at: 54).
	self addAll: ((nodes at: 1) at: 56) to: (result at: 55).
	self addAll: ((nodes at: 1) at: 57) to: (result at: 56).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForarray_literal1: nodes [
	| result |
	result := Array new: 4.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	result at: 4 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForarray_literal_items1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self add: (nodes at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForarray_literal_items2: nodes [
	| result |
	result := nodes at: 3.
	self addFirst: (nodes at: 1) to: (result at: 1).
	self addFirst: (nodes at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForarray_type1: nodes [
	| result |
	result := SwiftArrayTypeNode new.
	result addToken: (nodes at: 1) to: result leftBracketTokens.
	result addToken: (nodes at: 3) to: result rightBracketTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForas_pattern1: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 29).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForassociativity_clause1: nodes [
	| result |
	result := Array new: 4.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: ((nodes at: 2) at: 1).
	result at: 3 put: ((nodes at: 2) at: 2).
	result at: 4 put: ((nodes at: 2) at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForattribute1: nodes [
	| result |
	result := Array new: 12.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self add: (nodes at: 2) to: (result at: 2).
	self addAll: ((nodes at: 3) at: 1) to: (result at: 3).
	self addAll: ((nodes at: 3) at: 2) to: (result at: 4).
	self addAll: ((nodes at: 3) at: 3) to: (result at: 5).
	self addAll: ((nodes at: 3) at: 4) to: (result at: 6).
	self addAll: ((nodes at: 3) at: 5) to: (result at: 7).
	self addAll: ((nodes at: 3) at: 6) to: (result at: 8).
	self addAll: ((nodes at: 3) at: 7) to: (result at: 2).
	self addAll: ((nodes at: 3) at: 8) to: (result at: 9).
	self addAll: ((nodes at: 3) at: 9) to: (result at: 10).
	self addAll: ((nodes at: 3) at: 10) to: (result at: 11).
	self addAll: ((nodes at: 3) at: 11) to: (result at: 12).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForattribute_argument_clause1: nodes [
	| result |
	result := nodes at: 2.
	self addFirst: (nodes at: 1) to: (result at: 1).
	self add: (nodes at: 3) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForattributes1: nodes [
	| result |
	result := Array new: 12.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	self add: ((nodes at: 1) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 1) at: 7) to: (result at: 7).
	self addAll: ((nodes at: 1) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 1) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 1) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 1) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 1) at: 12) to: (result at: 12).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForattributes2: nodes [
	| result |
	result := nodes at: 1.
	self add: ((nodes at: 2) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 2) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 2) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 2) at: 12) to: (result at: 12).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForbalanced_token2: nodes [
	| result |
	result := nodes at: 2.
	self addFirst: (nodes at: 1) to: (result at: 3).
	self add: (nodes at: 3) to: (result at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForbalanced_token3: nodes [
	| result |
	result := nodes at: 2.
	self addFirst: (nodes at: 1) to: (result at: 5).
	self add: (nodes at: 3) to: (result at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForbalanced_token4: nodes [
	| result |
	result := Array new: 11.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForbalanced_token5: nodes [
	| result |
	result := Array new: 11.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	self add: ((nodes at: 1) at: 1) to: (result at: 8).
	self add: ((nodes at: 1) at: 2) to: (result at: 9).
	self add: ((nodes at: 1) at: 3) to: (result at: 11).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForbalanced_token6: nodes [
	| result |
	result := Array new: 11.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 10).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForbalanced_tokens2: nodes [
	| result |
	result := nodes at: 2.
	self addAllFirst: ((nodes at: 1) at: 1) to: (result at: 1).
	self addAllFirst: ((nodes at: 1) at: 2) to: (result at: 2).
	self addAllFirst: ((nodes at: 1) at: 3) to: (result at: 3).
	self addAllFirst: ((nodes at: 1) at: 4) to: (result at: 4).
	self addAllFirst: ((nodes at: 1) at: 5) to: (result at: 5).
	self addAllFirst: ((nodes at: 1) at: 6) to: (result at: 6).
	self addAllFirst: ((nodes at: 1) at: 7) to: (result at: 7).
	self addAllFirst: ((nodes at: 1) at: 8) to: (result at: 8).
	self addAllFirst: ((nodes at: 1) at: 9) to: (result at: 9).
	self addAllFirst: ((nodes at: 1) at: 10) to: (result at: 10).
	self addAllFirst: ((nodes at: 1) at: 11) to: (result at: 11).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForbinary_expression1: nodes [
	| result |
	result := SwiftBinaryOperatorNode new.
	result addToken: (nodes at: 1) to: result operatorTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForbinary_expression2: nodes [
	| result |
	result := SwiftAssignmentOperatorNode new.
	result addToken: (nodes at: 1) to: result equalTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForbinary_expression3: nodes [
	| result |
	result := SwiftCondionalOperatorNode new.
	result addToken: ((nodes at: 1) at: 1) to: result questionMarkTokens.
	result trueExpression: ((nodes at: 1) at: 2).
	result addToken: ((nodes at: 1) at: 3) to: result colonTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForbinary_expression4: nodes [
	| result |
	result := SwiftTypeCastOperatorNode new.
	result isToken: ((nodes at: 1) at: 1).
	result type: ((nodes at: 1) at: 2).
	result asToken: ((nodes at: 1) at: 3).
	result questionMarkToken: ((nodes at: 1) at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForbreak_statement1: nodes [
	| result |
	result := SwiftBreakStatementNode new.
	result breakToken: (nodes at: 1).
	result name: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForcapture_list1: nodes [
	| result |
	result := Array new: 7.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: ((nodes at: 2) at: 1).
	result at: 3 put: ((nodes at: 2) at: 2).
	result at: 4 put: ((nodes at: 2) at: 3).
	result at: 5 put: ((nodes at: 2) at: 4).
	result at: 6 put: (nodes at: 3).
	result at: 7 put: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForcapture_specifier1: nodes [
	| result |
	result := Array new: 4.
	result at: 1 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForcapture_specifier2: nodes [
	| result |
	result := Array new: 4.
	result at: 2 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForcapture_specifier3: nodes [
	| result |
	result := Array new: 4.
	result at: 3 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForcapture_specifier4: nodes [
	| result |
	result := Array new: 4.
	result at: 4 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForcase_item_list1: nodes [
	| result |
	result := Array new: 30.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	result at: 30 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 1) at: 7) to: (result at: 7).
	self addAll: ((nodes at: 1) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 1) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 1) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 1) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 1) at: 12) to: (result at: 12).
	self addAll: ((nodes at: 1) at: 13) to: (result at: 13).
	self addAll: ((nodes at: 1) at: 14) to: (result at: 14).
	self addAll: ((nodes at: 1) at: 15) to: (result at: 15).
	self addAll: ((nodes at: 1) at: 16) to: (result at: 16).
	self addAll: ((nodes at: 1) at: 17) to: (result at: 17).
	self addAll: ((nodes at: 1) at: 18) to: (result at: 18).
	self addAll: ((nodes at: 1) at: 19) to: (result at: 19).
	self addAll: ((nodes at: 1) at: 20) to: (result at: 20).
	self addAll: ((nodes at: 1) at: 21) to: (result at: 21).
	self addAll: ((nodes at: 1) at: 22) to: (result at: 22).
	self addAll: ((nodes at: 1) at: 23) to: (result at: 23).
	self addAll: ((nodes at: 1) at: 24) to: (result at: 24).
	self addAll: ((nodes at: 1) at: 25) to: (result at: 25).
	self addAll: ((nodes at: 1) at: 26) to: (result at: 26).
	self addAll: ((nodes at: 1) at: 27) to: (result at: 27).
	self addAll: ((nodes at: 1) at: 28) to: (result at: 28).
	self addAll: ((nodes at: 1) at: 29) to: (result at: 29).
	self add: ((nodes at: 2) at: 1) to: (result at: 30).
	self add: ((nodes at: 2) at: 2) to: (result at: 27).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForcase_item_list2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 19).
	self addAll: ((nodes at: 3) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 3) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 3) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 3) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 3) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 3) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 3) at: 7) to: (result at: 7).
	self addAll: ((nodes at: 3) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 3) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 3) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 3) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 3) at: 12) to: (result at: 12).
	self addAll: ((nodes at: 3) at: 13) to: (result at: 13).
	self addAll: ((nodes at: 3) at: 14) to: (result at: 14).
	self addAll: ((nodes at: 3) at: 15) to: (result at: 15).
	self addAll: ((nodes at: 3) at: 16) to: (result at: 16).
	self addAll: ((nodes at: 3) at: 17) to: (result at: 17).
	self addAll: ((nodes at: 3) at: 18) to: (result at: 18).
	self addAll: ((nodes at: 3) at: 19) to: (result at: 19).
	self addAll: ((nodes at: 3) at: 20) to: (result at: 20).
	self addAll: ((nodes at: 3) at: 21) to: (result at: 21).
	self addAll: ((nodes at: 3) at: 22) to: (result at: 22).
	self addAll: ((nodes at: 3) at: 23) to: (result at: 23).
	self addAll: ((nodes at: 3) at: 24) to: (result at: 24).
	self addAll: ((nodes at: 3) at: 25) to: (result at: 25).
	self addAll: ((nodes at: 3) at: 26) to: (result at: 26).
	self addAll: ((nodes at: 3) at: 27) to: (result at: 27).
	self addAll: ((nodes at: 3) at: 28) to: (result at: 28).
	self addAll: ((nodes at: 3) at: 29) to: (result at: 29).
	self add: ((nodes at: 4) at: 1) to: (result at: 30).
	self add: ((nodes at: 4) at: 2) to: (result at: 27).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForcase_label1: nodes [
	| result |
	result := Array new: 31.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	result at: 30 put: (OrderedCollection new: 2).
	result at: 31 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 8) to: (result at: 9).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 10).
	self addAll: ((nodes at: 2) at: 10) to: (result at: 11).
	self addAll: ((nodes at: 2) at: 11) to: (result at: 12).
	self addAll: ((nodes at: 2) at: 12) to: (result at: 13).
	self addAll: ((nodes at: 2) at: 13) to: (result at: 14).
	self addAll: ((nodes at: 2) at: 14) to: (result at: 15).
	self addAll: ((nodes at: 2) at: 15) to: (result at: 16).
	self addAll: ((nodes at: 2) at: 16) to: (result at: 17).
	self addAll: ((nodes at: 2) at: 17) to: (result at: 18).
	self addAll: ((nodes at: 2) at: 18) to: (result at: 19).
	self addAll: ((nodes at: 2) at: 19) to: (result at: 20).
	self addAll: ((nodes at: 2) at: 20) to: (result at: 21).
	self addAll: ((nodes at: 2) at: 21) to: (result at: 22).
	self addAll: ((nodes at: 2) at: 22) to: (result at: 23).
	self addAll: ((nodes at: 2) at: 23) to: (result at: 24).
	self addAll: ((nodes at: 2) at: 24) to: (result at: 25).
	self addAll: ((nodes at: 2) at: 25) to: (result at: 26).
	self addAll: ((nodes at: 2) at: 26) to: (result at: 27).
	self addAll: ((nodes at: 2) at: 27) to: (result at: 28).
	self addAll: ((nodes at: 2) at: 28) to: (result at: 29).
	self addAll: ((nodes at: 2) at: 29) to: (result at: 30).
	self addAll: ((nodes at: 2) at: 30) to: (result at: 31).
	self add: (nodes at: 3) to: (result at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForclass_declaration1: nodes [
	| result |
	result := SwiftClassDeclarationNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 5) to: result leftBracketTokens.
	result addTokens: ((nodes at: 1) at: 6) to: result rightBracketTokens.
	result addTokens: ((nodes at: 1) at: 7) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 1) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 1) at: 11) to: result operatorTokens.
	result
		addTokens: ((nodes at: 1) at: 12)
		to: result full_string_literalTokens.
	result classToken: (nodes at: 2).
	result addToken: (nodes at: 3) to: result identifierTokens.
	result addTokens: ((nodes at: 4) at: 1) to: result lessThanTokens.
	result addTokens: ((nodes at: 4) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 4) at: 3) to: result colonTokens.
	result addTokens: ((nodes at: 4) at: 4) to: result commaTokens.
	result addTokens: ((nodes at: 4) at: 5) to: result greaterThanTokens.
	result addTokens: ((nodes at: 4) at: 6) to: result periodTokens.
	result addTokens: ((nodes at: 4) at: 7) to: result protocolTokens.
	result whereToken: ((nodes at: 4) at: 8).
	result addTokens: ((nodes at: 4) at: 9) to: result equalEqualTokens.
	result addToken: ((nodes at: 5) at: 1) to: result colonTokens.
	result addTokens: ((nodes at: 5) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 5) at: 3) to: result lessThanTokens.
	result addTokens: ((nodes at: 5) at: 4) to: result commaTokens.
	result addTokens: ((nodes at: 5) at: 5) to: result greaterThanTokens.
	result addTokens: ((nodes at: 5) at: 6) to: result periodTokens.
	result addToken: ((nodes at: 6) at: 1) to: result leftBraceTokens.
	result addNodes: ((nodes at: 6) at: 2) to: result declarations.
	result addToken: ((nodes at: 6) at: 3) to: result rightBraceTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForclosure_expression1: nodes [
	| result |
	result := SwiftClosureExpressionNode new.
	result addToken: (nodes at: 1) to: result leftBraceTokens.
	result addTokens: ((nodes at: 2) at: 1) to: result leftParenTokens.
	result addTokens: ((nodes at: 2) at: 2) to: result rightParenTokens.
	result addTokens: ((nodes at: 2) at: 3) to: result inoutTokens.
	result addTokens: ((nodes at: 2) at: 4) to: result letTokens.
	result addTokens: ((nodes at: 2) at: 5) to: result _Tokens.
	result addTokens: ((nodes at: 2) at: 6) to: result identifierTokens.
	result addTokens: ((nodes at: 2) at: 7) to: result colonTokens.
	result addTokens: ((nodes at: 2) at: 8) to: result leftBracketTokens.
	result addTokens: ((nodes at: 2) at: 9) to: result rightBracketTokens.
	result addTokens: ((nodes at: 2) at: 10) to: result leftBraceTokens.
	result addTokens: ((nodes at: 2) at: 11) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 2) at: 12)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 2) at: 13)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 2) at: 14) to: result operatorTokens.
	result addTokens: ((nodes at: 2) at: 15) to: result periodTokens.
	result addTokens: ((nodes at: 2) at: 16) to: result protocolTokens.
	result addTokens: ((nodes at: 2) at: 17) to: result lessThanTokens.
	result addTokens: ((nodes at: 2) at: 18) to: result greaterThanTokens.
	result
		addTokens: ((nodes at: 2) at: 19)
		to: result minusGreaterThanTokens.
	result addTokens: ((nodes at: 2) at: 20) to: result commaTokens.
	result
		addTokens: ((nodes at: 2) at: 21)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 2) at: 22) to: result bangTokens.
	result addTokens: ((nodes at: 2) at: 23) to: result typeTokens.
	result
		addTokens: ((nodes at: 2) at: 24)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 2) at: 25) to: result equalTokens.
	result addObjects: ((nodes at: 2) at: 26) to: result expressions.
	result addTokens: ((nodes at: 2) at: 27) to: result varTokens.
	result
		addTokens: ((nodes at: 2) at: 28)
		to: result full_string_literalTokens.
	result inToken: ((nodes at: 2) at: 29).
	result weakToken: ((nodes at: 2) at: 30).
	result unownedToken: ((nodes at: 2) at: 31).
	result unownedLeftParensafeRightParenToken: ((nodes at: 2) at: 32).
	result unownedLeftParenunsafeRightParenToken: ((nodes at: 2) at: 33).
	result addNodes: (nodes at: 3) to: result statements.
	result addToken: (nodes at: 4) to: result rightBraceTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForclosure_signature1: nodes [
	| result |
	result := Array new: 33.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 1) at: 7) to: (result at: 7).
	self addAll: ((nodes at: 1) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 1) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 1) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 1) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 1) at: 12) to: (result at: 12).
	self addAll: ((nodes at: 1) at: 13) to: (result at: 13).
	self addAll: ((nodes at: 1) at: 14) to: (result at: 14).
	self addAll: ((nodes at: 1) at: 15) to: (result at: 15).
	self addAll: ((nodes at: 1) at: 16) to: (result at: 16).
	self addAll: ((nodes at: 1) at: 17) to: (result at: 17).
	self addAll: ((nodes at: 1) at: 18) to: (result at: 18).
	self addAll: ((nodes at: 1) at: 19) to: (result at: 19).
	self addAll: ((nodes at: 1) at: 20) to: (result at: 20).
	self addAll: ((nodes at: 1) at: 21) to: (result at: 21).
	self addAll: ((nodes at: 1) at: 22) to: (result at: 22).
	self addAll: ((nodes at: 1) at: 23) to: (result at: 23).
	self addAll: ((nodes at: 1) at: 24) to: (result at: 24).
	self addAll: ((nodes at: 1) at: 25) to: (result at: 25).
	self addAll: ((nodes at: 1) at: 26) to: (result at: 26).
	self addAll: ((nodes at: 1) at: 27) to: (result at: 27).
	self addAll: ((nodes at: 1) at: 28) to: (result at: 28).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 19).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 9).
	self addAll: ((nodes at: 2) at: 8) to: (result at: 10).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 11).
	self addAll: ((nodes at: 2) at: 10) to: (result at: 12).
	self addAll: ((nodes at: 2) at: 11) to: (result at: 13).
	self addAll: ((nodes at: 2) at: 12) to: (result at: 14).
	self addAll: ((nodes at: 2) at: 13) to: (result at: 28).
	self addAll: ((nodes at: 2) at: 14) to: (result at: 15).
	self addAll: ((nodes at: 2) at: 15) to: (result at: 16).
	self addAll: ((nodes at: 2) at: 16) to: (result at: 17).
	self addAll: ((nodes at: 2) at: 17) to: (result at: 18).
	self addAll: ((nodes at: 2) at: 18) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 19) to: (result at: 20).
	self addAll: ((nodes at: 2) at: 20) to: (result at: 21).
	self addAll: ((nodes at: 2) at: 21) to: (result at: 22).
	self addAll: ((nodes at: 2) at: 22) to: (result at: 23).
	self addAll: ((nodes at: 2) at: 23) to: (result at: 24).
	self addAll: ((nodes at: 2) at: 24) to: (result at: 3).
	result at: 29 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForclosure_signature2: nodes [
	| result |
	result := Array new: 33.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 6).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 20).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 19).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 9).
	self addAll: ((nodes at: 2) at: 8) to: (result at: 10).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 11).
	self addAll: ((nodes at: 2) at: 10) to: (result at: 12).
	self addAll: ((nodes at: 2) at: 11) to: (result at: 13).
	self addAll: ((nodes at: 2) at: 12) to: (result at: 14).
	self addAll: ((nodes at: 2) at: 13) to: (result at: 28).
	self addAll: ((nodes at: 2) at: 14) to: (result at: 15).
	self addAll: ((nodes at: 2) at: 15) to: (result at: 16).
	self addAll: ((nodes at: 2) at: 16) to: (result at: 17).
	self addAll: ((nodes at: 2) at: 17) to: (result at: 18).
	self addAll: ((nodes at: 2) at: 18) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 19) to: (result at: 20).
	self addAll: ((nodes at: 2) at: 20) to: (result at: 21).
	self addAll: ((nodes at: 2) at: 21) to: (result at: 22).
	self addAll: ((nodes at: 2) at: 22) to: (result at: 23).
	self addAll: ((nodes at: 2) at: 23) to: (result at: 24).
	self addAll: ((nodes at: 2) at: 24) to: (result at: 3).
	result at: 29 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForclosure_signature3: nodes [
	| result |
	result := Array new: 33.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	self add: ((nodes at: 1) at: 1) to: (result at: 8).
	result at: 30 put: ((nodes at: 1) at: 2).
	result at: 31 put: ((nodes at: 1) at: 3).
	result at: 32 put: ((nodes at: 1) at: 4).
	result at: 33 put: ((nodes at: 1) at: 5).
	self add: ((nodes at: 1) at: 6) to: (result at: 26).
	self add: ((nodes at: 1) at: 7) to: (result at: 9).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 2) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 2) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 2) at: 12) to: (result at: 12).
	self addAll: ((nodes at: 2) at: 13) to: (result at: 13).
	self addAll: ((nodes at: 2) at: 14) to: (result at: 14).
	self addAll: ((nodes at: 2) at: 15) to: (result at: 15).
	self addAll: ((nodes at: 2) at: 16) to: (result at: 16).
	self addAll: ((nodes at: 2) at: 17) to: (result at: 17).
	self addAll: ((nodes at: 2) at: 18) to: (result at: 18).
	self addAll: ((nodes at: 2) at: 19) to: (result at: 19).
	self addAll: ((nodes at: 2) at: 20) to: (result at: 20).
	self addAll: ((nodes at: 2) at: 21) to: (result at: 21).
	self addAll: ((nodes at: 2) at: 22) to: (result at: 22).
	self addAll: ((nodes at: 2) at: 23) to: (result at: 23).
	self addAll: ((nodes at: 2) at: 24) to: (result at: 24).
	self addAll: ((nodes at: 2) at: 25) to: (result at: 25).
	self addAll: ((nodes at: 2) at: 26) to: (result at: 26).
	self addAll: ((nodes at: 2) at: 27) to: (result at: 27).
	self addAll: ((nodes at: 2) at: 28) to: (result at: 28).
	self addAll: ((nodes at: 3) at: 1) to: (result at: 19).
	self addAll: ((nodes at: 3) at: 2) to: (result at: 5).
	self addAll: ((nodes at: 3) at: 3) to: (result at: 6).
	self addAll: ((nodes at: 3) at: 4) to: (result at: 1).
	self addAll: ((nodes at: 3) at: 5) to: (result at: 2).
	self addAll: ((nodes at: 3) at: 6) to: (result at: 8).
	self addAll: ((nodes at: 3) at: 7) to: (result at: 9).
	self addAll: ((nodes at: 3) at: 8) to: (result at: 10).
	self addAll: ((nodes at: 3) at: 9) to: (result at: 11).
	self addAll: ((nodes at: 3) at: 10) to: (result at: 12).
	self addAll: ((nodes at: 3) at: 11) to: (result at: 13).
	self addAll: ((nodes at: 3) at: 12) to: (result at: 14).
	self addAll: ((nodes at: 3) at: 13) to: (result at: 28).
	self addAll: ((nodes at: 3) at: 14) to: (result at: 15).
	self addAll: ((nodes at: 3) at: 15) to: (result at: 16).
	self addAll: ((nodes at: 3) at: 16) to: (result at: 17).
	self addAll: ((nodes at: 3) at: 17) to: (result at: 18).
	self addAll: ((nodes at: 3) at: 18) to: (result at: 7).
	self addAll: ((nodes at: 3) at: 19) to: (result at: 20).
	self addAll: ((nodes at: 3) at: 20) to: (result at: 21).
	self addAll: ((nodes at: 3) at: 21) to: (result at: 22).
	self addAll: ((nodes at: 3) at: 22) to: (result at: 23).
	self addAll: ((nodes at: 3) at: 23) to: (result at: 24).
	self addAll: ((nodes at: 3) at: 24) to: (result at: 3).
	result at: 29 put: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForclosure_signature4: nodes [
	| result |
	result := Array new: 33.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	self add: ((nodes at: 1) at: 1) to: (result at: 8).
	result at: 30 put: ((nodes at: 1) at: 2).
	result at: 31 put: ((nodes at: 1) at: 3).
	result at: 32 put: ((nodes at: 1) at: 4).
	result at: 33 put: ((nodes at: 1) at: 5).
	self add: ((nodes at: 1) at: 6) to: (result at: 26).
	self add: ((nodes at: 1) at: 7) to: (result at: 9).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 20).
	self addAll: ((nodes at: 3) at: 1) to: (result at: 19).
	self addAll: ((nodes at: 3) at: 2) to: (result at: 5).
	self addAll: ((nodes at: 3) at: 3) to: (result at: 6).
	self addAll: ((nodes at: 3) at: 4) to: (result at: 1).
	self addAll: ((nodes at: 3) at: 5) to: (result at: 2).
	self addAll: ((nodes at: 3) at: 6) to: (result at: 8).
	self addAll: ((nodes at: 3) at: 7) to: (result at: 9).
	self addAll: ((nodes at: 3) at: 8) to: (result at: 10).
	self addAll: ((nodes at: 3) at: 9) to: (result at: 11).
	self addAll: ((nodes at: 3) at: 10) to: (result at: 12).
	self addAll: ((nodes at: 3) at: 11) to: (result at: 13).
	self addAll: ((nodes at: 3) at: 12) to: (result at: 14).
	self addAll: ((nodes at: 3) at: 13) to: (result at: 28).
	self addAll: ((nodes at: 3) at: 14) to: (result at: 15).
	self addAll: ((nodes at: 3) at: 15) to: (result at: 16).
	self addAll: ((nodes at: 3) at: 16) to: (result at: 17).
	self addAll: ((nodes at: 3) at: 17) to: (result at: 18).
	self addAll: ((nodes at: 3) at: 18) to: (result at: 7).
	self addAll: ((nodes at: 3) at: 19) to: (result at: 20).
	self addAll: ((nodes at: 3) at: 20) to: (result at: 21).
	self addAll: ((nodes at: 3) at: 21) to: (result at: 22).
	self addAll: ((nodes at: 3) at: 22) to: (result at: 23).
	self addAll: ((nodes at: 3) at: 23) to: (result at: 24).
	self addAll: ((nodes at: 3) at: 24) to: (result at: 3).
	result at: 29 put: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForclosure_signature5: nodes [
	| result |
	result := Array new: 33.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	self add: ((nodes at: 1) at: 1) to: (result at: 8).
	result at: 30 put: ((nodes at: 1) at: 2).
	result at: 31 put: ((nodes at: 1) at: 3).
	result at: 32 put: ((nodes at: 1) at: 4).
	result at: 33 put: ((nodes at: 1) at: 5).
	self add: ((nodes at: 1) at: 6) to: (result at: 26).
	self add: ((nodes at: 1) at: 7) to: (result at: 9).
	result at: 29 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForcode_block1: nodes [
	| result |
	result := SwiftBlockNode new.
	result leftBraceToken: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result statements.
	result rightBraceToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForconformance_requirement1: nodes [
	| result |
	result := Array new: 7.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForconstant_declaration1: nodes [
	| result |
	result := SwiftConstantDeclarationNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 5) to: result leftBracketTokens.
	result addTokens: ((nodes at: 1) at: 6) to: result rightBracketTokens.
	result addTokens: ((nodes at: 1) at: 7) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 1) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 1) at: 11) to: result operatorTokens.
	result
		addTokens: ((nodes at: 1) at: 12)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 2) at: 1) to: result classTokens.
	result addTokens: ((nodes at: 2) at: 2) to: result mutatingTokens.
	result addTokens: ((nodes at: 2) at: 3) to: result nonmutatingTokens.
	result addTokens: ((nodes at: 2) at: 4) to: result overrideTokens.
	result addTokens: ((nodes at: 2) at: 5) to: result staticTokens.
	result addTokens: ((nodes at: 2) at: 6) to: result unownedTokens.
	result
		addTokens: ((nodes at: 2) at: 7)
		to: result unownedLeftParensafeRightParenTokens.
	result
		addTokens: ((nodes at: 2) at: 8)
		to: result unownedLeftParenunsafeRightParenTokens.
	result addTokens: ((nodes at: 2) at: 9) to: result weakTokens.
	result letToken: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result inializers.
	result addTokens: ((nodes at: 4) at: 2) to: result commaTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForcontinue_statement1: nodes [
	| result |
	result := SwiftContinueStatementNode new.
	result continueToken: (nodes at: 1).
	result name: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFordeclaration_specifier1: nodes [
	| result |
	result := Array new: 9.
	result at: 1 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFordeclaration_specifier2: nodes [
	| result |
	result := Array new: 9.
	result at: 2 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFordeclaration_specifier3: nodes [
	| result |
	result := Array new: 9.
	result at: 3 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFordeclaration_specifier4: nodes [
	| result |
	result := Array new: 9.
	result at: 4 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFordeclaration_specifier5: nodes [
	| result |
	result := Array new: 9.
	result at: 5 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFordeclaration_specifier6: nodes [
	| result |
	result := Array new: 9.
	result at: 6 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFordeclaration_specifier7: nodes [
	| result |
	result := Array new: 9.
	result at: 7 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFordeclaration_specifier8: nodes [
	| result |
	result := Array new: 9.
	result at: 8 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFordeclaration_specifier9: nodes [
	| result |
	result := Array new: 9.
	result at: 9 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFordeclaration_specifiers1: nodes [
	| result |
	result := Array new: 9.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFordeclaration_specifiers2: nodes [
	| result |
	result := nodes at: 1.
	self add: ((nodes at: 2) at: 1) to: (result at: 1).
	self add: ((nodes at: 2) at: 2) to: (result at: 2).
	self add: ((nodes at: 2) at: 3) to: (result at: 3).
	self add: ((nodes at: 2) at: 4) to: (result at: 4).
	self add: ((nodes at: 2) at: 5) to: (result at: 5).
	self add: ((nodes at: 2) at: 6) to: (result at: 6).
	self add: ((nodes at: 2) at: 7) to: (result at: 7).
	self add: ((nodes at: 2) at: 8) to: (result at: 8).
	self add: ((nodes at: 2) at: 9) to: (result at: 9).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFordeinitializer_declaration1: nodes [
	| result |
	result := SwiftDeinitializerDeclarationNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 5) to: result leftBracketTokens.
	result addTokens: ((nodes at: 1) at: 6) to: result rightBracketTokens.
	result addTokens: ((nodes at: 1) at: 7) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 1) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 1) at: 11) to: result operatorTokens.
	result
		addTokens: ((nodes at: 1) at: 12)
		to: result full_string_literalTokens.
	result deinitToken: (nodes at: 2).
	result block: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFordictionary_literal1: nodes [
	| result |
	result := Array new: 6.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 5).
	result at: 6 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFordictionary_literal2: nodes [
	| result |
	result := Array new: 6.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self add: (nodes at: 2) to: (result at: 3).
	result at: 6 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFordictionary_literal_item1: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFordictionary_literal_items1: nodes [
	| result |
	result := Array new: 4.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	self add: ((nodes at: 1) at: 1) to: (result at: 1).
	self add: ((nodes at: 1) at: 2) to: (result at: 2).
	self add: ((nodes at: 1) at: 3) to: (result at: 3).
	self add: (nodes at: 2) to: (result at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFordictionary_literal_items2: nodes [
	| result |
	result := nodes at: 3.
	self addFirst: ((nodes at: 1) at: 1) to: (result at: 1).
	self addFirst: ((nodes at: 1) at: 2) to: (result at: 2).
	self addFirst: ((nodes at: 1) at: 3) to: (result at: 3).
	self addFirst: (nodes at: 2) to: (result at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFordictionary_type1: nodes [
	| result |
	result := SwiftDictionaryTypeNode new.
	result addToken: (nodes at: 1) to: result leftBracketTokens.
	result addToken: (nodes at: 3) to: result colonTokens.
	result addToken: (nodes at: 5) to: result rightBracketTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFordo_while_statement1: nodes [
	| result |
	result := SwiftDoWhileStatementNode new.
	result doToken: (nodes at: 1).
	result block: (nodes at: 2).
	result whileToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFordynamic_type_expression1: nodes [
	| result |
	result := SwiftDynamicTypeExpressionNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 2) to: result lessThanTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result commaTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result greaterThanTokens.
	result
		addTokens: ((nodes at: 1) at: 5)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 6)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 7)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result leftBracketTokens.
	result addObjects: ((nodes at: 1) at: 9) to: result expressions.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result rightBracketTokens.
	result addObjects: ((nodes at: 1) at: 11) to: result keyExpressions.
	result addTokens: ((nodes at: 1) at: 12) to: result colonTokens.
	result addObjects: ((nodes at: 1) at: 13) to: result valueExpressions.
	result __FILE__Token: ((nodes at: 1) at: 14).
	result __LINE__Token: ((nodes at: 1) at: 15).
	result __COLUMN__Token: ((nodes at: 1) at: 16).
	result __FUNCTION__Token: ((nodes at: 1) at: 17).
	result addTokens: ((nodes at: 1) at: 18) to: result selfTokens.
	result addTokens: ((nodes at: 1) at: 19) to: result periodTokens.
	result addTokens: ((nodes at: 1) at: 20) to: result initTokens.
	result addTokens: ((nodes at: 1) at: 21) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 22) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 23) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 24) to: result inoutTokens.
	result addTokens: ((nodes at: 1) at: 25) to: result letTokens.
	result addTokens: ((nodes at: 1) at: 26) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 27) to: result rightBraceTokens.
	result addTokens: ((nodes at: 1) at: 28) to: result operatorTokens.
	result addTokens: ((nodes at: 1) at: 29) to: result protocolTokens.
	result
		addTokens: ((nodes at: 1) at: 30)
		to: result minusGreaterThanTokens.
	result
		addTokens: ((nodes at: 1) at: 31)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 1) at: 32) to: result bangTokens.
	result addTokens: ((nodes at: 1) at: 33) to: result typeTokens.
	result
		addTokens: ((nodes at: 1) at: 34)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 1) at: 35) to: result equalTokens.
	result addTokens: ((nodes at: 1) at: 36) to: result varTokens.
	result inToken: ((nodes at: 1) at: 37).
	result weakToken: ((nodes at: 1) at: 38).
	result unownedToken: ((nodes at: 1) at: 39).
	result unownedLeftParensafeRightParenToken: ((nodes at: 1) at: 40).
	result unownedLeftParenunsafeRightParenToken: ((nodes at: 1) at: 41).
	result addNodes: ((nodes at: 1) at: 42) to: result statements.
	result addTokens: ((nodes at: 1) at: 43) to: result dynamicTypeTokens.
	result addToken: (nodes at: 2) to: result periodTokens.
	result addToken: (nodes at: 3) to: result dynamicTypeTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForenum_case_pattern1: nodes [
	| result |
	result := Array new: 29.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	self add: (nodes at: 2) to: (result at: 5).
	self add: (nodes at: 3) to: (result at: 1).
	self addAll: ((nodes at: 4) at: 1) to: (result at: 6).
	self addAll: ((nodes at: 4) at: 2) to: (result at: 7).
	self addAll: ((nodes at: 4) at: 3) to: (result at: 8).
	self addAll: ((nodes at: 4) at: 4) to: (result at: 1).
	self addAll: ((nodes at: 4) at: 5) to: (result at: 9).
	self addAll: ((nodes at: 4) at: 6) to: (result at: 10).
	self addAll: ((nodes at: 4) at: 7) to: (result at: 11).
	self addAll: ((nodes at: 4) at: 8) to: (result at: 12).
	self addAll: ((nodes at: 4) at: 9) to: (result at: 13).
	self addAll: ((nodes at: 4) at: 10) to: (result at: 14).
	self addAll: ((nodes at: 4) at: 11) to: (result at: 15).
	self addAll: ((nodes at: 4) at: 12) to: (result at: 16).
	self addAll: ((nodes at: 4) at: 13) to: (result at: 17).
	self addAll: ((nodes at: 4) at: 14) to: (result at: 5).
	self addAll: ((nodes at: 4) at: 15) to: (result at: 18).
	self addAll: ((nodes at: 4) at: 16) to: (result at: 2).
	self addAll: ((nodes at: 4) at: 17) to: (result at: 4).
	self addAll: ((nodes at: 4) at: 18) to: (result at: 19).
	self addAll: ((nodes at: 4) at: 19) to: (result at: 3).
	self addAll: ((nodes at: 4) at: 20) to: (result at: 20).
	self addAll: ((nodes at: 4) at: 21) to: (result at: 21).
	self addAll: ((nodes at: 4) at: 22) to: (result at: 22).
	self addAll: ((nodes at: 4) at: 23) to: (result at: 23).
	self addAll: ((nodes at: 4) at: 24) to: (result at: 24).
	self addAll: ((nodes at: 4) at: 25) to: (result at: 25).
	self addAll: ((nodes at: 4) at: 26) to: (result at: 26).
	self addAll: ((nodes at: 4) at: 27) to: (result at: 27).
	self addAll: ((nodes at: 4) at: 28) to: (result at: 28).
	self addAll: ((nodes at: 4) at: 29) to: (result at: 29).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForenum_declaration1: nodes [
	| result |
	result := SwiftEnumDeclarationNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 5) to: result leftBracketTokens.
	result addTokens: ((nodes at: 1) at: 6) to: result rightBracketTokens.
	result addTokens: ((nodes at: 1) at: 7) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 1) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 1) at: 11) to: result operatorTokens.
	result
		addTokens: ((nodes at: 1) at: 12)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 2) at: 1) to: result identifierTokens.
	result addTokens: ((nodes at: 2) at: 2) to: result lessThanTokens.
	result addTokens: ((nodes at: 2) at: 3) to: result colonTokens.
	result addTokens: ((nodes at: 2) at: 4) to: result commaTokens.
	result addTokens: ((nodes at: 2) at: 5) to: result greaterThanTokens.
	result addTokens: ((nodes at: 2) at: 6) to: result periodTokens.
	result addTokens: ((nodes at: 2) at: 7) to: result protocolTokens.
	result addTokens: ((nodes at: 2) at: 8) to: result whereTokens.
	result addTokens: ((nodes at: 2) at: 9) to: result equalEqualTokens.
	result addTokens: ((nodes at: 2) at: 10) to: result leftBraceTokens.
	result addTokens: ((nodes at: 2) at: 11) to: result _Tokens.
	result addTokens: ((nodes at: 2) at: 12) to: result leftParenTokens.
	result addTokens: ((nodes at: 2) at: 13) to: result rightParenTokens.
	result addTokens: ((nodes at: 2) at: 14) to: result leftBracketTokens.
	result
		addTokens: ((nodes at: 2) at: 15)
		to: result rightBracketTokens.
	result addTokens: ((nodes at: 2) at: 16) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 2) at: 17)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 2) at: 18)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 2) at: 19) to: result operatorTokens.
	result addTokens: ((nodes at: 2) at: 20) to: result importTokens.
	result addTokens: ((nodes at: 2) at: 21) to: result typealiasTokens.
	result addTokens: ((nodes at: 2) at: 22) to: result structTokens.
	result addTokens: ((nodes at: 2) at: 23) to: result classTokens.
	result addTokens: ((nodes at: 2) at: 24) to: result enumTokens.
	result addTokens: ((nodes at: 2) at: 25) to: result varTokens.
	result addTokens: ((nodes at: 2) at: 26) to: result funcTokens.
	result addTokens: ((nodes at: 2) at: 27) to: result mutatingTokens.
	result addTokens: ((nodes at: 2) at: 28) to: result nonmutatingTokens.
	result addTokens: ((nodes at: 2) at: 29) to: result overrideTokens.
	result addTokens: ((nodes at: 2) at: 30) to: result staticTokens.
	result addTokens: ((nodes at: 2) at: 31) to: result unownedTokens.
	result
		addTokens: ((nodes at: 2) at: 32)
		to: result unownedLeftParensafeRightParenTokens.
	result
		addTokens: ((nodes at: 2) at: 33)
		to: result unownedLeftParenunsafeRightParenTokens.
	result addTokens: ((nodes at: 2) at: 34) to: result weakTokens.
	result addTokens: ((nodes at: 2) at: 35) to: result letTokens.
	result addNodes: ((nodes at: 2) at: 36) to: result inializers.
	result
		addTokens: ((nodes at: 2) at: 37)
		to: result minusGreaterThanTokens.
	result
		addTokens: ((nodes at: 2) at: 38)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 2) at: 39) to: result bangTokens.
	result addTokens: ((nodes at: 2) at: 40) to: result typeTokens.
	result
		addTokens: ((nodes at: 2) at: 41)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 2) at: 42) to: result inoutTokens.
	result addNodes: ((nodes at: 2) at: 43) to: result blocks.
	result addTokens: ((nodes at: 2) at: 44) to: result getTokens.
	result addTokens: ((nodes at: 2) at: 45) to: result setTokens.
	result addTokens: ((nodes at: 2) at: 46) to: result equalTokens.
	result addObjects: ((nodes at: 2) at: 47) to: result expressions.
	result addTokens: ((nodes at: 2) at: 48) to: result willSetTokens.
	result addTokens: ((nodes at: 2) at: 49) to: result didSetTokens.
	result addNodes: ((nodes at: 2) at: 50) to: result declarations.
	result addTokens: ((nodes at: 2) at: 51) to: result convenienceTokens.
	result addTokens: ((nodes at: 2) at: 52) to: result initTokens.
	result addTokens: ((nodes at: 2) at: 53) to: result deinitTokens.
	result addTokens: ((nodes at: 2) at: 54) to: result extensionTokens.
	result addTokens: ((nodes at: 2) at: 55) to: result subscriptTokens.
	result addTokens: ((nodes at: 2) at: 56) to: result caseTokens.
	result
		addTokens: ((nodes at: 2) at: 57)
		to: result full_string_literalTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForenum_declaration2: nodes [
	| result |
	result := SwiftEnumDeclarationNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 5) to: result leftBracketTokens.
	result addTokens: ((nodes at: 1) at: 6) to: result rightBracketTokens.
	result addTokens: ((nodes at: 1) at: 7) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 1) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 1) at: 11) to: result operatorTokens.
	result
		addTokens: ((nodes at: 1) at: 12)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 2) at: 1) to: result identifierTokens.
	result addTokens: ((nodes at: 2) at: 2) to: result lessThanTokens.
	result addTokens: ((nodes at: 2) at: 3) to: result colonTokens.
	result addTokens: ((nodes at: 2) at: 4) to: result commaTokens.
	result addTokens: ((nodes at: 2) at: 5) to: result greaterThanTokens.
	result addTokens: ((nodes at: 2) at: 6) to: result periodTokens.
	result addTokens: ((nodes at: 2) at: 7) to: result protocolTokens.
	result addTokens: ((nodes at: 2) at: 8) to: result whereTokens.
	result addTokens: ((nodes at: 2) at: 9) to: result equalEqualTokens.
	result addTokens: ((nodes at: 2) at: 10) to: result leftBraceTokens.
	result addTokens: ((nodes at: 2) at: 11) to: result _Tokens.
	result addTokens: ((nodes at: 2) at: 12) to: result leftParenTokens.
	result addTokens: ((nodes at: 2) at: 13) to: result rightParenTokens.
	result addTokens: ((nodes at: 2) at: 14) to: result importTokens.
	result addTokens: ((nodes at: 2) at: 15) to: result typealiasTokens.
	result addTokens: ((nodes at: 2) at: 16) to: result structTokens.
	result addTokens: ((nodes at: 2) at: 17) to: result classTokens.
	result addTokens: ((nodes at: 2) at: 18) to: result enumTokens.
	result addTokens: ((nodes at: 2) at: 19) to: result varTokens.
	result addTokens: ((nodes at: 2) at: 20) to: result funcTokens.
	result addTokens: ((nodes at: 2) at: 21) to: result operatorTokens.
	result addTokens: ((nodes at: 2) at: 22) to: result mutatingTokens.
	result addTokens: ((nodes at: 2) at: 23) to: result nonmutatingTokens.
	result addTokens: ((nodes at: 2) at: 24) to: result overrideTokens.
	result addTokens: ((nodes at: 2) at: 25) to: result staticTokens.
	result addTokens: ((nodes at: 2) at: 26) to: result unownedTokens.
	result
		addTokens: ((nodes at: 2) at: 27)
		to: result unownedLeftParensafeRightParenTokens.
	result
		addTokens: ((nodes at: 2) at: 28)
		to: result unownedLeftParenunsafeRightParenTokens.
	result addTokens: ((nodes at: 2) at: 29) to: result weakTokens.
	result addTokens: ((nodes at: 2) at: 30) to: result letTokens.
	result addNodes: ((nodes at: 2) at: 31) to: result inializers.
	result addTokens: ((nodes at: 2) at: 32) to: result leftBracketTokens.
	result
		addTokens: ((nodes at: 2) at: 33)
		to: result rightBracketTokens.
	result
		addTokens: ((nodes at: 2) at: 34)
		to: result minusGreaterThanTokens.
	result
		addTokens: ((nodes at: 2) at: 35)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 2) at: 36) to: result bangTokens.
	result addTokens: ((nodes at: 2) at: 37) to: result typeTokens.
	result
		addTokens: ((nodes at: 2) at: 38)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 2) at: 39) to: result inoutTokens.
	result addNodes: ((nodes at: 2) at: 40) to: result blocks.
	result addTokens: ((nodes at: 2) at: 41) to: result getTokens.
	result addTokens: ((nodes at: 2) at: 42) to: result setTokens.
	result addTokens: ((nodes at: 2) at: 43) to: result rightBraceTokens.
	result addTokens: ((nodes at: 2) at: 44) to: result equalTokens.
	result addObjects: ((nodes at: 2) at: 45) to: result expressions.
	result addTokens: ((nodes at: 2) at: 46) to: result willSetTokens.
	result addTokens: ((nodes at: 2) at: 47) to: result didSetTokens.
	result addNodes: ((nodes at: 2) at: 48) to: result declarations.
	result addTokens: ((nodes at: 2) at: 49) to: result initTokens.
	result addTokens: ((nodes at: 2) at: 50) to: result deinitTokens.
	result addTokens: ((nodes at: 2) at: 51) to: result extensionTokens.
	result addTokens: ((nodes at: 2) at: 52) to: result subscriptTokens.
	result addTokens: ((nodes at: 2) at: 53) to: result caseTokens.
	result addTokens: ((nodes at: 2) at: 54) to: result convenienceTokens.
	result
		addTokens: ((nodes at: 2) at: 55)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 2) at: 56)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 2) at: 57)
		to: result full_string_literalTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForexplicit_member_expression1: nodes [
	| result |
	result := SwiftExplicitMemberExpressionNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 2) to: result lessThanTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result commaTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result greaterThanTokens.
	result
		addTokens: ((nodes at: 1) at: 5)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 6)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 7)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result leftBracketTokens.
	result addObjects: ((nodes at: 1) at: 9) to: result expressions.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result rightBracketTokens.
	result addObjects: ((nodes at: 1) at: 11) to: result keyExpressions.
	result addTokens: ((nodes at: 1) at: 12) to: result colonTokens.
	result addObjects: ((nodes at: 1) at: 13) to: result valueExpressions.
	result __FILE__Token: ((nodes at: 1) at: 14).
	result __LINE__Token: ((nodes at: 1) at: 15).
	result __COLUMN__Token: ((nodes at: 1) at: 16).
	result __FUNCTION__Token: ((nodes at: 1) at: 17).
	result addTokens: ((nodes at: 1) at: 18) to: result selfTokens.
	result addTokens: ((nodes at: 1) at: 19) to: result periodTokens.
	result addTokens: ((nodes at: 1) at: 20) to: result initTokens.
	result addTokens: ((nodes at: 1) at: 21) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 22) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 23) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 24) to: result inoutTokens.
	result addTokens: ((nodes at: 1) at: 25) to: result letTokens.
	result addTokens: ((nodes at: 1) at: 26) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 27) to: result rightBraceTokens.
	result addTokens: ((nodes at: 1) at: 28) to: result operatorTokens.
	result addTokens: ((nodes at: 1) at: 29) to: result protocolTokens.
	result
		addTokens: ((nodes at: 1) at: 30)
		to: result minusGreaterThanTokens.
	result
		addTokens: ((nodes at: 1) at: 31)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 1) at: 32) to: result bangTokens.
	result addTokens: ((nodes at: 1) at: 33) to: result typeTokens.
	result
		addTokens: ((nodes at: 1) at: 34)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 1) at: 35) to: result equalTokens.
	result addTokens: ((nodes at: 1) at: 36) to: result varTokens.
	result inToken: ((nodes at: 1) at: 37).
	result weakToken: ((nodes at: 1) at: 38).
	result unownedToken: ((nodes at: 1) at: 39).
	result unownedLeftParensafeRightParenToken: ((nodes at: 1) at: 40).
	result unownedLeftParenunsafeRightParenToken: ((nodes at: 1) at: 41).
	result addNodes: ((nodes at: 1) at: 42) to: result statements.
	result addTokens: ((nodes at: 1) at: 43) to: result dynamicTypeTokens.
	result addToken: (nodes at: 2) to: result periodTokens.
	result addToken: (nodes at: 3) to: result integer_literalTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForexplicit_member_expression2: nodes [
	| result |
	result := SwiftExplicitMemberExpressionNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 2) to: result lessThanTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result commaTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result greaterThanTokens.
	result
		addTokens: ((nodes at: 1) at: 5)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 6)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 7)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result leftBracketTokens.
	result addObjects: ((nodes at: 1) at: 9) to: result expressions.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result rightBracketTokens.
	result addObjects: ((nodes at: 1) at: 11) to: result keyExpressions.
	result addTokens: ((nodes at: 1) at: 12) to: result colonTokens.
	result addObjects: ((nodes at: 1) at: 13) to: result valueExpressions.
	result __FILE__Token: ((nodes at: 1) at: 14).
	result __LINE__Token: ((nodes at: 1) at: 15).
	result __COLUMN__Token: ((nodes at: 1) at: 16).
	result __FUNCTION__Token: ((nodes at: 1) at: 17).
	result addTokens: ((nodes at: 1) at: 18) to: result selfTokens.
	result addTokens: ((nodes at: 1) at: 19) to: result periodTokens.
	result addTokens: ((nodes at: 1) at: 20) to: result initTokens.
	result addTokens: ((nodes at: 1) at: 21) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 22) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 23) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 24) to: result inoutTokens.
	result addTokens: ((nodes at: 1) at: 25) to: result letTokens.
	result addTokens: ((nodes at: 1) at: 26) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 27) to: result rightBraceTokens.
	result addTokens: ((nodes at: 1) at: 28) to: result operatorTokens.
	result addTokens: ((nodes at: 1) at: 29) to: result protocolTokens.
	result
		addTokens: ((nodes at: 1) at: 30)
		to: result minusGreaterThanTokens.
	result
		addTokens: ((nodes at: 1) at: 31)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 1) at: 32) to: result bangTokens.
	result addTokens: ((nodes at: 1) at: 33) to: result typeTokens.
	result
		addTokens: ((nodes at: 1) at: 34)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 1) at: 35) to: result equalTokens.
	result addTokens: ((nodes at: 1) at: 36) to: result varTokens.
	result inToken: ((nodes at: 1) at: 37).
	result weakToken: ((nodes at: 1) at: 38).
	result unownedToken: ((nodes at: 1) at: 39).
	result unownedLeftParensafeRightParenToken: ((nodes at: 1) at: 40).
	result unownedLeftParenunsafeRightParenToken: ((nodes at: 1) at: 41).
	result addNodes: ((nodes at: 1) at: 42) to: result statements.
	result addTokens: ((nodes at: 1) at: 43) to: result dynamicTypeTokens.
	result addToken: (nodes at: 2) to: result periodTokens.
	result addToken: (nodes at: 3) to: result identifierTokens.
	result addToken: ((nodes at: 4) at: 1) to: result lessThanTokens.
	result addTokens: ((nodes at: 4) at: 2) to: result commaTokens.
	result addToken: ((nodes at: 4) at: 3) to: result greaterThanTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForexpression2: nodes [
	| result |
	result := SwiftBinaryExpressionNode new.
	result addNodes: (nodes at: 2) to: result operators.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForexpression_element2: nodes [
	| result |
	result := SwiftNamedExpressionNode new.
	result identifierToken: (nodes at: 1).
	result colonToken: (nodes at: 2).
	result expression: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForexpression_element_list2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForexpression_list1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForexpression_list2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 2).
	self add: (nodes at: 3) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForextension_body1: nodes [
	| result |
	result := Array new: 3.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: (nodes at: 2) to: (result at: 2).
	result at: 3 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForextension_declaration1: nodes [
	| result |
	result := SwiftExtensionDeclarationNode new.
	result extensionToken: (nodes at: 1).
	result colonToken: ((nodes at: 3) at: 1).
	result addTokens: ((nodes at: 3) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 3) at: 3) to: result lessThanTokens.
	result addTokens: ((nodes at: 3) at: 4) to: result commaTokens.
	result addTokens: ((nodes at: 3) at: 5) to: result greaterThanTokens.
	result addTokens: ((nodes at: 3) at: 6) to: result periodTokens.
	result leftBraceToken: ((nodes at: 4) at: 1).
	result addNodes: ((nodes at: 4) at: 2) to: result declarations.
	result rightBraceToken: ((nodes at: 4) at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForfallthrough_statement1: nodes [
	| result |
	result := SwiftFallThroughStatementNode new.
	result fallthroughToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForfile1: nodes [
	| result |
	result := SwiftFileNode new.
	result addNodes: (nodes at: 1) to: result statements.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForfor_in_statement1: nodes [
	| result |
	result := SwiftForInStatementNode new.
	result forToken: (nodes at: 1).
	result addTokens: ((nodes at: 2) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 2) at: 2) to: result colonTokens.
	result addTokens: ((nodes at: 2) at: 3) to: result identifierTokens.
	result addTokens: ((nodes at: 2) at: 4) to: result leftParenTokens.
	result addTokens: ((nodes at: 2) at: 5) to: result rightParenTokens.
	result addTokens: ((nodes at: 2) at: 6) to: result leftBracketTokens.
	result addTokens: ((nodes at: 2) at: 7) to: result rightBracketTokens.
	result addTokens: ((nodes at: 2) at: 8) to: result leftBraceTokens.
	result addTokens: ((nodes at: 2) at: 9) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 2) at: 10)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 2) at: 11)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 2) at: 12) to: result operatorTokens.
	result
		addTokens: ((nodes at: 2) at: 13)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 2) at: 14) to: result periodTokens.
	result addTokens: ((nodes at: 2) at: 15) to: result protocolTokens.
	result addTokens: ((nodes at: 2) at: 16) to: result lessThanTokens.
	result addTokens: ((nodes at: 2) at: 17) to: result greaterThanTokens.
	result
		addTokens: ((nodes at: 2) at: 18)
		to: result minusGreaterThanTokens.
	result addTokens: ((nodes at: 2) at: 19) to: result commaTokens.
	result
		addTokens: ((nodes at: 2) at: 20)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 2) at: 21) to: result bangTokens.
	result addTokens: ((nodes at: 2) at: 22) to: result typeTokens.
	result
		addTokens: ((nodes at: 2) at: 23)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 2) at: 24) to: result inoutTokens.
	result addTokens: ((nodes at: 2) at: 25) to: result varTokens.
	result addTokens: ((nodes at: 2) at: 26) to: result letTokens.
	result addObjects: ((nodes at: 2) at: 27) to: result expressions.
	result addTokens: ((nodes at: 2) at: 28) to: result isTokens.
	result addTokens: ((nodes at: 2) at: 29) to: result asTokens.
	result inToken: (nodes at: 3).
	result addObject: (nodes at: 4) to: result expressions.
	result block: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForfor_statement1: nodes [
	| result |
	result := SwiftForStatementNode new.
	result forToken: (nodes at: 1).
	result addObjects: ((nodes at: 2) at: 1) to: result expressions.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	result semicolonToken: (nodes at: 3).
	result testExpression: (nodes at: 4).
	result semicolonToken: (nodes at: 5).
	result incrementExpression: (nodes at: 6).
	result block: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForfor_statement2: nodes [
	| result |
	result := SwiftForStatementNode new.
	result forToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result addObjects: ((nodes at: 3) at: 1) to: result expressions.
	result addTokens: ((nodes at: 3) at: 2) to: result commaTokens.
	result semicolonToken: (nodes at: 4).
	result testExpression: (nodes at: 5).
	result semicolonToken: (nodes at: 6).
	result incrementExpression: (nodes at: 7).
	result rightParenToken: (nodes at: 8).
	result block: (nodes at: 9).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForforced_value_expression1: nodes [
	| result |
	result := SwiftForcedValueExpressionNode new.
	result expression: (nodes at: 1).
	result bangToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForfunction_call_expression1: nodes [
	| result |
	result := SwiftFunctionCallExpressionNode new.
	result addObject: (nodes at: 1) to: result expressions.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForfunction_declaration1: nodes [
	| result |
	result := SwiftFunctionDeclarationNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 5) to: result leftBracketTokens.
	result addTokens: ((nodes at: 1) at: 6) to: result rightBracketTokens.
	result addTokens: ((nodes at: 1) at: 7) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 1) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 1) at: 11) to: result operatorTokens.
	result
		addTokens: ((nodes at: 1) at: 12)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 1) at: 13) to: result classTokens.
	result addTokens: ((nodes at: 1) at: 14) to: result mutatingTokens.
	result addTokens: ((nodes at: 1) at: 15) to: result nonmutatingTokens.
	result addTokens: ((nodes at: 1) at: 16) to: result overrideTokens.
	result addTokens: ((nodes at: 1) at: 17) to: result staticTokens.
	result addTokens: ((nodes at: 1) at: 18) to: result unownedTokens.
	result
		addTokens: ((nodes at: 1) at: 19)
		to: result unownedLeftParensafeRightParenTokens.
	result
		addTokens: ((nodes at: 1) at: 20)
		to: result unownedLeftParenunsafeRightParenTokens.
	result addTokens: ((nodes at: 1) at: 21) to: result weakTokens.
	result funcToken: ((nodes at: 1) at: 22).
	result addToken: ((nodes at: 2) at: 1) to: result identifierTokens.
	result addToken: ((nodes at: 2) at: 2) to: result operatorTokens.
	result addTokens: ((nodes at: 3) at: 1) to: result lessThanTokens.
	result addTokens: ((nodes at: 3) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 3) at: 3) to: result colonTokens.
	result addTokens: ((nodes at: 3) at: 4) to: result commaTokens.
	result addTokens: ((nodes at: 3) at: 5) to: result greaterThanTokens.
	result addTokens: ((nodes at: 3) at: 6) to: result periodTokens.
	result addTokens: ((nodes at: 3) at: 7) to: result protocolTokens.
	result whereToken: ((nodes at: 3) at: 8).
	result addTokens: ((nodes at: 3) at: 9) to: result equalEqualTokens.
	result addTokens: ((nodes at: 4) at: 1) to: result leftParenTokens.
	result addTokens: ((nodes at: 4) at: 2) to: result rightParenTokens.
	result addTokens: ((nodes at: 4) at: 3) to: result commaTokens.
	result
		addTokens: ((nodes at: 4) at: 4)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 4) at: 5) to: result colonTokens.
	result addTokens: ((nodes at: 4) at: 6) to: result identifierTokens.
	result addTokens: ((nodes at: 4) at: 7) to: result periodTokens.
	result addTokens: ((nodes at: 4) at: 8) to: result protocolTokens.
	result addTokens: ((nodes at: 4) at: 9) to: result lessThanTokens.
	result addTokens: ((nodes at: 4) at: 10) to: result greaterThanTokens.
	result addTokens: ((nodes at: 4) at: 11) to: result varTokens.
	result addTokens: ((nodes at: 4) at: 12) to: result inoutTokens.
	result addTokens: ((nodes at: 4) at: 13) to: result letTokens.
	result addTokens: ((nodes at: 4) at: 14) to: result _Tokens.
	result addTokens: ((nodes at: 4) at: 15) to: result equalTokens.
	result addObjects: ((nodes at: 4) at: 16) to: result expressions.
	result addTokens: ((nodes at: 4) at: 17) to: result leftBracketTokens.
	result
		addTokens: ((nodes at: 4) at: 18)
		to: result rightBracketTokens.
	result
		addTokens: ((nodes at: 4) at: 19)
		to: result minusGreaterThanTokens.
	result
		addTokens: ((nodes at: 4) at: 20)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 4) at: 21) to: result bangTokens.
	result addTokens: ((nodes at: 4) at: 22) to: result typeTokens.
	result addTokens: ((nodes at: 4) at: 23) to: result leftBraceTokens.
	result addTokens: ((nodes at: 4) at: 24) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 4) at: 25)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 4) at: 26)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 4) at: 27) to: result operatorTokens.
	result
		addTokens: ((nodes at: 4) at: 28)
		to: result full_string_literalTokens.
	result block: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForfunction_name1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForfunction_name2: nodes [
	| result |
	result := Array new: 2.
	result at: 2 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForfunction_signature1: nodes [
	| result |
	result := nodes at: 1.
	self addAll: ((nodes at: 2) at: 1) to: (result at: 19).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 14).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 17).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 18).
	self addAll: ((nodes at: 2) at: 8) to: (result at: 23).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 24).
	self addAll: ((nodes at: 2) at: 10) to: (result at: 25).
	self addAll: ((nodes at: 2) at: 11) to: (result at: 26).
	self addAll: ((nodes at: 2) at: 12) to: (result at: 27).
	self addAll: ((nodes at: 2) at: 13) to: (result at: 28).
	self addAll: ((nodes at: 2) at: 14) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 15) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 16) to: (result at: 9).
	self addAll: ((nodes at: 2) at: 17) to: (result at: 10).
	self addAll: ((nodes at: 2) at: 18) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 19) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 20) to: (result at: 20).
	self addAll: ((nodes at: 2) at: 21) to: (result at: 21).
	self addAll: ((nodes at: 2) at: 22) to: (result at: 22).
	self addAll: ((nodes at: 2) at: 23) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 24) to: (result at: 12).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForfunction_type1: nodes [
	| result |
	result := SwiftFunctionTypeNode new.
	result addToken: (nodes at: 2) to: result minusGreaterThanTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForgeneric_argument_clause1: nodes [
	| result |
	result := Array new: 3.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	result at: 3 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForgeneric_argument_list1: nodes [
	| result |
	result := Array new: 1.
	result at: 1 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForgeneric_argument_list2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForgeneric_parameter1: nodes [
	| result |
	result := Array new: 7.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForgeneric_parameter2: nodes [
	| result |
	result := Array new: 7.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	result at: 2 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForgeneric_parameter_clause1: nodes [
	| result |
	result := Array new: 9.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 7).
	result at: 8 put: ((nodes at: 3) at: 1).
	self addAll: ((nodes at: 3) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 3) at: 3) to: (result at: 1).
	self addAll: ((nodes at: 3) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 3) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 3) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 3) at: 7) to: (result at: 3).
	self addAll: ((nodes at: 3) at: 8) to: (result at: 7).
	self addAll: ((nodes at: 3) at: 9) to: (result at: 9).
	self add: (nodes at: 4) to: (result at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForgeneric_parameter_list1: nodes [
	| result |
	result := Array new: 7.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 1).
	self add: ((nodes at: 1) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 6) to: (result at: 6).
	self add: ((nodes at: 1) at: 7) to: (result at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForgeneric_parameter_list2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 4).
	self addAll: ((nodes at: 3) at: 1) to: (result at: 1).
	self add: ((nodes at: 3) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 3) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 3) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 3) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 3) at: 6) to: (result at: 6).
	self add: ((nodes at: 3) at: 7) to: (result at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForgetter_keyword_clause1: nodes [
	| result |
	result := Array new: 13.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 1) at: 7) to: (result at: 7).
	self addAll: ((nodes at: 1) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 1) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 1) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 1) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 1) at: 12) to: (result at: 12).
	result at: 13 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForgetter_setter_block1: nodes [
	| result |
	result := Array new: 15.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 2) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 2) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 2) at: 12) to: (result at: 12).
	result at: 13 put: ((nodes at: 2) at: 13).
	self add: ((nodes at: 2) at: 14) to: (result at: 14).
	self addAll: ((nodes at: 3) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 3) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 3) at: 3) to: (result at: 4).
	self addAll: ((nodes at: 3) at: 4) to: (result at: 5).
	self addAll: ((nodes at: 3) at: 5) to: (result at: 6).
	self addAll: ((nodes at: 3) at: 6) to: (result at: 7).
	self addAll: ((nodes at: 3) at: 7) to: (result at: 1).
	self addAll: ((nodes at: 3) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 3) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 3) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 3) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 3) at: 12) to: (result at: 12).
	result at: 15 put: ((nodes at: 3) at: 13).
	self add: ((nodes at: 3) at: 14) to: (result at: 14).
	self add: (nodes at: 4) to: (result at: 8).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForgetter_setter_block2: nodes [
	| result |
	result := Array new: 15.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 2) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 2) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 2) at: 12) to: (result at: 12).
	result at: 15 put: ((nodes at: 2) at: 13).
	self add: ((nodes at: 2) at: 14) to: (result at: 14).
	self addAll: ((nodes at: 3) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 3) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 3) at: 3) to: (result at: 4).
	self addAll: ((nodes at: 3) at: 4) to: (result at: 5).
	self addAll: ((nodes at: 3) at: 5) to: (result at: 6).
	self addAll: ((nodes at: 3) at: 6) to: (result at: 7).
	self addAll: ((nodes at: 3) at: 7) to: (result at: 1).
	self addAll: ((nodes at: 3) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 3) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 3) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 3) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 3) at: 12) to: (result at: 12).
	result at: 13 put: ((nodes at: 3) at: 13).
	self add: ((nodes at: 3) at: 14) to: (result at: 14).
	self add: (nodes at: 4) to: (result at: 8).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForgetter_setter_keyword_block1: nodes [
	| result |
	result := Array new: 14.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 2) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 2) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 2) at: 12) to: (result at: 12).
	result at: 13 put: ((nodes at: 2) at: 13).
	self addAll: ((nodes at: 3) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 3) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 3) at: 3) to: (result at: 4).
	self addAll: ((nodes at: 3) at: 4) to: (result at: 5).
	self addAll: ((nodes at: 3) at: 5) to: (result at: 6).
	self addAll: ((nodes at: 3) at: 6) to: (result at: 7).
	self addAll: ((nodes at: 3) at: 7) to: (result at: 1).
	self addAll: ((nodes at: 3) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 3) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 3) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 3) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 3) at: 12) to: (result at: 12).
	result at: 14 put: ((nodes at: 3) at: 13).
	self add: (nodes at: 4) to: (result at: 8).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForgetter_setter_keyword_block2: nodes [
	| result |
	result := Array new: 14.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 2) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 2) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 2) at: 12) to: (result at: 12).
	result at: 14 put: ((nodes at: 2) at: 13).
	self addAll: ((nodes at: 3) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 3) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 3) at: 3) to: (result at: 4).
	self addAll: ((nodes at: 3) at: 4) to: (result at: 5).
	self addAll: ((nodes at: 3) at: 5) to: (result at: 6).
	self addAll: ((nodes at: 3) at: 6) to: (result at: 7).
	self addAll: ((nodes at: 3) at: 7) to: (result at: 1).
	self addAll: ((nodes at: 3) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 3) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 3) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 3) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 3) at: 12) to: (result at: 12).
	result at: 13 put: ((nodes at: 3) at: 13).
	self add: (nodes at: 4) to: (result at: 8).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForif_statement1: nodes [
	| result |
	result := SwiftIfStatementNode new.
	result ifToken: (nodes at: 1).
	result expression: (nodes at: 2).
	result then: (nodes at: 3).
	result elseToken: ((nodes at: 4) at: 1).
	result else: ((nodes at: 4) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForimplicit_member_expression1: nodes [
	| result |
	result := SwiftImplicitMemberExpressionNode new.
	result periodToken: (nodes at: 1).
	result identifierToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForimplicitly_unwrapped_optional_type1: nodes [
	| result |
	result := SwiftImplicitlyUnwrappedOptionalTypeNode new.
	result addToken: (nodes at: 2) to: result bangTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForimport_declaration1: nodes [
	| result |
	result := SwiftImportDeclarationNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 5) to: result leftBracketTokens.
	result addTokens: ((nodes at: 1) at: 6) to: result rightBracketTokens.
	result addTokens: ((nodes at: 1) at: 7) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 1) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 1) at: 11) to: result operatorTokens.
	result
		addTokens: ((nodes at: 1) at: 12)
		to: result full_string_literalTokens.
	result importToken: (nodes at: 2).
	result typealiasToken: ((nodes at: 3) at: 1).
	result structToken: ((nodes at: 3) at: 2).
	result classToken: ((nodes at: 3) at: 3).
	result enumToken: ((nodes at: 3) at: 4).
	result protocolToken: ((nodes at: 3) at: 5).
	result varToken: ((nodes at: 3) at: 6).
	result funcToken: ((nodes at: 3) at: 7).
	result addTokens: ((nodes at: 4) at: 1) to: result identifierTokens.
	result addTokens: ((nodes at: 4) at: 2) to: result operatorTokens.
	result addTokens: ((nodes at: 4) at: 3) to: result periodTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForimport_kind1: nodes [
	| result |
	result := Array new: 7.
	result at: 1 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForimport_kind2: nodes [
	| result |
	result := Array new: 7.
	result at: 2 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForimport_kind3: nodes [
	| result |
	result := Array new: 7.
	result at: 3 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForimport_kind4: nodes [
	| result |
	result := Array new: 7.
	result at: 4 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForimport_kind5: nodes [
	| result |
	result := Array new: 7.
	result at: 5 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForimport_kind6: nodes [
	| result |
	result := Array new: 7.
	result at: 6 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForimport_kind7: nodes [
	| result |
	result := Array new: 7.
	result at: 7 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForimport_path1: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	self add: ((nodes at: 1) at: 1) to: (result at: 1).
	self add: ((nodes at: 1) at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForimport_path2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 3).
	self add: ((nodes at: 3) at: 1) to: (result at: 1).
	self add: ((nodes at: 3) at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForin_out_expression1: nodes [
	| result |
	result := SwiftInOutExpressionNode new.
	result andToken: (nodes at: 1).
	result identifierToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForinfix_operator_attributes1: nodes [
	| result |
	result := Array new: 6.
	result at: 1 put: ((nodes at: 1) at: 1).
	result at: 2 put: ((nodes at: 1) at: 2).
	result at: 3 put: ((nodes at: 2) at: 1).
	result at: 4 put: ((nodes at: 2) at: 2).
	result at: 5 put: ((nodes at: 2) at: 3).
	result at: 6 put: ((nodes at: 2) at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForinfix_operator_declaration1: nodes [
	| result |
	result := SwiftInfixOperatorDeclarationNode new.
	result addToken: (nodes at: 1) to: result operatorTokens.
	result infixToken: (nodes at: 2).
	result addToken: (nodes at: 3) to: result operatorTokens.
	result leftBraceToken: (nodes at: 4).
	result precedenceToken: ((nodes at: 5) at: 1).
	result integer_literalToken: ((nodes at: 5) at: 2).
	result associativityToken: ((nodes at: 5) at: 3).
	result leftToken: ((nodes at: 5) at: 4).
	result rightToken: ((nodes at: 5) at: 5).
	result noneToken: ((nodes at: 5) at: 6).
	result rightBraceToken: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForinitializer_declaration1: nodes [
	| result |
	result := SwiftInitializerDeclarationNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 5) to: result leftBracketTokens.
	result addTokens: ((nodes at: 1) at: 6) to: result rightBracketTokens.
	result addTokens: ((nodes at: 1) at: 7) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 1) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 1) at: 11) to: result operatorTokens.
	result
		addTokens: ((nodes at: 1) at: 12)
		to: result full_string_literalTokens.
	result convenienceToken: ((nodes at: 1) at: 13).
	result initToken: ((nodes at: 1) at: 14).
	result addTokens: ((nodes at: 2) at: 1) to: result lessThanTokens.
	result addTokens: ((nodes at: 2) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 2) at: 3) to: result colonTokens.
	result addTokens: ((nodes at: 2) at: 4) to: result commaTokens.
	result addTokens: ((nodes at: 2) at: 5) to: result greaterThanTokens.
	result addTokens: ((nodes at: 2) at: 6) to: result periodTokens.
	result addTokens: ((nodes at: 2) at: 7) to: result protocolTokens.
	result whereToken: ((nodes at: 2) at: 8).
	result addTokens: ((nodes at: 2) at: 9) to: result equalEqualTokens.
	result addTokens: ((nodes at: 3) at: 1) to: result leftParenTokens.
	result addTokens: ((nodes at: 3) at: 2) to: result rightParenTokens.
	result addTokens: ((nodes at: 3) at: 3) to: result inoutTokens.
	result addTokens: ((nodes at: 3) at: 4) to: result letTokens.
	result addTokens: ((nodes at: 3) at: 5) to: result _Tokens.
	result addTokens: ((nodes at: 3) at: 6) to: result identifierTokens.
	result addTokens: ((nodes at: 3) at: 7) to: result colonTokens.
	result addTokens: ((nodes at: 3) at: 8) to: result leftBracketTokens.
	result addTokens: ((nodes at: 3) at: 9) to: result rightBracketTokens.
	result addTokens: ((nodes at: 3) at: 10) to: result leftBraceTokens.
	result addTokens: ((nodes at: 3) at: 11) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 3) at: 12)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 3) at: 13)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 3) at: 14) to: result operatorTokens.
	result addTokens: ((nodes at: 3) at: 15) to: result periodTokens.
	result addTokens: ((nodes at: 3) at: 16) to: result protocolTokens.
	result addTokens: ((nodes at: 3) at: 17) to: result lessThanTokens.
	result addTokens: ((nodes at: 3) at: 18) to: result greaterThanTokens.
	result
		addTokens: ((nodes at: 3) at: 19)
		to: result minusGreaterThanTokens.
	result addTokens: ((nodes at: 3) at: 20) to: result commaTokens.
	result
		addTokens: ((nodes at: 3) at: 21)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 3) at: 22) to: result bangTokens.
	result addTokens: ((nodes at: 3) at: 23) to: result typeTokens.
	result
		addTokens: ((nodes at: 3) at: 24)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 3) at: 25) to: result equalTokens.
	result addObjects: ((nodes at: 3) at: 26) to: result expressions.
	result addTokens: ((nodes at: 3) at: 27) to: result varTokens.
	result
		addTokens: ((nodes at: 3) at: 28)
		to: result full_string_literalTokens.
	result block: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForinitializer_expression1: nodes [
	| result |
	result := SwiftInitializerExpressionNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 2) to: result lessThanTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result commaTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result greaterThanTokens.
	result
		addTokens: ((nodes at: 1) at: 5)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 6)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 7)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result leftBracketTokens.
	result addObjects: ((nodes at: 1) at: 9) to: result expressions.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result rightBracketTokens.
	result addObjects: ((nodes at: 1) at: 11) to: result keyExpressions.
	result addTokens: ((nodes at: 1) at: 12) to: result colonTokens.
	result addObjects: ((nodes at: 1) at: 13) to: result valueExpressions.
	result __FILE__Token: ((nodes at: 1) at: 14).
	result __LINE__Token: ((nodes at: 1) at: 15).
	result __COLUMN__Token: ((nodes at: 1) at: 16).
	result __FUNCTION__Token: ((nodes at: 1) at: 17).
	result addTokens: ((nodes at: 1) at: 18) to: result selfTokens.
	result addTokens: ((nodes at: 1) at: 19) to: result periodTokens.
	result addTokens: ((nodes at: 1) at: 20) to: result initTokens.
	result addTokens: ((nodes at: 1) at: 21) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 22) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 23) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 24) to: result inoutTokens.
	result addTokens: ((nodes at: 1) at: 25) to: result letTokens.
	result addTokens: ((nodes at: 1) at: 26) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 27) to: result rightBraceTokens.
	result addTokens: ((nodes at: 1) at: 28) to: result operatorTokens.
	result addTokens: ((nodes at: 1) at: 29) to: result protocolTokens.
	result
		addTokens: ((nodes at: 1) at: 30)
		to: result minusGreaterThanTokens.
	result
		addTokens: ((nodes at: 1) at: 31)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 1) at: 32) to: result bangTokens.
	result addTokens: ((nodes at: 1) at: 33) to: result typeTokens.
	result
		addTokens: ((nodes at: 1) at: 34)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 1) at: 35) to: result equalTokens.
	result addTokens: ((nodes at: 1) at: 36) to: result varTokens.
	result inToken: ((nodes at: 1) at: 37).
	result weakToken: ((nodes at: 1) at: 38).
	result unownedToken: ((nodes at: 1) at: 39).
	result unownedLeftParensafeRightParenToken: ((nodes at: 1) at: 40).
	result unownedLeftParenunsafeRightParenToken: ((nodes at: 1) at: 41).
	result addNodes: ((nodes at: 1) at: 42) to: result statements.
	result addTokens: ((nodes at: 1) at: 43) to: result dynamicTypeTokens.
	result addToken: (nodes at: 2) to: result periodTokens.
	result addToken: (nodes at: 3) to: result initTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForinitializer_head1: nodes [
	| result |
	result := Array new: 14.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 1) at: 7) to: (result at: 7).
	self addAll: ((nodes at: 1) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 1) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 1) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 1) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 1) at: 12) to: (result at: 12).
	result at: 13 put: (nodes at: 2).
	result at: 14 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForis_pattern1: nodes [
	| result |
	result := Array new: 25.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	result at: 25 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForlabel_name1: nodes [
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForlabeled_statement1: nodes [
	| result |
	result := SwiftLabeledStatementNode new.
	result name: ((nodes at: 1) at: 1).
	result colonToken: ((nodes at: 1) at: 2).
	result statement: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForliteral1: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForliteral2: nodes [
	| result |
	result := Array new: 3.
	result at: 2 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForliteral3: nodes [
	| result |
	result := Array new: 3.
	result at: 3 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForliteral_expression1: nodes [
	| result |
	result := SwiftLiteralExpressionNode new.
	result integer_literalToken: ((nodes at: 1) at: 1).
	result floating_point_literalToken: ((nodes at: 1) at: 2).
	result full_string_literalToken: ((nodes at: 1) at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForliteral_expression2: nodes [
	| result |
	result := SwiftLiteralExpressionNode new.
	result leftBracketToken: ((nodes at: 1) at: 1).
	result addObjects: ((nodes at: 1) at: 2) to: result expressions.
	result addTokens: ((nodes at: 1) at: 3) to: result commaTokens.
	result rightBracketToken: ((nodes at: 1) at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForliteral_expression3: nodes [
	| result |
	result := SwiftLiteralExpressionNode new.
	result leftBracketToken: ((nodes at: 1) at: 1).
	result addObjects: ((nodes at: 1) at: 2) to: result keyExpressions.
	result addTokens: ((nodes at: 1) at: 3) to: result colonTokens.
	result addObjects: ((nodes at: 1) at: 4) to: result valueExpressions.
	result addTokens: ((nodes at: 1) at: 5) to: result commaTokens.
	result rightBracketToken: ((nodes at: 1) at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForliteral_expression4: nodes [
	| result |
	result := SwiftLiteralExpressionNode new.
	result __FILE__Token: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForliteral_expression5: nodes [
	| result |
	result := SwiftLiteralExpressionNode new.
	result __LINE__Token: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForliteral_expression6: nodes [
	| result |
	result := SwiftLiteralExpressionNode new.
	result __COLUMN__Token: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForliteral_expression7: nodes [
	| result |
	result := SwiftLiteralExpressionNode new.
	result __FUNCTION__Token: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFormetatype_type1: nodes [
	| result |
	result := SwiftMetatypeTypeNode new.
	result addToken: (nodes at: 2) to: result periodTokens.
	result addToken: (nodes at: 3) to: result typeTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFormetatype_type2: nodes [
	| result |
	result := SwiftMetatypeTypeNode new.
	result addToken: (nodes at: 2) to: result periodTokens.
	result addToken: (nodes at: 3) to: result protocolTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForoptional_chaining_expression1: nodes [
	| result |
	result := SwiftOptionalChainingExpressionNode new.
	result expression: (nodes at: 1).
	result questionMarkToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForoptional_type1: nodes [
	| result |
	result := SwiftOptionalTypeNode new.
	result addToken: (nodes at: 2) to: result questionMarkTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForparameter1: nodes [
	| result |
	result := Array new: 28.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	result at: 25 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	result at: 2 put: (nodes at: 2).
	self add: (nodes at: 3) to: (result at: 3).
	self add: ((nodes at: 4) at: 1) to: (result at: 4).
	self add: ((nodes at: 4) at: 2) to: (result at: 3).
	self add: ((nodes at: 5) at: 1) to: (result at: 4).
	self add: ((nodes at: 5) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 6) at: 1) to: (result at: 5).
	self addAll: ((nodes at: 6) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 6) at: 3) to: (result at: 4).
	self addAll: ((nodes at: 6) at: 4) to: (result at: 6).
	self addAll: ((nodes at: 6) at: 5) to: (result at: 7).
	self addAll: ((nodes at: 6) at: 6) to: (result at: 8).
	self addAll: ((nodes at: 6) at: 7) to: (result at: 9).
	self addAll: ((nodes at: 6) at: 8) to: (result at: 10).
	self addAll: ((nodes at: 6) at: 9) to: (result at: 11).
	self addAll: ((nodes at: 6) at: 10) to: (result at: 12).
	self addAll: ((nodes at: 6) at: 11) to: (result at: 13).
	self addAll: ((nodes at: 6) at: 12) to: (result at: 14).
	self addAll: ((nodes at: 6) at: 13) to: (result at: 15).
	self addAll: ((nodes at: 6) at: 14) to: (result at: 16).
	self addAll: ((nodes at: 6) at: 15) to: (result at: 17).
	self addAll: ((nodes at: 6) at: 16) to: (result at: 18).
	self addAll: ((nodes at: 6) at: 17) to: (result at: 19).
	self addAll: ((nodes at: 6) at: 18) to: (result at: 20).
	self addAll: ((nodes at: 6) at: 19) to: (result at: 21).
	self addAll: ((nodes at: 6) at: 20) to: (result at: 22).
	self addAll: ((nodes at: 6) at: 21) to: (result at: 23).
	self addAll: ((nodes at: 6) at: 22) to: (result at: 24).
	self addAll: ((nodes at: 6) at: 23) to: (result at: 25).
	self addAll: ((nodes at: 6) at: 24) to: (result at: 1).
	result at: 26 put: ((nodes at: 7) at: 1).
	result at: 27 put: ((nodes at: 7) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForparameter2: nodes [
	| result |
	result := Array new: 28.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	result at: 25 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	result at: 28 put: (nodes at: 2).
	self add: (nodes at: 3) to: (result at: 3).
	self add: ((nodes at: 4) at: 1) to: (result at: 4).
	self add: ((nodes at: 4) at: 2) to: (result at: 3).
	self add: ((nodes at: 5) at: 1) to: (result at: 4).
	self add: ((nodes at: 5) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 6) at: 1) to: (result at: 5).
	self addAll: ((nodes at: 6) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 6) at: 3) to: (result at: 4).
	self addAll: ((nodes at: 6) at: 4) to: (result at: 6).
	self addAll: ((nodes at: 6) at: 5) to: (result at: 7).
	self addAll: ((nodes at: 6) at: 6) to: (result at: 8).
	self addAll: ((nodes at: 6) at: 7) to: (result at: 9).
	self addAll: ((nodes at: 6) at: 8) to: (result at: 10).
	self addAll: ((nodes at: 6) at: 9) to: (result at: 11).
	self addAll: ((nodes at: 6) at: 10) to: (result at: 12).
	self addAll: ((nodes at: 6) at: 11) to: (result at: 13).
	self addAll: ((nodes at: 6) at: 12) to: (result at: 14).
	self addAll: ((nodes at: 6) at: 13) to: (result at: 15).
	self addAll: ((nodes at: 6) at: 14) to: (result at: 16).
	self addAll: ((nodes at: 6) at: 15) to: (result at: 17).
	self addAll: ((nodes at: 6) at: 16) to: (result at: 18).
	self addAll: ((nodes at: 6) at: 17) to: (result at: 19).
	self addAll: ((nodes at: 6) at: 18) to: (result at: 20).
	self addAll: ((nodes at: 6) at: 19) to: (result at: 21).
	self addAll: ((nodes at: 6) at: 20) to: (result at: 22).
	self addAll: ((nodes at: 6) at: 21) to: (result at: 23).
	self addAll: ((nodes at: 6) at: 22) to: (result at: 24).
	self addAll: ((nodes at: 6) at: 23) to: (result at: 25).
	self addAll: ((nodes at: 6) at: 24) to: (result at: 1).
	result at: 26 put: ((nodes at: 7) at: 1).
	result at: 27 put: ((nodes at: 7) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForparameter3: nodes [
	| result |
	result := Array new: 28.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	result at: 25 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 4).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 6).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 7).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 8).
	self addAll: ((nodes at: 1) at: 6) to: (result at: 9).
	self addAll: ((nodes at: 1) at: 7) to: (result at: 10).
	self addAll: ((nodes at: 1) at: 8) to: (result at: 11).
	self addAll: ((nodes at: 1) at: 9) to: (result at: 12).
	self addAll: ((nodes at: 1) at: 10) to: (result at: 13).
	self addAll: ((nodes at: 1) at: 11) to: (result at: 14).
	self addAll: ((nodes at: 1) at: 12) to: (result at: 15).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForparameter_clause1: nodes [
	| result |
	result := Array new: 28.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self add: (nodes at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForparameter_clause2: nodes [
	| result |
	result := Array new: 28.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 2) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 2) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 2) at: 12) to: (result at: 12).
	self addAll: ((nodes at: 2) at: 13) to: (result at: 13).
	self addAll: ((nodes at: 2) at: 14) to: (result at: 14).
	self addAll: ((nodes at: 2) at: 15) to: (result at: 15).
	self addAll: ((nodes at: 2) at: 16) to: (result at: 16).
	self addAll: ((nodes at: 2) at: 17) to: (result at: 17).
	self addAll: ((nodes at: 2) at: 18) to: (result at: 18).
	self addAll: ((nodes at: 2) at: 19) to: (result at: 19).
	self addAll: ((nodes at: 2) at: 20) to: (result at: 20).
	self addAll: ((nodes at: 2) at: 21) to: (result at: 21).
	self addAll: ((nodes at: 2) at: 22) to: (result at: 22).
	self addAll: ((nodes at: 2) at: 23) to: (result at: 23).
	self addAll: ((nodes at: 2) at: 24) to: (result at: 24).
	self addAll: ((nodes at: 2) at: 25) to: (result at: 25).
	self addAll: ((nodes at: 2) at: 26) to: (result at: 26).
	self addAll: ((nodes at: 2) at: 27) to: (result at: 27).
	self addAll: ((nodes at: 2) at: 28) to: (result at: 28).
	self add: (nodes at: 3) to: (result at: 24).
	self add: (nodes at: 4) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForparameter_clauses1: nodes [
	| result |
	result := Array new: 28.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForparameter_clauses2: nodes [
	| result |
	result := nodes at: 1.
	self addAll: ((nodes at: 2) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 12).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 13).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 14).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 8) to: (result at: 17).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 18).
	self addAll: ((nodes at: 2) at: 10) to: (result at: 23).
	self addAll: ((nodes at: 2) at: 11) to: (result at: 24).
	self addAll: ((nodes at: 2) at: 12) to: (result at: 25).
	self addAll: ((nodes at: 2) at: 13) to: (result at: 26).
	self addAll: ((nodes at: 2) at: 14) to: (result at: 27).
	self addAll: ((nodes at: 2) at: 15) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 16) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 17) to: (result at: 9).
	self addAll: ((nodes at: 2) at: 18) to: (result at: 10).
	self addAll: ((nodes at: 2) at: 19) to: (result at: 19).
	self addAll: ((nodes at: 2) at: 20) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 21) to: (result at: 20).
	self addAll: ((nodes at: 2) at: 22) to: (result at: 21).
	self addAll: ((nodes at: 2) at: 23) to: (result at: 22).
	self addAll: ((nodes at: 2) at: 24) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 25) to: (result at: 15).
	self addAll: ((nodes at: 2) at: 26) to: (result at: 16).
	self addAll: ((nodes at: 2) at: 27) to: (result at: 11).
	self addAll: ((nodes at: 2) at: 28) to: (result at: 28).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForparameter_list1: nodes [
	| result |
	result := Array new: 28.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 1).
	self add: ((nodes at: 1) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 1) at: 7) to: (result at: 7).
	self addAll: ((nodes at: 1) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 1) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 1) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 1) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 1) at: 12) to: (result at: 12).
	self addAll: ((nodes at: 1) at: 13) to: (result at: 13).
	self addAll: ((nodes at: 1) at: 14) to: (result at: 14).
	self addAll: ((nodes at: 1) at: 15) to: (result at: 28).
	self addAll: ((nodes at: 1) at: 16) to: (result at: 15).
	self addAll: ((nodes at: 1) at: 17) to: (result at: 16).
	self addAll: ((nodes at: 1) at: 18) to: (result at: 17).
	self addAll: ((nodes at: 1) at: 19) to: (result at: 18).
	self addAll: ((nodes at: 1) at: 20) to: (result at: 19).
	self addAll: ((nodes at: 1) at: 21) to: (result at: 20).
	self addAll: ((nodes at: 1) at: 22) to: (result at: 21).
	self addAll: ((nodes at: 1) at: 23) to: (result at: 22).
	self addAll: ((nodes at: 1) at: 24) to: (result at: 23).
	self addAll: ((nodes at: 1) at: 25) to: (result at: 24).
	self add: ((nodes at: 1) at: 26) to: (result at: 25).
	self add: ((nodes at: 1) at: 27) to: (result at: 26).
	self add: ((nodes at: 1) at: 28) to: (result at: 27).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForparameter_list2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 20).
	self addAll: ((nodes at: 3) at: 1) to: (result at: 1).
	self add: ((nodes at: 3) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 3) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 3) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 3) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 3) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 3) at: 7) to: (result at: 7).
	self addAll: ((nodes at: 3) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 3) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 3) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 3) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 3) at: 12) to: (result at: 12).
	self addAll: ((nodes at: 3) at: 13) to: (result at: 13).
	self addAll: ((nodes at: 3) at: 14) to: (result at: 14).
	self addAll: ((nodes at: 3) at: 15) to: (result at: 28).
	self addAll: ((nodes at: 3) at: 16) to: (result at: 15).
	self addAll: ((nodes at: 3) at: 17) to: (result at: 16).
	self addAll: ((nodes at: 3) at: 18) to: (result at: 17).
	self addAll: ((nodes at: 3) at: 19) to: (result at: 18).
	self addAll: ((nodes at: 3) at: 20) to: (result at: 19).
	self addAll: ((nodes at: 3) at: 21) to: (result at: 20).
	self addAll: ((nodes at: 3) at: 22) to: (result at: 21).
	self addAll: ((nodes at: 3) at: 23) to: (result at: 22).
	self addAll: ((nodes at: 3) at: 24) to: (result at: 23).
	self addAll: ((nodes at: 3) at: 25) to: (result at: 24).
	self add: ((nodes at: 3) at: 26) to: (result at: 25).
	self add: ((nodes at: 3) at: 27) to: (result at: 26).
	self add: ((nodes at: 3) at: 28) to: (result at: 27).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForparenthesized_expression1: nodes [
	| result |
	result := SwiftParenthesizedExpressionNode new.
	result leftParenToken: (nodes at: 1).
	result addObjects: ((nodes at: 2) at: 1) to: result expressions.
	result addTokens: ((nodes at: 2) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 2) at: 3) to: result colonTokens.
	result addTokens: ((nodes at: 2) at: 4) to: result commaTokens.
	result rightParenToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForpattern1: nodes [
	| result |
	result := Array new: 29.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 2) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 2) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 2) at: 12) to: (result at: 12).
	self addAll: ((nodes at: 2) at: 13) to: (result at: 13).
	self addAll: ((nodes at: 2) at: 14) to: (result at: 14).
	self addAll: ((nodes at: 2) at: 15) to: (result at: 15).
	self addAll: ((nodes at: 2) at: 16) to: (result at: 16).
	self addAll: ((nodes at: 2) at: 17) to: (result at: 17).
	self addAll: ((nodes at: 2) at: 18) to: (result at: 18).
	self addAll: ((nodes at: 2) at: 19) to: (result at: 19).
	self addAll: ((nodes at: 2) at: 20) to: (result at: 20).
	self addAll: ((nodes at: 2) at: 21) to: (result at: 21).
	self addAll: ((nodes at: 2) at: 22) to: (result at: 22).
	self addAll: ((nodes at: 2) at: 23) to: (result at: 23).
	self addAll: ((nodes at: 2) at: 24) to: (result at: 24).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForpattern2: nodes [
	| result |
	result := Array new: 29.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 2) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 2) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 2) at: 12) to: (result at: 12).
	self addAll: ((nodes at: 2) at: 13) to: (result at: 13).
	self addAll: ((nodes at: 2) at: 14) to: (result at: 14).
	self addAll: ((nodes at: 2) at: 15) to: (result at: 15).
	self addAll: ((nodes at: 2) at: 16) to: (result at: 16).
	self addAll: ((nodes at: 2) at: 17) to: (result at: 17).
	self addAll: ((nodes at: 2) at: 18) to: (result at: 18).
	self addAll: ((nodes at: 2) at: 19) to: (result at: 19).
	self addAll: ((nodes at: 2) at: 20) to: (result at: 20).
	self addAll: ((nodes at: 2) at: 21) to: (result at: 21).
	self addAll: ((nodes at: 2) at: 22) to: (result at: 22).
	self addAll: ((nodes at: 2) at: 23) to: (result at: 23).
	self addAll: ((nodes at: 2) at: 24) to: (result at: 24).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForpattern3: nodes [
	| result |
	result := Array new: 29.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 25).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 1).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 2).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 4).
	self addAll: ((nodes at: 1) at: 6) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 7) to: (result at: 6).
	self addAll: ((nodes at: 1) at: 8) to: (result at: 7).
	self addAll: ((nodes at: 1) at: 9) to: (result at: 8).
	self addAll: ((nodes at: 1) at: 10) to: (result at: 9).
	self addAll: ((nodes at: 1) at: 11) to: (result at: 10).
	self addAll: ((nodes at: 1) at: 12) to: (result at: 11).
	self addAll: ((nodes at: 1) at: 13) to: (result at: 12).
	self addAll: ((nodes at: 1) at: 14) to: (result at: 13).
	self addAll: ((nodes at: 1) at: 15) to: (result at: 14).
	self addAll: ((nodes at: 1) at: 16) to: (result at: 15).
	self addAll: ((nodes at: 1) at: 17) to: (result at: 16).
	self addAll: ((nodes at: 1) at: 18) to: (result at: 17).
	self addAll: ((nodes at: 1) at: 19) to: (result at: 18).
	self addAll: ((nodes at: 1) at: 20) to: (result at: 19).
	self addAll: ((nodes at: 1) at: 21) to: (result at: 20).
	self addAll: ((nodes at: 1) at: 22) to: (result at: 21).
	self addAll: ((nodes at: 1) at: 23) to: (result at: 22).
	self addAll: ((nodes at: 1) at: 24) to: (result at: 23).
	self addAll: ((nodes at: 1) at: 25) to: (result at: 24).
	self addAll: ((nodes at: 1) at: 26) to: (result at: 26).
	self addAll: ((nodes at: 1) at: 27) to: (result at: 27).
	self addAll: ((nodes at: 1) at: 28) to: (result at: 28).
	self addAll: ((nodes at: 1) at: 29) to: (result at: 29).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForpattern4: nodes [
	| result |
	result := Array new: 29.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 4).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 1).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 2).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 1) at: 7) to: (result at: 7).
	self addAll: ((nodes at: 1) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 1) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 1) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 1) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 1) at: 12) to: (result at: 12).
	self addAll: ((nodes at: 1) at: 13) to: (result at: 13).
	self addAll: ((nodes at: 1) at: 14) to: (result at: 14).
	self addAll: ((nodes at: 1) at: 15) to: (result at: 15).
	self addAll: ((nodes at: 1) at: 16) to: (result at: 16).
	self addAll: ((nodes at: 1) at: 17) to: (result at: 17).
	self addAll: ((nodes at: 1) at: 18) to: (result at: 18).
	self addAll: ((nodes at: 1) at: 19) to: (result at: 19).
	self addAll: ((nodes at: 1) at: 20) to: (result at: 20).
	self addAll: ((nodes at: 1) at: 21) to: (result at: 21).
	self addAll: ((nodes at: 1) at: 22) to: (result at: 22).
	self addAll: ((nodes at: 1) at: 23) to: (result at: 23).
	self addAll: ((nodes at: 1) at: 24) to: (result at: 24).
	self addAll: ((nodes at: 1) at: 25) to: (result at: 25).
	self addAll: ((nodes at: 1) at: 26) to: (result at: 26).
	self addAll: ((nodes at: 1) at: 27) to: (result at: 27).
	self addAll: ((nodes at: 1) at: 28) to: (result at: 28).
	self addAll: ((nodes at: 1) at: 29) to: (result at: 29).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 2) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 2) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 2) at: 12) to: (result at: 12).
	self addAll: ((nodes at: 2) at: 13) to: (result at: 13).
	self addAll: ((nodes at: 2) at: 14) to: (result at: 14).
	self addAll: ((nodes at: 2) at: 15) to: (result at: 15).
	self addAll: ((nodes at: 2) at: 16) to: (result at: 16).
	self addAll: ((nodes at: 2) at: 17) to: (result at: 17).
	self addAll: ((nodes at: 2) at: 18) to: (result at: 18).
	self addAll: ((nodes at: 2) at: 19) to: (result at: 19).
	self addAll: ((nodes at: 2) at: 20) to: (result at: 20).
	self addAll: ((nodes at: 2) at: 21) to: (result at: 21).
	self addAll: ((nodes at: 2) at: 22) to: (result at: 22).
	self addAll: ((nodes at: 2) at: 23) to: (result at: 23).
	self addAll: ((nodes at: 2) at: 24) to: (result at: 24).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForpattern5: nodes [
	| result |
	result := Array new: 29.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 16).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 19).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 17).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 14).
	self addAll: ((nodes at: 1) at: 6) to: (result at: 4).
	self addAll: ((nodes at: 1) at: 7) to: (result at: 1).
	self addAll: ((nodes at: 1) at: 8) to: (result at: 2).
	self addAll: ((nodes at: 1) at: 9) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 10) to: (result at: 6).
	self addAll: ((nodes at: 1) at: 11) to: (result at: 7).
	self addAll: ((nodes at: 1) at: 12) to: (result at: 8).
	self addAll: ((nodes at: 1) at: 13) to: (result at: 9).
	self addAll: ((nodes at: 1) at: 14) to: (result at: 10).
	self addAll: ((nodes at: 1) at: 15) to: (result at: 11).
	self addAll: ((nodes at: 1) at: 16) to: (result at: 12).
	self addAll: ((nodes at: 1) at: 17) to: (result at: 13).
	self addAll: ((nodes at: 1) at: 18) to: (result at: 15).
	self addAll: ((nodes at: 1) at: 19) to: (result at: 18).
	self addAll: ((nodes at: 1) at: 20) to: (result at: 20).
	self addAll: ((nodes at: 1) at: 21) to: (result at: 21).
	self addAll: ((nodes at: 1) at: 22) to: (result at: 22).
	self addAll: ((nodes at: 1) at: 23) to: (result at: 23).
	self addAll: ((nodes at: 1) at: 24) to: (result at: 24).
	self addAll: ((nodes at: 1) at: 25) to: (result at: 25).
	self addAll: ((nodes at: 1) at: 26) to: (result at: 26).
	self addAll: ((nodes at: 1) at: 27) to: (result at: 27).
	self addAll: ((nodes at: 1) at: 28) to: (result at: 28).
	self addAll: ((nodes at: 1) at: 29) to: (result at: 29).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForpattern6: nodes [
	| result |
	result := Array new: 29.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 28).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 6).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 14).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 15).
	self addAll: ((nodes at: 1) at: 6) to: (result at: 16).
	self addAll: ((nodes at: 1) at: 7) to: (result at: 17).
	self addAll: ((nodes at: 1) at: 8) to: (result at: 7).
	self addAll: ((nodes at: 1) at: 9) to: (result at: 2).
	self addAll: ((nodes at: 1) at: 10) to: (result at: 18).
	self addAll: ((nodes at: 1) at: 11) to: (result at: 19).
	self addAll: ((nodes at: 1) at: 12) to: (result at: 4).
	self addAll: ((nodes at: 1) at: 13) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 14) to: (result at: 20).
	self addAll: ((nodes at: 1) at: 15) to: (result at: 21).
	self addAll: ((nodes at: 1) at: 16) to: (result at: 22).
	self addAll: ((nodes at: 1) at: 17) to: (result at: 23).
	self addAll: ((nodes at: 1) at: 18) to: (result at: 24).
	self addAll: ((nodes at: 1) at: 19) to: (result at: 1).
	self addAll: ((nodes at: 1) at: 20) to: (result at: 8).
	self addAll: ((nodes at: 1) at: 21) to: (result at: 9).
	self addAll: ((nodes at: 1) at: 22) to: (result at: 10).
	self addAll: ((nodes at: 1) at: 23) to: (result at: 11).
	self addAll: ((nodes at: 1) at: 24) to: (result at: 12).
	self addAll: ((nodes at: 1) at: 25) to: (result at: 13).
	self addAll: ((nodes at: 1) at: 26) to: (result at: 25).
	self addAll: ((nodes at: 1) at: 27) to: (result at: 26).
	self addAll: ((nodes at: 1) at: 28) to: (result at: 27).
	self addAll: ((nodes at: 1) at: 29) to: (result at: 29).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForpattern7: nodes [
	| result |
	result := Array new: 29.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 27).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForpattern_initializer1: nodes [
	| result |
	result := SwiftPatternInitializerNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 2) to: result colonTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 5) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 6) to: result leftBracketTokens.
	result addTokens: ((nodes at: 1) at: 7) to: result rightBracketTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 9) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 11)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 1) at: 12) to: result operatorTokens.
	result
		addTokens: ((nodes at: 1) at: 13)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 1) at: 14) to: result periodTokens.
	result addTokens: ((nodes at: 1) at: 15) to: result protocolTokens.
	result addTokens: ((nodes at: 1) at: 16) to: result lessThanTokens.
	result addTokens: ((nodes at: 1) at: 17) to: result greaterThanTokens.
	result
		addTokens: ((nodes at: 1) at: 18)
		to: result minusGreaterThanTokens.
	result addTokens: ((nodes at: 1) at: 19) to: result commaTokens.
	result
		addTokens: ((nodes at: 1) at: 20)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 1) at: 21) to: result bangTokens.
	result addTokens: ((nodes at: 1) at: 22) to: result typeTokens.
	result
		addTokens: ((nodes at: 1) at: 23)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 1) at: 24) to: result inoutTokens.
	result addTokens: ((nodes at: 1) at: 25) to: result varTokens.
	result addTokens: ((nodes at: 1) at: 26) to: result letTokens.
	result addObjects: ((nodes at: 1) at: 27) to: result expressions.
	result addTokens: ((nodes at: 1) at: 28) to: result isTokens.
	result addTokens: ((nodes at: 1) at: 29) to: result asTokens.
	result equalToken: ((nodes at: 2) at: 1).
	result addObject: ((nodes at: 2) at: 2) to: result expressions.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForpostfix_expression1: nodes [
	| result |
	result := Array new: 43.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	result at: 30 put: (OrderedCollection new: 2).
	result at: 31 put: (OrderedCollection new: 2).
	result at: 32 put: (OrderedCollection new: 2).
	result at: 33 put: (OrderedCollection new: 2).
	result at: 34 put: (OrderedCollection new: 2).
	result at: 35 put: (OrderedCollection new: 2).
	result at: 36 put: (OrderedCollection new: 2).
	result at: 42 put: (OrderedCollection new: 2).
	result at: 43 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForpostfix_expression2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 28).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForpostfix_operator_declaration1: nodes [
	| result |
	result := SwiftPostfixOperatorDeclarationNode new.
	result addToken: (nodes at: 1) to: result operatorTokens.
	result postfixToken: (nodes at: 2).
	result addToken: (nodes at: 3) to: result operatorTokens.
	result leftBraceToken: (nodes at: 4).
	result rightBraceToken: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForpostfix_self_expression1: nodes [
	| result |
	result := SwiftPostfixSelfExpressionNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 2) to: result lessThanTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result commaTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result greaterThanTokens.
	result
		addTokens: ((nodes at: 1) at: 5)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 6)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 7)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result leftBracketTokens.
	result addObjects: ((nodes at: 1) at: 9) to: result expressions.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result rightBracketTokens.
	result addObjects: ((nodes at: 1) at: 11) to: result keyExpressions.
	result addTokens: ((nodes at: 1) at: 12) to: result colonTokens.
	result addObjects: ((nodes at: 1) at: 13) to: result valueExpressions.
	result __FILE__Token: ((nodes at: 1) at: 14).
	result __LINE__Token: ((nodes at: 1) at: 15).
	result __COLUMN__Token: ((nodes at: 1) at: 16).
	result __FUNCTION__Token: ((nodes at: 1) at: 17).
	result addTokens: ((nodes at: 1) at: 18) to: result selfTokens.
	result addTokens: ((nodes at: 1) at: 19) to: result periodTokens.
	result addTokens: ((nodes at: 1) at: 20) to: result initTokens.
	result addTokens: ((nodes at: 1) at: 21) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 22) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 23) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 24) to: result inoutTokens.
	result addTokens: ((nodes at: 1) at: 25) to: result letTokens.
	result addTokens: ((nodes at: 1) at: 26) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 27) to: result rightBraceTokens.
	result addTokens: ((nodes at: 1) at: 28) to: result operatorTokens.
	result addTokens: ((nodes at: 1) at: 29) to: result protocolTokens.
	result
		addTokens: ((nodes at: 1) at: 30)
		to: result minusGreaterThanTokens.
	result
		addTokens: ((nodes at: 1) at: 31)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 1) at: 32) to: result bangTokens.
	result addTokens: ((nodes at: 1) at: 33) to: result typeTokens.
	result
		addTokens: ((nodes at: 1) at: 34)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 1) at: 35) to: result equalTokens.
	result addTokens: ((nodes at: 1) at: 36) to: result varTokens.
	result inToken: ((nodes at: 1) at: 37).
	result weakToken: ((nodes at: 1) at: 38).
	result unownedToken: ((nodes at: 1) at: 39).
	result unownedLeftParensafeRightParenToken: ((nodes at: 1) at: 40).
	result unownedLeftParenunsafeRightParenToken: ((nodes at: 1) at: 41).
	result addNodes: ((nodes at: 1) at: 42) to: result statements.
	result addTokens: ((nodes at: 1) at: 43) to: result dynamicTypeTokens.
	result addToken: (nodes at: 2) to: result periodTokens.
	result addToken: (nodes at: 3) to: result selfTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForprefix_expression2: nodes [
	| result |
	result := SwiftPrefixExpressionNode new.
	result addToken: (nodes at: 1) to: result operatorTokens.
	result addTokens: ((nodes at: 2) at: 1) to: result identifierTokens.
	result addTokens: ((nodes at: 2) at: 2) to: result lessThanTokens.
	result addTokens: ((nodes at: 2) at: 3) to: result commaTokens.
	result addTokens: ((nodes at: 2) at: 4) to: result greaterThanTokens.
	result
		addTokens: ((nodes at: 2) at: 5)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 2) at: 6)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 2) at: 7)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 2) at: 8) to: result leftBracketTokens.
	result addObjects: ((nodes at: 2) at: 9) to: result expressions.
	result
		addTokens: ((nodes at: 2) at: 10)
		to: result rightBracketTokens.
	result addObjects: ((nodes at: 2) at: 11) to: result keyExpressions.
	result addTokens: ((nodes at: 2) at: 12) to: result colonTokens.
	result addObjects: ((nodes at: 2) at: 13) to: result valueExpressions.
	result __FILE__Token: ((nodes at: 2) at: 14).
	result __LINE__Token: ((nodes at: 2) at: 15).
	result __COLUMN__Token: ((nodes at: 2) at: 16).
	result __FUNCTION__Token: ((nodes at: 2) at: 17).
	result addTokens: ((nodes at: 2) at: 18) to: result selfTokens.
	result addTokens: ((nodes at: 2) at: 19) to: result periodTokens.
	result addTokens: ((nodes at: 2) at: 20) to: result initTokens.
	result addTokens: ((nodes at: 2) at: 21) to: result leftBraceTokens.
	result addTokens: ((nodes at: 2) at: 22) to: result leftParenTokens.
	result addTokens: ((nodes at: 2) at: 23) to: result rightParenTokens.
	result addTokens: ((nodes at: 2) at: 24) to: result inoutTokens.
	result addTokens: ((nodes at: 2) at: 25) to: result letTokens.
	result addTokens: ((nodes at: 2) at: 26) to: result _Tokens.
	result addTokens: ((nodes at: 2) at: 27) to: result rightBraceTokens.
	result addTokens: ((nodes at: 2) at: 28) to: result operatorTokens.
	result addTokens: ((nodes at: 2) at: 29) to: result protocolTokens.
	result
		addTokens: ((nodes at: 2) at: 30)
		to: result minusGreaterThanTokens.
	result
		addTokens: ((nodes at: 2) at: 31)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 2) at: 32) to: result bangTokens.
	result addTokens: ((nodes at: 2) at: 33) to: result typeTokens.
	result
		addTokens: ((nodes at: 2) at: 34)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 2) at: 35) to: result equalTokens.
	result addTokens: ((nodes at: 2) at: 36) to: result varTokens.
	result inToken: ((nodes at: 2) at: 37).
	result weakToken: ((nodes at: 2) at: 38).
	result unownedToken: ((nodes at: 2) at: 39).
	result unownedLeftParensafeRightParenToken: ((nodes at: 2) at: 40).
	result unownedLeftParenunsafeRightParenToken: ((nodes at: 2) at: 41).
	result addNodes: ((nodes at: 2) at: 42) to: result statements.
	result addTokens: ((nodes at: 2) at: 43) to: result dynamicTypeTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForprefix_operator_declaration1: nodes [
	| result |
	result := SwiftPrefixOperatorDeclarationNode new.
	result addToken: (nodes at: 1) to: result operatorTokens.
	result prefixToken: (nodes at: 2).
	result addToken: (nodes at: 3) to: result operatorTokens.
	result leftBraceToken: (nodes at: 4).
	result rightBraceToken: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForprimary_expression1: nodes [
	| result |
	result := SwiftPrimaryExpressionNode new.
	result identifierToken: (nodes at: 1).
	result lessThanToken: ((nodes at: 2) at: 1).
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	result greaterThanToken: ((nodes at: 2) at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForprotocol_association_type_declaration1: nodes [
	| result |
	result := SwiftProtocolAssociationTypeDeclarationNode new.
	result typealiasToken: ((nodes at: 1) at: 1).
	result addToken: ((nodes at: 1) at: 2) to: result identifierTokens.
	result addToken: ((nodes at: 2) at: 1) to: result colonTokens.
	result addTokens: ((nodes at: 2) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 2) at: 3) to: result lessThanTokens.
	result addTokens: ((nodes at: 2) at: 4) to: result commaTokens.
	result addTokens: ((nodes at: 2) at: 5) to: result greaterThanTokens.
	result addTokens: ((nodes at: 2) at: 6) to: result periodTokens.
	result equalToken: ((nodes at: 3) at: 1).
	result addTokens: ((nodes at: 3) at: 2) to: result leftBracketTokens.
	result addTokens: ((nodes at: 3) at: 3) to: result identifierTokens.
	result addTokens: ((nodes at: 3) at: 4) to: result periodTokens.
	result addTokens: ((nodes at: 3) at: 5) to: result protocolTokens.
	result addTokens: ((nodes at: 3) at: 6) to: result lessThanTokens.
	result addTokens: ((nodes at: 3) at: 7) to: result greaterThanTokens.
	result addTokens: ((nodes at: 3) at: 8) to: result rightBracketTokens.
	result addTokens: ((nodes at: 3) at: 9) to: result colonTokens.
	result
		addTokens: ((nodes at: 3) at: 10)
		to: result minusGreaterThanTokens.
	result addTokens: ((nodes at: 3) at: 11) to: result commaTokens.
	result addTokens: ((nodes at: 3) at: 12) to: result leftParenTokens.
	result addTokens: ((nodes at: 3) at: 13) to: result rightParenTokens.
	result
		addTokens: ((nodes at: 3) at: 14)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 3) at: 15) to: result bangTokens.
	result addTokens: ((nodes at: 3) at: 16) to: result typeTokens.
	result
		addTokens: ((nodes at: 3) at: 17)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 3) at: 18) to: result inoutTokens.
	result addTokens: ((nodes at: 3) at: 19) to: result _Tokens.
	result addTokens: ((nodes at: 3) at: 20) to: result leftBraceTokens.
	result addTokens: ((nodes at: 3) at: 21) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 3) at: 22)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 3) at: 23)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 3) at: 24) to: result operatorTokens.
	result
		addTokens: ((nodes at: 3) at: 25)
		to: result full_string_literalTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForprotocol_composition_type1: nodes [
	| result |
	result := SwiftProtocolCompositionTypeNode new.
	result protocolToken: (nodes at: 1).
	result addToken: (nodes at: 2) to: result lessThanTokens.
	result addTokens: ((nodes at: 3) at: 1) to: result identifierTokens.
	result addTokens: ((nodes at: 3) at: 2) to: result lessThanTokens.
	result addTokens: ((nodes at: 3) at: 3) to: result commaTokens.
	result addTokens: ((nodes at: 3) at: 4) to: result greaterThanTokens.
	result addTokens: ((nodes at: 3) at: 5) to: result periodTokens.
	result addToken: (nodes at: 4) to: result greaterThanTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForprotocol_declaration1: nodes [
	| result |
	result := SwiftProtocolDeclarationNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 5) to: result leftBracketTokens.
	result addTokens: ((nodes at: 1) at: 6) to: result rightBracketTokens.
	result addTokens: ((nodes at: 1) at: 7) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 1) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 1) at: 11) to: result operatorTokens.
	result
		addTokens: ((nodes at: 1) at: 12)
		to: result full_string_literalTokens.
	result protocolToken: (nodes at: 2).
	result addToken: (nodes at: 3) to: result identifierTokens.
	result colonToken: ((nodes at: 4) at: 1).
	result addTokens: ((nodes at: 4) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 4) at: 3) to: result lessThanTokens.
	result addTokens: ((nodes at: 4) at: 4) to: result commaTokens.
	result addTokens: ((nodes at: 4) at: 5) to: result greaterThanTokens.
	result addTokens: ((nodes at: 4) at: 6) to: result periodTokens.
	result addToken: ((nodes at: 5) at: 1) to: result leftBraceTokens.
	result addNodes: ((nodes at: 5) at: 2) to: result declarations.
	result addToken: ((nodes at: 5) at: 3) to: result rightBraceTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForprotocol_initializer_declaration1: nodes [
	| result |
	result := SwiftProtocolInitializerDeclarationNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 5) to: result leftBracketTokens.
	result addTokens: ((nodes at: 1) at: 6) to: result rightBracketTokens.
	result addTokens: ((nodes at: 1) at: 7) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 1) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 1) at: 11) to: result operatorTokens.
	result
		addTokens: ((nodes at: 1) at: 12)
		to: result full_string_literalTokens.
	result convenienceToken: ((nodes at: 1) at: 13).
	result initToken: ((nodes at: 1) at: 14).
	result addTokens: ((nodes at: 2) at: 1) to: result lessThanTokens.
	result addTokens: ((nodes at: 2) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 2) at: 3) to: result colonTokens.
	result addTokens: ((nodes at: 2) at: 4) to: result commaTokens.
	result addTokens: ((nodes at: 2) at: 5) to: result greaterThanTokens.
	result addTokens: ((nodes at: 2) at: 6) to: result periodTokens.
	result addTokens: ((nodes at: 2) at: 7) to: result protocolTokens.
	result whereToken: ((nodes at: 2) at: 8).
	result addTokens: ((nodes at: 2) at: 9) to: result equalEqualTokens.
	result addTokens: ((nodes at: 3) at: 1) to: result leftParenTokens.
	result addTokens: ((nodes at: 3) at: 2) to: result rightParenTokens.
	result addTokens: ((nodes at: 3) at: 3) to: result inoutTokens.
	result addTokens: ((nodes at: 3) at: 4) to: result letTokens.
	result addTokens: ((nodes at: 3) at: 5) to: result _Tokens.
	result addTokens: ((nodes at: 3) at: 6) to: result identifierTokens.
	result addTokens: ((nodes at: 3) at: 7) to: result colonTokens.
	result addTokens: ((nodes at: 3) at: 8) to: result leftBracketTokens.
	result addTokens: ((nodes at: 3) at: 9) to: result rightBracketTokens.
	result addTokens: ((nodes at: 3) at: 10) to: result leftBraceTokens.
	result addTokens: ((nodes at: 3) at: 11) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 3) at: 12)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 3) at: 13)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 3) at: 14) to: result operatorTokens.
	result addTokens: ((nodes at: 3) at: 15) to: result periodTokens.
	result addTokens: ((nodes at: 3) at: 16) to: result protocolTokens.
	result addTokens: ((nodes at: 3) at: 17) to: result lessThanTokens.
	result addTokens: ((nodes at: 3) at: 18) to: result greaterThanTokens.
	result
		addTokens: ((nodes at: 3) at: 19)
		to: result minusGreaterThanTokens.
	result addTokens: ((nodes at: 3) at: 20) to: result commaTokens.
	result
		addTokens: ((nodes at: 3) at: 21)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 3) at: 22) to: result bangTokens.
	result addTokens: ((nodes at: 3) at: 23) to: result typeTokens.
	result
		addTokens: ((nodes at: 3) at: 24)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 3) at: 25) to: result equalTokens.
	result addObjects: ((nodes at: 3) at: 26) to: result expressions.
	result addTokens: ((nodes at: 3) at: 27) to: result varTokens.
	result
		addTokens: ((nodes at: 3) at: 28)
		to: result full_string_literalTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForprotocol_method_declaration1: nodes [
	| result |
	result := SwiftProtocolMethodDeclarationNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 5) to: result leftBracketTokens.
	result addTokens: ((nodes at: 1) at: 6) to: result rightBracketTokens.
	result addTokens: ((nodes at: 1) at: 7) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 1) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 1) at: 11) to: result operatorTokens.
	result
		addTokens: ((nodes at: 1) at: 12)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 1) at: 13) to: result classTokens.
	result addTokens: ((nodes at: 1) at: 14) to: result mutatingTokens.
	result addTokens: ((nodes at: 1) at: 15) to: result nonmutatingTokens.
	result addTokens: ((nodes at: 1) at: 16) to: result overrideTokens.
	result addTokens: ((nodes at: 1) at: 17) to: result staticTokens.
	result addTokens: ((nodes at: 1) at: 18) to: result unownedTokens.
	result
		addTokens: ((nodes at: 1) at: 19)
		to: result unownedLeftParensafeRightParenTokens.
	result
		addTokens: ((nodes at: 1) at: 20)
		to: result unownedLeftParenunsafeRightParenTokens.
	result addTokens: ((nodes at: 1) at: 21) to: result weakTokens.
	result funcToken: ((nodes at: 1) at: 22).
	result addToken: ((nodes at: 2) at: 1) to: result identifierTokens.
	result addToken: ((nodes at: 2) at: 2) to: result operatorTokens.
	result addTokens: ((nodes at: 3) at: 1) to: result lessThanTokens.
	result addTokens: ((nodes at: 3) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 3) at: 3) to: result colonTokens.
	result addTokens: ((nodes at: 3) at: 4) to: result commaTokens.
	result addTokens: ((nodes at: 3) at: 5) to: result greaterThanTokens.
	result addTokens: ((nodes at: 3) at: 6) to: result periodTokens.
	result addTokens: ((nodes at: 3) at: 7) to: result protocolTokens.
	result whereToken: ((nodes at: 3) at: 8).
	result addTokens: ((nodes at: 3) at: 9) to: result equalEqualTokens.
	result addTokens: ((nodes at: 4) at: 1) to: result leftParenTokens.
	result addTokens: ((nodes at: 4) at: 2) to: result rightParenTokens.
	result addTokens: ((nodes at: 4) at: 3) to: result commaTokens.
	result
		addTokens: ((nodes at: 4) at: 4)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 4) at: 5) to: result colonTokens.
	result addTokens: ((nodes at: 4) at: 6) to: result identifierTokens.
	result addTokens: ((nodes at: 4) at: 7) to: result periodTokens.
	result addTokens: ((nodes at: 4) at: 8) to: result protocolTokens.
	result addTokens: ((nodes at: 4) at: 9) to: result lessThanTokens.
	result addTokens: ((nodes at: 4) at: 10) to: result greaterThanTokens.
	result addTokens: ((nodes at: 4) at: 11) to: result varTokens.
	result addTokens: ((nodes at: 4) at: 12) to: result inoutTokens.
	result addTokens: ((nodes at: 4) at: 13) to: result letTokens.
	result addTokens: ((nodes at: 4) at: 14) to: result _Tokens.
	result addTokens: ((nodes at: 4) at: 15) to: result equalTokens.
	result addObjects: ((nodes at: 4) at: 16) to: result expressions.
	result addTokens: ((nodes at: 4) at: 17) to: result leftBracketTokens.
	result
		addTokens: ((nodes at: 4) at: 18)
		to: result rightBracketTokens.
	result
		addTokens: ((nodes at: 4) at: 19)
		to: result minusGreaterThanTokens.
	result
		addTokens: ((nodes at: 4) at: 20)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 4) at: 21) to: result bangTokens.
	result addTokens: ((nodes at: 4) at: 22) to: result typeTokens.
	result addTokens: ((nodes at: 4) at: 23) to: result leftBraceTokens.
	result addTokens: ((nodes at: 4) at: 24) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 4) at: 25)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 4) at: 26)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 4) at: 27) to: result operatorTokens.
	result
		addTokens: ((nodes at: 4) at: 28)
		to: result full_string_literalTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForprotocol_property_declaration1: nodes [
	| result |
	result := SwiftProtocolPropertyDeclarationNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 5) to: result leftBracketTokens.
	result addTokens: ((nodes at: 1) at: 6) to: result rightBracketTokens.
	result addTokens: ((nodes at: 1) at: 7) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 1) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 1) at: 11) to: result operatorTokens.
	result
		addTokens: ((nodes at: 1) at: 12)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 1) at: 13) to: result classTokens.
	result addTokens: ((nodes at: 1) at: 14) to: result mutatingTokens.
	result addTokens: ((nodes at: 1) at: 15) to: result nonmutatingTokens.
	result addTokens: ((nodes at: 1) at: 16) to: result overrideTokens.
	result addTokens: ((nodes at: 1) at: 17) to: result staticTokens.
	result addTokens: ((nodes at: 1) at: 18) to: result unownedTokens.
	result
		addTokens: ((nodes at: 1) at: 19)
		to: result unownedLeftParensafeRightParenTokens.
	result
		addTokens: ((nodes at: 1) at: 20)
		to: result unownedLeftParenunsafeRightParenTokens.
	result addTokens: ((nodes at: 1) at: 21) to: result weakTokens.
	result varToken: ((nodes at: 1) at: 22).
	result addToken: (nodes at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 3) at: 1) to: result colonTokens.
	result addTokens: ((nodes at: 3) at: 2) to: result _Tokens.
	result addTokens: ((nodes at: 3) at: 3) to: result identifierTokens.
	result addTokens: ((nodes at: 3) at: 4) to: result leftParenTokens.
	result addTokens: ((nodes at: 3) at: 5) to: result rightParenTokens.
	result addTokens: ((nodes at: 3) at: 6) to: result leftBracketTokens.
	result addTokens: ((nodes at: 3) at: 7) to: result rightBracketTokens.
	result addTokens: ((nodes at: 3) at: 8) to: result leftBraceTokens.
	result addTokens: ((nodes at: 3) at: 9) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 3) at: 10)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 3) at: 11)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 3) at: 12) to: result operatorTokens.
	result
		addTokens: ((nodes at: 3) at: 13)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 3) at: 14) to: result periodTokens.
	result addTokens: ((nodes at: 3) at: 15) to: result protocolTokens.
	result addTokens: ((nodes at: 3) at: 16) to: result lessThanTokens.
	result addTokens: ((nodes at: 3) at: 17) to: result greaterThanTokens.
	result
		addTokens: ((nodes at: 3) at: 18)
		to: result minusGreaterThanTokens.
	result addTokens: ((nodes at: 3) at: 19) to: result commaTokens.
	result
		addTokens: ((nodes at: 3) at: 20)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 3) at: 21) to: result bangTokens.
	result addTokens: ((nodes at: 3) at: 22) to: result typeTokens.
	result
		addTokens: ((nodes at: 3) at: 23)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 3) at: 24) to: result inoutTokens.
	result addTokens: ((nodes at: 4) at: 1) to: result leftBraceTokens.
	result addTokens: ((nodes at: 4) at: 2) to: result _Tokens.
	result addTokens: ((nodes at: 4) at: 3) to: result identifierTokens.
	result addTokens: ((nodes at: 4) at: 4) to: result leftParenTokens.
	result addTokens: ((nodes at: 4) at: 5) to: result rightParenTokens.
	result addTokens: ((nodes at: 4) at: 6) to: result leftBracketTokens.
	result addTokens: ((nodes at: 4) at: 7) to: result rightBracketTokens.
	result addTokens: ((nodes at: 4) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 4) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 4) at: 10)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 4) at: 11) to: result operatorTokens.
	result
		addTokens: ((nodes at: 4) at: 12)
		to: result full_string_literalTokens.
	result getToken: ((nodes at: 4) at: 13).
	result setToken: ((nodes at: 4) at: 14).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForprotocol_subscript_declaration1: nodes [
	| result |
	result := SwiftProtocolSubscriptDeclarationNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 5) to: result leftBracketTokens.
	result addTokens: ((nodes at: 1) at: 6) to: result rightBracketTokens.
	result addTokens: ((nodes at: 1) at: 7) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 1) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 1) at: 11) to: result operatorTokens.
	result
		addTokens: ((nodes at: 1) at: 12)
		to: result full_string_literalTokens.
	result subscriptToken: ((nodes at: 1) at: 13).
	result addTokens: ((nodes at: 1) at: 14) to: result inoutTokens.
	result addTokens: ((nodes at: 1) at: 15) to: result letTokens.
	result addTokens: ((nodes at: 1) at: 16) to: result colonTokens.
	result addTokens: ((nodes at: 1) at: 17) to: result periodTokens.
	result addTokens: ((nodes at: 1) at: 18) to: result protocolTokens.
	result addTokens: ((nodes at: 1) at: 19) to: result lessThanTokens.
	result addTokens: ((nodes at: 1) at: 20) to: result greaterThanTokens.
	result
		addTokens: ((nodes at: 1) at: 21)
		to: result minusGreaterThanTokens.
	result addTokens: ((nodes at: 1) at: 22) to: result commaTokens.
	result
		addTokens: ((nodes at: 1) at: 23)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 1) at: 24) to: result bangTokens.
	result addTokens: ((nodes at: 1) at: 25) to: result typeTokens.
	result
		addTokens: ((nodes at: 1) at: 26)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 1) at: 27) to: result equalTokens.
	result addObjects: ((nodes at: 1) at: 28) to: result expressions.
	result addTokens: ((nodes at: 1) at: 29) to: result varTokens.
	result
		addTokens: ((nodes at: 2) at: 1)
		to: result minusGreaterThanTokens.
	result addTokens: ((nodes at: 2) at: 2) to: result _Tokens.
	result addTokens: ((nodes at: 2) at: 3) to: result identifierTokens.
	result addTokens: ((nodes at: 2) at: 4) to: result leftParenTokens.
	result addTokens: ((nodes at: 2) at: 5) to: result rightParenTokens.
	result addTokens: ((nodes at: 2) at: 6) to: result leftBracketTokens.
	result addTokens: ((nodes at: 2) at: 7) to: result rightBracketTokens.
	result addTokens: ((nodes at: 2) at: 8) to: result leftBraceTokens.
	result addTokens: ((nodes at: 2) at: 9) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 2) at: 10)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 2) at: 11)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 2) at: 12) to: result operatorTokens.
	result
		addTokens: ((nodes at: 2) at: 13)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 2) at: 14) to: result periodTokens.
	result addTokens: ((nodes at: 2) at: 15) to: result protocolTokens.
	result addTokens: ((nodes at: 2) at: 16) to: result lessThanTokens.
	result addTokens: ((nodes at: 2) at: 17) to: result greaterThanTokens.
	result addTokens: ((nodes at: 2) at: 18) to: result colonTokens.
	result addTokens: ((nodes at: 2) at: 19) to: result commaTokens.
	result
		addTokens: ((nodes at: 2) at: 20)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 2) at: 21) to: result bangTokens.
	result addTokens: ((nodes at: 2) at: 22) to: result typeTokens.
	result
		addTokens: ((nodes at: 2) at: 23)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 2) at: 24) to: result inoutTokens.
	result addTokens: ((nodes at: 3) at: 1) to: result leftBraceTokens.
	result addTokens: ((nodes at: 3) at: 2) to: result _Tokens.
	result addTokens: ((nodes at: 3) at: 3) to: result identifierTokens.
	result addTokens: ((nodes at: 3) at: 4) to: result leftParenTokens.
	result addTokens: ((nodes at: 3) at: 5) to: result rightParenTokens.
	result addTokens: ((nodes at: 3) at: 6) to: result leftBracketTokens.
	result addTokens: ((nodes at: 3) at: 7) to: result rightBracketTokens.
	result addTokens: ((nodes at: 3) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 3) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 3) at: 10)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 3) at: 11) to: result operatorTokens.
	result
		addTokens: ((nodes at: 3) at: 12)
		to: result full_string_literalTokens.
	result getToken: ((nodes at: 3) at: 13).
	result setToken: ((nodes at: 3) at: 14).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForraw_value_style_enum1: nodes [
	| result |
	result := Array new: 57.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	result at: 30 put: (OrderedCollection new: 2).
	result at: 31 put: (OrderedCollection new: 2).
	result at: 32 put: (OrderedCollection new: 2).
	result at: 33 put: (OrderedCollection new: 2).
	result at: 34 put: (OrderedCollection new: 2).
	result at: 35 put: (OrderedCollection new: 2).
	result at: 36 put: (OrderedCollection new: 2).
	result at: 37 put: (OrderedCollection new: 2).
	result at: 38 put: (OrderedCollection new: 2).
	result at: 39 put: (OrderedCollection new: 2).
	result at: 40 put: (OrderedCollection new: 2).
	result at: 41 put: (OrderedCollection new: 2).
	result at: 42 put: (OrderedCollection new: 2).
	result at: 43 put: (OrderedCollection new: 2).
	result at: 44 put: (OrderedCollection new: 2).
	result at: 45 put: (OrderedCollection new: 2).
	result at: 46 put: (OrderedCollection new: 2).
	result at: 47 put: (OrderedCollection new: 2).
	result at: 48 put: (OrderedCollection new: 2).
	result at: 49 put: (OrderedCollection new: 2).
	result at: 50 put: (OrderedCollection new: 2).
	result at: 51 put: (OrderedCollection new: 2).
	result at: 52 put: (OrderedCollection new: 2).
	result at: 53 put: (OrderedCollection new: 2).
	result at: 54 put: (OrderedCollection new: 2).
	result at: 55 put: (OrderedCollection new: 2).
	result at: 56 put: (OrderedCollection new: 2).
	result at: 57 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 7).
	self add: ((nodes at: 2) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 9).
	self add: (nodes at: 3) to: (result at: 3).
	self add: (nodes at: 5) to: (result at: 10).
	self addAll: ((nodes at: 6) at: 1) to: (result at: 11).
	self addAll: ((nodes at: 6) at: 2) to: (result at: 1).
	self addAll: ((nodes at: 6) at: 3) to: (result at: 12).
	self addAll: ((nodes at: 6) at: 4) to: (result at: 13).
	self addAll: ((nodes at: 6) at: 5) to: (result at: 32).
	self addAll: ((nodes at: 6) at: 6) to: (result at: 33).
	self addAll: ((nodes at: 6) at: 7) to: (result at: 10).
	self addAll: ((nodes at: 6) at: 8) to: (result at: 43).
	self addAll: ((nodes at: 6) at: 9) to: (result at: 55).
	self addAll: ((nodes at: 6) at: 10) to: (result at: 56).
	self addAll: ((nodes at: 6) at: 11) to: (result at: 21).
	self addAll: ((nodes at: 6) at: 12) to: (result at: 14).
	self addAll: ((nodes at: 6) at: 13) to: (result at: 15).
	self addAll: ((nodes at: 6) at: 14) to: (result at: 16).
	self addAll: ((nodes at: 6) at: 15) to: (result at: 17).
	self addAll: ((nodes at: 6) at: 16) to: (result at: 18).
	self addAll: ((nodes at: 6) at: 17) to: (result at: 7).
	self addAll: ((nodes at: 6) at: 18) to: (result at: 19).
	self addAll: ((nodes at: 6) at: 19) to: (result at: 20).
	self addAll: ((nodes at: 6) at: 20) to: (result at: 6).
	self addAll: ((nodes at: 6) at: 21) to: (result at: 22).
	self addAll: ((nodes at: 6) at: 22) to: (result at: 23).
	self addAll: ((nodes at: 6) at: 23) to: (result at: 24).
	self addAll: ((nodes at: 6) at: 24) to: (result at: 25).
	self addAll: ((nodes at: 6) at: 25) to: (result at: 26).
	self addAll: ((nodes at: 6) at: 26) to: (result at: 27).
	self addAll: ((nodes at: 6) at: 27) to: (result at: 28).
	self addAll: ((nodes at: 6) at: 28) to: (result at: 29).
	self addAll: ((nodes at: 6) at: 29) to: (result at: 30).
	self addAll: ((nodes at: 6) at: 30) to: (result at: 31).
	self addAll: ((nodes at: 6) at: 31) to: (result at: 4).
	self addAll: ((nodes at: 6) at: 32) to: (result at: 3).
	self addAll: ((nodes at: 6) at: 33) to: (result at: 2).
	self addAll: ((nodes at: 6) at: 34) to: (result at: 5).
	self addAll: ((nodes at: 6) at: 35) to: (result at: 34).
	self addAll: ((nodes at: 6) at: 36) to: (result at: 35).
	self addAll: ((nodes at: 6) at: 37) to: (result at: 36).
	self addAll: ((nodes at: 6) at: 38) to: (result at: 37).
	self addAll: ((nodes at: 6) at: 39) to: (result at: 38).
	self addAll: ((nodes at: 6) at: 40) to: (result at: 39).
	self addAll: ((nodes at: 6) at: 41) to: (result at: 40).
	self addAll: ((nodes at: 6) at: 42) to: (result at: 41).
	self addAll: ((nodes at: 6) at: 43) to: (result at: 42).
	self addAll: ((nodes at: 6) at: 44) to: (result at: 44).
	self addAll: ((nodes at: 6) at: 45) to: (result at: 45).
	self addAll: ((nodes at: 6) at: 46) to: (result at: 46).
	self addAll: ((nodes at: 6) at: 47) to: (result at: 47).
	self addAll: ((nodes at: 6) at: 48) to: (result at: 8).
	self addAll: ((nodes at: 6) at: 49) to: (result at: 9).
	self addAll: ((nodes at: 6) at: 50) to: (result at: 48).
	self addAll: ((nodes at: 6) at: 51) to: (result at: 54).
	self addAll: ((nodes at: 6) at: 52) to: (result at: 49).
	self addAll: ((nodes at: 6) at: 53) to: (result at: 50).
	self addAll: ((nodes at: 6) at: 54) to: (result at: 51).
	self addAll: ((nodes at: 6) at: 55) to: (result at: 52).
	self addAll: ((nodes at: 6) at: 56) to: (result at: 53).
	self addAll: ((nodes at: 6) at: 57) to: (result at: 57).
	self add: (nodes at: 7) to: (result at: 43).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForraw_value_style_enum_case1: nodes [
	| result |
	result := Array new: 5.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: ((nodes at: 2) at: 1).
	result at: 3 put: ((nodes at: 2) at: 2).
	result at: 4 put: ((nodes at: 2) at: 3).
	result at: 5 put: ((nodes at: 2) at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForraw_value_style_enum_case_clause1: nodes [
	| result |
	result := Array new: 15.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 1) at: 7) to: (result at: 7).
	self addAll: ((nodes at: 1) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 1) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 1) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 1) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 1) at: 12) to: (result at: 14).
	result at: 12 put: (nodes at: 2).
	self addAll: ((nodes at: 3) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 3) at: 2) to: (result at: 13).
	self addAll: ((nodes at: 3) at: 3) to: (result at: 9).
	self addAll: ((nodes at: 3) at: 4) to: (result at: 10).
	self addAll: ((nodes at: 3) at: 5) to: (result at: 14).
	self addAll: ((nodes at: 3) at: 6) to: (result at: 15).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForraw_value_style_enum_case_list1: nodes [
	| result |
	result := Array new: 6.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	self add: ((nodes at: 1) at: 1) to: (result at: 1).
	self add: ((nodes at: 1) at: 2) to: (result at: 2).
	self add: ((nodes at: 1) at: 3) to: (result at: 3).
	self add: ((nodes at: 1) at: 4) to: (result at: 4).
	self add: ((nodes at: 1) at: 5) to: (result at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForraw_value_style_enum_case_list2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 6).
	self add: ((nodes at: 3) at: 1) to: (result at: 1).
	self add: ((nodes at: 3) at: 2) to: (result at: 2).
	self add: ((nodes at: 3) at: 3) to: (result at: 3).
	self add: ((nodes at: 3) at: 4) to: (result at: 4).
	self add: ((nodes at: 3) at: 5) to: (result at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForraw_value_style_enum_member2: nodes [
	| result |
	result := Array new: 57.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	result at: 30 put: (OrderedCollection new: 2).
	result at: 31 put: (OrderedCollection new: 2).
	result at: 32 put: (OrderedCollection new: 2).
	result at: 33 put: (OrderedCollection new: 2).
	result at: 34 put: (OrderedCollection new: 2).
	result at: 35 put: (OrderedCollection new: 2).
	result at: 36 put: (OrderedCollection new: 2).
	result at: 37 put: (OrderedCollection new: 2).
	result at: 38 put: (OrderedCollection new: 2).
	result at: 39 put: (OrderedCollection new: 2).
	result at: 40 put: (OrderedCollection new: 2).
	result at: 41 put: (OrderedCollection new: 2).
	result at: 42 put: (OrderedCollection new: 2).
	result at: 43 put: (OrderedCollection new: 2).
	result at: 44 put: (OrderedCollection new: 2).
	result at: 45 put: (OrderedCollection new: 2).
	result at: 46 put: (OrderedCollection new: 2).
	result at: 47 put: (OrderedCollection new: 2).
	result at: 48 put: (OrderedCollection new: 2).
	result at: 49 put: (OrderedCollection new: 2).
	result at: 50 put: (OrderedCollection new: 2).
	result at: 51 put: (OrderedCollection new: 2).
	result at: 52 put: (OrderedCollection new: 2).
	result at: 53 put: (OrderedCollection new: 2).
	result at: 54 put: (OrderedCollection new: 2).
	result at: 55 put: (OrderedCollection new: 2).
	result at: 56 put: (OrderedCollection new: 2).
	result at: 57 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 1) at: 7) to: (result at: 7).
	self addAll: ((nodes at: 1) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 1) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 1) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 1) at: 11) to: (result at: 11).
	self add: ((nodes at: 1) at: 12) to: (result at: 57).
	self addAll: ((nodes at: 1) at: 13) to: (result at: 44).
	self addAll: ((nodes at: 1) at: 14) to: (result at: 50).
	self addAll: ((nodes at: 1) at: 15) to: (result at: 31).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForraw_value_style_enum_members2: nodes [
	| result |
	result := nodes at: 1.
	self addAll: ((nodes at: 2) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 2) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 2) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 2) at: 12) to: (result at: 12).
	self addAll: ((nodes at: 2) at: 13) to: (result at: 13).
	self addAll: ((nodes at: 2) at: 14) to: (result at: 14).
	self addAll: ((nodes at: 2) at: 15) to: (result at: 15).
	self addAll: ((nodes at: 2) at: 16) to: (result at: 16).
	self addAll: ((nodes at: 2) at: 17) to: (result at: 17).
	self addAll: ((nodes at: 2) at: 18) to: (result at: 18).
	self addAll: ((nodes at: 2) at: 19) to: (result at: 19).
	self addAll: ((nodes at: 2) at: 20) to: (result at: 20).
	self addAll: ((nodes at: 2) at: 21) to: (result at: 21).
	self addAll: ((nodes at: 2) at: 22) to: (result at: 22).
	self addAll: ((nodes at: 2) at: 23) to: (result at: 23).
	self addAll: ((nodes at: 2) at: 24) to: (result at: 24).
	self addAll: ((nodes at: 2) at: 25) to: (result at: 25).
	self addAll: ((nodes at: 2) at: 26) to: (result at: 26).
	self addAll: ((nodes at: 2) at: 27) to: (result at: 27).
	self addAll: ((nodes at: 2) at: 28) to: (result at: 28).
	self addAll: ((nodes at: 2) at: 29) to: (result at: 29).
	self addAll: ((nodes at: 2) at: 30) to: (result at: 30).
	self addAll: ((nodes at: 2) at: 31) to: (result at: 31).
	self addAll: ((nodes at: 2) at: 32) to: (result at: 32).
	self addAll: ((nodes at: 2) at: 33) to: (result at: 33).
	self addAll: ((nodes at: 2) at: 34) to: (result at: 34).
	self addAll: ((nodes at: 2) at: 35) to: (result at: 35).
	self addAll: ((nodes at: 2) at: 36) to: (result at: 36).
	self addAll: ((nodes at: 2) at: 37) to: (result at: 37).
	self addAll: ((nodes at: 2) at: 38) to: (result at: 38).
	self addAll: ((nodes at: 2) at: 39) to: (result at: 39).
	self addAll: ((nodes at: 2) at: 40) to: (result at: 40).
	self addAll: ((nodes at: 2) at: 41) to: (result at: 41).
	self addAll: ((nodes at: 2) at: 42) to: (result at: 42).
	self addAll: ((nodes at: 2) at: 43) to: (result at: 43).
	self addAll: ((nodes at: 2) at: 44) to: (result at: 44).
	self addAll: ((nodes at: 2) at: 45) to: (result at: 45).
	self addAll: ((nodes at: 2) at: 46) to: (result at: 46).
	self addAll: ((nodes at: 2) at: 47) to: (result at: 47).
	self addAll: ((nodes at: 2) at: 48) to: (result at: 48).
	self addAll: ((nodes at: 2) at: 49) to: (result at: 49).
	self addAll: ((nodes at: 2) at: 50) to: (result at: 57).
	self addAll: ((nodes at: 2) at: 51) to: (result at: 50).
	self addAll: ((nodes at: 2) at: 52) to: (result at: 51).
	self addAll: ((nodes at: 2) at: 53) to: (result at: 52).
	self addAll: ((nodes at: 2) at: 54) to: (result at: 53).
	self addAll: ((nodes at: 2) at: 55) to: (result at: 54).
	self addAll: ((nodes at: 2) at: 56) to: (result at: 55).
	self addAll: ((nodes at: 2) at: 57) to: (result at: 56).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForrequirement1: nodes [
	| result |
	result := Array new: 8.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 5).
	result at: 6 put: ((nodes at: 1) at: 6).
	result at: 7 put: ((nodes at: 1) at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForrequirement2: nodes [
	| result |
	result := Array new: 8.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 5).
	result at: 8 put: ((nodes at: 1) at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForrequirement_clause1: nodes [
	| result |
	result := Array new: 9.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 8) to: (result at: 9).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForrequirement_list1: nodes [
	| result |
	result := Array new: 8.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 5).
	self add: ((nodes at: 1) at: 6) to: (result at: 6).
	self add: ((nodes at: 1) at: 7) to: (result at: 7).
	self add: ((nodes at: 1) at: 8) to: (result at: 8).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForrequirement_list2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 3).
	self addAll: ((nodes at: 3) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 3) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 3) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 3) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 3) at: 5) to: (result at: 5).
	self add: ((nodes at: 3) at: 6) to: (result at: 6).
	self add: ((nodes at: 3) at: 7) to: (result at: 7).
	self add: ((nodes at: 3) at: 8) to: (result at: 8).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForreturn_statement1: nodes [
	| result |
	result := SwiftReturnStatementNode new.
	result returnToken: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForsame_type_requirement1: nodes [
	| result |
	result := Array new: 6.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForself_expression1: nodes [
	| result |
	result := SwiftSelfExpressionNode new.
	result selfToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForself_expression2: nodes [
	| result |
	result := SwiftSelfExpressionNode new.
	result selfToken: (nodes at: 1).
	result periodToken: (nodes at: 2).
	result identifierToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForself_expression3: nodes [
	| result |
	result := SwiftSelfExpressionNode new.
	result selfToken: (nodes at: 1).
	result leftBracketToken: (nodes at: 2).
	result expression: (nodes at: 3).
	result rightBracketToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForself_expression4: nodes [
	| result |
	result := SwiftSelfExpressionNode new.
	result selfToken: (nodes at: 1).
	result periodToken: (nodes at: 2).
	result initToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForsetter_clause1: nodes [
	| result |
	result := Array new: 14.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 1) at: 7) to: (result at: 7).
	self addAll: ((nodes at: 1) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 1) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 1) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 1) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 1) at: 12) to: (result at: 12).
	result at: 13 put: (nodes at: 2).
	self add: ((nodes at: 3) at: 1) to: (result at: 3).
	self add: ((nodes at: 3) at: 2) to: (result at: 2).
	self add: ((nodes at: 3) at: 3) to: (result at: 4).
	result at: 14 put: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForstatement1: nodes [
	| result |
	result := SwiftExpressionStatementNode new.
	result expression: (nodes at: 1).
	result semicolonToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForstatement2: nodes [
	| result |
	result := SwiftDeclarationStatementNode new.
	result declaration: (nodes at: 1).
	result semicolonToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForstatement3: nodes [
	| result |
	result := nodes at: 1.
	result semicolonToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForstatements1: nodes [
	| result |
	result := OrderedCollection new: 2.
	self add: (nodes at: 1) to: result.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForstatements2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: result.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForstruct_declaration1: nodes [
	| result |
	result := SwiftStructDeclarationNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 5) to: result leftBracketTokens.
	result addTokens: ((nodes at: 1) at: 6) to: result rightBracketTokens.
	result addTokens: ((nodes at: 1) at: 7) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 1) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 1) at: 11) to: result operatorTokens.
	result
		addTokens: ((nodes at: 1) at: 12)
		to: result full_string_literalTokens.
	result structToken: (nodes at: 2).
	result addToken: (nodes at: 3) to: result identifierTokens.
	result addTokens: ((nodes at: 4) at: 1) to: result lessThanTokens.
	result addTokens: ((nodes at: 4) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 4) at: 3) to: result colonTokens.
	result addTokens: ((nodes at: 4) at: 4) to: result commaTokens.
	result addTokens: ((nodes at: 4) at: 5) to: result greaterThanTokens.
	result addTokens: ((nodes at: 4) at: 6) to: result periodTokens.
	result addTokens: ((nodes at: 4) at: 7) to: result protocolTokens.
	result whereToken: ((nodes at: 4) at: 8).
	result addTokens: ((nodes at: 4) at: 9) to: result equalEqualTokens.
	result addToken: ((nodes at: 5) at: 1) to: result colonTokens.
	result addTokens: ((nodes at: 5) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 5) at: 3) to: result lessThanTokens.
	result addTokens: ((nodes at: 5) at: 4) to: result commaTokens.
	result addTokens: ((nodes at: 5) at: 5) to: result greaterThanTokens.
	result addTokens: ((nodes at: 5) at: 6) to: result periodTokens.
	result addToken: ((nodes at: 6) at: 1) to: result leftBraceTokens.
	result addNodes: ((nodes at: 6) at: 2) to: result declarations.
	result addToken: ((nodes at: 6) at: 3) to: result rightBraceTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForsubscript_declaration1: nodes [
	| result |
	result := SwiftSubscriptDeclarationNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 5) to: result leftBracketTokens.
	result addTokens: ((nodes at: 1) at: 6) to: result rightBracketTokens.
	result addTokens: ((nodes at: 1) at: 7) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 1) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 1) at: 11) to: result operatorTokens.
	result
		addTokens: ((nodes at: 1) at: 12)
		to: result full_string_literalTokens.
	result subscriptToken: ((nodes at: 1) at: 13).
	result addTokens: ((nodes at: 1) at: 14) to: result inoutTokens.
	result addTokens: ((nodes at: 1) at: 15) to: result letTokens.
	result addTokens: ((nodes at: 1) at: 16) to: result colonTokens.
	result addTokens: ((nodes at: 1) at: 17) to: result periodTokens.
	result addTokens: ((nodes at: 1) at: 18) to: result protocolTokens.
	result addTokens: ((nodes at: 1) at: 19) to: result lessThanTokens.
	result addTokens: ((nodes at: 1) at: 20) to: result greaterThanTokens.
	result
		addTokens: ((nodes at: 1) at: 21)
		to: result minusGreaterThanTokens.
	result addTokens: ((nodes at: 1) at: 22) to: result commaTokens.
	result
		addTokens: ((nodes at: 1) at: 23)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 1) at: 24) to: result bangTokens.
	result addTokens: ((nodes at: 1) at: 25) to: result typeTokens.
	result
		addTokens: ((nodes at: 1) at: 26)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 1) at: 27) to: result equalTokens.
	result addObjects: ((nodes at: 1) at: 28) to: result expressions.
	result addTokens: ((nodes at: 1) at: 29) to: result varTokens.
	result
		addTokens: ((nodes at: 2) at: 1)
		to: result minusGreaterThanTokens.
	result addTokens: ((nodes at: 2) at: 2) to: result _Tokens.
	result addTokens: ((nodes at: 2) at: 3) to: result identifierTokens.
	result addTokens: ((nodes at: 2) at: 4) to: result leftParenTokens.
	result addTokens: ((nodes at: 2) at: 5) to: result rightParenTokens.
	result addTokens: ((nodes at: 2) at: 6) to: result leftBracketTokens.
	result addTokens: ((nodes at: 2) at: 7) to: result rightBracketTokens.
	result addTokens: ((nodes at: 2) at: 8) to: result leftBraceTokens.
	result addTokens: ((nodes at: 2) at: 9) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 2) at: 10)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 2) at: 11)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 2) at: 12) to: result operatorTokens.
	result
		addTokens: ((nodes at: 2) at: 13)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 2) at: 14) to: result periodTokens.
	result addTokens: ((nodes at: 2) at: 15) to: result protocolTokens.
	result addTokens: ((nodes at: 2) at: 16) to: result lessThanTokens.
	result addTokens: ((nodes at: 2) at: 17) to: result greaterThanTokens.
	result addTokens: ((nodes at: 2) at: 18) to: result colonTokens.
	result addTokens: ((nodes at: 2) at: 19) to: result commaTokens.
	result
		addTokens: ((nodes at: 2) at: 20)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 2) at: 21) to: result bangTokens.
	result addTokens: ((nodes at: 2) at: 22) to: result typeTokens.
	result
		addTokens: ((nodes at: 2) at: 23)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 2) at: 24) to: result inoutTokens.
	result addNode: (nodes at: 3) to: result blocks.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForsubscript_declaration2: nodes [
	| result |
	result := SwiftSubscriptDeclarationNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 5) to: result leftBracketTokens.
	result addTokens: ((nodes at: 1) at: 6) to: result rightBracketTokens.
	result addTokens: ((nodes at: 1) at: 7) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 1) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 1) at: 11) to: result operatorTokens.
	result
		addTokens: ((nodes at: 1) at: 12)
		to: result full_string_literalTokens.
	result subscriptToken: ((nodes at: 1) at: 13).
	result addTokens: ((nodes at: 1) at: 14) to: result inoutTokens.
	result addTokens: ((nodes at: 1) at: 15) to: result letTokens.
	result addTokens: ((nodes at: 1) at: 16) to: result colonTokens.
	result addTokens: ((nodes at: 1) at: 17) to: result periodTokens.
	result addTokens: ((nodes at: 1) at: 18) to: result protocolTokens.
	result addTokens: ((nodes at: 1) at: 19) to: result lessThanTokens.
	result addTokens: ((nodes at: 1) at: 20) to: result greaterThanTokens.
	result
		addTokens: ((nodes at: 1) at: 21)
		to: result minusGreaterThanTokens.
	result addTokens: ((nodes at: 1) at: 22) to: result commaTokens.
	result
		addTokens: ((nodes at: 1) at: 23)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 1) at: 24) to: result bangTokens.
	result addTokens: ((nodes at: 1) at: 25) to: result typeTokens.
	result
		addTokens: ((nodes at: 1) at: 26)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 1) at: 27) to: result equalTokens.
	result addObjects: ((nodes at: 1) at: 28) to: result expressions.
	result addTokens: ((nodes at: 1) at: 29) to: result varTokens.
	result
		addTokens: ((nodes at: 2) at: 1)
		to: result minusGreaterThanTokens.
	result addTokens: ((nodes at: 2) at: 2) to: result _Tokens.
	result addTokens: ((nodes at: 2) at: 3) to: result identifierTokens.
	result addTokens: ((nodes at: 2) at: 4) to: result leftParenTokens.
	result addTokens: ((nodes at: 2) at: 5) to: result rightParenTokens.
	result addTokens: ((nodes at: 2) at: 6) to: result leftBracketTokens.
	result addTokens: ((nodes at: 2) at: 7) to: result rightBracketTokens.
	result addTokens: ((nodes at: 2) at: 8) to: result leftBraceTokens.
	result addTokens: ((nodes at: 2) at: 9) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 2) at: 10)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 2) at: 11)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 2) at: 12) to: result operatorTokens.
	result
		addTokens: ((nodes at: 2) at: 13)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 2) at: 14) to: result periodTokens.
	result addTokens: ((nodes at: 2) at: 15) to: result protocolTokens.
	result addTokens: ((nodes at: 2) at: 16) to: result lessThanTokens.
	result addTokens: ((nodes at: 2) at: 17) to: result greaterThanTokens.
	result addTokens: ((nodes at: 2) at: 18) to: result colonTokens.
	result addTokens: ((nodes at: 2) at: 19) to: result commaTokens.
	result
		addTokens: ((nodes at: 2) at: 20)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 2) at: 21) to: result bangTokens.
	result addTokens: ((nodes at: 2) at: 22) to: result typeTokens.
	result
		addTokens: ((nodes at: 2) at: 23)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 2) at: 24) to: result inoutTokens.
	result addTokens: ((nodes at: 3) at: 1) to: result leftBraceTokens.
	result addTokens: ((nodes at: 3) at: 2) to: result _Tokens.
	result addTokens: ((nodes at: 3) at: 3) to: result identifierTokens.
	result addTokens: ((nodes at: 3) at: 4) to: result leftParenTokens.
	result addTokens: ((nodes at: 3) at: 5) to: result rightParenTokens.
	result addTokens: ((nodes at: 3) at: 6) to: result leftBracketTokens.
	result addTokens: ((nodes at: 3) at: 7) to: result rightBracketTokens.
	result addTokens: ((nodes at: 3) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 3) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 3) at: 10)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 3) at: 11) to: result operatorTokens.
	result
		addTokens: ((nodes at: 3) at: 12)
		to: result full_string_literalTokens.
	result getToken: ((nodes at: 3) at: 13).
	result addNodes: ((nodes at: 3) at: 14) to: result blocks.
	result setToken: ((nodes at: 3) at: 15).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForsubscript_declaration3: nodes [
	| result |
	result := SwiftSubscriptDeclarationNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 5) to: result leftBracketTokens.
	result addTokens: ((nodes at: 1) at: 6) to: result rightBracketTokens.
	result addTokens: ((nodes at: 1) at: 7) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 1) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 1) at: 11) to: result operatorTokens.
	result
		addTokens: ((nodes at: 1) at: 12)
		to: result full_string_literalTokens.
	result subscriptToken: ((nodes at: 1) at: 13).
	result addTokens: ((nodes at: 1) at: 14) to: result inoutTokens.
	result addTokens: ((nodes at: 1) at: 15) to: result letTokens.
	result addTokens: ((nodes at: 1) at: 16) to: result colonTokens.
	result addTokens: ((nodes at: 1) at: 17) to: result periodTokens.
	result addTokens: ((nodes at: 1) at: 18) to: result protocolTokens.
	result addTokens: ((nodes at: 1) at: 19) to: result lessThanTokens.
	result addTokens: ((nodes at: 1) at: 20) to: result greaterThanTokens.
	result
		addTokens: ((nodes at: 1) at: 21)
		to: result minusGreaterThanTokens.
	result addTokens: ((nodes at: 1) at: 22) to: result commaTokens.
	result
		addTokens: ((nodes at: 1) at: 23)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 1) at: 24) to: result bangTokens.
	result addTokens: ((nodes at: 1) at: 25) to: result typeTokens.
	result
		addTokens: ((nodes at: 1) at: 26)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 1) at: 27) to: result equalTokens.
	result addObjects: ((nodes at: 1) at: 28) to: result expressions.
	result addTokens: ((nodes at: 1) at: 29) to: result varTokens.
	result
		addTokens: ((nodes at: 2) at: 1)
		to: result minusGreaterThanTokens.
	result addTokens: ((nodes at: 2) at: 2) to: result _Tokens.
	result addTokens: ((nodes at: 2) at: 3) to: result identifierTokens.
	result addTokens: ((nodes at: 2) at: 4) to: result leftParenTokens.
	result addTokens: ((nodes at: 2) at: 5) to: result rightParenTokens.
	result addTokens: ((nodes at: 2) at: 6) to: result leftBracketTokens.
	result addTokens: ((nodes at: 2) at: 7) to: result rightBracketTokens.
	result addTokens: ((nodes at: 2) at: 8) to: result leftBraceTokens.
	result addTokens: ((nodes at: 2) at: 9) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 2) at: 10)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 2) at: 11)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 2) at: 12) to: result operatorTokens.
	result
		addTokens: ((nodes at: 2) at: 13)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 2) at: 14) to: result periodTokens.
	result addTokens: ((nodes at: 2) at: 15) to: result protocolTokens.
	result addTokens: ((nodes at: 2) at: 16) to: result lessThanTokens.
	result addTokens: ((nodes at: 2) at: 17) to: result greaterThanTokens.
	result addTokens: ((nodes at: 2) at: 18) to: result colonTokens.
	result addTokens: ((nodes at: 2) at: 19) to: result commaTokens.
	result
		addTokens: ((nodes at: 2) at: 20)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 2) at: 21) to: result bangTokens.
	result addTokens: ((nodes at: 2) at: 22) to: result typeTokens.
	result
		addTokens: ((nodes at: 2) at: 23)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 2) at: 24) to: result inoutTokens.
	result addTokens: ((nodes at: 3) at: 1) to: result leftBraceTokens.
	result addTokens: ((nodes at: 3) at: 2) to: result _Tokens.
	result addTokens: ((nodes at: 3) at: 3) to: result identifierTokens.
	result addTokens: ((nodes at: 3) at: 4) to: result leftParenTokens.
	result addTokens: ((nodes at: 3) at: 5) to: result rightParenTokens.
	result addTokens: ((nodes at: 3) at: 6) to: result leftBracketTokens.
	result addTokens: ((nodes at: 3) at: 7) to: result rightBracketTokens.
	result addTokens: ((nodes at: 3) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 3) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 3) at: 10)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 3) at: 11) to: result operatorTokens.
	result
		addTokens: ((nodes at: 3) at: 12)
		to: result full_string_literalTokens.
	result getToken: ((nodes at: 3) at: 13).
	result setToken: ((nodes at: 3) at: 14).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForsubscript_expression1: nodes [
	| result |
	result := SwiftSubscriptExpressionNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 2) to: result lessThanTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result commaTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result greaterThanTokens.
	result
		addTokens: ((nodes at: 1) at: 5)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 6)
		to: result floating_point_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 7)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result leftBracketTokens.
	result addObjects: ((nodes at: 1) at: 9) to: result expressions.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result rightBracketTokens.
	result addObjects: ((nodes at: 1) at: 11) to: result keyExpressions.
	result addTokens: ((nodes at: 1) at: 12) to: result colonTokens.
	result addObjects: ((nodes at: 1) at: 13) to: result valueExpressions.
	result __FILE__Token: ((nodes at: 1) at: 14).
	result __LINE__Token: ((nodes at: 1) at: 15).
	result __COLUMN__Token: ((nodes at: 1) at: 16).
	result __FUNCTION__Token: ((nodes at: 1) at: 17).
	result addTokens: ((nodes at: 1) at: 18) to: result selfTokens.
	result addTokens: ((nodes at: 1) at: 19) to: result periodTokens.
	result addTokens: ((nodes at: 1) at: 20) to: result initTokens.
	result addTokens: ((nodes at: 1) at: 21) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 22) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 23) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 24) to: result inoutTokens.
	result addTokens: ((nodes at: 1) at: 25) to: result letTokens.
	result addTokens: ((nodes at: 1) at: 26) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 27) to: result rightBraceTokens.
	result addTokens: ((nodes at: 1) at: 28) to: result operatorTokens.
	result addTokens: ((nodes at: 1) at: 29) to: result protocolTokens.
	result
		addTokens: ((nodes at: 1) at: 30)
		to: result minusGreaterThanTokens.
	result
		addTokens: ((nodes at: 1) at: 31)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 1) at: 32) to: result bangTokens.
	result addTokens: ((nodes at: 1) at: 33) to: result typeTokens.
	result
		addTokens: ((nodes at: 1) at: 34)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 1) at: 35) to: result equalTokens.
	result addTokens: ((nodes at: 1) at: 36) to: result varTokens.
	result inToken: ((nodes at: 1) at: 37).
	result weakToken: ((nodes at: 1) at: 38).
	result unownedToken: ((nodes at: 1) at: 39).
	result unownedLeftParensafeRightParenToken: ((nodes at: 1) at: 40).
	result unownedLeftParenunsafeRightParenToken: ((nodes at: 1) at: 41).
	result addNodes: ((nodes at: 1) at: 42) to: result statements.
	result addTokens: ((nodes at: 1) at: 43) to: result dynamicTypeTokens.
	result addToken: (nodes at: 2) to: result leftBracketTokens.
	result addObjects: ((nodes at: 3) at: 1) to: result expressions.
	result addTokens: ((nodes at: 3) at: 2) to: result commaTokens.
	result addToken: (nodes at: 4) to: result rightBracketTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForsubscript_head1: nodes [
	| result |
	result := Array new: 29.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 1) at: 7) to: (result at: 7).
	self addAll: ((nodes at: 1) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 1) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 1) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 1) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 1) at: 12) to: (result at: 12).
	result at: 13 put: (nodes at: 2).
	self addAll: ((nodes at: 3) at: 1) to: (result at: 3).
	self addAll: ((nodes at: 3) at: 2) to: (result at: 4).
	self addAll: ((nodes at: 3) at: 3) to: (result at: 14).
	self addAll: ((nodes at: 3) at: 4) to: (result at: 15).
	self addAll: ((nodes at: 3) at: 5) to: (result at: 1).
	self addAll: ((nodes at: 3) at: 6) to: (result at: 2).
	self addAll: ((nodes at: 3) at: 7) to: (result at: 16).
	self addAll: ((nodes at: 3) at: 8) to: (result at: 5).
	self addAll: ((nodes at: 3) at: 9) to: (result at: 6).
	self addAll: ((nodes at: 3) at: 10) to: (result at: 7).
	self addAll: ((nodes at: 3) at: 11) to: (result at: 8).
	self addAll: ((nodes at: 3) at: 12) to: (result at: 9).
	self addAll: ((nodes at: 3) at: 13) to: (result at: 10).
	self addAll: ((nodes at: 3) at: 14) to: (result at: 11).
	self addAll: ((nodes at: 3) at: 15) to: (result at: 17).
	self addAll: ((nodes at: 3) at: 16) to: (result at: 18).
	self addAll: ((nodes at: 3) at: 17) to: (result at: 19).
	self addAll: ((nodes at: 3) at: 18) to: (result at: 20).
	self addAll: ((nodes at: 3) at: 19) to: (result at: 21).
	self addAll: ((nodes at: 3) at: 20) to: (result at: 22).
	self addAll: ((nodes at: 3) at: 21) to: (result at: 23).
	self addAll: ((nodes at: 3) at: 22) to: (result at: 24).
	self addAll: ((nodes at: 3) at: 23) to: (result at: 25).
	self addAll: ((nodes at: 3) at: 24) to: (result at: 26).
	self addAll: ((nodes at: 3) at: 25) to: (result at: 27).
	self addAll: ((nodes at: 3) at: 26) to: (result at: 28).
	self addAll: ((nodes at: 3) at: 27) to: (result at: 29).
	self addAll: ((nodes at: 3) at: 28) to: (result at: 12).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForsubscript_result1: nodes [
	| result |
	result := Array new: 24.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 8) to: (result at: 9).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 10).
	self addAll: ((nodes at: 2) at: 10) to: (result at: 11).
	self addAll: ((nodes at: 2) at: 11) to: (result at: 12).
	self addAll: ((nodes at: 2) at: 12) to: (result at: 13).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForsuperclass_initializer_expression1: nodes [
	| result |
	result := SwiftSuperclassInitializerExpressionNode new.
	result superToken: (nodes at: 1).
	result periodToken: (nodes at: 2).
	result initToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForsuperclass_method_expression1: nodes [
	| result |
	result := SwiftSuperclassMethodExpressionNode new.
	result superToken: (nodes at: 1).
	result periodToken: (nodes at: 2).
	result identifierToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForsuperclass_subscript_expression1: nodes [
	| result |
	result := SwiftSuperclassSubscriptExpressionNode new.
	result superToken: (nodes at: 1).
	result leftBracketToken: (nodes at: 2).
	result expression: (nodes at: 3).
	result rightBracketToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForswitch_case1: nodes [
	| result |
	result := Array new: 34.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	result at: 30 put: (OrderedCollection new: 2).
	result at: 31 put: (OrderedCollection new: 2).
	result at: 32 put: (OrderedCollection new: 2).
	result at: 1 put: ((nodes at: 1) at: 1).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 1) at: 7) to: (result at: 7).
	self addAll: ((nodes at: 1) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 1) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 1) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 1) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 1) at: 12) to: (result at: 12).
	self addAll: ((nodes at: 1) at: 13) to: (result at: 13).
	self addAll: ((nodes at: 1) at: 14) to: (result at: 14).
	self addAll: ((nodes at: 1) at: 15) to: (result at: 15).
	self addAll: ((nodes at: 1) at: 16) to: (result at: 16).
	self addAll: ((nodes at: 1) at: 17) to: (result at: 17).
	self addAll: ((nodes at: 1) at: 18) to: (result at: 18).
	self addAll: ((nodes at: 1) at: 19) to: (result at: 19).
	self addAll: ((nodes at: 1) at: 20) to: (result at: 20).
	self addAll: ((nodes at: 1) at: 21) to: (result at: 21).
	self addAll: ((nodes at: 1) at: 22) to: (result at: 22).
	self addAll: ((nodes at: 1) at: 23) to: (result at: 23).
	self addAll: ((nodes at: 1) at: 24) to: (result at: 24).
	self addAll: ((nodes at: 1) at: 25) to: (result at: 25).
	self addAll: ((nodes at: 1) at: 26) to: (result at: 26).
	self addAll: ((nodes at: 1) at: 27) to: (result at: 27).
	self addAll: ((nodes at: 1) at: 28) to: (result at: 28).
	self addAll: ((nodes at: 1) at: 29) to: (result at: 29).
	self addAll: ((nodes at: 1) at: 30) to: (result at: 30).
	self addAll: ((nodes at: 1) at: 31) to: (result at: 31).
	self addAll: (nodes at: 2) to: (result at: 32).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForswitch_case2: nodes [
	| result |
	result := Array new: 34.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	result at: 30 put: (OrderedCollection new: 2).
	result at: 31 put: (OrderedCollection new: 2).
	result at: 32 put: (OrderedCollection new: 2).
	result at: 1 put: ((nodes at: 1) at: 1).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 1) at: 7) to: (result at: 7).
	self addAll: ((nodes at: 1) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 1) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 1) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 1) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 1) at: 12) to: (result at: 12).
	self addAll: ((nodes at: 1) at: 13) to: (result at: 13).
	self addAll: ((nodes at: 1) at: 14) to: (result at: 14).
	self addAll: ((nodes at: 1) at: 15) to: (result at: 15).
	self addAll: ((nodes at: 1) at: 16) to: (result at: 16).
	self addAll: ((nodes at: 1) at: 17) to: (result at: 17).
	self addAll: ((nodes at: 1) at: 18) to: (result at: 18).
	self addAll: ((nodes at: 1) at: 19) to: (result at: 19).
	self addAll: ((nodes at: 1) at: 20) to: (result at: 20).
	self addAll: ((nodes at: 1) at: 21) to: (result at: 21).
	self addAll: ((nodes at: 1) at: 22) to: (result at: 22).
	self addAll: ((nodes at: 1) at: 23) to: (result at: 23).
	self addAll: ((nodes at: 1) at: 24) to: (result at: 24).
	self addAll: ((nodes at: 1) at: 25) to: (result at: 25).
	self addAll: ((nodes at: 1) at: 26) to: (result at: 26).
	self addAll: ((nodes at: 1) at: 27) to: (result at: 27).
	self addAll: ((nodes at: 1) at: 28) to: (result at: 28).
	self addAll: ((nodes at: 1) at: 29) to: (result at: 29).
	self addAll: ((nodes at: 1) at: 30) to: (result at: 30).
	self addAll: ((nodes at: 1) at: 31) to: (result at: 31).
	result at: 33 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForswitch_case3: nodes [
	| result |
	result := Array new: 34.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	result at: 30 put: (OrderedCollection new: 2).
	result at: 31 put: (OrderedCollection new: 2).
	result at: 32 put: (OrderedCollection new: 2).
	result at: 34 put: ((nodes at: 1) at: 1).
	self add: ((nodes at: 1) at: 2) to: (result at: 3).
	self addAll: (nodes at: 2) to: (result at: 32).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForswitch_case4: nodes [
	| result |
	result := Array new: 34.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	result at: 30 put: (OrderedCollection new: 2).
	result at: 31 put: (OrderedCollection new: 2).
	result at: 32 put: (OrderedCollection new: 2).
	result at: 34 put: ((nodes at: 1) at: 1).
	self add: ((nodes at: 1) at: 2) to: (result at: 3).
	result at: 33 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForswitch_cases1: nodes [
	| result |
	result := Array new: 34.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	result at: 30 put: (OrderedCollection new: 2).
	result at: 31 put: (OrderedCollection new: 2).
	result at: 32 put: (OrderedCollection new: 2).
	result at: 33 put: (OrderedCollection new: 2).
	result at: 34 put: (OrderedCollection new: 2).
	self add: ((nodes at: 1) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 1) at: 7) to: (result at: 7).
	self addAll: ((nodes at: 1) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 1) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 1) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 1) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 1) at: 12) to: (result at: 12).
	self addAll: ((nodes at: 1) at: 13) to: (result at: 13).
	self addAll: ((nodes at: 1) at: 14) to: (result at: 14).
	self addAll: ((nodes at: 1) at: 15) to: (result at: 15).
	self addAll: ((nodes at: 1) at: 16) to: (result at: 16).
	self addAll: ((nodes at: 1) at: 17) to: (result at: 17).
	self addAll: ((nodes at: 1) at: 18) to: (result at: 18).
	self addAll: ((nodes at: 1) at: 19) to: (result at: 19).
	self addAll: ((nodes at: 1) at: 20) to: (result at: 20).
	self addAll: ((nodes at: 1) at: 21) to: (result at: 21).
	self addAll: ((nodes at: 1) at: 22) to: (result at: 22).
	self addAll: ((nodes at: 1) at: 23) to: (result at: 23).
	self addAll: ((nodes at: 1) at: 24) to: (result at: 24).
	self addAll: ((nodes at: 1) at: 25) to: (result at: 25).
	self addAll: ((nodes at: 1) at: 26) to: (result at: 26).
	self addAll: ((nodes at: 1) at: 27) to: (result at: 27).
	self addAll: ((nodes at: 1) at: 28) to: (result at: 28).
	self addAll: ((nodes at: 1) at: 29) to: (result at: 29).
	self addAll: ((nodes at: 1) at: 30) to: (result at: 30).
	self addAll: ((nodes at: 1) at: 31) to: (result at: 31).
	self addAll: ((nodes at: 1) at: 32) to: (result at: 32).
	self add: ((nodes at: 1) at: 33) to: (result at: 33).
	self add: ((nodes at: 1) at: 34) to: (result at: 34).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForswitch_cases2: nodes [
	| result |
	result := nodes at: 1.
	self add: ((nodes at: 2) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 2) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 2) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 2) at: 12) to: (result at: 12).
	self addAll: ((nodes at: 2) at: 13) to: (result at: 13).
	self addAll: ((nodes at: 2) at: 14) to: (result at: 14).
	self addAll: ((nodes at: 2) at: 15) to: (result at: 15).
	self addAll: ((nodes at: 2) at: 16) to: (result at: 16).
	self addAll: ((nodes at: 2) at: 17) to: (result at: 17).
	self addAll: ((nodes at: 2) at: 18) to: (result at: 18).
	self addAll: ((nodes at: 2) at: 19) to: (result at: 19).
	self addAll: ((nodes at: 2) at: 20) to: (result at: 20).
	self addAll: ((nodes at: 2) at: 21) to: (result at: 21).
	self addAll: ((nodes at: 2) at: 22) to: (result at: 22).
	self addAll: ((nodes at: 2) at: 23) to: (result at: 23).
	self addAll: ((nodes at: 2) at: 24) to: (result at: 24).
	self addAll: ((nodes at: 2) at: 25) to: (result at: 25).
	self addAll: ((nodes at: 2) at: 26) to: (result at: 26).
	self addAll: ((nodes at: 2) at: 27) to: (result at: 27).
	self addAll: ((nodes at: 2) at: 28) to: (result at: 28).
	self addAll: ((nodes at: 2) at: 29) to: (result at: 29).
	self addAll: ((nodes at: 2) at: 30) to: (result at: 30).
	self addAll: ((nodes at: 2) at: 31) to: (result at: 31).
	self addAll: ((nodes at: 2) at: 32) to: (result at: 32).
	self add: ((nodes at: 2) at: 33) to: (result at: 33).
	self add: ((nodes at: 2) at: 34) to: (result at: 34).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForswitch_statement1: nodes [
	| result |
	result := SwiftSwitchStatementNode new.
	result switchToken: (nodes at: 1).
	result addObject: (nodes at: 2) to: result expressions.
	result addToken: (nodes at: 3) to: result leftBraceTokens.
	result addTokens: ((nodes at: 4) at: 1) to: result caseTokens.
	result addTokens: ((nodes at: 4) at: 2) to: result _Tokens.
	result addTokens: ((nodes at: 4) at: 3) to: result colonTokens.
	result addTokens: ((nodes at: 4) at: 4) to: result identifierTokens.
	result addTokens: ((nodes at: 4) at: 5) to: result leftParenTokens.
	result addTokens: ((nodes at: 4) at: 6) to: result rightParenTokens.
	result addTokens: ((nodes at: 4) at: 7) to: result leftBracketTokens.
	result addTokens: ((nodes at: 4) at: 8) to: result rightBracketTokens.
	result addTokens: ((nodes at: 4) at: 9) to: result leftBraceTokens.
	result addTokens: ((nodes at: 4) at: 10) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 4) at: 11)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 4) at: 12)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 4) at: 13) to: result operatorTokens.
	result
		addTokens: ((nodes at: 4) at: 14)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 4) at: 15) to: result periodTokens.
	result addTokens: ((nodes at: 4) at: 16) to: result protocolTokens.
	result addTokens: ((nodes at: 4) at: 17) to: result lessThanTokens.
	result addTokens: ((nodes at: 4) at: 18) to: result greaterThanTokens.
	result
		addTokens: ((nodes at: 4) at: 19)
		to: result minusGreaterThanTokens.
	result addTokens: ((nodes at: 4) at: 20) to: result commaTokens.
	result
		addTokens: ((nodes at: 4) at: 21)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 4) at: 22) to: result bangTokens.
	result addTokens: ((nodes at: 4) at: 23) to: result typeTokens.
	result
		addTokens: ((nodes at: 4) at: 24)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 4) at: 25) to: result inoutTokens.
	result addTokens: ((nodes at: 4) at: 26) to: result varTokens.
	result addTokens: ((nodes at: 4) at: 27) to: result letTokens.
	result addObjects: ((nodes at: 4) at: 28) to: result expressions.
	result addTokens: ((nodes at: 4) at: 29) to: result isTokens.
	result addTokens: ((nodes at: 4) at: 30) to: result asTokens.
	result addTokens: ((nodes at: 4) at: 31) to: result whereTokens.
	result addNodes: ((nodes at: 4) at: 32) to: result statements.
	result addTokens: ((nodes at: 4) at: 33) to: result semicolonToken.
	result addTokens: ((nodes at: 4) at: 34) to: result defaultTokens.
	result addToken: (nodes at: 5) to: result rightBraceTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFortuple_pattern1: nodes [
	| result |
	result := Array new: 29.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 2) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 2) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 2) at: 12) to: (result at: 12).
	self addAll: ((nodes at: 2) at: 13) to: (result at: 13).
	self addAll: ((nodes at: 2) at: 14) to: (result at: 14).
	self addAll: ((nodes at: 2) at: 15) to: (result at: 15).
	self addAll: ((nodes at: 2) at: 16) to: (result at: 16).
	self addAll: ((nodes at: 2) at: 17) to: (result at: 17).
	self addAll: ((nodes at: 2) at: 18) to: (result at: 18).
	self addAll: ((nodes at: 2) at: 19) to: (result at: 19).
	self addAll: ((nodes at: 2) at: 20) to: (result at: 20).
	self addAll: ((nodes at: 2) at: 21) to: (result at: 21).
	self addAll: ((nodes at: 2) at: 22) to: (result at: 22).
	self addAll: ((nodes at: 2) at: 23) to: (result at: 23).
	self addAll: ((nodes at: 2) at: 24) to: (result at: 24).
	self addAll: ((nodes at: 2) at: 25) to: (result at: 25).
	self addAll: ((nodes at: 2) at: 26) to: (result at: 26).
	self addAll: ((nodes at: 2) at: 27) to: (result at: 27).
	self addAll: ((nodes at: 2) at: 28) to: (result at: 28).
	self addAll: ((nodes at: 2) at: 29) to: (result at: 29).
	self add: (nodes at: 3) to: (result at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFortuple_pattern_element_list2: nodes [
	| result |
	result := nodes at: 3.
	self addAllFirst: ((nodes at: 1) at: 1) to: (result at: 1).
	self addAllFirst: ((nodes at: 1) at: 2) to: (result at: 2).
	self addAllFirst: ((nodes at: 1) at: 3) to: (result at: 3).
	self addAllFirst: ((nodes at: 1) at: 4) to: (result at: 4).
	self addAllFirst: ((nodes at: 1) at: 5) to: (result at: 5).
	self addAllFirst: ((nodes at: 1) at: 6) to: (result at: 6).
	self addAllFirst: ((nodes at: 1) at: 7) to: (result at: 7).
	self addAllFirst: ((nodes at: 1) at: 8) to: (result at: 8).
	self addAllFirst: ((nodes at: 1) at: 9) to: (result at: 9).
	self addAllFirst: ((nodes at: 1) at: 10) to: (result at: 10).
	self addAllFirst: ((nodes at: 1) at: 11) to: (result at: 11).
	self addAllFirst: ((nodes at: 1) at: 12) to: (result at: 12).
	self addAllFirst: ((nodes at: 1) at: 13) to: (result at: 13).
	self addAllFirst: ((nodes at: 1) at: 14) to: (result at: 14).
	self addAllFirst: ((nodes at: 1) at: 15) to: (result at: 15).
	self addAllFirst: ((nodes at: 1) at: 16) to: (result at: 16).
	self addAllFirst: ((nodes at: 1) at: 17) to: (result at: 17).
	self addAllFirst: ((nodes at: 1) at: 18) to: (result at: 18).
	self addAllFirst: ((nodes at: 1) at: 19) to: (result at: 19).
	self addAllFirst: ((nodes at: 1) at: 20) to: (result at: 20).
	self addAllFirst: ((nodes at: 1) at: 21) to: (result at: 21).
	self addAllFirst: ((nodes at: 1) at: 22) to: (result at: 22).
	self addAllFirst: ((nodes at: 1) at: 23) to: (result at: 23).
	self addAllFirst: ((nodes at: 1) at: 24) to: (result at: 24).
	self addAllFirst: ((nodes at: 1) at: 25) to: (result at: 25).
	self addAllFirst: ((nodes at: 1) at: 26) to: (result at: 26).
	self addAllFirst: ((nodes at: 1) at: 27) to: (result at: 27).
	self addAllFirst: ((nodes at: 1) at: 28) to: (result at: 28).
	self addAllFirst: ((nodes at: 1) at: 29) to: (result at: 29).
	self addFirst: (nodes at: 2) to: (result at: 19).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFortuple_type1: nodes [
	| result |
	result := SwiftTupleTypeNode new.
	result addToken: (nodes at: 1) to: result leftParenTokens.
	result addTokens: ((nodes at: 2) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 2) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 2) at: 3) to: result leftParenTokens.
	result addTokens: ((nodes at: 2) at: 4) to: result rightParenTokens.
	result addTokens: ((nodes at: 2) at: 5) to: result leftBracketTokens.
	result addTokens: ((nodes at: 2) at: 6) to: result rightBracketTokens.
	result addTokens: ((nodes at: 2) at: 7) to: result leftBraceTokens.
	result addTokens: ((nodes at: 2) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 2) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 2) at: 10)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 2) at: 11) to: result operatorTokens.
	result
		addTokens: ((nodes at: 2) at: 12)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 2) at: 13) to: result inoutTokens.
	result addTokens: ((nodes at: 2) at: 14) to: result periodTokens.
	result addTokens: ((nodes at: 2) at: 15) to: result protocolTokens.
	result addTokens: ((nodes at: 2) at: 16) to: result lessThanTokens.
	result addTokens: ((nodes at: 2) at: 17) to: result greaterThanTokens.
	result addTokens: ((nodes at: 2) at: 18) to: result colonTokens.
	result
		addTokens: ((nodes at: 2) at: 19)
		to: result minusGreaterThanTokens.
	result addTokens: ((nodes at: 2) at: 20) to: result commaTokens.
	result
		addTokens: ((nodes at: 2) at: 21)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 2) at: 22) to: result bangTokens.
	result addTokens: ((nodes at: 2) at: 23) to: result typeTokens.
	result
		addTokens: ((nodes at: 2) at: 24)
		to: result periodPeriodPeriodTokens.
	result addToken: (nodes at: 3) to: result rightParenTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFortuple_type_body1: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 24).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFortuple_type_element1: nodes [
	| result |
	result := Array new: 24.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 1) at: 7) to: (result at: 7).
	self addAll: ((nodes at: 1) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 1) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 1) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 1) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 1) at: 12) to: (result at: 12).
	self add: (nodes at: 2) to: (result at: 13).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFortuple_type_element2: nodes [
	| result |
	result := Array new: 24.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 13).
	self add: (nodes at: 2) to: (result at: 2).
	self addAll: ((nodes at: 3) at: 1) to: (result at: 18).
	self addAll: ((nodes at: 3) at: 2) to: (result at: 1).
	self addAll: ((nodes at: 3) at: 3) to: (result at: 2).
	self addAll: ((nodes at: 3) at: 4) to: (result at: 3).
	self addAll: ((nodes at: 3) at: 5) to: (result at: 4).
	self addAll: ((nodes at: 3) at: 6) to: (result at: 5).
	self addAll: ((nodes at: 3) at: 7) to: (result at: 6).
	self addAll: ((nodes at: 3) at: 8) to: (result at: 7).
	self addAll: ((nodes at: 3) at: 9) to: (result at: 8).
	self addAll: ((nodes at: 3) at: 10) to: (result at: 9).
	self addAll: ((nodes at: 3) at: 11) to: (result at: 10).
	self addAll: ((nodes at: 3) at: 12) to: (result at: 11).
	self addAll: ((nodes at: 3) at: 13) to: (result at: 12).
	self addAll: ((nodes at: 3) at: 14) to: (result at: 14).
	self addAll: ((nodes at: 3) at: 15) to: (result at: 15).
	self addAll: ((nodes at: 3) at: 16) to: (result at: 16).
	self addAll: ((nodes at: 3) at: 17) to: (result at: 17).
	self addAll: ((nodes at: 3) at: 18) to: (result at: 19).
	self addAll: ((nodes at: 3) at: 19) to: (result at: 20).
	self addAll: ((nodes at: 3) at: 20) to: (result at: 21).
	self addAll: ((nodes at: 3) at: 21) to: (result at: 22).
	self addAll: ((nodes at: 3) at: 22) to: (result at: 23).
	self addAll: ((nodes at: 3) at: 23) to: (result at: 24).
	self addAll: ((nodes at: 3) at: 24) to: (result at: 13).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFortuple_type_element_list2: nodes [
	| result |
	result := nodes at: 3.
	self addAllFirst: ((nodes at: 1) at: 1) to: (result at: 1).
	self addAllFirst: ((nodes at: 1) at: 2) to: (result at: 2).
	self addAllFirst: ((nodes at: 1) at: 3) to: (result at: 3).
	self addAllFirst: ((nodes at: 1) at: 4) to: (result at: 4).
	self addAllFirst: ((nodes at: 1) at: 5) to: (result at: 5).
	self addAllFirst: ((nodes at: 1) at: 6) to: (result at: 6).
	self addAllFirst: ((nodes at: 1) at: 7) to: (result at: 7).
	self addAllFirst: ((nodes at: 1) at: 8) to: (result at: 8).
	self addAllFirst: ((nodes at: 1) at: 9) to: (result at: 9).
	self addAllFirst: ((nodes at: 1) at: 10) to: (result at: 10).
	self addAllFirst: ((nodes at: 1) at: 11) to: (result at: 11).
	self addAllFirst: ((nodes at: 1) at: 12) to: (result at: 12).
	self addAllFirst: ((nodes at: 1) at: 13) to: (result at: 13).
	self addAllFirst: ((nodes at: 1) at: 14) to: (result at: 14).
	self addAllFirst: ((nodes at: 1) at: 15) to: (result at: 15).
	self addAllFirst: ((nodes at: 1) at: 16) to: (result at: 16).
	self addAllFirst: ((nodes at: 1) at: 17) to: (result at: 17).
	self addAllFirst: ((nodes at: 1) at: 18) to: (result at: 18).
	self addAllFirst: ((nodes at: 1) at: 19) to: (result at: 19).
	self addAllFirst: ((nodes at: 1) at: 20) to: (result at: 20).
	self addAllFirst: ((nodes at: 1) at: 21) to: (result at: 21).
	self addAllFirst: ((nodes at: 1) at: 22) to: (result at: 22).
	self addAllFirst: ((nodes at: 1) at: 23) to: (result at: 23).
	self addAllFirst: ((nodes at: 1) at: 24) to: (result at: 24).
	self addFirst: (nodes at: 2) to: (result at: 20).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFortype_casting_operator1: nodes [
	| result |
	result := Array new: 4.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFortype_casting_operator2: nodes [
	| result |
	result := Array new: 4.
	result at: 3 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFortype_casting_operator3: nodes [
	| result |
	result := Array new: 4.
	result at: 3 put: (nodes at: 1).
	result at: 4 put: (nodes at: 2).
	result at: 2 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFortype_casting_pattern1: nodes [
	| result |
	result := Array new: 29.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	self add: ((nodes at: 1) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 1) at: 7) to: (result at: 7).
	self addAll: ((nodes at: 1) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 1) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 1) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 1) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 1) at: 12) to: (result at: 12).
	self addAll: ((nodes at: 1) at: 13) to: (result at: 13).
	self addAll: ((nodes at: 1) at: 14) to: (result at: 14).
	self addAll: ((nodes at: 1) at: 15) to: (result at: 15).
	self addAll: ((nodes at: 1) at: 16) to: (result at: 16).
	self addAll: ((nodes at: 1) at: 17) to: (result at: 17).
	self addAll: ((nodes at: 1) at: 18) to: (result at: 18).
	self addAll: ((nodes at: 1) at: 19) to: (result at: 19).
	self addAll: ((nodes at: 1) at: 20) to: (result at: 20).
	self addAll: ((nodes at: 1) at: 21) to: (result at: 21).
	self addAll: ((nodes at: 1) at: 22) to: (result at: 22).
	self addAll: ((nodes at: 1) at: 23) to: (result at: 23).
	self addAll: ((nodes at: 1) at: 24) to: (result at: 24).
	self addAll: ((nodes at: 1) at: 25) to: (result at: 25).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFortype_casting_pattern2: nodes [
	| result |
	result := Array new: 29.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 19).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 9).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 12).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 13).
	self addAll: ((nodes at: 1) at: 6) to: (result at: 2).
	self addAll: ((nodes at: 1) at: 7) to: (result at: 8).
	self addAll: ((nodes at: 1) at: 8) to: (result at: 20).
	self addAll: ((nodes at: 1) at: 9) to: (result at: 21).
	self addAll: ((nodes at: 1) at: 10) to: (result at: 22).
	self addAll: ((nodes at: 1) at: 11) to: (result at: 23).
	self addAll: ((nodes at: 1) at: 12) to: (result at: 24).
	self addAll: ((nodes at: 1) at: 13) to: (result at: 25).
	self addAll: ((nodes at: 1) at: 14) to: (result at: 4).
	self addAll: ((nodes at: 1) at: 15) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 16) to: (result at: 6).
	self addAll: ((nodes at: 1) at: 17) to: (result at: 7).
	self addAll: ((nodes at: 1) at: 18) to: (result at: 10).
	self addAll: ((nodes at: 1) at: 19) to: (result at: 11).
	self addAll: ((nodes at: 1) at: 20) to: (result at: 14).
	self addAll: ((nodes at: 1) at: 21) to: (result at: 15).
	self addAll: ((nodes at: 1) at: 22) to: (result at: 16).
	self addAll: ((nodes at: 1) at: 23) to: (result at: 17).
	self addAll: ((nodes at: 1) at: 24) to: (result at: 18).
	self addAll: ((nodes at: 1) at: 25) to: (result at: 26).
	self addAll: ((nodes at: 1) at: 26) to: (result at: 27).
	self addAll: ((nodes at: 1) at: 27) to: (result at: 28).
	self addAll: ((nodes at: 1) at: 28) to: (result at: 1).
	self addAll: ((nodes at: 1) at: 29) to: (result at: 29).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFortype_identifier1: nodes [
	| result |
	result := SwiftTypeIdentifierNode new.
	result addToken: (nodes at: 1) to: result identifierTokens.
	result addToken: ((nodes at: 2) at: 1) to: result lessThanTokens.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	result addToken: ((nodes at: 2) at: 3) to: result greaterThanTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFortype_identifier2: nodes [
	| result |
	result := nodes at: 4.
	result addFirstToken: (nodes at: 1) to: result identifierTokens.
	result addFirstToken: ((nodes at: 2) at: 1) to: result lessThanTokens.
	result addFirstTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	result
		addFirstToken: ((nodes at: 2) at: 3)
		to: result greaterThanTokens.
	result addFirstToken: (nodes at: 3) to: result periodTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFortype_inheritance_clause1: nodes [
	| result |
	result := Array new: 6.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFortype_inheritance_list2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFortypealias_declaration1: nodes [
	| result |
	result := SwiftTypealiasDeclarationNode new.
	result typealiasToken: ((nodes at: 1) at: 1).
	result addToken: ((nodes at: 1) at: 2) to: result identifierTokens.
	result equalToken: ((nodes at: 2) at: 1).
	result addTokens: ((nodes at: 2) at: 2) to: result leftBracketTokens.
	result addTokens: ((nodes at: 2) at: 3) to: result identifierTokens.
	result addTokens: ((nodes at: 2) at: 4) to: result periodTokens.
	result addTokens: ((nodes at: 2) at: 5) to: result protocolTokens.
	result addTokens: ((nodes at: 2) at: 6) to: result lessThanTokens.
	result addTokens: ((nodes at: 2) at: 7) to: result greaterThanTokens.
	result addTokens: ((nodes at: 2) at: 8) to: result rightBracketTokens.
	result addTokens: ((nodes at: 2) at: 9) to: result colonTokens.
	result
		addTokens: ((nodes at: 2) at: 10)
		to: result minusGreaterThanTokens.
	result addTokens: ((nodes at: 2) at: 11) to: result commaTokens.
	result addTokens: ((nodes at: 2) at: 12) to: result leftParenTokens.
	result addTokens: ((nodes at: 2) at: 13) to: result rightParenTokens.
	result
		addTokens: ((nodes at: 2) at: 14)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 2) at: 15) to: result bangTokens.
	result addTokens: ((nodes at: 2) at: 16) to: result typeTokens.
	result
		addTokens: ((nodes at: 2) at: 17)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 2) at: 18) to: result inoutTokens.
	result addTokens: ((nodes at: 2) at: 19) to: result _Tokens.
	result addTokens: ((nodes at: 2) at: 20) to: result leftBraceTokens.
	result addTokens: ((nodes at: 2) at: 21) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 2) at: 22)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 2) at: 23)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 2) at: 24) to: result operatorTokens.
	result
		addTokens: ((nodes at: 2) at: 25)
		to: result full_string_literalTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionFortypealias_head1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForunion_style_enum1: nodes [
	| result |
	result := Array new: 57.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	result at: 30 put: (OrderedCollection new: 2).
	result at: 31 put: (OrderedCollection new: 2).
	result at: 32 put: (OrderedCollection new: 2).
	result at: 33 put: (OrderedCollection new: 2).
	result at: 34 put: (OrderedCollection new: 2).
	result at: 35 put: (OrderedCollection new: 2).
	result at: 36 put: (OrderedCollection new: 2).
	result at: 37 put: (OrderedCollection new: 2).
	result at: 38 put: (OrderedCollection new: 2).
	result at: 39 put: (OrderedCollection new: 2).
	result at: 40 put: (OrderedCollection new: 2).
	result at: 41 put: (OrderedCollection new: 2).
	result at: 42 put: (OrderedCollection new: 2).
	result at: 43 put: (OrderedCollection new: 2).
	result at: 44 put: (OrderedCollection new: 2).
	result at: 45 put: (OrderedCollection new: 2).
	result at: 46 put: (OrderedCollection new: 2).
	result at: 47 put: (OrderedCollection new: 2).
	result at: 48 put: (OrderedCollection new: 2).
	result at: 49 put: (OrderedCollection new: 2).
	result at: 50 put: (OrderedCollection new: 2).
	result at: 51 put: (OrderedCollection new: 2).
	result at: 52 put: (OrderedCollection new: 2).
	result at: 53 put: (OrderedCollection new: 2).
	result at: 54 put: (OrderedCollection new: 2).
	result at: 55 put: (OrderedCollection new: 2).
	result at: 56 put: (OrderedCollection new: 2).
	result at: 57 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 7).
	self add: ((nodes at: 2) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 9).
	self add: (nodes at: 3) to: (result at: 10).
	self addAll: ((nodes at: 4) at: 1) to: (result at: 11).
	self addAll: ((nodes at: 4) at: 2) to: (result at: 1).
	self addAll: ((nodes at: 4) at: 3) to: (result at: 12).
	self addAll: ((nodes at: 4) at: 4) to: (result at: 13).
	self addAll: ((nodes at: 4) at: 5) to: (result at: 14).
	self addAll: ((nodes at: 4) at: 6) to: (result at: 15).
	self addAll: ((nodes at: 4) at: 7) to: (result at: 10).
	self addAll: ((nodes at: 4) at: 8) to: (result at: 16).
	self addAll: ((nodes at: 4) at: 9) to: (result at: 17).
	self addAll: ((nodes at: 4) at: 10) to: (result at: 18).
	self addAll: ((nodes at: 4) at: 11) to: (result at: 19).
	self addAll: ((nodes at: 4) at: 12) to: (result at: 20).
	self addAll: ((nodes at: 4) at: 13) to: (result at: 21).
	self addAll: ((nodes at: 4) at: 14) to: (result at: 22).
	self addAll: ((nodes at: 4) at: 15) to: (result at: 23).
	self addAll: ((nodes at: 4) at: 16) to: (result at: 24).
	self addAll: ((nodes at: 4) at: 17) to: (result at: 7).
	self addAll: ((nodes at: 4) at: 18) to: (result at: 25).
	self addAll: ((nodes at: 4) at: 19) to: (result at: 26).
	self addAll: ((nodes at: 4) at: 20) to: (result at: 6).
	self addAll: ((nodes at: 4) at: 21) to: (result at: 27).
	self addAll: ((nodes at: 4) at: 22) to: (result at: 28).
	self addAll: ((nodes at: 4) at: 23) to: (result at: 29).
	self addAll: ((nodes at: 4) at: 24) to: (result at: 30).
	self addAll: ((nodes at: 4) at: 25) to: (result at: 31).
	self addAll: ((nodes at: 4) at: 26) to: (result at: 32).
	self addAll: ((nodes at: 4) at: 27) to: (result at: 33).
	self addAll: ((nodes at: 4) at: 28) to: (result at: 34).
	self addAll: ((nodes at: 4) at: 29) to: (result at: 35).
	self addAll: ((nodes at: 4) at: 30) to: (result at: 36).
	self addAll: ((nodes at: 4) at: 31) to: (result at: 4).
	self addAll: ((nodes at: 4) at: 32) to: (result at: 3).
	self addAll: ((nodes at: 4) at: 33) to: (result at: 2).
	self addAll: ((nodes at: 4) at: 34) to: (result at: 5).
	self addAll: ((nodes at: 4) at: 35) to: (result at: 37).
	self addAll: ((nodes at: 4) at: 36) to: (result at: 38).
	self addAll: ((nodes at: 4) at: 37) to: (result at: 39).
	self addAll: ((nodes at: 4) at: 38) to: (result at: 40).
	self addAll: ((nodes at: 4) at: 39) to: (result at: 41).
	self addAll: ((nodes at: 4) at: 40) to: (result at: 42).
	self addAll: ((nodes at: 4) at: 41) to: (result at: 43).
	self addAll: ((nodes at: 4) at: 42) to: (result at: 44).
	self addAll: ((nodes at: 4) at: 43) to: (result at: 45).
	self addAll: ((nodes at: 4) at: 44) to: (result at: 46).
	self addAll: ((nodes at: 4) at: 45) to: (result at: 47).
	self addAll: ((nodes at: 4) at: 46) to: (result at: 48).
	self addAll: ((nodes at: 4) at: 47) to: (result at: 49).
	self addAll: ((nodes at: 4) at: 48) to: (result at: 8).
	self addAll: ((nodes at: 4) at: 49) to: (result at: 9).
	self addAll: ((nodes at: 4) at: 50) to: (result at: 50).
	self addAll: ((nodes at: 4) at: 51) to: (result at: 51).
	self addAll: ((nodes at: 4) at: 52) to: (result at: 52).
	self addAll: ((nodes at: 4) at: 53) to: (result at: 53).
	self addAll: ((nodes at: 4) at: 54) to: (result at: 54).
	self addAll: ((nodes at: 4) at: 55) to: (result at: 55).
	self addAll: ((nodes at: 4) at: 56) to: (result at: 56).
	self addAll: ((nodes at: 4) at: 57) to: (result at: 57).
	self add: (nodes at: 5) to: (result at: 16).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForunion_style_enum_case1: nodes [
	| result |
	result := Array new: 24.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForunion_style_enum_case_clause1: nodes [
	| result |
	result := Array new: 25.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	result at: 25 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 1) at: 7) to: (result at: 7).
	self addAll: ((nodes at: 1) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 1) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 1) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 1) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 1) at: 12) to: (result at: 12).
	result at: 13 put: (nodes at: 2).
	self addAll: ((nodes at: 3) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 3) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 3) at: 3) to: (result at: 1).
	self addAll: ((nodes at: 3) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 3) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 3) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 3) at: 7) to: (result at: 7).
	self addAll: ((nodes at: 3) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 3) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 3) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 3) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 3) at: 12) to: (result at: 12).
	self addAll: ((nodes at: 3) at: 13) to: (result at: 14).
	self addAll: ((nodes at: 3) at: 14) to: (result at: 15).
	self addAll: ((nodes at: 3) at: 15) to: (result at: 16).
	self addAll: ((nodes at: 3) at: 16) to: (result at: 17).
	self addAll: ((nodes at: 3) at: 17) to: (result at: 18).
	self addAll: ((nodes at: 3) at: 18) to: (result at: 19).
	self addAll: ((nodes at: 3) at: 19) to: (result at: 20).
	self addAll: ((nodes at: 3) at: 20) to: (result at: 21).
	self addAll: ((nodes at: 3) at: 21) to: (result at: 22).
	self addAll: ((nodes at: 3) at: 22) to: (result at: 23).
	self addAll: ((nodes at: 3) at: 23) to: (result at: 24).
	self addAll: ((nodes at: 3) at: 24) to: (result at: 25).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForunion_style_enum_member2: nodes [
	| result |
	result := Array new: 57.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	result at: 30 put: (OrderedCollection new: 2).
	result at: 31 put: (OrderedCollection new: 2).
	result at: 32 put: (OrderedCollection new: 2).
	result at: 33 put: (OrderedCollection new: 2).
	result at: 34 put: (OrderedCollection new: 2).
	result at: 35 put: (OrderedCollection new: 2).
	result at: 36 put: (OrderedCollection new: 2).
	result at: 37 put: (OrderedCollection new: 2).
	result at: 38 put: (OrderedCollection new: 2).
	result at: 39 put: (OrderedCollection new: 2).
	result at: 40 put: (OrderedCollection new: 2).
	result at: 41 put: (OrderedCollection new: 2).
	result at: 42 put: (OrderedCollection new: 2).
	result at: 43 put: (OrderedCollection new: 2).
	result at: 44 put: (OrderedCollection new: 2).
	result at: 45 put: (OrderedCollection new: 2).
	result at: 46 put: (OrderedCollection new: 2).
	result at: 47 put: (OrderedCollection new: 2).
	result at: 48 put: (OrderedCollection new: 2).
	result at: 49 put: (OrderedCollection new: 2).
	result at: 50 put: (OrderedCollection new: 2).
	result at: 51 put: (OrderedCollection new: 2).
	result at: 52 put: (OrderedCollection new: 2).
	result at: 53 put: (OrderedCollection new: 2).
	result at: 54 put: (OrderedCollection new: 2).
	result at: 55 put: (OrderedCollection new: 2).
	result at: 56 put: (OrderedCollection new: 2).
	result at: 57 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 1) at: 7) to: (result at: 7).
	self addAll: ((nodes at: 1) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 1) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 1) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 1) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 1) at: 12) to: (result at: 50).
	self add: ((nodes at: 1) at: 13) to: (result at: 57).
	self addAll: ((nodes at: 1) at: 14) to: (result at: 40).
	self addAll: ((nodes at: 1) at: 15) to: (result at: 20).
	self addAll: ((nodes at: 1) at: 16) to: (result at: 17).
	self addAll: ((nodes at: 1) at: 17) to: (result at: 33).
	self addAll: ((nodes at: 1) at: 18) to: (result at: 34).
	self addAll: ((nodes at: 1) at: 19) to: (result at: 32).
	self addAll: ((nodes at: 1) at: 20) to: (result at: 35).
	self addAll: ((nodes at: 1) at: 21) to: (result at: 31).
	self addAll: ((nodes at: 1) at: 22) to: (result at: 36).
	self addAll: ((nodes at: 1) at: 23) to: (result at: 37).
	self addAll: ((nodes at: 1) at: 24) to: (result at: 38).
	self addAll: ((nodes at: 1) at: 25) to: (result at: 39).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForunion_style_enum_members2: nodes [
	| result |
	result := nodes at: 2.
	self addAllFirst: ((nodes at: 1) at: 1) to: (result at: 1).
	self addAllFirst: ((nodes at: 1) at: 2) to: (result at: 2).
	self addAllFirst: ((nodes at: 1) at: 3) to: (result at: 3).
	self addAllFirst: ((nodes at: 1) at: 4) to: (result at: 4).
	self addAllFirst: ((nodes at: 1) at: 5) to: (result at: 5).
	self addAllFirst: ((nodes at: 1) at: 6) to: (result at: 6).
	self addAllFirst: ((nodes at: 1) at: 7) to: (result at: 7).
	self addAllFirst: ((nodes at: 1) at: 8) to: (result at: 8).
	self addAllFirst: ((nodes at: 1) at: 9) to: (result at: 9).
	self addAllFirst: ((nodes at: 1) at: 10) to: (result at: 10).
	self addAllFirst: ((nodes at: 1) at: 11) to: (result at: 11).
	self addAllFirst: ((nodes at: 1) at: 12) to: (result at: 12).
	self addAllFirst: ((nodes at: 1) at: 13) to: (result at: 13).
	self addAllFirst: ((nodes at: 1) at: 14) to: (result at: 14).
	self addAllFirst: ((nodes at: 1) at: 15) to: (result at: 15).
	self addAllFirst: ((nodes at: 1) at: 16) to: (result at: 16).
	self addAllFirst: ((nodes at: 1) at: 17) to: (result at: 17).
	self addAllFirst: ((nodes at: 1) at: 18) to: (result at: 18).
	self addAllFirst: ((nodes at: 1) at: 19) to: (result at: 19).
	self addAllFirst: ((nodes at: 1) at: 20) to: (result at: 20).
	self addAllFirst: ((nodes at: 1) at: 21) to: (result at: 21).
	self addAllFirst: ((nodes at: 1) at: 22) to: (result at: 22).
	self addAllFirst: ((nodes at: 1) at: 23) to: (result at: 23).
	self addAllFirst: ((nodes at: 1) at: 24) to: (result at: 24).
	self addAllFirst: ((nodes at: 1) at: 25) to: (result at: 25).
	self addAllFirst: ((nodes at: 1) at: 26) to: (result at: 26).
	self addAllFirst: ((nodes at: 1) at: 27) to: (result at: 27).
	self addAllFirst: ((nodes at: 1) at: 28) to: (result at: 28).
	self addAllFirst: ((nodes at: 1) at: 29) to: (result at: 29).
	self addAllFirst: ((nodes at: 1) at: 30) to: (result at: 30).
	self addAllFirst: ((nodes at: 1) at: 31) to: (result at: 31).
	self addAllFirst: ((nodes at: 1) at: 32) to: (result at: 32).
	self addAllFirst: ((nodes at: 1) at: 33) to: (result at: 33).
	self addAllFirst: ((nodes at: 1) at: 34) to: (result at: 34).
	self addAllFirst: ((nodes at: 1) at: 35) to: (result at: 35).
	self addAllFirst: ((nodes at: 1) at: 36) to: (result at: 36).
	self addAllFirst: ((nodes at: 1) at: 37) to: (result at: 37).
	self addAllFirst: ((nodes at: 1) at: 38) to: (result at: 38).
	self addAllFirst: ((nodes at: 1) at: 39) to: (result at: 39).
	self addAllFirst: ((nodes at: 1) at: 40) to: (result at: 40).
	self addAllFirst: ((nodes at: 1) at: 41) to: (result at: 41).
	self addAllFirst: ((nodes at: 1) at: 42) to: (result at: 42).
	self addAllFirst: ((nodes at: 1) at: 43) to: (result at: 43).
	self addAllFirst: ((nodes at: 1) at: 44) to: (result at: 44).
	self addAllFirst: ((nodes at: 1) at: 45) to: (result at: 45).
	self addAllFirst: ((nodes at: 1) at: 46) to: (result at: 46).
	self addAllFirst: ((nodes at: 1) at: 47) to: (result at: 47).
	self addAllFirst: ((nodes at: 1) at: 48) to: (result at: 48).
	self addAllFirst: ((nodes at: 1) at: 49) to: (result at: 49).
	self addAllFirst: ((nodes at: 1) at: 50) to: (result at: 50).
	self addAllFirst: ((nodes at: 1) at: 51) to: (result at: 51).
	self addAllFirst: ((nodes at: 1) at: 52) to: (result at: 52).
	self addAllFirst: ((nodes at: 1) at: 53) to: (result at: 53).
	self addAllFirst: ((nodes at: 1) at: 54) to: (result at: 54).
	self addAllFirst: ((nodes at: 1) at: 55) to: (result at: 55).
	self addAllFirst: ((nodes at: 1) at: 56) to: (result at: 56).
	self addAllFirst: ((nodes at: 1) at: 57) to: (result at: 57).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForvalue_binding_pattern1: nodes [
	| result |
	result := Array new: 29.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 8) to: (result at: 9).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 10).
	self addAll: ((nodes at: 2) at: 10) to: (result at: 11).
	self addAll: ((nodes at: 2) at: 11) to: (result at: 12).
	self addAll: ((nodes at: 2) at: 12) to: (result at: 13).
	self addAll: ((nodes at: 2) at: 13) to: (result at: 14).
	self addAll: ((nodes at: 2) at: 14) to: (result at: 15).
	self addAll: ((nodes at: 2) at: 15) to: (result at: 16).
	self addAll: ((nodes at: 2) at: 16) to: (result at: 17).
	self addAll: ((nodes at: 2) at: 17) to: (result at: 18).
	self addAll: ((nodes at: 2) at: 18) to: (result at: 19).
	self addAll: ((nodes at: 2) at: 19) to: (result at: 20).
	self addAll: ((nodes at: 2) at: 20) to: (result at: 21).
	self addAll: ((nodes at: 2) at: 21) to: (result at: 22).
	self addAll: ((nodes at: 2) at: 22) to: (result at: 23).
	self addAll: ((nodes at: 2) at: 23) to: (result at: 24).
	self addAll: ((nodes at: 2) at: 24) to: (result at: 25).
	self addAll: ((nodes at: 2) at: 25) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 26) to: (result at: 26).
	self addAll: ((nodes at: 2) at: 27) to: (result at: 27).
	self addAll: ((nodes at: 2) at: 28) to: (result at: 28).
	self addAll: ((nodes at: 2) at: 29) to: (result at: 29).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForvalue_binding_pattern2: nodes [
	| result |
	result := Array new: 29.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 26).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 6).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 7).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 8).
	self addAll: ((nodes at: 2) at: 8) to: (result at: 9).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 10).
	self addAll: ((nodes at: 2) at: 10) to: (result at: 11).
	self addAll: ((nodes at: 2) at: 11) to: (result at: 12).
	self addAll: ((nodes at: 2) at: 12) to: (result at: 13).
	self addAll: ((nodes at: 2) at: 13) to: (result at: 14).
	self addAll: ((nodes at: 2) at: 14) to: (result at: 15).
	self addAll: ((nodes at: 2) at: 15) to: (result at: 16).
	self addAll: ((nodes at: 2) at: 16) to: (result at: 17).
	self addAll: ((nodes at: 2) at: 17) to: (result at: 18).
	self addAll: ((nodes at: 2) at: 18) to: (result at: 19).
	self addAll: ((nodes at: 2) at: 19) to: (result at: 20).
	self addAll: ((nodes at: 2) at: 20) to: (result at: 21).
	self addAll: ((nodes at: 2) at: 21) to: (result at: 22).
	self addAll: ((nodes at: 2) at: 22) to: (result at: 23).
	self addAll: ((nodes at: 2) at: 23) to: (result at: 24).
	self addAll: ((nodes at: 2) at: 24) to: (result at: 25).
	self addAll: ((nodes at: 2) at: 25) to: (result at: 1).
	self addAll: ((nodes at: 2) at: 26) to: (result at: 26).
	self addAll: ((nodes at: 2) at: 27) to: (result at: 27).
	self addAll: ((nodes at: 2) at: 28) to: (result at: 28).
	self addAll: ((nodes at: 2) at: 29) to: (result at: 29).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForvariable_declaration1: nodes [
	| result |
	result := SwiftVariableDeclarationNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 5) to: result leftBracketTokens.
	result addTokens: ((nodes at: 1) at: 6) to: result rightBracketTokens.
	result addTokens: ((nodes at: 1) at: 7) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 1) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 1) at: 11) to: result operatorTokens.
	result
		addTokens: ((nodes at: 1) at: 12)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 1) at: 13) to: result classTokens.
	result addTokens: ((nodes at: 1) at: 14) to: result mutatingTokens.
	result addTokens: ((nodes at: 1) at: 15) to: result nonmutatingTokens.
	result addTokens: ((nodes at: 1) at: 16) to: result overrideTokens.
	result addTokens: ((nodes at: 1) at: 17) to: result staticTokens.
	result addTokens: ((nodes at: 1) at: 18) to: result unownedTokens.
	result
		addTokens: ((nodes at: 1) at: 19)
		to: result unownedLeftParensafeRightParenTokens.
	result
		addTokens: ((nodes at: 1) at: 20)
		to: result unownedLeftParenunsafeRightParenTokens.
	result addTokens: ((nodes at: 1) at: 21) to: result weakTokens.
	result varToken: ((nodes at: 1) at: 22).
	result addNodes: ((nodes at: 2) at: 1) to: result inializers.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForvariable_declaration2: nodes [
	| result |
	result := SwiftVariableDeclarationNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 5) to: result leftBracketTokens.
	result addTokens: ((nodes at: 1) at: 6) to: result rightBracketTokens.
	result addTokens: ((nodes at: 1) at: 7) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 1) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 1) at: 11) to: result operatorTokens.
	result
		addTokens: ((nodes at: 1) at: 12)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 1) at: 13) to: result classTokens.
	result addTokens: ((nodes at: 1) at: 14) to: result mutatingTokens.
	result addTokens: ((nodes at: 1) at: 15) to: result nonmutatingTokens.
	result addTokens: ((nodes at: 1) at: 16) to: result overrideTokens.
	result addTokens: ((nodes at: 1) at: 17) to: result staticTokens.
	result addTokens: ((nodes at: 1) at: 18) to: result unownedTokens.
	result
		addTokens: ((nodes at: 1) at: 19)
		to: result unownedLeftParensafeRightParenTokens.
	result
		addTokens: ((nodes at: 1) at: 20)
		to: result unownedLeftParenunsafeRightParenTokens.
	result addTokens: ((nodes at: 1) at: 21) to: result weakTokens.
	result varToken: ((nodes at: 1) at: 22).
	result addToken: (nodes at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 3) at: 1) to: result colonTokens.
	result addTokens: ((nodes at: 3) at: 2) to: result _Tokens.
	result addTokens: ((nodes at: 3) at: 3) to: result identifierTokens.
	result addTokens: ((nodes at: 3) at: 4) to: result leftParenTokens.
	result addTokens: ((nodes at: 3) at: 5) to: result rightParenTokens.
	result addTokens: ((nodes at: 3) at: 6) to: result leftBracketTokens.
	result addTokens: ((nodes at: 3) at: 7) to: result rightBracketTokens.
	result addTokens: ((nodes at: 3) at: 8) to: result leftBraceTokens.
	result addTokens: ((nodes at: 3) at: 9) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 3) at: 10)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 3) at: 11)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 3) at: 12) to: result operatorTokens.
	result
		addTokens: ((nodes at: 3) at: 13)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 3) at: 14) to: result periodTokens.
	result addTokens: ((nodes at: 3) at: 15) to: result protocolTokens.
	result addTokens: ((nodes at: 3) at: 16) to: result lessThanTokens.
	result addTokens: ((nodes at: 3) at: 17) to: result greaterThanTokens.
	result
		addTokens: ((nodes at: 3) at: 18)
		to: result minusGreaterThanTokens.
	result addTokens: ((nodes at: 3) at: 19) to: result commaTokens.
	result
		addTokens: ((nodes at: 3) at: 20)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 3) at: 21) to: result bangTokens.
	result addTokens: ((nodes at: 3) at: 22) to: result typeTokens.
	result
		addTokens: ((nodes at: 3) at: 23)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 3) at: 24) to: result inoutTokens.
	result addNode: (nodes at: 4) to: result blocks.
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForvariable_declaration3: nodes [
	| result |
	result := SwiftVariableDeclarationNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 5) to: result leftBracketTokens.
	result addTokens: ((nodes at: 1) at: 6) to: result rightBracketTokens.
	result addTokens: ((nodes at: 1) at: 7) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 1) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 1) at: 11) to: result operatorTokens.
	result
		addTokens: ((nodes at: 1) at: 12)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 1) at: 13) to: result classTokens.
	result addTokens: ((nodes at: 1) at: 14) to: result mutatingTokens.
	result addTokens: ((nodes at: 1) at: 15) to: result nonmutatingTokens.
	result addTokens: ((nodes at: 1) at: 16) to: result overrideTokens.
	result addTokens: ((nodes at: 1) at: 17) to: result staticTokens.
	result addTokens: ((nodes at: 1) at: 18) to: result unownedTokens.
	result
		addTokens: ((nodes at: 1) at: 19)
		to: result unownedLeftParensafeRightParenTokens.
	result
		addTokens: ((nodes at: 1) at: 20)
		to: result unownedLeftParenunsafeRightParenTokens.
	result addTokens: ((nodes at: 1) at: 21) to: result weakTokens.
	result varToken: ((nodes at: 1) at: 22).
	result addToken: (nodes at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 3) at: 1) to: result colonTokens.
	result addTokens: ((nodes at: 3) at: 2) to: result _Tokens.
	result addTokens: ((nodes at: 3) at: 3) to: result identifierTokens.
	result addTokens: ((nodes at: 3) at: 4) to: result leftParenTokens.
	result addTokens: ((nodes at: 3) at: 5) to: result rightParenTokens.
	result addTokens: ((nodes at: 3) at: 6) to: result leftBracketTokens.
	result addTokens: ((nodes at: 3) at: 7) to: result rightBracketTokens.
	result addTokens: ((nodes at: 3) at: 8) to: result leftBraceTokens.
	result addTokens: ((nodes at: 3) at: 9) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 3) at: 10)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 3) at: 11)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 3) at: 12) to: result operatorTokens.
	result
		addTokens: ((nodes at: 3) at: 13)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 3) at: 14) to: result periodTokens.
	result addTokens: ((nodes at: 3) at: 15) to: result protocolTokens.
	result addTokens: ((nodes at: 3) at: 16) to: result lessThanTokens.
	result addTokens: ((nodes at: 3) at: 17) to: result greaterThanTokens.
	result
		addTokens: ((nodes at: 3) at: 18)
		to: result minusGreaterThanTokens.
	result addTokens: ((nodes at: 3) at: 19) to: result commaTokens.
	result
		addTokens: ((nodes at: 3) at: 20)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 3) at: 21) to: result bangTokens.
	result addTokens: ((nodes at: 3) at: 22) to: result typeTokens.
	result
		addTokens: ((nodes at: 3) at: 23)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 3) at: 24) to: result inoutTokens.
	result addTokens: ((nodes at: 4) at: 1) to: result leftBraceTokens.
	result addTokens: ((nodes at: 4) at: 2) to: result _Tokens.
	result addTokens: ((nodes at: 4) at: 3) to: result identifierTokens.
	result addTokens: ((nodes at: 4) at: 4) to: result leftParenTokens.
	result addTokens: ((nodes at: 4) at: 5) to: result rightParenTokens.
	result addTokens: ((nodes at: 4) at: 6) to: result leftBracketTokens.
	result addTokens: ((nodes at: 4) at: 7) to: result rightBracketTokens.
	result addTokens: ((nodes at: 4) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 4) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 4) at: 10)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 4) at: 11) to: result operatorTokens.
	result
		addTokens: ((nodes at: 4) at: 12)
		to: result full_string_literalTokens.
	result getToken: ((nodes at: 4) at: 13).
	result addNodes: ((nodes at: 4) at: 14) to: result blocks.
	result setToken: ((nodes at: 4) at: 15).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForvariable_declaration4: nodes [
	| result |
	result := SwiftVariableDeclarationNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 5) to: result leftBracketTokens.
	result addTokens: ((nodes at: 1) at: 6) to: result rightBracketTokens.
	result addTokens: ((nodes at: 1) at: 7) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 1) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 1) at: 11) to: result operatorTokens.
	result
		addTokens: ((nodes at: 1) at: 12)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 1) at: 13) to: result classTokens.
	result addTokens: ((nodes at: 1) at: 14) to: result mutatingTokens.
	result addTokens: ((nodes at: 1) at: 15) to: result nonmutatingTokens.
	result addTokens: ((nodes at: 1) at: 16) to: result overrideTokens.
	result addTokens: ((nodes at: 1) at: 17) to: result staticTokens.
	result addTokens: ((nodes at: 1) at: 18) to: result unownedTokens.
	result
		addTokens: ((nodes at: 1) at: 19)
		to: result unownedLeftParensafeRightParenTokens.
	result
		addTokens: ((nodes at: 1) at: 20)
		to: result unownedLeftParenunsafeRightParenTokens.
	result addTokens: ((nodes at: 1) at: 21) to: result weakTokens.
	result varToken: ((nodes at: 1) at: 22).
	result addToken: (nodes at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 3) at: 1) to: result colonTokens.
	result addTokens: ((nodes at: 3) at: 2) to: result _Tokens.
	result addTokens: ((nodes at: 3) at: 3) to: result identifierTokens.
	result addTokens: ((nodes at: 3) at: 4) to: result leftParenTokens.
	result addTokens: ((nodes at: 3) at: 5) to: result rightParenTokens.
	result addTokens: ((nodes at: 3) at: 6) to: result leftBracketTokens.
	result addTokens: ((nodes at: 3) at: 7) to: result rightBracketTokens.
	result addTokens: ((nodes at: 3) at: 8) to: result leftBraceTokens.
	result addTokens: ((nodes at: 3) at: 9) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 3) at: 10)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 3) at: 11)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 3) at: 12) to: result operatorTokens.
	result
		addTokens: ((nodes at: 3) at: 13)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 3) at: 14) to: result periodTokens.
	result addTokens: ((nodes at: 3) at: 15) to: result protocolTokens.
	result addTokens: ((nodes at: 3) at: 16) to: result lessThanTokens.
	result addTokens: ((nodes at: 3) at: 17) to: result greaterThanTokens.
	result
		addTokens: ((nodes at: 3) at: 18)
		to: result minusGreaterThanTokens.
	result addTokens: ((nodes at: 3) at: 19) to: result commaTokens.
	result
		addTokens: ((nodes at: 3) at: 20)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 3) at: 21) to: result bangTokens.
	result addTokens: ((nodes at: 3) at: 22) to: result typeTokens.
	result
		addTokens: ((nodes at: 3) at: 23)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 3) at: 24) to: result inoutTokens.
	result addTokens: ((nodes at: 4) at: 1) to: result leftBraceTokens.
	result addTokens: ((nodes at: 4) at: 2) to: result _Tokens.
	result addTokens: ((nodes at: 4) at: 3) to: result identifierTokens.
	result addTokens: ((nodes at: 4) at: 4) to: result leftParenTokens.
	result addTokens: ((nodes at: 4) at: 5) to: result rightParenTokens.
	result addTokens: ((nodes at: 4) at: 6) to: result leftBracketTokens.
	result addTokens: ((nodes at: 4) at: 7) to: result rightBracketTokens.
	result addTokens: ((nodes at: 4) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 4) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 4) at: 10)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 4) at: 11) to: result operatorTokens.
	result
		addTokens: ((nodes at: 4) at: 12)
		to: result full_string_literalTokens.
	result getToken: ((nodes at: 4) at: 13).
	result setToken: ((nodes at: 4) at: 14).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForvariable_declaration5: nodes [
	| result |
	result := SwiftVariableDeclarationNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result leftParenTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result rightParenTokens.
	result addTokens: ((nodes at: 1) at: 5) to: result leftBracketTokens.
	result addTokens: ((nodes at: 1) at: 6) to: result rightBracketTokens.
	result addTokens: ((nodes at: 1) at: 7) to: result leftBraceTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 1) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 1) at: 10)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 1) at: 11) to: result operatorTokens.
	result
		addTokens: ((nodes at: 1) at: 12)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 1) at: 13) to: result classTokens.
	result addTokens: ((nodes at: 1) at: 14) to: result mutatingTokens.
	result addTokens: ((nodes at: 1) at: 15) to: result nonmutatingTokens.
	result addTokens: ((nodes at: 1) at: 16) to: result overrideTokens.
	result addTokens: ((nodes at: 1) at: 17) to: result staticTokens.
	result addTokens: ((nodes at: 1) at: 18) to: result unownedTokens.
	result
		addTokens: ((nodes at: 1) at: 19)
		to: result unownedLeftParensafeRightParenTokens.
	result
		addTokens: ((nodes at: 1) at: 20)
		to: result unownedLeftParenunsafeRightParenTokens.
	result addTokens: ((nodes at: 1) at: 21) to: result weakTokens.
	result varToken: ((nodes at: 1) at: 22).
	result addToken: (nodes at: 2) to: result identifierTokens.
	result addTokens: ((nodes at: 3) at: 1) to: result colonTokens.
	result addTokens: ((nodes at: 3) at: 2) to: result _Tokens.
	result addTokens: ((nodes at: 3) at: 3) to: result identifierTokens.
	result addTokens: ((nodes at: 3) at: 4) to: result leftParenTokens.
	result addTokens: ((nodes at: 3) at: 5) to: result rightParenTokens.
	result addTokens: ((nodes at: 3) at: 6) to: result leftBracketTokens.
	result addTokens: ((nodes at: 3) at: 7) to: result rightBracketTokens.
	result addTokens: ((nodes at: 3) at: 8) to: result leftBraceTokens.
	result addTokens: ((nodes at: 3) at: 9) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 3) at: 10)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 3) at: 11)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 3) at: 12) to: result operatorTokens.
	result
		addTokens: ((nodes at: 3) at: 13)
		to: result full_string_literalTokens.
	result addTokens: ((nodes at: 3) at: 14) to: result periodTokens.
	result addTokens: ((nodes at: 3) at: 15) to: result protocolTokens.
	result addTokens: ((nodes at: 3) at: 16) to: result lessThanTokens.
	result addTokens: ((nodes at: 3) at: 17) to: result greaterThanTokens.
	result
		addTokens: ((nodes at: 3) at: 18)
		to: result minusGreaterThanTokens.
	result addTokens: ((nodes at: 3) at: 19) to: result commaTokens.
	result
		addTokens: ((nodes at: 3) at: 20)
		to: result questionMarkTokens.
	result addTokens: ((nodes at: 3) at: 21) to: result bangTokens.
	result addTokens: ((nodes at: 3) at: 22) to: result typeTokens.
	result
		addTokens: ((nodes at: 3) at: 23)
		to: result periodPeriodPeriodTokens.
	result addTokens: ((nodes at: 3) at: 24) to: result inoutTokens.
	result equalToken: ((nodes at: 4) at: 1).
	result expression: ((nodes at: 4) at: 2).
	result addTokens: ((nodes at: 5) at: 1) to: result leftBraceTokens.
	result addTokens: ((nodes at: 5) at: 2) to: result _Tokens.
	result addTokens: ((nodes at: 5) at: 3) to: result identifierTokens.
	result addTokens: ((nodes at: 5) at: 4) to: result leftParenTokens.
	result addTokens: ((nodes at: 5) at: 5) to: result rightParenTokens.
	result addTokens: ((nodes at: 5) at: 6) to: result leftBracketTokens.
	result addTokens: ((nodes at: 5) at: 7) to: result rightBracketTokens.
	result addTokens: ((nodes at: 5) at: 8) to: result rightBraceTokens.
	result
		addTokens: ((nodes at: 5) at: 9)
		to: result integer_literalTokens.
	result
		addTokens: ((nodes at: 5) at: 10)
		to: result floating_point_literalTokens.
	result addTokens: ((nodes at: 5) at: 11) to: result operatorTokens.
	result
		addTokens: ((nodes at: 5) at: 12)
		to: result full_string_literalTokens.
	result willSetToken: ((nodes at: 5) at: 13).
	result addNodes: ((nodes at: 5) at: 14) to: result blocks.
	result didSetToken: ((nodes at: 5) at: 15).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForvariable_declaration_head1: nodes [
	| result |
	result := Array new: 22.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 6) to: (result at: 6).
	self addAll: ((nodes at: 1) at: 7) to: (result at: 7).
	self addAll: ((nodes at: 1) at: 8) to: (result at: 8).
	self addAll: ((nodes at: 1) at: 9) to: (result at: 9).
	self addAll: ((nodes at: 1) at: 10) to: (result at: 10).
	self addAll: ((nodes at: 1) at: 11) to: (result at: 11).
	self addAll: ((nodes at: 1) at: 12) to: (result at: 12).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 13).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 14).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 15).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 16).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 17).
	self addAll: ((nodes at: 2) at: 6) to: (result at: 18).
	self addAll: ((nodes at: 2) at: 7) to: (result at: 19).
	self addAll: ((nodes at: 2) at: 8) to: (result at: 20).
	self addAll: ((nodes at: 2) at: 9) to: (result at: 21).
	result at: 22 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForwhile_statement1: nodes [
	| result |
	result := SwiftWhileStatementNode new.
	result whileToken: (nodes at: 1).
	result expression: (nodes at: 2).
	result block: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SwiftParser >> reduceActionForwildcard_expression1: nodes [
	| result |
	result := SwiftWildcardExpressionNode new.
	result _Token: (nodes at: 1).
	^ result
]

{ #category : #generated }
SwiftParser >> reduceTable [
^#(
	#(173 0 #reduceActionFor_attributes1:) 
	#(172 0 #reduceActionFor_statements1:) 
	#(112 0 #nil) 
	#(137 1 #reduceActionForfallthrough_statement1:) 
	#(331 0 #reduceActionFor_expression_element_list1:) 
	#(111 0 #reduceActionFor_for_init1:) 
	#(287 0 #nil) 
	#(139 0 #nil) 
	#(327 0 #reduceActionFor_closure_signature1:) 
	#(308 1 #reduceActionForliteral_expression4:) 
	#(308 1 #reduceActionForliteral_expression5:) 
	#(308 1 #reduceActionForliteral_expression7:) 
	#(308 1 #reduceActionForliteral_expression6:) 
	#(318 0 #reduceActionFor_for_init1:) 
	#(309 1 #reduceActionForself_expression1:) 
	#(314 1 #reduceActionForwildcard_expression1:) 
	#(307 0 #reduceActionFor_generic_argument_clause1:) 
	#(134 1 #reduceActionForlabel_name1:) 
	#(93 1 #reduceActionForliteral1:) 
	#(93 1 #reduceActionForliteral2:) 
	#(94 1 #reduceActionForlabel_name1:) 
	#(96 1 #reduceActionForlabel_name1:) 
	#(308 1 #reduceActionForliteral_expression1:) 
	#(93 1 #reduceActionForliteral3:) 
	#(99 0 #nil) 
	#(106 1 #reduceActionForstatements1:) 
	#(172 1 #reduceActionFor_statements2:) 
	#(101 1 #reduceActionForlabel_name1:) 
	#(100 1 #reduceActionForlabel_name1:) 
	#(102 1 #reduceActionForlabel_name1:) 
	#(104 1 #reduceActionForlabel_name1:) 
	#(183 1 #reduceActionFor_statements2:) 
	#(170 0 #reduceActionFordeclaration_specifiers1:) 
	#(178 0 #reduceActionFordeclaration_specifiers1:) 
	#(263 0 #nil) 
	#(365 1 #reduceActionForfile1:) 
	#(205 0 #reduceActionFor_generic_parameter_clause1:) 
	#(168 1 #reduceActionForlabel_name1:) 
	#(296 1 #reduceActionForattributes1:) 
	#(173 1 #reduceActionFor_statements2:) 
	#(98 1 #reduceActionForlabel_name1:) 
	#(299 1 #reduceActionForlabel_name1:) 
	#(342 0 #nil) 
	#(315 1 #reduceActionForlabel_name1:) 
	#(301 1 #reduceActionForpostfix_expression1:) 
	#(308 1 #reduceActionForliteral_expression2:) 
	#(308 1 #reduceActionForliteral_expression3:) 
	#(310 1 #reduceActionForlabel_name1:) 
	#(112 1 #reduceActionForlabel_name1:) 
	#(138 2 #reduceActionForreturn_statement1:) 
	#(202 1 #reduceActionForlabel_name1:) 
	#(200 2 #reduceActionFortypealias_head1:) 
	#(118 1 #reduceActionForlabel_name1:) 
	#(332 1 #reduceActionForlabel_name1:) 
	#(333 1 #reduceActionFor_expression_element_list1:) 
	#(331 1 #reduceActionFor_statements2:) 
	#(284 0 #reduceActionFor_tuple_pattern_element_list1:) 
	#(276 1 #reduceActionForlabel_name1:) 
	#(278 1 #reduceActionForlabel_name1:) 
	#(144 1 #reduceActionForlabel_name1:) 
	#(283 1 #reduceActionForlabel_name1:) 
	#(115 1 #reduceActionForexpression_list1:) 
	#(116 1 #reduceActionForexpression_list1:) 
	#(116 1 #reduceActionFor_statements2:) 
	#(111 1 #reduceActionFor_statements2:) 
	#(287 1 #reduceActionForlabel_name1:) 
	#(277 0 #reduceActionFor_type_annotation1:) 
	#(117 1 #reduceActionForpattern3:) 
	#(117 1 #reduceActionForpattern5:) 
	#(117 1 #reduceActionForpattern6:) 
	#(117 1 #reduceActionForpattern7:) 
	#(282 1 #reduceActionFortype_casting_pattern1:) 
	#(282 1 #reduceActionFortype_casting_pattern2:) 
	#(121 1 #reduceActionForlabel_name1:) 
	#(139 1 #reduceActionForlabel_name1:) 
	#(135 2 #reduceActionForbreak_statement1:) 
	#(136 2 #reduceActionForcontinue_statement1:) 
	#(215 0 #nil) 
	#(91 1 #reduceActionForexpression_list1:) 
	#(209 0 #reduceActionFor_type_annotation1:) 
	#(327 1 #reduceActionFor_statements2:) 
	#(313 2 #reduceActionForimplicit_member_expression1:) 
	#(302 2 #reduceActionForin_out_expression1:) 
	#(291 1 #reduceActionForlabel_name1:) 
	#(292 0 #reduceActionFor_attribute_argument_clause1:) 
	#(319 1 #reduceActionForlabel_name1:) 
	#(320 0 #nil) 
	#(318 1 #reduceActionFor_statements2:) 
	#(243 0 #reduceActionFor_type_inheritance_clause1:) 
	#(307 1 #reduceActionFor_statements2:) 
	#(315 2 #reduceActionForprimary_expression1:) 
	#(299 2 #reduceActionForprefix_expression2:) 
	#(99 1 #reduceActionForlabel_name1:) 
	#(105 2 #reduceActionForstatement1:) 
	#(105 2 #reduceActionForstatement2:) 
	#(105 2 #reduceActionForstatement3:) 
	#(106 2 #reduceActionForstatements2:) 
	#(103 2 #reduceActionForlabeled_statement1:) 
	#(133 2 #reduceActionFortypealias_head1:) 
	#(174 0 #reduceActionFor_import_kind1:) 
	#(263 1 #reduceActionForlabel_name1:) 
	#(225 1 #reduceActionForlabel_name1:) 
	#(178 1 #reduceActionFor_statements2:) 
	#(160 2 #reduceActionForenum_declaration1:) 
	#(160 2 #reduceActionForenum_declaration2:) 
	#(158 2 #reduceActionFortypealias_declaration1:) 
	#(204 1 #reduceActionForfunction_name1:) 
	#(204 1 #reduceActionForfunction_name2:) 
	#(205 1 #reduceActionFor_statements2:) 
	#(296 2 #reduceActionForattributes2:) 
	#(303 1 #reduceActionForlabel_name1:) 
	#(95 1 #reduceActionForlabel_name1:) 
	#(98 2 #reduceActionForexpression2:) 
	#(306 1 #reduceActionForbinary_expression4:) 
	#(300 1 #reduceActionForstatements1:) 
	#(341 2 #reduceActionForoptional_chaining_expression1:) 
	#(340 2 #reduceActionForforced_value_expression1:) 
	#(97 1 #reduceActionForlabel_name1:) 
	#(301 2 #reduceActionForpostfix_expression2:) 
	#(334 2 #reduceActionForfunction_call_expression1:) 
	#(342 1 #reduceActionForlabel_name1:) 
	#(184 1 #reduceActionForlabel_name1:) 
	#(181 0 #reduceActionFor_initializer1:) 
	#(114 2 #reduceActionForvariable_declaration1:) 
	#(179 1 #reduceActionForexpression_list1:) 
	#(109 3 #reduceActionForwhile_statement1:) 
	#(312 3 #reduceActionForparenthesized_expression1:) 
	#(279 2 #reduceActionForvalue_binding_pattern1:) 
	#(285 1 #reduceActionFor_statements2:) 
	#(286 1 #reduceActionFor_statements2:) 
	#(284 1 #reduceActionFor_statements2:) 
	#(279 2 #reduceActionForvalue_binding_pattern2:) 
	#(351 0 #reduceActionFor_type_annotation1:) 
	#(155 1 #reduceActionForlabel_name1:) 
	#(289 2 #reduceActionForis_pattern1:) 
	#(145 2 #reduceActionFortype_identifier1:) 
	#(277 1 #reduceActionFor_statements2:) 
	#(117 2 #reduceActionForpattern1:) 
	#(117 2 #reduceActionForpattern2:) 
	#(117 2 #reduceActionForpattern4:) 
	#(122 0 #reduceActionFor_initializer1:) 
	#(211 2 #reduceActionForparameter_clause1:) 
	#(215 1 #reduceActionForlabel_name1:) 
	#(213 0 #nil) 
	#(212 1 #reduceActionForparameter_list1:) 
	#(216 0 #nil) 
	#(330 1 #reduceActionForcapture_specifier3:) 
	#(330 1 #reduceActionForcapture_specifier2:) 
	#(330 1 #reduceActionForcapture_specifier1:) 
	#(330 1 #reduceActionForcapture_specifier4:) 
	#(209 1 #reduceActionFor_statements2:) 
	#(329 2 #reduceActionForclosure_signature5:) 
	#(124 0 #reduceActionFor_switch_cases1:) 
	#(294 0 #reduceActionFor_attribute_argument_clause1:) 
	#(293 3 #reduceActionForattribute1:) 
	#(292 1 #reduceActionFor_statements2:) 
	#(317 3 #reduceActionFordictionary_literal2:) 
	#(316 3 #reduceActionForarray_literal1:) 
	#(320 1 #reduceActionForlabel_name1:) 
	#(321 2 #reduceActionForarray_literal_items1:) 
	#(317 3 #reduceActionFordictionary_literal1:) 
	#(322 2 #reduceActionFordictionary_literal_items1:) 
	#(326 3 #reduceActionForsuperclass_initializer_expression1:) 
	#(324 3 #reduceActionForsuperclass_method_expression1:) 
	#(309 3 #reduceActionForself_expression4:) 
	#(309 3 #reduceActionForself_expression2:) 
	#(243 1 #reduceActionFor_statements2:) 
	#(152 1 #reduceActionForgeneric_argument_list1:) 
	#(154 1 #reduceActionForlabel_name1:) 
	#(246 1 #reduceActionForlabel_name1:) 
	#(248 1 #reduceActionForlabel_name1:) 
	#(242 1 #reduceActionForlabel_name1:) 
	#(176 1 #reduceActionForimport_kind3:) 
	#(176 1 #reduceActionForimport_kind5:) 
	#(176 1 #reduceActionForimport_kind6:) 
	#(176 1 #reduceActionForimport_kind4:) 
	#(176 1 #reduceActionForimport_kind2:) 
	#(176 1 #reduceActionForimport_kind7:) 
	#(176 1 #reduceActionForimport_kind1:) 
	#(174 1 #reduceActionFor_statements2:) 
	#(165 3 #reduceActionFordeinitializer_declaration1:) 
	#(259 3 #reduceActionForsubscript_head1:) 
	#(171 1 #reduceActionFordeclaration_specifier3:) 
	#(171 1 #reduceActionFordeclaration_specifier4:) 
	#(171 1 #reduceActionFordeclaration_specifier2:) 
	#(171 1 #reduceActionFordeclaration_specifier1:) 
	#(171 1 #reduceActionFordeclaration_specifier5:) 
	#(171 1 #reduceActionFordeclaration_specifier7:) 
	#(171 1 #reduceActionFordeclaration_specifier6:) 
	#(171 1 #reduceActionFordeclaration_specifier9:) 
	#(171 1 #reduceActionFordeclaration_specifier8:) 
	#(170 2 #reduceActionFordeclaration_specifiers2:) 
	#(366 3 #reduceActionForvariable_declaration_head1:) 
	#(203 3 #reduceActionForvariable_declaration_head1:) 
	#(258 3 #reduceActionForinitializer_head1:) 
	#(201 2 #reduceActionForis_pattern1:) 
	#(208 0 #reduceActionForparameter_clauses1:) 
	#(141 0 #reduceActionFor_requirement_clause1:) 
	#(140 1 #reduceActionForgeneric_parameter_list1:) 
	#(143 1 #reduceActionForgeneric_parameter1:) 
	#(167 3 #reduceActionForsubscript_declaration1:) 
	#(167 3 #reduceActionForsubscript_declaration2:) 
	#(167 3 #reduceActionForsubscript_declaration3:) 
	#(305 2 #reduceActionFortype_casting_operator2:) 
	#(305 2 #reduceActionFortype_casting_operator1:) 
	#(306 2 #reduceActionForbinary_expression1:) 
	#(300 2 #reduceActionForstatements2:) 
	#(306 2 #reduceActionForbinary_expression2:) 
	#(306 2 #reduceActionForbinary_expression3:) 
	#(338 3 #reduceActionFordynamic_type_expression1:) 
	#(337 3 #reduceActionForpostfix_self_expression1:) 
	#(335 3 #reduceActionForinitializer_expression1:) 
	#(336 3 #reduceActionForexplicit_member_expression1:) 
	#(343 1 #reduceActionForlabel_name1:) 
	#(334 3 #reduceActionForfunction_call_expression1:) 
	#(180 2 #reduceActionForpattern_initializer1:) 
	#(181 1 #reduceActionFor_statements2:) 
	#(332 3 #reduceActionForexpression_element2:) 
	#(333 3 #reduceActionForexpression_element_list2:) 
	#(113 3 #reduceActionForcode_block1:) 
	#(110 4 #reduceActionFordo_while_statement1:) 
	#(280 3 #reduceActionFortuple_pattern1:) 
	#(356 0 #reduceActionFor_protocol_identifier_list1:) 
	#(351 1 #reduceActionFor_statements2:) 
	#(352 1 #reduceActionFor_statements2:) 
	#(348 2 #reduceActionForoptional_type1:) 
	#(349 2 #reduceActionForimplicitly_unwrapped_optional_type1:) 
	#(115 3 #reduceActionForexpression_list2:) 
	#(290 3 #reduceActionForas_pattern1:) 
	#(232 1 #reduceActionForlabel_name1:) 
	#(288 0 #reduceActionFor_tuple_pattern_element_list1:) 
	#(119 4 #reduceActionForif_statement1:) 
	#(122 1 #reduceActionFor_statements2:) 
	#(214 2 #reduceActionForparameter3:) 
	#(213 1 #reduceActionForlabel_name1:) 
	#(217 0 #nil) 
	#(216 1 #reduceActionForlabel_name1:) 
	#(91 3 #reduceActionForexpression_list2:) 
	#(329 3 #reduceActionForclosure_signature2:) 
	#(329 3 #reduceActionForclosure_signature1:) 
	#(311 4 #reduceActionForclosure_expression1:) 
	#(126 1 #reduceActionForswitch_cases1:) 
	#(124 1 #reduceActionFor_statements2:) 
	#(297 1 #reduceActionForbalanced_token4:) 
	#(297 1 #reduceActionForbalanced_token6:) 
	#(297 1 #reduceActionForbalanced_token5:) 
	#(298 1 #reduceActionFor_statements2:) 
	#(294 1 #reduceActionFor_statements2:) 
	#(323 3 #reduceActionFordictionary_literal_item1:) 
	#(321 3 #reduceActionForarray_literal_items2:) 
	#(322 3 #reduceActionFordictionary_literal_items2:) 
	#(325 4 #reduceActionForsuperclass_subscript_expression1:) 
	#(309 4 #reduceActionForself_expression3:) 
	#(359 1 #reduceActionFor_protocol_identifier_list1:) 
	#(360 2 #reduceActionFortype_inheritance_clause1:) 
	#(169 0 #reduceActionFor_statements1:) 
	#(245 0 #reduceActionFor_statements1:) 
	#(166 4 #reduceActionForextension_declaration1:) 
	#(269 0 #reduceActionFor_initializer1:) 
	#(268 0 #reduceActionFor_infix_operator_attributes1:) 
	#(153 3 #reduceActionForgeneric_argument_clause1:) 
	#(177 1 #reduceActionForfunction_name1:) 
	#(177 1 #reduceActionForfunction_name2:) 
	#(156 4 #reduceActionForimport_declaration1:) 
	#(175 1 #reduceActionForimport_path1:) 
	#(157 4 #reduceActionForconstant_declaration1:) 
	#(226 0 #reduceActionFor_union_style_enum_members1:) 
	#(141 1 #reduceActionFor_statements2:) 
	#(262 1 #reduceActionForlabel_name1:) 
	#(164 4 #reduceActionForinitializer_declaration1:) 
	#(260 3 #reduceActionForsubscript_result1:) 
	#(190 0 #reduceActionFor_setter_clause1:) 
	#(195 0 #reduceActionFor_setter_keyword_clause1:) 
	#(304 3 #reduceActionFordictionary_literal_item1:) 
	#(305 3 #reduceActionFortype_casting_operator3:) 
	#(336 4 #reduceActionForexplicit_member_expression2:) 
	#(339 4 #reduceActionForsubscript_expression1:) 
	#(182 2 #reduceActionFortypealias_head1:) 
	#(179 3 #reduceActionForexpression_list2:) 
	#(114 4 #reduceActionForvariable_declaration2:) 
	#(114 4 #reduceActionForvariable_declaration3:) 
	#(114 4 #reduceActionForvariable_declaration4:) 
	#(286 3 #reduceActionFortuple_pattern_element_list2:) 
	#(357 1 #reduceActionForlabel_name1:) 
	#(358 1 #reduceActionFor_protocol_identifier_list1:) 
	#(356 1 #reduceActionFor_statements2:) 
	#(355 1 #reduceActionForlabel_name1:) 
	#(347 3 #reduceActionFortuple_type1:) 
	#(353 2 #reduceActionFortuple_type_body1:) 
	#(344 3 #reduceActionForarray_type1:) 
	#(350 3 #reduceActionFormetatype_type2:) 
	#(350 3 #reduceActionFormetatype_type1:) 
	#(346 3 #reduceActionForfunction_type1:) 
	#(108 5 #reduceActionForfor_in_statement1:) 
	#(145 4 #reduceActionFortype_identifier2:) 
	#(185 3 #reduceActionForsubscript_result1:) 
	#(288 1 #reduceActionFor_statements2:) 
	#(281 4 #reduceActionForenum_case_pattern1:) 
	#(123 2 #reduceActionFortypealias_head1:) 
	#(212 3 #reduceActionForparameter_list2:) 
	#(211 4 #reduceActionForparameter_clause2:) 
	#(217 1 #reduceActionForlabel_name1:) 
	#(328 4 #reduceActionForcapture_list1:) 
	#(210 3 #reduceActionForsubscript_result1:) 
	#(329 4 #reduceActionForclosure_signature4:) 
	#(329 4 #reduceActionForclosure_signature3:) 
	#(128 2 #reduceActionFortypealias_head1:) 
	#(130 0 #reduceActionFor_initializer1:) 
	#(120 5 #reduceActionForswitch_statement1:) 
	#(126 2 #reduceActionForswitch_cases2:) 
	#(125 2 #reduceActionForswitch_case2:) 
	#(125 2 #reduceActionForswitch_case1:) 
	#(125 2 #reduceActionForswitch_case4:) 
	#(125 2 #reduceActionForswitch_case3:) 
	#(295 3 #reduceActionForattribute_argument_clause1:) 
	#(298 2 #reduceActionForbalanced_tokens2:) 
	#(245 1 #reduceActionFor_statements2:) 
	#(270 0 #reduceActionFor_associativity_clause1:) 
	#(268 1 #reduceActionFor_statements2:) 
	#(269 1 #reduceActionFor_statements2:) 
	#(265 5 #reduceActionForprefix_operator_declaration1:) 
	#(266 5 #reduceActionForpostfix_operator_declaration1:) 
	#(152 3 #reduceActionForgeneric_argument_list2:) 
	#(250 0 #reduceActionFor_statements1:) 
	#(163 5 #reduceActionForprotocol_declaration1:) 
	#(227 1 #reduceActionFor_union_style_enum_members1:) 
	#(228 1 #reduceActionFor_statements2:) 
	#(226 1 #reduceActionFor_union_style_enum_members2:) 
	#(227 1 #reduceActionForunion_style_enum_member2:) 
	#(207 1 #reduceActionForlabel_name1:) 
	#(159 5 #reduceActionForfunction_declaration1:) 
	#(206 2 #reduceActionForfunction_signature1:) 
	#(208 2 #reduceActionForparameter_clauses2:) 
	#(140 3 #reduceActionForgeneric_parameter_list2:) 
	#(148 2 #reduceActionForrequirement_clause1:) 
	#(147 1 #reduceActionForrequirement_list1:) 
	#(149 1 #reduceActionForrequirement1:) 
	#(149 1 #reduceActionForrequirement2:) 
	#(142 4 #reduceActionForgeneric_parameter_clause1:) 
	#(143 3 #reduceActionForgeneric_parameter2:) 
	#(194 2 #reduceActionForgetter_keyword_clause1:) 
	#(192 0 #reduceActionFor_setter_name1:) 
	#(196 2 #reduceActionForgetter_keyword_clause1:) 
	#(190 1 #reduceActionFor_statements2:) 
	#(195 1 #reduceActionFor_statements2:) 
	#(114 5 #reduceActionForvariable_declaration5:) 
	#(146 4 #reduceActionForprotocol_composition_type1:) 
	#(354 3 #reduceActionFortuple_type_element1:) 
	#(354 3 #reduceActionFortuple_type_element2:) 
	#(352 3 #reduceActionFortuple_type_element_list2:) 
	#(218 1 #reduceActionForfunction_name2:) 
	#(218 1 #reduceActionForfunction_name1:) 
	#(219 0 #reduceActionFor_initializer1:) 
	#(129 2 #reduceActionForcase_item_list1:) 
	#(130 1 #reduceActionFor_statements2:) 
	#(127 3 #reduceActionForcase_label1:) 
	#(297 3 #reduceActionForattribute_argument_clause1:) 
	#(297 3 #reduceActionForbalanced_token3:) 
	#(297 3 #reduceActionForbalanced_token2:) 
	#(359 3 #reduceActionFortype_inheritance_list2:) 
	#(169 2 #reduceActionForstatements2:) 
	#(264 3 #reduceActionForextension_body1:) 
	#(272 1 #reduceActionForlabel_name1:) 
	#(273 2 #reduceActionFortypealias_head1:) 
	#(267 6 #reduceActionForinfix_operator_declaration1:) 
	#(271 2 #reduceActionForinfix_operator_attributes1:) 
	#(270 1 #reduceActionFor_statements2:) 
	#(162 6 #reduceActionForclass_declaration1:) 
	#(256 1 #reduceActionForlabel_name1:) 
	#(257 1 #reduceActionForstatements1:) 
	#(250 1 #reduceActionFor_statements2:) 
	#(161 6 #reduceActionForstruct_declaration1:) 
	#(175 3 #reduceActionForimport_path2:) 
	#(234 0 #reduceActionFor_union_style_enum_members1:) 
	#(223 5 #reduceActionForunion_style_enum1:) 
	#(228 2 #reduceActionForunion_style_enum_members2:) 
	#(189 3 #reduceActionForinitializer_head1:) 
	#(192 1 #reduceActionFor_statements2:) 
	#(186 4 #reduceActionForgetter_setter_block1:) 
	#(186 4 #reduceActionForgetter_setter_block2:) 
	#(187 4 #reduceActionForgetter_setter_keyword_block1:) 
	#(187 4 #reduceActionForgetter_setter_keyword_block2:) 
	#(198 0 #reduceActionFor_setter_clause1:) 
	#(358 3 #reduceActionFortype_inheritance_list2:) 
	#(345 5 #reduceActionFordictionary_type1:) 
	#(107 7 #reduceActionForfor_statement1:) 
	#(221 1 #reduceActionForfunction_name2:) 
	#(221 1 #reduceActionForfunction_name1:) 
	#(219 1 #reduceActionFor_statements2:) 
	#(131 1 #reduceActionForlabel_name1:) 
	#(132 2 #reduceActionFortypealias_head1:) 
	#(274 1 #reduceActionForliteral3:) 
	#(274 1 #reduceActionForliteral1:) 
	#(274 1 #reduceActionForliteral2:) 
	#(275 2 #reduceActionForassociativity_clause1:) 
	#(261 0 #reduceActionFor_typealias_assignment1:) 
	#(249 3 #reduceActionForextension_body1:) 
	#(257 2 #reduceActionForstatements2:) 
	#(235 1 #reduceActionFor_union_style_enum_members1:) 
	#(236 1 #reduceActionFor_union_style_enum_members2:) 
	#(234 1 #reduceActionFor_statements2:) 
	#(235 1 #reduceActionForraw_value_style_enum_member2:) 
	#(229 3 #reduceActionForunion_style_enum_case_clause1:) 
	#(230 1 #reduceActionFor_statements2:) 
	#(233 0 #nil) 
	#(151 3 #reduceActionForsame_type_requirement1:) 
	#(150 3 #reduceActionForconformance_requirement1:) 
	#(147 3 #reduceActionForrequirement_list2:) 
	#(191 4 #reduceActionForsetter_clause1:) 
	#(198 1 #reduceActionFor_statements2:) 
	#(220 0 #reduceActionFor_initializer1:) 
	#(129 4 #reduceActionForcase_item_list2:) 
	#(247 3 #reduceActionForextension_body1:) 
	#(261 1 #reduceActionFor_statements2:) 
	#(255 3 #reduceActionForprotocol_association_type_declaration1:) 
	#(253 3 #reduceActionForprotocol_initializer_declaration1:) 
	#(254 3 #reduceActionForprotocol_subscript_declaration1:) 
	#(244 3 #reduceActionForextension_body1:) 
	#(224 7 #reduceActionForraw_value_style_enum1:) 
	#(236 2 #reduceActionForraw_value_style_enum_members2:) 
	#(231 2 #reduceActionForunion_style_enum_case1:) 
	#(233 1 #reduceActionForlabel_name1:) 
	#(193 3 #reduceActionFordictionary_literal_item1:) 
	#(188 4 #reduceActionForgetter_setter_block1:) 
	#(188 4 #reduceActionForgetter_setter_block2:) 
	#(107 9 #reduceActionForfor_statement2:) 
	#(214 7 #reduceActionForparameter2:) 
	#(220 1 #reduceActionFor_statements2:) 
	#(214 7 #reduceActionForparameter1:) 
	#(252 4 #reduceActionForprotocol_method_declaration1:) 
	#(251 4 #reduceActionForprotocol_property_declaration1:) 
	#(240 0 #reduceActionFor_associativity_clause1:) 
	#(237 3 #reduceActionForraw_value_style_enum_case_clause1:) 
	#(238 1 #reduceActionForraw_value_style_enum_case_list1:) 
	#(230 3 #reduceActionFortuple_type_element_list2:) 
	#(199 4 #reduceActionForsetter_clause1:) 
	#(197 4 #reduceActionForsetter_clause1:) 
	#(222 2 #reduceActionFortypealias_head1:) 
	#(239 2 #reduceActionForraw_value_style_enum_case1:) 
	#(240 1 #reduceActionFor_statements2:) 
	#(241 2 #reduceActionForassociativity_clause1:) 
	#(238 3 #reduceActionForraw_value_style_enum_case_list2:)
	).
]

{ #category : #generated }
SwiftParser >> symbolNames [
	^ #('"nonmutating"' '"override"' '"mutating"' '"class"' '"static"' '"<"' '">"' '"unowned(safe)"' '"unowned"' '"=="' '"return"' '"protocol"' '"var"' '"enum"' '"struct"' '"func"' '"weak"' '"import"' '"unowned(unsafe)"' '"fallthrough"' '"typealias"' '"in"' '"while"' '")"' '"("' '"do"' '","' '"for"' '"else"' '"if"' '";"' '"let"' '"where"' '"break"' '"default"' '":"' '"continue"' '"{"' '"}"' '"switch"' '"."' '"case"' '"?"' '"__FILE__"' '"&"' '"]"' '"__LINE__"' '"as"' '"@"' '"__FUNCTION__"' '"__COLUMN__"' '"["' '"is"' '"convenience"' '"..."' '"Protocol"' '"Type"' '"#"' '"super"' '"dynamicType"' '"self"' '"none"' '"!"' '"->"' '"_"' '"didSet"' '"willSet"' '"init"' '"="' '"get"' '"extension"' '"deinit"' '"set"' '"inout"' '"associativity"' '"left"' '"precedence"' '"infix"' '"right"' '"operator"' '"prefix"' '"subscript"' '"postfix"' '<whitespace>' '<comment>' '<identifier>' '<integer_literal>' '<floating_point_literal>' '<full_string_literal>' '<operator>' 'identifier_list' 'B e g i n' 'literal' 'string_literal' 'binary_operator' 'prefix_operator' 'postfix_operator' 'expression' '_semicolon' 'declaration' 'loop_statement' 'branch_statement' 'labeled_statement' 'control_transfer_statement' 'statement' 'statements' 'for_statement' 'for_in_statement' 'while_statement' 'do_while_statement' '_for_init' '_expression' 'code_block' 'variable_declaration' 'expression_list' 'for_init' 'pattern' 'while_condition' 'if_statement' 'switch_statement' 'if_condition' '_else_clause' 'else_clause' '_switch_cases' 'switch_case' 'switch_cases' 'case_label' 'default_label' 'case_item_list' '_guard_clause' 'guard_expression' 'guard_clause' 'statement_label' 'label_name' 'break_statement' 'continue_statement' 'fallthrough_statement' 'return_statement' '_label_name' 'generic_parameter_list' '_requirement_clause' 'generic_parameter_clause' 'generic_parameter' 'type_name' 'type_identifier' 'protocol_composition_type' 'requirement_list' 'requirement_clause' 'requirement' 'conformance_requirement' 'same_type_requirement' 'generic_argument_list' 'generic_argument_clause' 'generic_argument' 'type' 'import_declaration' 'constant_declaration' 'typealias_declaration' 'function_declaration' 'enum_declaration' 'struct_declaration' 'class_declaration' 'protocol_declaration' 'initializer_declaration' 'deinitializer_declaration' 'extension_declaration' 'subscript_declaration' 'operator_declaration' 'declarations' 'declaration_specifiers' 'declaration_specifier' '_statements' '_attributes' '_import_kind' 'import_path' 'import_kind' 'import_path_identifier' '_declaration_specifiers' 'pattern_initializer_list' 'pattern_initializer' '_initializer' 'initializer' 'top_level_declaration' 'variable_name' 'type_annotation' 'getter_setter_block' 'getter_setter_keyword_block' 'willSet_didSet_block' 'getter_clause' '_setter_clause' 'setter_clause' '_setter_name' 'setter_name' 'getter_keyword_clause' '_setter_keyword_clause' 'setter_keyword_clause' 'willSet_clause' '_didSet_clause' 'didSet_clause' 'typealias_head' 'typealias_assignment' 'typealias_name' 'function_head' 'function_name' '_generic_parameter_clause' 'function_signature' 'function_body' 'parameter_clauses' '_function_result' 'function_result' 'parameter_clause' 'parameter_list' '_ellipsis' 'parameter' '_inout' '_let' '_hash' 'parameter_name' '_local_parameter_name' '_default_argument_clause' 'local_parameter_name' 'default_argument_clause' 'union_style_enum' 'raw_value_style_enum' 'enum_name' '_union_style_enum_members' 'union_style_enum_member' 'union_style_enum_members' 'union_style_enum_case_clause' 'union_style_enum_case_list' 'union_style_enum_case' 'enum_case_name' '_tuple_type' '_raw_value_style_enum_members' 'raw_value_style_enum_member' 'raw_value_style_enum_members' 'raw_value_style_enum_case_clause' 'raw_value_style_enum_case_list' 'raw_value_style_enum_case' '_raw_value_assignment' 'raw_value_assignment' 'struct_name' '_type_inheritance_clause' 'struct_body' '_declarations' 'class_name' 'class_body' 'protocol_name' 'protocol_body' '_protocol_member_declarations' 'protocol_property_declaration' 'protocol_method_declaration' 'protocol_initializer_declaration' 'protocol_subscript_declaration' 'protocol_association_type_declaration' 'protocol_member_declaration' 'protocol_member_declarations' 'initializer_head' 'subscript_head' 'subscript_result' '_typealias_assignment' 'initializer_body' '_convenience' 'extension_body' 'prefix_operator_declaration' 'postfix_operator_declaration' 'infix_operator_declaration' '_infix_operator_attributes' '_precedence_clause' '_associativity_clause' 'infix_operator_attributes' 'precedence_level' 'precedence_clause' 'associativity' 'associativity_clause' 'wildcard_pattern' '_type_annotation' 'identifier_pattern' 'value_binding_pattern' 'tuple_pattern' 'enum_case_pattern' 'type_casting_pattern' 'expression_pattern' '_tuple_pattern_element_list' 'tuple_pattern_element' 'tuple_pattern_element_list' '_type_identifier' '_tuple_pattern' 'is_pattern' 'as_pattern' 'attribute_name' '_attribute_argument_clause' 'attribute' '_balanced_tokens' 'attribute_argument_clause' 'attributes' 'balanced_token' 'balanced_tokens' 'prefix_expression' 'binary_expressions' 'postfix_expression' 'in_out_expression' 'assignment_operator' 'conditional_operator' 'type_casting_operator' 'binary_expression' '_generic_argument_clause' 'literal_expression' 'self_expression' 'superclass_expression' 'closure_expression' 'parenthesized_expression' 'implicit_member_expression' 'wildcard_expression' 'primary_expression' 'array_literal' 'dictionary_literal' '_array_literal_items' 'array_literal_item' '_comma' 'array_literal_items' 'dictionary_literal_items' 'dictionary_literal_item' 'superclass_method_expression' 'superclass_subscript_expression' 'superclass_initializer_expression' '_closure_signature' 'capture_list' 'closure_signature' 'capture_specifier' '_expression_element_list' 'expression_element' 'expression_element_list' 'function_call_expression' 'initializer_expression' 'explicit_member_expression' 'postfix_self_expression' 'dynamic_type_expression' 'subscript_expression' 'forced_value_expression' 'optional_chaining_expression' '_parenthesized_expression' 'trailing_closure' 'array_type' 'dictionary_type' 'function_type' 'tuple_type' 'optional_type' 'implicitly_unwrapped_optional_type' 'metatype_type' '_tuple_type_body' 'tuple_type_element_list' 'tuple_type_body' 'tuple_type_element' 'element_name' '_protocol_identifier_list' 'protocol_identifier' 'protocol_identifier_list' 'type_inheritance_list' 'type_inheritance_clause' '_binary_expressions' '_prefix_operator' 'E O F' 'error' 'file' 'variable_declaration_head')
]

{ #category : #generated }
SwiftParser >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #OrderedCollection #SwiftFileNode #OrderedCollection #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #Object #SmaCCToken #SwiftParseNode #SwiftLoopStatementNode #SwiftBranchStatementNode #SwiftLabeledStatementNode #SwiftControlTransferStatementNode #SwiftStatementNode #OrderedCollection #SwiftForStatementNode #SwiftForInStatementNode #SwiftWhileStatementNode #SwiftDoWhileStatementNode #OrderedCollection #Object #SwiftBlockNode #SwiftVariableDeclarationNode #OrderedCollection #OrderedCollection #OrderedCollection #Object #SwiftIfStatementNode #SwiftSwitchStatementNode #Object #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #Object #OrderedCollection #OrderedCollection #SmaCCToken #SwiftBreakStatementNode #SwiftContinueStatementNode #SwiftFallThroughStatementNode #SwiftReturnStatementNode #SmaCCToken #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #SmaCCToken #SwiftTypeIdentifierNode #SwiftProtocolCompositionTypeNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #SwiftParseNode #SwiftParseNode #SwiftImportDeclarationNode #SwiftConstantDeclarationNode #SwiftTypealiasDeclarationNode #SwiftFunctionDeclarationNode #SwiftEnumDeclarationNode #SwiftStructDeclarationNode #SwiftClassDeclarationNode #SwiftProtocolDeclarationNode #SwiftInitializerDeclarationNode #SwiftDeinitializerDeclarationNode #SwiftExtensionDeclarationNode #SwiftSubscriptDeclarationNode #SwiftParseNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #SwiftPatternInitializerNode #OrderedCollection #OrderedCollection #OrderedCollection #SmaCCToken #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #SmaCCToken #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #SwiftBlockNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #SmaCCToken #OrderedCollection #SmaCCToken #SmaCCToken #SmaCCToken #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #SmaCCToken #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #SmaCCToken #SwiftTupleTypeNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #SmaCCToken #OrderedCollection #OrderedCollection #OrderedCollection #SmaCCToken #OrderedCollection #SmaCCToken #OrderedCollection #OrderedCollection #SwiftProtocolPropertyDeclarationNode #SwiftProtocolMethodDeclarationNode #SwiftProtocolInitializerDeclarationNode #SwiftProtocolSubscriptDeclarationNode #SwiftProtocolAssociationTypeDeclarationNode #SwiftParseNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #SwiftBlockNode #SmaCCToken #OrderedCollection #SwiftPrefixOperatorDeclarationNode #SwiftPostfixOperatorDeclarationNode #SwiftInfixOperatorDeclarationNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #SmaCCToken #OrderedCollection #OrderedCollection #OrderedCollection #SmaCCToken #OrderedCollection #SmaCCToken #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #Object #OrderedCollection #OrderedCollection #OrderedCollection #SwiftTypeIdentifierNode #OrderedCollection #OrderedCollection #OrderedCollection #SmaCCToken #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #Object #OrderedCollection #OrderedCollection #SwiftInOutExpressionNode #SmaCCToken #OrderedCollection #OrderedCollection #SwiftParseNode #OrderedCollection #SwiftLiteralExpressionNode #SwiftSelfExpressionNode #SwiftParseNode #SwiftClosureExpressionNode #SwiftParenthesizedExpressionNode #SwiftImplicitMemberExpressionNode #SwiftWildcardExpressionNode #SwiftParseNode #OrderedCollection #OrderedCollection #OrderedCollection #Object #SmaCCToken #OrderedCollection #OrderedCollection #OrderedCollection #SwiftSuperclassMethodExpressionNode #SwiftSuperclassSubscriptExpressionNode #SwiftSuperclassInitializerExpressionNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #Object #OrderedCollection #SwiftFunctionCallExpressionNode #SwiftInitializerExpressionNode #SwiftExplicitMemberExpressionNode #SwiftPostfixSelfExpressionNode #SwiftDynamicTypeExpressionNode #SwiftSubscriptExpressionNode #SwiftForcedValueExpressionNode #SwiftOptionalChainingExpressionNode #SwiftParenthesizedExpressionNode #SwiftClosureExpressionNode #SwiftArrayTypeNode #SwiftDictionaryTypeNode #SwiftFunctionTypeNode #SwiftTupleTypeNode #SwiftOptionalTypeNode #SwiftImplicitlyUnwrappedOptionalTypeNode #SwiftMetatypeTypeNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #SmaCCToken #OrderedCollection #SwiftTypeIdentifierNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #SmaCCToken #SmaCCToken #SmaCCToken #SwiftFileNode #OrderedCollection)
]

{ #category : #generated }
SwiftParser >> transitionTable [
^#(
#[1 0 6 0 1 0 6 0 2 0 6 0 3 0 6 0 4 0 6 0 5 0 6 0 8 0 6 0 9 0 9 0 11 0 6 0 12 0 6 0 13 0 6 0 15 0 6 0 16 0 6 0 17 0 6 0 18 0 6 0 19 0 13 0 20 0 17 0 21 0 21 0 23 0 25 0 25 0 29 0 26 0 33 0 28 0 37 0 30 0 6 0 32 0 41 0 34 0 45 0 37 0 49 0 38 0 53 0 40 0 57 0 41 0 61 0 44 0 65 0 45 0 69 0 47 0 73 0 49 0 77 0 50 0 81 0 51 0 85 0 52 0 6 0 54 0 89 0 59 0 93 0 61 0 97 0 65 0 6 0 68 0 101 0 71 0 6 0 72 0 105 0 80 0 6 0 82 0 7 0 86 0 113 0 87 0 117 0 88 0 121 0 89 0 125 0 90 0 129 0 93 0 133 0 94 0 137 0 96 0 141 0 98 0 145 0 100 0 149 0 101 0 153 0 102 0 157 0 103 0 161 0 104 0 165 0 105 0 169 0 106 0 173 0 107 0 177 0 108 0 181 0 109 0 185 0 110 0 189 0 114 0 193 0 119 0 197 0 120 0 201 0 133 0 205 0 134 0 209 0 135 0 213 0 136 0 217 0 137 0 221 0 138 0 225 0 156 0 229 0 157 0 233 0 158 0 237 0 159 0 241 0 160 0 245 0 161 0 249 0 162 0 253 0 163 1 1 0 164 1 5 0 165 1 9 0 166 1 13 0 167 1 17 0 168 1 21 0 172 1 25 0 173 1 29 0 183 1 33 0 200 1 37 0 203 1 41 1 2 1 45 1 3 1 49 1 9 1 53 1 10 1 57 1 11 1 61 1 37 1 65 1 40 1 69 1 43 1 73 1 45 1 77 1 46 1 81 1 52 1 85 1 53 1 89 1 54 1 93 1 55 1 97 1 56 1 101 1 57 1 105 1 58 1 109 1 59 1 113 1 60 1 117 1 61 1 121 1 68 1 125 1 69 1 129 1 70 1 133 1 78 1 137 1 79 1 141 1 80 1 145 1 81 1 149 1 82 1 153 1 83 1 157 1 84 1 161 1 85 0 10 1 107 1 165 1 109 1 169 1 110] 
#[1 0 14 0 1 0 14 0 2 0 14 0 3 0 14 0 4 0 14 0 5 0 14 0 8 0 14 0 9 0 14 0 11 0 14 0 12 0 14 0 13 0 14 0 15 0 14 0 16 0 14 0 17 0 14 0 18 0 14 0 19 0 14 0 20 0 14 0 21 0 14 0 23 0 11 0 25 0 14 0 26 0 14 0 28 0 14 0 30 0 14 0 31 0 14 0 32 0 14 0 34 0 14 0 35 0 14 0 37 0 15 0 38 0 14 0 39 0 14 0 40 0 19 0 41 0 14 0 42 0 23 0 44 0 27 0 45 0 31 0 47 0 14 0 49 0 35 0 50 0 39 0 51 0 43 0 52 0 14 0 54 0 47 0 59 0 51 0 61 0 55 0 65 0 14 0 68 0 14 0 71 0 14 0 72 0 14 0 80 0 14 0 82 0 59 0 86 0 63 0 87 0 67 0 88 0 71 0 89 0 75 0 90 0 129 0 93 0 133 0 94 0 137 0 96 1 177 0 98 1 181 0 112 1 69 1 43 1 73 1 45 1 77 1 46 1 81 1 52 1 85 1 53 1 89 1 54 1 93 1 55 1 97 1 56 1 101 1 57 1 105 1 58 1 109 1 59 1 113 1 60 1 117 1 61 1 121 1 68 1 125 1 69 1 129 1 70 1 133 1 78 1 137 1 79 1 141 1 80 1 145 1 81 1 149 1 82 1 153 1 83 1 157 1 84 1 161 1 85 0 14 1 107] 
#[0 0 18 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 1 185 0 86 1 189 0 202] 
#[1 0 6 0 1 0 6 0 2 0 6 0 3 0 6 0 4 0 6 0 5 0 6 0 8 0 6 0 9 0 6 0 12 0 6 0 13 0 6 0 15 0 6 0 16 0 6 0 17 0 6 0 18 0 6 0 19 0 17 0 21 0 25 0 25 0 6 0 32 0 49 0 38 0 57 0 41 0 61 0 44 0 65 0 45 0 69 0 47 0 73 0 49 0 77 0 50 0 81 0 51 0 85 0 52 0 6 0 54 0 89 0 59 0 93 0 61 0 97 0 65 0 6 0 68 0 101 0 71 0 6 0 72 0 105 0 80 0 6 0 82 0 79 0 86 0 113 0 87 0 117 0 88 0 121 0 89 0 125 0 90 0 129 0 93 0 133 0 94 0 137 0 96 1 193 0 98 1 197 0 100 0 189 0 114 1 201 0 118 0 225 0 156 0 229 0 157 0 233 0 158 0 237 0 159 0 241 0 160 0 245 0 161 0 249 0 162 0 253 0 163 1 1 0 164 1 5 0 165 1 9 0 166 1 13 0 167 1 17 0 168 1 25 0 173 1 33 0 200 1 37 0 203 1 41 1 2 1 45 1 3 1 49 1 9 1 53 1 10 1 57 1 11 1 61 1 37 1 65 1 40 1 69 1 43 1 73 1 45 1 77 1 46 1 81 1 52 1 85 1 53 1 89 1 54 1 93 1 55 1 97 1 56 1 101 1 57 1 105 1 58 1 109 1 59 1 113 1 60 1 117 1 61 1 121 1 68 1 125 1 69 1 129 1 70 1 133 1 78 1 137 1 79 1 141 1 80 1 145 1 81 1 149 1 82 1 153 1 83 1 157 1 84 1 161 1 85 1 169 1 110] 
#[1 0 22 0 24 0 25 0 25 0 49 0 38 0 57 0 41 0 61 0 44 0 65 0 45 0 69 0 47 0 77 0 50 0 81 0 51 0 85 0 52 0 89 0 59 0 93 0 61 0 97 0 65 1 205 0 86 0 113 0 87 0 117 0 88 0 121 0 89 0 125 0 90 0 129 0 93 0 133 0 94 0 137 0 96 1 209 0 98 1 69 1 43 1 73 1 45 1 77 1 46 1 81 1 52 1 85 1 53 1 89 1 54 1 93 1 55 1 97 1 56 1 101 1 57 1 105 1 58 1 109 1 59 1 113 1 60 1 117 1 61 1 121 1 68 1 125 1 69 1 129 1 70 1 213 1 75 1 217 1 76 1 221 1 77 1 133 1 78 1 137 1 79 1 141 1 80 1 145 1 81 1 149 1 82 1 153 1 83 1 157 1 84 1 161 1 85] 
#[1 1 225 0 38 1 229 0 113] 
#[1 0 6 0 1 0 6 0 2 0 6 0 3 0 6 0 4 0 6 0 5 0 6 0 8 0 6 0 9 0 83 0 13 0 6 0 17 0 6 0 19 1 237 0 25 0 26 0 31 1 241 0 32 0 49 0 38 0 87 0 41 0 61 0 44 0 65 0 45 0 69 0 47 0 73 0 49 0 77 0 50 0 81 0 51 0 85 0 52 1 245 0 53 0 89 0 59 0 93 0 61 1 249 0 65 1 253 0 86 0 113 0 87 0 117 0 88 0 121 0 89 0 125 0 90 0 129 0 93 0 133 0 94 0 137 0 96 2 1 0 98 2 5 0 111 2 9 0 114 2 13 0 115 2 17 0 116 2 21 0 117 2 25 0 144 2 29 0 145 2 33 0 173 2 37 1 20 2 41 1 22 2 45 1 23 2 49 1 24 2 53 1 25 2 57 1 26 2 61 1 27 2 65 1 31 2 69 1 33 2 73 1 34 1 61 1 37 1 65 1 40 1 69 1 43 1 73 1 45 1 77 1 46 1 81 1 52 1 85 1 53 1 89 1 54 1 93 1 55 1 97 1 56 1 101 1 57 1 105 1 58 1 109 1 59 1 113 1 60 1 117 1 61 1 121 1 68 1 125 1 69 1 129 1 70 1 133 1 78 1 137 1 79 1 141 1 80 1 145 1 81 1 149 1 82 1 153 1 83 1 157 1 84 1 161 1 85 1 169 1 110] 
#[1 0 6 0 1 0 6 0 2 0 6 0 3 0 6 0 4 0 6 0 5 0 6 0 8 0 6 0 9 0 6 0 12 0 6 0 13 0 6 0 15 0 6 0 16 0 6 0 17 0 6 0 18 0 6 0 19 0 17 0 21 0 25 0 25 0 6 0 32 0 49 0 38 0 57 0 41 0 61 0 44 0 65 0 45 0 69 0 47 0 73 0 49 0 77 0 50 0 81 0 51 0 85 0 52 0 6 0 54 0 89 0 59 0 93 0 61 0 97 0 65 0 6 0 68 0 101 0 71 0 6 0 72 0 105 0 80 0 6 0 82 0 79 0 86 0 113 0 87 0 117 0 88 0 121 0 89 0 125 0 90 0 129 0 93 0 133 0 94 0 137 0 96 2 77 0 98 2 81 0 100 0 189 0 114 2 85 0 121 0 225 0 156 0 229 0 157 0 233 0 158 0 237 0 159 0 241 0 160 0 245 0 161 0 249 0 162 0 253 0 163 1 1 0 164 1 5 0 165 1 9 0 166 1 13 0 167 1 17 0 168 1 25 0 173 1 33 0 200 1 37 0 203 1 41 1 2 1 45 1 3 1 49 1 9 1 53 1 10 1 57 1 11 1 61 1 37 1 65 1 40 1 69 1 43 1 73 1 45 1 77 1 46 1 81 1 52 1 85 1 53 1 89 1 54 1 93 1 55 1 97 1 56 1 101 1 57 1 105 1 58 1 109 1 59 1 113 1 60 1 117 1 61 1 121 1 68 1 125 1 69 1 129 1 70 1 133 1 78 1 137 1 79 1 141 1 80 1 145 1 81 1 149 1 82 1 153 1 83 1 157 1 84 1 161 1 85 1 169 1 110] 
#[1 0 34 0 1 0 34 0 2 0 34 0 3 0 34 0 4 0 34 0 5 0 34 0 8 0 34 0 9 0 34 0 11 0 34 0 12 0 34 0 13 0 34 0 15 0 34 0 16 0 34 0 17 0 34 0 18 0 34 0 19 0 34 0 20 0 34 0 21 0 34 0 23 0 34 0 25 0 34 0 26 0 34 0 28 0 34 0 30 0 34 0 31 0 34 0 32 0 34 0 34 0 34 0 35 0 34 0 37 0 34 0 38 0 34 0 39 0 34 0 40 0 34 0 41 0 34 0 42 0 34 0 44 0 34 0 45 0 34 0 47 0 34 0 49 0 34 0 50 0 34 0 51 0 34 0 52 0 34 0 54 0 34 0 59 0 34 0 61 0 34 0 65 0 34 0 68 0 34 0 71 0 34 0 72 0 34 0 80 0 34 0 82 0 91 0 86 0 34 0 87 0 34 0 88 0 34 0 89 0 34 0 90 2 93 0 134 2 97 0 139 0 34 1 107] 
#[1 0 34 0 1 0 34 0 2 0 34 0 3 0 34 0 4 0 34 0 5 0 34 0 8 0 34 0 9 0 34 0 11 0 34 0 12 0 34 0 13 0 34 0 15 0 34 0 16 0 34 0 17 0 34 0 18 0 34 0 19 0 34 0 20 0 34 0 21 0 34 0 23 0 34 0 25 0 34 0 26 0 34 0 28 0 34 0 30 0 34 0 31 0 34 0 32 0 34 0 34 0 34 0 35 0 34 0 37 0 34 0 38 0 34 0 39 0 34 0 40 0 34 0 41 0 34 0 42 0 34 0 44 0 34 0 45 0 34 0 47 0 34 0 49 0 34 0 50 0 34 0 51 0 34 0 52 0 34 0 54 0 34 0 59 0 34 0 61 0 34 0 65 0 34 0 68 0 34 0 71 0 34 0 72 0 34 0 80 0 34 0 82 0 91 0 86 0 34 0 87 0 34 0 88 0 34 0 89 0 34 0 90 2 93 0 134 2 101 0 139 0 34 1 107] 
#[1 0 38 0 1 0 38 0 2 0 38 0 3 0 38 0 4 0 38 0 5 0 38 0 8 0 38 0 9 0 38 0 11 0 38 0 12 0 38 0 13 0 38 0 15 0 38 0 16 0 38 0 17 0 38 0 18 0 38 0 19 0 38 0 20 0 38 0 21 0 38 0 23 0 95 0 25 0 38 0 26 0 38 0 28 0 38 0 30 0 38 0 32 0 38 0 34 0 38 0 37 0 38 0 38 0 38 0 40 0 38 0 41 0 38 0 44 0 38 0 45 0 38 0 47 0 38 0 49 0 38 0 50 0 38 0 51 0 99 0 52 0 38 0 54 0 38 0 59 0 38 0 61 0 38 0 65 0 38 0 68 0 38 0 71 0 38 0 72 0 38 0 80 0 38 0 82 0 103 0 86 0 38 0 87 0 38 0 88 0 38 0 89 0 38 0 90 2 117 0 91 2 121 0 211 2 125 1 71 2 129 1 72 2 133 1 73] 
#[1 0 25 0 25 0 49 0 38 0 57 0 41 0 61 0 44 0 65 0 45 0 69 0 47 0 77 0 50 0 81 0 51 0 85 0 52 0 89 0 59 0 93 0 61 0 97 0 65 1 173 0 86 0 113 0 87 0 117 0 88 0 121 0 89 0 125 0 90 0 129 0 93 0 133 0 94 0 137 0 96 2 137 0 98 1 69 1 43 1 73 1 45 1 77 1 46 1 81 1 52 1 85 1 53 1 89 1 54 1 93 1 55 1 97 1 56 1 101 1 57 1 105 1 58 1 109 1 59 1 113 1 60 1 117 1 61 1 121 1 68 1 125 1 69 1 129 1 70 1 133 1 78 1 137 1 79 1 141 1 80 1 145 1 81 1 149 1 82 1 153 1 83 1 157 1 84 1 161 1 85] 
#[0 2 141 0 86] 
#[0 0 42 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 2 145 0 86] 
#[0 0 46 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 2 149 0 86 2 153 1 35] 
#[0 0 50 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 54 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 0 25 0 25 2 157 0 36 0 49 0 38 0 57 0 41 0 61 0 44 0 65 0 45 0 58 0 46 0 69 0 47 0 77 0 50 0 81 0 51 0 85 0 52 0 89 0 59 0 93 0 61 0 97 0 65 1 173 0 86 0 113 0 87 0 117 0 88 0 121 0 89 0 125 0 90 0 129 0 93 0 133 0 94 0 137 0 96 2 161 0 98 1 69 1 43 1 73 1 45 1 77 1 46 1 81 1 52 1 85 1 53 1 89 1 54 1 93 1 55 1 97 1 56 1 101 1 57 1 105 1 58 1 109 1 59 1 113 1 60 1 117 1 61 2 165 1 62 2 169 1 63 2 173 1 65 2 177 1 66 2 181 1 67 1 121 1 68 1 125 1 69 1 129 1 70 1 133 1 78 1 137 1 79 1 141 1 80 1 145 1 81 1 149 1 82 1 153 1 83 1 157 1 84 1 161 1 85] 
#[1 2 185 0 41 2 189 0 52] 
#[1 0 62 0 1 0 62 0 2 0 62 0 3 0 62 0 4 0 62 0 5 0 62 0 8 0 62 0 9 0 62 0 11 0 62 0 12 0 62 0 13 0 62 0 15 0 62 0 16 0 62 0 17 0 62 0 18 0 62 0 19 0 62 0 20 0 62 0 21 0 62 0 22 0 62 0 23 0 62 0 24 0 62 0 25 0 62 0 26 0 62 0 27 0 62 0 28 0 62 0 30 0 62 0 31 0 62 0 32 0 62 0 33 0 62 0 34 0 62 0 35 0 62 0 36 0 62 0 37 0 62 0 38 0 62 0 39 0 62 0 40 0 107 0 41 0 62 0 42 0 62 0 43 0 62 0 44 0 62 0 45 0 62 0 46 0 62 0 47 0 62 0 48 0 62 0 49 0 62 0 50 0 62 0 51 0 111 0 52 0 62 0 53 0 62 0 54 0 62 0 55 0 62 0 59 0 62 0 61 0 62 0 63 0 62 0 65 0 62 0 68 0 62 0 69 0 62 0 71 0 62 0 72 0 62 0 80 0 62 0 82 0 62 0 86 0 62 0 87 0 62 0 88 0 62 0 89 0 62 0 90 0 62 1 107] 
#[0 0 66 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 2 201 0 86 2 25 0 144 2 205 0 145] 
#[1 2 209 0 78 2 213 0 81 2 217 0 83] 
#[1 0 70 0 1 0 70 0 2 0 70 0 3 0 70 0 4 0 70 0 5 2 221 0 6 0 70 0 8 0 70 0 9 0 70 0 11 0 70 0 12 0 70 0 13 0 70 0 15 0 70 0 16 0 70 0 17 0 70 0 18 0 70 0 19 0 70 0 20 0 70 0 21 0 70 0 23 0 70 0 25 0 70 0 26 0 70 0 28 0 70 0 30 0 70 0 31 0 70 0 32 0 70 0 34 0 70 0 35 0 74 0 36 0 70 0 37 0 70 0 38 0 70 0 39 0 70 0 40 0 70 0 41 0 70 0 42 0 70 0 43 0 70 0 44 0 70 0 45 0 70 0 47 0 70 0 48 0 70 0 49 0 70 0 50 0 70 0 51 0 70 0 52 0 70 0 53 0 70 0 54 0 70 0 59 0 70 0 61 0 70 0 63 0 70 0 65 0 70 0 68 0 70 0 69 0 70 0 71 0 70 0 72 0 70 0 80 0 70 0 82 0 70 0 86 0 70 0 87 0 70 0 88 0 70 0 89 0 70 0 90 2 225 0 153 2 229 1 51 0 70 1 107] 
#[0 0 78 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 82 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 86 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 90 0 25 0 38 0 41 0 44 0 47 0 50 0 51 0 52 0 59 0 61 0 65 0 86 0 87 0 88 0 89] 
#[0 0 94 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 98 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 0 25 0 25 0 49 0 38 0 57 0 41 0 61 0 44 0 69 0 47 0 77 0 50 0 81 0 51 0 85 0 52 0 89 0 59 0 93 0 61 0 97 0 65 1 173 0 86 0 113 0 87 0 117 0 88 0 121 0 89 0 129 0 93 0 133 0 94 2 233 1 45 1 81 1 52 1 85 1 53 1 89 1 54 1 93 1 55 1 97 1 56 1 101 1 57 1 105 1 58 1 109 1 59 1 113 1 60 1 117 1 61 1 121 1 68 1 125 1 69 1 129 1 70 1 133 1 78 1 137 1 79 1 141 1 80 1 145 1 81 1 149 1 82 1 153 1 83 1 157 1 84 1 161 1 85] 
#[1 0 102 0 1 0 102 0 2 0 102 0 3 0 102 0 4 0 102 0 5 0 102 0 8 0 102 0 9 0 102 0 11 0 102 0 12 0 102 0 13 0 102 0 15 0 102 0 16 0 102 0 17 0 102 0 18 0 102 0 19 0 102 0 20 0 102 0 21 0 102 0 23 0 102 0 25 0 102 0 26 0 102 0 28 0 102 0 30 2 237 0 31 0 102 0 32 0 102 0 34 0 102 0 35 0 102 0 37 0 102 0 38 0 102 0 39 0 102 0 40 0 102 0 41 0 102 0 42 0 102 0 44 0 102 0 45 0 102 0 47 0 102 0 49 0 102 0 50 0 102 0 51 0 102 0 52 0 102 0 54 0 102 0 59 0 102 0 61 0 102 0 65 0 102 0 68 0 102 0 71 0 102 0 72 0 102 0 80 0 102 0 82 0 102 0 86 0 102 0 87 0 102 0 88 0 102 0 89 0 102 0 90 2 241 0 99 0 102 1 107] 
#[1 0 102 0 1 0 102 0 2 0 102 0 3 0 102 0 4 0 102 0 5 0 102 0 8 0 102 0 9 0 102 0 11 0 102 0 12 0 102 0 13 0 102 0 15 0 102 0 16 0 102 0 17 0 102 0 18 0 102 0 19 0 102 0 20 0 102 0 21 0 102 0 23 0 102 0 25 0 102 0 26 0 102 0 28 0 102 0 30 2 237 0 31 0 102 0 32 0 102 0 34 0 102 0 35 0 102 0 37 0 102 0 38 0 102 0 39 0 102 0 40 0 102 0 41 0 102 0 42 0 102 0 44 0 102 0 45 0 102 0 47 0 102 0 49 0 102 0 50 0 102 0 51 0 102 0 52 0 102 0 54 0 102 0 59 0 102 0 61 0 102 0 65 0 102 0 68 0 102 0 71 0 102 0 72 0 102 0 80 0 102 0 82 0 102 0 86 0 102 0 87 0 102 0 88 0 102 0 89 0 102 0 90 2 245 0 99 0 102 1 107] 
#[1 0 102 0 1 0 102 0 2 0 102 0 3 0 102 0 4 0 102 0 5 0 102 0 8 0 102 0 9 0 102 0 11 0 102 0 12 0 102 0 13 0 102 0 15 0 102 0 16 0 102 0 17 0 102 0 18 0 102 0 19 0 102 0 20 0 102 0 21 0 102 0 23 0 102 0 25 0 102 0 26 0 102 0 28 0 102 0 30 2 237 0 31 0 102 0 32 0 102 0 34 0 102 0 35 0 102 0 37 0 102 0 38 0 102 0 39 0 102 0 40 0 102 0 41 0 102 0 42 0 102 0 44 0 102 0 45 0 102 0 47 0 102 0 49 0 102 0 50 0 102 0 51 0 102 0 52 0 102 0 54 0 102 0 59 0 102 0 61 0 102 0 65 0 102 0 68 0 102 0 71 0 102 0 72 0 102 0 80 0 102 0 82 0 102 0 86 0 102 0 87 0 102 0 88 0 102 0 89 0 102 0 90 2 249 0 99 0 102 1 107] 
#[1 0 102 0 1 0 102 0 2 0 102 0 3 0 102 0 4 0 102 0 5 0 102 0 8 0 102 0 9 0 102 0 11 0 102 0 12 0 102 0 13 0 102 0 15 0 102 0 16 0 102 0 17 0 102 0 18 0 102 0 19 0 102 0 20 0 102 0 21 0 102 0 23 0 102 0 25 0 102 0 26 0 102 0 28 0 102 0 30 2 237 0 31 0 102 0 32 0 102 0 34 0 102 0 35 0 102 0 37 0 102 0 38 0 102 0 39 0 102 0 40 0 102 0 41 0 102 0 42 0 102 0 44 0 102 0 45 0 102 0 47 0 102 0 49 0 102 0 50 0 102 0 51 0 102 0 52 0 102 0 54 0 102 0 59 0 102 0 61 0 102 0 65 0 102 0 68 0 102 0 71 0 102 0 72 0 102 0 80 0 102 0 82 0 102 0 86 0 102 0 87 0 102 0 88 0 102 0 89 0 102 0 90 2 253 0 99 0 102 1 107] 
#[1 0 102 0 1 0 102 0 2 0 102 0 3 0 102 0 4 0 102 0 5 0 102 0 8 0 102 0 9 0 102 0 11 0 102 0 12 0 102 0 13 0 102 0 15 0 102 0 16 0 102 0 17 0 102 0 18 0 102 0 19 0 102 0 20 0 102 0 21 0 102 0 23 0 102 0 25 0 102 0 26 0 102 0 28 0 102 0 30 2 237 0 31 0 102 0 32 0 102 0 34 0 102 0 35 0 102 0 37 0 102 0 38 0 102 0 39 0 102 0 40 0 102 0 41 0 102 0 42 0 102 0 44 0 102 0 45 0 102 0 47 0 102 0 49 0 102 0 50 0 102 0 51 0 102 0 52 0 102 0 54 0 102 0 59 0 102 0 61 0 102 0 65 0 102 0 68 0 102 0 71 0 102 0 72 0 102 0 80 0 102 0 82 0 102 0 86 0 102 0 87 0 102 0 88 0 102 0 89 0 102 0 90 3 1 0 99 0 102 1 107] 
#[1 0 102 0 1 0 102 0 2 0 102 0 3 0 102 0 4 0 102 0 5 0 102 0 8 0 102 0 9 0 102 0 11 0 102 0 12 0 102 0 13 0 102 0 15 0 102 0 16 0 102 0 17 0 102 0 18 0 102 0 19 0 102 0 20 0 102 0 21 0 102 0 23 0 102 0 25 0 102 0 26 0 102 0 28 0 102 0 30 2 237 0 31 0 102 0 32 0 102 0 34 0 102 0 35 0 102 0 37 0 102 0 38 0 102 0 39 0 102 0 40 0 102 0 41 0 102 0 42 0 102 0 44 0 102 0 45 0 102 0 47 0 102 0 49 0 102 0 50 0 102 0 51 0 102 0 52 0 102 0 54 0 102 0 59 0 102 0 61 0 102 0 65 0 102 0 68 0 102 0 71 0 102 0 72 0 102 0 80 0 102 0 82 0 102 0 86 0 102 0 87 0 102 0 88 0 102 0 89 0 102 0 90 3 5 0 99 0 102 1 107] 
#[0 0 106 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 0 6 0 1 0 6 0 2 0 6 0 3 0 6 0 4 0 6 0 5 0 6 0 8 0 6 0 9 0 9 0 11 0 6 0 12 0 6 0 13 0 6 0 15 0 6 0 16 0 6 0 17 0 6 0 18 0 6 0 19 0 13 0 20 0 17 0 21 0 21 0 23 0 25 0 25 0 29 0 26 0 33 0 28 0 37 0 30 0 6 0 32 0 41 0 34 0 45 0 37 0 49 0 38 0 110 0 39 0 53 0 40 0 57 0 41 0 61 0 44 0 65 0 45 0 69 0 47 0 73 0 49 0 77 0 50 0 81 0 51 0 85 0 52 0 6 0 54 0 89 0 59 0 93 0 61 0 97 0 65 0 6 0 68 0 101 0 71 0 6 0 72 0 105 0 80 0 6 0 82 0 7 0 86 0 113 0 87 0 117 0 88 0 121 0 89 0 125 0 90 0 129 0 93 0 133 0 94 0 137 0 96 0 141 0 98 0 145 0 100 0 149 0 101 0 153 0 102 0 157 0 103 0 161 0 104 3 9 0 105 0 173 0 107 0 177 0 108 0 181 0 109 0 185 0 110 0 189 0 114 0 193 0 119 0 197 0 120 0 201 0 133 0 205 0 134 0 209 0 135 0 213 0 136 0 217 0 137 0 221 0 138 0 225 0 156 0 229 0 157 0 233 0 158 0 237 0 159 0 241 0 160 0 245 0 161 0 249 0 162 0 253 0 163 1 1 0 164 1 5 0 165 1 9 0 166 1 13 0 167 1 17 0 168 1 25 0 173 1 33 0 200 1 37 0 203 1 41 1 2 1 45 1 3 1 49 1 9 1 53 1 10 1 57 1 11 1 61 1 37 1 65 1 40 1 69 1 43 1 73 1 45 1 77 1 46 1 81 1 52 1 85 1 53 1 89 1 54 1 93 1 55 1 97 1 56 1 101 1 57 1 105 1 58 1 109 1 59 1 113 1 60 1 117 1 61 1 121 1 68 1 125 1 69 1 129 1 70 1 133 1 78 1 137 1 79 1 141 1 80 1 145 1 81 1 149 1 82 1 153 1 83 1 157 1 84 1 161 1 85 0 110 1 107 1 169 1 110] 
#[0 0 114 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 114 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 114 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 114 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 118 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 122 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 122 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 0 21 0 23 0 29 0 26 0 33 0 28 0 53 0 40 3 13 0 101 0 173 0 107 0 177 0 108 0 181 0 109 0 185 0 110 3 17 0 120] 
#[0 3 21 0 36] 
#[0 0 126 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 126 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 126 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 126 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 118 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 118 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 118 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 118 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 118 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 118 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 118 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 118 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 118 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 118 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 118 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 118 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 118 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 130 1 107] 
#[1 0 134 0 1 0 134 0 2 0 134 0 3 0 115 0 4 0 134 0 5 0 134 0 8 0 134 0 9 3 29 0 12 0 119 0 13 3 33 0 15 0 119 0 16 0 134 0 17 3 37 0 18 0 134 0 19 0 119 0 32 3 41 0 54 0 142 0 68 3 45 0 72 3 49 0 82 3 53 0 86 3 57 0 170 3 61 0 178 3 65 0 223 3 69 0 224 3 73 0 225 3 77 1 7] 
#[0 0 146 1 107] 
#[1 3 81 0 69 3 85 0 201] 
#[1 3 89 0 86 3 93 0 90 3 97 0 204] 
#[1 3 101 0 6 0 150 0 25 3 105 0 142 3 109 0 205] 
#[1 3 113 0 64 3 117 1 4] 
#[0 0 154 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 154 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 154 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 158 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 25 0 32 0 42 0 49 0 52 0 54 0 66 0 67 0 68 0 70 0 72 0 73 0 74 0 82 0 86] 
#[1 0 162 0 1 0 162 0 2 0 162 0 3 0 162 0 4 0 162 0 5 0 162 0 8 0 162 0 9 0 162 0 12 0 162 0 13 0 162 0 15 0 162 0 16 0 162 0 17 0 162 0 18 0 162 0 19 0 162 0 25 0 162 0 32 0 162 0 42 0 73 0 49 0 162 0 52 0 162 0 54 0 162 0 66 0 162 0 67 0 162 0 68 0 162 0 70 0 162 0 72 0 162 0 73 0 162 0 74 0 162 0 82 0 162 0 86 3 121 1 37] 
#[1 0 166 0 1 0 166 0 2 0 166 0 3 0 166 0 4 0 166 0 5 0 166 0 8 0 166 0 9 0 166 0 11 0 166 0 12 0 166 0 13 0 166 0 15 0 166 0 16 0 166 0 17 0 166 0 18 0 166 0 19 0 166 0 20 0 166 0 21 0 166 0 22 0 166 0 23 0 166 0 24 0 166 0 25 0 166 0 26 0 166 0 27 0 166 0 28 0 166 0 30 0 166 0 31 0 166 0 32 0 166 0 33 0 166 0 34 0 166 0 35 0 166 0 36 0 166 0 37 0 166 0 38 0 166 0 39 0 166 0 40 0 166 0 41 0 166 0 42 3 125 0 43 0 166 0 44 0 166 0 45 0 166 0 46 0 166 0 47 0 123 0 48 0 166 0 49 0 166 0 50 0 166 0 51 0 166 0 52 3 133 0 53 0 166 0 54 0 166 0 55 0 166 0 59 0 166 0 61 0 166 0 65 0 166 0 68 0 127 0 69 0 166 0 71 0 166 0 72 0 166 0 80 0 166 0 82 0 166 0 86 0 166 0 87 0 166 0 88 0 166 0 89 0 131 0 90 3 145 0 95 3 149 1 44 3 153 1 47 3 157 1 48 3 161 1 49 3 165 1 50 0 166 1 107] 
#[1 0 170 0 1 0 170 0 2 0 170 0 3 0 170 0 4 0 170 0 5 0 170 0 8 0 170 0 9 0 170 0 11 0 170 0 12 0 170 0 13 0 170 0 15 0 170 0 16 0 170 0 17 0 170 0 18 0 170 0 19 0 170 0 20 0 170 0 21 0 170 0 22 0 170 0 23 0 170 0 24 0 135 0 25 0 170 0 26 0 170 0 27 0 170 0 28 0 170 0 30 0 170 0 31 0 170 0 32 0 170 0 33 0 170 0 34 0 170 0 35 0 170 0 36 0 170 0 37 0 139 0 38 0 170 0 39 0 170 0 40 0 143 0 41 0 170 0 42 0 147 0 43 0 170 0 44 0 170 0 45 0 170 0 46 0 170 0 47 0 170 0 48 0 170 0 49 0 170 0 50 0 170 0 51 0 151 0 52 0 170 0 53 0 170 0 54 0 170 0 55 0 170 0 59 0 170 0 61 3 181 0 63 0 170 0 65 0 170 0 68 0 170 0 69 0 170 0 71 0 170 0 72 0 170 0 80 0 170 0 82 0 170 0 86 0 170 0 87 0 170 0 88 0 170 0 89 0 155 0 90 3 189 0 97 3 193 1 56 3 197 1 86 0 170 1 107] 
#[0 0 170 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 178 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 178 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 178 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 178 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 178 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 178 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 178 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 182 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 186 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 190 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 194 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 194 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 194 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 182 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 182 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 182 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 182 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 182 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 182 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 182 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 182 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 0 1 107] 
#[1 1 233 0 13 3 201 0 25 1 241 0 32 0 49 0 38 0 87 0 41 0 61 0 44 0 65 0 45 0 69 0 47 0 77 0 50 0 81 0 51 0 85 0 52 1 245 0 53 0 89 0 59 0 93 0 61 1 249 0 65 3 205 0 86 0 113 0 87 0 117 0 88 0 121 0 89 0 125 0 90 0 129 0 93 0 133 0 94 0 137 0 96 3 209 0 98 3 213 0 117 2 25 0 144 2 29 0 145 3 217 0 179 3 221 0 180 3 225 0 184 2 37 1 20 2 41 1 22 2 45 1 23 2 49 1 24 2 53 1 25 2 57 1 26 2 61 1 27 2 65 1 31 2 69 1 33 2 73 1 34 1 69 1 43 1 73 1 45 1 77 1 46 1 81 1 52 1 85 1 53 1 89 1 54 1 93 1 55 1 97 1 56 1 101 1 57 1 105 1 58 1 109 1 59 1 113 1 60 1 117 1 61 1 121 1 68 1 125 1 69 1 129 1 70 1 133 1 78 1 137 1 79 1 141 1 80 1 145 1 81 1 149 1 82 1 153 1 83 1 157 1 84 1 161 1 85] 
#[1 0 70 0 1 0 70 0 2 0 70 0 3 0 70 0 4 0 70 0 5 2 221 0 6 0 70 0 8 0 70 0 9 0 70 0 11 0 70 0 12 0 70 0 13 0 70 0 15 0 70 0 16 0 70 0 17 0 70 0 18 0 70 0 19 0 70 0 20 0 70 0 21 0 70 0 22 0 70 0 23 0 70 0 24 0 70 0 25 0 70 0 26 0 70 0 27 0 70 0 28 0 70 0 30 0 70 0 31 0 70 0 32 0 70 0 33 0 70 0 34 0 70 0 35 0 70 0 36 0 70 0 37 0 70 0 38 0 70 0 39 0 70 0 40 0 70 0 41 0 70 0 42 0 70 0 43 0 70 0 44 0 70 0 45 0 70 0 46 0 70 0 47 0 70 0 48 0 70 0 49 0 70 0 50 0 70 0 51 0 70 0 52 0 70 0 53 0 70 0 54 0 70 0 55 0 70 0 59 0 70 0 61 0 70 0 63 0 70 0 65 0 70 0 68 0 70 0 69 0 70 0 71 0 70 0 72 0 70 0 80 0 70 0 82 0 70 0 86 0 70 0 87 0 70 0 88 0 70 0 89 0 70 0 90 2 225 0 153 2 229 1 51 0 70 1 107] 
#[0 0 198 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 24 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 202 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 206 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 13 0 16 0 17 0 19 0 21 0 36 0 39 0 49 0 54 0 68 0 69 0 82] 
#[0 0 210 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 13 0 16 0 17 0 19 0 21 0 36 0 39 0 49 0 54 0 68 0 69 0 82] 
#[0 0 214 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 214 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 1 225 0 38 3 229 0 113] 
#[1 2 221 0 6 0 70 0 24 0 70 0 25 0 70 0 27 3 233 0 36 0 70 0 38 0 70 0 41 0 70 0 43 0 70 0 48 0 70 0 52 0 70 0 53 0 70 0 63 0 70 0 69 0 70 0 90 2 225 0 153 2 229 1 51] 
#[0 0 218 0 24 0 27] 
#[0 3 237 0 24] 
#[0 0 222 0 24 0 27] 
#[1 0 226 0 24 3 241 0 27] 
#[1 0 6 0 1 0 6 0 2 0 6 0 3 0 6 0 4 0 6 0 5 0 6 0 8 0 6 0 9 0 9 0 11 0 6 0 12 0 6 0 13 0 6 0 15 0 6 0 16 0 6 0 17 0 6 0 18 0 6 0 19 0 13 0 20 0 17 0 21 0 21 0 23 0 25 0 25 0 29 0 26 0 33 0 28 0 37 0 30 0 6 0 32 0 41 0 34 0 45 0 37 0 49 0 38 0 10 0 39 0 53 0 40 0 57 0 41 0 61 0 44 0 65 0 45 0 69 0 47 0 73 0 49 0 77 0 50 0 81 0 51 0 85 0 52 0 6 0 54 0 89 0 59 0 93 0 61 0 97 0 65 0 6 0 68 0 101 0 71 0 6 0 72 0 105 0 80 0 6 0 82 0 7 0 86 0 113 0 87 0 117 0 88 0 121 0 89 0 125 0 90 0 129 0 93 0 133 0 94 0 137 0 96 0 141 0 98 0 145 0 100 0 149 0 101 0 153 0 102 0 157 0 103 0 161 0 104 0 165 0 105 0 169 0 106 0 173 0 107 0 177 0 108 0 181 0 109 0 185 0 110 0 189 0 114 0 193 0 119 0 197 0 120 0 201 0 133 0 205 0 134 0 209 0 135 0 213 0 136 0 217 0 137 0 221 0 138 0 225 0 156 0 229 0 157 0 233 0 158 0 237 0 159 0 241 0 160 0 245 0 161 0 249 0 162 0 253 0 163 1 1 0 164 1 5 0 165 1 9 0 166 1 13 0 167 1 17 0 168 3 245 0 172 1 25 0 173 1 33 0 200 1 37 0 203 1 41 1 2 1 45 1 3 1 49 1 9 1 53 1 10 1 57 1 11 1 61 1 37 1 65 1 40 1 69 1 43 1 73 1 45 1 77 1 46 1 81 1 52 1 85 1 53 1 89 1 54 1 93 1 55 1 97 1 56 1 101 1 57 1 105 1 58 1 109 1 59 1 113 1 60 1 117 1 61 1 121 1 68 1 125 1 69 1 129 1 70 1 133 1 78 1 137 1 79 1 141 1 80 1 145 1 81 1 149 1 82 1 153 1 83 1 157 1 84 1 161 1 85 1 169 1 110] 
#[0 3 249 0 23] 
#[1 1 233 0 13 3 201 0 25 1 241 0 32 0 49 0 38 0 87 0 41 0 61 0 44 0 65 0 45 0 69 0 47 0 77 0 50 0 81 0 51 0 85 0 52 1 245 0 53 0 89 0 59 0 93 0 61 1 249 0 65 1 253 0 86 0 113 0 87 0 117 0 88 0 121 0 89 0 125 0 90 0 129 0 93 0 133 0 94 0 137 0 96 3 209 0 98 3 253 0 117 2 25 0 144 2 29 0 145 2 37 1 20 2 41 1 22 2 45 1 23 2 49 1 24 2 53 1 25 2 57 1 26 2 61 1 27 2 65 1 31 2 69 1 33 2 73 1 34 1 69 1 43 1 73 1 45 1 77 1 46 1 81 1 52 1 85 1 53 1 89 1 54 1 93 1 55 1 97 1 56 1 101 1 57 1 105 1 58 1 109 1 59 1 113 1 60 1 117 1 61 1 121 1 68 1 125 1 69 1 129 1 70 1 133 1 78 1 137 1 79 1 141 1 80 1 145 1 81 1 149 1 82 1 153 1 83 1 157 1 84 1 161 1 85] 
#[1 0 6 0 1 0 6 0 2 0 6 0 3 0 6 0 4 0 6 0 5 0 6 0 8 0 6 0 9 0 83 0 13 0 6 0 17 0 6 0 19 0 159 0 24 3 201 0 25 0 26 0 31 1 241 0 32 0 49 0 38 0 87 0 41 0 61 0 44 0 65 0 45 0 69 0 47 0 73 0 49 0 77 0 50 0 81 0 51 0 85 0 52 1 245 0 53 0 89 0 59 0 93 0 61 1 249 0 65 4 1 0 86 0 113 0 87 0 117 0 88 0 121 0 89 0 125 0 90 0 129 0 93 0 133 0 94 0 137 0 96 4 5 0 98 4 9 0 111 2 9 0 114 2 13 0 115 2 17 0 116 4 13 0 117 2 25 0 144 2 29 0 145 2 33 0 173 2 37 1 20 2 41 1 22 2 45 1 23 2 49 1 24 2 53 1 25 2 57 1 26 2 61 1 27 4 17 1 28 4 21 1 29 4 25 1 30 2 65 1 31 2 69 1 33 2 73 1 34 1 61 1 37 1 65 1 40 1 69 1 43 1 73 1 45 1 77 1 46 1 81 1 52 1 85 1 53 1 89 1 54 1 93 1 55 1 97 1 56 1 101 1 57 1 105 1 58 1 109 1 59 1 113 1 60 1 117 1 61 1 121 1 68 1 125 1 69 1 129 1 70 1 213 1 75 1 217 1 76 1 221 1 77 1 133 1 78 1 137 1 79 1 141 1 80 1 145 1 81 1 149 1 82 1 153 1 83 1 157 1 84 1 161 1 85 1 169 1 110] 
#[1 1 233 0 13 3 201 0 25 1 241 0 32 0 49 0 38 0 87 0 41 0 61 0 44 0 65 0 45 0 69 0 47 0 77 0 50 0 81 0 51 0 85 0 52 1 245 0 53 0 89 0 59 0 93 0 61 1 249 0 65 1 253 0 86 0 113 0 87 0 117 0 88 0 121 0 89 0 125 0 90 0 129 0 93 0 133 0 94 0 137 0 96 3 209 0 98 4 29 0 117 2 25 0 144 2 29 0 145 2 37 1 20 2 41 1 22 2 45 1 23 2 49 1 24 2 53 1 25 2 57 1 26 2 61 1 27 2 65 1 31 2 69 1 33 2 73 1 34 1 69 1 43 1 73 1 45 1 77 1 46 1 81 1 52 1 85 1 53 1 89 1 54 1 93 1 55 1 97 1 56 1 101 1 57 1 105 1 58 1 109 1 59 1 113 1 60 1 117 1 61 1 121 1 68 1 125 1 69 1 129 1 70 1 133 1 78 1 137 1 79 1 141 1 80 1 145 1 81 1 149 1 82 1 153 1 83 1 157 1 84 1 161 1 85] 
#[1 4 33 0 12 4 37 0 25 4 41 0 52 2 201 0 86 2 25 0 144 4 45 0 145 4 49 0 146 4 53 0 155 4 57 1 88 4 61 1 89 4 65 1 90 4 69 1 91 4 73 1 92 4 77 1 93 4 81 1 94] 
#[1 0 163 0 1 0 163 0 2 0 163 0 3 0 163 0 4 0 163 0 5 0 163 0 8 0 163 0 9 0 163 0 11 0 163 0 12 0 163 0 13 0 163 0 15 0 163 0 16 0 163 0 17 0 163 0 18 0 163 0 19 0 163 0 20 0 163 0 21 0 163 0 22 0 163 0 23 0 163 0 24 0 163 0 25 0 163 0 26 0 163 0 27 0 163 0 28 0 163 0 30 0 163 0 31 0 163 0 32 0 163 0 33 0 163 0 34 0 163 0 35 0 163 0 36 0 163 0 37 0 163 0 38 0 163 0 39 0 163 0 40 0 163 0 41 0 163 0 42 0 66 0 43 0 163 0 44 0 163 0 45 0 163 0 47 0 163 0 48 0 163 0 49 0 163 0 50 0 163 0 51 0 163 0 52 0 66 0 53 0 163 0 54 0 163 0 59 0 163 0 61 0 66 0 63 0 163 0 65 0 163 0 68 0 163 0 69 0 163 0 71 0 163 0 72 0 163 0 80 0 163 0 82 0 163 0 86 0 163 0 87 0 163 0 88 0 163 0 89 0 163 0 90 0 163 1 107] 
#[1 0 167 0 1 0 167 0 2 0 167 0 3 0 167 0 4 0 167 0 5 0 171 0 6 0 167 0 8 0 167 0 9 0 167 0 11 0 167 0 12 0 167 0 13 0 167 0 15 0 167 0 16 0 167 0 17 0 167 0 18 0 167 0 19 0 167 0 20 0 167 0 21 0 167 0 22 0 167 0 23 0 167 0 24 0 167 0 25 0 167 0 26 0 167 0 27 0 167 0 28 0 167 0 30 0 167 0 31 0 167 0 32 0 167 0 33 0 167 0 34 0 167 0 35 0 167 0 36 0 167 0 37 0 167 0 38 0 167 0 39 0 167 0 40 0 175 0 41 0 167 0 42 0 70 0 43 0 167 0 44 0 167 0 45 0 167 0 47 0 167 0 48 0 167 0 49 0 167 0 50 0 167 0 51 0 167 0 52 0 70 0 53 0 167 0 54 0 167 0 59 0 167 0 61 0 70 0 63 0 167 0 65 0 167 0 68 0 167 0 69 0 167 0 71 0 167 0 72 0 167 0 80 0 167 0 82 0 167 0 86 0 167 0 87 0 167 0 88 0 167 0 89 0 167 0 90 2 225 0 153 2 229 1 51 0 167 1 107] 
#[1 0 246 0 22 0 250 0 27 0 250 0 31 0 246 0 48] 
#[0 4 85 0 31] 
#[0 0 254 0 31] 
#[1 4 89 0 27 1 2 0 31] 
#[0 1 6 0 31] 
#[1 4 93 0 22 4 97 0 48] 
#[1 0 70 0 1 0 70 0 2 0 70 0 3 0 70 0 4 0 70 0 5 2 221 0 6 0 70 0 7 0 70 0 8 0 70 0 9 0 70 0 10 0 70 0 11 0 70 0 12 0 70 0 13 0 70 0 15 0 70 0 16 0 70 0 17 0 70 0 18 0 70 0 19 0 70 0 20 0 70 0 21 0 70 0 22 0 70 0 23 0 70 0 24 0 70 0 25 0 70 0 26 0 70 0 27 0 70 0 28 0 70 0 30 0 70 0 31 0 70 0 32 0 70 0 33 0 70 0 34 0 70 0 35 0 70 0 36 0 70 0 37 0 70 0 38 0 70 0 39 0 70 0 40 0 70 0 41 0 70 0 42 0 70 0 43 0 70 0 44 0 70 0 45 0 70 0 46 0 70 0 47 0 70 0 48 0 70 0 49 0 70 0 50 0 70 0 51 0 70 0 52 0 70 0 53 0 70 0 54 0 70 0 55 0 70 0 59 0 70 0 61 0 70 0 63 0 70 0 64 0 70 0 65 0 70 0 68 0 70 0 69 0 70 0 71 0 70 0 72 0 70 0 80 0 70 0 82 0 70 0 86 0 70 0 87 0 70 0 88 0 70 0 89 0 70 0 90 2 225 0 153 4 101 1 51 0 70 1 107] 
#[0 1 10 0 41] 
#[1 0 134 0 1 0 134 0 2 0 134 0 3 0 134 0 4 0 134 0 5 0 134 0 8 0 134 0 9 0 119 0 13 0 134 0 17 0 134 0 19 3 57 0 170 4 105 0 178] 
#[1 1 14 0 1 1 14 0 2 1 14 0 3 1 14 0 4 1 14 0 5 1 14 0 8 1 14 0 9 1 14 0 11 1 14 0 12 1 14 0 13 1 14 0 15 1 14 0 16 1 14 0 17 1 14 0 18 1 14 0 19 1 14 0 20 1 14 0 21 1 14 0 22 1 14 0 23 1 14 0 24 1 14 0 25 1 14 0 26 1 14 0 27 1 14 0 28 1 14 0 30 1 14 0 31 1 14 0 32 1 14 0 33 1 14 0 34 1 14 0 35 0 179 0 36 1 14 0 37 1 14 0 38 1 14 0 39 1 14 0 40 1 14 0 41 1 14 0 42 1 14 0 44 1 14 0 45 1 14 0 47 1 14 0 48 1 14 0 49 1 14 0 50 1 14 0 51 1 14 0 52 1 14 0 54 1 14 0 59 1 14 0 61 1 14 0 65 1 14 0 68 1 14 0 69 1 14 0 71 1 14 0 72 1 14 0 80 1 14 0 82 1 14 0 86 1 14 0 87 1 14 0 88 1 14 0 89 1 14 0 90 4 113 0 185 4 117 1 21 1 14 1 107] 
#[1 1 14 0 1 1 14 0 2 1 14 0 3 1 14 0 4 1 14 0 5 1 14 0 8 1 14 0 9 1 14 0 11 1 14 0 12 1 14 0 13 1 14 0 15 1 14 0 16 1 14 0 17 1 14 0 18 1 14 0 19 1 14 0 20 1 14 0 21 1 14 0 22 1 14 0 23 1 14 0 24 1 14 0 25 1 14 0 26 1 14 0 27 1 14 0 28 1 14 0 30 1 14 0 31 1 14 0 32 1 14 0 33 1 14 0 34 1 14 0 35 0 179 0 36 1 14 0 37 1 14 0 38 1 14 0 39 1 14 0 40 1 14 0 41 1 14 0 42 1 14 0 44 1 14 0 45 1 14 0 47 1 14 0 48 1 14 0 49 1 14 0 50 1 14 0 51 1 14 0 52 1 14 0 54 1 14 0 59 1 14 0 61 1 14 0 65 1 14 0 68 1 14 0 69 1 14 0 71 1 14 0 72 1 14 0 80 1 14 0 82 1 14 0 86 1 14 0 87 1 14 0 88 1 14 0 89 1 14 0 90 4 113 0 185 4 121 1 21 1 14 1 107] 
#[0 1 18 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 1 14 0 1 1 14 0 2 1 14 0 3 1 14 0 4 1 14 0 5 1 14 0 8 1 14 0 9 1 14 0 11 1 14 0 12 1 14 0 13 1 14 0 15 1 14 0 16 1 14 0 17 1 14 0 18 1 14 0 19 1 14 0 20 1 14 0 21 1 14 0 22 1 14 0 23 1 14 0 24 1 14 0 25 1 14 0 26 1 14 0 27 1 14 0 28 1 14 0 30 1 14 0 31 1 14 0 32 1 14 0 33 1 14 0 34 1 14 0 35 0 179 0 36 1 14 0 37 1 14 0 38 1 14 0 39 1 14 0 40 1 14 0 41 1 14 0 42 1 14 0 44 1 14 0 45 1 14 0 47 1 14 0 48 1 14 0 49 1 14 0 50 1 14 0 51 1 14 0 52 1 14 0 54 1 14 0 59 1 14 0 61 1 14 0 65 1 14 0 68 1 14 0 69 1 14 0 71 1 14 0 72 1 14 0 80 1 14 0 82 1 14 0 86 1 14 0 87 1 14 0 88 1 14 0 89 1 14 0 90 4 113 0 185 4 125 1 21 1 14 1 107] 
#[0 1 22 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 1 26 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 1 30 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 4 129 0 41] 
#[0 1 34 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 1 38 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 1 42 0 38] 
#[0 1 42 0 38] 
#[1 1 225 0 38 4 133 0 113] 
#[0 0 74 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 1 46 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 1 50 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 1 54 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 0 6 0 12 1 58 0 13 4 137 0 24 0 6 0 25 1 58 0 32 0 73 0 49 0 6 0 52 1 58 0 58 1 58 0 65 4 141 0 74 0 183 0 86 4 145 0 173 4 149 0 212 4 153 0 214 4 157 0 215 1 61 1 37 1 65 1 40] 
#[1 4 161 0 8 4 165 0 9 4 169 0 17 4 173 0 19 4 177 1 74] 
#[0 1 62 0 22 0 27 0 64] 
#[1 1 66 0 22 4 181 0 27 4 185 0 64 4 189 0 209 4 193 0 210] 
#[1 1 66 0 22 4 185 0 64 4 197 0 209 4 193 0 210] 
#[1 0 6 0 1 0 6 0 2 0 6 0 3 0 6 0 4 0 6 0 5 0 6 0 8 0 6 0 9 0 9 0 11 0 6 0 12 0 6 0 13 0 6 0 15 0 6 0 16 0 6 0 17 0 6 0 18 0 6 0 19 0 13 0 20 0 17 0 21 0 21 0 23 0 25 0 25 0 29 0 26 0 33 0 28 0 37 0 30 0 6 0 32 0 41 0 34 0 45 0 37 0 49 0 38 0 53 0 40 0 57 0 41 0 61 0 44 0 65 0 45 0 69 0 47 0 73 0 49 0 77 0 50 0 81 0 51 0 85 0 52 0 6 0 54 0 89 0 59 0 93 0 61 0 97 0 65 0 6 0 68 0 101 0 71 0 6 0 72 0 105 0 80 0 6 0 82 0 7 0 86 0 113 0 87 0 117 0 88 0 121 0 89 0 125 0 90 0 129 0 93 0 133 0 94 0 137 0 96 0 141 0 98 0 145 0 100 0 149 0 101 0 153 0 102 0 157 0 103 0 161 0 104 0 165 0 105 4 201 0 106 0 173 0 107 0 177 0 108 0 181 0 109 0 185 0 110 0 189 0 114 0 193 0 119 0 197 0 120 0 201 0 133 0 205 0 134 0 209 0 135 0 213 0 136 0 217 0 137 0 221 0 138 0 225 0 156 0 229 0 157 0 233 0 158 0 237 0 159 0 241 0 160 0 245 0 161 0 249 0 162 0 253 0 163 1 1 0 164 1 5 0 165 1 9 0 166 1 13 0 167 1 17 0 168 1 25 0 173 1 33 0 200 1 37 0 203 1 41 1 2 1 45 1 3 1 49 1 9 1 53 1 10 1 57 1 11 1 61 1 37 1 65 1 40 1 69 1 43 1 73 1 45 1 77 1 46 1 81 1 52 1 85 1 53 1 89 1 54 1 93 1 55 1 97 1 56 1 101 1 57 1 105 1 58 1 109 1 59 1 113 1 60 1 117 1 61 1 121 1 68 1 125 1 69 1 129 1 70 1 133 1 78 1 137 1 79 1 141 1 80 1 145 1 81 1 149 1 82 1 153 1 83 1 157 1 84 1 161 1 85 1 169 1 110] 
#[1 4 205 0 22 2 105 0 25 2 113 0 86 4 209 0 91 4 213 0 211] 
#[0 1 70 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 32 0 34 0 37 0 38 0 40 0 41 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90] 
#[0 4 217 0 38] 
#[0 1 74 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 1 78 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 1 82 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 25 0 32 0 42 0 49 0 52 0 54 0 66 0 67 0 68 0 70 0 72 0 73 0 74 0 82 0 86] 
#[1 1 86 0 1 1 86 0 2 1 86 0 3 1 86 0 4 1 86 0 5 1 86 0 8 1 86 0 9 1 86 0 12 1 86 0 13 1 86 0 15 1 86 0 16 1 86 0 17 1 86 0 18 1 86 0 19 0 187 0 25 1 86 0 32 1 86 0 42 1 86 0 49 1 86 0 52 1 86 0 54 1 86 0 66 1 86 0 67 1 86 0 68 1 86 0 70 1 86 0 72 1 86 0 73 1 86 0 74 1 86 0 82 1 86 0 86 4 225 1 36 4 229 1 39] 
#[0 4 233 0 46] 
#[1 1 90 0 27 4 237 0 36 1 90 0 46] 
#[0 4 241 0 46] 
#[1 4 245 0 27 1 94 0 46 4 249 1 64] 
#[0 1 98 0 46] 
#[0 4 253 0 46] 
#[1 5 1 0 27 1 94 0 46 5 5 1 64] 
#[1 5 9 0 68 5 13 0 86] 
#[1 0 25 0 25 0 49 0 38 0 57 0 41 0 61 0 44 0 65 0 45 0 69 0 47 0 77 0 50 0 81 0 51 0 85 0 52 0 89 0 59 0 93 0 61 0 97 0 65 1 173 0 86 0 113 0 87 0 117 0 88 0 121 0 89 0 125 0 90 0 129 0 93 0 133 0 94 0 137 0 96 5 17 0 98 1 69 1 43 1 73 1 45 1 77 1 46 1 81 1 52 1 85 1 53 1 89 1 54 1 93 1 55 1 97 1 56 1 101 1 57 1 105 1 58 1 109 1 59 1 113 1 60 1 117 1 61 1 121 1 68 1 125 1 69 1 129 1 70 1 133 1 78 1 137 1 79 1 141 1 80 1 145 1 81 1 149 1 82 1 153 1 83 1 157 1 84 1 161 1 85] 
#[1 5 21 0 68 5 25 0 86] 
#[1 0 25 0 25 0 49 0 38 0 57 0 41 0 61 0 44 0 65 0 45 0 69 0 47 0 77 0 50 0 81 0 51 0 85 0 52 0 89 0 59 0 93 0 61 0 97 0 65 1 173 0 86 0 113 0 87 0 117 0 88 0 121 0 89 0 125 0 90 0 129 0 93 0 133 0 94 0 137 0 96 5 29 0 98 1 69 1 43 1 73 1 45 1 77 1 46 1 81 1 52 1 85 1 53 1 89 1 54 1 93 1 55 1 97 1 56 1 101 1 57 1 105 1 58 1 109 1 59 1 113 1 60 1 117 1 61 1 121 1 68 1 125 1 69 1 129 1 70 1 133 1 78 1 137 1 79 1 141 1 80 1 145 1 81 1 149 1 82 1 153 1 83 1 157 1 84 1 161 1 85] 
#[0 0 242 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 64 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 5 33 0 36 1 102 0 38 5 37 0 243 5 41 1 104] 
#[0 5 45 0 90] 
#[0 5 49 0 90] 
#[0 5 53 0 90] 
#[1 4 33 0 12 4 37 0 25 4 41 0 52 2 201 0 86 2 25 0 144 4 45 0 145 4 49 0 146 5 57 0 152 5 61 0 154 5 65 0 155 4 57 1 88 4 61 1 89 4 65 1 90 4 69 1 91 4 73 1 92 4 77 1 93 4 81 1 94] 
#[0 1 106 0 1 0 2 0 3 0 4 0 5 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 64 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 1 110 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 1 114 0 1 1 114 0 2 1 114 0 3 1 114 0 4 1 114 0 5 1 114 0 8 1 114 0 9 1 114 0 11 1 114 0 12 1 114 0 13 1 114 0 15 1 114 0 16 1 114 0 17 1 114 0 18 1 114 0 19 1 114 0 20 1 114 0 21 1 114 0 22 1 114 0 23 1 114 0 24 0 191 0 25 1 114 0 26 1 114 0 27 1 114 0 28 1 114 0 30 1 114 0 31 1 114 0 32 1 114 0 33 1 114 0 34 1 114 0 35 1 114 0 36 1 114 0 37 0 195 0 38 1 114 0 39 1 114 0 40 0 199 0 41 1 114 0 42 0 203 0 43 1 114 0 44 1 114 0 45 1 114 0 46 1 114 0 47 1 114 0 48 1 114 0 49 1 114 0 50 1 114 0 51 0 207 0 52 1 114 0 53 1 114 0 54 1 114 0 55 1 114 0 59 1 114 0 61 3 181 0 63 1 114 0 65 1 114 0 68 1 114 0 69 1 114 0 71 1 114 0 72 1 114 0 80 1 114 0 82 1 114 0 86 1 114 0 87 1 114 0 88 1 114 0 89 0 211 0 90 3 189 0 97 3 193 1 56 3 197 1 86 1 114 1 107] 
#[0 1 118 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 1 122 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 1 126 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 1 130 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 1 130 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 1 130 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 1 130 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 1 134 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 1 138 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 1 138 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 1 142 0 23 0 26 0 28 0 40] 
#[1 5 69 0 86 5 73 0 246] 
#[1 5 77 0 86 5 81 0 248] 
#[1 5 85 0 86 5 89 0 242] 
#[1 5 93 0 4 5 97 0 12 5 101 0 13 5 105 0 14 5 109 0 15 5 113 0 16 5 117 0 21 1 146 0 86 1 146 0 90 5 121 0 174 5 125 0 176] 
#[0 1 150 0 68] 
#[1 1 225 0 38 5 129 0 113] 
#[1 2 105 0 25 5 133 0 211] 
#[0 1 154 0 6 0 36 0 38] 
#[1 5 137 0 1 5 141 0 2 5 145 0 3 5 149 0 4 5 153 0 5 5 157 0 8 5 161 0 9 1 158 0 13 1 158 0 16 5 165 0 17 5 169 0 19 1 158 0 32 5 173 0 171] 
#[1 5 177 0 13 5 181 0 16 5 185 0 32] 
#[0 1 162 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 1 166 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 3 101 0 6 0 150 0 36 0 150 0 38 3 105 0 142 5 189 0 205] 
#[0 5 193 0 68] 
#[1 4 33 0 12 4 37 0 25 4 41 0 52 2 201 0 86 2 25 0 144 4 45 0 145 4 49 0 146 5 197 0 155 4 57 1 88 4 61 1 89 4 65 1 90 4 69 1 91 4 73 1 92 4 77 1 93 4 81 1 94] 
#[0 1 170 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 1 174 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 13 0 16 0 17 0 19 0 21 0 25 0 38 0 39 0 49 0 54 0 64 0 68 0 82] 
#[0 1 178 0 1 0 2 0 3 0 4 0 5 0 6 0 8 0 9 0 13 0 16 0 17 0 19 0 21 0 25 0 38 0 39 0 49 0 54 0 64 0 68 0 82] 
#[1 3 101 0 6 0 150 0 25 0 150 0 38 0 150 0 64 3 105 0 142 5 201 0 205] 
#[1 2 201 0 86 5 205 0 140 5 209 0 143 5 213 0 144] 
#[0 1 182 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 13 0 16 0 17 0 19 0 21 0 25 0 36 0 38 0 39 0 49 0 54 0 64 0 68 0 82] 
#[1 2 105 0 25 5 217 0 211] 
#[1 0 6 0 12 0 6 0 25 0 73 0 49 0 6 0 52 0 6 0 86 5 221 0 173 1 61 1 37 1 65 1 40] 
#[1 5 225 0 38 5 229 0 113 5 233 0 186 5 237 0 187] 
#[0 1 186 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 25 0 32 0 42 0 49 0 52 0 54 0 66 0 67 0 68 0 70 0 72 0 73 0 74 0 82 0 86] 
#[1 0 25 0 25 0 49 0 38 0 57 0 41 0 61 0 44 0 65 0 45 0 69 0 47 0 77 0 50 0 81 0 51 0 85 0 52 0 89 0 59 0 93 0 61 0 97 0 65 1 173 0 86 0 113 0 87 0 117 0 88 0 121 0 89 0 125 0 90 0 129 0 93 0 133 0 94 0 137 0 96 5 241 0 98 1 69 1 43 1 73 1 45 1 77 1 46 1 81 1 52 1 85 1 53 1 89 1 54 1 93 1 55 1 97 1 56 1 101 1 57 1 105 1 58 1 109 1 59 1 113 1 60 1 117 1 61 1 121 1 68 1 125 1 69 1 129 1 70 1 133 1 78 1 137 1 79 1 141 1 80 1 145 1 81 1 149 1 82 1 153 1 83 1 157 1 84 1 161 1 85] 
#[1 4 33 0 12 4 37 0 25 5 245 0 43 4 41 0 52 2 201 0 86 2 25 0 144 4 45 0 145 4 49 0 146 5 249 0 155 4 57 1 88 4 61 1 89 4 65 1 90 4 69 1 91 4 73 1 92 4 77 1 93 4 81 1 94] 
#[1 4 33 0 12 4 37 0 25 4 41 0 52 2 201 0 86 2 25 0 144 4 45 0 145 4 49 0 146 5 253 0 155 4 57 1 88 4 61 1 89 4 65 1 90 4 69 1 91 4 73 1 92 4 77 1 93 4 81 1 94] 
#[0 1 190 0 25 0 38 0 41 0 44 0 45 0 47 0 50 0 51 0 52 0 59 0 61 0 65 0 86 0 87 0 88 0 89 0 90] 
#[0 1 194 0 25 0 38 0 41 0 44 0 45 0 47 0 50 0 51 0 52 0 59 0 61 0 65 0 86 0 87 0 88 0 89 0 90] 
#[1 0 25 0 25 0 49 0 38 0 57 0 41 0 61 0 44 0 65 0 45 0 69 0 47 0 77 0 50 0 81 0 51 0 85 0 52 0 89 0 59 0 93 0 61 0 97 0 65 1 173 0 86 0 113 0 87 0 117 0 88 0 121 0 89 0 125 0 90 0 129 0 93 0 133 0 94 0 137 0 96 6 1 1 43 1 73 1 45 1 77 1 46 1 81 1 52 1 85 1 53 1 89 1 54 1 93 1 55 1 97 1 56 1 101 1 57 1 105 1 58 1 109 1 59 1 113 1 60 1 117 1 61 1 121 1 68 1 125 1 69 1 129 1 70 1 133 1 78 1 137 1 79 1 141 1 80 1 145 1 81 1 149 1 82 1 153 1 83 1 157 1 84 1 161 1 85] 
#[1 1 198 0 1 1 198 0 2 1 198 0 3 1 198 0 4 1 198 0 5 1 198 0 8 1 198 0 9 1 198 0 11 1 198 0 12 1 198 0 13 1 198 0 15 1 198 0 16 1 198 0 17 1 198 0 18 1 198 0 19 1 198 0 20 1 198 0 21 1 198 0 22 1 198 0 23 1 198 0 24 1 198 0 25 1 198 0 26 1 198 0 27 1 198 0 28 1 198 0 30 1 198 0 31 1 198 0 32 1 198 0 33 1 198 0 34 1 198 0 35 1 198 0 36 1 198 0 37 1 198 0 38 1 198 0 39 1 198 0 40 1 198 0 41 1 198 0 42 3 125 0 43 1 198 0 44 1 198 0 45 1 198 0 46 1 198 0 47 0 215 0 48 1 198 0 49 1 198 0 50 1 198 0 51 1 198 0 52 3 133 0 53 1 198 0 54 1 198 0 55 1 198 0 59 1 198 0 61 1 198 0 65 1 198 0 68 0 219 0 69 1 198 0 71 1 198 0 72 1 198 0 80 1 198 0 82 1 198 0 86 1 198 0 87 1 198 0 88 1 198 0 89 0 223 0 90 3 145 0 95 3 153 1 47 3 157 1 48 3 161 1 49 6 5 1 50 1 198 1 107] 
#[1 0 25 0 25 0 49 0 38 0 57 0 41 0 61 0 44 0 65 0 45 0 69 0 47 0 77 0 50 0 81 0 51 0 85 0 52 0 89 0 59 0 93 0 61 0 97 0 65 1 173 0 86 0 113 0 87 0 117 0 88 0 121 0 89 0 125 0 90 0 129 0 93 0 133 0 94 0 137 0 96 6 9 1 43 1 73 1 45 1 77 1 46 1 81 1 52 1 85 1 53 1 89 1 54 1 93 1 55 1 97 1 56 1 101 1 57 1 105 1 58 1 109 1 59 1 113 1 60 1 117 1 61 1 121 1 68 1 125 1 69 1 129 1 70 1 133 1 78 1 137 1 79 1 141 1 80 1 145 1 81 1 149 1 82 1 153 1 83 1 157 1 84 1 161 1 85] 
#[1 0 25 0 25 0 49 0 38 0 57 0 41 0 61 0 44 0 65 0 45 0 69 0 47 0 77 0 50 0 81 0 51 0 85 0 52 0 89 0 59 0 93 0 61 0 97 0 65 1 173 0 86 0 113 0 87 0 117 0 88 0 121 0 89 0 125 0 90 0 129 0 93 0 133 0 94 0 137 0 96 6 13 1 43 1 73 1 45 1 77 1 46 1 81 1 52 1 85 1 53 1 89 1 54 1 93 1 55 1 97 1 56 1 101 1 57 1 105 1 58 1 109 1 59 1 113 1 60 1 117 1 61 1 121 1 68 1 125 1 69 1 129 1 70 1 133 1 78 1 137 1 79 1 141 1 80 1 145 1 81 1 149 1 82 1 153 1 83 1 157 1 84 1 161 1 85] 
#[0 1 202 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 1 206 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 6 17 0 60 6 21 0 61 6 25 0 68 6 29 0 86 6 33 0 87] 
#[0 1 210 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 0 25 0 25 0 49 0 38 0 57 0 41 0 61 0 44 0 65 0 45 0 69 0 47 0 77 0 50 0 81 0 51 0 85 0 52 0 89 0 59 0 93 0 61 0 97 0 65 1 173 0 86 0 113 0 87 0 117 0 88 0 121 0 89 0 125 0 90 0 129 0 93 0 133 0 94 0 137 0 96 6 37 0 98 6 41 0 115 1 69 1 43 1 73 1 45 1 77 1 46 1 81 1 52 1 85 1 53 1 89 1 54 1 93 1 55 1 97 1 56 1 101 1 57 1 105 1 58 1 109 1 59 1 113 1 60 1 117 1 61 1 121 1 68 1 125 1 69 1 129 1 70 1 133 1 78 1 137 1 79 1 141 1 80 1 145 1 81 1 149 1 82 1 153 1 83 1 157 1 84 1 161 1 85] 
#[0 1 214 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 1 218 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 1 222 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 1 226 0 1 1 226 0 2 1 226 0 3 1 226 0 4 1 226 0 5 1 226 0 8 1 226 0 9 1 226 0 11 1 226 0 12 1 226 0 13 1 226 0 15 1 226 0 16 1 226 0 17 1 226 0 18 1 226 0 19 1 226 0 20 1 226 0 21 1 226 0 22 1 226 0 23 1 226 0 24 1 226 0 25 1 226 0 26 1 226 0 27 1 226 0 28 1 226 0 30 1 226 0 31 1 226 0 32 1 226 0 33 1 226 0 34 1 226 0 35 1 226 0 36 1 226 0 37 0 227 0 38 1 226 0 39 1 226 0 40 1 226 0 41 1 226 0 42 1 226 0 43 1 226 0 44 1 226 0 45 1 226 0 46 1 226 0 47 1 226 0 48 1 226 0 49 1 226 0 50 1 226 0 51 1 226 0 52 1 226 0 53 1 226 0 54 1 226 0 55 1 226 0 59 1 226 0 61 1 226 0 63 1 226 0 65 1 226 0 68 1 226 0 69 1 226 0 71 1 226 0 72 1 226 0 80 1 226 0 82 1 226 0 86 1 226 0 87 1 226 0 88 1 226 0 89 1 226 0 90 1 226 1 107] 
#[1 0 49 0 38 6 45 1 55 6 49 1 87] 
#[1 1 233 0 13 0 159 0 24 3 201 0 25 1 241 0 32 0 49 0 38 0 87 0 41 0 61 0 44 0 65 0 45 0 69 0 47 0 77 0 50 0 81 0 51 0 85 0 52 1 245 0 53 0 89 0 59 0 93 0 61 1 249 0 65 4 1 0 86 0 113 0 87 0 117 0 88 0 121 0 89 0 125 0 90 0 129 0 93 0 133 0 94 0 137 0 96 6 53 0 98 4 13 0 117 2 25 0 144 2 29 0 145 2 37 1 20 2 41 1 22 2 45 1 23 2 49 1 24 2 53 1 25 2 57 1 26 2 61 1 27 4 17 1 28 4 21 1 29 4 25 1 30 2 65 1 31 2 69 1 33 2 73 1 34 1 69 1 43 1 73 1 45 1 77 1 46 1 81 1 52 1 85 1 53 1 89 1 54 1 93 1 55 1 97 1 56 1 101 1 57 1 105 1 58 1 109 1 59 1 113 1 60 1 117 1 61 1 121 1 68 1 125 1 69 1 129 1 70 1 213 1 75 1 217 1 76 1 221 1 77 1 133 1 78 1 137 1 79 1 141 1 80 1 145 1 81 1 149 1 82 1 153 1 83 1 157 1 84 1 161 1 85] 
#[1 0 167 0 1 0 167 0 2 0 167 0 3 0 167 0 4 0 167 0 5 0 171 0 6 0 167 0 8 0 167 0 9 0 167 0 11 0 167 0 12 0 167 0 13 0 167 0 15 0 167 0 16 0 167 0 17 0 167 0 18 0 167 0 19 0 167 0 20 0 167 0 21 0 167 0 23 0 167 0 25 0 167 0 26 0 167 0 27 0 167 0 28 0 167 0 30 0 167 0 31 0 167 0 32 0 167 0 34 0 167 0 35 0 231 0 36 0 167 0 37 0 167 0 38 0 167 0 39 0 167 0 40 0 175 0 41 0 167 0 42 0 70 0 43 0 167 0 44 0 167 0 45 0 167 0 47 0 167 0 48 0 167 0 49 0 167 0 50 0 167 0 51 0 167 0 52 0 70 0 53 0 167 0 54 0 167 0 59 0 167 0 61 0 70 0 63 0 167 0 65 0 167 0 68 0 167 0 69 0 167 0 71 0 167 0 72 0 167 0 80 0 167 0 82 0 167 0 86 0 167 0 87 0 167 0 88 0 167 0 89 0 167 0 90 2 225 0 153 2 229 1 51 0 167 1 107] 
#[0 0 246 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 1 238 0 1 1 238 0 2 1 238 0 3 1 238 0 4 1 238 0 5 1 238 0 8 1 238 0 9 1 238 0 11 1 238 0 12 1 238 0 13 1 238 0 15 1 238 0 16 1 238 0 17 1 238 0 18 1 238 0 19 1 238 0 20 1 238 0 21 1 238 0 23 1 238 0 25 1 238 0 26 1 238 0 27 1 238 0 28 1 238 0 30 1 238 0 31 1 238 0 32 1 238 0 34 1 238 0 35 1 238 0 37 1 238 0 38 1 238 0 39 1 238 0 40 1 238 0 41 1 238 0 42 1 238 0 44 1 238 0 45 1 238 0 47 4 97 0 48 1 238 0 49 1 238 0 50 1 238 0 51 1 238 0 52 1 238 0 54 1 238 0 59 1 238 0 61 1 238 0 65 1 238 0 68 6 57 0 69 1 238 0 71 1 238 0 72 1 238 0 80 1 238 0 82 1 238 0 86 1 238 0 87 1 238 0 88 1 238 0 89 1 238 0 90 6 61 0 181 6 65 0 182 1 238 1 107] 
#[1 1 242 0 1 1 242 0 2 1 242 0 3 1 242 0 4 1 242 0 5 1 242 0 8 1 242 0 9 1 242 0 11 1 242 0 12 1 242 0 13 1 242 0 15 1 242 0 16 1 242 0 17 1 242 0 18 1 242 0 19 1 242 0 20 1 242 0 21 1 242 0 23 1 242 0 25 1 242 0 26 6 69 0 27 1 242 0 28 1 242 0 30 1 242 0 31 1 242 0 32 1 242 0 34 1 242 0 35 1 242 0 37 1 242 0 38 1 242 0 39 1 242 0 40 1 242 0 41 1 242 0 42 1 242 0 44 1 242 0 45 1 242 0 47 1 242 0 49 1 242 0 50 1 242 0 51 1 242 0 52 1 242 0 54 1 242 0 59 1 242 0 61 1 242 0 65 1 242 0 68 1 242 0 71 1 242 0 72 1 242 0 80 1 242 0 82 1 242 0 86 1 242 0 87 1 242 0 88 1 242 0 89 1 242 0 90 1 242 1 107] 
#[0 1 246 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 4 109 0 36 6 73 0 185] 
#[0 1 250 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 0 25 0 25 0 49 0 38 0 57 0 41 0 61 0 44 0 65 0 45 0 69 0 47 0 77 0 50 0 81 0 51 0 85 0 52 0 89 0 59 0 93 0 61 0 97 0 65 1 173 0 86 0 113 0 87 0 117 0 88 0 121 0 89 0 125 0 90 0 129 0 93 0 133 0 94 0 137 0 96 6 77 0 98 1 69 1 43 1 73 1 45 1 77 1 46 1 81 1 52 1 85 1 53 1 89 1 54 1 93 1 55 1 97 1 56 1 101 1 57 1 105 1 58 1 109 1 59 1 113 1 60 1 117 1 61 1 121 1 68 1 125 1 69 1 129 1 70 1 133 1 78 1 137 1 79 1 141 1 80 1 145 1 81 1 149 1 82 1 153 1 83 1 157 1 84 1 161 1 85] 
#[0 1 254 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 0 25 0 25 0 49 0 38 0 57 0 41 0 61 0 44 0 65 0 45 0 69 0 47 0 77 0 50 0 81 0 51 0 85 0 52 0 89 0 59 0 93 0 61 0 97 0 65 1 205 0 86 0 113 0 87 0 117 0 88 0 121 0 89 0 125 0 90 0 129 0 93 0 133 0 94 0 137 0 96 1 209 0 98 1 69 1 43 1 73 1 45 1 77 1 46 1 81 1 52 1 85 1 53 1 89 1 54 1 93 1 55 1 97 1 56 1 101 1 57 1 105 1 58 1 109 1 59 1 113 1 60 1 117 1 61 1 121 1 68 1 125 1 69 1 129 1 70 6 81 1 76 1 133 1 78 1 137 1 79 1 141 1 80 1 145 1 81 1 149 1 82 1 153 1 83 1 157 1 84 1 161 1 85] 
#[0 6 85 0 39] 
#[1 0 6 0 1 0 6 0 2 0 6 0 3 0 6 0 4 0 6 0 5 0 6 0 8 0 6 0 9 0 6 0 12 0 6 0 13 0 6 0 15 0 6 0 16 0 6 0 17 0 6 0 18 0 6 0 19 0 17 0 21 0 25 0 25 0 6 0 32 0 49 0 38 0 57 0 41 0 61 0 44 0 65 0 45 0 69 0 47 0 73 0 49 0 77 0 50 0 81 0 51 0 85 0 52 0 6 0 54 0 89 0 59 0 93 0 61 0 97 0 65 0 6 0 68 0 101 0 71 0 6 0 72 0 105 0 80 0 6 0 82 0 79 0 86 0 113 0 87 0 117 0 88 0 121 0 89 0 125 0 90 0 129 0 93 0 133 0 94 0 137 0 96 1 193 0 98 1 197 0 100 0 189 0 114 6 89 0 118 0 225 0 156 0 229 0 157 0 233 0 158 0 237 0 159 0 241 0 160 0 245 0 161 0 249 0 162 0 253 0 163 1 1 0 164 1 5 0 165 1 9 0 166 1 13 0 167 1 17 0 168 1 25 0 173 1 33 0 200 1 37 0 203 1 41 1 2 1 45 1 3 1 49 1 9 1 53 1 10 1 57 1 11 1 61 1 37 1 65 1 40 1 69 1 43 1 73 1 45 1 77 1 46 1 81 1 52 1 85 1 53 1 89 1 54 1 93 1 55 1 97 1 56 1 101 1 57 1 105 1 58 1 109 1 59 1 113 1 60 1 117 1 61 1 121 1 68 1 125 1 69 1 129 1 70 1 133 1 78 1 137 1 79 1 141 1 80 1 145 1 81 1 149 1 82 1 153 1 83 1 157 1 84 1 161 1 85 1 169 1 110] 
#[1 2 2 0 1 2 2 0 2 2 2 0 3 2 2 0 4 2 2 0 5 2 2 0 8 2 2 0 9 2 2 0 11 2 2 0 12 2 2 0 13 2 2 0 15 2 2 0 16 2 2 0 17 2 2 0 18 2 2 0 19 2 2 0 20 2 2 0 21 2 2 0 22 2 2 0 23 2 2 0 24 2 2 0 25 2 2 0 26 2 2 0 27 2 2 0 28 2 2 0 30 2 2 0 31 2 2 0 32 2 2 0 33 2 2 0 34 2 2 0 35 2 2 0 36 2 2 0 37 2 2 0 38 2 2 0 39 2 2 0 40 2 2 0 41 2 2 0 42 2 2 0 44 2 2 0 45 2 2 0 47 0 235 0 48 2 2 0 49 2 2 0 50 2 2 0 51 2 2 0 52 2 2 0 54 2 2 0 59 2 2 0 61 2 2 0 65 2 2 0 68 2 2 0 69 2 2 0 71 2 2 0 72 2 2 0 80 2 2 0 82 2 2 0 86 2 2 0 87 2 2 0 88 2 2 0 89 2 2 0 90 2 2 1 107] 
#[1 0 171 0 6 0 167 0 24 0 70 0 25 0 167 0 27 0 70 0 31 0 239 0 36 0 70 0 38 0 243 0 41 0 70 0 43 0 167 0 48 0 70 0 52 0 70 0 53 0 70 0 63 0 70 0 69 0 70 0 90 2 225 0 153 2 229 1 51] 
#[1 0 247 0 24 0 251 0 27 0 250 0 31 0 246 0 48] 
#[0 6 93 0 31] 
#[1 2 6 0 24 2 6 0 27 4 97 0 48] 
#[0 6 97 0 24] 
#[0 2 10 0 24 0 27] 
#[1 2 14 0 24 6 101 0 27] 
#[1 2 18 0 1 2 18 0 2 2 18 0 3 2 18 0 4 2 18 0 5 2 18 0 8 2 18 0 9 2 18 0 11 2 18 0 12 2 18 0 13 2 18 0 15 2 18 0 16 2 18 0 17 2 18 0 18 2 18 0 19 2 18 0 20 2 18 0 21 2 18 0 22 2 18 0 23 2 18 0 24 2 18 0 25 2 18 0 26 2 18 0 27 2 18 0 28 2 18 0 30 2 18 0 31 2 18 0 32 2 18 0 33 2 18 0 34 2 18 0 35 2 18 0 36 2 18 0 37 2 18 0 38 2 18 0 39 2 18 0 40 2 18 0 41 2 18 0 42 2 18 0 44 2 18 0 45 2 18 0 47 0 255 0 48 2 18 0 49 2 18 0 50 2 18 0 51 2 18 0 52 2 18 0 54 2 18 0 59 2 18 0 61 2 18 0 65 2 18 0 68 2 18 0 69 2 18 0 71 2 18 0 72 2 18 0 80 2 18 0 82 2 18 0 86 2 18 0 87 2 18 0 88 2 18 0 89 2 18 0 90 2 18 1 107] 
#[0 6 105 0 6] 
#[1 0 6 0 12 2 22 0 24 0 6 0 25 0 73 0 49 0 6 0 52 1 3 0 74 0 183 0 86 6 109 0 173 6 113 0 215 1 61 1 37 1 65 1 40 6 117 1 95 6 121 1 96 6 125 1 97 6 129 1 98] 
#[1 4 33 0 12 4 37 0 25 4 41 0 52 2 201 0 86 2 25 0 144 4 45 0 145 4 49 0 146 6 133 0 155 4 57 1 88 4 61 1 89 4 65 1 90 4 69 1 91 4 73 1 92 4 77 1 93 4 81 1 94] 
#[0 2 26 0 1 0 2 0 3 0 4 0 5 0 7 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 64 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 2 26 0 1 0 2 0 3 0 4 0 5 0 7 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 64 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 2 30 0 1 2 30 0 2 2 30 0 3 2 30 0 4 2 30 0 5 2 30 0 8 2 30 0 9 2 30 0 11 2 30 0 12 2 30 0 13 2 30 0 15 2 30 0 16 2 30 0 17 2 30 0 18 2 30 0 19 2 30 0 20 2 30 0 21 2 30 0 22 2 30 0 23 2 30 0 24 2 30 0 25 2 30 0 26 2 30 0 27 2 30 0 28 2 30 0 30 2 30 0 31 2 30 0 32 2 30 0 33 2 30 0 34 2 30 0 35 2 30 0 36 2 30 0 37 2 30 0 38 2 30 0 39 2 30 0 40 1 7 0 41 2 30 0 42 6 141 0 43 2 30 0 44 2 30 0 45 2 30 0 47 2 30 0 48 2 30 0 49 2 30 0 50 2 30 0 51 2 30 0 52 2 30 0 54 2 30 0 59 2 30 0 61 6 145 0 63 6 149 0 64 2 30 0 65 2 30 0 68 2 30 0 69 2 30 0 71 2 30 0 72 2 30 0 80 2 30 0 82 2 30 0 86 2 30 0 87 2 30 0 88 2 30 0 89 2 30 0 90 2 30 1 107] 
#[0 2 26 0 1 0 2 0 3 0 4 0 5 0 7 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 64 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 2 26 0 1 0 2 0 3 0 4 0 5 0 7 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 64 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 2 26 0 1 0 2 0 3 0 4 0 5 0 7 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 64 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 2 26 0 1 0 2 0 3 0 4 0 5 0 7 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 64 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 2 26 0 1 0 2 0 3 0 4 0 5 0 7 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 64 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 2 26 0 1 0 2 0 3 0 4 0 5 0 7 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 64 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 2 26 0 1 0 2 0 3 0 4 0 5 0 7 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 64 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 0 25 0 25 0 14 0 31 0 49 0 38 0 57 0 41 0 61 0 44 0 65 0 45 0 69 0 47 0 77 0 50 0 81 0 51 0 85 0 52 0 89 0 59 0 93 0 61 0 97 0 65 1 173 0 86 0 113 0 87 0 117 0 88 0 121 0 89 0 125 0 90 0 129 0 93 0 133 0 94 0 137 0 96 1 177 0 98 6 153 0 112 1 69 1 43 1 73 1 45 1 77 1 46 1 81 1 52 1 85 1 53 1 89 1 54 1 93 1 55 1 97 1 56 1 101 1 57 1 105 1 58 1 109 1 59 1 113 1 60 1 117 1 61 1 121 1 68 1 125 1 69 1 129 1 70 1 133 1 78 1 137 1 79 1 141 1 80 1 145 1 81 1 149 1 82 1 153 1 83 1 157 1 84 1 161 1 85] 
#[1 0 25 0 25 0 49 0 38 0 57 0 41 0 61 0 44 0 65 0 45 0 69 0 47 0 77 0 50 0 81 0 51 0 85 0 52 0 89 0 59 0 93 0 61 0 97 0 65 1 173 0 86 0 113 0 87 0 117 0 88 0 121 0 89 0 125 0 90 0 129 0 93 0 133 0 94 0 137 0 96 6 157 0 98 1 69 1 43 1 73 1 45 1 77 1 46 1 81 1 52 1 85 1 53 1 89 1 54 1 93 1 55 1 97 1 56 1 101 1 57 1 105 1 58 1 109 1 59 1 113 1 60 1 117 1 61 1 121 1 68 1 125 1 69 1 129 1 70 1 133 1 78 1 137 1 79 1 141 1 80 1 145 1 81 1 149 1 82 1 153 1 83 1 157 1 84 1 161 1 85] 
#[1 0 25 0 25 0 49 0 38 0 57 0 41 0 61 0 44 0 65 0 45 0 69 0 47 0 77 0 50 0 81 0 51 0 85 0 52 0 89 0 59 0 93 0 61 0 97 0 65 1 173 0 86 0 113 0 87 0 117 0 88 0 121 0 89 0 125 0 90 0 129 0 93 0 133 0 94 0 137 0 96 6 161 0 98 1 69 1 43 1 73 1 45 1 77 1 46 1 81 1 52 1 85 1 53 1 89 1 54 1 93 1 55 1 97 1 56 1 101 1 57 1 105 1 58 1 109 1 59 1 113 1 60 1 117 1 61 1 121 1 68 1 125 1 69 1 129 1 70 1 133 1 78 1 137 1 79 1 141 1 80 1 145 1 81 1 149 1 82 1 153 1 83 1 157 1 84 1 161 1 85] 
#[1 4 33 0 12 4 37 0 25 4 41 0 52 2 201 0 86 2 25 0 144 4 45 0 145 4 49 0 146 6 165 0 155 4 57 1 88 4 61 1 89 4 65 1 90 4 69 1 91 4 73 1 92 4 77 1 93 4 81 1 94] 
#[1 2 34 0 1 2 34 0 2 2 34 0 3 2 34 0 4 2 34 0 5 2 34 0 7 2 34 0 8 2 34 0 9 2 34 0 10 2 34 0 11 2 34 0 12 2 34 0 13 2 34 0 15 2 34 0 16 2 34 0 17 2 34 0 18 2 34 0 19 2 34 0 20 2 34 0 21 2 34 0 22 2 34 0 23 2 34 0 24 2 34 0 25 2 34 0 26 2 34 0 27 2 34 0 28 2 34 0 30 2 34 0 31 2 34 0 32 2 34 0 33 2 34 0 34 2 34 0 35 2 34 0 36 2 34 0 37 2 34 0 38 2 34 0 39 2 34 0 40 1 11 0 41 2 34 0 42 2 34 0 43 2 34 0 44 2 34 0 45 2 34 0 46 2 34 0 47 2 34 0 48 2 34 0 49 2 34 0 50 2 34 0 51 2 34 0 52 2 34 0 53 2 34 0 54 2 34 0 55 2 34 0 59 2 34 0 61 2 34 0 63 2 34 0 64 2 34 0 65 2 34 0 68 2 34 0 69 2 34 0 71 2 34 0 72 2 34 0 80 2 34 0 82 2 34 0 86 2 34 0 87 2 34 0 88 2 34 0 89 2 34 0 90 2 34 1 107] 
#[0 5 177 0 13] 
#[1 0 6 0 12 0 6 0 25 0 73 0 49 0 6 0 52 0 6 0 86 6 173 0 173 1 61 1 37 1 65 1 40] 
#[0 2 38 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 2 42 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 2 46 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 2 50 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 6 177 0 86 6 181 0 232] 
#[1 2 54 0 1 2 54 0 2 2 54 0 3 2 54 0 4 2 54 0 5 2 54 0 8 2 54 0 9 2 54 0 11 2 54 0 12 2 54 0 13 2 54 0 15 2 54 0 16 2 54 0 17 2 54 0 18 2 54 0 19 2 54 0 20 2 54 0 21 2 54 0 23 2 54 0 25 2 54 0 26 2 54 0 28 6 185 0 29 2 54 0 30 2 54 0 31 2 54 0 32 2 54 0 34 2 54 0 35 2 54 0 37 2 54 0 38 2 54 0 39 2 54 0 40 2 54 0 41 2 54 0 42 2 54 0 44 2 54 0 45 2 54 0 47 2 54 0 49 2 54 0 50 2 54 0 51 2 54 0 52 2 54 0 54 2 54 0 59 2 54 0 61 2 54 0 65 2 54 0 68 2 54 0 71 2 54 0 72 2 54 0 80 2 54 0 82 2 54 0 86 2 54 0 87 2 54 0 88 2 54 0 89 2 54 0 90 6 189 0 122 6 193 0 123 2 54 1 107] 
#[0 2 58 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 13 0 16 0 17 0 19 0 21 0 22 0 25 0 38 0 39 0 49 0 54 0 64 0 68 0 82] 
#[0 2 62 0 12 0 13 0 25 0 32 0 52 0 58 0 65 0 86] 
#[1 4 33 0 12 4 37 0 25 4 41 0 52 2 201 0 86 2 25 0 144 4 45 0 145 4 49 0 146 6 197 0 155 4 57 1 88 4 61 1 89 4 65 1 90 4 69 1 91 4 73 1 92 4 77 1 93 4 81 1 94] 
#[1 2 66 0 24 6 201 0 27 6 205 0 55 6 209 0 213] 
#[0 2 70 0 24 0 27 0 55] 
#[1 6 213 0 13 6 217 0 32 2 74 0 58 2 74 0 65 2 74 0 86 6 221 0 216] 
#[0 2 78 0 25 0 38 0 41 0 44 0 45 0 47 0 50 0 51 0 52 0 59 0 61 0 65 0 86 0 87 0 88 0 89 0 90] 
#[0 2 82 0 25 0 38 0 41 0 44 0 45 0 47 0 50 0 51 0 52 0 59 0 61 0 65 0 86 0 87 0 88 0 89 0 90] 
#[0 2 86 0 25 0 38 0 41 0 44 0 45 0 47 0 50 0 51 0 52 0 59 0 61 0 65 0 86 0 87 0 88 0 89 0 90] 
#[0 2 90 0 25 0 38 0 41 0 44 0 45 0 47 0 50 0 51 0 52 0 59 0 61 0 65 0 86 0 87 0 88 0 89 0 90] 
#[1 0 25 0 25 0 49 0 38 0 57 0 41 0 61 0 44 0 65 0 45 0 69 0 47 0 77 0 50 0 81 0 51 0 85 0 52 0 89 0 59 0 93 0 61 0 97 0 65 1 173 0 86 0 113 0 87 0 117 0 88 0 121 0 89 0 125 0 90 0 129 0 93 0 133 0 94 0 137 0 96 6 225 0 98 1 69 1 43 1 73 1 45 1 77 1 46 1 81 1 52 1 85 1 53 1 89 1 54 1 93 1 55 1 97 1 56 1 101 1 57 1 105 1 58 1 109 1 59 1 113 1 60 1 117 1 61 1 121 1 68 1 125 1 69 1 129 1 70 1 133 1 78 1 137 1 79 1 141 1 80 1 145 1 81 1 149 1 82 1 153 1 83 1 157 1 84 1 161 1 85] 
#[0 6 229 0 86] 
#[1 0 6 0 12 0 6 0 25 0 73 0 49 0 6 0 52 0 6 0 86 6 233 0 173 1 61 1 37 1 65 1 40] 
#[0 6 237 0 22] 
#[0 2 94 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 13 0 16 0 17 0 19 0 21 0 22 0 38 0 39 0 49 0 54 0 68 0 82] 
#[0 6 241 0 22] 
#[1 0 6 0 1 0 6 0 2 0 6 0 3 0 6 0 4 0 6 0 5 0 6 0 8 0 6 0 9 0 9 0 11 0 6 0 12 0 6 0 13 0 6 0 15 0 6 0 16 0 6 0 17 0 6 0 18 0 6 0 19 0 13 0 20 0 17 0 21 0 21 0 23 0 25 0 25 0 29 0 26 0 33 0 28 0 37 0 30 0 6 0 32 0 41 0 34 0 45 0 37 0 49 0 38 6 245 0 39 0 53 0 40 0 57 0 41 0 61 0 44 0 65 0 45 0 69 0 47 0 73 0 49 0 77 0 50 0 81 0 51 0 85 0 52 0 6 0 54 0 89 0 59 0 93 0 61 0 97 0 65 0 6 0 68 0 101 0 71 0 6 0 72 0 105 0 80 0 6 0 82 0 7 0 86 0 113 0 87 0 117 0 88 0 121 0 89 0 125 0 90 0 129 0 93 0 133 0 94 0 137 0 96 0 141 0 98 0 145 0 100 0 149 0 101 0 153 0 102 0 157 0 103 0 161 0 104 3 9 0 105 0 173 0 107 0 177 0 108 0 181 0 109 0 185 0 110 0 189 0 114 0 193 0 119 0 197 0 120 0 201 0 133 0 205 0 134 0 209 0 135 0 213 0 136 0 217 0 137 0 221 0 138 0 225 0 156 0 229 0 157 0 233 0 158 0 237 0 159 0 241 0 160 0 245 0 161 0 249 0 162 0 253 0 163 1 1 0 164 1 5 0 165 1 9 0 166 1 13 0 167 1 17 0 168 1 25 0 173 1 33 0 200 1 37 0 203 1 41 1 2 1 45 1 3 1 49 1 9 1 53 1 10 1 57 1 11 1 61 1 37 1 65 1 40 1 69 1 43 1 73 1 45 1 77 1 46 1 81 1 52 1 85 1 53 1 89 1 54 1 93 1 55 1 97 1 56 1 101 1 57 1 105 1 58 1 109 1 59 1 113 1 60 1 117 1 61 1 121 1 68 1 125 1 69 1 129 1 70 1 133 1 78 1 137 1 79 1 141 1 80 1 145 1 81 1 149 1 82 1 153 1 83 1 157 1 84 1 161 1 85 1 169 1 110] 
#[0 2 98 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 32 0 34 0 37 0 38 0 40 0 41 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90] 
#[1 1 66 0 22 4 181 0 27 4 185 0 64 6 249 0 209 4 193 0 210] 
#[1 1 66 0 22 4 185 0 64 6 253 0 209 4 193 0 210] 
#[1 7 1 0 35 2 102 0 39 7 5 0 42 7 9 0 124 7 13 0 125 7 17 0 126 7 21 0 127 7 25 0 128] 
#[1 2 106 0 24 7 29 0 25 7 33 0 38 7 37 0 52 7 41 0 86 0 113 0 87 0 117 0 88 0 121 0 89 7 45 0 90 7 49 0 93 0 133 0 94 7 53 1 38 7 57 1 41 7 61 1 42] 
#[0 2 110 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 25 0 32 0 42 0 49 0 52 0 54 0 66 0 67 0 68 0 70 0 72 0 73 0 74 0 82 0 86] 
#[0 2 114 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 25 0 32 0 42 0 49 0 52 0 54 0 66 0 67 0 68 0 70 0 72 0 73 0 74 0 82 0 86] 
#[0 2 118 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 0 25 0 25 0 49 0 38 0 57 0 41 0 61 0 44 0 65 0 45 0 69 0 47 0 77 0 50 0 81 0 51 0 85 0 52 0 89 0 59 0 93 0 61 0 97 0 65 1 173 0 86 0 113 0 87 0 117 0 88 0 121 0 89 0 125 0 90 0 129 0 93 0 133 0 94 0 137 0 96 7 65 0 98 1 69 1 43 1 73 1 45 1 77 1 46 1 81 1 52 1 85 1 53 1 89 1 54 1 93 1 55 1 97 1 56 1 101 1 57 1 105 1 58 1 109 1 59 1 113 1 60 1 117 1 61 1 121 1 68 1 125 1 69 1 129 1 70 1 133 1 78 1 137 1 79 1 141 1 80 1 145 1 81 1 149 1 82 1 153 1 83 1 157 1 84 1 161 1 85] 
#[0 2 122 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 0 25 0 25 0 49 0 38 0 57 0 41 0 61 0 44 0 65 0 45 2 126 0 46 0 69 0 47 0 77 0 50 0 81 0 51 0 85 0 52 0 89 0 59 0 93 0 61 0 97 0 65 1 173 0 86 0 113 0 87 0 117 0 88 0 121 0 89 0 125 0 90 0 129 0 93 0 133 0 94 0 137 0 96 7 69 0 98 1 69 1 43 1 73 1 45 1 77 1 46 1 81 1 52 1 85 1 53 1 89 1 54 1 93 1 55 1 97 1 56 1 101 1 57 1 105 1 58 1 109 1 59 1 113 1 60 1 117 1 61 2 169 1 63 7 73 1 65 1 121 1 68 1 125 1 69 1 129 1 70 1 133 1 78 1 137 1 79 1 141 1 80 1 145 1 81 1 149 1 82 1 153 1 83 1 157 1 84 1 161 1 85] 
#[0 2 130 0 46] 
#[0 2 134 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 0 25 0 25 0 49 0 38 0 57 0 41 0 61 0 44 0 65 0 45 2 126 0 46 0 69 0 47 0 77 0 50 0 81 0 51 0 85 0 52 0 89 0 59 0 93 0 61 0 97 0 65 1 173 0 86 0 113 0 87 0 117 0 88 0 121 0 89 0 125 0 90 0 129 0 93 0 133 0 94 0 137 0 96 7 77 0 98 1 69 1 43 1 73 1 45 1 77 1 46 1 81 1 52 1 85 1 53 1 89 1 54 1 93 1 55 1 97 1 56 1 101 1 57 1 105 1 58 1 109 1 59 1 113 1 60 1 117 1 61 7 81 1 66 2 181 1 67 1 121 1 68 1 125 1 69 1 129 1 70 1 133 1 78 1 137 1 79 1 141 1 80 1 145 1 81 1 149 1 82 1 153 1 83 1 157 1 84 1 161 1 85] 
#[0 2 138 0 46] 
#[0 2 142 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 2 146 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 7 85 0 46] 
#[0 2 150 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 2 154 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 7 89 0 46] 
#[1 2 201 0 86 2 25 0 144 7 93 0 145 7 97 1 103] 
#[1 7 101 0 38 7 105 1 8] 
#[0 2 158 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 13 0 16 0 17 0 19 0 21 0 38 0 39 0 49 0 54 0 68 0 69 0 82] 
#[0 7 109 0 38] 
#[0 7 113 0 38] 
#[0 7 117 0 38] 
#[1 7 121 0 7 7 125 0 27] 
#[0 2 162 0 7 0 27] 
#[1 2 166 0 7 2 166 0 27 6 137 0 41 6 141 0 43 6 145 0 63 6 149 0 64] 
#[0 2 170 0 6 0 36 0 38] 
#[1 3 101 0 6 0 150 0 36 0 150 0 38 3 105 0 142 7 129 0 205] 
#[0 2 174 0 36 0 38] 
#[1 5 33 0 36 1 102 0 38 7 133 0 243 5 41 1 104] 
#[0 2 178 0 6 0 36 0 38] 
#[1 3 101 0 6 0 150 0 36 0 150 0 38 3 105 0 142 7 137 0 205] 
#[0 2 182 0 86 0 90] 
#[0 2 186 0 86 0 90] 
#[0 2 190 0 86 0 90] 
#[0 2 194 0 86 0 90] 
#[0 2 198 0 86 0 90] 
#[0 2 202 0 86 0 90] 
#[0 2 206 0 86 0 90] 
#[1 7 141 0 86 7 145 0 90 7 149 0 175 7 153 0 177] 
#[0 2 210 0 86 0 90] 
#[0 2 214 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 2 218 0 64] 
#[0 2 222 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 13 0 16 0 17 0 19 0 32] 
#[0 2 226 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 13 0 16 0 17 0 19 0 32] 
#[0 2 230 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 13 0 16 0 17 0 19 0 32] 
#[0 2 234 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 13 0 16 0 17 0 19 0 32] 
#[0 2 238 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 13 0 16 0 17 0 19 0 32] 
#[0 2 242 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 13 0 16 0 17 0 19 0 32] 
#[0 2 246 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 13 0 16 0 17 0 19 0 32] 
#[0 2 250 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 13 0 16 0 17 0 19 0 32] 
#[0 2 254 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 13 0 16 0 17 0 19 0 32] 
#[0 3 2 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 13 0 16 0 17 0 19 0 32] 
#[0 3 6 0 13 0 25 0 32 0 38 0 41 0 44 0 45 0 47 0 50 0 51 0 52 0 53 0 59 0 61 0 65 0 86 0 87 0 88 0 89 0 90] 
#[0 3 10 0 86 0 90] 
#[1 1 233 0 13 3 201 0 25 1 241 0 32 0 49 0 38 0 87 0 41 0 61 0 44 0 65 0 45 0 69 0 47 0 77 0 50 0 81 0 51 0 85 0 52 1 245 0 53 0 89 0 59 0 93 0 61 1 249 0 65 1 253 0 86 0 113 0 87 0 117 0 88 0 121 0 89 0 125 0 90 0 129 0 93 0 133 0 94 0 137 0 96 3 209 0 98 3 213 0 117 2 25 0 144 2 29 0 145 7 157 0 179 3 221 0 180 2 37 1 20 2 41 1 22 2 45 1 23 2 49 1 24 2 53 1 25 2 57 1 26 2 61 1 27 2 65 1 31 2 69 1 33 2 73 1 34 1 69 1 43 1 73 1 45 1 77 1 46 1 81 1 52 1 85 1 53 1 89 1 54 1 93 1 55 1 97 1 56 1 101 1 57 1 105 1 58 1 109 1 59 1 113 1 60 1 117 1 61 1 121 1 68 1 125 1 69 1 129 1 70 1 133 1 78 1 137 1 79 1 141 1 80 1 145 1 81 1 149 1 82 1 153 1 83 1 157 1 84 1 161 1 85] 
#[1 7 161 0 36 7 165 0 38] 
#[0 3 14 0 6 0 25] 
#[1 3 18 0 1 3 18 0 2 3 18 0 3 3 18 0 4 3 18 0 5 3 18 0 8 3 18 0 9 3 18 0 11 3 18 0 12 3 18 0 13 3 18 0 15 3 18 0 16 3 18 0 17 3 18 0 18 3 18 0 19 3 18 0 20 3 18 0 21 3 18 0 23 3 18 0 25 3 18 0 26 3 18 0 28 3 18 0 30 3 18 0 31 3 18 0 32 3 18 0 34 3 18 0 35 3 18 0 37 3 18 0 38 3 18 0 39 3 18 0 40 1 15 0 41 3 18 0 42 6 141 0 43 3 18 0 44 3 18 0 45 3 18 0 47 3 18 0 49 3 18 0 50 3 18 0 51 3 18 0 52 3 18 0 54 3 18 0 59 3 18 0 61 6 145 0 63 6 149 0 64 3 18 0 65 3 18 0 68 3 18 0 71 3 18 0 72 3 18 0 80 3 18 0 82 3 18 0 86 3 18 0 87 3 18 0 88 3 18 0 89 3 18 0 90 3 18 1 107] 
#[1 3 22 0 25 3 22 0 38 3 22 0 64 7 169 0 206 7 173 0 208] 
#[1 3 26 0 7 7 177 0 27 7 181 0 33 7 185 0 141 7 189 0 148] 
#[0 3 30 0 7 0 27 0 33] 
#[1 3 34 0 7 3 34 0 27 3 34 0 33 7 193 0 36] 
#[1 1 225 0 38 7 197 0 113 7 201 1 6] 
#[1 4 33 0 12 4 37 0 25 4 41 0 52 2 201 0 86 2 25 0 144 4 45 0 145 4 49 0 146 7 205 0 155 4 57 1 88 4 61 1 89 4 65 1 90 4 69 1 91 4 73 1 92 4 77 1 93 4 81 1 94] 
#[1 0 6 0 1 0 6 0 2 0 6 0 3 0 6 0 4 0 6 0 5 0 6 0 8 0 6 0 9 0 9 0 11 0 6 0 12 0 6 0 13 0 6 0 15 0 6 0 16 0 6 0 17 0 6 0 18 0 6 0 19 0 13 0 20 0 17 0 21 0 21 0 23 0 25 0 25 0 29 0 26 0 33 0 28 0 37 0 30 0 6 0 32 0 41 0 34 0 45 0 37 0 49 0 38 0 10 0 39 0 53 0 40 0 57 0 41 0 61 0 44 0 65 0 45 0 69 0 47 0 73 0 49 0 77 0 50 0 81 0 51 0 85 0 52 0 6 0 54 0 89 0 59 0 93 0 61 0 97 0 65 0 6 0 68 0 6 0 70 0 101 0 71 0 6 0 72 0 6 0 73 0 105 0 80 0 6 0 82 0 7 0 86 0 113 0 87 0 117 0 88 0 121 0 89 0 125 0 90 0 129 0 93 0 133 0 94 0 137 0 96 0 141 0 98 0 145 0 100 0 149 0 101 0 153 0 102 0 157 0 103 0 161 0 104 0 165 0 105 0 169 0 106 0 173 0 107 0 177 0 108 0 181 0 109 0 185 0 110 0 189 0 114 0 193 0 119 0 197 0 120 0 201 0 133 0 205 0 134 0 209 0 135 0 213 0 136 0 217 0 137 0 221 0 138 0 225 0 156 0 229 0 157 0 233 0 158 0 237 0 159 0 241 0 160 0 245 0 161 0 249 0 162 0 253 0 163 1 1 0 164 1 5 0 165 1 9 0 166 1 13 0 167 1 17 0 168 3 245 0 172 7 209 0 173 7 213 0 189 7 217 0 191 7 221 0 194 7 225 0 196 1 33 0 200 1 37 0 203 1 41 1 2 1 45 1 3 1 49 1 9 1 53 1 10 1 57 1 11 1 61 1 37 1 65 1 40 1 69 1 43 1 73 1 45 1 77 1 46 1 81 1 52 1 85 1 53 1 89 1 54 1 93 1 55 1 97 1 56 1 101 1 57 1 105 1 58 1 109 1 59 1 113 1 60 1 117 1 61 1 121 1 68 1 125 1 69 1 129 1 70 1 133 1 78 1 137 1 79 1 141 1 80 1 145 1 81 1 149 1 82 1 153 1 83 1 157 1 84 1 161 1 85 1 169 1 110] 
#[0 3 38 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 3 42 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 3 46 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 7 229 0 36] 
#[1 4 33 0 12 4 37 0 25 4 41 0 52 2 201 0 86 2 25 0 144 4 45 0 145 4 49 0 146 7 233 0 155 4 57 1 88 4 61 1 89 4 65 1 90 4 69 1 91 4 73 1 92 4 77 1 93 4 81 1 94] 
#[1 3 50 0 1 3 50 0 2 3 50 0 3 3 50 0 4 3 50 0 5 3 50 0 8 3 50 0 9 3 50 0 11 3 50 0 12 3 50 0 13 3 50 0 15 3 50 0 16 3 50 0 17 3 50 0 18 3 50 0 19 3 50 0 20 3 50 0 21 3 50 0 22 3 50 0 23 3 50 0 24 3 50 0 25 3 50 0 26 3 50 0 27 3 50 0 28 3 50 0 30 3 50 0 31 3 50 0 32 3 50 0 33 3 50 0 34 3 50 0 35 3 50 0 36 3 50 0 37 3 50 0 38 3 50 0 39 3 50 0 40 1 19 0 41 3 50 0 42 1 23 0 43 3 50 0 44 3 50 0 45 3 50 0 46 3 50 0 47 3 50 0 48 3 50 0 49 3 50 0 50 3 50 0 51 3 50 0 52 3 50 0 53 3 50 0 54 3 50 0 55 3 50 0 59 3 50 0 61 6 145 0 63 6 149 0 64 3 50 0 65 3 50 0 68 3 50 0 69 3 50 0 71 3 50 0 72 3 50 0 80 3 50 0 82 3 50 0 86 3 50 0 87 3 50 0 88 3 50 0 89 3 50 0 90 3 50 1 107] 
#[1 3 54 0 1 3 54 0 2 3 54 0 3 3 54 0 4 3 54 0 5 3 54 0 8 3 54 0 9 3 54 0 11 3 54 0 12 3 54 0 13 3 54 0 15 3 54 0 16 3 54 0 17 3 54 0 18 3 54 0 19 3 54 0 20 3 54 0 21 3 54 0 22 3 54 0 23 3 54 0 24 3 54 0 25 3 54 0 26 3 54 0 27 3 54 0 28 3 54 0 30 3 54 0 31 3 54 0 32 3 54 0 33 3 54 0 34 3 54 0 35 3 54 0 36 3 54 0 37 3 54 0 38 3 54 0 39 3 54 0 40 1 27 0 41 3 54 0 42 1 31 0 43 3 54 0 44 3 54 0 45 3 54 0 46 3 54 0 47 3 54 0 48 3 54 0 49 3 54 0 50 3 54 0 51 3 54 0 52 3 54 0 53 3 54 0 54 3 54 0 55 3 54 0 59 3 54 0 61 6 145 0 63 6 149 0 64 3 54 0 65 3 54 0 68 3 54 0 69 3 54 0 71 3 54 0 72 3 54 0 80 3 54 0 82 3 54 0 86 3 54 0 87 3 54 0 88 3 54 0 89 3 54 0 90 3 54 1 107] 
#[0 3 58 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 3 62 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 3 66 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 3 70 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 3 74 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 3 78 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 3 82 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 0 70 0 1 0 70 0 2 0 70 0 3 0 70 0 4 0 70 0 5 2 221 0 6 0 70 0 8 0 70 0 9 0 70 0 11 0 70 0 12 0 70 0 13 0 70 0 15 0 70 0 16 0 70 0 17 0 70 0 18 0 70 0 19 0 70 0 20 0 70 0 21 0 70 0 22 0 70 0 23 0 70 0 24 0 70 0 25 0 70 0 26 0 70 0 27 0 70 0 28 0 70 0 30 0 70 0 31 0 70 0 32 0 70 0 33 0 70 0 34 0 70 0 35 0 70 0 36 0 70 0 37 0 70 0 38 0 70 0 39 0 70 0 40 0 70 0 41 0 70 0 42 0 70 0 43 0 70 0 44 0 70 0 45 0 70 0 46 0 70 0 47 0 70 0 48 0 70 0 49 0 70 0 50 0 70 0 51 0 70 0 52 0 70 0 53 0 70 0 54 0 70 0 55 0 70 0 59 0 70 0 61 0 70 0 63 0 70 0 65 0 70 0 68 0 70 0 69 0 70 0 71 0 70 0 72 0 70 0 80 0 70 0 82 0 70 0 86 0 70 0 87 0 70 0 88 0 70 0 89 0 70 0 90 2 225 0 153 7 237 1 51 0 70 1 107] 
#[0 3 86 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 0 250 0 27 0 46] 
#[1 4 89 0 27 7 241 0 46] 
#[0 3 90 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 3 94 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 0 247 0 24 0 247 0 27 0 246 0 48] 
#[1 0 25 0 25 0 49 0 38 0 57 0 41 0 61 0 44 0 65 0 45 0 69 0 47 0 77 0 50 0 81 0 51 0 85 0 52 0 89 0 59 0 93 0 61 0 97 0 65 1 173 0 86 0 113 0 87 0 117 0 88 0 121 0 89 0 125 0 90 0 129 0 93 0 133 0 94 0 137 0 96 7 245 0 98 1 69 1 43 1 73 1 45 1 77 1 46 1 81 1 52 1 85 1 53 1 89 1 54 1 93 1 55 1 97 1 56 1 101 1 57 1 105 1 58 1 109 1 59 1 113 1 60 1 117 1 61 1 121 1 68 1 125 1 69 1 129 1 70 1 133 1 78 1 137 1 79 1 141 1 80 1 145 1 81 1 149 1 82 1 153 1 83 1 157 1 84 1 161 1 85] 
#[0 3 98 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 3 102 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 1 233 0 13 3 201 0 25 1 241 0 32 0 49 0 38 0 87 0 41 0 61 0 44 0 65 0 45 0 69 0 47 0 77 0 50 0 81 0 51 0 85 0 52 1 245 0 53 0 89 0 59 0 93 0 61 1 249 0 65 1 253 0 86 0 113 0 87 0 117 0 88 0 121 0 89 0 125 0 90 0 129 0 93 0 133 0 94 0 137 0 96 3 209 0 98 3 213 0 117 2 25 0 144 2 29 0 145 7 249 0 180 2 37 1 20 2 41 1 22 2 45 1 23 2 49 1 24 2 53 1 25 2 57 1 26 2 61 1 27 2 65 1 31 2 69 1 33 2 73 1 34 1 69 1 43 1 73 1 45 1 77 1 46 1 81 1 52 1 85 1 53 1 89 1 54 1 93 1 55 1 97 1 56 1 101 1 57 1 105 1 58 1 109 1 59 1 113 1 60 1 117 1 61 1 121 1 68 1 125 1 69 1 129 1 70 1 133 1 78 1 137 1 79 1 141 1 80 1 145 1 81 1 149 1 82 1 153 1 83 1 157 1 84 1 161 1 85] 
#[1 1 35 0 38 6 57 0 69 7 253 0 113 8 1 0 181 6 65 0 182 8 5 0 186 8 9 0 187] 
#[0 3 106 0 24 0 27] 
#[0 3 110 0 24 0 27] 
#[0 3 114 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 29 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 66 0 67 0 68 0 70 0 71 0 72 0 73 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 3 118 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 0 25 0 25 0 14 0 31 0 49 0 38 0 57 0 41 0 61 0 44 0 65 0 45 0 69 0 47 0 77 0 50 0 81 0 51 0 85 0 52 0 89 0 59 0 93 0 61 0 97 0 65 1 173 0 86 0 113 0 87 0 117 0 88 0 121 0 89 0 125 0 90 0 129 0 93 0 133 0 94 0 137 0 96 1 177 0 98 8 13 0 112 1 69 1 43 1 73 1 45 1 77 1 46 1 81 1 52 1 85 1 53 1 89 1 54 1 93 1 55 1 97 1 56 1 101 1 57 1 105 1 58 1 109 1 59 1 113 1 60 1 117 1 61 1 121 1 68 1 125 1 69 1 129 1 70 1 133 1 78 1 137 1 79 1 141 1 80 1 145 1 81 1 149 1 82 1 153 1 83 1 157 1 84 1 161 1 85] 
#[0 3 122 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 1 233 0 13 3 201 0 25 1 241 0 32 0 49 0 38 0 87 0 41 0 61 0 44 0 65 0 45 0 69 0 47 0 77 0 50 0 81 0 51 0 85 0 52 1 245 0 53 0 89 0 59 0 93 0 61 1 249 0 65 1 253 0 86 0 113 0 87 0 117 0 88 0 121 0 89 0 125 0 90 0 129 0 93 0 133 0 94 0 137 0 96 3 209 0 98 4 13 0 117 2 25 0 144 2 29 0 145 2 37 1 20 2 41 1 22 2 45 1 23 2 49 1 24 2 53 1 25 2 57 1 26 2 61 1 27 8 17 1 29 2 65 1 31 2 69 1 33 2 73 1 34 1 69 1 43 1 73 1 45 1 77 1 46 1 81 1 52 1 85 1 53 1 89 1 54 1 93 1 55 1 97 1 56 1 101 1 57 1 105 1 58 1 109 1 59 1 113 1 60 1 117 1 61 1 121 1 68 1 125 1 69 1 129 1 70 1 133 1 78 1 137 1 79 1 141 1 80 1 145 1 81 1 149 1 82 1 153 1 83 1 157 1 84 1 161 1 85] 
#[1 3 126 0 7 2 201 0 86 2 25 0 144 8 21 0 145 8 25 1 100 8 29 1 101 8 33 1 102] 
#[1 1 58 0 12 1 58 0 25 1 58 0 52 4 141 0 74 1 58 0 86 8 37 0 215] 
#[1 8 41 0 86 8 45 1 99] 
#[0 8 49 0 24] 
#[1 2 66 0 24 8 53 0 27 6 205 0 55 8 57 0 213] 
#[0 3 130 0 24] 
#[0 3 134 0 24 0 27 0 55] 
#[1 8 61 0 36 6 137 0 41 6 141 0 43 8 65 0 46 6 145 0 63 6 149 0 64] 
#[1 8 69 0 56 8 73 0 57] 
#[0 3 138 0 1 0 2 0 3 0 4 0 5 0 7 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 64 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 3 142 0 1 0 2 0 3 0 4 0 5 0 7 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 64 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 4 33 0 12 4 37 0 25 4 41 0 52 2 201 0 86 2 25 0 144 4 45 0 145 4 49 0 146 8 77 0 155 4 57 1 88 4 61 1 89 4 65 1 90 4 69 1 91 4 73 1 92 4 77 1 93 4 81 1 94] 
#[0 8 81 0 31] 
#[0 3 146 0 27 0 31 0 46] 
#[1 1 225 0 38 8 85 0 113] 
#[1 3 150 0 1 3 150 0 2 3 150 0 3 3 150 0 4 3 150 0 5 3 150 0 8 3 150 0 9 3 150 0 11 3 150 0 12 3 150 0 13 3 150 0 15 3 150 0 16 3 150 0 17 3 150 0 18 3 150 0 19 3 150 0 20 3 150 0 21 3 150 0 22 3 150 0 23 3 150 0 24 3 150 0 25 3 150 0 26 3 150 0 27 3 150 0 28 3 150 0 30 3 150 0 31 3 150 0 32 3 150 0 33 3 150 0 34 3 150 0 35 3 150 0 36 3 150 0 37 3 150 0 38 3 150 0 39 3 150 0 40 1 39 0 41 3 150 0 42 6 141 0 43 3 150 0 44 3 150 0 45 3 150 0 47 3 150 0 48 3 150 0 49 3 150 0 50 3 150 0 51 3 150 0 52 3 150 0 54 3 150 0 59 3 150 0 61 6 145 0 63 6 149 0 64 3 150 0 65 3 150 0 68 3 150 0 69 3 150 0 71 3 150 0 72 3 150 0 80 3 150 0 82 3 150 0 86 3 150 0 87 3 150 0 88 3 150 0 89 3 150 0 90 3 150 1 107] 
#[1 2 201 0 86 2 25 0 144 8 89 0 145] 
#[1 4 33 0 12 4 37 0 25 4 41 0 52 2 201 0 86 2 25 0 144 4 45 0 145 4 49 0 146 8 93 0 155 4 57 1 88 4 61 1 89 4 65 1 90 4 69 1 91 4 73 1 92 4 77 1 93 4 81 1 94] 
#[0 3 154 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 3 158 0 1 3 158 0 2 3 158 0 3 3 158 0 4 3 158 0 5 3 158 0 8 3 158 0 9 3 158 0 11 3 158 0 12 3 158 0 13 3 158 0 15 3 158 0 16 3 158 0 17 3 158 0 18 3 158 0 19 3 158 0 20 3 158 0 21 3 158 0 22 3 158 0 23 3 158 0 24 1 43 0 25 3 158 0 26 3 158 0 27 3 158 0 28 3 158 0 30 3 158 0 31 3 158 0 32 3 158 0 33 3 158 0 34 3 158 0 35 3 158 0 36 3 158 0 37 3 158 0 38 3 158 0 39 3 158 0 40 3 158 0 41 3 158 0 42 3 158 0 44 3 158 0 45 3 158 0 47 3 158 0 48 3 158 0 49 3 158 0 50 3 158 0 51 3 158 0 52 3 158 0 54 3 158 0 59 3 158 0 61 3 158 0 65 3 158 0 68 3 158 0 69 3 158 0 71 3 158 0 72 3 158 0 80 3 158 0 82 3 158 0 86 3 158 0 87 3 158 0 88 3 158 0 89 3 158 0 90 8 101 1 24 8 105 1 32 3 158 1 107] 
#[1 0 37 0 30 1 225 0 38 8 109 0 113 8 113 0 119] 
#[0 3 162 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 3 166 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 3 170 0 24 3 170 0 27 6 137 0 41 6 141 0 43 3 170 0 55 6 145 0 63 6 149 0 64] 
#[1 0 6 0 12 1 58 0 13 0 6 0 25 1 58 0 32 0 73 0 49 0 6 0 52 1 58 0 58 1 58 0 65 4 141 0 74 0 183 0 86 4 145 0 173 8 117 0 214 4 157 0 215 1 61 1 37 1 65 1 40] 
#[0 3 174 0 24] 
#[0 8 121 0 24] 
#[1 8 125 0 58 3 178 0 65 3 178 0 86 8 129 0 217] 
#[0 3 182 0 58 0 65 0 86] 
#[1 8 125 0 58 3 178 0 65 3 178 0 86 8 133 0 217] 
#[0 8 137 0 46] 
#[0 3 186 0 22 0 27 0 64] 
#[1 4 33 0 12 4 37 0 25 4 41 0 52 2 201 0 86 2 25 0 144 4 45 0 145 4 49 0 146 8 141 0 155 4 57 1 88 4 61 1 89 4 65 1 90 4 69 1 91 4 73 1 92 4 77 1 93 4 81 1 94] 
#[0 3 190 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 32 0 34 0 37 0 38 0 40 0 41 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90] 
#[0 3 194 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 32 0 34 0 37 0 38 0 40 0 41 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90] 
#[0 3 198 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 8 145 0 22] 
#[0 8 149 0 22] 
#[0 8 153 0 36] 
#[1 1 233 0 13 3 201 0 25 1 241 0 32 0 49 0 38 0 87 0 41 0 61 0 44 0 65 0 45 0 69 0 47 0 77 0 50 0 81 0 51 0 85 0 52 1 245 0 53 0 89 0 59 0 93 0 61 1 249 0 65 1 253 0 86 0 113 0 87 0 117 0 88 0 121 0 89 0 125 0 90 0 129 0 93 0 133 0 94 0 137 0 96 3 209 0 98 8 157 0 117 8 161 0 129 2 25 0 144 2 29 0 145 2 37 1 20 2 41 1 22 2 45 1 23 2 49 1 24 2 53 1 25 2 57 1 26 2 61 1 27 2 65 1 31 2 69 1 33 2 73 1 34 1 69 1 43 1 73 1 45 1 77 1 46 1 81 1 52 1 85 1 53 1 89 1 54 1 93 1 55 1 97 1 56 1 101 1 57 1 105 1 58 1 109 1 59 1 113 1 60 1 117 1 61 1 121 1 68 1 125 1 69 1 129 1 70 1 133 1 78 1 137 1 79 1 141 1 80 1 145 1 81 1 149 1 82 1 153 1 83 1 157 1 84 1 161 1 85] 
#[0 8 165 0 39] 
#[0 3 202 0 35 0 39 0 42] 
#[1 7 1 0 35 3 206 0 39 7 5 0 42 8 169 0 125 7 21 0 127 7 25 0 128] 
#[1 0 6 0 1 0 6 0 2 0 6 0 3 0 6 0 4 0 6 0 5 0 6 0 8 0 6 0 9 0 9 0 11 0 6 0 12 0 6 0 13 0 6 0 15 0 6 0 16 0 6 0 17 0 6 0 18 0 6 0 19 0 13 0 20 0 17 0 21 0 21 0 23 0 25 0 25 0 29 0 26 0 33 0 28 0 37 0 30 8 173 0 31 0 6 0 32 0 41 0 34 0 45 0 37 0 49 0 38 0 53 0 40 0 57 0 41 0 61 0 44 0 65 0 45 0 69 0 47 0 73 0 49 0 77 0 50 0 81 0 51 0 85 0 52 0 6 0 54 0 89 0 59 0 93 0 61 0 97 0 65 0 6 0 68 0 101 0 71 0 6 0 72 0 105 0 80 0 6 0 82 0 7 0 86 0 113 0 87 0 117 0 88 0 121 0 89 0 125 0 90 0 129 0 93 0 133 0 94 0 137 0 96 0 141 0 98 0 145 0 100 0 149 0 101 0 153 0 102 0 157 0 103 0 161 0 104 0 165 0 105 8 177 0 106 0 173 0 107 0 177 0 108 0 181 0 109 0 185 0 110 0 189 0 114 0 193 0 119 0 197 0 120 0 201 0 133 0 205 0 134 0 209 0 135 0 213 0 136 0 217 0 137 0 221 0 138 0 225 0 156 0 229 0 157 0 233 0 158 0 237 0 159 0 241 0 160 0 245 0 161 0 249 0 162 0 253 0 163 1 1 0 164 1 5 0 165 1 9 0 166 1 13 0 167 1 17 0 168 1 25 0 173 1 33 0 200 1 37 0 203 1 41 1 2 1 45 1 3 1 49 1 9 1 53 1 10 1 57 1 11 1 61 1 37 1 65 1 40 1 69 1 43 1 73 1 45 1 77 1 46 1 81 1 52 1 85 1 53 1 89 1 54 1 93 1 55 1 97 1 56 1 101 1 57 1 105 1 58 1 109 1 59 1 113 1 60 1 117 1 61 1 121 1 68 1 125 1 69 1 129 1 70 1 133 1 78 1 137 1 79 1 141 1 80 1 145 1 81 1 149 1 82 1 153 1 83 1 157 1 84 1 161 1 85 1 169 1 110] 
#[1 0 6 0 1 0 6 0 2 0 6 0 3 0 6 0 4 0 6 0 5 0 6 0 8 0 6 0 9 0 9 0 11 0 6 0 12 0 6 0 13 0 6 0 15 0 6 0 16 0 6 0 17 0 6 0 18 0 6 0 19 0 13 0 20 0 17 0 21 0 21 0 23 0 25 0 25 0 29 0 26 0 33 0 28 0 37 0 30 8 181 0 31 0 6 0 32 0 41 0 34 0 45 0 37 0 49 0 38 0 53 0 40 0 57 0 41 0 61 0 44 0 65 0 45 0 69 0 47 0 73 0 49 0 77 0 50 0 81 0 51 0 85 0 52 0 6 0 54 0 89 0 59 0 93 0 61 0 97 0 65 0 6 0 68 0 101 0 71 0 6 0 72 0 105 0 80 0 6 0 82 0 7 0 86 0 113 0 87 0 117 0 88 0 121 0 89 0 125 0 90 0 129 0 93 0 133 0 94 0 137 0 96 0 141 0 98 0 145 0 100 0 149 0 101 0 153 0 102 0 157 0 103 0 161 0 104 0 165 0 105 8 185 0 106 0 173 0 107 0 177 0 108 0 181 0 109 0 185 0 110 0 189 0 114 0 193 0 119 0 197 0 120 0 201 0 133 0 205 0 134 0 209 0 135 0 213 0 136 0 217 0 137 0 221 0 138 0 225 0 156 0 229 0 157 0 233 0 158 0 237 0 159 0 241 0 160 0 245 0 161 0 249 0 162 0 253 0 163 1 1 0 164 1 5 0 165 1 9 0 166 1 13 0 167 1 17 0 168 1 25 0 173 1 33 0 200 1 37 0 203 1 41 1 2 1 45 1 3 1 49 1 9 1 53 1 10 1 57 1 11 1 61 1 37 1 65 1 40 1 69 1 43 1 73 1 45 1 77 1 46 1 81 1 52 1 85 1 53 1 89 1 54 1 93 1 55 1 97 1 56 1 101 1 57 1 105 1 58 1 109 1 59 1 113 1 60 1 117 1 61 1 121 1 68 1 125 1 69 1 129 1 70 1 133 1 78 1 137 1 79 1 141 1 80 1 145 1 81 1 149 1 82 1 153 1 83 1 157 1 84 1 161 1 85 1 169 1 110] 
#[1 2 106 0 24 7 29 0 25 7 33 0 38 7 37 0 52 7 41 0 86 0 113 0 87 0 117 0 88 0 121 0 89 7 45 0 90 7 49 0 93 0 133 0 94 8 189 1 38 7 57 1 41 7 61 1 42] 
#[1 7 29 0 25 7 33 0 38 2 106 0 39 7 37 0 52 7 41 0 86 0 113 0 87 0 117 0 88 0 121 0 89 7 45 0 90 7 49 0 93 0 133 0 94 8 193 1 38 7 57 1 41 7 61 1 42] 
#[1 7 29 0 25 7 33 0 38 2 106 0 46 7 37 0 52 7 41 0 86 0 113 0 87 0 117 0 88 0 121 0 89 7 45 0 90 7 49 0 93 0 133 0 94 8 197 1 38 7 57 1 41 7 61 1 42] 
#[0 3 210 0 24 0 25 0 38 0 39 0 46 0 52 0 86 0 87 0 88 0 89 0 90] 
#[0 3 214 0 24 0 25 0 38 0 39 0 46 0 52 0 86 0 87 0 88 0 89 0 90] 
#[0 3 218 0 24 0 25 0 38 0 39 0 46 0 52 0 86 0 87 0 88 0 89 0 90] 
#[0 8 201 0 24] 
#[0 3 222 0 24 0 25 0 38 0 39 0 46 0 52 0 86 0 87 0 88 0 89 0 90] 
#[1 3 226 0 24 7 29 0 25 7 33 0 38 3 226 0 39 3 226 0 46 7 37 0 52 7 41 0 86 0 113 0 87 0 117 0 88 0 121 0 89 7 45 0 90 7 49 0 93 0 133 0 94 8 205 1 41] 
#[0 3 230 0 27 0 46] 
#[0 1 90 0 27 0 46] 
#[0 3 234 0 46] 
#[0 4 237 0 36] 
#[0 3 238 0 46] 
#[0 3 242 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 3 246 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 3 250 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 13 0 16 0 17 0 19 0 21 0 27 0 38 0 39 0 49 0 54 0 68 0 69 0 82] 
#[1 3 254 0 1 3 254 0 2 3 254 0 3 3 254 0 4 3 254 0 5 3 254 0 8 3 254 0 9 3 254 0 13 3 254 0 16 3 254 0 17 3 254 0 19 3 254 0 21 8 209 0 27 3 254 0 38 3 254 0 39 3 254 0 49 3 254 0 54 3 254 0 68 3 254 0 69 3 254 0 82] 
#[1 4 2 0 1 4 2 0 2 4 2 0 3 4 2 0 4 4 2 0 5 4 2 0 8 4 2 0 9 4 2 0 12 4 2 0 13 4 2 0 15 4 2 0 16 4 2 0 17 4 2 0 18 4 2 0 19 4 2 0 21 4 2 0 32 1 47 0 39 4 2 0 49 4 2 0 54 4 2 0 68 4 2 0 71 4 2 0 72 4 2 0 80 4 2 0 82 4 2 0 86 8 213 0 169 8 217 0 245] 
#[0 4 10 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 1 51 0 39 4 14 0 75 8 221 0 77 8 225 1 12 8 229 1 13 8 233 1 15 8 237 1 17] 
#[0 8 241 0 39] 
#[0 8 245 0 39] 
#[0 4 22 0 1 0 2 0 3 0 4 0 5 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 64 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 4 33 0 12 4 37 0 25 4 41 0 52 2 201 0 86 2 25 0 144 4 45 0 145 4 49 0 146 8 249 0 154 5 65 0 155 4 57 1 88 4 61 1 89 4 65 1 90 4 69 1 91 4 73 1 92 4 77 1 93 4 81 1 94] 
#[1 5 33 0 36 1 102 0 38 8 253 0 243 5 41 1 104] 
#[1 9 1 0 38 9 5 0 249] 
#[1 5 33 0 36 1 102 0 38 9 9 0 243 5 41 1 104] 
#[0 4 26 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 4 30 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 4 34 0 1 4 34 0 2 4 34 0 3 4 34 0 4 4 34 0 5 4 34 0 8 4 34 0 9 4 34 0 11 4 34 0 12 4 34 0 13 4 34 0 15 4 34 0 16 4 34 0 17 4 34 0 18 4 34 0 19 4 34 0 20 4 34 0 21 4 34 0 23 4 34 0 25 4 34 0 26 4 34 0 28 4 34 0 30 4 34 0 31 4 34 0 32 4 34 0 34 4 34 0 35 4 34 0 37 4 34 0 38 4 34 0 39 4 34 0 40 1 55 0 41 4 34 0 42 4 34 0 44 4 34 0 45 4 34 0 47 4 34 0 49 4 34 0 50 4 34 0 51 4 34 0 52 4 34 0 54 4 34 0 59 4 34 0 61 4 34 0 65 4 34 0 68 4 34 0 71 4 34 0 72 4 34 0 80 4 34 0 82 4 34 0 86 4 34 0 87 4 34 0 88 4 34 0 89 4 34 0 90 4 34 1 107] 
#[0 4 38 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 4 42 0 1 4 42 0 2 4 42 0 3 4 42 0 4 4 42 0 5 4 42 0 8 4 42 0 9 4 42 0 11 4 42 0 12 4 42 0 13 4 42 0 15 4 42 0 16 4 42 0 17 4 42 0 18 4 42 0 19 4 42 0 20 4 42 0 21 4 42 0 23 4 42 0 25 4 42 0 26 6 69 0 27 4 42 0 28 4 42 0 30 4 42 0 31 4 42 0 32 4 42 0 34 4 42 0 35 4 42 0 37 4 42 0 38 4 42 0 39 4 42 0 40 4 42 0 41 4 42 0 42 4 42 0 44 4 42 0 45 4 42 0 47 4 42 0 49 4 42 0 50 4 42 0 51 4 42 0 52 4 42 0 54 4 42 0 59 4 42 0 61 4 42 0 65 4 42 0 68 4 42 0 71 4 42 0 72 4 42 0 80 4 42 0 82 4 42 0 86 4 42 0 87 4 42 0 88 4 42 0 89 4 42 0 90 4 42 1 107] 
#[1 2 201 0 86 2 25 0 144 9 17 0 145] 
#[1 0 6 0 1 0 6 0 2 0 6 0 3 0 6 0 4 0 6 0 5 0 6 0 8 0 6 0 9 0 6 0 12 0 6 0 13 0 6 0 15 0 6 0 16 0 6 0 17 0 6 0 18 0 6 0 19 0 17 0 21 0 6 0 32 4 46 0 39 0 6 0 42 0 73 0 49 0 6 0 54 0 6 0 68 0 101 0 71 0 6 0 72 0 105 0 80 0 6 0 82 0 6 0 86 9 21 0 100 0 189 0 114 0 225 0 156 0 229 0 157 0 233 0 158 0 237 0 159 0 241 0 160 0 245 0 161 0 249 0 162 0 253 0 163 1 1 0 164 1 5 0 165 1 9 0 166 1 13 0 167 1 17 0 168 9 25 0 173 1 33 0 200 1 37 0 203 9 29 0 226 9 33 0 227 9 37 0 228 9 41 0 229 1 41 1 2 1 45 1 3 1 49 1 9 1 53 1 10 1 57 1 11 1 61 1 37 1 65 1 40 1 169 1 110] 
#[1 1 225 0 38 9 45 0 113 9 49 0 207] 
#[1 1 66 0 1 1 66 0 2 1 66 0 3 1 66 0 4 1 66 0 5 1 66 0 8 1 66 0 9 1 66 0 13 1 66 0 16 1 66 0 17 1 66 0 19 1 66 0 21 2 105 0 25 1 66 0 38 1 66 0 39 1 66 0 49 1 66 0 54 4 185 0 64 1 66 0 68 1 66 0 82 9 53 0 209 4 193 0 210 9 57 0 211] 
#[1 2 201 0 86 9 61 0 143 5 213 0 144] 
#[1 2 201 0 86 2 25 0 144 9 65 0 145 9 69 0 147 9 73 0 149 9 77 0 150 9 81 0 151] 
#[0 9 85 0 7] 
#[0 4 50 0 7] 
#[1 4 33 0 12 2 201 0 86 2 25 0 144 9 89 0 145 9 93 0 146] 
#[0 4 54 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 4 58 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 4 62 0 38 6 137 0 41 6 141 0 43 6 145 0 63 6 149 0 64] 
#[1 0 134 0 1 0 134 0 2 0 134 0 3 0 115 0 4 0 134 0 5 0 134 0 8 0 134 0 9 3 29 0 12 0 119 0 13 3 33 0 15 0 119 0 16 0 134 0 17 3 37 0 18 0 134 0 19 0 119 0 32 3 41 0 54 0 142 0 68 9 97 0 70 3 45 0 72 9 101 0 73 3 49 0 82 3 53 0 86 3 57 0 170 3 61 0 178 3 65 0 223 3 69 0 224 3 73 0 225 3 77 1 7] 
#[1 4 66 0 39 0 73 0 49 0 6 0 73 9 105 0 173 9 109 0 190 9 113 0 191 1 61 1 37 1 65 1 40] 
#[1 0 73 0 49 0 6 0 70 9 117 0 173 9 121 0 189 1 61 1 37 1 65 1 40] 
#[1 4 70 0 39 0 73 0 49 0 6 0 73 9 125 0 173 9 129 0 195 9 133 0 196 1 61 1 37 1 65 1 40] 
#[1 0 73 0 49 0 6 0 70 9 137 0 173 9 141 0 194 1 61 1 37 1 65 1 40] 
#[0 4 74 0 25 0 38 0 41 0 44 0 45 0 47 0 50 0 51 0 52 0 59 0 61 0 65 0 86 0 87 0 88 0 89 0 90] 
#[1 4 78 0 1 4 78 0 2 4 78 0 3 4 78 0 4 4 78 0 5 4 78 0 8 4 78 0 9 4 78 0 11 4 78 0 12 4 78 0 13 4 78 0 15 4 78 0 16 4 78 0 17 4 78 0 18 4 78 0 19 4 78 0 20 4 78 0 21 4 78 0 22 4 78 0 23 4 78 0 24 4 78 0 25 4 78 0 26 4 78 0 27 4 78 0 28 4 78 0 30 4 78 0 31 4 78 0 32 4 78 0 33 4 78 0 34 4 78 0 35 4 78 0 36 4 78 0 37 4 78 0 38 4 78 0 39 4 78 0 40 1 59 0 41 4 78 0 42 1 63 0 43 4 78 0 44 4 78 0 45 4 78 0 46 4 78 0 47 4 78 0 48 4 78 0 49 4 78 0 50 4 78 0 51 4 78 0 52 4 78 0 53 4 78 0 54 4 78 0 55 4 78 0 59 4 78 0 61 6 145 0 63 6 149 0 64 4 78 0 65 4 78 0 68 4 78 0 69 4 78 0 71 4 78 0 72 4 78 0 80 4 78 0 82 4 78 0 86 4 78 0 87 4 78 0 88 4 78 0 89 4 78 0 90 4 78 1 107] 
#[0 4 82 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 4 86 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 4 90 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 4 94 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 4 98 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 9 145 0 38 9 149 0 188] 
#[0 4 102 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 4 106 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 9 153 0 31] 
#[0 4 110 0 24 0 27] 
#[0 4 114 0 7 0 27] 
#[0 9 157 0 7] 
#[0 4 118 0 7 0 27] 
#[1 4 122 0 7 9 161 0 27] 
#[1 4 33 0 12 4 37 0 25 4 41 0 52 2 201 0 86 2 25 0 144 4 45 0 145 4 49 0 146 9 165 0 155 4 57 1 88 4 61 1 89 4 65 1 90 4 69 1 91 4 73 1 92 4 77 1 93 4 81 1 94] 
#[0 4 126 0 36] 
#[1 4 109 0 36 9 169 0 185] 
#[0 4 130 0 1 0 2 0 3 0 4 0 5 0 7 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 64 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 0 6 0 12 0 6 0 25 0 73 0 49 0 6 0 52 1 3 0 74 0 183 0 86 6 109 0 173 6 113 0 215 1 61 1 37 1 65 1 40 9 173 1 98] 
#[0 4 134 0 24] 
#[1 4 33 0 12 4 37 0 25 4 41 0 52 2 201 0 86 2 25 0 144 4 45 0 145 4 49 0 146 9 177 0 155 4 57 1 88 4 61 1 89 4 65 1 90 4 69 1 91 4 73 1 92 4 77 1 93 4 81 1 94] 
#[0 4 138 0 1 0 2 0 3 0 4 0 5 0 7 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 64 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 4 142 0 1 0 2 0 3 0 4 0 5 0 7 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 64 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 4 146 0 1 0 2 0 3 0 4 0 5 0 7 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 64 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 4 150 0 1 4 150 0 2 4 150 0 3 4 150 0 4 4 150 0 5 4 150 0 7 4 150 0 8 4 150 0 9 4 150 0 11 4 150 0 12 4 150 0 13 4 150 0 15 4 150 0 16 4 150 0 17 4 150 0 18 4 150 0 19 4 150 0 20 4 150 0 21 4 150 0 22 4 150 0 23 4 150 0 24 4 150 0 25 4 150 0 26 4 150 0 27 4 150 0 28 4 150 0 30 4 150 0 31 4 150 0 32 4 150 0 33 4 150 0 34 4 150 0 35 4 150 0 36 4 150 0 37 4 150 0 38 4 150 0 39 4 150 0 40 1 67 0 41 4 150 0 42 1 71 0 43 4 150 0 44 4 150 0 45 4 150 0 46 4 150 0 47 4 150 0 48 4 150 0 49 4 150 0 50 4 150 0 51 4 150 0 52 4 150 0 53 4 150 0 54 4 150 0 55 4 150 0 59 4 150 0 61 1 75 0 63 1 79 0 64 4 150 0 65 4 150 0 68 4 150 0 69 4 150 0 71 4 150 0 72 4 150 0 80 4 150 0 82 4 150 0 86 4 150 0 87 4 150 0 88 4 150 0 89 4 150 0 90 4 150 1 107] 
#[1 0 25 0 25 0 15 0 38 0 57 0 41 0 61 0 44 0 65 0 45 0 69 0 47 0 77 0 50 0 81 0 51 0 85 0 52 0 89 0 59 0 93 0 61 0 97 0 65 1 173 0 86 0 113 0 87 0 117 0 88 0 121 0 89 0 125 0 90 0 129 0 93 0 133 0 94 0 137 0 96 1 177 0 98 9 181 0 112 1 69 1 43 1 73 1 45 1 77 1 46 1 81 1 52 1 85 1 53 1 89 1 54 1 93 1 55 1 97 1 56 1 101 1 57 1 105 1 58 1 109 1 59 1 113 1 60 1 117 1 61 1 121 1 68 1 125 1 69 1 129 1 70 1 133 1 78 1 137 1 79 1 141 1 80 1 145 1 81 1 149 1 82 1 153 1 83 1 157 1 84 1 161 1 85] 
#[0 4 154 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 4 158 0 1 0 2 0 3 0 4 0 5 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 64 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 4 162 0 1 4 162 0 2 4 162 0 3 4 162 0 4 4 162 0 5 4 162 0 8 4 162 0 9 4 162 0 11 4 162 0 12 4 162 0 13 4 162 0 15 4 162 0 16 4 162 0 17 4 162 0 18 4 162 0 19 4 162 0 20 4 162 0 21 4 162 0 22 4 162 0 23 4 162 0 24 4 162 0 25 4 162 0 26 4 162 0 27 4 162 0 28 4 162 0 30 4 162 0 31 4 162 0 32 4 162 0 33 4 162 0 34 4 162 0 35 4 162 0 36 4 162 0 37 4 162 0 38 4 162 0 39 4 162 0 40 1 83 0 41 4 162 0 42 6 141 0 43 4 162 0 44 4 162 0 45 4 162 0 47 4 162 0 48 4 162 0 49 4 162 0 50 4 162 0 51 4 162 0 52 4 162 0 54 4 162 0 55 4 162 0 59 4 162 0 61 6 145 0 63 6 149 0 64 4 162 0 65 4 162 0 68 4 162 0 69 4 162 0 71 4 162 0 72 4 162 0 80 4 162 0 82 4 162 0 86 4 162 0 87 4 162 0 88 4 162 0 89 4 162 0 90 4 162 1 107] 
#[1 1 233 0 13 0 230 0 24 3 201 0 25 1 241 0 32 0 49 0 38 0 87 0 41 0 61 0 44 0 65 0 45 0 69 0 47 0 77 0 50 0 81 0 51 0 85 0 52 1 245 0 53 0 89 0 59 0 93 0 61 1 249 0 65 1 253 0 86 0 113 0 87 0 117 0 88 0 121 0 89 0 125 0 90 0 129 0 93 0 133 0 94 0 137 0 96 3 209 0 98 4 13 0 117 2 25 0 144 2 29 0 145 2 37 1 20 2 41 1 22 2 45 1 23 2 49 1 24 2 53 1 25 2 57 1 26 2 61 1 27 4 17 1 28 4 21 1 29 4 25 1 30 2 65 1 31 2 69 1 33 2 73 1 34 1 69 1 43 1 73 1 45 1 77 1 46 1 81 1 52 1 85 1 53 1 89 1 54 1 93 1 55 1 97 1 56 1 101 1 57 1 105 1 58 1 109 1 59 1 113 1 60 1 117 1 61 1 121 1 68 1 125 1 69 1 129 1 70 1 133 1 78 1 137 1 79 1 141 1 80 1 145 1 81 1 149 1 82 1 153 1 83 1 157 1 84 1 161 1 85] 
#[0 4 166 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 4 170 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 4 174 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 4 174 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 4 178 0 24 0 27 0 55] 
#[0 4 182 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 13 0 16 0 17 0 19 0 21 0 22 0 25 0 38 0 39 0 49 0 54 0 64 0 68 0 82] 
#[0 4 186 0 65 0 86] 
#[1 9 185 0 65 9 189 0 86 9 193 0 218] 
#[1 9 185 0 65 9 189 0 86 9 197 0 218] 
#[0 4 190 0 22 0 25 0 86] 
#[1 4 194 0 1 4 194 0 2 4 194 0 3 4 194 0 4 4 194 0 5 4 194 0 8 4 194 0 9 4 194 0 13 4 194 0 16 4 194 0 17 4 194 0 19 4 194 0 21 4 194 0 22 4 194 0 38 4 194 0 39 6 137 0 41 6 141 0 43 4 194 0 49 4 194 0 54 6 145 0 63 6 149 0 64 4 194 0 68 4 194 0 82] 
#[0 4 198 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 32 0 34 0 37 0 38 0 40 0 41 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90] 
#[0 4 202 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 32 0 34 0 37 0 38 0 40 0 41 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90] 
#[0 4 206 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 37 0 38 0 40 0 41 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90] 
#[1 4 210 0 27 9 201 0 33 4 210 0 36 4 97 0 48 9 205 0 130 9 209 0 132] 
#[1 9 213 0 27 9 217 0 36] 
#[0 4 214 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 4 218 0 35 0 39 0 42] 
#[0 4 222 0 35 0 39 0 42] 
#[1 0 6 0 1 0 6 0 2 0 6 0 3 0 6 0 4 0 6 0 5 0 6 0 8 0 6 0 9 0 9 0 11 0 6 0 12 0 6 0 13 0 6 0 15 0 6 0 16 0 6 0 17 0 6 0 18 0 6 0 19 0 13 0 20 0 17 0 21 0 21 0 23 0 25 0 25 0 29 0 26 0 33 0 28 0 37 0 30 0 6 0 32 0 41 0 34 4 226 0 35 0 45 0 37 0 49 0 38 4 226 0 39 0 53 0 40 0 57 0 41 4 226 0 42 0 61 0 44 0 65 0 45 0 69 0 47 0 73 0 49 0 77 0 50 0 81 0 51 0 85 0 52 0 6 0 54 0 89 0 59 0 93 0 61 0 97 0 65 0 6 0 68 0 101 0 71 0 6 0 72 0 105 0 80 0 6 0 82 0 7 0 86 0 113 0 87 0 117 0 88 0 121 0 89 0 125 0 90 0 129 0 93 0 133 0 94 0 137 0 96 0 141 0 98 0 145 0 100 0 149 0 101 0 153 0 102 0 157 0 103 0 161 0 104 3 9 0 105 0 173 0 107 0 177 0 108 0 181 0 109 0 185 0 110 0 189 0 114 0 193 0 119 0 197 0 120 0 201 0 133 0 205 0 134 0 209 0 135 0 213 0 136 0 217 0 137 0 221 0 138 0 225 0 156 0 229 0 157 0 233 0 158 0 237 0 159 0 241 0 160 0 245 0 161 0 249 0 162 0 253 0 163 1 1 0 164 1 5 0 165 1 9 0 166 1 13 0 167 1 17 0 168 1 25 0 173 1 33 0 200 1 37 0 203 1 41 1 2 1 45 1 3 1 49 1 9 1 53 1 10 1 57 1 11 1 61 1 37 1 65 1 40 1 69 1 43 1 73 1 45 1 77 1 46 1 81 1 52 1 85 1 53 1 89 1 54 1 93 1 55 1 97 1 56 1 101 1 57 1 105 1 58 1 109 1 59 1 113 1 60 1 117 1 61 1 121 1 68 1 125 1 69 1 129 1 70 1 133 1 78 1 137 1 79 1 141 1 80 1 145 1 81 1 149 1 82 1 153 1 83 1 157 1 84 1 161 1 85 1 169 1 110] 
#[0 4 230 0 35 0 39 0 42] 
#[1 0 6 0 1 0 6 0 2 0 6 0 3 0 6 0 4 0 6 0 5 0 6 0 8 0 6 0 9 0 9 0 11 0 6 0 12 0 6 0 13 0 6 0 15 0 6 0 16 0 6 0 17 0 6 0 18 0 6 0 19 0 13 0 20 0 17 0 21 0 21 0 23 0 25 0 25 0 29 0 26 0 33 0 28 0 37 0 30 0 6 0 32 0 41 0 34 4 234 0 35 0 45 0 37 0 49 0 38 4 234 0 39 0 53 0 40 0 57 0 41 4 234 0 42 0 61 0 44 0 65 0 45 0 69 0 47 0 73 0 49 0 77 0 50 0 81 0 51 0 85 0 52 0 6 0 54 0 89 0 59 0 93 0 61 0 97 0 65 0 6 0 68 0 101 0 71 0 6 0 72 0 105 0 80 0 6 0 82 0 7 0 86 0 113 0 87 0 117 0 88 0 121 0 89 0 125 0 90 0 129 0 93 0 133 0 94 0 137 0 96 0 141 0 98 0 145 0 100 0 149 0 101 0 153 0 102 0 157 0 103 0 161 0 104 3 9 0 105 0 173 0 107 0 177 0 108 0 181 0 109 0 185 0 110 0 189 0 114 0 193 0 119 0 197 0 120 0 201 0 133 0 205 0 134 0 209 0 135 0 213 0 136 0 217 0 137 0 221 0 138 0 225 0 156 0 229 0 157 0 233 0 158 0 237 0 159 0 241 0 160 0 245 0 161 0 249 0 162 0 253 0 163 1 1 0 164 1 5 0 165 1 9 0 166 1 13 0 167 1 17 0 168 1 25 0 173 1 33 0 200 1 37 0 203 1 41 1 2 1 45 1 3 1 49 1 9 1 53 1 10 1 57 1 11 1 61 1 37 1 65 1 40 1 69 1 43 1 73 1 45 1 77 1 46 1 81 1 52 1 85 1 53 1 89 1 54 1 93 1 55 1 97 1 56 1 101 1 57 1 105 1 58 1 109 1 59 1 113 1 60 1 117 1 61 1 121 1 68 1 125 1 69 1 129 1 70 1 133 1 78 1 137 1 79 1 141 1 80 1 145 1 81 1 149 1 82 1 153 1 83 1 157 1 84 1 161 1 85 1 169 1 110] 
#[0 9 221 0 24] 
#[0 9 225 0 39] 
#[0 9 229 0 46] 
#[0 4 238 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 25 0 32 0 42 0 49 0 52 0 54 0 66 0 67 0 68 0 70 0 72 0 73 0 74 0 82 0 86] 
#[0 4 242 0 24 0 25 0 38 0 39 0 46 0 52 0 86 0 87 0 88 0 89 0 90] 
#[1 2 201 0 86 2 25 0 144 9 233 0 145] 
#[1 0 6 0 1 0 6 0 2 0 6 0 3 0 6 0 4 0 6 0 5 0 6 0 8 0 6 0 9 0 6 0 12 0 6 0 13 0 6 0 15 0 6 0 16 0 6 0 17 0 6 0 18 0 6 0 19 0 17 0 21 0 6 0 32 4 246 0 39 0 73 0 49 0 6 0 54 0 6 0 68 0 101 0 71 0 6 0 72 0 105 0 80 0 6 0 82 0 6 0 86 9 237 0 100 0 189 0 114 0 225 0 156 0 229 0 157 0 233 0 158 0 237 0 159 0 241 0 160 0 245 0 161 0 249 0 162 0 253 0 163 1 1 0 164 1 5 0 165 1 9 0 166 1 13 0 167 1 17 0 168 1 25 0 173 1 33 0 200 1 37 0 203 1 41 1 2 1 45 1 3 1 49 1 9 1 53 1 10 1 57 1 11 1 61 1 37 1 65 1 40 1 169 1 110] 
#[0 9 241 0 39] 
#[1 9 245 0 87 9 249 1 16] 
#[0 9 253 0 39] 
#[1 4 250 0 39 10 1 0 75 10 5 1 14 10 9 1 19] 
#[0 4 254 0 39] 
#[0 5 2 0 39 0 75] 
#[0 5 6 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 5 10 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 5 14 0 7 0 27] 
#[1 10 13 0 38 10 17 0 247] 
#[1 0 6 0 1 0 6 0 2 0 6 0 3 0 6 0 4 0 6 0 5 0 6 0 8 0 6 0 9 0 6 0 13 0 6 0 16 0 6 0 17 0 6 0 19 0 17 0 21 5 18 0 39 0 73 0 49 0 6 0 54 0 6 0 68 0 6 0 82 10 21 0 173 10 25 0 200 10 29 0 203 10 33 0 250 10 37 0 251 10 41 0 252 10 45 0 253 10 49 0 254 10 53 0 255 10 57 1 0 10 61 1 1 10 65 1 2 10 69 1 3 1 61 1 37 1 65 1 40 10 73 1 110] 
#[0 5 22 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 10 77 0 38 10 81 0 244] 
#[1 7 141 0 86 7 145 0 90 10 85 0 177] 
#[0 10 89 0 38] 
#[0 5 26 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 21 0 32 0 39 0 42 0 49 0 54 0 68 0 71 0 72 0 80 0 82 0 86] 
#[1 0 134 0 1 0 134 0 2 0 134 0 3 0 115 0 4 0 134 0 5 0 134 0 8 0 134 0 9 3 29 0 12 0 119 0 13 3 33 0 15 0 119 0 16 0 134 0 17 3 37 0 18 0 134 0 19 0 119 0 32 10 93 0 42 3 41 0 54 0 142 0 68 3 45 0 72 3 49 0 82 3 53 0 86 3 57 0 170 3 61 0 178 3 65 0 223 3 69 0 224 3 73 0 225 3 77 1 7] 
#[0 10 97 0 39] 
#[0 5 30 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 21 0 32 0 39 0 42 0 49 0 54 0 68 0 71 0 72 0 80 0 82 0 86] 
#[1 0 6 0 1 0 6 0 2 0 6 0 3 0 6 0 4 0 6 0 5 0 6 0 8 0 6 0 9 0 6 0 12 0 6 0 13 0 6 0 15 0 6 0 16 0 6 0 17 0 6 0 18 0 6 0 19 0 17 0 21 0 6 0 32 5 34 0 39 0 6 0 42 0 73 0 49 0 6 0 54 0 6 0 68 0 101 0 71 0 6 0 72 0 105 0 80 0 6 0 82 0 6 0 86 9 21 0 100 0 189 0 114 0 225 0 156 0 229 0 157 0 233 0 158 0 237 0 159 0 241 0 160 0 245 0 161 0 249 0 162 0 253 0 163 1 1 0 164 1 5 0 165 1 9 0 166 1 13 0 167 1 17 0 168 9 25 0 173 1 33 0 200 1 37 0 203 10 101 0 227 9 41 0 229 1 41 1 2 1 45 1 3 1 49 1 9 1 53 1 10 1 57 1 11 1 61 1 37 1 65 1 40 1 169 1 110] 
#[0 5 38 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 21 0 32 0 39 0 42 0 49 0 54 0 68 0 71 0 72 0 80 0 82 0 86] 
#[0 5 42 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 5 46 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 5 50 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 13 0 16 0 17 0 19 0 21 0 38 0 39 0 49 0 54 0 68 0 82] 
#[0 5 54 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 13 0 16 0 17 0 19 0 21 0 25 0 38 0 39 0 49 0 54 0 64 0 68 0 82] 
#[0 5 58 0 7 0 27 0 33] 
#[1 10 105 0 10 10 109 0 36] 
#[1 5 62 0 7 10 113 0 27] 
#[0 5 66 0 7 0 27] 
#[0 5 70 0 7 0 27] 
#[0 5 74 0 7 0 27] 
#[0 5 78 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 13 0 16 0 17 0 19 0 21 0 25 0 36 0 38 0 39 0 49 0 54 0 64 0 68 0 82] 
#[0 5 82 0 7 0 27 0 33] 
#[0 5 82 0 7 0 27 0 33] 
#[1 1 225 0 38 5 86 0 39 5 86 0 49 5 86 0 73 10 117 0 113] 
#[1 10 121 0 25 5 90 0 38 5 94 0 49 5 94 0 70 10 125 0 192 10 129 0 193] 
#[0 10 133 0 73] 
#[0 10 137 0 39] 
#[0 5 98 0 39] 
#[0 10 141 0 70] 
#[0 10 145 0 39] 
#[0 10 149 0 73] 
#[0 10 153 0 39] 
#[0 5 102 0 39] 
#[0 10 157 0 70] 
#[0 10 161 0 39] 
#[1 0 73 0 49 0 6 0 66 0 6 0 67 10 165 0 173 10 169 0 197 10 173 0 199 1 61 1 37 1 65 1 40] 
#[0 5 106 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 0 14 0 24 0 25 0 25 0 49 0 38 0 57 0 41 0 61 0 44 0 65 0 45 0 69 0 47 0 77 0 50 0 81 0 51 0 85 0 52 0 89 0 59 0 93 0 61 0 97 0 65 1 173 0 86 0 113 0 87 0 117 0 88 0 121 0 89 0 125 0 90 0 129 0 93 0 133 0 94 0 137 0 96 1 177 0 98 10 177 0 112 1 69 1 43 1 73 1 45 1 77 1 46 1 81 1 52 1 85 1 53 1 89 1 54 1 93 1 55 1 97 1 56 1 101 1 57 1 105 1 58 1 109 1 59 1 113 1 60 1 117 1 61 1 121 1 68 1 125 1 69 1 129 1 70 1 133 1 78 1 137 1 79 1 141 1 80 1 145 1 81 1 149 1 82 1 153 1 83 1 157 1 84 1 161 1 85] 
#[0 5 110 0 1 0 2 0 3 0 4 0 5 0 7 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 64 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 2 201 0 86 2 25 0 144 8 21 0 145 10 181 1 101] 
#[1 5 114 0 24 5 114 0 27 6 137 0 41 6 141 0 43 5 114 0 55 6 145 0 63 6 149 0 64] 
#[0 5 118 0 24 0 27 0 55] 
#[0 5 122 0 24 0 27 0 55] 
#[1 6 137 0 41 6 141 0 43 10 185 0 46 6 145 0 63 6 149 0 64] 
#[1 1 225 0 38 10 189 0 113] 
#[0 5 126 0 36 0 65 0 86] 
#[0 5 130 0 36 0 65 0 86] 
#[1 5 134 0 36 10 193 0 65 10 197 0 86 10 201 0 219 10 205 0 221] 
#[1 5 134 0 36 10 193 0 65 10 197 0 86 10 209 0 219 10 205 0 221] 
#[1 0 25 0 25 0 49 0 38 0 57 0 41 0 61 0 44 0 65 0 45 0 69 0 47 0 77 0 50 0 81 0 51 0 85 0 52 0 89 0 59 0 93 0 61 0 97 0 65 1 173 0 86 0 113 0 87 0 117 0 88 0 121 0 89 0 125 0 90 0 129 0 93 0 133 0 94 0 137 0 96 10 213 0 98 10 217 0 131 1 69 1 43 1 73 1 45 1 77 1 46 1 81 1 52 1 85 1 53 1 89 1 54 1 93 1 55 1 97 1 56 1 101 1 57 1 105 1 58 1 109 1 59 1 113 1 60 1 117 1 61 1 121 1 68 1 125 1 69 1 129 1 70 1 133 1 78 1 137 1 79 1 141 1 80 1 145 1 81 1 149 1 82 1 153 1 83 1 157 1 84 1 161 1 85] 
#[0 5 138 0 27 0 36] 
#[0 5 142 0 27 0 36] 
#[1 1 233 0 13 3 201 0 25 1 241 0 32 0 49 0 38 0 87 0 41 0 61 0 44 0 65 0 45 0 69 0 47 0 77 0 50 0 81 0 51 0 85 0 52 1 245 0 53 0 89 0 59 0 93 0 61 1 249 0 65 1 253 0 86 0 113 0 87 0 117 0 88 0 121 0 89 0 125 0 90 0 129 0 93 0 133 0 94 0 137 0 96 3 209 0 98 10 221 0 117 2 25 0 144 2 29 0 145 2 37 1 20 2 41 1 22 2 45 1 23 2 49 1 24 2 53 1 25 2 57 1 26 2 61 1 27 2 65 1 31 2 69 1 33 2 73 1 34 1 69 1 43 1 73 1 45 1 77 1 46 1 81 1 52 1 85 1 53 1 89 1 54 1 93 1 55 1 97 1 56 1 101 1 57 1 105 1 58 1 109 1 59 1 113 1 60 1 117 1 61 1 121 1 68 1 125 1 69 1 129 1 70 1 133 1 78 1 137 1 79 1 141 1 80 1 145 1 81 1 149 1 82 1 153 1 83 1 157 1 84 1 161 1 85] 
#[0 5 146 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 37 0 38 0 40 0 41 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90] 
#[0 5 150 0 24 0 25 0 38 0 39 0 46 0 52 0 86 0 87 0 88 0 89 0 90] 
#[0 5 154 0 24 0 25 0 38 0 39 0 46 0 52 0 86 0 87 0 88 0 89 0 90] 
#[0 5 158 0 24 0 25 0 38 0 39 0 46 0 52 0 86 0 87 0 88 0 89 0 90] 
#[0 5 162 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 13 0 16 0 17 0 19 0 21 0 27 0 38 0 39 0 49 0 54 0 68 0 69 0 82] 
#[0 5 166 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 21 0 32 0 39 0 49 0 54 0 68 0 71 0 72 0 80 0 82 0 86] 
#[0 5 170 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 5 174 0 39 0 75] 
#[0 5 178 0 39 0 75] 
#[0 5 182 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 10 225 0 62 10 229 0 76 10 233 0 79 10 237 1 18] 
#[0 5 186 0 39] 
#[0 5 190 0 39] 
#[1 4 2 0 1 4 2 0 2 4 2 0 3 4 2 0 4 4 2 0 5 4 2 0 8 4 2 0 9 4 2 0 12 4 2 0 13 4 2 0 15 4 2 0 16 4 2 0 17 4 2 0 18 4 2 0 19 4 2 0 21 4 2 0 32 1 47 0 39 4 2 0 49 4 2 0 54 4 2 0 68 4 2 0 71 4 2 0 72 4 2 0 80 4 2 0 82 4 2 0 86 8 213 0 169 10 241 0 245] 
#[0 5 194 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 0 134 0 1 0 134 0 2 0 134 0 3 0 134 0 4 0 134 0 5 0 134 0 8 0 134 0 9 0 119 0 13 0 119 0 16 0 134 0 17 0 134 0 19 3 41 0 54 0 142 0 68 3 49 0 82 3 57 0 170 10 245 0 178 3 77 1 7] 
#[1 1 102 0 1 1 102 0 2 1 102 0 3 1 102 0 4 1 102 0 5 1 102 0 8 1 102 0 9 1 102 0 13 1 102 0 16 1 102 0 17 1 102 0 19 1 102 0 21 5 33 0 36 1 102 0 39 1 102 0 49 1 102 0 54 1 102 0 68 1 102 0 69 1 102 0 82 10 249 0 243 5 41 1 104] 
#[1 3 89 0 86 3 93 0 90 10 253 0 204] 
#[0 11 1 0 39] 
#[0 5 198 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 13 0 16 0 17 0 19 0 21 0 39 0 49 0 54 0 68 0 82] 
#[0 5 198 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 13 0 16 0 17 0 19 0 21 0 39 0 49 0 54 0 68 0 82] 
#[0 5 198 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 13 0 16 0 17 0 19 0 21 0 39 0 49 0 54 0 68 0 82] 
#[0 5 198 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 13 0 16 0 17 0 19 0 21 0 39 0 49 0 54 0 68 0 82] 
#[0 5 198 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 13 0 16 0 17 0 19 0 21 0 39 0 49 0 54 0 68 0 82] 
#[0 5 202 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 13 0 16 0 17 0 19 0 21 0 39 0 49 0 54 0 68 0 82] 
#[1 0 6 0 1 0 6 0 2 0 6 0 3 0 6 0 4 0 6 0 5 0 6 0 8 0 6 0 9 0 6 0 13 0 6 0 16 0 6 0 17 0 6 0 19 0 17 0 21 5 206 0 39 0 73 0 49 0 6 0 54 0 6 0 68 0 6 0 82 10 21 0 173 10 25 0 200 10 29 0 203 10 37 0 251 10 41 0 252 10 45 0 253 10 49 0 254 10 53 0 255 11 5 1 0 10 65 1 2 10 69 1 3 1 61 1 37 1 65 1 40 10 73 1 110] 
#[1 3 101 0 6 0 150 0 25 3 105 0 142 11 9 0 205] 
#[1 3 113 0 64 11 13 1 4] 
#[1 11 17 0 86 11 21 0 184] 
#[1 4 2 0 1 4 2 0 2 4 2 0 3 4 2 0 4 4 2 0 5 4 2 0 8 4 2 0 9 4 2 0 12 4 2 0 13 4 2 0 15 4 2 0 16 4 2 0 17 4 2 0 18 4 2 0 19 4 2 0 21 4 2 0 32 1 47 0 39 4 2 0 49 4 2 0 54 4 2 0 68 4 2 0 71 4 2 0 72 4 2 0 80 4 2 0 82 4 2 0 86 8 213 0 169 11 25 0 245] 
#[0 5 210 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 5 214 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 0 6 0 1 0 6 0 2 0 6 0 3 0 6 0 4 0 6 0 5 0 6 0 8 0 6 0 9 0 6 0 12 0 6 0 13 0 6 0 15 0 6 0 16 0 6 0 17 0 6 0 18 0 6 0 19 0 17 0 21 0 6 0 32 5 218 0 39 0 6 0 42 0 73 0 49 0 6 0 54 0 6 0 68 0 101 0 71 0 6 0 72 0 105 0 80 0 6 0 82 0 6 0 86 11 29 0 100 0 189 0 114 0 225 0 156 0 229 0 157 0 233 0 158 0 237 0 159 0 241 0 160 0 245 0 161 0 249 0 162 0 253 0 163 1 1 0 164 1 5 0 165 1 9 0 166 1 13 0 167 1 17 0 168 11 33 0 173 1 33 0 200 1 37 0 203 11 37 0 234 11 41 0 235 11 45 0 236 11 49 0 237 1 41 1 2 1 45 1 3 1 49 1 9 1 53 1 10 1 57 1 11 1 61 1 37 1 65 1 40 1 169 1 110] 
#[1 6 177 0 86 11 53 0 230 11 57 0 231 11 61 0 232] 
#[0 5 222 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 5 226 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 21 0 32 0 39 0 42 0 49 0 54 0 68 0 71 0 72 0 80 0 82 0 86] 
#[1 2 201 0 86 2 25 0 144 11 65 0 145] 
#[1 4 33 0 12 2 201 0 86 2 25 0 144 11 69 0 145 11 73 0 146] 
#[1 2 201 0 86 2 25 0 144 9 65 0 145 11 77 0 149 9 77 0 150 9 81 0 151] 
#[0 5 230 0 39 0 49 0 73] 
#[0 11 81 0 86] 
#[1 1 225 0 38 11 85 0 113] 
#[0 5 234 0 38] 
#[1 10 121 0 25 5 90 0 38 10 125 0 192 10 129 0 193] 
#[0 5 238 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 1 225 0 38 10 117 0 113] 
#[0 5 242 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 5 94 0 39 0 49 0 70] 
#[0 5 246 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 5 86 0 39 0 49 0 73] 
#[0 5 250 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 11 89 0 66 11 93 0 67] 
#[1 5 254 0 39 0 73 0 49 0 6 0 66 11 97 0 173 11 101 0 198 11 105 0 199 1 61 1 37 1 65 1 40] 
#[1 0 73 0 49 0 6 0 67 11 109 0 173 11 113 0 197 1 61 1 37 1 65 1 40] 
#[0 11 117 0 24] 
#[0 6 2 0 7 0 27] 
#[0 6 6 0 1 0 2 0 3 0 4 0 5 0 7 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 59 0 61 0 63 0 64 0 65 0 68 0 69 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 6 10 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 6 14 0 36] 
#[0 6 18 0 36] 
#[1 4 109 0 36 11 121 0 185] 
#[0 6 22 0 36] 
#[1 4 109 0 36 11 125 0 185] 
#[0 6 26 0 27 0 36] 
#[0 6 30 0 27 0 36] 
#[1 4 210 0 27 9 201 0 33 4 210 0 36 4 97 0 48 11 129 0 130 9 209 0 132] 
#[0 6 34 0 39] 
#[0 6 38 0 39] 
#[0 6 42 0 39] 
#[0 6 46 0 39] 
#[0 11 133 0 39] 
#[1 5 177 0 13 5 181 0 16] 
#[1 6 50 0 1 6 50 0 2 6 50 0 3 6 50 0 4 6 50 0 5 6 50 0 8 6 50 0 9 6 50 0 13 6 50 0 16 6 50 0 17 6 50 0 19 6 50 0 21 6 50 0 39 6 50 0 49 6 50 0 54 6 50 0 68 3 81 0 69 6 50 0 82 11 137 0 201 11 141 1 5] 
#[1 0 150 0 1 0 150 0 2 0 150 0 3 0 150 0 4 0 150 0 5 3 101 0 6 0 150 0 8 0 150 0 9 0 150 0 13 0 150 0 16 0 150 0 17 0 150 0 19 0 150 0 21 0 150 0 25 0 150 0 39 0 150 0 49 0 150 0 54 0 150 0 64 0 150 0 68 0 150 0 82 3 105 0 142 11 145 0 205] 
#[0 6 54 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 6 58 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 13 0 16 0 17 0 19 0 21 0 39 0 49 0 54 0 68 0 82] 
#[1 2 105 0 25 11 149 0 211] 
#[1 11 153 0 38 11 157 0 187] 
#[0 1 234 0 36] 
#[1 4 109 0 36 11 161 0 185] 
#[0 11 165 0 39] 
#[0 6 62 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 21 0 32 0 39 0 42 0 49 0 54 0 68 0 71 0 72 0 80 0 82 0 86] 
#[1 0 134 0 1 0 134 0 2 0 134 0 3 0 115 0 4 0 134 0 5 0 134 0 8 0 134 0 9 3 29 0 12 0 119 0 13 3 33 0 15 0 119 0 16 0 134 0 17 3 37 0 18 0 134 0 19 0 119 0 32 11 169 0 42 3 41 0 54 0 142 0 68 3 45 0 72 3 49 0 82 3 53 0 86 3 57 0 170 3 61 0 178 3 65 0 223 3 69 0 224 3 73 0 225 3 77 1 7] 
#[0 11 173 0 39] 
#[0 6 66 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 21 0 32 0 39 0 42 0 49 0 54 0 68 0 71 0 72 0 80 0 82 0 86] 
#[1 0 6 0 1 0 6 0 2 0 6 0 3 0 6 0 4 0 6 0 5 0 6 0 8 0 6 0 9 0 6 0 12 0 6 0 13 0 6 0 15 0 6 0 16 0 6 0 17 0 6 0 18 0 6 0 19 0 17 0 21 0 6 0 32 6 70 0 39 0 6 0 42 0 73 0 49 0 6 0 54 0 6 0 68 0 101 0 71 0 6 0 72 0 105 0 80 0 6 0 82 0 6 0 86 11 29 0 100 0 189 0 114 0 225 0 156 0 229 0 157 0 233 0 158 0 237 0 159 0 241 0 160 0 245 0 161 0 249 0 162 0 253 0 163 1 1 0 164 1 5 0 165 1 9 0 166 1 13 0 167 1 17 0 168 11 33 0 173 1 33 0 200 1 37 0 203 11 177 0 235 11 49 0 237 1 41 1 2 1 45 1 3 1 49 1 9 1 53 1 10 1 57 1 11 1 61 1 37 1 65 1 40 1 169 1 110] 
#[0 6 74 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 21 0 32 0 39 0 42 0 49 0 54 0 68 0 71 0 72 0 80 0 82 0 86] 
#[1 6 78 0 1 6 78 0 2 6 78 0 3 6 78 0 4 6 78 0 5 6 78 0 8 6 78 0 9 6 78 0 12 6 78 0 13 6 78 0 15 6 78 0 16 6 78 0 17 6 78 0 18 6 78 0 19 6 78 0 21 11 181 0 27 6 78 0 32 6 78 0 39 6 78 0 42 6 78 0 49 6 78 0 54 6 78 0 68 6 78 0 71 6 78 0 72 6 78 0 80 6 78 0 82 6 78 0 86] 
#[0 6 82 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 21 0 27 0 32 0 39 0 42 0 49 0 54 0 68 0 71 0 72 0 80 0 82 0 86] 
#[1 6 86 0 1 6 86 0 2 6 86 0 3 6 86 0 4 6 86 0 5 6 86 0 8 6 86 0 9 6 86 0 12 6 86 0 13 6 86 0 15 6 86 0 16 6 86 0 17 6 86 0 18 6 86 0 19 6 86 0 21 4 37 0 25 6 86 0 27 6 86 0 32 6 86 0 39 6 86 0 42 6 86 0 49 6 86 0 54 6 86 0 68 6 86 0 71 6 86 0 72 6 86 0 80 6 86 0 82 6 86 0 86 11 185 0 233 11 189 1 91] 
#[0 6 90 0 7 0 27] 
#[0 6 94 0 7 0 27] 
#[0 6 94 0 7 0 27] 
#[0 6 98 0 7 0 27] 
#[0 11 193 0 24] 
#[0 6 102 0 39 0 49 0 70] 
#[1 10 121 0 25 5 90 0 38 11 197 0 192 10 129 0 193] 
#[1 10 121 0 25 5 90 0 38 11 201 0 192 10 129 0 193] 
#[0 11 89 0 66] 
#[0 11 205 0 39] 
#[0 6 106 0 39] 
#[0 11 93 0 67] 
#[0 11 209 0 39] 
#[1 1 225 0 38 11 213 0 113] 
#[1 6 110 0 24 6 110 0 27 6 110 0 55 11 217 0 69 11 221 0 220 11 225 0 222] 
#[1 6 110 0 24 6 110 0 27 6 110 0 55 11 217 0 69 11 229 0 220 11 225 0 222] 
#[0 6 114 0 27 0 36] 
#[0 6 118 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 6 122 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 13 0 16 0 17 0 19 0 21 0 39 0 49 0 54 0 68 0 82] 
#[0 6 126 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 13 0 16 0 17 0 19 0 21 0 39 0 49 0 54 0 68 0 82] 
#[1 3 22 0 1 3 22 0 2 3 22 0 3 3 22 0 4 3 22 0 5 3 22 0 8 3 22 0 9 3 22 0 13 3 22 0 16 3 22 0 17 3 22 0 19 3 22 0 21 3 22 0 25 3 22 0 39 3 22 0 49 3 22 0 54 3 22 0 64 3 22 0 68 3 22 0 82 11 233 0 206 7 173 0 208] 
#[0 6 130 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 13 0 16 0 17 0 19 0 21 0 39 0 49 0 54 0 68 0 82] 
#[1 0 73 0 49 0 6 0 70 0 6 0 73 11 237 0 173 7 221 0 194 7 225 0 196 1 61 1 37 1 65 1 40] 
#[0 6 134 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 13 0 16 0 17 0 19 0 21 0 39 0 49 0 54 0 68 0 82] 
#[1 11 153 0 38 11 241 0 187] 
#[0 6 138 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 6 177 0 86 11 245 0 232 11 249 0 238 11 253 0 239] 
#[0 6 142 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 6 146 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 21 0 32 0 39 0 42 0 49 0 54 0 68 0 71 0 72 0 80 0 82 0 86] 
#[1 6 177 0 86 12 1 0 231 11 61 0 232] 
#[0 6 150 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 21 0 27 0 32 0 39 0 42 0 49 0 54 0 68 0 71 0 72 0 80 0 82 0 86] 
#[0 6 154 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 21 0 27 0 32 0 39 0 42 0 49 0 54 0 68 0 71 0 72 0 80 0 82 0 86] 
#[0 6 158 0 38] 
#[1 1 225 0 38 12 5 0 113] 
#[1 1 225 0 38 12 9 0 113] 
#[0 6 162 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 6 166 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[0 6 170 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 11 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 23 0 25 0 26 0 28 0 30 0 31 0 32 0 34 0 35 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 47 0 49 0 50 0 51 0 52 0 54 0 59 0 61 0 65 0 68 0 71 0 72 0 80 0 82 0 86 0 87 0 88 0 89 0 90 1 107] 
#[1 0 25 0 25 0 49 0 38 0 57 0 41 0 61 0 44 0 65 0 45 0 69 0 47 0 77 0 50 0 81 0 51 0 85 0 52 0 89 0 59 0 93 0 61 0 97 0 65 1 173 0 86 0 113 0 87 0 117 0 88 0 121 0 89 0 125 0 90 0 129 0 93 0 133 0 94 0 137 0 96 12 13 0 98 1 69 1 43 1 73 1 45 1 77 1 46 1 81 1 52 1 85 1 53 1 89 1 54 1 93 1 55 1 97 1 56 1 101 1 57 1 105 1 58 1 109 1 59 1 113 1 60 1 117 1 61 1 121 1 68 1 125 1 69 1 129 1 70 1 133 1 78 1 137 1 79 1 141 1 80 1 145 1 81 1 149 1 82 1 153 1 83 1 157 1 84 1 161 1 85] 
#[0 6 174 0 24 0 27 0 55] 
#[0 6 178 0 24 0 27 0 55] 
#[0 6 182 0 24 0 27 0 55] 
#[0 6 186 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 13 0 16 0 17 0 19 0 21 0 39 0 49 0 54 0 68 0 82] 
#[1 10 157 0 70 10 149 0 73] 
#[0 6 190 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 13 0 16 0 17 0 19 0 21 0 39 0 49 0 54 0 68 0 82] 
#[1 6 194 0 1 6 194 0 2 6 194 0 3 6 194 0 4 6 194 0 5 6 194 0 8 6 194 0 9 6 194 0 12 6 194 0 13 6 194 0 15 6 194 0 16 6 194 0 17 6 194 0 18 6 194 0 19 6 194 0 21 6 194 0 27 6 194 0 32 6 194 0 39 6 194 0 42 6 194 0 49 6 194 0 54 6 194 0 68 12 17 0 69 6 194 0 71 6 194 0 72 6 194 0 80 6 194 0 82 6 194 0 86 12 21 0 240 12 25 0 241] 
#[1 6 198 0 1 6 198 0 2 6 198 0 3 6 198 0 4 6 198 0 5 6 198 0 8 6 198 0 9 6 198 0 12 6 198 0 13 6 198 0 15 6 198 0 16 6 198 0 17 6 198 0 18 6 198 0 19 6 198 0 21 12 29 0 27 6 198 0 32 6 198 0 39 6 198 0 42 6 198 0 49 6 198 0 54 6 198 0 68 6 198 0 71 6 198 0 72 6 198 0 80 6 198 0 82 6 198 0 86] 
#[0 6 202 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 21 0 27 0 32 0 39 0 42 0 49 0 54 0 68 0 71 0 72 0 80 0 82 0 86] 
#[0 6 206 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 21 0 27 0 32 0 39 0 42 0 49 0 54 0 68 0 71 0 72 0 80 0 82 0 86] 
#[0 6 210 0 39 0 49 0 67] 
#[0 6 214 0 39 0 49 0 66] 
#[0 6 218 0 24 0 27 0 55] 
#[1 0 113 0 87 0 117 0 88 0 121 0 89 12 33 0 93 0 133 0 94] 
#[0 6 222 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 21 0 27 0 32 0 39 0 42 0 49 0 54 0 68 0 71 0 72 0 80 0 82 0 86] 
#[0 6 226 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 21 0 27 0 32 0 39 0 42 0 49 0 54 0 68 0 71 0 72 0 80 0 82 0 86] 
#[1 6 177 0 86 11 245 0 232 12 37 0 239] 
#[0 6 230 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 21 0 27 0 32 0 39 0 42 0 49 0 54 0 68 0 71 0 72 0 80 0 82 0 86] 
#[0 6 234 0 1 0 2 0 3 0 4 0 5 0 8 0 9 0 12 0 13 0 15 0 16 0 17 0 18 0 19 0 21 0 27 0 32 0 39 0 42 0 49 0 54 0 68 0 71 0 72 0 80 0 82 0 86]
	).
]
