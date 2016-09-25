generated
definitionComment
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