generated
definitionComment
"%glr;
%id <Identifier> <gt> <gtgt>;

%start compilation_unit namespace_member_declaration statement expression block;

%ignore_variables commaToken _leftParen _rightParen semicolonToken;

%root Program;
%prefix CS;
%suffix Node;

%annotate_tokens;

%hierarchy Declaration (
	ClassDeclaration
	ConstantDeclaration
	ConstructorDeclaration
	DelegateDeclaration
	DestructorDeclaration
	EnumDeclaration
	EventDeclaration
	FieldDeclaration
	FixedSizeBufferDeclaration
	IndexerDeclaration
	InterfaceDeclaration
	InterfaceEventDeclaration
	InterfaceIndexerDeclaration
	InterfaceMethodDeclaration
	InterfacePropertyDeclaration
	LocalConstantDeclaration
	LocalVariableDeclaration
	MethodDeclaration
	NamespaceDeclaration
	OperatorDeclaration
	PropertyDeclaration
	StaticConstructorDeclaration
	StructDeclaration
);
%hierarchy Statement (
	BlockStatement
	BreakStatement
	CheckedStatement
	ContinueStatement
	DeclarationStatement
	DoStatement
	EmptyStatement
	ExpressionStatement
	FixedStatement
	ForeachStatement
	ForStatement
	GotoStatement
	IfStatement
	LabeledStatement
	LockStatement
	ReturnStatement
	SwitchStatement
	ThrowStatement
	TryStatement
	UncheckedStatement
	UnsafeStatement
	UsingStatement
	WhileStatement
	YieldStatement
);
%hierarchy Expression (
	AnonymousMethodExpression
	AnonymousObjectCreationExpression
	ArrayCreationExpression
	Assignment
	BaseAccess
	BinaryExpression
	CastExpression
	CheckedExpression
	ConditionalExpression
	DefaultValueExpression
	DelegateCreationExpression
	ElementAccess
	InvocationExpression
	LambdaExpression
	LiteralExpression
	MemberAccess
	ObjectCreationExpression
	PrefixExpression
	PointerElementAccess
	PointerMemberAccess
	PostExpression
	QueryExpression
	SimpleName
	SizeofExpression
	ThisAccess
	TypeofExpression
	UncheckedExpression
);
%hierarchy Type (
	ArrayType
	NullableType
	PointerType
	QualifiedAliasMember
	SimpleType
	TypeName
	VarType
	VoidType
);

<gt>
	: \>
	;
<gtgt>
	: <gt> <gt>
	;
<LineTerminator>
	: \r
	| \n
	| \r\n
#	| \x85
#	| \x2028
#	| \x2029
	;
<comment>
	: \/\/ [^\r\n]*
	| (\/\* [^\*]* \*+ ([^\/\*] [^\*]* \*+)* \/)
	;
<Identifier>
	: (<isLetter> | _) (<isLetter> | <isDigit> | _)*
	| \@ (<isLetter> | _) (<isLetter> | <isDigit> | _)*
	;
<IntegerSuffix>
	: [Uu]
	| [Ll]
	| [Uu][Ll]
	| [Ll][Uu]
	;
<IntegerLiteral>
	: \d+ <IntegerSuffix>?
	| 0[Xx] [0-9A-Fa-f]+ <IntegerSuffix>?
	;
<ExponentPart>
	: [Ee] [\+\-]? \d+
	;
<RealSuffix>
	: [Ff]
	| [Dd]
	| [Mm]
	;
<RealLiteral>
	: \d* \. \d+ <ExponentPart>? <RealSuffix>?
	| \d+ <ExponentPart>? <RealSuffix>?
	| \d+ <RealSuffix>
	;
<SimpleEscapeSequence>
	: \\\'
	| \\\""
	| \\\\
	| \\0
	| \\a
	| \\b
	| \\f
	| \\n
	| \\r
	| \\t
	| \\v
	;
<HexadecimalEscapeSequence>
	: \\x [0-9A-Fa-f]{1,4}
	;
<UnicodeCharacterEscapeSequence>
	: \\[Uu] ([0-9A-Fa-f]{4,4}){1,2}
	;
<Character>
	: [^\'\\\n]
	| <SimpleEscapeSequence>
	| <HexadecimalEscapeSequence>
	| <UnicodeCharacterEscapeSequence>
	;
<CharacterLiteral>
	: \' <Character> \'
	;
<SingleRegularStringLiteralCharacter>
	: [^\""\\\n]
	;
<RegularStringLiteralCharacter>
	: <SingleRegularStringLiteralCharacter>
	| <SimpleEscapeSequence>
	| <HexadecimalEscapeSequence>
	| <UnicodeCharacterEscapeSequence>
	;
<RegularStringLiteral>
	: \"" <RegularStringLiteralCharacter>* \""
	;
<VerbatimStringLiteralCharacter>
	: [^\""]
	| \""\""
	;
<VerbatimStringLiteral>
	: \@\"" <VerbatimStringLiteralCharacter>* \""
	;
<StringLiteral>
	: <RegularStringLiteral>
	| <VerbatimStringLiteral>
	;
<NullLiteral>
	: null
	;
<whitespace>
	: \s+
	| \# [^\r\n]*
	;


<patternToken>
	: (\`  [^\`]* \`)+
	;

# B.2

# B.2.6 Namespaces
compilation_unit
	: _extern_alias_directives _using_directives _global_attributes _namespace_member_declarations {{}}
	;
namespace_declaration
	: ""namespace"" qualified_identifier 'identifier' namespace_body _semicolon {{}}
	;
qualified_identifier
	: <Identifier> 'name' {{}}
	| qualified_identifier ""."" <Identifier> 'name' {{}}
	;
namespace_body
	: ""{"" _extern_alias_directives _using_directives _namespace_member_declarations ""}""
	;
_extern_alias_directives
	:
	| extern_alias_directives
	;
extern_alias_directives
	: extern_alias_directive 'directive'
	| extern_alias_directives extern_alias_directive 'directive'
	;
extern_alias_directive
	: ""extern"" ""alias"" <Identifier> "";"" {{}}
	;
_using_directives
	:
	| using_directives
	;
using_directives
	: using_directive 'directive'
	| using_directives using_directive 'directive'
	;
using_directive
	: using_alias_directive
	| using_namespace_directive
	;
using_alias_directive
	: ""using"" <Identifier> 'name' ""="" namespace_or_type_name 'namespace' "";"" {{}}
	;
using_namespace_directive
	: ""using"" namespace_name 'namespace' "";"" {{}}
	;
_namespace_member_declarations
	: 
	| namespace_member_declarations
	;
namespace_member_declarations
	: namespace_member_declaration 'declaration'
	| namespace_member_declarations namespace_member_declaration 'declaration'
	;
namespace_member_declaration
	: namespace_declaration
	| type_declaration
	;
type_declaration
	: class_declaration
	| struct_declaration
	| interface_declaration
	| enum_declaration
	| delegate_declaration
	;
qualified_alias_member
	: <Identifier> 'global' ""::"" <Identifier> 'name' _type_argument_list 'typeArguments' {{}}
	;

# B.2.1
namespace_name
	: namespace_or_type_name
	;
type_name
	: namespace_or_type_name
	;
namespace_or_type_name
	: <Identifier> 'name' _type_argument_list 'typeArguments' {{TypeName}}
	| namespace_or_type_name 'namespace' ""."" <Identifier> 'name' _type_argument_list 'typeArguments' {{TypeName}}
	| qualified_alias_member 
	;

# B.2.2
_type
	:
	| type 'type'
	;
type
	: value_type
	| reference_type
	| type_parameter
	;
value_type
	: struct_type
	| enum_type
	;
struct_type
	: type_name
	| simple_type
	| nullable_type
	;
simple_type
	: numeric_type 'token' {{}}
	| ""bool"" 'token' {{}}
	;
numeric_type
	: integral_type
	| floating_point_type
	| ""decimal""
	;
integral_type
	: ""sbyte""
	| ""byte""
	| ""short""
	| ""ushort""
	| ""int""
	| ""uint""
	| ""long""
	| ""ulong""
	| ""char""
	;
floating_point_type
	: ""float""
	| ""double""
	;
nullable_type
	: non_nullable_value_type 'type' ""?"" {{}}
	;
non_nullable_value_type
	: type
	;
enum_type
	: type_name
	;
reference_type
	: class_type
	| interface_type
	| array_type
	| delegate_type
	;
class_type
	: type_name
	| ""object"" 'token' {{SimpleType}}
	| ""string"" 'token' {{SimpleType}}
	;
interface_type
	: type_name
	;
array_type
	: non_array_type 'type' rank_specifiers {{}}
	;
non_array_type
	: type
	;
_rank_specifiers
	: 
	| rank_specifiers
	;
rank_specifiers
	: rank_specifier 'rankSpecifier'
	| rank_specifiers rank_specifier 'rankSpecifier'
	;
rank_specifier
	: ""["" _dim_separators ""]"" {{}}
	;
_dim_separators
	: 
	| dim_separators
	;
dim_separators
	: "",""
	| dim_separators "",""
	;
delegate_type
	: type_name
	;
type_argument_list
	: ""<"" type_arguments <gt> 'greaterThanToken' {{}}
	;
type_arguments
	: type_argument 'type'
	| type_arguments "","" type_argument 'type'
	;
type_argument
	: type
	;

# B.2.3 Variables
variable_reference
	: expression
	;

# B.2.4 Expressions
_argument_list
	:
	| argument_list
	;

# B.2.4
argument_list
	: argument 'argument'
	| argument_list "","" argument 'argument'
	;
argument
	: expression 'expression' {{}}
	| ""ref"" variable_reference 'expression' {{}}
	| ""out"" variable_reference 'expression' {{}}
	;
primary_expression
	: primary_no_array_creation_expression
	| array_creation_expression
	;
primary_no_array_creation_expression
	: literal 
	| simple_name 
	| parenthesized_expression 
	| member_access 
	| invocation_expression 
	| element_access 
	| this_access 
	| base_access 
	| post_increment_expression 
	| post_decrement_expression 
	| object_creation_expression 
	| delegate_creation_expression 
	| anonymous_object_creation_expression 
	| typeof_expression 
	| checked_expression 
	| unchecked_expression 
	| default_value_expression 
	| anonymous_method_expression 
	;
simple_name
	: <Identifier> _type_argument_list 'typeArguments' {{}}
	;
_type_argument_list
	: 
	| type_argument_list
	;
parenthesized_expression
	: ""("" '_leftParen' expression "")"" '_rightParen' {{Expression}}
	;
member_access
	: primary_expression 'expression' ""."" <Identifier> 'identifier' _type_argument_list 'typeArguments' {{}}
	| predefined_type 'expression' ""."" <Identifier> 'identifier' _type_argument_list 'typeArguments' {{}}
	| qualified_alias_member 'expression' ""."" <Identifier> 'identifier' {{}}
	;
predefined_type
	: ""bool"" 'token' {{SimpleType}}
	| ""byte"" 'token' {{SimpleType}}
	| ""char"" 'token' {{SimpleType}}
	| ""decimal"" 'token' {{SimpleType}}
	| ""double"" 'token' {{SimpleType}}
	| ""float"" 'token' {{SimpleType}}
	| ""int"" 'token' {{SimpleType}}
	| ""long"" 'token' {{SimpleType}}
	| ""object"" 'token' {{SimpleType}}
	| ""sbyte"" 'token' {{SimpleType}}
	| ""short"" 'token' {{SimpleType}}
	| ""string"" 'token' {{SimpleType}}
	| ""uint"" 'token' {{SimpleType}}
	| ""ulong"" 'token' {{SimpleType}}
	| ""ushort"" 'token' {{SimpleType}}
	;
invocation_expression
	: primary_expression 'expression' ""("" _argument_list "")"" {{}}
	;
element_access
	: primary_no_array_creation_expression 'baseExpression' ""["" expression_list ""]"" {{}}
	;
expression_list
	: expression 'expression'
	| expression_list	"","" expression 'expression'
	;
this_access
	: ""this"" {{}}
	;
base_access
	: ""base"" ""."" <Identifier> 'identifier' {{}}
	| ""base"" ""["" expression_list ""]"" {{}}
	;
post_increment_expression
	: primary_expression 'expression' ""++"" 'operator' {{PostExpression}}
	;
post_decrement_expression
	: primary_expression 'expression' ""--"" 'operator' {{PostExpression}}
	;
object_creation_expression
	: ""new"" type 'type' ""("" _argument_list "")"" _object_or_collection_initializer 'initializer' {{}}
	| ""new"" type 'type' object_or_collection_initializer 'initializer' {{}}
	;
_object_or_collection_initializer
	:
	| object_or_collection_initializer
	;
object_or_collection_initializer
	: object_initializer
	| collection_initializer
	;
object_initializer
	: ""{"" _member_initializer_list ""}"" {{}}
	| ""{"" member_initializer_list "","" ""}"" {{}}
	;
_member_initializer_list
	: 
	| member_initializer_list
	;
member_initializer_list
	: member_initializer 'initializer'
	| member_initializer_list "","" member_initializer 'initializer'
	;
member_initializer
	: <Identifier> 'identifier' ""="" initializer_value 'value' {{}}
	;
initializer_value
	: expression
	| object_or_collection_initializer
	;
collection_initializer
	: ""{"" element_initializer_list ""}"" {{}}
	| ""{"" element_initializer_list "","" ""}"" {{}}
	;
element_initializer_list
	: element_initializer 'initializer'
	| element_initializer_list "","" element_initializer 'initializer'
	;
element_initializer
	: non_assignment_expression 'expression' {{}}
	| ""{"" expression_list ""}"" {{}}
	;
array_creation_expression
	: ""new"" non_array_type 'type' ""["" expression_list ""]"" _rank_specifiers _array_initializer 'arrayInitializer' {{}}
	| ""new"" array_type 'type' array_initializer 'arrayInitializer' {{}}
	| ""new"" rank_specifier 'rankSpecifier' array_initializer 'arrayInitializer' {{}}
	;
delegate_creation_expression
	: ""new"" delegate_type 'type' ""("" expression 'expression' "")"" {{}}
	;
anonymous_object_creation_expression
	: ""new"" anonymous_object_initializer {{}}
	;
anonymous_object_initializer
	: ""{"" _member_declarator_list ""}""
	| ""{"" member_declarator_list "","" ""}""
	;
_member_declarator_list
	: 
	| member_declarator_list
	;
member_declarator_list
	: member_declarator 'declarator'
	| member_declarator_list "","" member_declarator 'declarator'
	;
member_declarator
	: simple_name 'name' {{}}
	| member_access 'access' {{}}
	| <Identifier> ""="" expression 'value' {{}}
	;
typeof_expression
	: ""typeof"" ""("" type 'type' "")"" {{}}
	| ""typeof"" ""("" unbound_type_name 'type' "")"" {{}}
	| ""typeof"" ""("" void_type 'type' "")"" {{}}
	;
unbound_type_name
	: <Identifier> _generic_dimension_specifier {{}}
	| <Identifier> ""::"" <Identifier> _generic_dimension_specifier {{}}
	| unbound_type_name ""."" <Identifier> _generic_dimension_specifier {{}}
	;
_generic_dimension_specifier
	: 
	| generic_dimension_specifier
	;
generic_dimension_specifier
	: ""<"" _commas <gt>
	;
_commas
	: 
	| commas
	;
commas
	: "","" 'comma'
	| commas "","" 'comma'
	;
checked_expression
	: ""checked"" ""("" expression 'expression' "")"" {{}}
	;
unchecked_expression
	: ""unchecked"" ""("" expression 'expression' "")"" {{}}
	;
default_value_expression
	: ""default"" ""("" type 'type' "")"" {{}}
	;
unary_expression
	: primary_expression
	| ""+"" 'operator' unary_expression 'expression' {{PrefixExpression}}
	| ""-"" 'operator' unary_expression 'expression' {{PrefixExpression}}
	| ""!"" 'operator' unary_expression 'expression' {{PrefixExpression}}
	| ""~"" 'operator' unary_expression 'expression' {{PrefixExpression}}
	| pre_increment_expression
	| pre_decrement_expression
	| cast_expression
	;
pre_increment_expression
	: ""++"" 'operator' unary_expression 'expression' {{PrefixExpression}}
	;
pre_decrement_expression
	: ""--"" 'operator' unary_expression 'expression' {{PrefixExpression}}
	;
cast_expression
	: ""("" type 'type' "")"" unary_expression 'expression' {{}}
	;
multiplicative_expression
	: unary_expression
	| multiplicative_expression 'left' ""*"" 'operator' unary_expression 'right' {{BinaryExpression}}
	| multiplicative_expression 'left' ""/"" 'operator' unary_expression 'right' {{BinaryExpression}}
	| multiplicative_expression 'left' ""%"" 'operator' unary_expression 'right' {{BinaryExpression}}
	;
additive_expression
	: multiplicative_expression
	| additive_expression 'left' ""+"" 'operator' multiplicative_expression 'right' {{BinaryExpression}}
	| additive_expression 'left' ""-"" 'operator' multiplicative_expression 'right' {{BinaryExpression}}
	;
shift_expression
	: additive_expression
	| shift_expression 'left' ""<<"" 'operator' additive_expression 'right' {{BinaryExpression}}
	| shift_expression 'left' <gtgt> 'operator' additive_expression 'right' {{BinaryExpression}}
	;
relational_expression
	: shift_expression
	| relational_expression 'left' ""<"" 'operator' shift_expression 'right' {{BinaryExpression}}
	| relational_expression 'left' <gt> 'operator' shift_expression 'right' {{BinaryExpression}}
	| relational_expression 'left' ""<="" 'operator' shift_expression 'right' {{BinaryExpression}}
	| relational_expression 'left' "">="" 'operator' shift_expression 'right' {{BinaryExpression}}
	| relational_expression 'left' ""is"" 'operator' type 'right' {{BinaryExpression}}
	| relational_expression 'left' ""as"" 'operator' type 'right' {{BinaryExpression}}
	;
equality_expression
	: relational_expression
	| equality_expression 'left' ""=="" 'operator' relational_expression 'right' {{BinaryExpression}}
	| equality_expression 'left' ""!="" 'operator' relational_expression 'right' {{BinaryExpression}}
	;
and_expression
	: equality_expression
	| and_expression 'left' ""&"" 'operator' equality_expression 'right' {{BinaryExpression}}
	;
exclusive_or_expression
	: and_expression
	| exclusive_or_expression 'left' ""^"" 'operator' and_expression 'right' {{BinaryExpression}}
	;
inclusive_or_expression
	: exclusive_or_expression
	| inclusive_or_expression 'left' ""|"" 'operator' exclusive_or_expression 'right' {{BinaryExpression}}
	;
conditional_and_expression
	: inclusive_or_expression
	| conditional_and_expression 'left' ""&&"" 'operator' inclusive_or_expression 'right' {{BinaryExpression}}
	;
conditional_or_expression
	: conditional_and_expression
	| conditional_or_expression 'left' ""||"" 'operator' conditional_and_expression 'right' {{BinaryExpression}}
	;
null_coalescing_expression
	: conditional_or_expression
	| conditional_or_expression 'left' ""??"" 'operator' null_coalescing_expression 'right' {{BinaryExpression}}
	;
conditional_expression
	: null_coalescing_expression
	| null_coalescing_expression 'booleanExpression' ""?"" expression 'trueExpression' "":"" expression 'falseExpression' {{}}
	;
lambda_expression
	: anonymous_function_signature 'signature' ""=>"" anonymous_function_body 'body' {{}}
	;
anonymous_method_expression
	: ""delegate"" _explicit_anonymous_function_signature 'signature' block 'block' {{}}
	;
anonymous_function_signature
	: explicit_anonymous_function_signature
	| implicit_anonymous_function_signature
	;
_explicit_anonymous_function_signature
	:
	| explicit_anonymous_function_signature
	;
explicit_anonymous_function_signature
	: ""("" _explicit_anonymous_function_paramenter_list "")"" {{}}
	;
_explicit_anonymous_function_paramenter_list
	: 
	| explicit_anonymous_function_paramenter_list
	;
explicit_anonymous_function_paramenter_list
	: explicit_anonymous_function_paramenter 'parameter'
	| explicit_anonymous_function_paramenter_list "","" explicit_anonymous_function_paramenter 'parameter'
	;
explicit_anonymous_function_paramenter
	: _anonymous_function_parameter_modifier type 'type' <Identifier> 'name' {{AnonymousFunctionParameter}}
	;
_anonymous_function_parameter_modifier
	: 
	| anonymous_function_parameter_modifier 'modifier'
	;
anonymous_function_parameter_modifier
	: ""ref""
	| ""out""
	;
implicit_anonymous_function_signature
	: ""("" _implicit_anonymous_function_parameter_list "")"" {{}}
	| implicit_anonymous_function_parameter 'name' {{}}
	;
_implicit_anonymous_function_parameter_list
	: 
	| implicit_anonymous_function_parameter_list
	;
implicit_anonymous_function_parameter_list
	: implicit_anonymous_function_parameter 'name'
	| implicit_anonymous_function_parameter_list "","" implicit_anonymous_function_parameter 'name'
	;
implicit_anonymous_function_parameter
	: <Identifier>
	;
anonymous_function_body
	: expression
	| block
	;
query_expression
	: from_clause query_body {{}}
	;
from_clause
	: ""from"" _type <Identifier> ""in"" expression 'expression'
	;
query_body
	: _query_body_clauses select_or_group_clause _query_continuation
	;
_query_body_clauses
	: 
	| query_body_clauses
	;
query_body_clauses
	: query_body_clause
	| query_body_clauses query_body_clause
	;
query_body_clause
	: from_clause
	| let_clause
	| where_clause
	| join_clause
	| join_into_clause
	| orderby_clause
	;
let_clause
	: ""let"" <Identifier> ""="" expression 'expression'
	;
where_clause
	: ""where"" boolean_expression 'expression'
	;
join_clause
	: ""join"" _type <Identifier> ""in"" expression 'joinInExpression'""on"" expression 'joinOnExpression' ""equals"" expression 'joinEqualsExpression'
	;
join_into_clause
	: ""join"" _type <Identifier> ""in"" expression 'joinInExpression' ""on"" expression 'joinOnExpression' ""equals"" expression 'joinEqualsExpression' ""into"" <Identifier>
	;
orderby_clause
	: ""orderby"" orderings
	;
orderings
	: ordering
	| orderings "","" ordering
	;
ordering
	: expression 'expression' _ordering_direction
	;
_ordering_direction
	: 
	| ordering_direction
	;
ordering_direction
	: ""ascending""
	| ""descending""
	;
select_or_group_clause
	: select_clause
	| group_clause
	;
select_clause
	: ""select"" expression 'expression'
	;
group_clause
	: ""group"" expression 'groupExpression' ""by"" expression 'groupByExpression'
	;
_query_continuation
	: 
	| query_continuation
	;
query_continuation
	: ""into"" <Identifier> query_body
	;
assignment
	: unary_expression 'lhs' assignment_operator 'operator' expression 'rhs' {{}}
	;
assignment_operator
	: ""=""
	| ""+=""
	| ""-=""
	| ""*=""
	| ""/=""
	| ""%=""
	| ""&=""
	| ""|=""
	| ""^=""
	| ""<<=""
	| "">>=""
	;
_expression
	:
	| expression 'expression'
	;
expression
	: non_assignment_expression 
	| assignment 
	;
non_assignment_expression
	: conditional_expression 
	| lambda_expression 
	| query_expression 
	;
constant_expression
	: expression
	;
boolean_expression
	: expression
	;

# B.2.5 Statements
statement
	: labeled_statement
	| declaration_statement
	| embedded_statement
	;
embedded_statement
	: block
	| empty_statement
	| expression_statement
	| selection_statement
	| iteration_statement
	| jump_statement
	| try_statement
	| checked_statement
	| unchecked_statement
	| lock_statement
	| using_statement
	| yield_statement
	;
block
	: ""{"" _statement_list ""}"" {{BlockStatement}}
	;
_statement_list
	: 
	| statement_list
	;
statement_list
	: statement 'statement'
	| statement_list statement 'statement'
	;
empty_statement
	: "";"" {{}}
	;
labeled_statement
	: <Identifier> "":"" statement 'statement' {{}}
	;
declaration_statement
	: local_variable_declaration 'declaration' "";"" {{}}
	| local_constant_declaration 'declaration' "";"" {{}}
	;
local_variable_declaration
	: local_variable_type 'type' local_variable_declarators {{}}
	;
local_variable_type
	: type
	| ""var"" {{VarType}}
	;
local_variable_declarators
	: local_variable_declarator 'declarator'
	| local_variable_declarators "","" local_variable_declarator 'declarator'
	;
local_variable_declarator
#	: <Identifier> 'name' {{}}
#	| <Identifier> 'name' ""="" local_variable_initializer 'expression' {{}}
	: _local_variable_declarator_name 'name' {{}}
	| _local_variable_declarator_name 'name' ""="" local_variable_initializer 'expression' {{}}
	;
_local_variable_declarator_name	# Here to create a parse node
	: <Identifier> {{SimpleName}}
	;
local_variable_initializer
	: expression
	| array_initializer
	;
local_constant_declaration
	: ""const"" type 'type' const_declarators {{}}
	;
const_declarators
	: const_declarator 'declarator' 
	| const_declarators "","" const_declarator 'declarator'
	;
const_declarator
	: <Identifier> 'name' ""="" constant_expression 'expression' {{}}
	;
expression_statement
	: statement_expression 'expression' "";"" {{}}
	;
statement_expression
	: invocation_expression
	| object_creation_expression
	| assignment
	| post_increment_expression
	| post_decrement_expression
	| pre_increment_expression
	| pre_decrement_expression
	;
selection_statement
	: if_statement
	| switch_statement
	;
if_statement
	: ""if"" ""("" boolean_expression 'expression' "")"" embedded_statement 'thenStatement' {{}}
	| ""if"" ""("" boolean_expression 'expression' "")"" embedded_statement 'thenStatement' ""else"" embedded_statement 'elseStatement' {{}}
	;
switch_statement
	: ""switch"" ""("" expression 'expression' "")"" switch_block {{}}
	;
switch_block
	: ""{"" _switch_sections ""}""
	;
_switch_sections
	:
	| switch_sections
	;
switch_sections
	: switch_section 'section'
	| switch_sections switch_section 'section'
	;
switch_section
	: switch_labels statement_list {{}}
	;
switch_labels
	: switch_label 'label'
	| switch_labels switch_label 'label'
	;
switch_label
	: ""case"" constant_expression 'expression' "":"" {{}}
	| ""default"" "":"" {{}}
	;
iteration_statement
	: while_statement
	| do_statement
	| for_statement
	| foreach_statement
	;
while_statement
	: ""while"" ""("" boolean_expression 'expression' "")"" embedded_statement 'statement' {{}}
	;
do_statement
	: ""do"" embedded_statement 'statement' ""while"" ""("" boolean_expression 'expression' "")"" "";"" {{}}
	;
for_statement
	: ""for"" ""("" _for_initializer "";"" _for_condition "";"" _for_iterator "")"" embedded_statement 'statement' {{}}
	;
_for_initializer
	: 
	| for_initializer 'initializer'
	;
for_initializer
	: local_variable_declaration
	| statement_expression_list {{StatementList}}
	;
_for_condition
	:
	| for_condition 'condition'
	;
for_condition
	: boolean_expression
	;
_for_iterator
	: 
	| for_iterator 'iterator'
	;
for_iterator
	: statement_expression_list {{StatementList}}
	;
statement_expression_list
	: statement_expression 'expression'
	| statement_expression_list "","" statement_expression 'expression'
	;
foreach_statement
	: ""foreach"" ""("" local_variable_type 'type' <Identifier> 'name' ""in"" expression 'expression' "")"" embedded_statement 'statement' {{}}
	;
jump_statement
	: break_statement
	| continue_statement
	| goto_statement
	| return_statement
	| throw_statement
	;
break_statement
	: ""break"" "";"" {{}}
	;
continue_statement
	: ""continue"" "";"" {{}}
	;
goto_statement
	: ""goto"" <Identifier> "";"" {{}}
	| ""goto"" ""case"" constant_expression 'expression' "";"" {{}}
	| ""goto"" ""default"" "";"" {{}}
	;
return_statement
	: ""return"" _expression "";"" {{}}
	;
throw_statement
	: ""throw"" _expression "";"" {{}}
	;
try_statement
	: ""try"" block 'block' catch_clauses {{}}
	| ""try"" block 'block' finally_clause 'finally' {{}}
	| ""try"" block 'block' catch_clauses finally_clause 'finally' {{}}
	;
catch_clauses
	: specific_catch_clauses _general_catch_clause
	| _specific_catch_clauses general_catch_clause 'clause'
	;
_specific_catch_clauses
	: 
	| specific_catch_clauses
	;
specific_catch_clauses
	: specific_catch_clause 'clause'
	| specific_catch_clauses specific_catch_clause 'clause'
	;
specific_catch_clause
	: ""catch"" ""("" class_type 'type' _identifier "")"" block 'block' {{}}
	;
_general_catch_clause
	:
	| general_catch_clause 'clause'
	;
general_catch_clause
	: ""catch"" block 'block' {{}}
	;
finally_clause
	: ""finally"" block 'block' {{}}
	;
checked_statement
	: ""checked"" block 'block' {{}}
	;
unchecked_statement
	: ""unchecked"" block 'block' {{}}
	;
lock_statement
	: ""lock"" ""("" expression 'expression' "")"" embedded_statement 'statement' {{}}
	;
using_statement
	: ""using"" ""("" resource_acquisition 'expression' "")"" embedded_statement 'statement' {{}}
	;
resource_acquisition
	: local_variable_declaration
	| expression
	;
yield_statement
	: ""yield"" ""return"" expression 'expression' "";"" {{}}
	| ""yield"" ""break"" "";"" {{}}
	;


# B.2.7 Classes
class_declaration
	: _attributes _class_modifiers _partial ""class"" <Identifier> 'name' _type_parameter_list _class_base _type_parameter_constraints_clauses class_body _semicolon {{}}
	;
_class_modifiers
	:
	| class_modifiers
	;
class_modifiers
	: class_modifier 'modifier'
	| class_modifiers class_modifier 'modifier'
	;
class_modifier
	: ""new"" 
	| ""public""
	| ""protected""
	| ""internal""
	| ""private""
	| ""abstract""
	| ""sealed""
	| ""static""
	;
_type_parameter_list
	: 
	| type_parameter_list 'typeParameters'
	;
type_parameter_list
	: ""<"" 'lessThan' type_parameters <gt> 'greaterThan' {{}}
	;
type_parameters
	: _attributes type_parameter 'parameter'
	| type_parameters "","" _attributes type_parameter 'parameter'
	;
type_parameter
	: <Identifier> 'name'  {{TypeName}}
	;
_class_base
	: 
	| class_base
	;
class_base
	: "":"" class_type 'supertype'
	| "":"" interface_type_list
	| "":"" class_type 'supertype' "","" interface_type_list
	;
interface_type_list
	: interface_type 'supertype'
	| interface_type_list "","" 'comma' interface_type 'supertype'
	;
_type_parameter_constraints_clauses
	: 
	| type_parameter_constraints_clauses
	;
type_parameter_constraints_clauses
	: type_parameter_constraints_clause 'constraintClause'
	| type_parameter_constraints_clauses type_parameter_constraints_clause 'constraintClause'
	;
type_parameter_constraints_clause
	: ""where"" 'whereToken' type_parameter 'parameter' "":"" 'colon' type_parameter_constraints {{}}
	;
type_parameter_constraints
	: primary_constraint  'constraint'
	| secondary_constraints
	| constructor_constraint 'constraint'
	| primary_constraint 'constraint' "","" secondary_constraints
	| primary_constraint 'constraint' "","" constructor_constraint 'constraint'
	| secondary_constraints "","" constructor_constraint 'constraint'
	| primary_constraint 'constraint' "","" secondary_constraints "","" constructor_constraint 'constraint'
	;
primary_constraint
	: class_type 'type' {{TypeConstraint}}
	| ""class"" {{}}
	| ""struct"" {{}}
	;
secondary_constraints
	: interface_type_constraint 'constraint'
	| type_parameter 'constraint'
	| secondary_constraints "","" interface_type_constraint 'constraint'
	| secondary_constraints "","" type_parameter 'constraint'
	;
## added Interface_type_constraint
interface_type_constraint
	: interface_type 'type' {{TypeConstraint}}
	;
constructor_constraint
	: ""new"" ""("" "")"" {{}}
	;
class_body
	: ""{"" _class_member_declarations ""}""
	;
_class_member_declarations
	: 
	| class_member_declarations
	;
class_member_declarations
	: class_member_declaration 'declaration'
	| class_member_declarations class_member_declaration 'declaration'
	;
class_member_declaration
	: constant_declaration
	| field_declaration
	| method_declaration
	| property_declaration
	| event_declaration
	| indexer_declaration
	| operator_declaration
	| constructor_declaration
	| destructor_declaration
	| static_constructor_declaration
	| type_declaration
	;
constant_declaration
	: _attributes _constant_modifiers ""const"" type 'type' constant_declarators "";"" {{}}
	;
_constant_modifiers
	: 
	| constant_modifers
	;
constant_modifers
	: constant_modifer 'modifier'
	| constant_modifers constant_modifer 'modifier'
	;
constant_modifer
	: ""new""
	| ""public""
	| ""protected""
	| ""internal""
	| ""private""
	;
constant_declarators
	: constant_declarator 'declarator'
	| constant_declarators "","" constant_declarator 'declarator'
	;
constant_declarator
	: <Identifier> ""="" constant_expression 'expression' {{}}
	;
field_declaration
	: _attributes _field_modifiers type 'type' variable_declarators "";"" {{}}
	;
_field_modifiers
	: 
	| field_modifiers
	;
field_modifiers
	: field_modifier
	| field_modifiers field_modifier
	;
field_modifier
	: ""new""
	| ""public""
	| ""protected""
	| ""internal""
	| ""private""
	| ""static""
	| ""readonly""
	| ""volatile""
	;
variable_declarators
	: variable_declarator 'declarator'
	| variable_declarators "","" variable_declarator 'declarator'
	;
variable_declarator
	: <Identifier> {{}}
	| <Identifier> ""="" variable_initializer 'initializer' {{}}
	;
variable_initializer
	: expression
	| array_initializer
	;
method_declaration
	: method_header 'header' method_body 'body' {{}}
	;
method_header
	: _attributes _method_modifiers _partial return_type 'returnType' member_name _type_parameter_list ""("" _formal_parameters_list "")"" _type_parameter_constraints_clauses {{}}
	;
_method_modifiers
	: 
	| method_modifiers
	;
method_modifiers
	: method_modifier 'modifier'
	| method_modifiers method_modifier 'modifier'
	;
method_modifier
	: ""new""
	| ""public""
	| ""protected""
	| ""internal""
	| ""private""
	| ""static""
	| ""virtual""
	| ""sealed""
	| ""override""
	| ""abstract""
	| ""extern""
	;
return_type
	: type
	| void_type
	;
member_name
	: <Identifier> 'name'
	| interface_type 'interface' ""."" <Identifier> 'name'
	;
method_body
	: block 'block' {{}}
	| "";"" {{}}
	;
_formal_parameters_list
	: 
	| formal_parameters_list
	;
formal_parameters_list
	: fixed_parameters
	| fixed_parameters "","" 'comma' parameter_array 'parameter'
	| parameter_array 'parameter'
	;
fixed_parameters
	: fixed_parameter 'parameter'
	| fixed_parameters "","" 'comma' fixed_parameter 'parameter'
	;
fixed_parameter
	: _attributes _parameter_modifier type 'type' <Identifier> 'name' {{FixedParameter}}
	;
_parameter_modifier
	:
	| parameter_modifier 'modifier'
	;
parameter_modifier
	: ""ref"" 
	| ""out""
	| ""this""
	;
parameter_array
	: _attributes ""params"" 'paramsToken' array_type 'type' <Identifier> 'name' {{ArrayParameter}}
	;
property_declaration
	: _attributes _property_modifiers type 'type' member_name ""{"" accessor_declarations ""}"" {{}}
	;
_property_modifiers
	:
	| property_modifiers
	;
property_modifiers
	: property_modifier 'modifier'
	| property_modifiers property_modifier 'modifier'
	;
property_modifier
	: ""new""
	| ""public""
	| ""protected""
	| ""internal""
	| ""private""
	| ""static""
	| ""virtual""
	| ""sealed""
	| ""override""
	| ""abstract""
	| ""extern""
	;
accessor_declarations
	: get_accessor_declaration 'getAccessor' _set_accessor_declaration 'setAccessor'
	| set_accessor_declaration 'setAccessor' _get_accessor_declaration 'getAccessor'
	;
_get_accessor_declaration
	:
	| get_accessor_declaration
	;
get_accessor_declaration
	: _attributes _accessor_modifiers ""get"" accessor_body {{}}
	;
_set_accessor_declaration
	:
	| set_accessor_declaration
	;
set_accessor_declaration
	: _attributes _accessor_modifiers ""set"" accessor_body {{}}
	;
_accessor_modifiers
	:
	| accessor_modifiers
	;
accessor_modifiers
	: ""protected"" 'modifier'
	| ""internal"" 'modifier'
	| ""private"" 'modifier'
	| ""protected"" 'modifier' ""internal"" 'modifier'
	| ""internal"" 'modifier' ""protected"" 'modifier'
	;
accessor_body
	: block 'body'
	| "";""
	;
event_declaration
	: _attributes _event_modifiers ""event"" type 'type' variable_declarators "";"" {{}}
	| _attributes _event_modifiers ""event"" type 'type' member_name ""{"" event_accessor_declarations ""}"" {{}}
	;
_event_modifiers
	:
	| event_modifiers
	;
event_modifiers
	: event_modifier 'modifier'
	| event_modifiers event_modifier 'modifier'
	;
event_modifier
	: ""new""
	| ""public""
	| ""protected""
	| ""internal""
	| ""private""
	| ""static""
	| ""virtual""
	| ""sealed""
	| ""override""
	| ""abstract""
	| ""extern""
	;
event_accessor_declarations
	: add_accessor_declaration 'addDeclaration' remove_accessor_declaration 'removeDeclaration'
	| remove_accessor_declaration 'removeDeclaration' add_accessor_declaration 'addDeclaration'
	;
add_accessor_declaration
	: _attributes ""add"" block 'block' {{}}
	;
remove_accessor_declaration
	: _attributes ""remove"" block 'block' {{}}
	;
indexer_declaration
	: _attributes _indexer_modifiers indexer_declarator ""{"" accessor_declarations ""}"" {{}}
	;
_indexer_modifiers
	:
	| indexer_modifiers
	;
indexer_modifiers
	: indexer_modifier 'modifier'
	| indexer_modifiers indexer_modifier 'modifier'
	;
indexer_modifier
	: ""new""
	| ""public""
	| ""protected""
	| ""internal""
	| ""private""
	| ""virtual""
	| ""sealed""
	| ""override""
	| ""abstract""
	| ""extern""
	;
indexer_declarator
	: type 'returnType' ""this"" ""["" formal_parameters_list ""]""
	| type 'returnType' interface_type 'type' ""."" ""this"" ""["" formal_parameters_list ""]""
	;
operator_declaration
	: _attributes operator_modifiers operator_declarator operator_body 'body' {{}}
	;
operator_modifiers
	: operator_modifier 'modifier'
	| operator_modifiers operator_modifier 'modifier'
	;
operator_modifier
	: ""public""
	| ""static""
	| ""extern""
	;
operator_declarator
	: unary_operator_declarator
	| binary_operator_declarator
	| conversion_operator_declarator
	;
unary_operator_declarator
	: type 'returnType' ""operator"" overloadable_unary_operator 'operator' ""("" type 'type' <Identifier> 'argument' "")""
	;
overloadable_unary_operator
	: ""+""
	| ""-""
	| ""!""
	| ""~""
	| ""++""
	| ""--""
	| ""true""
	| ""false""
	;
binary_operator_declarator
	: type 'returnType' ""operator"" overloadable_binary_operator 'operator' ""("" type 'type' <Identifier> 'argument' "","" type 'type' <Identifier> 'argument' "")""
	;
overloadable_binary_operator
	: ""+""
	| ""-""
	| ""*""
	| ""/""
	| ""%""
	| ""&""
	| ""|""
	| ""^""
	| ""<<""
	| <gtgt>
	| ""==""
	| ""!=""
	| <gt>
	| ""<""
	| "">=""
	| ""<=""
	;
conversion_operator_declarator
	: ""implicit"" ""operator"" type 'returnType' ""("" type 'type' <Identifier> 'argument' "")""
	| ""explicit"" ""operator"" type 'returnType' ""("" type 'type' <Identifier> 'argument' "")""
	;
operator_body
	: block 'block' {{MethodBody}}
	| "";"" {{MethodBody}}
	;
constructor_declaration
	: _attributes _constructor_modifiers constructor_declarator constructor_body {{}}
	;
_constructor_modifiers
	: 
	| constructor_modifiers
	;
constructor_modifiers
	: constructor_modifier 'modifier'
	| constructor_modifiers constructor_modifier 'modifier'
	;
constructor_modifier
	: ""public""
	| ""protected""
	| ""internal""
	| ""private""
	| ""extern""
	;
constructor_declarator
	: <Identifier> ""("" _formal_parameters_list "")"" _constructor_initializer
	;
_constructor_initializer
	: 
	| constructor_initializer 'initializer'
	;
constructor_initializer
	: "":"" ""base"" ""("" _argument_list "")"" {{}}
	| "":"" ""this"" ""("" _argument_list "")"" {{}}
	;
constructor_body
	: block 'block'
	| "";""
	;
static_constructor_declaration
	: _attributes static_constructor_modifiers <Identifier> ""("" "")"" static_constructor_body {{}}
	;
# redefined in the unsafe section
static_constructor_modifiers
	: _extern ""static""
	| ""static"" _extern
	;
static_constructor_body
	: block 'block'
	| "";""
	;
# redefined in the unsafe section
#destructor_declaration
#	: _attributes _extern ""~"" <Identifier> ""("" "")"" destructor_body
#	;
#destructor_body
#	: block
#	| "";""
#	;

# B.2.8 Structs
struct_declaration
	: _attributes _struct_modifiers _partial ""struct"" <Identifier> _type_parameter_list _struct_interfaces _type_parameter_constraints_clauses struct_body _semicolon {{}}
	;
_struct_modifiers
	: 
	| struct_modifiers
	;
struct_modifiers
	: struct_modifier 'modifier'
	| struct_modifiers struct_modifier 'modifier'
	;
struct_modifier
	: ""new""
	| ""public""
	| ""protected""
	| ""internal""
	| ""private""
	;
_struct_interfaces
	:
	| struct_interfaces
	;
struct_interfaces
	: "":"" interface_type_list
	;
struct_body
	: ""{"" _struct_member_declarations ""}""
	;
_struct_member_declarations
	: 
	| struct_member_declarations
	;
struct_member_declarations
	: struct_member_declaration 'declaration'
	| struct_member_declarations struct_member_declaration 'declaration'
	;
struct_member_declaration
	: constant_declaration
	| field_declaration
	| method_declaration
	| property_declaration
	| event_declaration
	| indexer_declaration
	| operator_declaration
	| constructor_declaration
	| static_constructor_declaration
	| type_declaration
	;

# B.2.9 Arrays
_array_initializer
	:
	| array_initializer
	;
array_initializer
	: ""{"" _variable_initializer_list ""}"" {{}}
	| ""{"" variable_initializer_list "","" ""}"" {{}}
	;
_variable_initializer_list
	:
	| variable_initializer_list
	;
variable_initializer_list
	: variable_initializer 'initializer'
	| variable_initializer_list "","" variable_initializer 'initializer'
	;
variable_initializer
	: expression
	| array_initializer
	;

# B.2.10 Interfaces
interface_declaration
	: _attributes _interface_modifiers _partial ""interface"" 'interfaceToken' <Identifier> 'name' _type_parameter_list _interface_base _type_parameter_constraints_clauses interface_body _semicolon {{}}
	;
_interface_modifiers
	:
	| interface_modifiers
	;
interface_modifiers
	: interface_modifier 'modifier'
	| interface_modifiers interface_modifier 'modifier'
	;
interface_modifier
	: ""new""
	| ""public""
	| ""protected""
	| ""internal""
	| ""private""
	;
_interface_base
	: 
	| interface_base
	;
interface_base
	: "":"" 'colon' interface_type_list
	;
interface_body
	: ""{"" 'leftBrace' _interface_member_declarations ""}"" 'rightBrace'
	;
_interface_member_declarations
	:
	| interface_member_declarations
	;
interface_member_declarations
	: interface_member_declaration 'declaration'
	| interface_member_declarations interface_member_declaration 'declaration'
	;
interface_member_declaration
	: interface_method_declaration
	| interface_property_declaration
	| interface_event_declaration
	| interface_indexer_declaration
	;
interface_method_declaration
	: _attributes _new 'modifier' return_type 'type' <Identifier> 'name' _type_parameter_list ""("" 'leftParen' _formal_parameters_list "")"" 'rightParen' _type_parameter_constraints_clauses "";"" 'semicolon' {{}}
	;
interface_property_declaration
	: _attributes _new 'modifier' type 'type' <Identifier> 'name' ""{"" 'leftBrace' interface_accessors ""}"" 'rightBrace' {{}}
	;
interface_accessors	#This was changed to use the interface_(g/s)et_accessor
	: interface_get_accessor 'getAccessor'
	| interface_set_accessor 'setAccessor'
	| interface_get_accessor 'getAccessor' interface_set_accessor 'setAccessor'
	| interface_set_accessor 'setAccessor' interface_get_accessor 'getAccessor'
	;
interface_get_accessor
	: _attributes ""get"" 'accessorType' "";"" 'semicolon' {{InterfacePropertyAccessor}}
	;
interface_set_accessor
	: _attributes ""set"" 'accessorType' "";"" 'semicolon' {{InterfacePropertyAccessor}}
	;
interface_event_declaration
	: _attributes _new 'modifier' ""event"" 'eventToken' type 'type' <Identifier> 'name' "";"" 'semicolon' {{}}
	;
interface_indexer_declaration
	: _attributes _new 'modifier' type 'type' ""this"" 'thisToken' ""["" 'leftBracket' formal_parameters_list ""]"" 'rightBracket' ""{"" 'leftBrace' interface_accessors ""}"" 'rightBrace' {{}}
	;

# B.2.11 Enums
enum_declaration
	: _attributes _enum_modifers ""enum"" 'enumToken' <Identifier> 'name' _enum_base enum_body _semicolon {{}}
	;
_enum_base
	:
	| enum_base
	;
enum_base
	: "":"" integral_type 'type'
	;
enum_body
	: ""{"" 'leftBrace' _enum_member_declarations ""}"" 'rightBrace'
	| ""{"" 'leftBrace' enum_member_declarations "","" 'comma' ""}"" 'rightBrace'
	;
_enum_modifers
	:
	| enum_modifers
	;
enum_modifers
	: enum_modifer 'modifier'
	| enum_modifers enum_modifer 'modifier'
	;
enum_modifer
	: ""new""
	| ""public""
	| ""protected""
	| ""internal""
	| ""private""
	;
_enum_member_declarations
	:
	| enum_member_declarations
	;
enum_member_declarations
	: enum_member_declaration 'declaration'
	| enum_member_declarations "","" 'comma' enum_member_declaration 'declaration'
	;
enum_member_declaration
	: _attributes <Identifier> 'name' {{EnumDeclaration}}
	| _attributes <Identifier> 'name' ""="" 'equal' constant_expression 'value' {{EnumDeclaration}}
	;

# B.2.12 Delegates
delegate_declaration
	: _attributes _delegate_modifiers ""delegate"" 'delegateToken' return_type 'type' <Identifier> 'name' _type_parameter_list ""("" 'leftParen' _formal_parameters_list "")"" 'rightParen' _type_parameter_constraints_clauses "";"" 'semicolon' {{}}
	;
_delegate_modifiers
	:
	| delegate_modifiers
	;
delegate_modifiers
	: delegate_modifier 'modifier'
	| delegate_modifiers delegate_modifier 'modifier'
	;
delegate_modifier
	: ""new""
	| ""public""
	| ""protected""
	| ""internal""
	| ""private""
	;

# B.2.13 Attributes
_global_attributes
	:
	| global_attributes
	;
global_attributes
	: global_attribute_sections
	;
global_attribute_sections
	: global_attribute_section 'attribute'
	| global_attribute_sections global_attribute_section 'attribute'
	;
global_attribute_section
	: ""["" 'leftBracket' global_attribute_target_specifier attribute_list ""]"" 'rightBracket' {{Attribute}}
	| ""["" 'leftBracket' global_attribute_target_specifier attribute_list "","" 'comma' ""]"" 'rightBracket' {{Attribute}}
	;
global_attribute_target_specifier
	: global_attribute_target 'target' "":"" 'colon'
	;
global_attribute_target
	: ""assembly""
	| ""module""
	;
_attributes
	:
	| attributes
	;
attributes
	: attribute_sections
	;
attribute_sections
	: attribute_section 'attribute'
	| attribute_sections attribute_section 'attribute'
	;
attribute_section
	: ""["" 'leftBracket' _attribute_target_specifier attribute_list ""]"" 'rightBracket' {{Attribute}}
	| ""["" 'leftBracket' _attribute_target_specifier attribute_list "","" 'comma' ""]"" 'rightBracket' {{Attribute}}
	;
_attribute_target_specifier
	: 
	| attribute_target_specifier
	;
attribute_target_specifier
	: attribute_target 'target' "":"" 'colon'
	;
attribute_target
	: ""field""
	| ""event""
	| ""method""
	| ""param""
	| ""property""
	| ""return""
	| ""type""
	;
attribute_list
	: attribute 'attributeValue'
	| attribute_list "","" 'comma' attribute 'attributeValue'
	;
attribute
	: attribute_name 'name' _attribute_arguments {{AttributeValue}}
	;
attribute_name
	: type_name
	;
_attribute_arguments
	: 
	| attribute_arguments
	;
attribute_arguments
	: ""("" 'leftParen' _positional_argument_list "")"" 'rightParen'
	| ""("" 'leftParen' positional_argument_list "","" 'comma' named_argument_list "")"" 'rightParen'
	| ""("" 'leftParen' named_argument_list "")"" 'rightParen'
	;
_positional_argument_list
	:
	| positional_argument_list
	;
positional_argument_list
	: positional_argument 'argument'
	| positional_argument_list "","" 'comma' positional_argument 'argument'
	;
positional_argument
	: attribute_argument_expression
	;
named_argument_list
	: named_argument 'argument'
	| named_argument_list "","" 'comma' named_argument 'argument'
	;
named_argument
	: <Identifier> 'name' ""="" 'equal' attribute_argument_expression 'value' {{NamedArgument}}
	;
attribute_argument_expression
	: expression
	;

# B.1.8 Literals
literal
	: boolean_literal 'token' {{LiteralExpression}}
	| <IntegerLiteral> 'token' {{LiteralExpression}}
	| <RealLiteral> 'token' {{LiteralExpression}}
	| <CharacterLiteral> 'token' {{LiteralExpression}}
	| <StringLiteral> 'token' {{LiteralExpression}}
	| <NullLiteral> 'token' {{LiteralExpression}}
	;
boolean_literal
	: ""true""
	| ""false""
	;

# Misc
_semicolon
	:
	| "";"" 'semicolon'
	;
_new
	:
	| ""new""
	;
_partial
	:
	| ""partial"" 'partialToken'
	;
_extern
	:
	| ""extern"" 'modifier'
	;
_identifier
	:
	| <Identifier> 'name'
	;

# B.3 Unsafe code
class_modifier
	: ""unsafe""
	;
struct_modifier
	: ""unsafe""
	;
interface_modifier
	: ""unsafe""
	;
delegate_modifier
	: ""unsafe""
	;
field_modifier
	: ""unsafe""
	;
method_modifier
	: ""unsafe""
	;
property_modifier
	: ""unsafe""
	;
event_modifier
	: ""unsafe""
	;
indexer_modifier
	: ""unsafe""
	;
operator_modifier
	: ""unsafe""
	;
constructor_modifier
	: ""unsafe""
	;
destructor_declaration	# Changed from destructor_body to method_body since they are the same
	: _attributes _extern _unsafe ""~"" <Identifier> ""("" "")"" method_body 'body' {{}}
	| _attributes _unsafe _extern ""~"" <Identifier> ""("" "")"" method_body 'body' {{}}
	;
_unsafe
	:
	| ""unsafe"" 'modifier'
	;
static_constructor_modifiers
	: _extern _unsafe ""static""
	| _unsafe _extern ""static""
	| _extern ""static"" ""unsafe""
	| _unsafe ""static"" _extern
	| ""static"" _extern _unsafe
	| ""static"" _unsafe _extern
	;
embedded_statement
	: unsafe_statement
	;
unsafe_statement
	: ""unsafe"" block 'block' {{UnsafeStatement}}
	;
type
	: pointer_type
	;
pointer_type
	: unmanaged_type 'type' ""*"" {{}}
	| void_type 'type' ""*"" {{}}
	;
unmanaged_type
	: type
	;
primary_no_array_creation_expression
	: pointer_member_access
	| pointer_element_access
	| sizeof_expression
	;
unary_expression
	: pointer_indirection_expression
	| addressof_expression
	;
pointer_indirection_expression
	: ""*"" 'operator' unary_expression 'expression' {{PrefixExpression}}
	;
pointer_member_access
	: primary_expression 'expression' ""->"" 'arrowToken' <Identifier> 'name' {{}}
	;
pointer_element_access
	: primary_no_array_creation_expression 'expression' ""["" expression 'indexExpression' ""]"" {{}}
	;
addressof_expression
	: ""&"" 'operator' unary_expression 'expression' {{PrefixExpression}}
	;
sizeof_expression
	: ""sizeof"" ""("" unmanaged_type 'type' "")"" {{}}
	;
embedded_statement
	: fixed_statement
	;
fixed_statement
	: ""fixed"" ""("" pointer_type 'type' fixed_pointer_declarators "")"" embedded_statement 'statement' {{}}
	;
fixed_pointer_declarators
	: fixed_pointer_declarator 'declarator'
	| fixed_pointer_declarators "","" fixed_pointer_declarator 'declarator'
	;
fixed_pointer_declarator
	: <Identifier> ""="" fixed_pointer_initializer {{}}
	;
fixed_pointer_initializer
	: ""&"" variable_reference 'expression'
	| expression 'expression'
	;
struct_member_declaration
	: fixed_size_buffer_declaration
	;
fixed_size_buffer_declaration
	: _attributes _fixed_size_buffer_modifiers ""fixed"" buffer_element_type 'type' fixed_size_buffer_declarators "";"" {{}}
	;
_fixed_size_buffer_modifiers
	: 
	| fixed_size_buffer_modifiers
	;
fixed_size_buffer_modifiers
	: fixed_size_buffer_modifier 'modifier'
	| fixed_size_buffer_modifiers fixed_size_buffer_modifier 'modifier'
	;
fixed_size_buffer_modifier
	: ""new""
	| ""public""
	| ""protected""
	| ""internal""
	| ""private""
	| ""unsafe""
	;
buffer_element_type
	: type
	;
fixed_size_buffer_declarators
	: fixed_size_buffer_declarator 'declarator'
	| fixed_size_buffer_declarators fixed_size_buffer_declarator 'declarator'
	;
fixed_size_buffer_declarator
	: <Identifier> 'name' ""["" constant_expression 'expression' ""]"" {{}}
	;
local_variable_initializer
	: stackalloc_initializer
	;
stackalloc_initializer
	: ""stackalloc"" unmanaged_type 'type' ""["" expression 'expression' ""]"" {{}}
	;
# Additions
void_type
	: ""void"" {{}}
	;"