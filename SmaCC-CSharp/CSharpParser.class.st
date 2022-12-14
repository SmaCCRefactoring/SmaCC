Class {
	#name : #CSharpParser,
	#superclass : #SmaCCGLRParser,
	#classInstVars : [
		'keywords'
	],
	#category : 'SmaCC-CSharp'
}

{ #category : #'generated-accessing' }
CSharpParser class >> cacheId [
	^'2017-05-02T22:50:29.838793+02:00'
]

{ #category : #generated }
CSharpParser class >> definitionComment [
"%glr;
%id <Identifier> <gt> <gtgt> <rightBrace>;

%states default interpolatedString interpolatedVerbatimString;

%start compilation_unit namespace_member_declaration statement expression block;

%ignore_variables commaToken _leftParen _rightParen semicolonToken;

%root Program;
%prefix CS;
%suffix Node;

%annotate_tokens;

%hierarchy TypeParameterList (
	VariantTypeParameterList
);
%hierarchy UsingDirective (
	UsingAliasDirective
	UsingNamespaceDirective
	UsingStaticDirective
);
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
	AwaitExpression
	BaseAccess
	BaseExpression
	BinaryExpression
	CastExpression
	CheckedExpression
	ConditionalExpression
	DefaultValueExpression
	DelegateCreationExpression
	ElementAccess
	InterpolatedStringExpression
	InvocationExpression
	LambdaExpression
	LiteralExpression
	MemberAccess
	NamedEntity
	NameofExpression
	NullConditionalExpression
	ObjectCreationExpression
	PrefixExpression
	PointerElementAccess
	PointerMemberAccess
	PostExpression
	QueryExpression
	SimpleName
	SizeofExpression
	ThisAccess
	TypeExpression
	TypeofExpression
	UncheckedExpression
);
%hierarchy ElementAccess (
	NullConditionalElementAccess
);
%hierarchy InvocationExpression (
	NullConditionalInvocationExpression
);
%hierarchy MemberAccess (
	NullConditionalMemberAccess
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

default <gt>
	: \>
	;
default <gtgt>
	: <gt> <gt>
	;
default <rightBrace>
	: \}
	;
<LineTerminator>
	: \r
	| \n
	| \r\n
#	| \x85
#	| \x2028
#	| \x2029
	;
default <comment>
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
default <IntegerLiteral>
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
default <RealLiteral>
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
default <CharacterLiteral>
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
<InterpolatedSingleRegularStringLiteralCharacter>
	: [^\""\\\n\{]
	;
<InterpolatedRegularStringLiteralCharacter>
	: <InterpolatedSingleRegularStringLiteralCharacter>
	| <SimpleEscapeSequence>
	| <HexadecimalEscapeSequence>
	| <UnicodeCharacterEscapeSequence>
	| \{ \{
	;
default <InterpolatedRegularStringWhole>
	: \$\"" <InterpolatedRegularStringLiteralCharacter>* \""
	;
default <InterpolatedRegularStringStart>
	: \$\"" <InterpolatedRegularStringLiteralCharacter>* \{ 
	;
interpolatedString <InterpolatedRegularStringEnd>
	: \} <InterpolatedRegularStringLiteralCharacter>* \""
	;
interpolatedString <InterpolatedRegularStringMid>
	: \} <InterpolatedRegularStringLiteralCharacter>* \{
	;
<VerbatimStringLiteralCharacter>
	: [^\""]
	| \""\""
	;
<VerbatimStringLiteral>
	: \@\"" <VerbatimStringLiteralCharacter>* \""
	;
<InterpolatedVerbatimStringLiteralCharacter>
	: [^\""\{]
	| \""\""
	| \{ \{
	;
default <InterpolatedVerbatimStringLiteral>
	: \$\@\"" <InterpolatedVerbatimStringLiteralCharacter>* \""
	;
default <InterpolatedVerbatimStringStart>
	: \$\@\"" <InterpolatedVerbatimStringLiteralCharacter>* \{
	;
interpolatedVerbatimString <InterpolatedVerbatimStringEnd>
	: \} <InterpolatedVerbatimStringLiteralCharacter>* \""
	;
interpolatedVerbatimString <InterpolatedVerbatimStringMid>
	: \} <InterpolatedVerbatimStringLiteralCharacter>* \{
	;
default <StringLiteral>
	: <RegularStringLiteral>
	| <VerbatimStringLiteral>
	;
default <NullLiteral>
	: null
	;
default <whitespace>
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
	: ""{"" _extern_alias_directives _using_directives _namespace_member_declarations <rightBrace>
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
	| using_static_directive
	;
using_alias_directive
	: ""using"" <Identifier> 'name' ""="" namespace_or_type_name 'namespace' "";"" {{}}
	;
using_namespace_directive
	: ""using"" namespace_name 'namespace' "";"" {{}}
	;
using_static_directive
	: ""using"" ""static"" type_name 'namespace' "";"" {{}}
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
	: _argument_name argument_value {{}}
	;
_argument_name
	:
	| argument_name
	;
argument_name
	: <Identifier> 'identifier' "":""
	;
argument_value
	: expression 'expression' 
	| ""ref"" variable_reference 'expression' 
	| ""out"" variable_reference 'expression'
	;
primary_expression
	: primary_no_array_creation_expression
	| array_creation_expression
	;
primary_no_array_creation_expression
	: literal 
    | interpolated_string_expression
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
	| nameof_expression
	| anonymous_method_expression 
	;
interpolated_string_expression
	: interpolated_regular_string {{}}
	| interpolated_verbatim_string {{}}
	;
interpolated_regular_string
	: <InterpolatedRegularStringWhole> 'stringPart'
	| StartInterpolatedString <InterpolatedRegularStringStart> 'stringPart' interpolated_regular_string_body <InterpolatedRegularStringEnd> 'stringPart'
	;
StartInterpolatedString
	: {#interpolatedString}
	;
interpolated_regular_string_body
	: interpolation 'interpolation'
	| interpolation 'interpolation' <InterpolatedRegularStringMid> 'stringPart' interpolation 'interpolation'
	;
interpolation
	: expression 'expression' {{}}
	| expression 'expression' "","" constant_expression 'constant' {{}}
	;
interpolated_verbatim_string
	: <InterpolatedVerbatimStringLiteral> 'stringPart'
	| StartInterpolatedVerbatimString <InterpolatedVerbatimStringStart> 'stringPart' interpolated_verbatim_string_body <InterpolatedVerbatimStringEnd> 'stringPart'
	;
StartInterpolatedVerbatimString
	: {#interpolatedVerbatimString}
	;
interpolated_verbatim_string_body
	: interpolation 'interpolation'
	| interpolation 'interpolation' <InterpolatedVerbatimStringMid> 'stringPart' interpolation 'interpolation'
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
	| predefined_type_expression 'expression' ""."" <Identifier> 'identifier' _type_argument_list 'typeArguments' {{}}
	| qualified_alias_member_expression 'expression' ""."" <Identifier> 'identifier' {{}}
	;
qualified_alias_member_expression
	: qualified_alias_member 'type' {{TypeExpression}}
	;
predefined_type_expression
	: predefined_type 'type' {{TypeExpression}}
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
	: ""{"" _member_initializer_list <rightBrace> {{}}
	| ""{"" member_initializer_list "","" <rightBrace> {{}}
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
	: initializer_target ""="" initializer_value 'value' {{}}
	;
initializer_target
	: <Identifier> 'identifier'
	| ""["" argument_list ""]""
	;
initializer_value
	: expression
	| object_or_collection_initializer
	;
collection_initializer
	: ""{"" element_initializer_list <rightBrace> {{}}
	| ""{"" element_initializer_list "","" <rightBrace> {{}}
	;
element_initializer_list
	: element_initializer 'initializer'
	| element_initializer_list "","" element_initializer 'initializer'
	;
element_initializer
	: non_assignment_expression 'expression' {{}}
	| ""{"" expression_list <rightBrace> {{}}
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
	: ""{"" _member_declarator_list <rightBrace>
	| ""{"" member_declarator_list "","" <rightBrace>
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
	| base_access 'access' {{}}
	| null_conditional_member_access 'access' {{}}
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
nameof_expression
	: ""nameof"" ""("" named_entity 'name' "")"" {{}}
	;
named_entity
	: simple_name
	| named_entity_target 'target' ""."" <Identifier> _type_argument_list 'typeArguments' {{}}
	;
named_entity_target 
	: ""this"" {{ThisAccess}}
	| ""base"" {{BaseExpression}}
	| named_entity
	| predefined_type_expression
	| qualified_alias_member_expression
	;
unary_expression
	: primary_expression
	| null_conditional_expression
	| ""+"" 'operator' unary_expression 'expression' {{PrefixExpression}}
	| ""-"" 'operator' unary_expression 'expression' {{PrefixExpression}}
	| ""!"" 'operator' unary_expression 'expression' {{PrefixExpression}}
	| ""~"" 'operator' unary_expression 'expression' {{PrefixExpression}}
	| pre_increment_expression
	| pre_decrement_expression
	| cast_expression
	| await_expression
	;
null_conditional_expression
	: primary_expression 'expression' null_conditional_operations 'nullConditionalOperation' {{}}
	;
_null_conditional_operations
	:
	| null_conditional_operations
	;
null_conditional_operations
	: _null_conditional_operations 'baseOperations' ""?"" ""."" <Identifier> _type_argument_list 'typeArguments' {{NullConditionalMemberAccess}}
	| _null_conditional_operations 'baseOperations' ""?"" ""["" argument_list ""]"" {{NullConditionalElementAccess}}
	| null_conditional_operations 'baseOperations' ""."" <Identifier> _type_argument_list 'typeArguments' {{NullConditionalMemberAccess}}
	| null_conditional_operations 'baseOperations' ""["" argument_list ""]"" {{NullConditionalElementAccess}}
	| null_conditional_operations 'baseOperations' ""("" _argument_list "")"" {{NullConditionalInvocationExpression}}
	;
null_conditional_member_access
	: primary_expression 'expression' _null_conditional_operations 'baseOperations' ""?"" ""."" <Identifier> _type_argument_list 'typeArguments' {{}}
	| primary_expression 'expression' null_conditional_operations 'baseOperations' ""."" <Identifier> _type_argument_list 'typeArguments' {{}}
	;
null_conditional_invocation_expression
	: primary_expression 'expression' null_conditional_operations 'baseOperations' ""("" _argument_list "")"" {{}}
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
await_expression
	: ""await"" unary_expression 'expression' {{}}
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
	: ""{"" _statement_list <rightBrace> {{BlockStatement}}
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
	| null_conditional_invocation_expression
	| object_creation_expression
	| assignment
	| post_increment_expression
	| post_decrement_expression
	| pre_increment_expression
	| pre_decrement_expression
	| await_expression
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
	: ""{"" _switch_sections <rightBrace>
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
	: catch_clause 'clause'
	| catch_clauses catch_clause 'clause'
	;
catch_clause
	: ""catch"" _exception_specifier _exception_filter block 'block' {{}}
	;
_exception_specifier
	:
	| exception_specifier
	;
exception_specifier
	: ""("" type 'type' _identifier "")""
	;
_exception_filter
	:
	| exception_filter 'filter'
	;
exception_filter
	: ""when"" ""("" expression 'expression' "")"" {{}}
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
	: ""{"" _class_member_declarations <rightBrace>
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
	: field_modifier 'modifier'
	| field_modifiers field_modifier 'modifier'
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
	| ""=>"" expression 'expression' "";"" {{}}
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
	: _attributes _parameter_modifier type 'type' <Identifier> 'name' _default_argument {{FixedParameter}}
	;
_default_argument
	:
	| default_argument
	;
default_argument
	: ""="" expression 'expression'
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
	: _attributes _property_modifiers type 'type' member_name property_body {{}}
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
property_body
	: ""{"" accessor_declarations <rightBrace> _property_initializer
	| ""=>"" expression 'expression'
	;
_property_initializer
	:
	| property_initializer
	;
property_initializer
	: ""="" variable_initializer 'initializer'
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
	| _attributes _event_modifiers ""event"" type 'type' member_name ""{"" event_accessor_declarations <rightBrace> {{}}
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
	: _attributes _indexer_modifiers indexer_declarator indexer_body {{}}
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
indexer_body
	: ""{"" accessor_declarations <rightBrace>
	| ""=>"" expression 'expression' "";""
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
	| ""=>"" expression 'expression' "";"" {{MethodBody}}
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
	: ""{"" _struct_member_declarations <rightBrace>
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
	: ""{"" _variable_initializer_list <rightBrace> {{}}
	| ""{"" variable_initializer_list "","" <rightBrace> {{}}
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
	: _attributes _interface_modifiers _partial ""interface"" 'interfaceToken' <Identifier> 'name' _variant_type_parameter_list _interface_base _type_parameter_constraints_clauses interface_body _semicolon {{}}
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
_variant_type_parameter_list
	:
	| variant_type_parameter_list 'typeParameters'
	;
variant_type_parameter_list
	: ""<"" 'lessThan' variant_type_parameters <gt> 'greaterThan' {{}}
	;
variant_type_parameters
	: _attributes _variance_annotation type_parameter 'parameter'
	| variant_type_parameters "","" _attributes _variance_annotation type_parameter 'parameter'
	;
_variance_annotation
	:
	| variance_annotation 'annotation'
	;
variance_annotation
	: ""in""
	| ""out""
	;
_interface_base
	: 
	| interface_base
	;
interface_base
	: "":"" 'colon' interface_type_list
	;
interface_body
	: ""{"" 'leftBrace' _interface_member_declarations <rightBrace> 'rightBrace'
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
	: _attributes _new 'modifier' type 'type' <Identifier> 'name' ""{"" 'leftBrace' interface_accessors <rightBrace> 'rightBrace' {{}}
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
	: _attributes _new 'modifier' type 'type' ""this"" 'thisToken' ""["" 'leftBracket' formal_parameters_list ""]"" 'rightBracket' ""{"" 'leftBrace' interface_accessors <rightBrace> 'rightBrace' {{}}
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
	: ""{"" 'leftBrace' _enum_member_declarations <rightBrace> 'rightBrace'
	| ""{"" 'leftBrace' enum_member_declarations "","" 'comma' <rightBrace> 'rightBrace'
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
	: _attributes _delegate_modifiers ""delegate"" 'delegateToken' return_type 'type' <Identifier> 'name' _variant_type_parameter_list ""("" 'leftParen' _formal_parameters_list "")"" 'rightParen' _type_parameter_constraints_clauses "";"" 'semicolon' {{}}
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
]

{ #category : #'file types' }
CSharpParser class >> fileExtension [
	^ '.cs'
]

{ #category : #'file types' }
CSharpParser class >> fileExtensionType [
	^ 'C# files'
]

{ #category : #private }
CSharpParser class >> keywords [
	^ keywords
		ifNil:
			[ keywords := #('abstract' 'as' 'base' 'bool' 'break' 'byte' 'case' 'catch' 'char' 'checked' 'class' 'const' 'continue' 'decimal' 'default' 'delegate' 'do' 'double' 'else' 'enum' 'event' 'explicit' 'extern' 'false' 'finally' 'fixed' 'float' 'for' 'foreach' 'goto' 'if' 'implicit' 'in' 'int' 'interface' 'internal' 'is' 'lock' 'long' 'namespace' 'new' 'null' 'object' 'operator' 'out' 'override' 'params' 'private' 'protected' 'public' 'readonly' 'ref' 'return' 'sbyte' 'sealed' 'short' 'sizeof' 'stackalloc' 'static' 'string' 'struct' 'switch' 'this' 'throw' 'true' 'try' 'typeof' 'uint' 'ulong' 'unchecked' 'unsafe' 'ushort' 'using' 'virtual' 'void' 'volatile' 'while')
				asSet ]
]

{ #category : #accessing }
CSharpParser class >> parseBlock: aString onError: aBlock [
	^ self
		parse: aString
		startingAt: self startingStateForblock
		onError: aBlock
]

{ #category : #'generated-accessing' }
CSharpParser class >> scannerClass [
	^CSharpScanner
]

{ #category : #generated }
CSharpParser class >> startingStateForblock [
	^ 5
]

{ #category : #generated }
CSharpParser class >> startingStateForcompilation_unit [
	^ 1
]

{ #category : #generated }
CSharpParser class >> startingStateForexpression [
	^ 4
]

{ #category : #generated }
CSharpParser class >> startingStateFornamespace_member_declaration [
	^ 2
]

{ #category : #generated }
CSharpParser class >> startingStateForstatement [
	^ 3
]

{ #category : #private }
CSharpParser >> actionsForCurrentToken [
	| actions |
	actions := super actionsForCurrentToken.
	(actions isEmpty and: [ currentToken ids includes: scanner gtgtId ])
		ifTrue:
			[ currentToken := currentToken class
				value: '>'
				start: currentToken startPosition
				ids: (Array with: scanner gtId).
			self position: currentToken startPosition.
			actions := super actionsForCurrentToken ].
	^ actions
]

{ #category : #generated }
CSharpParser >> ambiguousTransitions [
^#(
#[ 0 50 0 54 0 58] 
#[ 0 134 0 138] 
#[ 0 154 5 209] 
#[ 0 158 0 162 0 166 0 170 0 174] 
#[ 0 178 0 182] 
#[ 0 214 5 225] 
#[ 1 6 4 233] 
#[ 0 169 1 10] 
#[ 0 173 1 10] 
#[ 0 177 1 10] 
#[ 0 181 1 10] 
#[ 0 185 1 10] 
#[ 0 189 1 10] 
#[ 0 193 1 10] 
#[ 0 197 1 10] 
#[ 0 205 1 10] 
#[ 1 14 1 18] 
#[ 0 225 1 10] 
#[ 0 229 1 10] 
#[ 0 233 1 10] 
#[ 0 237 1 10] 
#[ 0 241 1 10] 
#[ 0 245 1 10] 
#[ 0 249 1 10] 
#[ 1 10 5 89] 
#[ 0 134 5 197] 
#[ 0 218 0 222] 
#[ 1 110 7 73] 
#[ 1 126 1 130 1 134 1 138 1 142] 
#[ 1 134 1 138 1 142] 
#[ 1 130 1 134 1 138 1 142] 
#[ 0 134 0 138 5 197] 
#[ 0 210 8 109] 
#[ 0 210 8 117] 
#[ 0 134 0 138 1 22] 
#[ 2 14 2 18] 
#[ 2 30 4 229] 
#[ 2 46 9 141] 
#[ 2 54 2 58] 
#[ 2 54 9 177] 
#[ 2 174 7 73] 
#[ 0 134 3 18] 
#[ 0 134 0 138 3 18] 
#[ 0 186 0 194] 
#[ 3 46 12 25] 
#[ 0 190 3 206] 
#[ 0 194 3 206] 
#[ 4 2 12 193] 
#[ 0 134 14 69] 
#[ 4 229 5 138] 
#[ 5 158 14 249] 
#[ 4 229 6 102] 
#[ 1 30 1 234] 
#[ 1 234 6 21] 
#[ 1 234 6 25] 
#[ 1 234 6 29] 
#[ 1 234 6 33] 
#[ 1 234 6 37] 
#[ 1 234 6 41] 
#[ 1 234 6 45] 
#[ 1 234 6 49] 
#[ 1 234 6 53] 
#[ 1 234 6 57] 
#[ 1 234 6 61] 
#[ 0 141 7 22] 
#[ 0 158 0 166] 
#[ 7 198 7 202] 
#[ 7 206 7 210 7 214 7 218] 
#[ 7 198 7 202 18 33] 
#[ 7 202 18 37] 
#[ 0 50 0 54 0 58 7 210] 
#[ 7 198 18 73] 
#[ 7 206 7 210 7 214 7 218 7 230] 
#[ 7 198 18 225] 
#[ 1 126 1 130 1 134 1 138 1 142 8 78 8 82 8 86 8 90 8 94 8 98] 
#[ 8 78 8 82 8 86 8 98] 
#[ 1 142 8 78 8 86 8 94 8 98] 
#[ 8 78 8 82 8 94 8 98] 
#[ 1 142 8 78 8 82 8 94 8 98] 
#[ 1 134 1 138 1 142 8 98] 
#[ 1 130 1 134 1 138 1 142 8 78 8 82 8 86 8 94 8 98] 
#[ 8 78 8 86 8 98 8 102] 
#[ 1 142 8 78 8 86 8 94 8 98 8 102] 
#[ 7 202 8 78 8 94 8 98 8 102 19 57] 
#[ 8 78 8 94 8 98] 
#[ 1 142 8 78 8 94 8 98] 
#[ 1 142 8 98] 
#[ 1 142 7 198 8 78 8 86 8 94 8 98 8 102 19 61] 
#[ 7 198 7 202 8 78 8 86 8 98 8 102] 
#[ 8 78 8 82 8 98 8 102] 
#[ 8 78 8 94 8 98 8 102 8 106] 
#[ 8 78 8 82 8 94 8 98 8 102 8 110] 
#[ 8 78 8 82 8 94 8 98 8 110] 
#[ 8 78 8 82 8 94 8 98 8 102 8 106 8 110] 
#[ 8 78 8 82 8 98 8 102 8 110] 
#[ 8 78 8 82 8 98] 
#[ 1 126 1 130 1 134 1 138 1 142 8 78 8 82 8 86 8 90 8 94 8 98 8 110] 
#[ 1 130 1 134 1 138 1 142 8 78 8 82 8 86 8 94 8 98 8 110] 
#[ 8 78 8 82 8 86 8 98 8 110] 
#[ 8 78 8 82 8 86 8 98 8 102] 
#[ 1 142 8 78 8 86 8 94 8 98 8 102 8 114] 
#[ 8 78 8 82 8 94 8 98 8 102 8 110 8 114] 
#[ 1 130 1 134 1 138 1 142 8 78 8 82 8 86 8 94 8 98 8 102 8 110] 
#[ 8 78 8 82 8 86 8 98 8 102 8 110] 
#[ 1 126 1 130 1 134 1 138 1 142 8 78 8 82 8 86 8 90 8 94 8 98 8 102 8 110] 
#[ 7 202 20 193] 
#[ 7 198 20 201] 
#[ 1 126 1 130 1 134 1 138 1 142 8 78 8 82 8 86 8 90 8 94 8 98 8 198] 
#[ 1 130 1 134 1 138 1 142 8 78 8 82 8 86 8 94 8 98 8 198] 
#[ 1 126 1 130 1 134 1 138 1 142 8 78 8 82 8 86 8 90 8 94 8 98 8 110 8 198] 
#[ 1 130 1 134 1 138 1 142 8 78 8 82 8 86 8 94 8 98 8 110 8 198] 
#[ 1 130 1 134 1 138 1 142 8 78 8 82 8 86 8 94 8 98 8 102 8 110 8 198] 
#[ 1 126 1 130 1 134 1 138 1 142 8 78 8 82 8 86 8 90 8 94 8 98 8 102 8 110 8 198] 
#[ 7 202 8 246] 
#[ 4 82 21 205] 
#[ 5 197 9 90] 
#[ 9 170 9 174]
	).
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForStartInterpolatedString1: nodes [
	^ #interpolatedString
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForStartInterpolatedVerbatimString1: nodes [
	^ #interpolatedVerbatimString
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFor_attribute_arguments1: nodes [
	| result |
	result := Array new: 4.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFor_attribute_target_specifier1: nodes [
	| result |
	result := Array new: 2.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFor_exception_specifier1: nodes [
	| result |
	result := Array new: 4.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFor_explicit_anonymous_function_paramenter_list1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFor_extern_alias_directives1: nodes [
	| result |
	result := OrderedCollection new: 2.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFor_extern_alias_directives2: nodes [
	| result |
	result := nodes at: 1.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFor_generic_dimension_specifier1: nodes [
	| result |
	result := Array new: 3.
	result at: 2 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFor_local_variable_declarator_name1: nodes [
	| result |
	result := CSSimpleNameNode new.
	result identifierToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFor_query_body_clauses1: nodes [
	| result |
	result := Array new: 19.
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
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFor_query_continuation1: nodes [
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
CSharpParser >> reduceActionFor_struct_interfaces1: nodes [
	| result |
	result := Array new: 3.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForaccessor_declarations2: nodes [
	| result |
	result := Array new: 2.
	result at: 2 put: (nodes at: 1).
	result at: 1 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForaccessor_modifiers5: nodes [
	| result |
	result := OrderedCollection new: 2.
	self add: (nodes at: 1) to: result.
	self add: (nodes at: 2) to: result.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForadd_accessor_declaration1: nodes [
	| result |
	result := CSAddAccessorDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result addToken: (nodes at: 2).
	result block: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForanonymous_method_expression1: nodes [
	| result |
	result := CSAnonymousMethodExpressionNode new.
	result delegateToken: (nodes at: 1).
	result signature: (nodes at: 2).
	result block: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForanonymous_object_creation_expression1: nodes [
	| result |
	result := CSAnonymousObjectCreationExpressionNode new.
	result newToken: (nodes at: 1).
	result leftBraceToken: ((nodes at: 2) at: 1).
	result addNodes: ((nodes at: 2) at: 2) to: result declarators.
	result addTokens: ((nodes at: 2) at: 3) to: result commaTokens.
	result rightBraceToken: ((nodes at: 2) at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForanonymous_object_initializer1: nodes [
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
CSharpParser >> reduceActionForanonymous_object_initializer2: nodes [
	| result |
	result := Array new: 4.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	self add: (nodes at: 3) to: (result at: 3).
	result at: 4 put: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForargument1: nodes [
	| result |
	result := CSArgumentNode new.
	result identifier: ((nodes at: 1) at: 1).
	result colonToken: ((nodes at: 1) at: 2).
	result expression: ((nodes at: 2) at: 1).
	result refToken: ((nodes at: 2) at: 2).
	result outToken: ((nodes at: 2) at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForargument_value1: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForargument_value2: nodes [
	| result |
	result := Array new: 3.
	result at: 2 put: (nodes at: 1).
	result at: 1 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForargument_value3: nodes [
	| result |
	result := Array new: 3.
	result at: 3 put: (nodes at: 1).
	result at: 1 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForarray_creation_expression1: nodes [
	| result |
	result := CSArrayCreationExpressionNode new.
	result newToken: (nodes at: 1).
	result type: (nodes at: 2).
	result leftBracketToken: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result expressions.
	result addTokens: ((nodes at: 4) at: 2) to: result commaTokens.
	result rightBracketToken: (nodes at: 5).
	result addNodes: (nodes at: 6) to: result rankSpecifiers.
	result arrayInitializer: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForarray_creation_expression2: nodes [
	| result |
	result := CSArrayCreationExpressionNode new.
	result newToken: (nodes at: 1).
	result type: (nodes at: 2).
	result arrayInitializer: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForarray_creation_expression3: nodes [
	| result |
	result := CSArrayCreationExpressionNode new.
	result newToken: (nodes at: 1).
	result addNode: (nodes at: 2) to: result rankSpecifiers.
	result arrayInitializer: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForarray_initializer1: nodes [
	| result |
	result := CSArrayInitializerNode new.
	result leftBraceToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result initializers.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	result rightBraceToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForarray_initializer2: nodes [
	| result |
	result := CSArrayInitializerNode new.
	result leftBraceToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result initializers.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	result addToken: (nodes at: 3) to: result commaTokens.
	result rightBraceToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForarray_type1: nodes [
	| result |
	result := CSArrayTypeNode new.
	result type: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result rankSpecifiers.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForassignment1: nodes [
	| result |
	result := CSAssignmentNode new.
	result lhs: (nodes at: 1).
	result operator: (nodes at: 2).
	result rhs: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForattribute1: nodes [
	| result |
	result := CSAttributeValueNode new.
	result name: (nodes at: 1).
	result leftParen: ((nodes at: 2) at: 1).
	result addNodes: ((nodes at: 2) at: 2) to: result arguments.
	result addTokens: ((nodes at: 2) at: 3) to: result commas.
	result rightParen: ((nodes at: 2) at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForattribute_arguments2: nodes [
	| result |
	result := Array new: 4.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	self add: (nodes at: 3) to: (result at: 3).
	self addAll: ((nodes at: 4) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 4) at: 2) to: (result at: 3).
	result at: 4 put: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForattribute_section1: nodes [
	| result |
	result := CSAttributeNode new.
	result leftBracket: (nodes at: 1).
	result target: ((nodes at: 2) at: 1).
	result colon: ((nodes at: 2) at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result attributeValues.
	result addTokens: ((nodes at: 3) at: 2) to: result commas.
	result rightBracket: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForattribute_section2: nodes [
	| result |
	result := CSAttributeNode new.
	result leftBracket: (nodes at: 1).
	result target: ((nodes at: 2) at: 1).
	result colon: ((nodes at: 2) at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result attributeValues.
	result addTokens: ((nodes at: 3) at: 2) to: result commas.
	result addToken: (nodes at: 4) to: result commas.
	result rightBracket: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForattribute_target_specifier1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForawait_expression1: nodes [
	| result |
	result := CSAwaitExpressionNode new.
	result awaitToken: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForbase_access1: nodes [
	| result |
	result := CSBaseAccessNode new.
	result baseToken: (nodes at: 1).
	result periodToken: (nodes at: 2).
	result identifier: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForbase_access2: nodes [
	| result |
	result := CSBaseAccessNode new.
	result baseToken: (nodes at: 1).
	result leftBracketToken: (nodes at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result expressions.
	result addTokens: ((nodes at: 3) at: 2) to: result commaTokens.
	result rightBracketToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForbinary_operator_declarator1: nodes [
	| result |
	result := Array new: 8.
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	result at: 4 put: (nodes at: 4).
	self add: (nodes at: 5) to: (result at: 5).
	self add: (nodes at: 6) to: (result at: 6).
	result at: 7 put: (nodes at: 7).
	self add: (nodes at: 8) to: (result at: 5).
	self add: (nodes at: 9) to: (result at: 6).
	result at: 8 put: (nodes at: 10).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForblock1: nodes [
	| result |
	result := CSBlockStatementNode new.
	result leftBraceToken: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result statements.
	result rightBraceToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForbreak_statement1: nodes [
	| result |
	result := CSBreakStatementNode new.
	result breakToken: (nodes at: 1).
	result semicolonToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForcast_expression1: nodes [
	| result |
	result := CSCastExpressionNode new.
	result leftParenToken: (nodes at: 1).
	result type: (nodes at: 2).
	result rightParenToken: (nodes at: 3).
	result expression: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForcatch_clause1: nodes [
	| result |
	result := CSCatchClauseNode new.
	result catchToken: (nodes at: 1).
	result leftParenToken: ((nodes at: 2) at: 1).
	result type: ((nodes at: 2) at: 2).
	result name: ((nodes at: 2) at: 3).
	result rightParenToken: ((nodes at: 2) at: 4).
	result filter: (nodes at: 3).
	result block: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForchecked_expression1: nodes [
	| result |
	result := CSCheckedExpressionNode new.
	result checkedToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result expression: (nodes at: 3).
	result rightParenToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForchecked_statement1: nodes [
	| result |
	result := CSCheckedStatementNode new.
	result checkedToken: (nodes at: 1).
	result block: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForclass_base1: nodes [
	| result |
	result := Array new: 4.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self add: (nodes at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForclass_base2: nodes [
	| result |
	result := Array new: 4.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForclass_base3: nodes [
	| result |
	result := Array new: 4.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self add: (nodes at: 2) to: (result at: 2).
	result at: 4 put: (nodes at: 3).
	self addAll: ((nodes at: 4) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 4) at: 2) to: (result at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForclass_declaration1: nodes [
	| result |
	result := CSClassDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result addTokens: (nodes at: 2) to: result modifiers.
	result partialToken: (nodes at: 3).
	result classToken: (nodes at: 4).
	result name: (nodes at: 5).
	result typeParameters: (nodes at: 6).
	result colonToken: ((nodes at: 7) at: 1).
	result addNodes: ((nodes at: 7) at: 2) to: result supertypes.
	result addTokens: ((nodes at: 7) at: 3) to: result commas.
	result commaToken: ((nodes at: 7) at: 4).
	result addNodes: (nodes at: 8) to: result constraintClauses.
	result leftBraceToken: ((nodes at: 9) at: 1).
	result addNodes: ((nodes at: 9) at: 2) to: result declarations.
	result rightBraceToken: ((nodes at: 9) at: 3).
	result semicolon: (nodes at: 10).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForcollection_initializer1: nodes [
	| result |
	result := CSCollectionInitializerNode new.
	result leftBraceToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result initializers.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	result rightBraceToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForcollection_initializer2: nodes [
	| result |
	result := CSCollectionInitializerNode new.
	result leftBraceToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result initializers.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	result addToken: (nodes at: 3) to: result commaTokens.
	result rightBraceToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForcompilation_unit1: nodes [
	| result |
	result := CSCompilationUnitNode new.
	result addNodes: (nodes at: 1) to: result directives.
	result addNodes: (nodes at: 2) to: result directives.
	result addNodes: (nodes at: 3) to: result _attributes.
	result addNodes: (nodes at: 4) to: result declarations.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForconditional_expression2: nodes [
	| result |
	result := CSConditionalExpressionNode new.
	result booleanExpression: (nodes at: 1).
	result questionMarkToken: (nodes at: 2).
	result trueExpression: (nodes at: 3).
	result colonToken: (nodes at: 4).
	result falseExpression: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForconst_declarator1: nodes [
	| result |
	result := CSConstDeclaratorNode new.
	result name: (nodes at: 1).
	result equalToken: (nodes at: 2).
	result expression: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForconstant_declaration1: nodes [
	| result |
	result := CSConstantDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result addTokens: (nodes at: 2) to: result modifiers.
	result constToken: (nodes at: 3).
	result type: (nodes at: 4).
	result addNodes: ((nodes at: 5) at: 1) to: result declarators.
	result addTokens: ((nodes at: 5) at: 2) to: result commaTokens.
	result semicolonToken: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForconstant_declarator1: nodes [
	| result |
	result := CSConstantDeclaratorNode new.
	result identifierToken: (nodes at: 1).
	result equalToken: (nodes at: 2).
	result expression: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForconstructor_constraint1: nodes [
	| result |
	result := CSConstructorConstraintNode new.
	result newToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result rightParenToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForconstructor_declaration1: nodes [
	| result |
	result := CSConstructorDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result addTokens: (nodes at: 2) to: result modifiers.
	result identifierToken: ((nodes at: 3) at: 1).
	result leftParenToken: ((nodes at: 3) at: 2).
	result addNodes: ((nodes at: 3) at: 3) to: result parameters.
	result addTokens: ((nodes at: 3) at: 4) to: result commas.
	result rightParenToken: ((nodes at: 3) at: 5).
	result initializer: ((nodes at: 3) at: 6).
	result block: ((nodes at: 4) at: 1).
	result semicolonToken: ((nodes at: 4) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForconstructor_declarator1: nodes [
	| result |
	result := Array new: 6.
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	self addAll: ((nodes at: 3) at: 1) to: (result at: 3).
	self addAll: ((nodes at: 3) at: 2) to: (result at: 4).
	result at: 5 put: (nodes at: 4).
	result at: 6 put: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForconstructor_initializer1: nodes [
	| result |
	result := CSConstructorInitializerNode new.
	result colonToken: (nodes at: 1).
	result baseToken: (nodes at: 2).
	result leftParenToken: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result arguments.
	result addTokens: ((nodes at: 4) at: 2) to: result commaTokens.
	result rightParenToken: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForconstructor_initializer2: nodes [
	| result |
	result := CSConstructorInitializerNode new.
	result colonToken: (nodes at: 1).
	result thisToken: (nodes at: 2).
	result leftParenToken: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result arguments.
	result addTokens: ((nodes at: 4) at: 2) to: result commaTokens.
	result rightParenToken: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForcontinue_statement1: nodes [
	| result |
	result := CSContinueStatementNode new.
	result continueToken: (nodes at: 1).
	result semicolonToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForconversion_operator_declarator1: nodes [
	| result |
	result := Array new: 8.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	result at: 4 put: (nodes at: 4).
	result at: 5 put: (nodes at: 5).
	result at: 6 put: (nodes at: 6).
	result at: 7 put: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForconversion_operator_declarator2: nodes [
	| result |
	result := Array new: 8.
	result at: 8 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	result at: 4 put: (nodes at: 4).
	result at: 5 put: (nodes at: 5).
	result at: 6 put: (nodes at: 6).
	result at: 7 put: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFordeclaration_statement1: nodes [
	| result |
	result := CSDeclarationStatementNode new.
	result declaration: (nodes at: 1).
	result semicolonToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFordefault_value_expression1: nodes [
	| result |
	result := CSDefaultValueExpressionNode new.
	result defaultToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result type: (nodes at: 3).
	result rightParenToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFordelegate_creation_expression1: nodes [
	| result |
	result := CSDelegateCreationExpressionNode new.
	result newToken: (nodes at: 1).
	result type: (nodes at: 2).
	result leftParenToken: (nodes at: 3).
	result expression: (nodes at: 4).
	result rightParenToken: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFordelegate_declaration1: nodes [
	| result |
	result := CSDelegateDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result addTokens: (nodes at: 2) to: result modifiers.
	result delegateToken: (nodes at: 3).
	result type: (nodes at: 4).
	result name: (nodes at: 5).
	result typeParameters: (nodes at: 6).
	result leftParen: (nodes at: 7).
	result addNodes: ((nodes at: 8) at: 1) to: result parameters.
	result addTokens: ((nodes at: 8) at: 2) to: result commas.
	result rightParen: (nodes at: 9).
	result addNodes: (nodes at: 10) to: result constraintClauses.
	result semicolon: (nodes at: 11).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFordestructor_declaration1: nodes [
	| result |
	result := CSDestructorDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result addToken: (nodes at: 2) to: result modifiers.
	result addToken: (nodes at: 3) to: result modifiers.
	result tildeToken: (nodes at: 4).
	result identifierToken: (nodes at: 5).
	result leftParenToken: (nodes at: 6).
	result rightParenToken: (nodes at: 7).
	result body: (nodes at: 8).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFordo_statement1: nodes [
	| result |
	result := CSDoStatementNode new.
	result doToken: (nodes at: 1).
	result statement: (nodes at: 2).
	result whileToken: (nodes at: 3).
	result leftParenToken: (nodes at: 4).
	result expression: (nodes at: 5).
	result rightParenToken: (nodes at: 6).
	result semicolonToken: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForelement_access1: nodes [
	| result |
	result := CSElementAccessNode new.
	result baseExpression: (nodes at: 1).
	result leftBracketToken: (nodes at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result expressions.
	result addTokens: ((nodes at: 3) at: 2) to: result commaTokens.
	result rightBracketToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForelement_initializer1: nodes [
	| result |
	result := CSElementInitializerNode new.
	result addNode: (nodes at: 1) to: result expressions.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForelement_initializer2: nodes [
	| result |
	result := CSElementInitializerNode new.
	result leftBraceToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result expressions.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	result rightBraceToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForempty_statement1: nodes [
	| result |
	result := CSEmptyStatementNode new.
	result semicolonToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForenum_declaration1: nodes [
	| result |
	result := CSEnumDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result addTokens: (nodes at: 2) to: result modifiers.
	result enumToken: (nodes at: 3).
	result name: (nodes at: 4).
	result colonToken: ((nodes at: 5) at: 1).
	result type: ((nodes at: 5) at: 2).
	result leftBrace: ((nodes at: 6) at: 1).
	result addNodes: ((nodes at: 6) at: 2) to: result declarations.
	result addTokens: ((nodes at: 6) at: 3) to: result commas.
	result rightBrace: ((nodes at: 6) at: 4).
	result semicolon: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForenum_member_declaration1: nodes [
	| result |
	result := CSEnumDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result name: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForenum_member_declaration2: nodes [
	| result |
	result := CSEnumDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result name: (nodes at: 2).
	result equal: (nodes at: 3).
	result value: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForevent_declaration1: nodes [
	| result |
	result := CSEventDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result addTokens: (nodes at: 2) to: result modifiers.
	result eventToken: (nodes at: 3).
	result type: (nodes at: 4).
	result addNodes: ((nodes at: 5) at: 1) to: result declarators.
	result addTokens: ((nodes at: 5) at: 2) to: result commaTokens.
	result semicolonToken: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForevent_declaration2: nodes [
	| result |
	result := CSEventDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result addTokens: (nodes at: 2) to: result modifiers.
	result eventToken: (nodes at: 3).
	result type: (nodes at: 4).
	result name: ((nodes at: 5) at: 1).
	result interface: ((nodes at: 5) at: 2).
	result periodToken: ((nodes at: 5) at: 3).
	result leftBraceToken: (nodes at: 6).
	result addDeclaration: ((nodes at: 7) at: 1).
	result removeDeclaration: ((nodes at: 7) at: 2).
	result rightBraceToken: (nodes at: 8).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForexception_filter1: nodes [
	| result |
	result := CSExceptionFilterNode new.
	result whenToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result expression: (nodes at: 3).
	result rightParenToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForexplicit_anonymous_function_paramenter1: nodes [
	| result |
	result := CSAnonymousFunctionParameterNode new.
	result modifier: (nodes at: 1).
	result type: (nodes at: 2).
	result name: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForexplicit_anonymous_function_signature1: nodes [
	| result |
	result := CSExplicitAnonymousFunctionSignatureNode new.
	result leftParenToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result parameters.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	result rightParenToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForexpression_statement1: nodes [
	| result |
	result := CSExpressionStatementNode new.
	result expression: (nodes at: 1).
	result semicolonToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForextern_alias_directive1: nodes [
	| result |
	result := CSExternAliasDirectiveNode new.
	result externToken: (nodes at: 1).
	result aliasToken: (nodes at: 2).
	result identifierToken: (nodes at: 3).
	result semicolonToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForextern_alias_directives1: nodes [
	| result |
	result := OrderedCollection new: 2.
	self add: (nodes at: 1) to: result.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForextern_alias_directives2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: result.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForfield_declaration1: nodes [
	| result |
	result := CSFieldDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result addTokens: (nodes at: 2) to: result modifiers.
	result type: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result declarators.
	result addTokens: ((nodes at: 4) at: 2) to: result commaTokens.
	result semicolonToken: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForfinally_clause1: nodes [
	| result |
	result := CSFinallyClauseNode new.
	result finallyToken: (nodes at: 1).
	result block: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForfixed_parameter1: nodes [
	| result |
	result := CSFixedParameterNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result modifier: (nodes at: 2).
	result type: (nodes at: 3).
	result name: (nodes at: 4).
	result equalToken: ((nodes at: 5) at: 1).
	result expression: ((nodes at: 5) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForfixed_pointer_declarator1: nodes [
	| result |
	result := CSFixedPointerDeclaratorNode new.
	result identifierToken: (nodes at: 1).
	result equalToken: (nodes at: 2).
	result andToken: ((nodes at: 3) at: 1).
	result expression: ((nodes at: 3) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForfixed_size_buffer_declaration1: nodes [
	| result |
	result := CSFixedSizeBufferDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result addTokens: (nodes at: 2) to: result modifiers.
	result fixedToken: (nodes at: 3).
	result type: (nodes at: 4).
	result addNodes: (nodes at: 5) to: result declarators.
	result semicolonToken: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForfixed_size_buffer_declarator1: nodes [
	| result |
	result := CSFixedSizeBufferDeclaratorNode new.
	result name: (nodes at: 1).
	result leftBracketToken: (nodes at: 2).
	result expression: (nodes at: 3).
	result rightBracketToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForfixed_statement1: nodes [
	| result |
	result := CSFixedStatementNode new.
	result fixedToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result type: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result declarators.
	result addTokens: ((nodes at: 4) at: 2) to: result commaTokens.
	result rightParenToken: (nodes at: 5).
	result statement: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForfor_initializer2: nodes [
	| result |
	result := CSStatementListNode new.
	result addNodes: ((nodes at: 1) at: 1) to: result expressions.
	result addTokens: ((nodes at: 1) at: 2) to: result commaTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForfor_statement1: nodes [
	| result |
	result := CSForStatementNode new.
	result forToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result initializer: (nodes at: 3).
	result addToken: (nodes at: 4) to: result semicolonTokens.
	result condition: (nodes at: 5).
	result addToken: (nodes at: 6) to: result semicolonTokens.
	result iterator: (nodes at: 7).
	result rightParenToken: (nodes at: 8).
	result statement: (nodes at: 9).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForforeach_statement1: nodes [
	| result |
	result := CSForeachStatementNode new.
	result foreachToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result type: (nodes at: 3).
	result name: (nodes at: 4).
	result inToken: (nodes at: 5).
	result expression: (nodes at: 6).
	result rightParenToken: (nodes at: 7).
	result statement: (nodes at: 8).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForfrom_clause1: nodes [
	| result |
	result := Array new: 5.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	result at: 4 put: (nodes at: 4).
	result at: 5 put: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForgeneric_dimension_specifier1: nodes [
	| result |
	result := Array new: 3.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: (nodes at: 2) to: (result at: 2).
	result at: 3 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForget_accessor_declaration1: nodes [
	| result |
	result := CSGetAccessorDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result addTokens: (nodes at: 2) to: result modifiers.
	result getToken: (nodes at: 3).
	result body: ((nodes at: 4) at: 1).
	result semicolonToken: ((nodes at: 4) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForgoto_statement1: nodes [
	| result |
	result := CSGotoStatementNode new.
	result gotoToken: (nodes at: 1).
	result identifierToken: (nodes at: 2).
	result semicolonToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForgoto_statement2: nodes [
	| result |
	result := CSGotoStatementNode new.
	result gotoToken: (nodes at: 1).
	result caseToken: (nodes at: 2).
	result expression: (nodes at: 3).
	result semicolonToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForgoto_statement3: nodes [
	| result |
	result := CSGotoStatementNode new.
	result gotoToken: (nodes at: 1).
	result defaultToken: (nodes at: 2).
	result semicolonToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForif_statement1: nodes [
	| result |
	result := CSIfStatementNode new.
	result ifToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result expression: (nodes at: 3).
	result rightParenToken: (nodes at: 4).
	result thenStatement: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForif_statement2: nodes [
	| result |
	result := CSIfStatementNode new.
	result ifToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result expression: (nodes at: 3).
	result rightParenToken: (nodes at: 4).
	result thenStatement: (nodes at: 5).
	result elseToken: (nodes at: 6).
	result elseStatement: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForimplicit_anonymous_function_signature1: nodes [
	| result |
	result := CSImplicitAnonymousFunctionSignatureNode new.
	result leftParenToken: (nodes at: 1).
	result addTokens: ((nodes at: 2) at: 1) to: result names.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	result rightParenToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForimplicit_anonymous_function_signature2: nodes [
	| result |
	result := CSImplicitAnonymousFunctionSignatureNode new.
	result addToken: (nodes at: 1) to: result names.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForindexer_body1: nodes [
	| result |
	result := Array new: 7.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: ((nodes at: 2) at: 1).
	result at: 3 put: ((nodes at: 2) at: 2).
	result at: 4 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForindexer_body2: nodes [
	| result |
	result := Array new: 7.
	result at: 5 put: (nodes at: 1).
	result at: 6 put: (nodes at: 2).
	result at: 7 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForindexer_declaration1: nodes [
	| result |
	result := CSIndexerDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result addTokens: (nodes at: 2) to: result modifiers.
	result returnType: ((nodes at: 3) at: 1).
	result thisToken: ((nodes at: 3) at: 2).
	result leftBracketToken: ((nodes at: 3) at: 3).
	result addNodes: ((nodes at: 3) at: 4) to: result parameters.
	result addTokens: ((nodes at: 3) at: 5) to: result commas.
	result rightBracketToken: ((nodes at: 3) at: 6).
	result type: ((nodes at: 3) at: 7).
	result periodToken: ((nodes at: 3) at: 8).
	result leftBraceToken: ((nodes at: 4) at: 1).
	result getAccessor: ((nodes at: 4) at: 2).
	result setAccessor: ((nodes at: 4) at: 3).
	result rightBraceToken: ((nodes at: 4) at: 4).
	result equalGreaterThanToken: ((nodes at: 4) at: 5).
	result expression: ((nodes at: 4) at: 6).
	result semicolonToken: ((nodes at: 4) at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForindexer_declarator1: nodes [
	| result |
	result := Array new: 8.
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	self addAll: ((nodes at: 4) at: 1) to: (result at: 4).
	self addAll: ((nodes at: 4) at: 2) to: (result at: 5).
	result at: 6 put: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForindexer_declarator2: nodes [
	| result |
	result := Array new: 8.
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	result at: 7 put: (nodes at: 2).
	result at: 8 put: (nodes at: 3).
	result at: 2 put: (nodes at: 4).
	result at: 3 put: (nodes at: 5).
	self addAll: ((nodes at: 6) at: 1) to: (result at: 4).
	self addAll: ((nodes at: 6) at: 2) to: (result at: 5).
	result at: 6 put: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForinitializer_target1: nodes [
	| result |
	result := Array new: 5.
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForinitializer_target2: nodes [
	| result |
	result := Array new: 5.
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 2 put: (nodes at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 4).
	result at: 5 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForinterface_declaration1: nodes [
	| result |
	result := CSInterfaceDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result addTokens: (nodes at: 2) to: result modifiers.
	result partialToken: (nodes at: 3).
	result interfaceToken: (nodes at: 4).
	result name: (nodes at: 5).
	result typeParameters: (nodes at: 6).
	result colon: ((nodes at: 7) at: 1).
	result addNodes: ((nodes at: 7) at: 2) to: result supertypes.
	result addTokens: ((nodes at: 7) at: 3) to: result commas.
	result addNodes: (nodes at: 8) to: result constraintClauses.
	result leftBrace: ((nodes at: 9) at: 1).
	result addNodes: ((nodes at: 9) at: 2) to: result declarations.
	result rightBrace: ((nodes at: 9) at: 3).
	result semicolon: (nodes at: 10).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForinterface_event_declaration1: nodes [
	| result |
	result := CSInterfaceEventDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result modifier: (nodes at: 2).
	result eventToken: (nodes at: 3).
	result type: (nodes at: 4).
	result name: (nodes at: 5).
	result semicolon: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForinterface_get_accessor1: nodes [
	| result |
	result := CSInterfacePropertyAccessorNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result accessorType: (nodes at: 2).
	result semicolon: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForinterface_indexer_declaration1: nodes [
	| result |
	result := CSInterfaceIndexerDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result modifier: (nodes at: 2).
	result type: (nodes at: 3).
	result thisToken: (nodes at: 4).
	result leftBracket: (nodes at: 5).
	result addNodes: ((nodes at: 6) at: 1) to: result parameters.
	result addTokens: ((nodes at: 6) at: 2) to: result commas.
	result rightBracket: (nodes at: 7).
	result leftBrace: (nodes at: 8).
	result getAccessor: ((nodes at: 9) at: 1).
	result setAccessor: ((nodes at: 9) at: 2).
	result rightBrace: (nodes at: 10).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForinterface_method_declaration1: nodes [
	| result |
	result := CSInterfaceMethodDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result modifier: (nodes at: 2).
	result type: (nodes at: 3).
	result name: (nodes at: 4).
	result typeParameters: (nodes at: 5).
	result leftParen: (nodes at: 6).
	result addNodes: ((nodes at: 7) at: 1) to: result parameters.
	result addTokens: ((nodes at: 7) at: 2) to: result commas.
	result rightParen: (nodes at: 8).
	result addNodes: (nodes at: 9) to: result constraintClauses.
	result semicolon: (nodes at: 10).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForinterface_property_declaration1: nodes [
	| result |
	result := CSInterfacePropertyDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result modifier: (nodes at: 2).
	result type: (nodes at: 3).
	result name: (nodes at: 4).
	result leftBrace: (nodes at: 5).
	result getAccessor: ((nodes at: 6) at: 1).
	result setAccessor: ((nodes at: 6) at: 2).
	result rightBrace: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForinterpolated_regular_string1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForinterpolated_regular_string2: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	self add: (nodes at: 2) to: (result at: 1).
	self addAll: ((nodes at: 3) at: 1) to: (result at: 2).
	self add: ((nodes at: 3) at: 2) to: (result at: 1).
	self add: (nodes at: 4) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForinterpolated_regular_string_body1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForinterpolated_regular_string_body2: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	result at: 2 put: (nodes at: 2).
	self add: (nodes at: 3) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForinterpolated_string_expression1: nodes [
	| result |
	result := CSInterpolatedStringExpressionNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result stringParts.
	result addNodes: ((nodes at: 1) at: 2) to: result interpolations.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForinterpolation1: nodes [
	| result |
	result := CSInterpolationNode new.
	result expression: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForinterpolation2: nodes [
	| result |
	result := CSInterpolationNode new.
	result expression: (nodes at: 1).
	result commaToken: (nodes at: 2).
	result constant: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForinvocation_expression1: nodes [
	| result |
	result := CSInvocationExpressionNode new.
	result expression: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result arguments.
	result addTokens: ((nodes at: 3) at: 2) to: result commaTokens.
	result rightParenToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForjoin_clause1: nodes [
	| result |
	result := Array new: 9.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	result at: 4 put: (nodes at: 4).
	result at: 5 put: (nodes at: 5).
	result at: 6 put: (nodes at: 6).
	result at: 7 put: (nodes at: 7).
	result at: 8 put: (nodes at: 8).
	result at: 9 put: (nodes at: 9).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForjoin_into_clause1: nodes [
	| result |
	result := Array new: 10.
	result at: 3 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	self add: (nodes at: 3) to: (result at: 3).
	result at: 4 put: (nodes at: 4).
	result at: 5 put: (nodes at: 5).
	result at: 6 put: (nodes at: 6).
	result at: 7 put: (nodes at: 7).
	result at: 8 put: (nodes at: 8).
	result at: 9 put: (nodes at: 9).
	result at: 10 put: (nodes at: 10).
	self add: (nodes at: 11) to: (result at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForlabeled_statement1: nodes [
	| result |
	result := CSLabeledStatementNode new.
	result identifierToken: (nodes at: 1).
	result colonToken: (nodes at: 2).
	result statement: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForlambda_expression1: nodes [
	| result |
	result := CSLambdaExpressionNode new.
	result signature: (nodes at: 1).
	result equalGreaterThanToken: (nodes at: 2).
	result body: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForlet_clause1: nodes [
	| result |
	result := Array new: 4.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	result at: 4 put: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForliteral2: nodes [
	| result |
	result := CSLiteralExpressionNode new.
	result token: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForlocal_constant_declaration1: nodes [
	| result |
	result := CSLocalConstantDeclarationNode new.
	result constToken: (nodes at: 1).
	result type: (nodes at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result declarators.
	result addTokens: ((nodes at: 3) at: 2) to: result commaTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForlocal_variable_declaration1: nodes [
	| result |
	result := CSLocalVariableDeclarationNode new.
	result type: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result declarators.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForlocal_variable_declarator1: nodes [
	| result |
	result := CSLocalVariableDeclaratorNode new.
	result name: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForlocal_variable_declarator2: nodes [
	| result |
	result := CSLocalVariableDeclaratorNode new.
	result name: (nodes at: 1).
	result equalToken: (nodes at: 2).
	result expression: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForlocal_variable_declarators2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 2).
	self add: (nodes at: 3) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForlocal_variable_type2: nodes [
	| result |
	result := CSVarTypeNode new.
	result varToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForlock_statement1: nodes [
	| result |
	result := CSLockStatementNode new.
	result lockToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result expression: (nodes at: 3).
	result rightParenToken: (nodes at: 4).
	result statement: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFormember_access1: nodes [
	| result |
	result := CSMemberAccessNode new.
	result expression: (nodes at: 1).
	result periodToken: (nodes at: 2).
	result identifier: (nodes at: 3).
	result typeArguments: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFormember_access3: nodes [
	| result |
	result := CSMemberAccessNode new.
	result expression: (nodes at: 1).
	result periodToken: (nodes at: 2).
	result identifier: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFormember_declarator1: nodes [
	| result |
	result := CSMemberDeclaratorNode new.
	result name: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFormember_declarator2: nodes [
	| result |
	result := CSMemberDeclaratorNode new.
	result access: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFormember_declarator5: nodes [
	| result |
	result := CSMemberDeclaratorNode new.
	result identifierToken: (nodes at: 1).
	result equalToken: (nodes at: 2).
	result value: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFormember_initializer1: nodes [
	| result |
	result := CSMemberInitializerNode new.
	result identifier: ((nodes at: 1) at: 1).
	result leftBracketToken: ((nodes at: 1) at: 2).
	result addNodes: ((nodes at: 1) at: 3) to: result arguments.
	result addTokens: ((nodes at: 1) at: 4) to: result commaTokens.
	result rightBracketToken: ((nodes at: 1) at: 5).
	result equalToken: (nodes at: 2).
	result value: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFormember_name2: nodes [
	| result |
	result := Array new: 3.
	result at: 2 put: (nodes at: 1).
	result at: 3 put: (nodes at: 2).
	result at: 1 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFormethod_body1: nodes [
	| result |
	result := CSMethodBodyNode new.
	result block: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFormethod_body2: nodes [
	| result |
	result := CSMethodBodyNode new.
	result equalGreaterThanToken: (nodes at: 1).
	result expression: (nodes at: 2).
	result semicolonToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFormethod_body3: nodes [
	| result |
	result := CSMethodBodyNode new.
	result semicolonToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFormethod_declaration1: nodes [
	| result |
	result := CSMethodDeclarationNode new.
	result header: (nodes at: 1).
	result body: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFormethod_header1: nodes [
	| result |
	result := CSMethodHeaderNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result addTokens: (nodes at: 2) to: result modifiers.
	result partialToken: (nodes at: 3).
	result returnType: (nodes at: 4).
	result name: ((nodes at: 5) at: 1).
	result interface: ((nodes at: 5) at: 2).
	result periodToken: ((nodes at: 5) at: 3).
	result typeParameters: (nodes at: 6).
	result leftParenToken: (nodes at: 7).
	result addNodes: ((nodes at: 8) at: 1) to: result parameters.
	result addTokens: ((nodes at: 8) at: 2) to: result commas.
	result rightParenToken: (nodes at: 9).
	result addNodes: (nodes at: 10) to: result constraintClauses.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFormultiplicative_expression3: nodes [
	| result |
	result := CSBinaryExpressionNode new.
	result left: (nodes at: 1).
	result operator: (nodes at: 2).
	result right: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFornamed_argument1: nodes [
	| result |
	result := CSNamedArgumentNode new.
	result name: (nodes at: 1).
	result equal: (nodes at: 2).
	result value: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFornamed_entity2: nodes [
	| result |
	result := CSNamedEntityNode new.
	result target: (nodes at: 1).
	result periodToken: (nodes at: 2).
	result identifierToken: (nodes at: 3).
	result typeArguments: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFornamed_entity_target2: nodes [
	| result |
	result := CSBaseExpressionNode new.
	result baseToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFornameof_expression1: nodes [
	| result |
	result := CSNameofExpressionNode new.
	result nameofToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result name: (nodes at: 3).
	result rightParenToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFornamespace_body1: nodes [
	| result |
	result := Array new: 4.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: (nodes at: 2) to: (result at: 2).
	self addAll: (nodes at: 3) to: (result at: 2).
	self addAll: (nodes at: 4) to: (result at: 3).
	result at: 4 put: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFornamespace_declaration1: nodes [
	| result |
	result := CSNamespaceDeclarationNode new.
	result namespaceToken: (nodes at: 1).
	result identifier: (nodes at: 2).
	result leftBraceToken: ((nodes at: 3) at: 1).
	result addNodes: ((nodes at: 3) at: 2) to: result directives.
	result addNodes: ((nodes at: 3) at: 3) to: result declarations.
	result rightBraceToken: ((nodes at: 3) at: 4).
	result semicolon: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFornamespace_member_declaration2: nodes [
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFornamespace_or_type_name1: nodes [
	| result |
	result := CSTypeNameNode new.
	result name: (nodes at: 1).
	result typeArguments: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFornamespace_or_type_name2: nodes [
	| result |
	result := CSTypeNameNode new.
	result namespace: (nodes at: 1).
	result periodToken: (nodes at: 2).
	result name: (nodes at: 3).
	result typeArguments: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFornull_conditional_expression1: nodes [
	| result |
	result := CSNullConditionalExpressionNode new.
	result expression: (nodes at: 1).
	result nullConditionalOperation: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFornull_conditional_invocation_expression1: nodes [
	| result |
	result := CSNullConditionalInvocationExpressionNode new.
	result expression: (nodes at: 1).
	result baseOperations: (nodes at: 2).
	result leftParenToken: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result arguments.
	result addTokens: ((nodes at: 4) at: 2) to: result commaTokens.
	result rightParenToken: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFornull_conditional_member_access1: nodes [
	| result |
	result := CSNullConditionalMemberAccessNode new.
	result expression: (nodes at: 1).
	result baseOperations: (nodes at: 2).
	result questionMarkToken: (nodes at: 3).
	result periodToken: (nodes at: 4).
	result identifierToken: (nodes at: 5).
	result typeArguments: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFornull_conditional_member_access2: nodes [
	| result |
	result := CSNullConditionalMemberAccessNode new.
	result expression: (nodes at: 1).
	result baseOperations: (nodes at: 2).
	result periodToken: (nodes at: 3).
	result identifierToken: (nodes at: 4).
	result typeArguments: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFornull_conditional_operations1: nodes [
	| result |
	result := CSNullConditionalMemberAccessNode new.
	result baseOperations: (nodes at: 1).
	result questionMarkToken: (nodes at: 2).
	result periodToken: (nodes at: 3).
	result identifierToken: (nodes at: 4).
	result typeArguments: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFornull_conditional_operations2: nodes [
	| result |
	result := CSNullConditionalElementAccessNode new.
	result baseOperations: (nodes at: 1).
	result questionMarkToken: (nodes at: 2).
	result leftBracketToken: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result arguments.
	result addTokens: ((nodes at: 4) at: 2) to: result commaTokens.
	result rightBracketToken: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFornull_conditional_operations3: nodes [
	| result |
	result := CSNullConditionalMemberAccessNode new.
	result baseOperations: (nodes at: 1).
	result periodToken: (nodes at: 2).
	result identifierToken: (nodes at: 3).
	result typeArguments: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFornull_conditional_operations4: nodes [
	| result |
	result := CSNullConditionalElementAccessNode new.
	result baseOperations: (nodes at: 1).
	result leftBracketToken: (nodes at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result arguments.
	result addTokens: ((nodes at: 3) at: 2) to: result commaTokens.
	result rightBracketToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFornull_conditional_operations5: nodes [
	| result |
	result := CSNullConditionalInvocationExpressionNode new.
	result baseOperations: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result arguments.
	result addTokens: ((nodes at: 3) at: 2) to: result commaTokens.
	result rightParenToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFornullable_type1: nodes [
	| result |
	result := CSNullableTypeNode new.
	result type: (nodes at: 1).
	result questionMarkToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForobject_creation_expression1: nodes [
	| result |
	result := CSObjectCreationExpressionNode new.
	result newToken: (nodes at: 1).
	result type: (nodes at: 2).
	result leftParenToken: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result arguments.
	result addTokens: ((nodes at: 4) at: 2) to: result commaTokens.
	result rightParenToken: (nodes at: 5).
	result initializer: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForobject_creation_expression2: nodes [
	| result |
	result := CSObjectCreationExpressionNode new.
	result newToken: (nodes at: 1).
	result type: (nodes at: 2).
	result initializer: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForobject_initializer1: nodes [
	| result |
	result := CSObjectInitializerNode new.
	result leftBraceToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result initializers.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	result rightBraceToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForobject_initializer2: nodes [
	| result |
	result := CSObjectInitializerNode new.
	result leftBraceToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result initializers.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	result addToken: (nodes at: 3) to: result commaTokens.
	result rightBraceToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForoperator_declaration1: nodes [
	| result |
	result := CSOperatorDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result addTokens: (nodes at: 2) to: result modifiers.
	result returnType: ((nodes at: 3) at: 1).
	result operatorToken: ((nodes at: 3) at: 2).
	result operator: ((nodes at: 3) at: 3).
	result leftParenToken: ((nodes at: 3) at: 4).
	result addNodes: ((nodes at: 3) at: 5) to: result types.
	result addTokens: ((nodes at: 3) at: 6) to: result arguments.
	result rightParenToken: ((nodes at: 3) at: 7).
	result commaToken: ((nodes at: 3) at: 8).
	result implicitToken: ((nodes at: 3) at: 9).
	result explicitToken: ((nodes at: 3) at: 10).
	result body: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForoperator_declarator1: nodes [
	| result |
	result := Array new: 10.
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 1 put: ((nodes at: 1) at: 1).
	result at: 2 put: ((nodes at: 1) at: 2).
	result at: 3 put: ((nodes at: 1) at: 3).
	result at: 4 put: ((nodes at: 1) at: 4).
	self add: ((nodes at: 1) at: 5) to: (result at: 5).
	self add: ((nodes at: 1) at: 6) to: (result at: 6).
	result at: 7 put: ((nodes at: 1) at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForoperator_declarator2: nodes [
	| result |
	result := Array new: 10.
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 1 put: ((nodes at: 1) at: 1).
	result at: 2 put: ((nodes at: 1) at: 2).
	result at: 3 put: ((nodes at: 1) at: 3).
	result at: 4 put: ((nodes at: 1) at: 4).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 6) to: (result at: 6).
	result at: 8 put: ((nodes at: 1) at: 7).
	result at: 7 put: ((nodes at: 1) at: 8).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForoperator_declarator3: nodes [
	| result |
	result := Array new: 10.
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 9 put: ((nodes at: 1) at: 1).
	result at: 2 put: ((nodes at: 1) at: 2).
	result at: 1 put: ((nodes at: 1) at: 3).
	result at: 4 put: ((nodes at: 1) at: 4).
	self add: ((nodes at: 1) at: 5) to: (result at: 5).
	self add: ((nodes at: 1) at: 6) to: (result at: 6).
	result at: 7 put: ((nodes at: 1) at: 7).
	result at: 10 put: ((nodes at: 1) at: 8).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFororderby_clause1: nodes [
	| result |
	result := Array new: 5.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForordering1: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: ((nodes at: 2) at: 1).
	result at: 3 put: ((nodes at: 2) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForordering_direction1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForordering_direction2: nodes [
	| result |
	result := Array new: 2.
	result at: 2 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFororderings1: nodes [
	| result |
	result := Array new: 4.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	self add: ((nodes at: 1) at: 1) to: (result at: 1).
	self add: ((nodes at: 1) at: 2) to: (result at: 2).
	self add: ((nodes at: 1) at: 3) to: (result at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFororderings2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 4).
	self add: ((nodes at: 3) at: 1) to: (result at: 1).
	self add: ((nodes at: 3) at: 2) to: (result at: 2).
	self add: ((nodes at: 3) at: 3) to: (result at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForparameter_array1: nodes [
	| result |
	result := CSArrayParameterNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result paramsToken: (nodes at: 2).
	result type: (nodes at: 3).
	result name: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForparenthesized_expression1: nodes [
	| result |
	result := nodes at: 2.
	result addFirstToken: (nodes at: 1) to: result _leftParens.
	result addToken: (nodes at: 3) to: result _rightParens.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForpointer_element_access1: nodes [
	| result |
	result := CSPointerElementAccessNode new.
	result expression: (nodes at: 1).
	result leftBracketToken: (nodes at: 2).
	result indexExpression: (nodes at: 3).
	result rightBracketToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForpointer_member_access1: nodes [
	| result |
	result := CSPointerMemberAccessNode new.
	result expression: (nodes at: 1).
	result arrowToken: (nodes at: 2).
	result name: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForpointer_type2: nodes [
	| result |
	result := CSPointerTypeNode new.
	result type: (nodes at: 1).
	result timesToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForpost_decrement_expression1: nodes [
	| result |
	result := CSPostExpressionNode new.
	result expression: (nodes at: 1).
	result operator: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForpredefined_type4: nodes [
	| result |
	result := CSSimpleTypeNode new.
	result token: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForprimary_constraint1: nodes [
	| result |
	result := CSTypeConstraintNode new.
	result type: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForprimary_constraint2: nodes [
	| result |
	result := CSPrimaryConstraintNode new.
	result classToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForprimary_constraint3: nodes [
	| result |
	result := CSPrimaryConstraintNode new.
	result structToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForproperty_body1: nodes [
	| result |
	result := Array new: 8.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: ((nodes at: 2) at: 1).
	result at: 3 put: ((nodes at: 2) at: 2).
	result at: 4 put: (nodes at: 3).
	result at: 5 put: ((nodes at: 4) at: 1).
	result at: 6 put: ((nodes at: 4) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForproperty_body2: nodes [
	| result |
	result := Array new: 8.
	result at: 7 put: (nodes at: 1).
	result at: 8 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForproperty_declaration1: nodes [
	| result |
	result := CSPropertyDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result addTokens: (nodes at: 2) to: result modifiers.
	result type: (nodes at: 3).
	result name: ((nodes at: 4) at: 1).
	result interface: ((nodes at: 4) at: 2).
	result periodToken: ((nodes at: 4) at: 3).
	result leftBraceToken: ((nodes at: 5) at: 1).
	result getAccessor: ((nodes at: 5) at: 2).
	result setAccessor: ((nodes at: 5) at: 3).
	result rightBraceToken: ((nodes at: 5) at: 4).
	result equalToken: ((nodes at: 5) at: 5).
	result initializer: ((nodes at: 5) at: 6).
	result equalGreaterThanToken: ((nodes at: 5) at: 7).
	result expression: ((nodes at: 5) at: 8).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForqualified_alias_member1: nodes [
	| result |
	result := CSQualifiedAliasMemberNode new.
	result global: (nodes at: 1).
	result colonColonToken: (nodes at: 2).
	result name: (nodes at: 3).
	result typeArguments: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForqualified_alias_member_expression1: nodes [
	| result |
	result := CSTypeExpressionNode new.
	result type: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForqualified_identifier1: nodes [
	| result |
	result := CSQualifiedIdentifierNode new.
	result addToken: (nodes at: 1) to: result names.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForqualified_identifier2: nodes [
	| result |
	result := nodes at: 1.
	result addToken: (nodes at: 2) to: result periodTokens.
	result addToken: (nodes at: 3) to: result names.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForquery_body1: nodes [
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
	self addAll: ((nodes at: 1) at: 13) to: (result at: 13).
	self addAll: ((nodes at: 1) at: 14) to: (result at: 14).
	self addAll: ((nodes at: 1) at: 15) to: (result at: 15).
	self addAll: ((nodes at: 1) at: 16) to: (result at: 16).
	self addAll: ((nodes at: 1) at: 17) to: (result at: 17).
	self addAll: ((nodes at: 1) at: 18) to: (result at: 18).
	self addAll: ((nodes at: 1) at: 19) to: (result at: 19).
	self add: ((nodes at: 2) at: 1) to: (result at: 20).
	self add: ((nodes at: 2) at: 2) to: (result at: 5).
	self add: ((nodes at: 2) at: 3) to: (result at: 21).
	self add: ((nodes at: 2) at: 4) to: (result at: 22).
	self add: ((nodes at: 2) at: 5) to: (result at: 23).
	self add: ((nodes at: 2) at: 6) to: (result at: 24).
	self addAll: ((nodes at: 3) at: 1) to: (result at: 15).
	self addAll: ((nodes at: 3) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 3) at: 3) to: (result at: 1).
	self addAll: ((nodes at: 3) at: 4) to: (result at: 2).
	self addAll: ((nodes at: 3) at: 5) to: (result at: 4).
	self addAll: ((nodes at: 3) at: 6) to: (result at: 5).
	self addAll: ((nodes at: 3) at: 7) to: (result at: 6).
	self addAll: ((nodes at: 3) at: 8) to: (result at: 7).
	self addAll: ((nodes at: 3) at: 9) to: (result at: 8).
	self addAll: ((nodes at: 3) at: 10) to: (result at: 9).
	self addAll: ((nodes at: 3) at: 11) to: (result at: 10).
	self addAll: ((nodes at: 3) at: 12) to: (result at: 11).
	self addAll: ((nodes at: 3) at: 13) to: (result at: 12).
	self addAll: ((nodes at: 3) at: 14) to: (result at: 13).
	self addAll: ((nodes at: 3) at: 15) to: (result at: 14).
	self addAll: ((nodes at: 3) at: 16) to: (result at: 16).
	self addAll: ((nodes at: 3) at: 17) to: (result at: 17).
	self addAll: ((nodes at: 3) at: 18) to: (result at: 18).
	self addAll: ((nodes at: 3) at: 19) to: (result at: 19).
	self addAll: ((nodes at: 3) at: 20) to: (result at: 20).
	self addAll: ((nodes at: 3) at: 21) to: (result at: 21).
	self addAll: ((nodes at: 3) at: 22) to: (result at: 22).
	self addAll: ((nodes at: 3) at: 23) to: (result at: 23).
	self addAll: ((nodes at: 3) at: 24) to: (result at: 24).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForquery_body_clause1: nodes [
	| result |
	result := Array new: 19.
	result at: 3 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 1 put: ((nodes at: 1) at: 1).
	result at: 2 put: ((nodes at: 1) at: 2).
	self add: ((nodes at: 1) at: 3) to: (result at: 3).
	result at: 4 put: ((nodes at: 1) at: 4).
	self add: ((nodes at: 1) at: 5) to: (result at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForquery_body_clause2: nodes [
	| result |
	result := Array new: 19.
	result at: 3 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 6 put: ((nodes at: 1) at: 1).
	self add: ((nodes at: 1) at: 2) to: (result at: 3).
	result at: 7 put: ((nodes at: 1) at: 3).
	self add: ((nodes at: 1) at: 4) to: (result at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForquery_body_clause3: nodes [
	| result |
	result := Array new: 19.
	result at: 3 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 8 put: ((nodes at: 1) at: 1).
	self add: ((nodes at: 1) at: 2) to: (result at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForquery_body_clause4: nodes [
	| result |
	result := Array new: 19.
	result at: 3 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 9 put: ((nodes at: 1) at: 1).
	result at: 2 put: ((nodes at: 1) at: 2).
	self add: ((nodes at: 1) at: 3) to: (result at: 3).
	result at: 4 put: ((nodes at: 1) at: 4).
	result at: 10 put: ((nodes at: 1) at: 5).
	result at: 11 put: ((nodes at: 1) at: 6).
	result at: 12 put: ((nodes at: 1) at: 7).
	result at: 13 put: ((nodes at: 1) at: 8).
	result at: 14 put: ((nodes at: 1) at: 9).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForquery_body_clause5: nodes [
	| result |
	result := Array new: 19.
	result at: 3 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 9 put: ((nodes at: 1) at: 1).
	result at: 2 put: ((nodes at: 1) at: 2).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 3).
	result at: 4 put: ((nodes at: 1) at: 4).
	result at: 10 put: ((nodes at: 1) at: 5).
	result at: 11 put: ((nodes at: 1) at: 6).
	result at: 12 put: ((nodes at: 1) at: 7).
	result at: 13 put: ((nodes at: 1) at: 8).
	result at: 14 put: ((nodes at: 1) at: 9).
	result at: 15 put: ((nodes at: 1) at: 10).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForquery_body_clause6: nodes [
	| result |
	result := Array new: 19.
	result at: 3 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 16 put: ((nodes at: 1) at: 1).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 17).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 18).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 19).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForquery_body_clauses1: nodes [
	| result |
	result := Array new: 19.
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
	self add: ((nodes at: 1) at: 1) to: (result at: 1).
	self add: ((nodes at: 1) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 3).
	self add: ((nodes at: 1) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 1) at: 5) to: (result at: 5).
	self add: ((nodes at: 1) at: 6) to: (result at: 6).
	self add: ((nodes at: 1) at: 7) to: (result at: 7).
	self add: ((nodes at: 1) at: 8) to: (result at: 8).
	self add: ((nodes at: 1) at: 9) to: (result at: 9).
	self add: ((nodes at: 1) at: 10) to: (result at: 10).
	self add: ((nodes at: 1) at: 11) to: (result at: 11).
	self add: ((nodes at: 1) at: 12) to: (result at: 12).
	self add: ((nodes at: 1) at: 13) to: (result at: 13).
	self add: ((nodes at: 1) at: 14) to: (result at: 14).
	self add: ((nodes at: 1) at: 15) to: (result at: 15).
	self add: ((nodes at: 1) at: 16) to: (result at: 16).
	self addAll: ((nodes at: 1) at: 17) to: (result at: 17).
	self addAll: ((nodes at: 1) at: 18) to: (result at: 18).
	self addAll: ((nodes at: 1) at: 19) to: (result at: 19).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForquery_body_clauses2: nodes [
	| result |
	result := nodes at: 1.
	self add: ((nodes at: 2) at: 1) to: (result at: 1).
	self add: ((nodes at: 2) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 3).
	self add: ((nodes at: 2) at: 4) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 5) to: (result at: 5).
	self add: ((nodes at: 2) at: 6) to: (result at: 6).
	self add: ((nodes at: 2) at: 7) to: (result at: 7).
	self add: ((nodes at: 2) at: 8) to: (result at: 8).
	self add: ((nodes at: 2) at: 9) to: (result at: 9).
	self add: ((nodes at: 2) at: 10) to: (result at: 10).
	self add: ((nodes at: 2) at: 11) to: (result at: 11).
	self add: ((nodes at: 2) at: 12) to: (result at: 12).
	self add: ((nodes at: 2) at: 13) to: (result at: 13).
	self add: ((nodes at: 2) at: 14) to: (result at: 14).
	self add: ((nodes at: 2) at: 15) to: (result at: 15).
	self add: ((nodes at: 2) at: 16) to: (result at: 16).
	self addAll: ((nodes at: 2) at: 17) to: (result at: 17).
	self addAll: ((nodes at: 2) at: 18) to: (result at: 18).
	self addAll: ((nodes at: 2) at: 19) to: (result at: 19).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForquery_continuation1: nodes [
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
	self add: (nodes at: 2) to: (result at: 2).
	self addAll: ((nodes at: 3) at: 1) to: (result at: 3).
	self addAll: ((nodes at: 3) at: 2) to: (result at: 4).
	self addAll: ((nodes at: 3) at: 3) to: (result at: 2).
	self addAll: ((nodes at: 3) at: 4) to: (result at: 5).
	self addAll: ((nodes at: 3) at: 5) to: (result at: 6).
	self addAll: ((nodes at: 3) at: 6) to: (result at: 7).
	self addAll: ((nodes at: 3) at: 7) to: (result at: 8).
	self addAll: ((nodes at: 3) at: 8) to: (result at: 9).
	self addAll: ((nodes at: 3) at: 9) to: (result at: 10).
	self addAll: ((nodes at: 3) at: 10) to: (result at: 11).
	self addAll: ((nodes at: 3) at: 11) to: (result at: 12).
	self addAll: ((nodes at: 3) at: 12) to: (result at: 13).
	self addAll: ((nodes at: 3) at: 13) to: (result at: 14).
	self addAll: ((nodes at: 3) at: 14) to: (result at: 15).
	self addAll: ((nodes at: 3) at: 15) to: (result at: 1).
	self addAll: ((nodes at: 3) at: 16) to: (result at: 16).
	self addAll: ((nodes at: 3) at: 17) to: (result at: 17).
	self addAll: ((nodes at: 3) at: 18) to: (result at: 18).
	self addAll: ((nodes at: 3) at: 19) to: (result at: 19).
	self addAll: ((nodes at: 3) at: 20) to: (result at: 20).
	self addAll: ((nodes at: 3) at: 21) to: (result at: 21).
	self addAll: ((nodes at: 3) at: 22) to: (result at: 22).
	self addAll: ((nodes at: 3) at: 23) to: (result at: 23).
	self addAll: ((nodes at: 3) at: 24) to: (result at: 24).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForquery_expression1: nodes [
	| result |
	result := CSQueryExpressionNode new.
	result addToken: ((nodes at: 1) at: 1) to: result fromTokens.
	result addNode: ((nodes at: 1) at: 2) to: result types.
	result addToken: ((nodes at: 1) at: 3) to: result identifierTokens.
	result addToken: ((nodes at: 1) at: 4) to: result inTokens.
	result addNode: ((nodes at: 1) at: 5) to: result expressions.
	result addTokens: ((nodes at: 2) at: 1) to: result fromTokens.
	result addNodes: ((nodes at: 2) at: 2) to: result types.
	result addTokens: ((nodes at: 2) at: 3) to: result identifierTokens.
	result addTokens: ((nodes at: 2) at: 4) to: result inTokens.
	result addNodes: ((nodes at: 2) at: 5) to: result expressions.
	result addTokens: ((nodes at: 2) at: 6) to: result letTokens.
	result addTokens: ((nodes at: 2) at: 7) to: result equalTokens.
	result addTokens: ((nodes at: 2) at: 8) to: result whereTokens.
	result addTokens: ((nodes at: 2) at: 9) to: result joinTokens.
	result addNodes: ((nodes at: 2) at: 10) to: result joinInExpressions.
	result addTokens: ((nodes at: 2) at: 11) to: result onTokens.
	result addNodes: ((nodes at: 2) at: 12) to: result joinOnExpressions.
	result addTokens: ((nodes at: 2) at: 13) to: result equalsTokens.
	result
		addNodes: ((nodes at: 2) at: 14)
		to: result joinEqualsExpressions.
	result addTokens: ((nodes at: 2) at: 15) to: result intoTokens.
	result addTokens: ((nodes at: 2) at: 16) to: result orderbyTokens.
	result addTokens: ((nodes at: 2) at: 17) to: result ascendingTokens.
	result addTokens: ((nodes at: 2) at: 18) to: result descendingTokens.
	result addTokens: ((nodes at: 2) at: 19) to: result commaTokens.
	result addTokens: ((nodes at: 2) at: 20) to: result selectTokens.
	result addTokens: ((nodes at: 2) at: 21) to: result groupTokens.
	result addNodes: ((nodes at: 2) at: 22) to: result groupExpressions.
	result addTokens: ((nodes at: 2) at: 23) to: result byTokens.
	result addNodes: ((nodes at: 2) at: 24) to: result groupByExpressions.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForrank_specifier1: nodes [
	| result |
	result := CSRankSpecifierNode new.
	result leftBracketToken: (nodes at: 1).
	result addTokens: (nodes at: 2) to: result commaTokens.
	result rightBracketToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForremove_accessor_declaration1: nodes [
	| result |
	result := CSRemoveAccessorDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result removeToken: (nodes at: 2).
	result block: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForreturn_statement1: nodes [
	| result |
	result := CSReturnStatementNode new.
	result returnToken: (nodes at: 1).
	result expression: (nodes at: 2).
	result semicolonToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForselect_or_group_clause1: nodes [
	| result |
	result := Array new: 6.
	result at: 1 put: ((nodes at: 1) at: 1).
	result at: 2 put: ((nodes at: 1) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForselect_or_group_clause2: nodes [
	| result |
	result := Array new: 6.
	result at: 3 put: ((nodes at: 1) at: 1).
	result at: 4 put: ((nodes at: 1) at: 2).
	result at: 5 put: ((nodes at: 1) at: 3).
	result at: 6 put: ((nodes at: 1) at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForset_accessor_declaration1: nodes [
	| result |
	result := CSSetAccessorDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result addTokens: (nodes at: 2) to: result modifiers.
	result setToken: (nodes at: 3).
	result body: ((nodes at: 4) at: 1).
	result semicolonToken: ((nodes at: 4) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForsimple_name1: nodes [
	| result |
	result := CSSimpleNameNode new.
	result identifierToken: (nodes at: 1).
	result typeArguments: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForsizeof_expression1: nodes [
	| result |
	result := CSSizeofExpressionNode new.
	result sizeofToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result type: (nodes at: 3).
	result rightParenToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForstackalloc_initializer1: nodes [
	| result |
	result := CSStackallocInitializerNode new.
	result stackallocToken: (nodes at: 1).
	result type: (nodes at: 2).
	result leftBracketToken: (nodes at: 3).
	result expression: (nodes at: 4).
	result rightBracketToken: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForstatic_constructor_declaration1: nodes [
	| result |
	result := CSStaticConstructorDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result addTokens: ((nodes at: 2) at: 1) to: result modifiers.
	result staticToken: ((nodes at: 2) at: 2).
	result unsafeToken: ((nodes at: 2) at: 3).
	result identifierToken: (nodes at: 3).
	result leftParenToken: (nodes at: 4).
	result rightParenToken: (nodes at: 5).
	result block: ((nodes at: 6) at: 1).
	result semicolonToken: ((nodes at: 6) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForstatic_constructor_modifiers1: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	result at: 2 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForstatic_constructor_modifiers2: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (nodes at: 1).
	self add: (nodes at: 2) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForstatic_constructor_modifiers3: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self add: (nodes at: 2) to: (result at: 1).
	result at: 2 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForstatic_constructor_modifiers5: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForstatic_constructor_modifiers6: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	result at: 2 put: (nodes at: 2).
	self add: (nodes at: 3) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForstatic_constructor_modifiers7: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (nodes at: 1).
	self add: (nodes at: 2) to: (result at: 1).
	self add: (nodes at: 3) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForstruct_declaration1: nodes [
	| result |
	result := CSStructDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result addTokens: (nodes at: 2) to: result modifiers.
	result partialToken: (nodes at: 3).
	result structToken: (nodes at: 4).
	result identifierToken: (nodes at: 5).
	result typeParameters: (nodes at: 6).
	result colonToken: ((nodes at: 7) at: 1).
	result addNodes: ((nodes at: 7) at: 2) to: result supertypes.
	result addTokens: ((nodes at: 7) at: 3) to: result commas.
	result addNodes: (nodes at: 8) to: result constraintClauses.
	result leftBraceToken: ((nodes at: 9) at: 1).
	result addNodes: ((nodes at: 9) at: 2) to: result declarations.
	result rightBraceToken: ((nodes at: 9) at: 3).
	result semicolon: (nodes at: 10).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForstruct_interfaces1: nodes [
	| result |
	result := Array new: 3.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForswitch_label1: nodes [
	| result |
	result := CSSwitchLabelNode new.
	result caseToken: (nodes at: 1).
	result expression: (nodes at: 2).
	result colonToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForswitch_label2: nodes [
	| result |
	result := CSSwitchLabelNode new.
	result defaultToken: (nodes at: 1).
	result colonToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForswitch_section1: nodes [
	| result |
	result := CSSwitchSectionNode new.
	result addNodes: (nodes at: 1) to: result labels.
	result addNodes: (nodes at: 2) to: result statements.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForswitch_statement1: nodes [
	| result |
	result := CSSwitchStatementNode new.
	result switchToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result expression: (nodes at: 3).
	result rightParenToken: (nodes at: 4).
	result leftBraceToken: ((nodes at: 5) at: 1).
	result addNodes: ((nodes at: 5) at: 2) to: result sections.
	result rightBraceToken: ((nodes at: 5) at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForthis_access1: nodes [
	| result |
	result := CSThisAccessNode new.
	result thisToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForthrow_statement1: nodes [
	| result |
	result := CSThrowStatementNode new.
	result throwToken: (nodes at: 1).
	result expression: (nodes at: 2).
	result semicolonToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFortry_statement1: nodes [
	| result |
	result := CSTryStatementNode new.
	result tryToken: (nodes at: 1).
	result block: (nodes at: 2).
	result addNodes: (nodes at: 3) to: result clauses.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFortry_statement2: nodes [
	| result |
	result := CSTryStatementNode new.
	result tryToken: (nodes at: 1).
	result block: (nodes at: 2).
	result finally: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFortry_statement3: nodes [
	| result |
	result := CSTryStatementNode new.
	result tryToken: (nodes at: 1).
	result block: (nodes at: 2).
	result addNodes: (nodes at: 3) to: result clauses.
	result finally: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFortype_argument_list1: nodes [
	| result |
	result := CSTypeArgumentListNode new.
	result lessThanToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result types.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	result greaterThanToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFortype_parameter1: nodes [
	| result |
	result := CSTypeNameNode new.
	result name: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFortype_parameter_constraints4: nodes [
	| result |
	result := nodes at: 3.
	self addFirst: (nodes at: 1) to: (result at: 1).
	self addFirst: (nodes at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFortype_parameter_constraints5: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self add: (nodes at: 2) to: (result at: 2).
	self add: (nodes at: 3) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFortype_parameter_constraints7: nodes [
	| result |
	result := nodes at: 3.
	self addFirst: (nodes at: 1) to: (result at: 1).
	self addFirst: (nodes at: 2) to: (result at: 2).
	self add: (nodes at: 4) to: (result at: 2).
	self add: (nodes at: 5) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFortype_parameter_constraints_clause1: nodes [
	| result |
	result := CSTypeParameterConstraintsClauseNode new.
	result whereToken: (nodes at: 1).
	result parameter: (nodes at: 2).
	result colon: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result constraints.
	result addTokens: ((nodes at: 4) at: 2) to: result commaTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFortype_parameter_list1: nodes [
	| result |
	result := CSTypeParameterListNode new.
	result lessThan: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result _attributes.
	result addNodes: ((nodes at: 2) at: 2) to: result parameters.
	result addTokens: ((nodes at: 2) at: 3) to: result commaTokens.
	result greaterThan: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFortype_parameters1: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	self addAll: (nodes at: 1) to: (result at: 1).
	self add: (nodes at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFortype_parameters2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 3).
	self addAll: (nodes at: 3) to: (result at: 1).
	self add: (nodes at: 4) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionFortypeof_expression1: nodes [
	| result |
	result := CSTypeofExpressionNode new.
	result typeofToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result type: (nodes at: 3).
	result rightParenToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForunary_expression6: nodes [
	| result |
	result := CSPrefixExpressionNode new.
	result operator: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForunary_operator_declarator1: nodes [
	| result |
	result := Array new: 7.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	result at: 4 put: (nodes at: 4).
	result at: 5 put: (nodes at: 5).
	result at: 6 put: (nodes at: 6).
	result at: 7 put: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForunbound_type_name1: nodes [
	| result |
	result := CSUnboundTypeNameNode new.
	result addToken: (nodes at: 1) to: result identifierTokens.
	result addToken: ((nodes at: 2) at: 1) to: result lessThanTokens.
	result addTokens: ((nodes at: 2) at: 2) to: result commas.
	result addToken: ((nodes at: 2) at: 3) to: result gtTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForunbound_type_name2: nodes [
	| result |
	result := CSUnboundTypeNameNode new.
	result addToken: (nodes at: 1) to: result identifierTokens.
	result colonColonToken: (nodes at: 2).
	result addToken: (nodes at: 3) to: result identifierTokens.
	result addToken: ((nodes at: 4) at: 1) to: result lessThanTokens.
	result addTokens: ((nodes at: 4) at: 2) to: result commas.
	result addToken: ((nodes at: 4) at: 3) to: result gtTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForunbound_type_name3: nodes [
	| result |
	result := nodes at: 1.
	result addToken: (nodes at: 2) to: result periodTokens.
	result addToken: (nodes at: 3) to: result identifierTokens.
	result addToken: ((nodes at: 4) at: 1) to: result lessThanTokens.
	result addTokens: ((nodes at: 4) at: 2) to: result commas.
	result addToken: ((nodes at: 4) at: 3) to: result gtTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForunchecked_expression1: nodes [
	| result |
	result := CSUncheckedExpressionNode new.
	result uncheckedToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result expression: (nodes at: 3).
	result rightParenToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForunchecked_statement1: nodes [
	| result |
	result := CSUncheckedStatementNode new.
	result uncheckedToken: (nodes at: 1).
	result block: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForunsafe_statement1: nodes [
	| result |
	result := CSUnsafeStatementNode new.
	result unsafeToken: (nodes at: 1).
	result block: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForusing_alias_directive1: nodes [
	| result |
	result := CSUsingAliasDirectiveNode new.
	result usingToken: (nodes at: 1).
	result name: (nodes at: 2).
	result equalToken: (nodes at: 3).
	result namespace: (nodes at: 4).
	result semicolonToken: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForusing_namespace_directive1: nodes [
	| result |
	result := CSUsingNamespaceDirectiveNode new.
	result usingToken: (nodes at: 1).
	result namespace: (nodes at: 2).
	result semicolonToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForusing_statement1: nodes [
	| result |
	result := CSUsingStatementNode new.
	result usingToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result expression: (nodes at: 3).
	result rightParenToken: (nodes at: 4).
	result statement: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForusing_static_directive1: nodes [
	| result |
	result := CSUsingStaticDirectiveNode new.
	result usingToken: (nodes at: 1).
	result staticToken: (nodes at: 2).
	result namespace: (nodes at: 3).
	result semicolonToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForvariable_declarator1: nodes [
	| result |
	result := CSVariableDeclaratorNode new.
	result identifierToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForvariable_declarator2: nodes [
	| result |
	result := CSVariableDeclaratorNode new.
	result identifierToken: (nodes at: 1).
	result equalToken: (nodes at: 2).
	result initializer: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForvariant_type_parameter_list1: nodes [
	| result |
	result := CSVariantTypeParameterListNode new.
	result lessThan: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result _attributes.
	result addTokens: ((nodes at: 2) at: 2) to: result annotations.
	result addNodes: ((nodes at: 2) at: 3) to: result parameters.
	result addTokens: ((nodes at: 2) at: 4) to: result commaTokens.
	result greaterThan: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForvariant_type_parameters1: nodes [
	| result |
	result := Array new: 4.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	self addAll: (nodes at: 1) to: (result at: 1).
	self add: (nodes at: 2) to: (result at: 2).
	self add: (nodes at: 3) to: (result at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForvariant_type_parameters2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 4).
	self addAll: (nodes at: 3) to: (result at: 1).
	self add: (nodes at: 4) to: (result at: 2).
	self add: (nodes at: 5) to: (result at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForvoid_type1: nodes [
	| result |
	result := CSVoidTypeNode new.
	result voidToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForwhile_statement1: nodes [
	| result |
	result := CSWhileStatementNode new.
	result whileToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result expression: (nodes at: 3).
	result rightParenToken: (nodes at: 4).
	result statement: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForyield_statement1: nodes [
	| result |
	result := CSYieldStatementNode new.
	result yieldToken: (nodes at: 1).
	result returnToken: (nodes at: 2).
	result expression: (nodes at: 3).
	result semicolonToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
CSharpParser >> reduceActionForyield_statement2: nodes [
	| result |
	result := CSYieldStatementNode new.
	result yieldToken: (nodes at: 1).
	result breakToken: (nodes at: 2).
	result semicolonToken: (nodes at: 3).
	^ result
]

{ #category : #generated }
CSharpParser >> reduceTable [
^#(
	#(583 0 #reduceActionFor_extern_alias_directives1:) 
	#(411 0 #reduceActionFor_extern_alias_directives1:) 
	#(249 0 #reduceActionForStartInterpolatedString1:) 
	#(257 0 #reduceActionForStartInterpolatedVerbatimString1:) 
	#(250 1 #reduceActionForextern_alias_directives1:) 
	#(583 1 #reduceActionFor_extern_alias_directives2:) 
	#(384 0 #reduceActionFor_extern_alias_directives1:) 
	#(569 0 #reduceActionFor_attribute_target_specifier1:) 
	#(587 1 #reduceActionFornamespace_member_declaration2:) 
	#(182 1 #reduceActionFornamespace_member_declaration2:) 
	#(557 0 #reduceActionFor_extern_alias_directives1:) 
	#(515 0 #reduceActionFor_extern_alias_directives1:) 
	#(526 0 #reduceActionFor_extern_alias_directives1:) 
	#(412 0 #reduceActionFor_extern_alias_directives1:) 
	#(548 0 #reduceActionFor_extern_alias_directives1:) 
	#(411 1 #reduceActionFor_extern_alias_directives2:) 
	#(566 1 #reduceActionFor_extern_alias_directives2:) 
	#(567 1 #reduceActionForextern_alias_directives1:) 
	#(317 0 #nil) 
	#(199 1 #reduceActionFornamespace_member_declaration2:) 
	#(264 1 #reduceActionForpredefined_type4:) 
	#(197 1 #reduceActionForpredefined_type4:) 
	#(200 1 #reduceActionFornamespace_member_declaration2:) 
	#(366 0 #reduceActionFor_extern_alias_directives1:) 
	#(355 1 #reduceActionForempty_statement1:) 
	#(233 1 #reduceActionForthis_access1:) 
	#(286 1 #reduceActionForvoid_type1:) 
	#(201 1 #reduceActionFornamespace_member_declaration2:) 
	#(203 1 #reduceActionForpredefined_type4:) 
	#(582 1 #reduceActionFornamespace_member_declaration2:) 
	#(370 1 #reduceActionForlocal_variable_type2:) 
	#(351 0 #nil) 
	#(188 0 #nil) 
	#(194 1 #reduceActionFortype_parameter1:) 
	#(226 1 #reduceActionForliteral2:) 
	#(246 1 #reduceActionForinterpolated_regular_string1:) 
	#(247 1 #reduceActionForinterpolated_regular_string1:) 
	#(180 1 #reduceActionFornamespace_member_declaration2:) 
	#(204 1 #reduceActionFornamespace_member_declaration2:) 
	#(195 1 #reduceActionFornamespace_member_declaration2:) 
	#(203 1 #reduceActionFornamespace_member_declaration2:) 
	#(206 1 #reduceActionFornamespace_member_declaration2:) 
	#(196 1 #reduceActionFornamespace_member_declaration2:) 
	#(178 1 #reduceActionFornamespace_member_declaration2:) 
	#(263 1 #reduceActionForqualified_alias_member_expression1:) 
	#(591 1 #reduceActionFornamespace_member_declaration2:) 
	#(202 1 #reduceActionFornamespace_member_declaration2:) 
	#(207 1 #reduceActionFornamespace_member_declaration2:) 
	#(370 1 #reduceActionFornamespace_member_declaration2:) 
	#(190 1 #reduceActionFornamespace_member_declaration2:) 
	#(192 1 #reduceActionFornamespace_member_declaration2:) 
	#(193 1 #reduceActionFornamespace_member_declaration2:) 
	#(225 1 #reduceActionFornamespace_member_declaration2:) 
	#(294 1 #reduceActionFornamespace_member_declaration2:) 
	#(300 0 #nil) 
	#(223 1 #reduceActionFornamespace_member_declaration2:) 
	#(377 1 #reduceActionFornamespace_member_declaration2:) 
	#(227 1 #reduceActionForinterpolated_string_expression1:) 
	#(262 1 #reduceActionForqualified_alias_member_expression1:) 
	#(586 1 #reduceActionFornamespace_member_declaration2:) 
	#(354 1 #reduceActionFornamespace_member_declaration2:) 
	#(357 1 #reduceActionFornamespace_member_declaration2:) 
	#(358 1 #reduceActionFornamespace_member_declaration2:) 
	#(359 1 #reduceActionFornamespace_member_declaration2:) 
	#(191 0 #nil) 
	#(323 0 #nil) 
	#(320 0 #reduceActionFor_explicit_anonymous_function_paramenter_list1:) 
	#(325 0 #reduceActionFor_explicit_anonymous_function_paramenter_list1:) 
	#(326 1 #reduceActionFornamespace_member_declaration2:) 
	#(585 1 #reduceActionFornamespace_member_declaration2:) 
	#(302 1 #reduceActionFornamespace_member_declaration2:) 
	#(303 1 #reduceActionFornamespace_member_declaration2:) 
	#(304 1 #reduceActionFornamespace_member_declaration2:) 
	#(305 1 #reduceActionFornamespace_member_declaration2:) 
	#(306 1 #reduceActionFornamespace_member_declaration2:) 
	#(613 1 #reduceActionFornamespace_member_declaration2:) 
	#(309 1 #reduceActionFornamespace_member_declaration2:) 
	#(310 1 #reduceActionFornamespace_member_declaration2:) 
	#(311 1 #reduceActionFornamespace_member_declaration2:) 
	#(312 1 #reduceActionFornamespace_member_declaration2:) 
	#(313 1 #reduceActionFornamespace_member_declaration2:) 
	#(277 1 #reduceActionFornamespace_member_declaration2:) 
	#(314 1 #reduceActionFornamespace_member_declaration2:) 
	#(319 1 #reduceActionForimplicit_anonymous_function_signature2:) 
	#(331 0 #reduceActionFor_query_body_clauses1:) 
	#(308 1 #reduceActionFornamespace_member_declaration2:) 
	#(250 2 #reduceActionForextern_alias_directives2:) 
	#(384 1 #reduceActionFor_extern_alias_directives2:) 
	#(173 1 #reduceActionForextern_alias_directives1:) 
	#(174 1 #reduceActionFornamespace_member_declaration2:) 
	#(307 0 #reduceActionFor_extern_alias_directives1:) 
	#(258 1 #reduceActionForqualified_identifier1:) 
	#(571 1 #reduceActionFornamespace_member_declaration2:) 
	#(569 1 #reduceActionFor_extern_alias_directives2:) 
	#(555 1 #reduceActionFornamespace_member_declaration2:) 
	#(559 1 #reduceActionFornamespace_member_declaration2:) 
	#(519 1 #reduceActionFornamespace_member_declaration2:) 
	#(531 1 #reduceActionFornamespace_member_declaration2:) 
	#(419 1 #reduceActionFornamespace_member_declaration2:) 
	#(413 0 #nil) 
	#(412 1 #reduceActionFor_extern_alias_directives2:) 
	#(418 1 #reduceActionForextern_alias_directives1:) 
	#(515 1 #reduceActionFor_extern_alias_directives2:) 
	#(518 1 #reduceActionForextern_alias_directives1:) 
	#(526 1 #reduceActionFor_extern_alias_directives2:) 
	#(530 1 #reduceActionForextern_alias_directives1:) 
	#(548 1 #reduceActionFor_extern_alias_directives2:) 
	#(554 1 #reduceActionForextern_alias_directives1:) 
	#(557 1 #reduceActionFor_extern_alias_directives2:) 
	#(558 1 #reduceActionForextern_alias_directives1:) 
	#(567 2 #reduceActionForextern_alias_directives2:) 
	#(298 2 #reduceActionForawait_expression1:) 
	#(294 2 #reduceActionForunary_expression6:) 
	#(595 2 #reduceActionForunary_expression6:) 
	#(281 0 #reduceActionFor_explicit_anonymous_function_paramenter_list1:) 
	#(211 0 #reduceActionFor_extern_alias_directives1:) 
	#(239 2 #reduceActionForanonymous_object_creation_expression1:) 
	#(296 2 #reduceActionForunary_expression6:) 
	#(361 2 #reduceActionForchecked_statement1:) 
	#(362 2 #reduceActionForunchecked_statement1:) 
	#(317 1 #reduceActionFornamespace_member_declaration2:) 
	#(596 2 #reduceActionForunary_expression6:) 
	#(295 2 #reduceActionForunary_expression6:) 
	#(366 1 #reduceActionFor_extern_alias_directives2:) 
	#(367 1 #reduceActionForextern_alias_directives1:) 
	#(589 2 #reduceActionForunsafe_statement1:) 
	#(351 1 #reduceActionFornamespace_member_declaration2:) 
	#(398 2 #reduceActionForcontinue_statement1:) 
	#(390 0 #nil) 
	#(397 2 #reduceActionForbreak_statement1:) 
	#(228 2 #reduceActionForsimple_name1:) 
	#(178 2 #reduceActionFornamespace_or_type_name1:) 
	#(188 1 #reduceActionFornamespace_member_declaration2:) 
	#(198 2 #reduceActionFornullable_type1:) 
	#(205 2 #reduceActionForarray_type1:) 
	#(208 1 #reduceActionForextern_alias_directives1:) 
	#(236 2 #reduceActionForpost_decrement_expression1:) 
	#(235 2 #reduceActionForpost_decrement_expression1:) 
	#(220 0 #reduceActionFor_attribute_target_specifier1:) 
	#(218 0 #reduceActionFor_explicit_anonymous_function_paramenter_list1:) 
	#(293 2 #reduceActionFornull_conditional_expression1:) 
	#(300 1 #reduceActionFornamespace_member_declaration2:) 
	#(590 2 #reduceActionForpointer_type2:) 
	#(349 1 #reduceActionFornamespace_member_declaration2:) 
	#(353 2 #reduceActionFordeclaration_statement1:) 
	#(373 1 #reduceActionFor_local_variable_declarator_name1:) 
	#(368 2 #reduceActionForlocal_variable_declaration1:) 
	#(371 1 #reduceActionForinterpolated_regular_string1:) 
	#(372 1 #reduceActionForlocal_variable_declarator1:) 
	#(356 2 #reduceActionForexpression_statement1:) 
	#(191 1 #reduceActionFornamespace_member_declaration2:) 
	#(324 1 #reduceActionFornamespace_member_declaration2:) 
	#(320 1 #reduceActionFor_extern_alias_directives2:) 
	#(321 1 #reduceActionForinterpolated_regular_string1:) 
	#(323 1 #reduceActionFornamespace_member_declaration2:) 
	#(327 1 #reduceActionForinterpolated_regular_string1:) 
	#(325 1 #reduceActionFor_extern_alias_directives2:) 
	#(335 1 #reduceActionForquery_body_clause1:) 
	#(330 2 #reduceActionForquery_expression1:) 
	#(331 1 #reduceActionFor_extern_alias_directives2:) 
	#(334 1 #reduceActionForquery_body_clauses1:) 
	#(335 1 #reduceActionForquery_body_clause2:) 
	#(335 1 #reduceActionForquery_body_clause3:) 
	#(335 1 #reduceActionForquery_body_clause4:) 
	#(335 1 #reduceActionForquery_body_clause5:) 
	#(335 1 #reduceActionForquery_body_clause6:) 
	#(179 1 #reduceActionFornamespace_member_declaration2:) 
	#(173 2 #reduceActionForextern_alias_directives2:) 
	#(261 0 #reduceActionFor_extern_alias_directives1:) 
	#(307 1 #reduceActionFor_extern_alias_directives2:) 
	#(560 1 #reduceActionFor_extern_alias_directives2:) 
	#(561 1 #reduceActionForextern_alias_directives1:) 
	#(254 0 #nil) 
	#(573 1 #reduceActionFornamespace_member_declaration2:) 
	#(564 1 #reduceActionForinterpolated_regular_string1:) 
	#(574 0 #reduceActionFor_attribute_arguments1:) 
	#(570 2 #reduceActionForattribute_target_specifier1:) 
	#(413 1 #reduceActionFornamespace_member_declaration2:) 
	#(418 2 #reduceActionForextern_alias_directives2:) 
	#(518 2 #reduceActionForextern_alias_directives2:) 
	#(530 2 #reduceActionForextern_alias_directives2:) 
	#(554 2 #reduceActionForextern_alias_directives2:) 
	#(558 2 #reduceActionForextern_alias_directives2:) 
	#(283 1 #reduceActionFormember_declarator1:) 
	#(283 1 #reduceActionFormember_declarator2:) 
	#(281 1 #reduceActionFor_extern_alias_directives2:) 
	#(282 1 #reduceActionForinterpolated_regular_string1:) 
	#(212 1 #reduceActionForextern_alias_directives1:) 
	#(211 1 #reduceActionFor_extern_alias_directives2:) 
	#(270 0 #reduceActionFor_explicit_anonymous_function_paramenter_list1:) 
	#(237 3 #reduceActionForobject_creation_expression2:) 
	#(267 1 #reduceActionFornamespace_member_declaration2:) 
	#(524 0 #reduceActionFor_explicit_anonymous_function_paramenter_list1:) 
	#(224 3 #reduceActionForarray_creation_expression2:) 
	#(224 3 #reduceActionForarray_creation_expression3:) 
	#(287 0 #reduceActionFor_generic_dimension_specifier1:) 
	#(292 1 #reduceActionFornamed_entity_target2:) 
	#(292 1 #reduceActionForthis_access1:) 
	#(291 1 #reduceActionFornamespace_member_declaration2:) 
	#(292 1 #reduceActionFornamespace_member_declaration2:) 
	#(245 3 #reduceActionForanonymous_method_expression1:) 
	#(234 3 #reduceActionForbase_access1:) 
	#(265 1 #reduceActionForinterpolated_regular_string1:) 
	#(584 3 #reduceActionForblock1:) 
	#(367 2 #reduceActionForextern_alias_directives2:) 
	#(410 1 #reduceActionFornamespace_member_declaration2:) 
	#(229 3 #reduceActionForparenthesized_expression1:) 
	#(341 1 #reduceActionFornamespace_member_declaration2:) 
	#(369 3 #reduceActionForlocal_constant_declaration1:) 
	#(375 1 #reduceActionForinterpolated_regular_string1:) 
	#(405 0 #reduceActionFor_exception_specifier1:) 
	#(360 3 #reduceActionFortry_statement1:) 
	#(360 3 #reduceActionFortry_statement2:) 
	#(402 1 #reduceActionForextern_alias_directives1:) 
	#(401 3 #reduceActionForthrow_statement1:) 
	#(365 3 #reduceActionForyield_statement2:) 
	#(400 3 #reduceActionForreturn_statement1:) 
	#(399 3 #reduceActionForgoto_statement3:) 
	#(255 1 #reduceActionFornamespace_member_declaration2:) 
	#(399 3 #reduceActionForgoto_statement1:) 
	#(393 1 #reduceActionFornamespace_member_declaration2:) 
	#(394 1 #reduceActionForinterpolated_regular_string1:) 
	#(390 1 #reduceActionFornamespace_member_declaration2:) 
	#(393 1 #reduceActionForfor_initializer2:) 
	#(352 3 #reduceActionForlabeled_statement1:) 
	#(215 1 #reduceActionFornamespace_member_declaration2:) 
	#(213 1 #reduceActionForinterpolated_regular_string1:) 
	#(208 2 #reduceActionForextern_alias_directives2:) 
	#(218 1 #reduceActionFor_extern_alias_directives2:) 
	#(217 1 #reduceActionForinterpolated_regular_string1:) 
	#(220 1 #reduceActionFor_extern_alias_directives2:) 
	#(592 3 #reduceActionForpointer_member_access1:) 
	#(251 1 #reduceActionForinterpolated_regular_string_body1:) 
	#(253 1 #reduceActionForinterpolation1:) 
	#(259 1 #reduceActionForinterpolated_regular_string_body1:) 
	#(230 3 #reduceActionFormember_access3:) 
	#(350 3 #reduceActionForassignment1:) 
	#(318 3 #reduceActionForexplicit_anonymous_function_signature1:) 
	#(319 3 #reduceActionForimplicit_anonymous_function_signature1:) 
	#(302 3 #reduceActionFormultiplicative_expression3:) 
	#(303 3 #reduceActionFormultiplicative_expression3:) 
	#(304 3 #reduceActionFormultiplicative_expression3:) 
	#(305 3 #reduceActionFormultiplicative_expression3:) 
	#(306 3 #reduceActionFormultiplicative_expression3:) 
	#(308 3 #reduceActionFormultiplicative_expression3:) 
	#(309 3 #reduceActionFormultiplicative_expression3:) 
	#(310 3 #reduceActionFormultiplicative_expression3:) 
	#(312 3 #reduceActionFormultiplicative_expression3:) 
	#(311 3 #reduceActionFormultiplicative_expression3:) 
	#(316 3 #reduceActionForlambda_expression1:) 
	#(315 1 #reduceActionFornamespace_member_declaration2:) 
	#(337 2 #reduceActionForattribute_target_specifier1:) 
	#(340 2 #reduceActionFororderby_clause1:) 
	#(342 1 #reduceActionFororderings1:) 
	#(344 0 #reduceActionFor_attribute_target_specifier1:) 
	#(333 0 #reduceActionFor_query_continuation1:) 
	#(332 1 #reduceActionForselect_or_group_clause1:) 
	#(332 1 #reduceActionForselect_or_group_clause2:) 
	#(334 2 #reduceActionForquery_body_clauses2:) 
	#(613 3 #reduceActionFormultiplicative_expression3:) 
	#(248 4 #reduceActionForextern_alias_directive1:) 
	#(176 3 #reduceActionForusing_namespace_directive1:) 
	#(565 1 #reduceActionFornamespace_member_declaration2:) 
	#(261 1 #reduceActionFor_extern_alias_directives2:) 
	#(612 4 #reduceActionForcompilation_unit1:) 
	#(181 1 #reduceActionForextern_alias_directives1:) 
	#(561 2 #reduceActionForextern_alias_directives2:) 
	#(258 3 #reduceActionForqualified_identifier2:) 
	#(254 1 #reduceActionFornamespace_member_declaration2:) 
	#(252 4 #reduceActionFornamespace_declaration1:) 
	#(568 4 #reduceActionForattribute_section1:) 
	#(576 0 #reduceActionFor_explicit_anonymous_function_paramenter_list1:) 
	#(572 2 #reduceActionForattribute1:) 
	#(574 1 #reduceActionFor_extern_alias_directives2:) 
	#(549 0 #reduceActionFor_attribute_target_specifier1:) 
	#(458 1 #reduceActionFornamespace_member_declaration2:) 
	#(280 3 #reduceActionForanonymous_object_initializer1:) 
	#(210 3 #reduceActionForrank_specifier1:) 
	#(212 2 #reduceActionForextern_alias_directives2:) 
	#(273 1 #reduceActionForinitializer_target1:) 
	#(270 1 #reduceActionFor_extern_alias_directives2:) 
	#(271 1 #reduceActionForinterpolated_regular_string1:) 
	#(275 1 #reduceActionForinterpolated_regular_string1:) 
	#(276 1 #reduceActionForelement_initializer1:) 
	#(454 1 #reduceActionFornamespace_member_declaration2:) 
	#(525 1 #reduceActionForinterpolated_regular_string1:) 
	#(524 1 #reduceActionFor_extern_alias_directives2:) 
	#(241 4 #reduceActionForchecked_expression1:) 
	#(289 0 #reduceActionFor_extern_alias_directives1:) 
	#(285 2 #reduceActionForunbound_type_name1:) 
	#(287 1 #reduceActionFor_extern_alias_directives2:) 
	#(240 4 #reduceActionFortypeof_expression1:) 
	#(244 4 #reduceActionFornameof_expression1:) 
	#(243 4 #reduceActionFordefault_value_expression1:) 
	#(242 4 #reduceActionForunchecked_expression1:) 
	#(234 4 #reduceActionForbase_access2:) 
	#(297 4 #reduceActionForcast_expression1:) 
	#(598 1 #reduceActionForinterpolated_regular_string1:) 
	#(594 4 #reduceActionForsizeof_expression1:) 
	#(406 0 #nil) 
	#(405 1 #reduceActionFor_extern_alias_directives2:) 
	#(403 2 #reduceActionForfinally_clause1:) 
	#(360 4 #reduceActionFortry_statement3:) 
	#(402 2 #reduceActionForextern_alias_directives2:) 
	#(365 4 #reduceActionForyield_statement1:) 
	#(399 4 #reduceActionForgoto_statement2:) 
	#(391 0 #nil) 
	#(189 4 #reduceActionForqualified_alias_member1:) 
	#(214 3 #reduceActionFortype_argument_list1:) 
	#(178 4 #reduceActionFornamespace_or_type_name2:) 
	#(232 4 #reduceActionForelement_access1:) 
	#(593 4 #reduceActionForpointer_element_access1:) 
	#(230 4 #reduceActionFormember_access1:) 
	#(222 2 #reduceActionForattribute_target_specifier1:) 
	#(231 4 #reduceActionForinvocation_expression1:) 
	#(219 2 #reduceActionForargument1:) 
	#(221 1 #reduceActionForargument_value1:) 
	#(246 4 #reduceActionForinterpolated_regular_string2:) 
	#(247 4 #reduceActionForinterpolated_regular_string2:) 
	#(371 3 #reduceActionForlocal_variable_declarators2:) 
	#(374 1 #reduceActionFornamespace_member_declaration2:) 
	#(372 3 #reduceActionForlocal_variable_declarator2:) 
	#(321 3 #reduceActionForlocal_variable_declarators2:) 
	#(322 3 #reduceActionForexplicit_anonymous_function_paramenter1:) 
	#(327 3 #reduceActionForlocal_variable_declarators2:) 
	#(345 1 #reduceActionForordering_direction2:) 
	#(345 1 #reduceActionForordering_direction1:) 
	#(343 2 #reduceActionForordering1:) 
	#(344 1 #reduceActionFor_extern_alias_directives2:) 
	#(346 2 #reduceActionForattribute_target_specifier1:) 
	#(329 3 #reduceActionForquery_body1:) 
	#(333 1 #reduceActionFor_extern_alias_directives2:) 
	#(177 4 #reduceActionForusing_static_directive1:) 
	#(563 2 #reduceActionForattribute_target_specifier1:) 
	#(181 2 #reduceActionForextern_alias_directives2:) 
	#(568 5 #reduceActionForattribute_section2:) 
	#(564 3 #reduceActionForlocal_variable_declarators2:) 
	#(576 1 #reduceActionFor_extern_alias_directives2:) 
	#(577 1 #reduceActionForinterpolated_regular_string1:) 
	#(579 1 #reduceActionFornamespace_member_declaration2:) 
	#(578 1 #reduceActionForinterpolated_regular_string1:) 
	#(580 1 #reduceActionFornamespace_member_declaration2:) 
	#(414 0 #nil) 
	#(527 0 #nil) 
	#(549 1 #reduceActionFor_extern_alias_directives2:) 
	#(283 3 #reduceActionFormember_declarator5:) 
	#(280 4 #reduceActionForanonymous_object_initializer2:) 
	#(282 3 #reduceActionForlocal_variable_declarators2:) 
	#(268 3 #reduceActionForobject_initializer1:) 
	#(269 3 #reduceActionForcollection_initializer1:) 
	#(266 0 #nil) 
	#(279 3 #reduceActionForarray_initializer1:) 
	#(238 5 #reduceActionFordelegate_creation_expression1:) 
	#(209 0 #reduceActionFor_extern_alias_directives1:) 
	#(290 1 #reduceActionForextern_alias_directives1:) 
	#(289 1 #reduceActionFor_extern_alias_directives2:) 
	#(265 3 #reduceActionForlocal_variable_declarators2:) 
	#(364 5 #reduceActionForusing_statement1:) 
	#(378 5 #reduceActionForif_statement1:) 
	#(376 3 #reduceActionForconst_declarator1:) 
	#(375 3 #reduceActionForlocal_variable_declarators2:) 
	#(408 0 #nil) 
	#(406 1 #reduceActionFornamespace_member_declaration2:) 
	#(363 5 #reduceActionForlock_statement1:) 
	#(381 0 #reduceActionFor_extern_alias_directives1:) 
	#(379 5 #reduceActionForswitch_statement1:) 
	#(386 5 #reduceActionForwhile_statement1:) 
	#(395 1 #reduceActionFornamespace_member_declaration2:) 
	#(391 1 #reduceActionFornamespace_member_declaration2:) 
	#(394 3 #reduceActionForlocal_variable_declarators2:) 
	#(213 3 #reduceActionForlocal_variable_declarators2:) 
	#(217 3 #reduceActionForlocal_variable_declarators2:) 
	#(221 2 #reduceActionForargument_value3:) 
	#(216 1 #reduceActionFornamespace_member_declaration2:) 
	#(221 2 #reduceActionForargument_value2:) 
	#(299 4 #reduceActionFornull_conditional_operations3:) 
	#(299 4 #reduceActionFornull_conditional_operations5:) 
	#(301 5 #reduceActionFornull_conditional_invocation_expression1:) 
	#(299 4 #reduceActionFornull_conditional_operations4:) 
	#(251 3 #reduceActionForinterpolated_regular_string_body2:) 
	#(253 3 #reduceActionForinterpolation2:) 
	#(259 3 #reduceActionForinterpolated_regular_string_body2:) 
	#(328 5 #reduceActionForfrom_clause1:) 
	#(313 5 #reduceActionForconditional_expression2:) 
	#(336 4 #reduceActionForlet_clause1:) 
	#(342 3 #reduceActionFororderings2:) 
	#(175 5 #reduceActionForusing_alias_directive1:) 
	#(562 4 #reduceActionForattribute_section1:) 
	#(575 3 #reduceActionForanonymous_object_initializer1:) 
	#(415 0 #reduceActionFor_attribute_arguments1:) 
	#(414 1 #reduceActionFornamespace_member_declaration2:) 
	#(516 0 #reduceActionFor_struct_interfaces1:) 
	#(528 0 #reduceActionFor_struct_interfaces1:) 
	#(527 1 #reduceActionFornamespace_member_declaration2:) 
	#(551 2 #reduceActionForattribute_target_specifier1:) 
	#(552 0 #reduceActionFor_explicit_anonymous_function_paramenter_list1:) 
	#(276 3 #reduceActionForelement_initializer2:) 
	#(273 3 #reduceActionForinitializer_target2:) 
	#(268 4 #reduceActionForobject_initializer2:) 
	#(271 3 #reduceActionForlocal_variable_declarators2:) 
	#(274 1 #reduceActionFornamespace_member_declaration2:) 
	#(272 3 #reduceActionFormember_initializer1:) 
	#(269 4 #reduceActionForcollection_initializer2:) 
	#(275 3 #reduceActionForlocal_variable_declarators2:) 
	#(237 6 #reduceActionForobject_creation_expression1:) 
	#(266 1 #reduceActionFornamespace_member_declaration2:) 
	#(279 4 #reduceActionForarray_initializer2:) 
	#(525 3 #reduceActionForlocal_variable_declarators2:) 
	#(209 1 #reduceActionFor_extern_alias_directives2:) 
	#(278 0 #nil) 
	#(285 4 #reduceActionForunbound_type_name2:) 
	#(288 3 #reduceActionForgeneric_dimension_specifier1:) 
	#(290 2 #reduceActionForextern_alias_directives2:) 
	#(285 4 #reduceActionForunbound_type_name3:) 
	#(291 4 #reduceActionFornamed_entity2:) 
	#(600 1 #reduceActionForordering_direction2:) 
	#(599 3 #reduceActionForfixed_pointer_declarator1:) 
	#(598 3 #reduceActionForlocal_variable_declarators2:) 
	#(597 6 #reduceActionForfixed_statement1:) 
	#(408 1 #reduceActionFornamespace_member_declaration2:) 
	#(404 4 #reduceActionForcatch_clause1:) 
	#(381 1 #reduceActionFor_extern_alias_directives2:) 
	#(382 1 #reduceActionForextern_alias_directives1:) 
	#(611 1 #reduceActionForextern_alias_directives1:) 
	#(392 0 #nil) 
	#(299 5 #reduceActionFornull_conditional_operations1:) 
	#(299 5 #reduceActionFornull_conditional_operations2:) 
	#(347 4 #reduceActionForlet_clause1:) 
	#(348 3 #reduceActionForquery_continuation1:) 
	#(562 5 #reduceActionForattribute_section2:) 
	#(256 5 #reduceActionFornamespace_body1:) 
	#(581 3 #reduceActionFornamed_argument1:) 
	#(577 3 #reduceActionForlocal_variable_declarators2:) 
	#(578 3 #reduceActionForlocal_variable_declarators2:) 
	#(416 0 #reduceActionFor_extern_alias_directives1:) 
	#(415 1 #reduceActionFor_extern_alias_directives2:) 
	#(516 1 #reduceActionFor_extern_alias_directives2:) 
	#(534 0 #nil) 
	#(528 1 #reduceActionFor_extern_alias_directives2:) 
	#(552 1 #reduceActionFor_extern_alias_directives2:) 
	#(553 1 #reduceActionForinterpolated_regular_string1:) 
	#(186 7 #reduceActionForenum_declaration1:) 
	#(460 0 #reduceActionFor_explicit_anonymous_function_paramenter_list1:) 
	#(284 5 #reduceActionFornull_conditional_member_access2:) 
	#(224 7 #reduceActionForarray_creation_expression1:) 
	#(278 1 #reduceActionFornamespace_member_declaration2:) 
	#(600 2 #reduceActionForattribute_target_specifier1:) 
	#(378 7 #reduceActionForif_statement2:) 
	#(407 4 #reduceActionForlet_clause1:) 
	#(385 2 #reduceActionForswitch_label2:) 
	#(380 3 #reduceActionForgeneric_dimension_specifier1:) 
	#(382 2 #reduceActionForextern_alias_directives2:) 
	#(383 2 #reduceActionForswitch_section1:) 
	#(611 2 #reduceActionForextern_alias_directives2:) 
	#(387 7 #reduceActionFordo_statement1:) 
	#(396 1 #reduceActionForfor_initializer2:) 
	#(392 1 #reduceActionFornamespace_member_declaration2:) 
	#(575 5 #reduceActionForattribute_arguments2:) 
	#(421 2 #reduceActionFortype_parameters1:) 
	#(420 3 #reduceActionFortype_parameter_list1:) 
	#(422 2 #reduceActionForclass_base1:) 
	#(423 1 #reduceActionForinterpolated_regular_string1:) 
	#(422 2 #reduceActionForclass_base2:) 
	#(416 1 #reduceActionFor_extern_alias_directives2:) 
	#(424 1 #reduceActionForextern_alias_directives1:) 
	#(520 2 #reduceActionForstruct_interfaces1:) 
	#(535 1 #reduceActionFornamespace_member_declaration2:) 
	#(534 1 #reduceActionFornamespace_member_declaration2:) 
	#(532 3 #reduceActionForvariant_type_parameter_list1:) 
	#(536 2 #reduceActionForstruct_interfaces1:) 
	#(556 2 #reduceActionForenum_member_declaration1:) 
	#(550 3 #reduceActionForanonymous_object_initializer1:) 
	#(467 0 #nil) 
	#(460 1 #reduceActionFor_extern_alias_directives2:) 
	#(463 1 #reduceActionFor_extern_alias_directives2:) 
	#(463 1 #reduceActionForinterpolated_regular_string1:) 
	#(464 1 #reduceActionForinterpolated_regular_string1:) 
	#(284 6 #reduceActionFornull_conditional_member_access1:) 
	#(409 4 #reduceActionForexception_filter1:) 
	#(385 3 #reduceActionForswitch_label1:) 
	#(389 8 #reduceActionForforeach_statement1:) 
	#(608 5 #reduceActionForstackalloc_initializer1:) 
	#(431 0 #reduceActionFor_extern_alias_directives1:) 
	#(424 2 #reduceActionForextern_alias_directives2:) 
	#(521 0 #reduceActionFor_extern_alias_directives1:) 
	#(533 3 #reduceActionForvariant_type_parameters1:) 
	#(537 0 #reduceActionFor_extern_alias_directives1:) 
	#(550 4 #reduceActionForanonymous_object_initializer2:) 
	#(553 3 #reduceActionForlocal_variable_declarators2:) 
	#(470 1 #reduceActionFornamespace_member_declaration2:) 
	#(467 1 #reduceActionFornamespace_member_declaration2:) 
	#(388 9 #reduceActionForfor_statement1:) 
	#(421 4 #reduceActionFortype_parameters2:) 
	#(422 4 #reduceActionForclass_base3:) 
	#(423 3 #reduceActionForlocal_variable_declarators2:) 
	#(433 1 #reduceActionFornamespace_member_declaration2:) 
	#(514 0 #nil) 
	#(588 0 #nil) 
	#(449 0 #reduceActionFor_extern_alias_directives1:) 
	#(457 0 #reduceActionFor_extern_alias_directives1:) 
	#(491 0 #reduceActionFor_extern_alias_directives1:) 
	#(471 0 #reduceActionFor_extern_alias_directives1:) 
	#(485 0 #reduceActionFor_extern_alias_directives1:) 
	#(444 0 #reduceActionFor_extern_alias_directives1:) 
	#(505 0 #reduceActionFor_extern_alias_directives1:) 
	#(431 1 #reduceActionFor_extern_alias_directives2:) 
	#(432 1 #reduceActionForextern_alias_directives1:) 
	#(183 10 #reduceActionForclass_declaration1:) 
	#(523 1 #reduceActionFornamespace_member_declaration2:) 
	#(602 0 #reduceActionFor_extern_alias_directives1:) 
	#(521 1 #reduceActionFor_extern_alias_directives2:) 
	#(522 1 #reduceActionForextern_alias_directives1:) 
	#(184 10 #reduceActionForstruct_declaration1:) 
	#(544 0 #nil) 
	#(537 1 #reduceActionFor_extern_alias_directives2:) 
	#(538 1 #reduceActionForextern_alias_directives1:) 
	#(539 1 #reduceActionFornamespace_member_declaration2:) 
	#(185 10 #reduceActionForinterface_declaration1:) 
	#(556 4 #reduceActionForenum_member_declaration2:) 
	#(463 3 #reduceActionForlocal_variable_declarators2:) 
	#(464 3 #reduceActionForlocal_variable_declarators2:) 
	#(338 9 #reduceActionForjoin_clause1:) 
	#(427 1 #reduceActionForprimary_constraint3:) 
	#(427 1 #reduceActionForprimary_constraint2:) 
	#(428 1 #reduceActionForinterpolated_regular_string1:) 
	#(427 1 #reduceActionForprimary_constraint1:) 
	#(430 1 #reduceActionForprimary_constraint1:) 
	#(425 4 #reduceActionFortype_parameter_constraints_clause1:) 
	#(426 1 #reduceActionForinterpolated_regular_string1:) 
	#(426 1 #reduceActionFor_extern_alias_directives2:) 
	#(474 1 #reduceActionFornamespace_member_declaration2:) 
	#(495 1 #reduceActionFornamespace_member_declaration2:) 
	#(452 1 #reduceActionFornamespace_member_declaration2:) 
	#(447 1 #reduceActionFornamespace_member_declaration2:) 
	#(488 1 #reduceActionFornamespace_member_declaration2:) 
	#(462 1 #reduceActionFornamespace_member_declaration2:) 
	#(499 1 #reduceActionFornamespace_member_declaration2:) 
	#(514 1 #reduceActionFornamespace_member_declaration2:) 
	#(509 1 #reduceActionFornamespace_member_declaration2:) 
	#(588 1 #reduceActionFornamespace_member_declaration2:) 
	#(444 1 #reduceActionFor_extern_alias_directives2:) 
	#(446 1 #reduceActionForextern_alias_directives1:) 
	#(449 1 #reduceActionFor_extern_alias_directives2:) 
	#(451 1 #reduceActionForextern_alias_directives1:) 
	#(457 1 #reduceActionFor_extern_alias_directives2:) 
	#(461 1 #reduceActionForextern_alias_directives1:) 
	#(471 1 #reduceActionFor_extern_alias_directives2:) 
	#(473 1 #reduceActionForextern_alias_directives1:) 
	#(485 1 #reduceActionFor_extern_alias_directives2:) 
	#(487 1 #reduceActionForextern_alias_directives1:) 
	#(491 1 #reduceActionFor_extern_alias_directives2:) 
	#(494 1 #reduceActionForextern_alias_directives1:) 
	#(496 1 #reduceActionForextern_alias_directives1:) 
	#(505 1 #reduceActionFor_extern_alias_directives2:) 
	#(508 1 #reduceActionForextern_alias_directives1:) 
	#(417 3 #reduceActionForgeneric_dimension_specifier1:) 
	#(432 2 #reduceActionForextern_alias_directives2:) 
	#(456 1 #reduceActionFormethod_body3:) 
	#(436 2 #reduceActionFormethod_declaration1:) 
	#(456 1 #reduceActionFormethod_body1:) 
	#(606 1 #reduceActionFornamespace_member_declaration2:) 
	#(602 1 #reduceActionFor_extern_alias_directives2:) 
	#(605 1 #reduceActionForextern_alias_directives1:) 
	#(517 3 #reduceActionForgeneric_dimension_specifier1:) 
	#(522 2 #reduceActionForextern_alias_directives2:) 
	#(533 5 #reduceActionForvariant_type_parameters2:) 
	#(544 1 #reduceActionFornamespace_member_declaration2:) 
	#(529 3 #reduceActionForgeneric_dimension_specifier1:) 
	#(538 2 #reduceActionForextern_alias_directives2:) 
	#(465 4 #reduceActionForparameter_array1:) 
	#(468 0 #reduceActionFor_attribute_target_specifier1:) 
	#(187 11 #reduceActionFordelegate_declaration1:) 
	#(512 2 #reduceActionForstatic_constructor_modifiers2:) 
	#(446 2 #reduceActionForextern_alias_directives2:) 
	#(451 2 #reduceActionForextern_alias_directives2:) 
	#(461 2 #reduceActionForextern_alias_directives2:) 
	#(473 2 #reduceActionForextern_alias_directives2:) 
	#(487 2 #reduceActionForextern_alias_directives2:) 
	#(494 2 #reduceActionForextern_alias_directives2:) 
	#(496 2 #reduceActionForextern_alias_directives2:) 
	#(497 1 #reduceActionForoperator_declarator1:) 
	#(497 1 #reduceActionForoperator_declarator2:) 
	#(497 1 #reduceActionForoperator_declarator3:) 
	#(508 2 #reduceActionForextern_alias_directives2:) 
	#(512 2 #reduceActionForstatic_constructor_modifiers1:) 
	#(605 2 #reduceActionForextern_alias_directives2:) 
	#(466 5 #reduceActionForfixed_parameter1:) 
	#(468 1 #reduceActionFor_extern_alias_directives2:) 
	#(339 11 #reduceActionForjoin_into_clause1:) 
	#(429 3 #reduceActionForconstructor_constraint1:) 
	#(426 3 #reduceActionFortype_parameter_constraints4:) 
	#(426 3 #reduceActionFortype_parameter_constraints5:) 
	#(428 3 #reduceActionForlocal_variable_declarators2:) 
	#(426 3 #reduceActionForlocal_variable_declarators2:) 
	#(512 3 #reduceActionForstatic_constructor_modifiers7:) 
	#(453 1 #reduceActionForvariable_declarator1:) 
	#(450 1 #reduceActionForinterpolated_regular_string1:) 
	#(459 1 #reduceActionForargument_value1:) 
	#(439 4 #reduceActionForindexer_declaration1:) 
	#(498 1 #reduceActionFormethod_body3:) 
	#(440 4 #reduceActionForoperator_declaration1:) 
	#(498 1 #reduceActionFormethod_body1:) 
	#(507 1 #reduceActionForordering_direction2:) 
	#(441 4 #reduceActionForconstructor_declaration1:) 
	#(507 1 #reduceActionForordering_direction1:) 
	#(512 3 #reduceActionForstatic_constructor_modifiers5:) 
	#(512 3 #reduceActionForstatic_constructor_modifiers3:) 
	#(512 3 #reduceActionForstatic_constructor_modifiers6:) 
	#(456 3 #reduceActionFormethod_body2:) 
	#(603 1 #reduceActionFornamespace_member_declaration2:) 
	#(469 2 #reduceActionForattribute_target_specifier1:) 
	#(445 1 #reduceActionForinterpolated_regular_string1:) 
	#(435 5 #reduceActionForfield_declaration1:) 
	#(437 5 #reduceActionForproperty_declaration1:) 
	#(482 0 #reduceActionFor_extern_alias_directives1:) 
	#(479 0 #nil) 
	#(481 0 #nil) 
	#(503 1 #reduceActionFornamespace_member_declaration2:) 
	#(504 1 #reduceActionFornamespace_member_declaration2:) 
	#(604 1 #reduceActionForextern_alias_directives1:) 
	#(426 5 #reduceActionFortype_parameter_constraints7:) 
	#(434 6 #reduceActionForconstant_declaration1:) 
	#(453 3 #reduceActionForvariable_declarator2:) 
	#(450 3 #reduceActionForlocal_variable_declarators2:) 
	#(459 3 #reduceActionFormember_name2:) 
	#(472 2 #reduceActionForproperty_body2:) 
	#(438 6 #reduceActionForevent_declaration1:) 
	#(493 3 #reduceActionForindexer_body2:) 
	#(484 1 #reduceActionForextern_alias_directives1:) 
	#(482 1 #reduceActionFor_extern_alias_directives2:) 
	#(493 3 #reduceActionForindexer_body1:) 
	#(475 2 #reduceActionForattribute_target_specifier1:) 
	#(479 1 #reduceActionFornamespace_member_declaration2:) 
	#(481 1 #reduceActionFornamespace_member_declaration2:) 
	#(475 2 #reduceActionForaccessor_declarations2:) 
	#(498 3 #reduceActionFormethod_body2:) 
	#(510 0 #nil) 
	#(513 1 #reduceActionForordering_direction2:) 
	#(443 6 #reduceActionForstatic_constructor_declaration1:) 
	#(513 1 #reduceActionForordering_direction1:) 
	#(601 6 #reduceActionForfixed_size_buffer_declaration1:) 
	#(604 2 #reduceActionForextern_alias_directives2:) 
	#(542 6 #reduceActionForinterface_event_declaration1:) 
	#(545 1 #reduceActionForordering_direction1:) 
	#(545 1 #reduceActionForordering_direction2:) 
	#(448 3 #reduceActionForconstant_declarator1:) 
	#(445 3 #reduceActionForlocal_variable_declarators2:) 
	#(476 0 #reduceActionFor_attribute_target_specifier1:) 
	#(492 5 #reduceActionForindexer_declarator1:) 
	#(484 2 #reduceActionForaccessor_modifiers5:) 
	#(506 5 #reduceActionForconstructor_declarator1:) 
	#(510 1 #reduceActionFornamespace_member_declaration2:) 
	#(541 7 #reduceActionForinterface_property_declaration1:) 
	#(545 2 #reduceActionForattribute_target_specifier1:) 
	#(545 2 #reduceActionForaccessor_declarations2:) 
	#(472 4 #reduceActionForproperty_body1:) 
	#(476 1 #reduceActionFor_extern_alias_directives2:) 
	#(438 8 #reduceActionForevent_declaration2:) 
	#(486 2 #reduceActionForattribute_target_specifier1:) 
	#(486 2 #reduceActionForaccessor_declarations2:) 
	#(483 1 #reduceActionForordering_direction2:) 
	#(478 4 #reduceActionForget_accessor_declaration1:) 
	#(483 1 #reduceActionForordering_direction1:) 
	#(480 4 #reduceActionForset_accessor_declaration1:) 
	#(442 8 #reduceActionFordestructor_declaration1:) 
	#(607 4 #reduceActionForfixed_size_buffer_declarator1:) 
	#(546 3 #reduceActionForinterface_get_accessor1:) 
	#(547 3 #reduceActionForinterface_get_accessor1:) 
	#(477 2 #reduceActionForattribute_target_specifier1:) 
	#(490 3 #reduceActionForremove_accessor_declaration1:) 
	#(489 3 #reduceActionForadd_accessor_declaration1:) 
	#(492 7 #reduceActionForindexer_declarator2:) 
	#(502 7 #reduceActionForconversion_operator_declarator2:) 
	#(502 7 #reduceActionForconversion_operator_declarator1:) 
	#(500 7 #reduceActionForunary_operator_declarator1:) 
	#(455 10 #reduceActionFormethod_header1:) 
	#(543 10 #reduceActionForinterface_indexer_declaration1:) 
	#(540 10 #reduceActionForinterface_method_declaration1:) 
	#(511 5 #reduceActionForconstructor_initializer1:) 
	#(511 5 #reduceActionForconstructor_initializer2:) 
	#(501 10 #reduceActionForbinary_operator_declarator1:)
	).
]

{ #category : #generated }
CSharpParser >> symbolNames [
	^ #('"await"' '"~"' '"/"' '"*"' '"!"' '"<="' '"<<"' '"%"' '"-"' '">="' '"new"' '"--"' '"checked"' '"typeof"' '"is"' '"nameof"' '"default"' '"unchecked"' '"+"' '"from"' '"delegate"' '"let"' '"in"' '"=>"' '"on"' '"join"' '"where"' '"??"' '"base"' '"=="' '"as"' '"&"' '"!="' '"++"' '"&&"' '"|"' '"^"' '"||"' '"decimal"' '"bool"' '"byte"' '"sbyte"' '"::"' '"int"' '"ushort"' '"short"' '"static"' '"uint"' '"."' '"namespace"' '"extern"' '"{"' '"long"' '"using"' '";"' '"alias"' '"="' '":"' '"<"' '"out"' '"ref"' '","' '"this"' '")"' '"("' '"]"' '"void"' '"char"' '"ulong"' '"double"' '"float"' '"equals"' '"string"' '"object"' '"?"' '"["' '"into"' '"get"' '"params"' '"event"' '"set"' '"override"' '"operator"' '"remove"' '"add"' '"virtual"' '"true"' '"internal"' '"orderby"' '"abstract"' '"private"' '"false"' '"readonly"' '"struct"' '"sealed"' '"volatile"' '"partial"' '"type"' '"->"' '"unsafe"' '"property"' '"stackalloc"' '"fixed"' '"sizeof"' '"param"' '"protected"' '"explicit"' '"implicit"' '"enum"' '"interface"' '"public"' '"field"' '"module"' '"assembly"' '"method"' '"|="' '"&="' '"<<="' '"^="' '"%="' '"class"' '"var"' '">>="' '"/="' '"if"' '"descending"' '"ascending"' '"group"' '"select"' '"const"' '"-="' '"+="' '"by"' '"*="' '"try"' '"throw"' '"when"' '"catch"' '"else"' '"yield"' '"lock"' '"finally"' '"return"' '"goto"' '"case"' '"switch"' '"while"' '"continue"' '"do"' '"for"' '"break"' '"foreach"' '<gt>' '<gtgt>' '<rightBrace>' '<comment>' '<Identifier>' '<IntegerLiteral>' '<RealLiteral>' '<CharacterLiteral>' '<InterpolatedRegularStringWhole>' '<InterpolatedRegularStringStart>' '<InterpolatedRegularStringEnd>' '<InterpolatedRegularStringMid>' '<InterpolatedVerbatimStringLiteral>' '<InterpolatedVerbatimStringStart>' '<InterpolatedVerbatimStringEnd>' '<InterpolatedVerbatimStringMid>' '<StringLiteral>' '<NullLiteral>' '<whitespace>' '<patternToken>' 'using_directives' 'using_directive' 'using_alias_directive' 'using_namespace_directive' 'using_static_directive' 'namespace_or_type_name' 'namespace_name' 'type_name' 'namespace_member_declarations' 'type_declaration' 'class_declaration' 'struct_declaration' 'interface_declaration' 'enum_declaration' 'delegate_declaration' '_type_argument_list' 'qualified_alias_member' 'type' '_type' 'value_type' 'reference_type' 'type_parameter' 'struct_type' 'enum_type' 'simple_type' 'nullable_type' 'numeric_type' 'integral_type' 'floating_point_type' 'non_nullable_value_type' 'class_type' 'interface_type' 'array_type' 'delegate_type' 'non_array_type' 'rank_specifiers' '_rank_specifiers' 'rank_specifier' '_dim_separators' 'dim_separators' 'type_arguments' 'type_argument_list' 'type_argument' 'variable_reference' 'argument_list' '_argument_list' 'argument' '_argument_name' 'argument_value' 'argument_name' 'primary_no_array_creation_expression' 'array_creation_expression' 'primary_expression' 'literal' 'interpolated_string_expression' 'simple_name' 'parenthesized_expression' 'member_access' 'invocation_expression' 'element_access' 'this_access' 'base_access' 'post_increment_expression' 'post_decrement_expression' 'object_creation_expression' 'delegate_creation_expression' 'anonymous_object_creation_expression' 'typeof_expression' 'checked_expression' 'unchecked_expression' 'default_value_expression' 'nameof_expression' 'anonymous_method_expression' 'interpolated_regular_string' 'interpolated_verbatim_string' 'extern_alias_directive' 'StartInterpolatedString' 'extern_alias_directives' 'interpolated_regular_string_body' 'namespace_declaration' 'interpolation' '_semicolon' 'constant_expression' 'namespace_body' 'StartInterpolatedVerbatimString' 'qualified_identifier' 'interpolated_verbatim_string_body' 'B e g i n' '_namespace_member_declarations' 'predefined_type_expression' 'qualified_alias_member_expression' 'predefined_type' 'expression_list' '_object_or_collection_initializer' 'object_or_collection_initializer' 'object_initializer' 'collection_initializer' '_member_initializer_list' 'member_initializer_list' 'member_initializer' 'initializer_target' 'initializer_value' 'element_initializer_list' 'element_initializer' 'non_assignment_expression' '_array_initializer' 'array_initializer' 'anonymous_object_initializer' '_member_declarator_list' 'member_declarator_list' 'member_declarator' 'null_conditional_member_access' 'unbound_type_name' 'void_type' '_generic_dimension_specifier' 'generic_dimension_specifier' '_commas' 'commas' 'named_entity' 'named_entity_target' 'null_conditional_expression' 'unary_expression' 'pre_increment_expression' 'pre_decrement_expression' 'cast_expression' 'await_expression' 'null_conditional_operations' '_null_conditional_operations' 'null_conditional_invocation_expression' 'multiplicative_expression' 'additive_expression' 'shift_expression' 'relational_expression' 'equality_expression' '_global_attributes' 'exclusive_or_expression' 'inclusive_or_expression' 'conditional_and_expression' 'conditional_or_expression' 'null_coalescing_expression' 'conditional_expression' 'anonymous_function_signature' 'anonymous_function_body' 'lambda_expression' '_explicit_anonymous_function_signature' 'explicit_anonymous_function_signature' 'implicit_anonymous_function_signature' '_explicit_anonymous_function_paramenter_list' 'explicit_anonymous_function_paramenter_list' 'explicit_anonymous_function_paramenter' '_anonymous_function_parameter_modifier' 'anonymous_function_parameter_modifier' '_implicit_anonymous_function_parameter_list' 'implicit_anonymous_function_parameter' 'implicit_anonymous_function_parameter_list' 'from_clause' 'query_body' 'query_expression' '_query_body_clauses' 'select_or_group_clause' '_query_continuation' 'query_body_clauses' 'query_body_clause' 'let_clause' 'where_clause' 'join_clause' 'join_into_clause' 'orderby_clause' 'boolean_expression' 'orderings' 'ordering' '_ordering_direction' 'ordering_direction' 'select_clause' 'group_clause' 'query_continuation' 'assignment_operator' 'assignment' '_expression' 'labeled_statement' 'declaration_statement' 'embedded_statement' 'empty_statement' 'expression_statement' 'selection_statement' 'iteration_statement' 'jump_statement' 'try_statement' 'checked_statement' 'unchecked_statement' 'lock_statement' 'using_statement' 'yield_statement' '_statement_list' 'statement_list' 'local_variable_declaration' 'local_constant_declaration' 'local_variable_type' 'local_variable_declarators' 'local_variable_declarator' '_local_variable_declarator_name' 'local_variable_initializer' 'const_declarators' 'const_declarator' 'statement_expression' 'if_statement' 'switch_statement' 'switch_block' '_switch_sections' 'switch_sections' 'switch_section' '_using_directives' 'switch_label' 'while_statement' 'do_statement' 'for_statement' 'foreach_statement' '_for_initializer' '_for_condition' '_for_iterator' 'for_initializer' 'statement_expression_list' 'for_condition' 'for_iterator' 'break_statement' 'continue_statement' 'goto_statement' 'return_statement' 'throw_statement' 'catch_clauses' 'finally_clause' 'catch_clause' '_exception_specifier' '_exception_filter' 'exception_specifier' '_identifier' 'exception_filter' 'resource_acquisition' '_attributes' '_class_modifiers' '_partial' '_type_parameter_list' '_class_base' '_type_parameter_constraints_clauses' 'class_body' 'class_modifiers' 'class_modifier' 'type_parameter_list' 'type_parameters' 'class_base' 'interface_type_list' 'type_parameter_constraints_clauses' 'type_parameter_constraints_clause' 'type_parameter_constraints' 'primary_constraint' 'secondary_constraints' 'constructor_constraint' 'interface_type_constraint' '_class_member_declarations' 'class_member_declarations' 'class_member_declaration' 'constant_declaration' 'field_declaration' 'method_declaration' 'property_declaration' 'event_declaration' 'indexer_declaration' 'operator_declaration' 'constructor_declaration' 'destructor_declaration' 'static_constructor_declaration' '_constant_modifiers' 'constant_declarators' 'constant_modifers' 'constant_modifer' 'constant_declarator' '_field_modifiers' 'variable_declarators' 'field_modifiers' 'field_modifier' 'variable_declarator' 'variable_initializer' 'method_header' 'method_body' '_method_modifiers' 'return_type' 'member_name' '_formal_parameters_list' 'method_modifiers' 'method_modifier' 'formal_parameters_list' 'fixed_parameters' 'parameter_array' 'fixed_parameter' '_parameter_modifier' '_default_argument' 'default_argument' 'parameter_modifier' '_property_modifiers' 'property_body' 'property_modifiers' 'property_modifier' 'accessor_declarations' '_property_initializer' 'property_initializer' 'get_accessor_declaration' '_set_accessor_declaration' 'set_accessor_declaration' '_get_accessor_declaration' '_accessor_modifiers' 'accessor_body' 'accessor_modifiers' '_event_modifiers' 'event_accessor_declarations' 'event_modifiers' 'event_modifier' 'add_accessor_declaration' 'remove_accessor_declaration' '_indexer_modifiers' 'indexer_declarator' 'indexer_body' 'indexer_modifiers' 'indexer_modifier' 'operator_modifiers' 'operator_declarator' 'operator_body' 'operator_modifier' 'unary_operator_declarator' 'binary_operator_declarator' 'conversion_operator_declarator' 'overloadable_unary_operator' 'overloadable_binary_operator' '_constructor_modifiers' 'constructor_declarator' 'constructor_body' 'constructor_modifiers' 'constructor_modifier' '_constructor_initializer' 'constructor_initializer' 'static_constructor_modifiers' 'static_constructor_body' '_extern' '_struct_modifiers' '_struct_interfaces' 'struct_body' 'struct_modifiers' 'struct_modifier' 'struct_interfaces' '_struct_member_declarations' 'struct_member_declarations' 'struct_member_declaration' '_variable_initializer_list' 'variable_initializer_list' '_interface_modifiers' '_variant_type_parameter_list' '_interface_base' 'interface_body' 'interface_modifiers' 'interface_modifier' 'variant_type_parameter_list' 'variant_type_parameters' '_variance_annotation' 'variance_annotation' 'interface_base' '_interface_member_declarations' 'interface_member_declarations' 'interface_member_declaration' 'interface_method_declaration' 'interface_property_declaration' 'interface_event_declaration' 'interface_indexer_declaration' '_new' 'interface_accessors' 'interface_get_accessor' 'interface_set_accessor' '_enum_modifers' '_enum_base' 'enum_body' 'enum_base' '_enum_member_declarations' 'enum_member_declarations' 'enum_modifers' 'enum_modifer' 'enum_member_declaration' '_delegate_modifiers' 'delegate_modifiers' 'delegate_modifier' 'global_attributes' 'global_attribute_sections' 'global_attribute_section' 'global_attribute_target_specifier' 'attribute_list' 'global_attribute_target' 'attributes' 'attribute_sections' 'attribute_section' '_attribute_target_specifier' 'attribute_target_specifier' 'attribute_target' 'attribute' 'attribute_name' '_attribute_arguments' 'attribute_arguments' '_positional_argument_list' 'positional_argument_list' 'named_argument_list' 'positional_argument' 'attribute_argument_expression' 'named_argument' 'boolean_literal' '_extern_alias_directives' 'block' 'expression' 'statement' 'namespace_member_declaration' '_unsafe' 'unsafe_statement' 'pointer_type' 'unmanaged_type' 'pointer_member_access' 'pointer_element_access' 'sizeof_expression' 'pointer_indirection_expression' 'addressof_expression' 'fixed_statement' 'fixed_pointer_declarators' 'fixed_pointer_declarator' 'fixed_pointer_initializer' 'fixed_size_buffer_declaration' '_fixed_size_buffer_modifiers' 'buffer_element_type' 'fixed_size_buffer_declarators' 'fixed_size_buffer_modifiers' 'fixed_size_buffer_modifier' 'fixed_size_buffer_declarator' 'stackalloc_initializer' 'E O F' 'error' 'switch_labels' 'compilation_unit' 'and_expression')
]

{ #category : #generated }
CSharpParser >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #OrderedCollection #CSProgramNode #CSUsingAliasDirectiveNode #CSUsingNamespaceDirectiveNode #CSUsingStaticDirectiveNode #CSTypeNode #CSTypeNode #CSTypeNode #OrderedCollection #CSDeclarationNode #CSClassDeclarationNode #CSStructDeclarationNode #CSInterfaceDeclarationNode #CSEnumDeclarationNode #CSDelegateDeclarationNode #CSTypeArgumentListNode #CSQualifiedAliasMemberNode #CSTypeNode #CSTypeNode #CSTypeNode #CSTypeNode #CSTypeNameNode #CSTypeNode #CSTypeNode #CSSimpleTypeNode #CSNullableTypeNode #SmaCCToken #SmaCCToken #SmaCCToken #CSTypeNode #CSTypeNode #CSTypeNode #CSArrayTypeNode #CSTypeNode #CSTypeNode #OrderedCollection #OrderedCollection #CSRankSpecifierNode #OrderedCollection #OrderedCollection #OrderedCollection #CSTypeArgumentListNode #CSTypeNode #CSExpressionNode #OrderedCollection #OrderedCollection #CSArgumentNode #OrderedCollection #OrderedCollection #OrderedCollection #CSExpressionNode #CSArrayCreationExpressionNode #CSExpressionNode #CSLiteralExpressionNode #CSInterpolatedStringExpressionNode #CSSimpleNameNode #CSExpressionNode #CSMemberAccessNode #CSInvocationExpressionNode #CSElementAccessNode #CSThisAccessNode #CSBaseAccessNode #CSPostExpressionNode #CSPostExpressionNode #CSObjectCreationExpressionNode #CSDelegateCreationExpressionNode #CSAnonymousObjectCreationExpressionNode #CSTypeofExpressionNode #CSCheckedExpressionNode #CSUncheckedExpressionNode #CSDefaultValueExpressionNode #CSNameofExpressionNode #CSAnonymousMethodExpressionNode #OrderedCollection #OrderedCollection #CSExternAliasDirectiveNode #ByteSymbol #OrderedCollection #OrderedCollection #CSNamespaceDeclarationNode #CSInterpolationNode #SmaCCToken #CSExpressionNode #OrderedCollection #ByteSymbol #CSQualifiedIdentifierNode #OrderedCollection #CSCompilationUnitNode #OrderedCollection #CSTypeExpressionNode #CSTypeExpressionNode #CSSimpleTypeNode #OrderedCollection #CSProgramNode #CSProgramNode #CSObjectInitializerNode #CSCollectionInitializerNode #OrderedCollection #OrderedCollection #CSMemberInitializerNode #OrderedCollection #CSProgramNode #OrderedCollection #CSElementInitializerNode #CSExpressionNode #CSArrayInitializerNode #CSArrayInitializerNode #OrderedCollection #OrderedCollection #OrderedCollection #CSMemberDeclaratorNode #CSNullConditionalMemberAccessNode #CSUnboundTypeNameNode #CSVoidTypeNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #CSExpressionNode #CSExpressionNode #CSNullConditionalExpressionNode #CSExpressionNode #CSPrefixExpressionNode #CSPrefixExpressionNode #CSCastExpressionNode #CSAwaitExpressionNode #CSExpressionNode #CSExpressionNode #CSNullConditionalInvocationExpressionNode #CSExpressionNode #CSExpressionNode #CSExpressionNode #CSExpressionNode #CSExpressionNode #OrderedCollection #CSExpressionNode #CSExpressionNode #CSExpressionNode #CSExpressionNode #CSExpressionNode #CSExpressionNode #CSProgramNode #CSProgramNode #CSLambdaExpressionNode #CSExplicitAnonymousFunctionSignatureNode #CSExplicitAnonymousFunctionSignatureNode #CSImplicitAnonymousFunctionSignatureNode #OrderedCollection #OrderedCollection #CSAnonymousFunctionParameterNode #SmaCCToken #SmaCCToken #OrderedCollection #SmaCCToken #OrderedCollection #OrderedCollection #OrderedCollection #CSQueryExpressionNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #CSExpressionNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #SmaCCToken #CSAssignmentNode #CSExpressionNode #CSLabeledStatementNode #CSDeclarationStatementNode #CSStatementNode #CSEmptyStatementNode #CSExpressionStatementNode #CSStatementNode #CSStatementNode #CSStatementNode #CSTryStatementNode #CSCheckedStatementNode #CSUncheckedStatementNode #CSLockStatementNode #CSUsingStatementNode #CSYieldStatementNode #OrderedCollection #OrderedCollection #CSLocalVariableDeclarationNode #CSLocalConstantDeclarationNode #CSTypeNode #OrderedCollection #CSLocalVariableDeclaratorNode #CSSimpleNameNode #CSProgramNode #OrderedCollection #CSConstDeclaratorNode #CSExpressionNode #CSIfStatementNode #CSSwitchStatementNode #OrderedCollection #OrderedCollection #OrderedCollection #CSSwitchSectionNode #OrderedCollection #CSSwitchLabelNode #CSWhileStatementNode #CSDoStatementNode #CSForStatementNode #CSForeachStatementNode #CSProgramNode #CSExpressionNode #CSStatementListNode #CSProgramNode #OrderedCollection #CSExpressionNode #CSStatementListNode #CSBreakStatementNode #CSContinueStatementNode #CSGotoStatementNode #CSReturnStatementNode #CSThrowStatementNode #OrderedCollection #CSFinallyClauseNode #CSCatchClauseNode #OrderedCollection #CSExceptionFilterNode #OrderedCollection #SmaCCToken #CSExceptionFilterNode #CSProgramNode #OrderedCollection #OrderedCollection #SmaCCToken #CSTypeParameterListNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #SmaCCToken #CSTypeParameterListNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #CSTypeParameterConstraintsClauseNode #OrderedCollection #CSProgramNode #OrderedCollection #CSConstructorConstraintNode #CSTypeConstraintNode #OrderedCollection #OrderedCollection #CSDeclarationNode #CSConstantDeclarationNode #CSFieldDeclarationNode #CSMethodDeclarationNode #CSPropertyDeclarationNode #CSEventDeclarationNode #CSIndexerDeclarationNode #CSOperatorDeclarationNode #CSConstructorDeclarationNode #CSDestructorDeclarationNode #CSStaticConstructorDeclarationNode #OrderedCollection #OrderedCollection #OrderedCollection #SmaCCToken #CSConstantDeclaratorNode #OrderedCollection #OrderedCollection #OrderedCollection #SmaCCToken #CSVariableDeclaratorNode #CSProgramNode #CSMethodHeaderNode #CSMethodBodyNode #OrderedCollection #CSTypeNode #OrderedCollection #OrderedCollection #OrderedCollection #SmaCCToken #OrderedCollection #OrderedCollection #CSArrayParameterNode #CSFixedParameterNode #SmaCCToken #OrderedCollection #OrderedCollection #SmaCCToken #OrderedCollection #OrderedCollection #OrderedCollection #SmaCCToken #OrderedCollection #OrderedCollection #OrderedCollection #CSGetAccessorDeclarationNode #CSSetAccessorDeclarationNode #CSSetAccessorDeclarationNode #CSGetAccessorDeclarationNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #SmaCCToken #CSAddAccessorDeclarationNode #CSRemoveAccessorDeclarationNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #SmaCCToken #OrderedCollection #OrderedCollection #CSMethodBodyNode #SmaCCToken #OrderedCollection #OrderedCollection #OrderedCollection #SmaCCToken #SmaCCToken #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #SmaCCToken #CSConstructorInitializerNode #CSConstructorInitializerNode #OrderedCollection #OrderedCollection #SmaCCToken #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #SmaCCToken #OrderedCollection #OrderedCollection #OrderedCollection #CSDeclarationNode #OrderedCollection #OrderedCollection #OrderedCollection #CSVariantTypeParameterListNode #OrderedCollection #OrderedCollection #OrderedCollection #SmaCCToken #CSVariantTypeParameterListNode #OrderedCollection #SmaCCToken #SmaCCToken #OrderedCollection #OrderedCollection #OrderedCollection #CSDeclarationNode #CSInterfaceMethodDeclarationNode #CSInterfacePropertyDeclarationNode #CSInterfaceEventDeclarationNode #CSInterfaceIndexerDeclarationNode #SmaCCToken #OrderedCollection #CSInterfacePropertyAccessorNode #CSInterfacePropertyAccessorNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #SmaCCToken #CSEnumDeclarationNode #OrderedCollection #OrderedCollection #SmaCCToken #OrderedCollection #OrderedCollection #CSAttributeNode #OrderedCollection #OrderedCollection #SmaCCToken #OrderedCollection #OrderedCollection #CSAttributeNode #OrderedCollection #OrderedCollection #SmaCCToken #CSAttributeValueNode #CSTypeNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #CSExpressionNode #CSExpressionNode #CSNamedArgumentNode #SmaCCToken #OrderedCollection #CSBlockStatementNode #CSExpressionNode #CSStatementNode #CSDeclarationNode #SmaCCToken #CSUnsafeStatementNode #CSPointerTypeNode #CSTypeNode #CSPointerMemberAccessNode #CSPointerElementAccessNode #CSSizeofExpressionNode #CSPrefixExpressionNode #CSPrefixExpressionNode #CSFixedStatementNode #OrderedCollection #CSFixedPointerDeclaratorNode #OrderedCollection #CSFixedSizeBufferDeclarationNode #OrderedCollection #CSTypeNode #OrderedCollection #OrderedCollection #SmaCCToken #CSFixedSizeBufferDeclaratorNode #CSStackallocInitializerNode #SmaCCToken #SmaCCToken #OrderedCollection #CSCompilationUnitNode #CSExpressionNode)
]

{ #category : #generated }
CSharpParser >> transitionTable [
^#(
#[1 0 6 0 11 0 6 0 21 0 6 0 47 0 6 0 50 0 25 0 51 0 6 0 54 0 6 0 76 0 6 0 88 0 6 0 90 0 6 0 91 0 6 0 94 0 6 0 95 0 6 0 97 0 6 0 100 0 6 0 106 0 6 0 109 0 6 0 110 0 6 0 111 0 6 0 121 0 29 0 248 0 33 0 250 0 37 2 71 0 6 2 97 0 41 2 100] 
#[1 0 10 0 11 0 10 0 21 0 10 0 47 0 45 0 50 0 49 0 76 0 10 0 88 0 10 0 90 0 10 0 91 0 10 0 94 0 10 0 95 0 10 0 97 0 10 0 100 0 10 0 106 0 10 0 109 0 10 0 110 0 10 0 111 0 10 0 121 0 53 0 182 0 57 0 183 0 61 0 184 0 65 0 185 0 69 0 186 0 73 0 187 0 77 0 252 0 81 1 155 0 85 2 54 0 89 2 55 0 93 2 56 0 97 2 75] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 0 129 0 13 0 133 0 14 0 137 0 16 0 141 0 17 0 145 0 18 0 149 0 19 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 0 169 0 39 0 173 0 40 0 177 0 41 0 181 0 42 0 185 0 44 0 189 0 45 0 193 0 46 0 197 0 48 0 201 0 52 0 205 0 53 0 209 0 54 0 213 0 55 0 217 0 63 0 221 0 65 0 225 0 67 0 229 0 68 0 233 0 69 0 237 0 70 0 241 0 71 0 245 0 73 0 249 0 74 0 253 0 87 1 1 0 92 1 5 0 100 1 9 0 103 1 13 0 104 1 17 0 122 1 21 0 125 1 25 0 130 1 29 0 135 1 33 0 136 1 37 0 140 1 41 0 141 1 45 0 143 1 49 0 144 1 53 0 146 1 57 0 147 1 61 0 148 1 65 0 149 1 69 0 150 1 73 0 151 1 77 0 152 1 81 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 1 113 0 178 1 117 0 180 1 121 0 189 1 125 0 190 1 129 0 192 1 133 0 193 1 137 0 194 1 141 0 195 1 145 0 196 1 149 0 197 1 153 0 198 1 157 0 199 1 161 0 200 1 165 0 201 1 169 0 202 1 173 0 203 1 177 0 204 1 181 0 205 1 185 0 206 1 189 0 207 1 193 0 223 1 197 0 224 1 201 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 1 225 0 231 1 229 0 232 1 233 0 233 1 237 0 234 1 241 0 235 1 245 0 236 1 249 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 2 57 1 30 2 61 1 37 2 65 1 38 2 69 1 39 2 73 1 40 2 77 1 41 2 81 1 42 2 85 1 45 2 89 1 94 2 93 1 96 2 97 1 97 2 101 1 98 2 105 1 99 2 109 1 100 2 113 1 101 2 117 1 102 2 121 1 103 2 125 1 104 2 129 1 105 2 133 1 106 2 137 1 107 2 141 1 108 2 145 1 109 2 149 1 112 2 153 1 113 2 157 1 114 2 161 1 121 2 165 1 122 2 169 1 123 2 173 1 130 2 177 1 131 2 181 1 132 2 185 1 133 2 189 1 141 2 193 1 142 2 197 1 143 2 201 1 144 2 205 1 145 2 209 2 70 2 213 2 72 2 217 2 74 2 221 2 77 2 225 2 78 2 229 2 79 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 2 253 2 85] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 3 201 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[1 0 201 0 52 3 209 2 72] 
#[0 3 213 0 56] 
#[0 0 22 0 11 0 21 0 47 0 50 0 51 0 54 0 76 0 88 0 90 0 91 0 94 0 95 0 97 0 100 0 106 0 109 0 110 0 111 0 121 0 155 2 97] 
#[1 0 26 0 11 0 26 0 21 0 26 0 47 0 26 0 50 0 25 0 51 0 26 0 54 0 26 0 76 0 26 0 88 0 26 0 90 0 26 0 91 0 26 0 94 0 26 0 95 0 26 0 97 0 26 0 100 0 26 0 106 0 26 0 109 0 26 0 110 0 26 0 111 0 26 0 121 0 26 0 155 3 217 0 248 0 26 2 97] 
#[1 0 30 0 11 0 30 0 21 0 30 0 47 0 30 0 50 3 221 0 54 0 30 0 76 0 30 0 88 0 30 0 90 0 30 0 91 0 30 0 94 0 30 0 95 0 30 0 97 0 30 0 100 0 30 0 106 0 30 0 109 0 30 0 110 0 30 0 111 0 30 0 121 3 225 0 173 3 229 0 174 3 233 0 175 3 237 0 176 3 241 0 177 3 245 1 128 0 30 2 97] 
#[0 0 0 2 97] 
#[1 3 249 0 157 3 253 1 2] 
#[1 4 1 0 80 4 5 0 98 4 9 0 101 4 13 0 105 4 17 0 112 4 21 0 115 4 25 0 143 0 34 0 157 4 29 2 57 4 33 2 58 4 37 2 59] 
#[0 0 38 0 11 0 21 0 47 0 50 0 76 0 88 0 90 0 91 0 94 0 95 0 97 0 100 0 106 0 109 0 110 0 111 0 121 0 155 2 97] 
#[0 0 42 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 50 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157 2 97] 
#[0 0 42 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 50 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157 2 97] 
#[0 0 42 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 50 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157 2 97] 
#[0 0 42 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 50 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157 2 97] 
#[0 0 42 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 50 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157 2 97] 
#[0 0 38 0 11 0 21 0 47 0 50 0 76 0 88 0 90 0 91 0 94 0 95 0 97 0 100 0 106 0 109 0 110 0 111 0 121 0 155 2 97] 
#[1 4 41 0 11 0 46 0 21 4 45 0 47 4 49 0 88 4 53 0 90 4 57 0 91 0 50 0 94 4 61 0 95 0 7 0 97 4 65 0 100 4 69 0 106 0 62 0 109 0 54 0 110 4 73 0 111 0 58 0 121 4 77 1 156 4 81 1 162 4 85 1 163 4 89 2 3 4 93 2 6 4 97 2 7 4 101 2 14 4 105 2 18 4 109 2 19 4 113 2 36 4 117 2 42 4 121 2 43 4 125 2 45 4 129 2 46 4 133 2 47] 
#[0 0 66 0 2 0 11 0 21 0 23 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 60 0 61 0 63 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 78 0 79 0 80 0 81 0 82 0 84 0 85 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 157] 
#[1 0 70 0 2 0 70 0 11 0 70 0 21 0 70 0 23 0 70 0 39 0 70 0 40 0 70 0 41 0 70 0 42 0 70 0 44 0 70 0 45 0 70 0 46 0 70 0 47 0 70 0 48 0 70 0 51 0 70 0 53 0 70 0 60 0 70 0 61 0 70 0 63 0 70 0 67 0 70 0 68 0 70 0 69 0 70 0 70 0 70 0 71 0 70 0 73 0 70 0 74 0 49 0 76 0 70 0 78 0 70 0 79 0 70 0 80 0 70 0 81 0 70 0 82 0 70 0 84 0 70 0 85 0 70 0 86 0 70 0 88 0 70 0 90 0 70 0 91 0 70 0 93 0 70 0 94 0 70 0 95 0 70 0 96 0 70 0 97 0 70 0 100 0 70 0 103 0 70 0 106 0 70 0 109 0 70 0 110 0 70 0 111 0 70 0 121 0 70 0 130 0 70 0 157 4 137 2 56] 
#[0 0 74 0 2 0 11 0 21 0 23 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 60 0 61 0 63 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 78 0 79 0 80 0 81 0 82 0 84 0 85 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 157] 
#[0 0 0 2 97] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 0 221 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 4 141 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 2 61 1 37 4 145 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 2 209 2 70 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 0 221 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 4 141 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 2 61 1 37 4 149 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 2 209 2 70 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 0 221 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 4 141 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 2 61 1 37 4 153 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 2 209 2 70 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 0 221 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 4 141 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 2 61 1 37 4 157 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 2 209 2 70 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 0 221 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 4 141 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 2 61 1 37 4 161 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 2 209 2 70 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84] 
#[1 4 165 0 39 4 169 0 40 4 173 0 41 4 177 0 42 4 181 0 44 4 185 0 45 4 189 0 46 4 193 0 48 4 197 0 52 4 201 0 53 0 225 0 67 4 205 0 68 4 209 0 69 4 213 0 70 4 217 0 71 4 221 0 73 4 225 0 74 4 229 0 76 4 233 0 157 1 113 0 178 1 117 0 180 4 237 0 189 4 241 0 190 1 129 0 192 1 133 0 193 1 137 0 194 1 141 0 195 1 145 0 196 1 149 0 197 1 153 0 198 1 157 0 199 1 161 0 200 1 165 0 201 1 169 0 202 1 173 0 203 1 177 0 204 4 245 0 205 4 249 0 206 4 253 0 207 5 1 0 210 5 5 1 24 2 57 1 30 2 225 2 78 2 229 2 79] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 0 221 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 4 141 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 2 61 1 37 5 9 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 2 209 2 70 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84] 
#[1 0 201 0 52 5 13 0 65 5 17 2 72] 
#[0 5 21 0 65] 
#[0 5 25 0 65] 
#[0 5 29 0 65] 
#[1 0 201 0 52 5 33 0 65 5 37 2 72] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 0 221 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 4 141 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 2 61 1 37 5 41 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 2 209 2 70 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84] 
#[1 0 78 0 52 5 45 0 65 5 49 1 61 5 53 1 62] 
#[1 5 57 0 49 5 61 0 76] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 0 221 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 4 141 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 2 61 1 37 5 65 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 2 209 2 70 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 0 221 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 4 141 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 2 61 1 37 5 69 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 2 209 2 70 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84] 
#[1 0 82 0 4 0 86 0 49 0 82 0 64 0 82 0 75 0 82 0 76 0 82 0 157] 
#[1 0 90 0 4 0 86 0 49 0 90 0 64 0 90 0 75 0 90 0 76 0 90 0 157] 
#[1 0 94 0 4 0 86 0 49 0 94 0 64 0 94 0 75 0 94 0 76 0 94 0 157] 
#[1 0 94 0 4 0 86 0 49 0 94 0 64 0 94 0 75 0 94 0 76 0 94 0 157] 
#[1 0 94 0 4 0 86 0 49 0 94 0 64 0 94 0 75 0 94 0 76 0 94 0 157] 
#[1 0 94 0 4 0 86 0 49 0 94 0 64 0 94 0 75 0 94 0 76 0 94 0 157] 
#[1 0 94 0 4 0 86 0 49 0 94 0 64 0 94 0 75 0 94 0 76 0 94 0 157] 
#[1 0 94 0 4 0 86 0 49 0 94 0 64 0 94 0 75 0 94 0 76 0 94 0 157] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 0 129 0 13 0 133 0 14 0 137 0 16 0 141 0 17 0 145 0 18 0 149 0 19 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 0 169 0 39 0 173 0 40 0 177 0 41 0 181 0 42 0 185 0 44 0 189 0 45 0 193 0 46 0 197 0 48 0 201 0 52 0 205 0 53 0 209 0 54 0 213 0 55 0 217 0 63 0 221 0 65 0 225 0 67 0 229 0 68 0 233 0 69 0 237 0 70 0 241 0 71 0 245 0 73 0 249 0 74 0 253 0 87 1 1 0 92 1 5 0 100 1 9 0 103 1 13 0 104 1 17 0 122 1 21 0 125 1 25 0 130 1 29 0 135 1 33 0 136 1 37 0 140 1 41 0 141 1 45 0 143 1 49 0 144 1 53 0 146 1 57 0 147 1 61 0 148 1 65 0 149 1 69 0 150 1 73 0 151 1 77 0 152 0 98 0 155 1 81 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 1 113 0 178 1 117 0 180 1 121 0 189 1 125 0 190 1 129 0 192 1 133 0 193 1 137 0 194 1 141 0 195 1 145 0 196 1 149 0 197 1 153 0 198 1 157 0 199 1 161 0 200 1 165 0 201 1 169 0 202 1 173 0 203 1 177 0 204 1 181 0 205 1 185 0 206 1 189 0 207 1 193 0 223 1 197 0 224 1 201 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 1 225 0 231 1 229 0 232 1 233 0 233 1 237 0 234 1 241 0 235 1 245 0 236 1 249 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 2 57 1 30 2 61 1 37 2 65 1 38 2 69 1 39 2 73 1 40 2 77 1 41 2 81 1 42 2 85 1 45 2 89 1 94 2 93 1 96 2 97 1 97 2 101 1 98 2 105 1 99 2 109 1 100 2 113 1 101 2 117 1 102 2 121 1 103 2 125 1 104 2 129 1 105 2 133 1 106 2 137 1 107 2 141 1 108 2 145 1 109 5 73 1 110 5 77 1 111 2 149 1 112 2 153 1 113 2 157 1 114 2 161 1 121 2 165 1 122 2 169 1 123 2 173 1 130 2 177 1 131 2 181 1 132 2 185 1 133 2 189 1 141 2 193 1 142 2 197 1 143 2 201 1 144 2 205 1 145 2 209 2 70 2 213 2 72 5 81 2 74 2 221 2 77 2 225 2 78 2 229 2 79 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 2 253 2 85] 
#[1 0 94 0 4 0 86 0 49 0 94 0 64 0 94 0 75 0 94 0 76 0 94 0 157] 
#[0 5 85 0 65] 
#[0 0 102 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 139 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[0 0 106 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 0 169 0 39 0 173 0 40 0 177 0 41 0 181 0 42 0 185 0 44 0 189 0 45 0 193 0 46 0 197 0 48 0 205 0 53 0 217 0 63 3 49 0 65 0 225 0 67 0 229 0 68 0 233 0 69 0 237 0 70 0 241 0 71 0 245 0 73 0 249 0 74 0 253 0 87 1 1 0 92 1 13 0 104 5 89 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 1 113 0 178 1 117 0 180 1 121 0 189 5 93 0 190 1 129 0 192 1 133 0 193 1 137 0 194 1 141 0 195 1 145 0 196 1 149 0 197 1 153 0 198 1 157 0 199 1 161 0 200 1 165 0 201 1 169 0 202 1 173 0 203 1 177 0 204 1 181 0 205 1 185 0 206 1 189 0 207 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 57 1 30 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 5 97 2 73 2 225 2 78 2 229 2 79 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[0 0 110 0 4 0 64 0 157] 
#[1 0 94 0 4 0 86 0 49 0 94 0 64 0 94 0 75 0 94 0 76 0 94 0 157] 
#[1 0 94 0 4 0 86 0 49 0 94 0 64 0 94 0 75 0 94 0 76 0 94 0 157] 
#[1 0 114 0 4 0 86 0 49 0 114 0 64 0 114 0 75 0 114 0 76 0 114 0 157] 
#[1 0 114 0 4 0 86 0 49 0 114 0 64 0 114 0 75 0 114 0 76 0 114 0 157] 
#[1 0 118 0 4 0 86 0 49 0 118 0 64 0 118 0 75 0 118 0 76 0 118 0 157] 
#[1 0 118 0 4 0 86 0 49 0 118 0 64 0 118 0 75 0 118 0 76 0 118 0 157] 
#[0 0 122 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 122 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[1 0 201 0 52 5 101 2 72] 
#[0 5 105 0 65] 
#[0 5 109 0 65] 
#[0 0 126 0 157] 
#[0 5 113 0 65] 
#[1 4 165 0 39 4 169 0 40 4 173 0 41 4 177 0 42 4 181 0 44 4 185 0 45 4 189 0 46 4 193 0 48 4 201 0 53 0 225 0 67 4 205 0 68 4 209 0 69 4 213 0 70 4 217 0 71 4 221 0 73 4 225 0 74 4 233 0 157 1 113 0 178 1 117 0 180 4 237 0 189 5 117 0 190 1 129 0 192 1 133 0 193 1 137 0 194 1 141 0 195 1 145 0 196 1 149 0 197 1 153 0 198 1 157 0 199 1 161 0 200 1 165 0 201 1 169 0 202 1 173 0 203 1 177 0 204 1 181 0 205 1 185 0 206 1 189 0 207 2 57 1 30 2 225 2 78 2 229 2 79] 
#[1 0 201 0 52 5 121 2 72] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 130 0 55 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 5 125 1 95 2 209 2 70 5 129 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[1 5 133 0 143 5 137 0 151] 
#[0 5 141 0 65] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 130 0 55 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 5 145 1 95 2 209 2 70 5 129 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[1 5 149 0 17 5 153 0 145 5 157 0 157] 
#[0 5 161 0 65] 
#[0 5 165 0 65] 
#[0 5 169 0 55] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 0 129 0 13 0 133 0 14 0 137 0 16 0 141 0 17 0 145 0 18 0 149 0 19 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 0 201 0 52 3 45 0 53 0 209 0 54 0 213 0 55 0 217 0 63 0 221 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 5 0 100 1 9 0 103 1 13 0 104 1 21 0 125 1 29 0 135 1 33 0 136 1 37 0 140 1 41 0 141 1 45 0 143 1 49 0 144 1 53 0 146 1 57 0 147 1 61 0 148 1 65 0 149 1 69 0 150 1 73 0 151 1 77 0 152 4 141 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 1 201 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 1 225 0 231 1 229 0 232 1 233 0 233 1 237 0 234 1 241 0 235 1 245 0 236 1 249 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 2 61 1 37 2 65 1 38 2 69 1 39 2 73 1 40 2 77 1 41 2 81 1 42 2 85 1 45 2 89 1 94 5 173 1 98 2 105 1 99 2 109 1 100 2 113 1 101 2 117 1 102 2 121 1 103 2 125 1 104 2 129 1 105 2 133 1 106 2 137 1 107 2 141 1 108 2 145 1 109 2 161 1 121 2 165 1 122 2 169 1 123 2 173 1 130 2 177 1 131 2 181 1 132 2 185 1 133 2 189 1 141 2 193 1 142 2 197 1 143 2 201 1 144 2 205 1 145 2 209 2 70 2 213 2 72 2 221 2 77 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 2 253 2 85] 
#[0 5 177 0 65] 
#[0 5 181 0 55] 
#[0 5 185 0 65] 
#[1 0 11 0 4 0 134 0 12 0 134 0 34 5 189 0 43 0 134 0 49 0 134 0 57 5 193 0 58 5 197 0 59 0 134 0 65 0 11 0 75 0 11 0 76 0 134 0 99 0 134 0 116 0 134 0 117 0 134 0 118 0 134 0 119 0 134 0 120 0 134 0 123 0 134 0 124 0 134 0 131 0 134 0 132 0 134 0 134 0 11 0 157 5 201 0 188 5 205 0 214] 
#[0 0 142 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 142 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 142 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 146 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 150 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 142 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 142 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[1 0 154 0 2 0 154 0 4 0 154 0 6 0 154 0 10 0 154 0 11 0 154 0 15 0 154 0 20 0 154 0 21 0 154 0 22 0 154 0 24 0 154 0 25 0 154 0 26 0 154 0 27 0 154 0 28 0 154 0 30 0 154 0 31 0 154 0 32 0 154 0 33 0 154 0 35 0 154 0 36 0 154 0 37 0 154 0 38 0 154 0 39 0 154 0 40 0 154 0 41 0 154 0 42 0 154 0 44 0 154 0 45 0 154 0 46 0 154 0 47 0 154 0 48 0 15 0 49 0 154 0 51 0 154 0 52 0 154 0 53 0 154 0 55 0 154 0 58 0 154 0 59 0 154 0 62 0 154 0 63 0 154 0 64 0 154 0 65 0 154 0 66 0 154 0 67 0 154 0 68 0 154 0 69 0 154 0 70 0 154 0 71 0 154 0 72 0 154 0 73 0 154 0 74 0 154 0 75 0 154 0 76 0 154 0 77 0 154 0 80 0 154 0 82 0 154 0 83 0 154 0 86 0 154 0 88 0 154 0 89 0 154 0 90 0 154 0 91 0 154 0 93 0 154 0 94 0 154 0 95 0 154 0 96 0 154 0 97 0 154 0 100 0 154 0 103 0 154 0 106 0 154 0 109 0 154 0 110 0 154 0 111 0 154 0 121 0 154 0 126 0 154 0 127 0 154 0 128 0 154 0 129 0 154 0 130 0 154 0 133 0 154 0 153 0 154 0 155 0 154 0 157 0 154 0 163 0 154 0 164 0 154 0 167 0 154 0 168 0 154 2 97] 
#[0 0 19 0 2 0 4 0 6 0 10 0 11 0 15 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 52 0 53 0 55 0 58 0 59 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 83 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[1 0 178 0 4 0 23 0 49 0 178 0 64 0 178 0 75 0 178 0 76 0 178 0 157] 
#[1 0 186 0 4 0 190 0 75 0 194 0 76 0 198 0 157] 
#[0 0 202 0 2 0 4 0 6 0 10 0 11 0 15 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 52 0 53 0 55 0 58 0 59 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 83 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 202 0 2 0 4 0 6 0 10 0 11 0 15 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 52 0 53 0 55 0 58 0 59 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 83 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 202 0 2 0 4 0 6 0 10 0 11 0 15 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 52 0 53 0 55 0 58 0 59 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 83 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 206 0 2 0 4 0 6 0 10 0 11 0 15 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 52 0 53 0 55 0 58 0 59 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 83 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 206 0 2 0 4 0 6 0 10 0 11 0 15 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 52 0 53 0 55 0 58 0 59 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 83 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 162 0 2 0 4 0 6 0 10 0 11 0 15 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 52 0 53 0 55 0 58 0 59 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 83 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 162 0 2 0 4 0 6 0 10 0 11 0 15 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 52 0 53 0 55 0 58 0 59 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 83 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 90 0 2 0 4 0 6 0 10 0 11 0 15 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 52 0 53 0 55 0 58 0 59 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 83 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 82 0 2 0 4 0 6 0 10 0 11 0 15 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 52 0 53 0 55 0 58 0 59 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 83 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 82 0 2 0 4 0 6 0 10 0 11 0 15 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 52 0 53 0 55 0 58 0 59 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 83 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 5 213 0 75] 
#[0 0 210 0 2 0 4 0 6 0 10 0 11 0 15 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 52 0 53 0 55 0 58 0 59 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 83 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 210 0 2 0 4 0 6 0 10 0 11 0 15 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 52 0 53 0 55 0 58 0 59 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 83 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 210 0 2 0 4 0 6 0 10 0 11 0 15 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 55 0 58 0 59 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 83 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 210 0 2 0 4 0 6 0 10 0 11 0 15 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 55 0 58 0 59 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 83 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[1 4 229 0 76 5 217 0 208 5 221 0 210] 
#[1 0 214 0 2 0 214 0 3 0 214 0 4 0 214 0 6 0 214 0 7 0 214 0 8 0 214 0 9 0 214 0 10 0 214 0 11 0 214 0 12 0 214 0 15 0 214 0 19 0 214 0 20 0 214 0 21 0 214 0 22 0 214 0 25 0 214 0 26 0 214 0 27 0 214 0 28 0 214 0 30 0 214 0 31 0 214 0 32 0 214 0 33 0 214 0 34 0 214 0 35 0 214 0 36 0 214 0 37 0 214 0 38 0 214 0 39 0 214 0 40 0 214 0 41 0 214 0 42 0 214 0 44 0 214 0 45 0 214 0 46 0 214 0 47 0 214 0 48 0 214 0 49 0 214 0 51 0 214 0 53 0 214 0 55 0 214 0 57 0 214 0 58 0 214 0 59 0 214 0 62 0 214 0 64 0 214 0 65 0 214 0 66 0 214 0 67 0 214 0 68 0 214 0 69 0 214 0 70 0 214 0 71 0 214 0 72 0 214 0 73 0 214 0 74 0 214 0 75 0 27 0 76 0 214 0 77 0 214 0 80 0 214 0 82 0 214 0 86 0 214 0 88 0 214 0 89 0 214 0 90 0 214 0 91 0 214 0 93 0 214 0 94 0 214 0 95 0 214 0 96 0 214 0 97 0 214 0 99 0 214 0 100 0 214 0 103 0 214 0 106 0 214 0 109 0 214 0 110 0 214 0 111 0 214 0 116 0 214 0 117 0 214 0 118 0 214 0 119 0 214 0 120 0 214 0 121 0 214 0 123 0 214 0 124 0 214 0 126 0 214 0 127 0 214 0 128 0 214 0 129 0 214 0 130 0 214 0 131 0 214 0 132 0 214 0 133 0 214 0 134 0 214 0 153 0 214 0 154 0 214 0 155 0 214 0 157 0 214 0 163 0 214 0 164 0 214 0 167 0 214 0 168 0 214 2 97] 
#[0 0 214 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[1 5 229 0 12 5 233 0 34 5 237 0 49 0 218 0 57 5 241 0 65 0 222 0 75 5 245 0 99 0 218 0 116 0 218 0 117 0 218 0 118 0 218 0 119 0 218 0 120 0 218 0 123 0 218 0 124 0 218 0 131 0 218 0 132 0 218 0 134 5 249 1 43 5 253 1 44] 
#[0 0 226 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 226 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 226 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 226 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 226 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[1 0 226 0 12 0 226 0 34 0 226 0 49 0 230 0 55 0 226 0 57 0 230 0 62 0 230 0 64 0 226 0 65 0 226 0 75 0 226 0 76 0 226 0 99 0 226 0 116 0 226 0 117 0 226 0 118 0 226 0 119 0 226 0 120 0 226 0 123 0 226 0 124 0 226 0 131 0 226 0 132 0 226 0 134] 
#[0 0 226 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 226 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 226 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[1 0 226 0 12 0 226 0 34 0 226 0 49 0 230 0 55 0 226 0 57 0 230 0 62 0 230 0 64 0 226 0 65 0 226 0 75 0 226 0 76 0 226 0 99 0 226 0 116 0 226 0 117 0 226 0 118 0 226 0 119 0 226 0 120 0 226 0 123 0 226 0 124 0 226 0 131 0 226 0 132 0 226 0 134] 
#[1 0 226 0 12 0 226 0 34 0 226 0 49 0 230 0 55 0 226 0 57 0 230 0 62 0 230 0 64 0 226 0 65 0 226 0 75 0 226 0 76 0 226 0 99 0 226 0 116 0 226 0 117 0 226 0 118 0 226 0 119 0 226 0 120 0 226 0 123 0 226 0 124 0 226 0 131 0 226 0 132 0 226 0 134] 
#[1 0 226 0 12 0 226 0 34 0 226 0 49 0 230 0 55 0 226 0 57 0 230 0 62 0 230 0 64 0 226 0 65 0 226 0 75 0 226 0 76 0 226 0 99 0 226 0 116 0 226 0 117 0 226 0 118 0 226 0 119 0 226 0 120 0 226 0 123 0 226 0 124 0 226 0 131 0 226 0 132 0 226 0 134] 
#[0 0 226 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 226 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 226 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 226 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 226 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 226 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 226 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 226 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 234 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 234 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 6 1 0 162] 
#[0 6 5 0 166] 
#[0 6 9 0 49] 
#[0 6 13 0 49] 
#[0 0 238 0 49] 
#[0 6 17 0 4] 
#[0 0 218 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[1 6 21 0 57 6 25 0 116 6 29 0 117 6 33 0 118 6 37 0 119 6 41 0 120 6 45 0 123 6 49 0 124 6 53 0 131 6 57 0 132 6 61 0 134 6 65 1 93] 
#[1 0 230 0 55 0 218 0 57 0 230 0 62 0 230 0 64 0 218 0 116 0 218 0 117 0 218 0 118 0 218 0 119 0 218 0 120 0 218 0 123 0 218 0 124 0 218 0 131 0 218 0 132 0 218 0 134] 
#[1 0 230 0 55 0 218 0 57 0 230 0 62 0 230 0 64 0 218 0 116 0 218 0 117 0 218 0 118 0 218 0 119 0 218 0 120 0 218 0 123 0 218 0 124 0 218 0 131 0 218 0 132 0 218 0 134] 
#[0 0 218 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[1 0 230 0 55 0 218 0 57 0 230 0 62 0 230 0 64 0 218 0 116 0 218 0 117 0 218 0 118 0 218 0 119 0 218 0 120 0 218 0 123 0 218 0 124 0 218 0 131 0 218 0 132 0 218 0 134] 
#[0 0 230 0 55 0 62 0 64] 
#[0 0 230 0 55 0 62 0 64] 
#[0 0 242 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[0 0 242 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[0 0 242 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[0 0 246 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 139 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[0 0 246 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 139 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[0 0 246 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 139 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[0 0 246 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 139 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[0 0 246 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 139 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[0 0 246 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 139 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[0 0 246 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 139 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[0 0 246 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 139 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[0 0 246 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 139 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[0 0 246 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 139 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[0 0 246 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 139 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[0 6 69 0 55] 
#[0 6 73 0 55] 
#[1 6 77 0 157 6 81 1 115 6 85 1 116 6 89 1 117] 
#[0 6 93 0 55] 
#[0 0 250 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 139 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[0 0 250 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 139 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[0 0 254 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 139 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[0 0 254 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 139 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[0 0 254 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 139 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[0 0 254 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 139 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[0 1 2 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 139 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[0 1 2 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 139 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[0 1 2 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 139 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[0 1 2 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 139 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[0 1 2 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 139 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[0 0 142 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 246 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 139 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[0 0 0 2 97] 
#[0 0 246 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 139 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[0 0 202 0 2 0 4 0 6 0 10 0 11 0 15 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 52 0 53 0 55 0 58 0 59 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 83 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 6 97 0 4] 
#[0 0 226 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 226 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 226 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 218 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 218 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 246 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 139 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[0 5 13 0 65] 
#[0 5 33 0 65] 
#[1 4 165 0 39 4 169 0 40 4 173 0 41 4 177 0 42 4 181 0 44 4 185 0 45 4 189 0 46 4 193 0 48 4 201 0 53 0 225 0 67 4 205 0 68 4 209 0 69 4 213 0 70 4 217 0 71 4 221 0 73 4 225 0 74 0 31 0 157 1 113 0 178 1 117 0 180 4 237 0 189 6 101 0 190 6 105 0 191 1 129 0 192 1 133 0 193 1 137 0 194 1 141 0 195 1 145 0 196 1 149 0 197 1 153 0 198 1 157 0 199 1 161 0 200 1 165 0 201 1 169 0 202 1 173 0 203 1 177 0 204 1 181 0 205 1 185 0 206 1 189 0 207 2 57 1 30 2 225 2 78 2 229 2 79] 
#[0 0 86 0 49] 
#[0 0 86 0 49] 
#[0 0 86 0 49] 
#[0 0 86 0 49] 
#[0 0 86 0 49] 
#[0 0 86 0 49] 
#[0 0 86 0 49] 
#[0 0 86 0 49] 
#[0 0 86 0 49] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 0 35 0 39 0 39 0 40 0 43 0 41 0 47 0 42 0 51 0 44 0 55 0 45 0 59 0 46 0 63 0 48 0 67 0 53 6 109 0 60 6 113 0 61 0 217 0 63 0 71 0 64 3 49 0 65 0 75 0 67 0 79 0 68 0 83 0 69 0 87 0 70 0 91 0 71 0 95 0 73 0 99 0 74 0 253 0 87 1 1 0 92 1 13 0 104 0 103 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 1 113 0 178 1 117 0 180 1 121 0 189 5 93 0 190 1 129 0 192 1 133 0 193 1 137 0 194 1 141 0 195 1 145 0 196 1 149 0 197 1 153 0 198 1 157 0 199 1 161 0 200 1 165 0 201 1 169 0 202 1 173 0 203 1 177 0 204 1 181 0 205 1 185 0 206 1 189 0 207 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 57 1 30 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 6 117 1 64 6 121 1 65 6 125 1 66 6 129 1 67 6 133 1 68 6 137 1 69 6 141 1 70 6 145 1 71 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 5 97 2 73 2 225 2 78 2 229 2 79 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[0 0 86 0 49] 
#[0 0 86 0 49] 
#[0 0 86 0 49] 
#[0 0 86 0 49] 
#[0 0 86 0 49] 
#[0 0 86 0 49] 
#[1 0 134 0 2 0 134 0 3 0 134 0 4 0 134 0 6 0 134 0 7 0 134 0 8 0 134 0 9 0 134 0 10 0 134 0 11 0 134 0 12 0 134 0 15 0 134 0 19 0 134 0 20 0 134 0 21 0 134 0 22 1 22 0 24 0 134 0 25 0 134 0 26 0 134 0 27 0 134 0 28 0 134 0 30 0 134 0 31 0 134 0 32 0 134 0 33 0 134 0 34 0 134 0 35 0 134 0 36 0 134 0 37 0 134 0 38 0 134 0 39 0 134 0 40 0 134 0 41 0 134 0 42 5 189 0 43 0 134 0 44 0 134 0 45 0 134 0 46 0 134 0 47 0 134 0 48 0 134 0 49 0 134 0 51 0 134 0 53 0 134 0 55 0 134 0 57 0 134 0 58 0 107 0 59 0 134 0 62 0 134 0 64 0 134 0 65 0 134 0 66 0 134 0 67 0 134 0 68 0 134 0 69 0 134 0 70 0 134 0 71 0 134 0 72 0 134 0 73 0 134 0 74 0 134 0 75 0 134 0 76 0 134 0 77 0 134 0 80 0 134 0 82 0 134 0 86 0 134 0 88 0 134 0 89 0 134 0 90 0 134 0 91 0 134 0 93 0 134 0 94 0 134 0 95 0 134 0 96 0 134 0 97 0 134 0 99 0 134 0 100 0 134 0 103 0 134 0 106 0 134 0 109 0 134 0 110 0 134 0 111 0 134 0 116 0 134 0 117 0 134 0 118 0 134 0 119 0 134 0 120 0 134 0 121 0 134 0 123 0 134 0 124 0 134 0 126 0 134 0 127 0 134 0 128 0 134 0 129 0 134 0 130 0 134 0 131 0 134 0 132 0 134 0 133 0 134 0 134 0 134 0 153 0 134 0 154 0 134 0 155 0 134 0 157 0 134 0 163 0 134 0 164 0 134 0 167 0 134 0 168 6 149 0 188 5 205 0 214 0 134 2 97] 
#[0 0 182 0 49] 
#[1 0 218 0 2 0 218 0 3 0 218 0 4 0 218 0 6 0 218 0 7 0 218 0 8 0 218 0 9 0 218 0 10 0 218 0 11 5 229 0 12 0 218 0 15 0 218 0 19 0 218 0 20 0 218 0 21 0 218 0 22 0 218 0 25 0 218 0 26 0 218 0 27 0 218 0 28 0 218 0 30 0 218 0 31 0 218 0 32 0 218 0 33 5 233 0 34 0 218 0 35 0 218 0 36 0 218 0 37 0 218 0 38 0 218 0 39 0 218 0 40 0 218 0 41 0 218 0 42 0 218 0 44 0 218 0 45 0 218 0 46 0 218 0 47 0 218 0 48 5 237 0 49 0 218 0 51 0 218 0 53 0 218 0 55 0 218 0 57 0 218 0 58 0 218 0 59 0 218 0 62 0 218 0 64 5 241 0 65 0 218 0 66 0 218 0 67 0 218 0 68 0 218 0 69 0 218 0 70 0 218 0 71 0 218 0 72 0 218 0 73 0 218 0 74 0 111 0 75 0 218 0 76 0 218 0 77 0 218 0 80 0 218 0 82 0 218 0 86 0 218 0 88 0 218 0 89 0 218 0 90 0 218 0 91 0 218 0 93 0 218 0 94 0 218 0 95 0 218 0 96 0 218 0 97 5 245 0 99 0 218 0 100 0 218 0 103 0 218 0 106 0 218 0 109 0 218 0 110 0 218 0 111 0 218 0 116 0 218 0 117 0 218 0 118 0 218 0 119 0 218 0 120 0 218 0 121 0 218 0 123 0 218 0 124 0 218 0 126 0 218 0 127 0 218 0 128 0 218 0 129 0 218 0 130 0 218 0 131 0 218 0 132 0 218 0 133 0 218 0 134 0 218 0 153 0 218 0 154 0 218 0 155 0 218 0 157 0 218 0 163 0 218 0 164 0 218 0 167 0 218 0 168 6 153 1 43 5 253 1 44 0 218 2 97] 
#[0 0 226 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 226 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 226 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 226 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 1 26 0 2 0 11 0 20 0 21 0 22 0 25 0 26 0 27 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 55 0 58 0 62 0 64 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[1 1 30 0 2 1 30 0 3 1 30 0 4 1 30 0 6 1 30 0 7 1 30 0 8 1 30 0 9 1 30 0 10 1 30 0 11 1 30 0 15 1 30 0 19 1 30 0 20 1 30 0 21 1 30 0 22 1 30 0 25 1 30 0 26 1 30 0 27 1 30 0 28 1 30 0 30 1 30 0 31 1 30 0 32 1 30 0 33 1 30 0 35 1 30 0 36 1 30 0 37 1 30 0 38 1 30 0 39 1 30 0 40 1 30 0 41 1 30 0 42 1 30 0 44 1 30 0 45 1 30 0 46 1 30 0 47 1 30 0 48 1 30 0 51 1 30 0 53 1 30 0 55 6 21 0 57 1 30 0 58 1 30 0 59 1 30 0 62 1 30 0 64 1 30 0 66 1 30 0 67 1 30 0 68 1 30 0 69 1 30 0 70 1 30 0 71 1 30 0 72 1 30 0 73 1 30 0 74 1 30 0 75 1 30 0 76 1 30 0 77 1 30 0 80 1 30 0 82 1 30 0 86 1 30 0 88 1 30 0 89 1 30 0 90 1 30 0 91 1 30 0 93 1 30 0 94 1 30 0 95 1 30 0 96 1 30 0 97 1 30 0 100 1 30 0 103 1 30 0 106 1 30 0 109 1 30 0 110 1 30 0 111 6 25 0 116 6 29 0 117 6 33 0 118 6 37 0 119 6 41 0 120 1 30 0 121 6 45 0 123 6 49 0 124 1 30 0 126 1 30 0 127 1 30 0 128 1 30 0 129 1 30 0 130 6 53 0 131 6 57 0 132 1 30 0 133 6 61 0 134 1 30 0 153 1 30 0 154 1 30 0 155 1 30 0 157 1 30 0 163 1 30 0 164 1 30 0 167 1 30 0 168 6 65 1 93 1 30 2 97] 
#[0 0 218 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 218 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 218 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[1 1 34 0 2 6 157 0 3 6 161 0 4 1 34 0 6 1 34 0 7 6 165 0 8 1 34 0 9 1 34 0 10 1 34 0 11 1 34 0 15 1 34 0 19 1 34 0 20 1 34 0 21 1 34 0 22 1 34 0 25 1 34 0 26 1 34 0 27 1 34 0 28 1 34 0 30 1 34 0 31 1 34 0 32 1 34 0 33 1 34 0 35 1 34 0 36 1 34 0 37 1 34 0 38 1 34 0 39 1 34 0 40 1 34 0 41 1 34 0 42 1 34 0 44 1 34 0 45 1 34 0 46 1 34 0 47 1 34 0 48 1 34 0 51 1 34 0 53 1 34 0 55 1 34 0 58 1 34 0 59 1 34 0 62 1 34 0 64 1 34 0 66 1 34 0 67 1 34 0 68 1 34 0 69 1 34 0 70 1 34 0 71 1 34 0 72 1 34 0 73 1 34 0 74 1 34 0 75 1 34 0 76 1 34 0 77 1 34 0 80 1 34 0 82 1 34 0 86 1 34 0 88 1 34 0 89 1 34 0 90 1 34 0 91 1 34 0 93 1 34 0 94 1 34 0 95 1 34 0 96 1 34 0 97 1 34 0 100 1 34 0 103 1 34 0 106 1 34 0 109 1 34 0 110 1 34 0 111 1 34 0 121 1 34 0 126 1 34 0 127 1 34 0 128 1 34 0 129 1 34 0 130 1 34 0 133 1 34 0 153 1 34 0 154 1 34 0 155 1 34 0 157 1 34 0 163 1 34 0 164 1 34 0 167 1 34 0 168 1 34 2 97] 
#[1 1 38 0 2 1 38 0 6 1 38 0 7 6 169 0 9 1 38 0 10 1 38 0 11 1 38 0 15 6 173 0 19 1 38 0 20 1 38 0 21 1 38 0 22 1 38 0 25 1 38 0 26 1 38 0 27 1 38 0 28 1 38 0 30 1 38 0 31 1 38 0 32 1 38 0 33 1 38 0 35 1 38 0 36 1 38 0 37 1 38 0 38 1 38 0 39 1 38 0 40 1 38 0 41 1 38 0 42 1 38 0 44 1 38 0 45 1 38 0 46 1 38 0 47 1 38 0 48 1 38 0 51 1 38 0 53 1 38 0 55 1 38 0 58 1 38 0 59 1 38 0 62 1 38 0 64 1 38 0 66 1 38 0 67 1 38 0 68 1 38 0 69 1 38 0 70 1 38 0 71 1 38 0 72 1 38 0 73 1 38 0 74 1 38 0 75 1 38 0 76 1 38 0 77 1 38 0 80 1 38 0 82 1 38 0 86 1 38 0 88 1 38 0 89 1 38 0 90 1 38 0 91 1 38 0 93 1 38 0 94 1 38 0 95 1 38 0 96 1 38 0 97 1 38 0 100 1 38 0 103 1 38 0 106 1 38 0 109 1 38 0 110 1 38 0 111 1 38 0 121 1 38 0 126 1 38 0 127 1 38 0 128 1 38 0 129 1 38 0 130 1 38 0 133 1 38 0 153 1 38 0 154 1 38 0 155 1 38 0 157 1 38 0 163 1 38 0 164 1 38 0 167 1 38 0 168 1 38 2 97] 
#[1 1 42 0 2 1 42 0 6 6 177 0 7 1 42 0 10 1 42 0 11 1 42 0 15 1 42 0 20 1 42 0 21 1 42 0 22 1 42 0 25 1 42 0 26 1 42 0 27 1 42 0 28 1 42 0 30 1 42 0 31 1 42 0 32 1 42 0 33 1 42 0 35 1 42 0 36 1 42 0 37 1 42 0 38 1 42 0 39 1 42 0 40 1 42 0 41 1 42 0 42 1 42 0 44 1 42 0 45 1 42 0 46 1 42 0 47 1 42 0 48 1 42 0 51 1 42 0 53 1 42 0 55 1 42 0 58 1 42 0 59 1 42 0 62 1 42 0 64 1 42 0 66 1 42 0 67 1 42 0 68 1 42 0 69 1 42 0 70 1 42 0 71 1 42 0 72 1 42 0 73 1 42 0 74 1 42 0 75 1 42 0 76 1 42 0 77 1 42 0 80 1 42 0 82 1 42 0 86 1 42 0 88 1 42 0 89 1 42 0 90 1 42 0 91 1 42 0 93 1 42 0 94 1 42 0 95 1 42 0 96 1 42 0 97 1 42 0 100 1 42 0 103 1 42 0 106 1 42 0 109 1 42 0 110 1 42 0 111 1 42 0 121 1 42 0 126 1 42 0 127 1 42 0 128 1 42 0 129 1 42 0 130 1 42 0 133 1 42 0 153 6 181 0 154 1 42 0 155 1 42 0 157 1 42 0 163 1 42 0 164 1 42 0 167 1 42 0 168 1 42 2 97] 
#[1 1 46 0 2 6 185 0 6 6 189 0 10 1 46 0 11 6 193 0 15 1 46 0 20 1 46 0 21 1 46 0 22 1 46 0 25 1 46 0 26 1 46 0 27 1 46 0 28 1 46 0 30 6 197 0 31 1 46 0 32 1 46 0 33 1 46 0 35 1 46 0 36 1 46 0 37 1 46 0 38 1 46 0 39 1 46 0 40 1 46 0 41 1 46 0 42 1 46 0 44 1 46 0 45 1 46 0 46 1 46 0 47 1 46 0 48 1 46 0 51 1 46 0 53 1 46 0 55 1 46 0 58 6 201 0 59 1 46 0 62 1 46 0 64 1 46 0 66 1 46 0 67 1 46 0 68 1 46 0 69 1 46 0 70 1 46 0 71 1 46 0 72 1 46 0 73 1 46 0 74 1 46 0 75 1 46 0 76 1 46 0 77 1 46 0 80 1 46 0 82 1 46 0 86 1 46 0 88 1 46 0 89 1 46 0 90 1 46 0 91 1 46 0 93 1 46 0 94 1 46 0 95 1 46 0 96 1 46 0 97 1 46 0 100 1 46 0 103 1 46 0 106 1 46 0 109 1 46 0 110 1 46 0 111 1 46 0 121 1 46 0 126 1 46 0 127 1 46 0 128 1 46 0 129 1 46 0 130 1 46 0 133 6 205 0 153 1 46 0 155 1 46 0 157 1 46 0 163 1 46 0 164 1 46 0 167 1 46 0 168 1 46 2 97] 
#[1 1 50 0 2 1 50 0 11 1 50 0 20 1 50 0 21 1 50 0 22 1 50 0 25 1 50 0 26 1 50 0 27 1 50 0 28 6 209 0 30 1 50 0 32 6 213 0 33 1 50 0 35 1 50 0 36 1 50 0 37 1 50 0 38 1 50 0 39 1 50 0 40 1 50 0 41 1 50 0 42 1 50 0 44 1 50 0 45 1 50 0 46 1 50 0 47 1 50 0 48 1 50 0 51 1 50 0 53 1 50 0 55 1 50 0 58 1 50 0 62 1 50 0 64 1 50 0 66 1 50 0 67 1 50 0 68 1 50 0 69 1 50 0 70 1 50 0 71 1 50 0 72 1 50 0 73 1 50 0 74 1 50 0 75 1 50 0 76 1 50 0 77 1 50 0 80 1 50 0 82 1 50 0 86 1 50 0 88 1 50 0 89 1 50 0 90 1 50 0 91 1 50 0 93 1 50 0 94 1 50 0 95 1 50 0 96 1 50 0 97 1 50 0 100 1 50 0 103 1 50 0 106 1 50 0 109 1 50 0 110 1 50 0 111 1 50 0 121 1 50 0 126 1 50 0 127 1 50 0 128 1 50 0 129 1 50 0 130 1 50 0 133 1 50 0 155 1 50 0 157 1 50 0 163 1 50 0 164 1 50 0 167 1 50 0 168 1 50 2 97] 
#[1 1 54 0 2 1 54 0 11 1 54 0 20 1 54 0 21 1 54 0 22 1 54 0 25 1 54 0 26 1 54 0 27 1 54 0 28 1 54 0 35 1 54 0 36 6 217 0 37 1 54 0 38 1 54 0 39 1 54 0 40 1 54 0 41 1 54 0 42 1 54 0 44 1 54 0 45 1 54 0 46 1 54 0 47 1 54 0 48 1 54 0 51 1 54 0 53 1 54 0 55 1 54 0 58 1 54 0 62 1 54 0 64 1 54 0 66 1 54 0 67 1 54 0 68 1 54 0 69 1 54 0 70 1 54 0 71 1 54 0 72 1 54 0 73 1 54 0 74 1 54 0 75 1 54 0 76 1 54 0 77 1 54 0 80 1 54 0 82 1 54 0 86 1 54 0 88 1 54 0 89 1 54 0 90 1 54 0 91 1 54 0 93 1 54 0 94 1 54 0 95 1 54 0 96 1 54 0 97 1 54 0 100 1 54 0 103 1 54 0 106 1 54 0 109 1 54 0 110 1 54 0 111 1 54 0 121 1 54 0 126 1 54 0 127 1 54 0 128 1 54 0 129 1 54 0 130 1 54 0 133 1 54 0 155 1 54 0 157 1 54 0 163 1 54 0 164 1 54 0 167 1 54 0 168 1 54 2 97] 
#[1 1 58 0 2 1 58 0 11 1 58 0 20 1 58 0 21 1 58 0 22 1 58 0 25 1 58 0 26 1 58 0 27 1 58 0 28 1 58 0 35 6 221 0 36 1 58 0 38 1 58 0 39 1 58 0 40 1 58 0 41 1 58 0 42 1 58 0 44 1 58 0 45 1 58 0 46 1 58 0 47 1 58 0 48 1 58 0 51 1 58 0 53 1 58 0 55 1 58 0 58 1 58 0 62 1 58 0 64 1 58 0 66 1 58 0 67 1 58 0 68 1 58 0 69 1 58 0 70 1 58 0 71 1 58 0 72 1 58 0 73 1 58 0 74 1 58 0 75 1 58 0 76 1 58 0 77 1 58 0 80 1 58 0 82 1 58 0 86 1 58 0 88 1 58 0 89 1 58 0 90 1 58 0 91 1 58 0 93 1 58 0 94 1 58 0 95 1 58 0 96 1 58 0 97 1 58 0 100 1 58 0 103 1 58 0 106 1 58 0 109 1 58 0 110 1 58 0 111 1 58 0 121 1 58 0 126 1 58 0 127 1 58 0 128 1 58 0 129 1 58 0 130 1 58 0 133 1 58 0 155 1 58 0 157 1 58 0 163 1 58 0 164 1 58 0 167 1 58 0 168 1 58 2 97] 
#[1 1 62 0 2 1 62 0 11 1 62 0 20 1 62 0 21 1 62 0 22 1 62 0 25 1 62 0 26 1 62 0 27 1 62 0 28 6 225 0 35 1 62 0 38 1 62 0 39 1 62 0 40 1 62 0 41 1 62 0 42 1 62 0 44 1 62 0 45 1 62 0 46 1 62 0 47 1 62 0 48 1 62 0 51 1 62 0 53 1 62 0 55 1 62 0 58 1 62 0 62 1 62 0 64 1 62 0 66 1 62 0 67 1 62 0 68 1 62 0 69 1 62 0 70 1 62 0 71 1 62 0 72 1 62 0 73 1 62 0 74 1 62 0 75 1 62 0 76 1 62 0 77 1 62 0 80 1 62 0 82 1 62 0 86 1 62 0 88 1 62 0 89 1 62 0 90 1 62 0 91 1 62 0 93 1 62 0 94 1 62 0 95 1 62 0 96 1 62 0 97 1 62 0 100 1 62 0 103 1 62 0 106 1 62 0 109 1 62 0 110 1 62 0 111 1 62 0 121 1 62 0 126 1 62 0 127 1 62 0 128 1 62 0 129 1 62 0 130 1 62 0 133 1 62 0 155 1 62 0 157 1 62 0 163 1 62 0 164 1 62 0 167 1 62 0 168 1 62 2 97] 
#[1 1 66 0 2 1 66 0 11 1 66 0 20 1 66 0 21 1 66 0 22 1 66 0 25 1 66 0 26 1 66 0 27 6 229 0 28 6 233 0 38 1 66 0 39 1 66 0 40 1 66 0 41 1 66 0 42 1 66 0 44 1 66 0 45 1 66 0 46 1 66 0 47 1 66 0 48 1 66 0 51 1 66 0 53 1 66 0 55 1 66 0 58 1 66 0 62 1 66 0 64 1 66 0 66 1 66 0 67 1 66 0 68 1 66 0 69 1 66 0 70 1 66 0 71 1 66 0 72 1 66 0 73 1 66 0 74 1 66 0 75 1 66 0 76 1 66 0 77 1 66 0 80 1 66 0 82 1 66 0 86 1 66 0 88 1 66 0 89 1 66 0 90 1 66 0 91 1 66 0 93 1 66 0 94 1 66 0 95 1 66 0 96 1 66 0 97 1 66 0 100 1 66 0 103 1 66 0 106 1 66 0 109 1 66 0 110 1 66 0 111 1 66 0 121 1 66 0 126 1 66 0 127 1 66 0 128 1 66 0 129 1 66 0 130 1 66 0 133 1 66 0 155 1 66 0 157 1 66 0 163 1 66 0 164 1 66 0 167 1 66 0 168 1 66 2 97] 
#[1 1 70 0 2 1 70 0 11 1 70 0 20 1 70 0 21 1 70 0 22 1 70 0 25 1 70 0 26 1 70 0 27 1 70 0 39 1 70 0 40 1 70 0 41 1 70 0 42 1 70 0 44 1 70 0 45 1 70 0 46 1 70 0 47 1 70 0 48 1 70 0 51 1 70 0 53 1 70 0 55 1 70 0 58 1 70 0 62 1 70 0 64 1 70 0 66 1 70 0 67 1 70 0 68 1 70 0 69 1 70 0 70 1 70 0 71 1 70 0 72 1 70 0 73 1 70 0 74 6 237 0 75 1 70 0 76 1 70 0 77 1 70 0 80 1 70 0 82 1 70 0 86 1 70 0 88 1 70 0 89 1 70 0 90 1 70 0 91 1 70 0 93 1 70 0 94 1 70 0 95 1 70 0 96 1 70 0 97 1 70 0 100 1 70 0 103 1 70 0 106 1 70 0 109 1 70 0 110 1 70 0 111 1 70 0 121 1 70 0 126 1 70 0 127 1 70 0 128 1 70 0 129 1 70 0 130 1 70 0 133 1 70 0 155 1 70 0 157 1 70 0 163 1 70 0 164 1 70 0 167 1 70 0 168 1 70 2 97] 
#[0 1 74 0 2 0 11 0 20 0 21 0 22 0 25 0 26 0 27 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 55 0 58 0 62 0 64 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 6 241 0 24] 
#[0 1 74 0 2 0 11 0 20 0 21 0 22 0 25 0 26 0 27 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 55 0 58 0 62 0 64 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 1 78 0 24] 
#[0 1 78 0 24] 
#[0 1 82 0 24] 
#[1 3 9 0 20 6 245 0 22 6 249 0 26 6 253 0 27 7 1 0 89 1 86 0 128 1 86 0 129 7 5 1 72 7 9 1 73 7 13 1 75 7 17 1 78 7 21 1 79 7 25 1 80 7 29 1 81 7 33 1 82 7 37 1 83 7 41 1 84] 
#[0 1 74 0 2 0 11 0 20 0 21 0 22 0 25 0 26 0 27 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 55 0 58 0 62 0 64 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 1 26 0 2 0 11 0 20 0 21 0 22 0 25 0 26 0 27 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 55 0 58 0 62 0 64 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 0 2 97] 
#[1 1 90 0 2 1 90 0 11 1 90 0 20 1 90 0 21 1 90 0 22 1 90 0 25 1 90 0 26 1 90 0 27 1 90 0 28 7 45 0 32 1 90 0 35 1 90 0 36 1 90 0 37 1 90 0 38 1 90 0 39 1 90 0 40 1 90 0 41 1 90 0 42 1 90 0 44 1 90 0 45 1 90 0 46 1 90 0 47 1 90 0 48 1 90 0 51 1 90 0 53 1 90 0 55 1 90 0 58 1 90 0 62 1 90 0 64 1 90 0 66 1 90 0 67 1 90 0 68 1 90 0 69 1 90 0 70 1 90 0 71 1 90 0 72 1 90 0 73 1 90 0 74 1 90 0 75 1 90 0 76 1 90 0 77 1 90 0 80 1 90 0 82 1 90 0 86 1 90 0 88 1 90 0 89 1 90 0 90 1 90 0 91 1 90 0 93 1 90 0 94 1 90 0 95 1 90 0 96 1 90 0 97 1 90 0 100 1 90 0 103 1 90 0 106 1 90 0 109 1 90 0 110 1 90 0 111 1 90 0 121 1 90 0 126 1 90 0 127 1 90 0 128 1 90 0 129 1 90 0 130 1 90 0 133 1 90 0 155 1 90 0 157 1 90 0 163 1 90 0 164 1 90 0 167 1 90 0 168 1 90 2 97] 
#[0 0 0 2 97] 
#[0 7 49 0 157] 
#[0 1 94 0 11 0 21 0 47 0 50 0 51 0 54 0 76 0 88 0 90 0 91 0 94 0 95 0 97 0 100 0 106 0 109 0 110 0 111 0 121 0 155 2 97] 
#[1 7 53 0 47 7 57 0 157 7 61 0 178 7 65 0 179 4 237 0 189] 
#[1 1 98 0 11 1 98 0 21 1 98 0 47 1 98 0 50 3 221 0 54 1 98 0 76 1 98 0 88 1 98 0 90 1 98 0 91 1 98 0 94 1 98 0 95 1 98 0 97 1 98 0 100 1 98 0 106 1 98 0 109 1 98 0 110 1 98 0 111 1 98 0 121 1 98 0 155 7 69 0 174 3 233 0 175 3 237 0 176 3 241 0 177 1 98 2 97] 
#[0 1 102 0 11 0 21 0 47 0 50 0 54 0 76 0 88 0 90 0 91 0 94 0 95 0 97 0 100 0 106 0 109 0 110 0 111 0 121 0 155 2 97] 
#[0 1 106 0 11 0 21 0 47 0 50 0 54 0 76 0 88 0 90 0 91 0 94 0 95 0 97 0 100 0 106 0 109 0 110 0 111 0 121 0 155 2 97] 
#[0 1 106 0 11 0 21 0 47 0 50 0 54 0 76 0 88 0 90 0 91 0 94 0 95 0 97 0 100 0 106 0 109 0 110 0 111 0 121 0 155 2 97] 
#[0 1 106 0 11 0 21 0 47 0 50 0 54 0 76 0 88 0 90 0 91 0 94 0 95 0 97 0 100 0 106 0 109 0 110 0 111 0 121 0 155 2 97] 
#[1 1 110 0 11 1 110 0 21 1 110 0 47 1 110 0 50 0 115 0 76 1 110 0 88 1 110 0 90 1 110 0 91 1 110 0 94 1 110 0 95 1 110 0 97 1 110 0 100 1 110 0 106 1 110 0 109 1 110 0 110 1 110 0 111 1 110 0 121 7 77 1 51 7 81 2 48 7 85 2 49 7 89 2 50 1 110 2 97] 
#[0 1 114 0 49 0 52] 
#[1 7 93 0 49 7 97 0 52 7 101 1 0] 
#[0 1 118 0 58] 
#[0 1 118 0 58] 
#[0 1 118 0 58] 
#[0 1 118 0 58] 
#[0 1 118 0 58] 
#[0 1 118 0 58] 
#[0 1 118 0 58] 
#[1 7 105 0 157 1 113 0 178 7 109 0 180 4 237 0 189 7 113 2 52 7 117 2 60 7 121 2 61] 
#[0 1 122 0 157] 
#[0 7 125 0 58] 
#[1 0 119 0 11 1 130 0 21 1 142 0 47 0 119 0 88 1 142 0 90 0 119 0 91 1 134 0 94 1 142 0 95 0 123 0 97 0 127 0 100 0 119 0 106 1 126 0 109 1 138 0 110 0 119 0 111 1 142 0 121] 
#[0 1 142 0 11 0 47 0 88 0 90 0 91 0 95 0 97 0 100 0 106 0 111 0 121] 
#[1 0 119 0 11 1 130 0 21 1 142 0 47 0 119 0 88 1 142 0 90 0 119 0 91 1 134 0 94 1 142 0 95 0 123 0 97 0 127 0 100 0 119 0 106 1 126 0 109 1 138 0 110 0 119 0 111 1 142 0 121] 
#[0 1 142 0 11 0 47 0 88 0 90 0 91 0 95 0 97 0 100 0 106 0 111 0 121] 
#[1 0 119 0 11 1 130 0 21 1 142 0 47 0 119 0 88 1 142 0 90 0 119 0 91 1 134 0 94 1 142 0 95 0 123 0 97 0 127 0 100 0 119 0 106 1 126 0 109 1 138 0 110 0 119 0 111 1 142 0 121] 
#[0 1 142 0 11 0 47 0 88 0 90 0 91 0 95 0 97 0 100 0 106 0 111 0 121] 
#[1 0 127 0 11 1 130 0 21 1 142 0 47 0 127 0 88 1 142 0 90 0 127 0 91 1 134 0 94 1 142 0 95 0 123 0 97 0 127 0 100 0 127 0 106 1 138 0 110 0 127 0 111 1 142 0 121] 
#[1 0 119 0 11 1 130 0 21 1 142 0 47 0 119 0 88 1 142 0 90 0 119 0 91 1 134 0 94 1 142 0 95 0 123 0 97 0 127 0 100 0 119 0 106 1 126 0 109 1 138 0 110 0 119 0 111 1 142 0 121] 
#[1 0 119 0 11 1 130 0 21 1 142 0 47 0 119 0 88 1 142 0 90 0 119 0 91 1 134 0 94 1 142 0 95 0 123 0 97 0 127 0 100 0 119 0 106 1 126 0 109 1 138 0 110 0 119 0 111 1 142 0 121] 
#[1 7 129 0 97 1 146 0 121 7 133 1 157] 
#[1 7 137 0 11 4 45 0 47 7 141 0 88 4 53 0 90 7 145 0 91 4 61 0 95 1 150 0 97 7 149 0 100 7 153 0 106 7 157 0 111 1 150 0 121 7 161 1 163] 
#[0 1 154 0 11 0 47 0 88 0 90 0 91 0 95 0 97 0 100 0 106 0 111 0 121] 
#[1 1 146 0 94 7 129 0 97 7 165 1 157] 
#[1 7 169 0 11 7 173 0 88 7 177 0 91 1 158 0 94 1 158 0 97 7 181 0 100 7 185 0 106 7 189 0 111 7 193 2 7] 
#[0 1 162 0 11 0 88 0 91 0 94 0 97 0 100 0 106 0 111] 
#[1 7 129 0 97 1 146 0 110 7 197 1 157] 
#[1 7 201 0 11 7 205 0 88 7 209 0 91 1 166 0 97 7 213 0 100 7 217 0 106 1 166 0 110 7 221 0 111 7 225 2 19] 
#[0 1 170 0 11 0 88 0 91 0 97 0 100 0 106 0 110 0 111] 
#[0 7 229 0 109] 
#[1 7 233 0 11 7 237 0 88 7 241 0 91 7 245 0 106 1 174 0 109 7 249 0 111 7 253 2 43] 
#[0 1 178 0 11 0 88 0 91 0 106 0 109 0 111] 
#[0 8 1 0 21] 
#[1 8 5 0 11 1 182 0 21 8 9 0 88 8 13 0 91 8 17 0 100 8 21 0 106 8 25 0 111 8 29 2 47] 
#[0 1 186 0 11 0 21 0 88 0 91 0 100 0 106 0 111] 
#[0 1 190 0 2 0 11 0 21 0 23 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 60 0 61 0 63 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 78 0 79 0 80 0 81 0 82 0 84 0 85 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 157] 
#[1 0 134 0 2 0 134 0 3 0 134 0 4 0 134 0 6 0 134 0 7 0 134 0 8 0 134 0 9 0 134 0 10 0 134 0 11 0 134 0 12 0 134 0 15 0 134 0 19 0 134 0 20 0 134 0 21 0 134 0 22 0 134 0 25 0 134 0 26 0 134 0 27 0 134 0 28 0 134 0 30 0 134 0 31 0 134 0 32 0 134 0 33 0 134 0 34 0 134 0 35 0 134 0 36 0 134 0 37 0 134 0 38 0 134 0 39 0 134 0 40 0 134 0 41 0 134 0 42 5 189 0 43 0 134 0 44 0 134 0 45 0 134 0 46 0 134 0 47 0 134 0 48 0 134 0 49 0 134 0 51 0 134 0 53 0 134 0 55 0 134 0 57 0 134 0 58 0 107 0 59 0 134 0 62 0 134 0 64 0 134 0 65 0 134 0 66 0 134 0 67 0 134 0 68 0 134 0 69 0 134 0 70 0 134 0 71 0 134 0 72 0 134 0 73 0 134 0 74 0 134 0 75 0 134 0 76 0 134 0 77 0 134 0 80 0 134 0 82 0 134 0 86 0 134 0 88 0 134 0 89 0 134 0 90 0 134 0 91 0 134 0 93 0 134 0 94 0 134 0 95 0 134 0 96 0 134 0 97 0 134 0 99 0 134 0 100 0 134 0 103 0 134 0 106 0 134 0 109 0 134 0 110 0 134 0 111 0 134 0 116 0 134 0 117 0 134 0 118 0 134 0 119 0 134 0 120 0 134 0 121 0 134 0 123 0 134 0 124 0 134 0 126 0 134 0 127 0 134 0 128 0 134 0 129 0 134 0 130 0 134 0 131 0 134 0 132 0 134 0 133 0 134 0 134 0 134 0 153 0 134 0 154 0 134 0 155 0 134 0 157 0 134 0 163 0 134 0 164 0 134 0 167 0 134 0 168 6 149 0 188 5 205 0 214 0 134 2 97] 
#[0 1 194 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 1 198 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 1 202 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 1 198 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 1 198 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 82 0 2 0 4 0 6 0 10 0 11 0 15 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 52 0 53 0 55 0 58 0 59 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 83 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 90 0 2 0 4 0 6 0 10 0 11 0 15 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 52 0 53 0 55 0 58 0 59 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 83 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 94 0 2 0 4 0 6 0 10 0 11 0 15 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 52 0 53 0 55 0 58 0 59 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 83 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 94 0 2 0 4 0 6 0 10 0 11 0 15 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 52 0 53 0 55 0 58 0 59 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 83 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 94 0 2 0 4 0 6 0 10 0 11 0 15 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 52 0 53 0 55 0 58 0 59 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 83 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 94 0 2 0 4 0 6 0 10 0 11 0 15 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 52 0 53 0 55 0 58 0 59 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 83 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 94 0 2 0 4 0 6 0 10 0 11 0 15 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 52 0 53 0 55 0 58 0 59 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 83 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 94 0 2 0 4 0 6 0 10 0 11 0 15 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 52 0 53 0 55 0 58 0 59 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 83 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[1 0 121 0 11 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 153 0 21 0 157 0 29 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 8 33 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 1 206 0 155 8 37 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 8 41 0 225 1 205 0 226 1 209 0 227 8 45 0 228 1 217 0 229 8 49 0 230 3 89 0 231 1 229 0 232 1 233 0 233 8 53 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 8 57 1 25 8 61 1 26 8 65 1 27 8 69 1 28 2 209 2 70 2 233 2 80 2 237 2 81 2 241 2 82] 
#[0 0 94 0 2 0 4 0 6 0 10 0 11 0 15 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 52 0 53 0 55 0 58 0 59 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 83 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 94 0 2 0 4 0 6 0 10 0 11 0 15 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 52 0 53 0 55 0 58 0 59 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 83 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 94 0 2 0 4 0 6 0 10 0 11 0 15 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 52 0 53 0 55 0 58 0 59 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 83 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 114 0 2 0 4 0 6 0 10 0 11 0 15 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 52 0 53 0 55 0 58 0 59 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 83 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 114 0 2 0 4 0 6 0 10 0 11 0 15 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 52 0 53 0 55 0 58 0 59 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 83 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 118 0 2 0 4 0 6 0 10 0 11 0 15 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 52 0 53 0 55 0 58 0 59 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 83 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 0 118 0 2 0 4 0 6 0 10 0 11 0 15 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 52 0 53 0 55 0 58 0 59 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 83 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[1 8 73 0 62 1 210 0 66 8 77 0 211 8 81 0 212] 
#[1 0 11 0 2 0 11 0 4 0 11 0 6 0 11 0 10 0 11 0 11 0 11 0 15 0 11 0 20 0 11 0 21 0 11 0 22 0 11 0 24 0 11 0 25 0 11 0 26 0 11 0 27 0 11 0 28 0 11 0 30 0 11 0 31 0 11 0 32 0 11 0 33 0 11 0 35 0 11 0 36 0 11 0 37 0 11 0 38 0 11 0 39 0 11 0 40 0 11 0 41 0 11 0 42 5 189 0 43 0 11 0 44 0 11 0 45 0 11 0 46 0 11 0 47 0 11 0 48 0 134 0 49 0 11 0 51 0 11 0 52 0 11 0 53 0 11 0 55 0 11 0 58 0 131 0 59 0 11 0 62 0 11 0 63 0 11 0 64 0 11 0 65 0 11 0 66 0 11 0 67 0 11 0 68 0 11 0 69 0 11 0 70 0 11 0 71 0 11 0 72 0 11 0 73 0 11 0 74 0 11 0 75 0 11 0 76 0 11 0 77 0 11 0 80 0 11 0 82 0 11 0 83 0 11 0 86 0 11 0 88 0 11 0 89 0 11 0 90 0 11 0 91 0 11 0 93 0 11 0 94 0 11 0 95 0 11 0 96 0 11 0 97 0 11 0 100 0 11 0 103 0 11 0 106 0 11 0 109 0 11 0 110 0 11 0 111 0 11 0 121 0 11 0 126 0 11 0 127 0 11 0 128 0 11 0 129 0 11 0 130 0 11 0 133 0 11 0 153 0 11 0 155 0 11 0 157 0 11 0 163 0 11 0 164 0 11 0 167 0 11 0 168 8 85 0 188 5 205 0 214 0 11 2 97] 
#[0 0 178 0 2 0 4 0 6 0 10 0 11 0 15 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 52 0 53 0 55 0 58 0 59 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 83 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[1 0 186 0 4 8 89 0 52 8 93 0 65 0 190 0 75 0 194 0 76 8 97 1 11 8 101 1 12 8 105 1 13] 
#[1 0 210 0 4 0 135 0 52 0 210 0 65 0 210 0 75 0 210 0 76 8 113 1 23] 
#[1 0 210 0 4 0 210 0 52 0 139 0 65 0 210 0 75 0 210 0 76] 
#[1 8 121 0 76 5 217 0 208 5 221 0 210] 
#[1 8 109 0 52 8 125 1 23] 
#[0 1 214 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 1 218 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 8 129 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[0 1 222 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 139 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[1 4 165 0 39 4 169 0 40 4 173 0 41 4 177 0 42 4 181 0 44 4 185 0 45 4 189 0 46 4 193 0 48 4 201 0 53 0 225 0 67 4 205 0 68 4 209 0 69 4 213 0 70 4 217 0 71 4 221 0 73 4 225 0 74 8 133 0 157 1 113 0 178 1 117 0 180 4 237 0 189 8 137 0 190 1 129 0 192 1 133 0 193 1 137 0 194 1 141 0 195 1 145 0 196 1 149 0 197 1 153 0 198 1 157 0 199 1 161 0 200 1 165 0 201 1 169 0 202 1 173 0 203 1 177 0 204 1 181 0 205 1 185 0 206 1 189 0 207 8 141 1 29 8 145 1 30 2 225 2 78 2 229 2 79] 
#[1 8 149 0 29 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 8 153 0 63 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 4 141 0 157 3 81 0 189 8 157 0 228 8 161 1 6 8 165 1 7 2 53 1 8 8 169 1 35 8 173 1 36] 
#[1 4 165 0 39 4 169 0 40 4 173 0 41 4 177 0 42 4 181 0 44 4 185 0 45 4 189 0 46 4 193 0 48 4 201 0 53 0 225 0 67 4 205 0 68 4 209 0 69 4 213 0 70 4 217 0 71 4 221 0 73 4 225 0 74 4 233 0 157 1 113 0 178 1 117 0 180 4 237 0 189 8 177 0 190 1 129 0 192 1 133 0 193 1 137 0 194 1 141 0 195 1 145 0 196 1 149 0 197 1 153 0 198 1 157 0 199 1 161 0 200 1 165 0 201 1 169 0 202 1 173 0 203 1 177 0 204 1 181 0 205 1 185 0 206 1 189 0 207 2 57 1 30 2 225 2 78 2 229 2 79] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 8 181 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[0 1 226 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 139 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[0 1 198 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[1 1 10 0 39 1 10 0 40 1 10 0 41 1 10 0 42 1 10 0 44 1 10 0 45 1 10 0 46 1 10 0 48 1 10 0 53 6 109 0 60 6 113 0 61 1 14 0 64 1 10 0 67 1 10 0 68 1 10 0 69 1 10 0 70 1 10 0 71 1 10 0 73 1 10 0 74 1 10 0 157 6 117 1 64 6 121 1 65 6 125 1 66 6 129 1 67 6 133 1 68] 
#[1 0 201 0 52 8 185 2 72] 
#[0 1 230 0 52] 
#[0 8 189 0 157] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 8 193 1 9 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 8 197 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[0 1 234 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 1 238 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 8 201 0 155] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 0 129 0 13 0 133 0 14 0 137 0 16 0 141 0 17 0 145 0 18 0 149 0 19 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 0 169 0 39 0 173 0 40 0 177 0 41 0 181 0 42 0 185 0 44 0 189 0 45 0 193 0 46 0 197 0 48 0 201 0 52 0 205 0 53 0 209 0 54 0 213 0 55 0 217 0 63 0 221 0 65 0 225 0 67 0 229 0 68 0 233 0 69 0 237 0 70 0 241 0 71 0 245 0 73 0 249 0 74 0 253 0 87 1 1 0 92 1 5 0 100 1 9 0 103 1 13 0 104 1 17 0 122 1 21 0 125 1 25 0 130 1 29 0 135 1 33 0 136 1 37 0 140 1 41 0 141 1 45 0 143 1 49 0 144 1 53 0 146 1 57 0 147 1 61 0 148 1 65 0 149 1 69 0 150 1 73 0 151 1 77 0 152 1 242 0 155 1 81 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 1 113 0 178 1 117 0 180 1 121 0 189 1 125 0 190 1 129 0 192 1 133 0 193 1 137 0 194 1 141 0 195 1 145 0 196 1 149 0 197 1 153 0 198 1 157 0 199 1 161 0 200 1 165 0 201 1 169 0 202 1 173 0 203 1 177 0 204 1 181 0 205 1 185 0 206 1 189 0 207 1 193 0 223 1 197 0 224 1 201 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 1 225 0 231 1 229 0 232 1 233 0 233 1 237 0 234 1 241 0 235 1 245 0 236 1 249 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 2 57 1 30 2 61 1 37 2 65 1 38 2 69 1 39 2 73 1 40 2 77 1 41 2 81 1 42 2 85 1 45 2 89 1 94 2 93 1 96 2 97 1 97 2 101 1 98 2 105 1 99 2 109 1 100 2 113 1 101 2 117 1 102 2 121 1 103 2 125 1 104 2 129 1 105 2 133 1 106 2 137 1 107 2 141 1 108 2 145 1 109 2 149 1 112 2 153 1 113 2 157 1 114 2 161 1 121 2 165 1 122 2 169 1 123 2 173 1 130 2 177 1 131 2 181 1 132 2 185 1 133 2 189 1 141 2 193 1 142 2 197 1 143 2 201 1 144 2 205 1 145 2 209 2 70 2 213 2 72 8 205 2 74 2 221 2 77 2 225 2 78 2 229 2 79 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 2 253 2 85] 
#[0 1 246 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 0 169 0 39 0 173 0 40 0 177 0 41 0 181 0 42 0 185 0 44 0 189 0 45 0 193 0 46 0 197 0 48 0 205 0 53 0 217 0 63 3 49 0 65 0 225 0 67 0 229 0 68 0 233 0 69 0 237 0 70 0 241 0 71 0 245 0 73 0 249 0 74 0 253 0 87 1 1 0 92 1 13 0 104 1 17 0 122 5 89 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 1 113 0 178 1 117 0 180 1 121 0 189 1 125 0 190 1 129 0 192 1 133 0 193 1 137 0 194 1 141 0 195 1 145 0 196 1 149 0 197 1 153 0 198 1 157 0 199 1 161 0 200 1 165 0 201 1 169 0 202 1 173 0 203 1 177 0 204 1 181 0 205 1 185 0 206 1 189 0 207 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 57 1 30 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 8 209 1 112 2 157 1 114 8 213 1 154 2 209 2 70 8 217 2 73 2 225 2 78 2 229 2 79 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[1 0 134 0 3 0 11 0 4 0 134 0 6 0 134 0 7 0 134 0 8 0 134 0 9 0 134 0 10 0 134 0 12 0 134 0 15 0 134 0 19 1 22 0 24 0 134 0 28 0 134 0 30 0 134 0 31 0 134 0 32 0 134 0 33 0 134 0 34 0 134 0 35 0 134 0 36 0 134 0 37 0 134 0 38 5 189 0 43 0 134 0 49 0 134 0 57 0 107 0 59 1 22 0 62 0 143 0 64 0 134 0 65 0 11 0 75 0 11 0 76 0 134 0 99 0 134 0 116 0 134 0 117 0 134 0 118 0 134 0 119 0 134 0 120 0 134 0 123 0 134 0 124 0 134 0 131 0 134 0 132 0 134 0 134 0 134 0 153 0 134 0 154 0 11 0 157 5 201 0 188 5 205 0 214] 
#[1 0 186 0 4 8 221 0 64 0 190 0 75 0 194 0 76] 
#[0 8 225 0 64] 
#[0 1 250 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 139 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[1 4 165 0 39 4 169 0 40 4 173 0 41 4 177 0 42 4 181 0 44 4 185 0 45 4 189 0 46 4 193 0 48 4 201 0 53 0 225 0 67 4 205 0 68 4 209 0 69 4 213 0 70 4 217 0 71 4 221 0 73 4 225 0 74 4 233 0 157 1 113 0 178 1 117 0 180 4 237 0 189 8 229 0 190 1 129 0 192 1 133 0 193 1 137 0 194 1 141 0 195 1 145 0 196 1 149 0 197 1 153 0 198 1 157 0 199 1 161 0 200 1 165 0 201 1 169 0 202 1 173 0 203 1 177 0 204 1 181 0 205 1 185 0 206 1 189 0 207 2 57 1 30 8 233 2 78 2 229 2 79] 
#[1 4 165 0 39 4 169 0 40 4 173 0 41 4 177 0 42 4 181 0 44 4 185 0 45 4 189 0 46 4 193 0 48 4 201 0 53 0 225 0 67 4 205 0 68 4 209 0 69 4 213 0 70 4 217 0 71 4 221 0 73 4 225 0 74 4 233 0 157 1 113 0 178 1 117 0 180 4 237 0 189 8 229 0 190 1 129 0 192 1 133 0 193 1 137 0 194 1 141 0 195 1 145 0 196 1 149 0 197 1 153 0 198 1 157 0 199 1 161 0 200 1 165 0 201 1 169 0 202 1 173 0 203 1 177 0 204 1 181 0 205 1 185 0 206 1 189 0 207 2 57 1 30 2 225 2 78 8 237 2 79] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 8 241 1 85 3 197 1 94 2 209 2 70 8 245 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[1 0 186 0 4 0 190 0 75 0 194 0 76 8 249 0 157 8 253 1 119 9 1 1 120] 
#[1 9 5 0 138 9 9 0 142 9 13 1 146 9 17 1 147 9 21 1 148] 
#[0 9 25 0 55] 
#[0 1 254 0 55] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 9 29 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[0 9 33 0 55] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 9 37 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[0 9 41 0 55] 
#[0 9 45 0 55] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 9 49 0 255 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 9 53 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[0 9 57 0 55] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 9 61 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 9 65 1 85 3 197 1 94 2 209 2 70 8 245 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[0 2 2 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 139 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[0 9 69 0 147] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 0 169 0 39 0 173 0 40 0 177 0 41 0 181 0 42 0 185 0 44 0 189 0 45 0 193 0 46 0 197 0 48 0 205 0 53 2 6 0 55 0 217 0 63 0 221 0 65 0 225 0 67 0 229 0 68 0 233 0 69 0 237 0 70 0 241 0 71 0 245 0 73 0 249 0 74 0 253 0 87 1 1 0 92 1 13 0 104 1 17 0 122 9 73 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 1 113 0 178 1 117 0 180 1 121 0 189 1 125 0 190 1 129 0 192 1 133 0 193 1 137 0 194 1 141 0 195 1 145 0 196 1 149 0 197 1 153 0 198 1 157 0 199 1 161 0 200 1 165 0 201 1 169 0 202 1 173 0 203 1 177 0 204 1 181 0 205 1 185 0 206 1 189 0 207 1 193 0 223 1 197 0 224 1 201 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 1 225 0 231 1 229 0 232 1 233 0 233 1 237 0 234 1 241 0 235 1 245 0 236 1 249 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 2 57 1 30 2 61 1 37 2 65 1 38 2 69 1 39 2 73 1 40 2 77 1 41 2 81 1 42 2 85 1 45 2 89 1 94 9 77 1 112 2 157 1 114 9 81 1 121 9 85 1 134 9 89 1 137 9 93 1 138 2 209 2 70 2 225 2 78 2 229 2 79 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84] 
#[0 2 10 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 139 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[1 4 165 0 39 4 169 0 40 4 173 0 41 4 177 0 42 4 181 0 44 4 185 0 45 4 189 0 46 4 193 0 48 4 201 0 53 0 225 0 67 4 205 0 68 4 209 0 69 4 213 0 70 4 217 0 71 4 221 0 73 4 225 0 74 1 17 0 122 4 233 0 157 1 113 0 178 1 117 0 180 4 237 0 189 1 125 0 190 1 129 0 192 1 133 0 193 1 137 0 194 1 141 0 195 1 145 0 196 1 149 0 197 1 153 0 198 1 157 0 199 1 161 0 200 1 165 0 201 1 169 0 202 1 173 0 203 1 177 0 204 1 181 0 205 1 185 0 206 1 189 0 207 2 57 1 30 9 97 1 114 2 225 2 78 2 229 2 79] 
#[0 9 101 0 157] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 0 129 0 13 0 133 0 14 0 137 0 16 0 141 0 17 0 145 0 18 0 149 0 19 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 0 169 0 39 0 173 0 40 0 177 0 41 0 181 0 42 0 185 0 44 0 189 0 45 0 193 0 46 0 197 0 48 0 201 0 52 0 205 0 53 0 209 0 54 0 213 0 55 0 217 0 63 0 221 0 65 0 225 0 67 0 229 0 68 0 233 0 69 0 237 0 70 0 241 0 71 0 245 0 73 0 249 0 74 0 253 0 87 1 1 0 92 1 5 0 100 1 9 0 103 1 13 0 104 1 17 0 122 1 21 0 125 1 25 0 130 1 29 0 135 1 33 0 136 1 37 0 140 1 41 0 141 1 45 0 143 1 49 0 144 1 53 0 146 1 57 0 147 1 61 0 148 1 65 0 149 1 69 0 150 1 73 0 151 1 77 0 152 1 81 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 1 113 0 178 1 117 0 180 1 121 0 189 1 125 0 190 1 129 0 192 1 133 0 193 1 137 0 194 1 141 0 195 1 145 0 196 1 149 0 197 1 153 0 198 1 157 0 199 1 161 0 200 1 165 0 201 1 169 0 202 1 173 0 203 1 177 0 204 1 181 0 205 1 185 0 206 1 189 0 207 1 193 0 223 1 197 0 224 1 201 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 1 225 0 231 1 229 0 232 1 233 0 233 1 237 0 234 1 241 0 235 1 245 0 236 1 249 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 2 57 1 30 2 61 1 37 2 65 1 38 2 69 1 39 2 73 1 40 2 77 1 41 2 81 1 42 2 85 1 45 2 89 1 94 2 93 1 96 2 97 1 97 2 101 1 98 2 105 1 99 2 109 1 100 2 113 1 101 2 117 1 102 2 121 1 103 2 125 1 104 2 129 1 105 2 133 1 106 2 137 1 107 2 141 1 108 2 145 1 109 2 149 1 112 2 153 1 113 2 157 1 114 2 161 1 121 2 165 1 122 2 169 1 123 2 173 1 130 2 177 1 131 2 181 1 132 2 185 1 133 2 189 1 141 2 193 1 142 2 197 1 143 2 201 1 144 2 205 1 145 2 209 2 70 2 213 2 72 9 105 2 74 2 221 2 77 2 225 2 78 2 229 2 79 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 2 253 2 85] 
#[1 4 165 0 39 4 169 0 40 4 173 0 41 4 177 0 42 4 181 0 44 4 185 0 45 4 189 0 46 4 193 0 48 4 201 0 53 0 225 0 67 4 205 0 68 4 209 0 69 4 213 0 70 4 217 0 71 4 221 0 73 4 225 0 74 4 233 0 157 1 113 0 178 1 117 0 180 4 237 0 189 9 109 0 190 1 129 0 192 1 133 0 193 1 137 0 194 1 141 0 195 1 145 0 196 1 149 0 197 1 153 0 198 1 157 0 199 1 161 0 200 1 165 0 201 1 169 0 202 1 173 0 203 1 177 0 204 1 181 0 205 1 185 0 206 1 189 0 207 9 113 0 213 9 117 0 215 2 57 1 30 2 225 2 78 2 229 2 79] 
#[1 2 14 0 3 0 147 0 4 2 14 0 6 2 14 0 7 2 14 0 8 2 14 0 9 2 14 0 10 2 14 0 12 2 14 0 15 2 14 0 19 2 14 0 28 2 14 0 30 2 14 0 31 2 14 0 32 2 14 0 33 2 14 0 34 2 14 0 35 2 14 0 36 2 14 0 37 2 14 0 38 0 147 0 49 2 14 0 57 2 14 0 59 0 147 0 64 2 14 0 65 0 147 0 75 0 147 0 76 2 14 0 99 2 14 0 116 2 14 0 117 2 14 0 118 2 14 0 119 2 14 0 120 2 14 0 123 2 14 0 124 2 14 0 131 2 14 0 132 2 14 0 134 2 14 0 153 2 14 0 154 2 18 0 157] 
#[0 2 22 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 52 0 53 0 55 0 57 0 58 0 59 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 83 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 9 121 0 157] 
#[0 2 26 0 2 0 4 0 6 0 10 0 11 0 15 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 52 0 53 0 55 0 58 0 59 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 83 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[1 2 30 0 2 2 30 0 4 2 30 0 6 2 30 0 10 2 30 0 11 2 30 0 15 2 30 0 20 2 30 0 21 2 30 0 22 2 30 0 25 2 30 0 26 2 30 0 27 2 30 0 28 2 30 0 30 2 30 0 31 2 30 0 32 2 30 0 33 2 30 0 35 2 30 0 36 2 30 0 37 2 30 0 38 2 30 0 39 2 30 0 40 2 30 0 41 2 30 0 42 2 30 0 44 2 30 0 45 2 30 0 46 2 30 0 47 2 30 0 48 2 30 0 51 2 30 0 52 2 30 0 53 2 30 0 55 2 30 0 58 2 30 0 59 2 30 0 62 2 30 0 63 2 30 0 64 2 30 0 65 2 30 0 66 2 30 0 67 2 30 0 68 2 30 0 69 2 30 0 70 2 30 0 71 2 30 0 72 2 30 0 73 2 30 0 74 2 30 0 75 0 151 0 76 2 30 0 77 2 30 0 80 2 30 0 82 2 30 0 83 2 30 0 86 2 30 0 88 2 30 0 89 2 30 0 90 2 30 0 91 2 30 0 93 2 30 0 94 2 30 0 95 2 30 0 96 2 30 0 97 2 30 0 100 2 30 0 103 2 30 0 106 2 30 0 109 2 30 0 110 2 30 0 111 2 30 0 121 2 30 0 126 2 30 0 127 2 30 0 128 2 30 0 129 2 30 0 130 2 30 0 133 2 30 0 153 2 30 0 155 2 30 0 157 2 30 0 163 2 30 0 164 2 30 0 167 2 30 0 168 9 125 0 210 2 30 2 97] 
#[0 2 34 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 52 0 53 0 55 0 57 0 58 0 59 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 83 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 9 129 1 9 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 9 133 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[0 2 38 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 2 42 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 9 137 0 157] 
#[1 2 46 0 1 2 46 0 2 2 46 0 4 2 46 0 5 2 46 0 9 2 46 0 11 2 46 0 12 2 46 0 13 2 46 0 14 2 46 0 16 2 46 0 17 2 46 0 18 2 46 0 19 2 46 0 20 2 46 0 21 2 46 0 29 2 46 0 32 2 46 0 34 2 46 0 39 2 46 0 40 2 46 0 41 2 46 0 42 2 46 0 44 2 46 0 45 2 46 0 46 2 46 0 48 2 46 0 53 2 46 0 60 2 46 0 61 2 46 0 63 2 50 0 64 2 46 0 65 2 46 0 68 2 46 0 69 2 46 0 70 2 46 0 71 2 46 0 73 2 46 0 74 2 46 0 87 2 46 0 92 2 46 0 104 0 155 0 157 2 46 0 158 2 46 0 159 2 46 0 160 2 46 0 161 2 46 0 162 2 46 0 165 2 46 0 166 2 46 0 169 2 46 0 170 9 145 0 217 9 149 0 218 9 153 0 219 9 157 0 220 9 161 0 222] 
#[0 9 165 0 157] 
#[1 9 169 0 49 2 54 0 57 9 173 0 65 2 58 0 75 9 177 0 76 2 54 0 116 2 54 0 117 2 54 0 118 2 54 0 119 2 54 0 120 2 54 0 123 2 54 0 124 2 54 0 131 2 54 0 132 2 54 0 134] 
#[0 9 181 0 75] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 9 185 0 251 9 189 0 253 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 9 193 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 9 197 0 253 2 41 1 1 9 201 1 3 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 9 193 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[0 9 205 0 157] 
#[0 9 209 0 157] 
#[0 2 62 0 2 0 4 0 6 0 10 0 11 0 15 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 52 0 53 0 55 0 58 0 59 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 83 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 2 66 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 20 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 53 0 63 0 65 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 104 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170] 
#[0 2 66 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 20 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 53 0 63 0 65 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 104 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170] 
#[0 2 66 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 20 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 53 0 63 0 65 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 104 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170] 
#[0 2 66 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 20 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 53 0 63 0 65 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 104 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170] 
#[0 2 66 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 20 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 53 0 63 0 65 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 104 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170] 
#[0 2 66 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 20 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 53 0 63 0 65 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 104 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170] 
#[0 2 66 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 20 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 53 0 63 0 65 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 104 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170] 
#[0 2 66 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 20 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 53 0 63 0 65 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 104 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170] 
#[0 2 66 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 20 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 53 0 63 0 65 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 104 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170] 
#[0 2 66 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 20 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 53 0 63 0 65 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 104 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170] 
#[0 2 66 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 20 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 53 0 63 0 65 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 104 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 9 213 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[0 2 70 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[0 2 70 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[0 2 74 0 55 0 57 0 62 0 64] 
#[1 2 78 0 55 9 217 0 62 2 78 0 64] 
#[0 2 82 0 55 0 62 0 64] 
#[1 2 86 0 55 9 221 0 57 2 86 0 62 2 86 0 64] 
#[0 2 90 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 139 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[0 2 62 0 2 0 4 0 6 0 10 0 11 0 15 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 52 0 53 0 55 0 58 0 59 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 83 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[1 0 186 0 4 0 190 0 75 0 194 0 76 2 94 0 157] 
#[0 9 225 0 157] 
#[0 2 98 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 157] 
#[0 2 98 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 157] 
#[0 9 229 0 64] 
#[1 9 233 0 62 2 102 0 64] 
#[0 2 106 0 62 0 64] 
#[1 4 165 0 39 4 169 0 40 4 173 0 41 4 177 0 42 4 181 0 44 4 185 0 45 4 189 0 46 4 193 0 48 4 201 0 53 0 225 0 67 4 205 0 68 4 209 0 69 4 213 0 70 4 217 0 71 4 221 0 73 4 225 0 74 4 233 0 157 1 113 0 178 1 117 0 180 4 237 0 189 9 237 0 190 1 129 0 192 1 133 0 193 1 137 0 194 1 141 0 195 1 145 0 196 1 149 0 197 1 153 0 198 1 157 0 199 1 161 0 200 1 165 0 201 1 169 0 202 1 173 0 203 1 177 0 204 1 181 0 205 1 185 0 206 1 189 0 207 2 57 1 30 2 225 2 78 2 229 2 79] 
#[0 2 110 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 157] 
#[0 9 241 0 64] 
#[1 1 82 0 24 2 114 0 62 2 114 0 64] 
#[1 9 245 0 62 2 118 0 64] 
#[0 2 14 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[1 2 54 0 2 2 54 0 3 2 54 0 4 2 54 0 6 2 54 0 7 2 54 0 8 2 54 0 9 2 54 0 10 2 54 0 11 2 54 0 15 2 54 0 19 2 54 0 20 2 54 0 21 2 54 0 22 2 54 0 25 2 54 0 26 2 54 0 27 2 54 0 28 2 54 0 30 2 54 0 31 2 54 0 32 2 54 0 33 2 54 0 35 2 54 0 36 2 54 0 37 2 54 0 38 2 54 0 39 2 54 0 40 2 54 0 41 2 54 0 42 2 54 0 44 2 54 0 45 2 54 0 46 2 54 0 47 2 54 0 48 9 169 0 49 2 54 0 51 2 54 0 53 2 54 0 55 2 54 0 57 2 54 0 58 2 54 0 59 2 54 0 62 2 54 0 64 9 249 0 65 2 54 0 66 2 54 0 67 2 54 0 68 2 54 0 69 2 54 0 70 2 54 0 71 2 54 0 72 2 54 0 73 2 54 0 74 0 159 0 75 0 163 0 76 2 54 0 77 2 54 0 80 2 54 0 82 2 54 0 86 2 54 0 88 2 54 0 89 2 54 0 90 2 54 0 91 2 54 0 93 2 54 0 94 2 54 0 95 2 54 0 96 2 54 0 97 2 54 0 100 2 54 0 103 2 54 0 106 2 54 0 109 2 54 0 110 2 54 0 111 2 54 0 116 2 54 0 117 2 54 0 118 2 54 0 119 2 54 0 120 2 54 0 121 2 54 0 123 2 54 0 124 2 54 0 126 2 54 0 127 2 54 0 128 2 54 0 129 2 54 0 130 2 54 0 131 2 54 0 132 2 54 0 133 2 54 0 134 2 54 0 153 2 54 0 154 2 54 0 155 2 54 0 157 2 54 0 163 2 54 0 164 2 54 0 167 2 54 0 168 2 54 2 97] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 0 221 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 4 141 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 2 61 1 37 9 253 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 2 209 2 70 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 0 221 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 4 141 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 2 61 1 37 10 1 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 2 209 2 70 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 0 221 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 4 141 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 2 61 1 37 10 5 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 2 209 2 70 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 0 221 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 4 141 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 2 61 1 37 10 9 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 10 13 1 46 2 209 2 70 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 0 221 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 4 141 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 2 61 1 37 10 9 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 10 17 1 46 2 209 2 70 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 0 221 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 4 141 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 2 61 1 37 10 9 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 10 21 1 47 2 209 2 70 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 0 221 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 4 141 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 2 61 1 37 10 9 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 10 25 1 47 2 209 2 70 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 0 221 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 4 141 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 2 61 1 37 10 9 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 10 29 1 48 2 209 2 70 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 0 221 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 4 141 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 2 61 1 37 10 9 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 10 33 1 48 2 209 2 70 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84] 
#[1 4 165 0 39 4 169 0 40 4 173 0 41 4 177 0 42 4 181 0 44 4 185 0 45 4 189 0 46 4 193 0 48 4 201 0 53 0 225 0 67 4 205 0 68 4 209 0 69 4 213 0 70 4 217 0 71 4 221 0 73 4 225 0 74 4 233 0 157 1 113 0 178 1 117 0 180 4 237 0 189 10 37 0 190 1 129 0 192 1 133 0 193 1 137 0 194 1 141 0 195 1 145 0 196 1 149 0 197 1 153 0 198 1 157 0 199 1 161 0 200 1 165 0 201 1 169 0 202 1 173 0 203 1 177 0 204 1 181 0 205 1 185 0 206 1 189 0 207 2 57 1 30 2 225 2 78 2 229 2 79] 
#[1 4 165 0 39 4 169 0 40 4 173 0 41 4 177 0 42 4 181 0 44 4 185 0 45 4 189 0 46 4 193 0 48 4 201 0 53 0 225 0 67 4 205 0 68 4 209 0 69 4 213 0 70 4 217 0 71 4 221 0 73 4 225 0 74 4 233 0 157 1 113 0 178 1 117 0 180 4 237 0 189 10 41 0 190 1 129 0 192 1 133 0 193 1 137 0 194 1 141 0 195 1 145 0 196 1 149 0 197 1 153 0 198 1 157 0 199 1 161 0 200 1 165 0 201 1 169 0 202 1 173 0 203 1 177 0 204 1 181 0 205 1 185 0 206 1 189 0 207 2 57 1 30 2 225 2 78 2 229 2 79] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 0 221 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 4 141 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 2 61 1 37 10 9 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 10 45 1 48 2 209 2 70 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 0 221 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 4 141 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 2 61 1 37 10 9 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 10 49 1 48 2 209 2 70 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 0 221 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 4 141 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 2 61 1 37 10 9 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 10 53 1 49 2 209 2 70 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 0 221 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 4 141 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 2 61 1 37 10 9 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 10 57 1 49 2 209 2 70 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 0 221 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 4 141 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 2 61 1 37 10 9 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 2 209 2 70 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 10 61 2 101] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 0 221 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 4 141 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 2 61 1 37 10 9 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 10 65 1 52 2 209 2 70 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 0 221 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 4 141 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 2 61 1 37 10 9 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 10 69 1 53 2 209 2 70 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 0 221 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 4 141 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 2 61 1 37 10 9 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 10 73 1 56 2 209 2 70 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 0 221 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 4 141 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 2 61 1 37 10 9 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 10 77 1 54 2 209 2 70 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 10 81 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 0 201 0 52 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 10 85 1 59 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 10 89 2 72 10 93 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[0 10 97 0 157] 
#[1 4 165 0 39 4 169 0 40 4 173 0 41 4 177 0 42 4 181 0 44 4 185 0 45 4 189 0 46 4 193 0 48 4 201 0 53 0 225 0 67 4 205 0 68 4 209 0 69 4 213 0 70 4 217 0 71 4 221 0 73 4 225 0 74 0 31 0 157 1 113 0 178 1 117 0 180 4 237 0 189 6 101 0 190 10 101 0 191 1 129 0 192 1 133 0 193 1 137 0 194 1 141 0 195 1 145 0 196 1 149 0 197 1 153 0 198 1 157 0 199 1 161 0 200 1 165 0 201 1 169 0 202 1 173 0 203 1 177 0 204 1 181 0 205 1 185 0 206 1 189 0 207 2 57 1 30 2 225 2 78 2 229 2 79] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 10 105 1 85 3 197 1 94 2 209 2 70 8 245 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 10 109 1 86 10 113 1 87 3 197 1 94 2 209 2 70 10 117 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[0 2 122 0 20 0 22 0 26 0 27 0 89 0 128 0 129] 
#[0 2 126 0 2 0 11 0 20 0 21 0 22 0 25 0 26 0 27 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 55 0 58 0 62 0 64 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[1 10 121 0 128 10 125 0 129 10 129 1 76 10 133 1 90 10 137 1 91] 
#[1 3 9 0 20 6 245 0 22 6 249 0 26 6 253 0 27 7 1 0 89 2 130 0 128 2 130 0 129 7 5 1 72 10 141 1 79 7 25 1 80 7 29 1 81 7 33 1 82 7 37 1 83 7 41 1 84] 
#[0 2 134 0 20 0 22 0 26 0 27 0 89 0 128 0 129] 
#[0 2 138 0 20 0 22 0 26 0 27 0 89 0 128 0 129] 
#[0 2 142 0 20 0 22 0 26 0 27 0 89 0 128 0 129] 
#[0 2 146 0 20 0 22 0 26 0 27 0 89 0 128 0 129] 
#[0 2 150 0 20 0 22 0 26 0 27 0 89 0 128 0 129] 
#[0 2 154 0 20 0 22 0 26 0 27 0 89 0 128 0 129] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 0 221 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 4 141 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 2 61 1 37 10 9 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 10 145 1 50 2 209 2 70 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84] 
#[0 10 149 0 55] 
#[1 7 105 0 157 1 113 0 178 10 153 0 180 4 237 0 189] 
#[1 5 189 0 43 0 134 0 49 0 134 0 55 10 157 0 57 5 197 0 59 8 85 0 188 5 205 0 214] 
#[1 5 209 0 49 2 158 0 55] 
#[0 10 161 0 55] 
#[0 2 162 0 11 0 21 0 47 0 50 0 54 0 76 0 88 0 90 0 91 0 94 0 95 0 97 0 100 0 106 0 109 0 110 0 111 0 121 0 155 2 97] 
#[1 10 165 0 113 10 169 0 114 10 173 2 51 10 177 2 53] 
#[1 0 10 0 11 0 10 0 21 0 10 0 47 0 45 0 50 0 49 0 76 0 10 0 88 0 10 0 90 0 10 0 91 0 10 0 94 0 10 0 95 0 10 0 97 0 10 0 100 0 10 0 106 0 10 0 109 0 10 0 110 0 10 0 111 0 10 0 121 10 181 0 181 0 53 0 182 0 57 0 183 0 61 0 184 0 65 0 185 0 69 0 186 0 73 0 187 0 77 0 252 10 185 1 5 0 81 1 155 0 85 2 54 0 89 2 55 0 93 2 56 10 189 2 75 2 166 2 97] 
#[0 2 170 0 11 0 21 0 47 0 50 0 76 0 88 0 90 0 91 0 94 0 95 0 97 0 100 0 106 0 109 0 110 0 111 0 121 2 97] 
#[1 2 174 0 11 2 174 0 21 2 174 0 47 2 174 0 50 0 167 0 76 2 174 0 88 2 174 0 90 2 174 0 91 2 174 0 94 2 174 0 95 2 174 0 97 2 174 0 100 2 174 0 106 2 174 0 109 2 174 0 110 2 174 0 111 2 174 0 121 10 193 2 50 2 174 2 97] 
#[0 2 178 0 11 0 21 0 47 0 50 0 76 0 88 0 90 0 91 0 94 0 95 0 97 0 100 0 106 0 109 0 110 0 111 0 121 2 97] 
#[0 10 197 0 157] 
#[1 0 6 0 11 0 6 0 21 0 6 0 47 0 6 0 50 0 25 0 51 0 6 0 54 0 6 0 76 0 6 0 88 0 6 0 90 0 6 0 91 0 6 0 94 0 6 0 95 0 6 0 97 0 6 0 100 0 6 0 106 0 6 0 109 0 6 0 110 0 6 0 111 0 6 0 121 0 6 0 155 0 29 0 248 0 33 0 250 10 201 2 71] 
#[1 2 182 0 11 2 182 0 21 2 182 0 47 2 182 0 50 10 205 0 55 2 182 0 76 2 182 0 88 2 182 0 90 2 182 0 91 2 182 0 94 2 182 0 95 2 182 0 97 2 182 0 100 2 182 0 106 2 182 0 109 2 182 0 110 2 182 0 111 2 182 0 121 2 182 0 155 10 209 0 254 2 182 2 97] 
#[1 0 134 0 27 5 189 0 43 0 134 0 49 0 134 0 52 0 134 0 55 5 197 0 59 0 134 0 62 0 134 0 65 0 134 0 66 8 85 0 188 5 205 0 214] 
#[0 2 186 0 62 0 65 0 66] 
#[1 10 213 0 62 10 217 0 66] 
#[0 2 190 0 62 0 66] 
#[1 2 194 0 62 10 221 0 65 2 194 0 66 10 225 2 62 10 229 2 63] 
#[0 2 198 0 157] 
#[0 2 202 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 94 0 110 0 121 0 157] 
#[0 10 233 0 121] 
#[0 1 142 0 11 0 47 0 88 0 90 0 91 0 95 0 97 0 100 0 106 0 111 0 121] 
#[0 1 142 0 11 0 47 0 88 0 90 0 91 0 95 0 97 0 100 0 106 0 111 0 121] 
#[0 1 142 0 11 0 47 0 88 0 90 0 91 0 95 0 97 0 100 0 106 0 111 0 121] 
#[0 1 142 0 11 0 47 0 88 0 90 0 91 0 95 0 97 0 100 0 106 0 111 0 121] 
#[0 1 142 0 11 0 47 0 88 0 90 0 91 0 95 0 97 0 100 0 106 0 111 0 121] 
#[0 1 142 0 11 0 47 0 88 0 90 0 91 0 95 0 97 0 100 0 106 0 111 0 121] 
#[0 2 206 0 11 0 47 0 88 0 90 0 91 0 95 0 97 0 100 0 106 0 111 0 121] 
#[0 10 237 0 94] 
#[0 1 134 0 11 0 88 0 91 0 94 0 97 0 100 0 106 0 111] 
#[0 1 134 0 11 0 88 0 91 0 94 0 97 0 100 0 106 0 111] 
#[0 1 134 0 11 0 88 0 91 0 94 0 97 0 100 0 106 0 111] 
#[0 1 134 0 11 0 88 0 91 0 94 0 97 0 100 0 106 0 111] 
#[0 1 134 0 11 0 88 0 91 0 94 0 97 0 100 0 106 0 111] 
#[0 1 134 0 11 0 88 0 91 0 94 0 97 0 100 0 106 0 111] 
#[0 2 210 0 11 0 88 0 91 0 94 0 97 0 100 0 106 0 111] 
#[0 10 241 0 110] 
#[0 1 138 0 11 0 88 0 91 0 97 0 100 0 106 0 110 0 111] 
#[0 1 138 0 11 0 88 0 91 0 97 0 100 0 106 0 110 0 111] 
#[0 1 138 0 11 0 88 0 91 0 97 0 100 0 106 0 110 0 111] 
#[0 1 138 0 11 0 88 0 91 0 97 0 100 0 106 0 110 0 111] 
#[0 1 138 0 11 0 88 0 91 0 97 0 100 0 106 0 110 0 111] 
#[0 1 138 0 11 0 88 0 91 0 97 0 100 0 106 0 110 0 111] 
#[0 2 214 0 11 0 88 0 91 0 97 0 100 0 106 0 110 0 111] 
#[0 10 245 0 157] 
#[0 1 126 0 11 0 88 0 91 0 106 0 109 0 111] 
#[0 1 126 0 11 0 88 0 91 0 106 0 109 0 111] 
#[0 1 126 0 11 0 88 0 91 0 106 0 109 0 111] 
#[0 1 126 0 11 0 88 0 91 0 106 0 109 0 111] 
#[0 1 126 0 11 0 88 0 91 0 106 0 109 0 111] 
#[0 2 218 0 11 0 88 0 91 0 106 0 109 0 111] 
#[1 4 165 0 39 4 169 0 40 4 173 0 41 4 177 0 42 4 181 0 44 4 185 0 45 4 189 0 46 4 193 0 48 4 201 0 53 0 225 0 67 4 205 0 68 4 209 0 69 4 213 0 70 4 217 0 71 4 221 0 73 4 225 0 74 4 233 0 157 1 113 0 178 1 117 0 180 4 237 0 189 10 249 0 190 1 129 0 192 1 133 0 193 1 137 0 194 1 141 0 195 1 145 0 196 1 149 0 197 1 153 0 198 1 157 0 199 1 161 0 200 1 165 0 201 1 169 0 202 1 173 0 203 1 177 0 204 1 181 0 205 1 185 0 206 1 189 0 207 10 253 1 30 11 1 1 202 2 225 2 78 2 229 2 79] 
#[0 1 130 0 11 0 21 0 88 0 91 0 100 0 106 0 111] 
#[0 1 130 0 11 0 21 0 88 0 91 0 100 0 106 0 111] 
#[0 1 130 0 11 0 21 0 88 0 91 0 100 0 106 0 111] 
#[0 1 130 0 11 0 21 0 88 0 91 0 100 0 106 0 111] 
#[0 1 130 0 11 0 21 0 88 0 91 0 100 0 106 0 111] 
#[0 1 130 0 11 0 21 0 88 0 91 0 100 0 106 0 111] 
#[0 2 222 0 11 0 21 0 88 0 91 0 100 0 106 0 111] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 5 97 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[1 0 134 0 12 0 134 0 34 5 189 0 43 0 134 0 49 11 5 0 57 5 197 0 59 0 134 0 62 0 134 0 65 0 134 0 75 0 134 0 76 0 134 0 99 0 134 0 155 6 149 0 188 5 205 0 214] 
#[1 5 229 0 12 5 233 0 34 5 237 0 49 5 241 0 65 0 222 0 75 5 245 0 99 11 9 1 43 11 13 1 44] 
#[1 0 226 0 12 0 226 0 34 0 226 0 49 2 226 0 62 0 226 0 65 0 226 0 75 0 226 0 76 0 226 0 99 2 226 0 155] 
#[1 0 226 0 12 0 226 0 34 0 226 0 49 2 230 0 62 0 226 0 65 0 226 0 75 0 226 0 76 0 226 0 99 2 230 0 155] 
#[1 0 226 0 12 0 226 0 34 0 226 0 49 2 230 0 62 0 226 0 65 0 226 0 75 0 226 0 76 0 226 0 99 2 230 0 155] 
#[0 11 17 0 155] 
#[1 11 21 0 62 2 234 0 155] 
#[0 2 238 0 62 0 155] 
#[0 2 230 0 62 0 155] 
#[0 2 242 0 62 0 66] 
#[0 11 25 0 66] 
#[1 11 29 0 62 2 246 0 66] 
#[0 2 18 0 2 0 4 0 6 0 10 0 11 0 15 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 52 0 53 0 55 0 58 0 59 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 83 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 11 33 0 52 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 11 37 0 76 0 253 0 87 1 1 0 92 1 13 0 104 2 250 0 155 11 41 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 11 45 1 14 11 49 1 15 11 53 1 16 11 57 1 17 11 61 1 19 11 65 1 20 11 69 1 21 2 61 1 37 10 9 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 2 209 2 70 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[1 2 46 0 1 2 46 0 2 2 46 0 4 2 46 0 5 2 46 0 9 2 46 0 11 2 46 0 12 2 46 0 13 2 46 0 14 2 46 0 16 2 46 0 17 2 46 0 18 2 46 0 19 2 46 0 20 2 46 0 21 2 46 0 29 2 46 0 32 2 46 0 34 2 46 0 39 2 46 0 40 2 46 0 41 2 46 0 42 2 46 0 44 2 46 0 45 2 46 0 46 2 46 0 48 2 46 0 53 2 46 0 60 2 46 0 61 2 46 0 63 2 50 0 64 2 46 0 65 2 46 0 68 2 46 0 69 2 46 0 70 2 46 0 71 2 46 0 73 2 46 0 74 2 46 0 87 2 46 0 92 2 46 0 104 0 155 0 157 2 46 0 158 2 46 0 159 2 46 0 160 2 46 0 161 2 46 0 162 2 46 0 165 2 46 0 166 2 46 0 169 2 46 0 170 9 145 0 217 11 73 0 218 9 153 0 219 9 157 0 220 9 161 0 222] 
#[0 2 254 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 3 2 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 3 2 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 8 109 0 52 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 6 0 155 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 11 77 1 23 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 11 81 1 198 11 85 2 12 11 89 2 13 2 209 2 70 11 93 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[0 3 10 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 11 97 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 8 73 0 62 0 217 0 63 3 49 0 65 1 210 0 66 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 8 77 0 211 8 81 0 212 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 11 101 1 9 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 8 197 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[0 3 14 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 11 105 0 64] 
#[1 0 11 0 4 11 109 0 43 0 171 0 49 11 113 0 59 0 175 0 64 0 11 0 75 0 11 0 76 8 85 0 188 5 205 0 214 11 117 1 31 11 121 1 32] 
#[1 0 186 0 4 11 125 0 64 0 190 0 75 0 194 0 76] 
#[1 11 129 0 49 11 133 0 64] 
#[1 6 17 0 4 11 137 0 64] 
#[0 3 22 0 49] 
#[0 3 26 0 49] 
#[0 3 30 0 49 0 64] 
#[0 3 34 0 49] 
#[0 3 34 0 49] 
#[1 3 34 0 49 11 141 0 64] 
#[0 11 145 0 49] 
#[1 0 186 0 4 11 149 0 64 0 190 0 75 0 194 0 76] 
#[0 11 153 0 64] 
#[0 3 38 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 3 42 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[1 11 157 0 62 11 161 0 66] 
#[0 3 46 0 62 0 66 0 155] 
#[0 3 50 0 1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 52 0 53 0 54 0 55 0 57 0 58 0 59 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 80 0 81 0 82 0 84 0 85 0 86 0 87 0 88 0 89 0 90 0 91 0 92 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 104 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 122 0 123 0 124 0 125 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 135 0 136 0 138 0 139 0 140 0 141 0 142 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 153 0 154 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 163 0 164 0 165 0 166 0 167 0 168 0 169 0 170 2 97] 
#[0 3 54 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170] 
#[0 3 58 0 64] 
#[0 11 165 0 64] 
#[0 3 58 0 64] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 0 221 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 4 141 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 2 61 1 37 11 169 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 2 209 2 70 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84] 
#[0 3 62 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[1 0 186 0 4 0 186 0 64 0 190 0 75 0 179 0 76] 
#[1 0 202 0 4 0 202 0 75 0 202 0 76 11 173 0 157 11 177 2 86 11 181 2 87] 
#[1 6 97 0 4 11 185 0 64] 
#[0 11 189 0 64] 
#[0 3 66 0 20 0 22 0 26 0 27 0 55 0 64 0 89 0 128 0 129] 
#[0 11 193 0 57] 
#[1 3 70 0 55 11 197 0 62] 
#[0 3 74 0 55 0 62] 
#[1 3 78 0 52 11 201 0 65 3 78 0 137 11 205 1 149 11 209 1 151] 
#[1 0 201 0 52 11 213 2 72] 
#[1 3 82 0 1 3 82 0 2 3 82 0 4 3 82 0 5 3 82 0 9 3 82 0 11 3 82 0 12 3 82 0 13 3 82 0 14 3 82 0 16 3 82 0 17 3 82 0 18 3 82 0 19 3 82 0 21 3 82 0 29 3 82 0 32 3 82 0 34 3 82 0 39 3 82 0 40 3 82 0 41 3 82 0 42 3 82 0 44 3 82 0 45 3 82 0 46 3 82 0 48 3 82 0 52 3 82 0 53 3 82 0 54 3 82 0 55 3 82 0 63 3 82 0 65 3 82 0 67 3 82 0 68 3 82 0 69 3 82 0 70 3 82 0 71 3 82 0 73 3 82 0 74 3 82 0 87 3 82 0 92 3 82 0 100 3 82 0 103 3 82 0 104 3 82 0 122 3 82 0 125 3 82 0 130 3 82 0 135 3 82 0 136 9 5 0 138 3 82 0 139 3 82 0 140 3 82 0 141 9 9 0 142 3 82 0 143 3 82 0 144 3 82 0 145 3 82 0 146 3 82 0 147 3 82 0 148 3 82 0 149 3 82 0 150 3 82 0 151 3 82 0 152 3 82 0 155 3 82 0 157 3 82 0 158 3 82 0 159 3 82 0 160 3 82 0 161 3 82 0 162 3 82 0 165 3 82 0 166 3 82 0 169 3 82 0 170 11 217 1 147 11 221 1 148 3 82 2 97] 
#[0 3 86 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 139 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[0 3 90 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 138 0 139 0 140 0 141 0 142 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[0 3 94 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 139 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[0 11 225 0 55] 
#[0 3 98 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 139 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[0 11 229 0 64] 
#[0 3 102 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 139 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[0 3 106 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 139 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[0 11 233 0 55] 
#[0 3 110 0 55 0 58 0 62 0 66 0 155 0 163 0 164 0 167 0 168] 
#[0 3 114 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 139 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[0 11 237 0 64] 
#[0 11 241 0 64] 
#[0 11 245 0 65] 
#[1 0 11 0 4 0 134 0 12 0 134 0 34 5 189 0 43 0 134 0 49 0 134 0 57 5 197 0 59 0 134 0 65 0 11 0 75 0 11 0 76 0 134 0 99 0 134 0 116 0 134 0 117 0 134 0 118 0 134 0 119 0 134 0 120 0 134 0 123 0 134 0 124 0 134 0 131 0 134 0 132 0 134 0 134 0 11 0 157 5 201 0 188 5 205 0 214] 
#[0 3 118 0 55] 
#[0 3 122 0 55 0 62 0 64] 
#[0 11 249 0 55] 
#[0 3 126 0 55] 
#[1 3 130 0 55 11 253 0 62] 
#[0 12 1 0 157] 
#[1 0 134 0 2 0 134 0 4 0 134 0 6 0 134 0 10 0 134 0 11 0 134 0 15 0 134 0 20 0 134 0 21 0 134 0 22 0 134 0 24 0 134 0 25 0 134 0 26 0 134 0 27 0 134 0 28 0 134 0 30 0 134 0 31 0 134 0 32 0 134 0 33 0 134 0 35 0 134 0 36 0 134 0 37 0 134 0 38 0 134 0 39 0 134 0 40 0 134 0 41 0 134 0 42 0 134 0 44 0 134 0 45 0 134 0 46 0 134 0 47 0 134 0 48 0 134 0 49 0 134 0 51 0 134 0 52 0 134 0 53 0 134 0 55 0 134 0 58 0 107 0 59 0 134 0 62 0 134 0 63 0 134 0 64 0 134 0 65 0 134 0 66 0 134 0 67 0 134 0 68 0 134 0 69 0 134 0 70 0 134 0 71 0 134 0 72 0 134 0 73 0 134 0 74 0 134 0 75 0 134 0 76 0 134 0 77 0 134 0 80 0 134 0 82 0 134 0 83 0 134 0 86 0 134 0 88 0 134 0 89 0 134 0 90 0 134 0 91 0 134 0 93 0 134 0 94 0 134 0 95 0 134 0 96 0 134 0 97 0 134 0 100 0 134 0 103 0 134 0 106 0 134 0 109 0 134 0 110 0 134 0 111 0 134 0 121 0 134 0 126 0 134 0 127 0 134 0 128 0 134 0 129 0 134 0 130 0 134 0 133 0 134 0 153 0 134 0 155 0 134 0 157 0 134 0 163 0 134 0 164 0 134 0 167 0 134 0 168 12 5 0 188 5 205 0 214 0 134 2 97] 
#[0 3 134 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[1 0 186 0 4 3 138 0 62 0 190 0 75 0 194 0 76 3 138 0 153] 
#[1 12 9 0 62 12 13 0 153] 
#[0 3 142 0 62 0 153] 
#[1 0 134 0 2 0 134 0 4 0 134 0 6 0 134 0 10 0 134 0 11 0 134 0 15 0 134 0 20 0 134 0 21 0 134 0 22 0 134 0 24 0 134 0 25 0 134 0 26 0 134 0 27 0 134 0 28 0 134 0 30 0 134 0 31 0 134 0 32 0 134 0 33 0 134 0 35 0 134 0 36 0 134 0 37 0 134 0 38 0 134 0 39 0 134 0 40 0 134 0 41 0 134 0 42 0 134 0 44 0 134 0 45 0 134 0 46 0 134 0 47 0 134 0 48 0 134 0 49 0 134 0 51 0 134 0 52 0 134 0 53 0 134 0 55 0 134 0 58 0 107 0 59 0 134 0 62 0 134 0 63 0 134 0 64 0 134 0 65 0 134 0 66 0 134 0 67 0 134 0 68 0 134 0 69 0 134 0 70 0 134 0 71 0 134 0 72 0 134 0 73 0 134 0 74 0 134 0 75 0 134 0 76 0 134 0 77 0 134 0 80 0 134 0 82 0 134 0 83 0 134 0 86 0 134 0 88 0 134 0 89 0 134 0 90 0 134 0 91 0 134 0 93 0 134 0 94 0 134 0 95 0 134 0 96 0 134 0 97 0 134 0 100 0 134 0 103 0 134 0 106 0 134 0 109 0 134 0 110 0 134 0 111 0 134 0 121 0 134 0 126 0 134 0 127 0 134 0 128 0 134 0 129 0 134 0 130 0 134 0 133 0 134 0 153 0 134 0 155 0 134 0 157 0 134 0 163 0 134 0 164 0 134 0 167 0 134 0 168 12 17 0 188 5 205 0 214 0 134 2 97] 
#[0 3 146 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 52 0 53 0 55 0 57 0 58 0 59 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 83 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[1 11 157 0 62 12 21 0 66] 
#[1 3 46 0 62 0 183 0 66] 
#[1 0 134 0 2 0 134 0 3 0 134 0 4 0 134 0 6 0 134 0 7 0 134 0 8 0 134 0 9 0 134 0 10 0 134 0 11 0 134 0 12 0 134 0 15 0 134 0 19 0 134 0 20 0 134 0 21 0 134 0 22 0 134 0 25 0 134 0 26 0 134 0 27 0 134 0 28 0 134 0 30 0 134 0 31 0 134 0 32 0 134 0 33 0 134 0 34 0 134 0 35 0 134 0 36 0 134 0 37 0 134 0 38 0 134 0 39 0 134 0 40 0 134 0 41 0 134 0 42 0 134 0 44 0 134 0 45 0 134 0 46 0 134 0 47 0 134 0 48 0 134 0 49 0 134 0 51 0 134 0 53 0 134 0 55 0 134 0 57 0 134 0 58 0 107 0 59 0 134 0 62 0 134 0 64 0 134 0 65 0 134 0 66 0 134 0 67 0 134 0 68 0 134 0 69 0 134 0 70 0 134 0 71 0 134 0 72 0 134 0 73 0 134 0 74 0 134 0 75 0 134 0 76 0 134 0 77 0 134 0 80 0 134 0 82 0 134 0 86 0 134 0 88 0 134 0 89 0 134 0 90 0 134 0 91 0 134 0 93 0 134 0 94 0 134 0 95 0 134 0 96 0 134 0 97 0 134 0 99 0 134 0 100 0 134 0 103 0 134 0 106 0 134 0 109 0 134 0 110 0 134 0 111 0 134 0 116 0 134 0 117 0 134 0 118 0 134 0 119 0 134 0 120 0 134 0 121 0 134 0 123 0 134 0 124 0 134 0 126 0 134 0 127 0 134 0 128 0 134 0 129 0 134 0 130 0 134 0 131 0 134 0 132 0 134 0 133 0 134 0 134 0 134 0 153 0 134 0 154 0 134 0 155 0 134 0 157 0 134 0 163 0 134 0 164 0 134 0 167 0 134 0 168 12 29 0 188 5 205 0 214 0 134 2 97] 
#[0 12 33 0 58] 
#[1 12 37 0 62 3 150 0 64] 
#[0 12 41 0 64] 
#[0 3 154 0 62 0 64 0 66] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 12 45 0 60 12 49 0 61 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 12 53 0 221 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 12 57 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[0 3 158 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 20 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 53 0 60 0 61 0 63 0 65 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 104 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170] 
#[0 3 162 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 12 61 0 157] 
#[1 2 46 0 1 2 46 0 2 2 46 0 4 2 46 0 5 2 46 0 9 2 46 0 11 2 46 0 12 2 46 0 13 2 46 0 14 2 46 0 16 2 46 0 17 2 46 0 18 2 46 0 19 2 46 0 20 2 46 0 21 2 46 0 29 2 46 0 32 2 46 0 34 2 46 0 39 2 46 0 40 2 46 0 41 2 46 0 42 2 46 0 44 2 46 0 45 2 46 0 46 2 46 0 48 2 46 0 53 2 46 0 60 2 46 0 61 2 46 0 63 2 50 0 64 2 46 0 65 2 46 0 68 2 46 0 69 2 46 0 70 2 46 0 71 2 46 0 73 2 46 0 74 2 46 0 87 2 46 0 92 2 46 0 104 0 155 0 157 2 46 0 158 2 46 0 159 2 46 0 160 2 46 0 161 2 46 0 162 2 46 0 165 2 46 0 166 2 46 0 169 2 46 0 170 9 145 0 217 12 65 0 218 9 153 0 219 9 157 0 220 9 161 0 222] 
#[1 2 46 0 1 2 46 0 2 2 46 0 4 2 46 0 5 2 46 0 9 2 46 0 11 2 46 0 12 2 46 0 13 2 46 0 14 2 46 0 16 2 46 0 17 2 46 0 18 2 46 0 19 2 46 0 20 2 46 0 21 2 46 0 29 2 46 0 32 2 46 0 34 2 46 0 39 2 46 0 40 2 46 0 41 2 46 0 42 2 46 0 44 2 46 0 45 2 46 0 46 2 46 0 48 2 46 0 53 2 46 0 60 2 46 0 61 2 46 0 63 2 46 0 65 2 46 0 68 2 46 0 69 2 46 0 70 2 46 0 71 2 46 0 73 2 46 0 74 2 46 0 87 2 46 0 92 2 46 0 104 0 155 0 157 2 46 0 158 2 46 0 159 2 46 0 160 2 46 0 161 2 46 0 162 2 46 0 165 2 46 0 166 2 46 0 169 2 46 0 170 12 69 0 217 9 153 0 219 9 157 0 220 9 161 0 222] 
#[1 12 73 0 49 12 77 0 76] 
#[0 12 81 0 163] 
#[1 3 166 0 163 12 85 0 164] 
#[1 12 89 0 62 3 170 0 163 3 170 0 164 3 170 0 167 3 170 0 168] 
#[1 3 174 0 167 12 93 0 168] 
#[0 12 97 0 167] 
#[1 0 134 0 2 0 134 0 3 0 134 0 4 0 134 0 6 0 134 0 7 0 134 0 8 0 134 0 9 0 134 0 10 0 134 0 11 0 134 0 12 0 134 0 15 0 134 0 19 0 134 0 20 0 134 0 21 0 134 0 22 0 134 0 25 0 134 0 26 0 134 0 27 0 134 0 28 0 134 0 30 0 134 0 31 0 134 0 32 0 134 0 33 0 134 0 34 0 134 0 35 0 134 0 36 0 134 0 37 0 134 0 38 0 134 0 39 0 134 0 40 0 134 0 41 0 134 0 42 0 134 0 44 0 134 0 45 0 134 0 46 0 134 0 47 0 134 0 48 0 134 0 49 0 134 0 51 0 134 0 53 0 134 0 55 0 134 0 57 0 134 0 58 0 107 0 59 0 134 0 62 0 134 0 64 0 134 0 65 0 134 0 66 0 134 0 67 0 134 0 68 0 134 0 69 0 134 0 70 0 134 0 71 0 134 0 72 0 134 0 73 0 134 0 74 0 134 0 75 0 134 0 76 0 134 0 77 0 134 0 80 0 134 0 82 0 134 0 86 0 134 0 88 0 134 0 89 0 134 0 90 0 134 0 91 0 134 0 93 0 134 0 94 0 134 0 95 0 134 0 96 0 134 0 97 0 134 0 99 0 134 0 100 0 134 0 103 0 134 0 106 0 134 0 109 0 134 0 110 0 134 0 111 0 134 0 116 0 134 0 117 0 134 0 118 0 134 0 119 0 134 0 120 0 134 0 121 0 134 0 123 0 134 0 124 0 134 0 126 0 134 0 127 0 134 0 128 0 134 0 129 0 134 0 130 0 134 0 131 0 134 0 132 0 134 0 133 0 134 0 134 0 134 0 153 0 134 0 154 0 134 0 155 0 134 0 157 0 134 0 163 0 134 0 164 0 134 0 167 0 134 0 168 12 101 0 188 5 205 0 214 0 134 2 97] 
#[0 3 178 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 3 182 0 2 0 11 0 20 0 21 0 22 0 25 0 26 0 27 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 55 0 58 0 62 0 64 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[1 6 77 0 157 12 105 1 116 6 89 1 117] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 8 109 0 52 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 12 109 0 102 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 12 113 1 23 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 12 117 1 118 2 209 2 70 12 121 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 12 125 2 96 3 205 2 101] 
#[0 12 129 0 23] 
#[0 3 186 0 24 0 52] 
#[1 1 10 0 39 1 10 0 40 1 10 0 41 1 10 0 42 1 10 0 44 1 10 0 45 1 10 0 46 1 10 0 48 1 10 0 53 6 109 0 60 6 113 0 61 1 10 0 67 1 10 0 68 1 10 0 69 1 10 0 70 1 10 0 71 1 10 0 73 1 10 0 74 1 10 0 157 12 133 1 66 6 129 1 67 6 133 1 68] 
#[1 0 186 0 4 0 190 0 75 0 194 0 76 12 137 0 157] 
#[0 3 190 0 24] 
#[1 12 141 0 157 12 145 1 70] 
#[1 2 46 0 1 2 46 0 2 2 46 0 4 2 46 0 5 2 46 0 9 2 46 0 11 2 46 0 12 2 46 0 13 2 46 0 14 2 46 0 16 2 46 0 17 2 46 0 18 2 46 0 19 2 46 0 20 2 46 0 21 2 46 0 29 2 46 0 32 2 46 0 34 2 46 0 39 2 46 0 40 2 46 0 41 2 46 0 42 2 46 0 44 2 46 0 45 2 46 0 46 2 46 0 48 2 46 0 53 2 46 0 60 2 46 0 61 2 46 0 63 2 50 0 64 2 46 0 65 2 46 0 68 2 46 0 69 2 46 0 70 2 46 0 71 2 46 0 73 2 46 0 74 2 46 0 87 2 46 0 92 2 46 0 104 0 155 0 157 2 46 0 158 2 46 0 159 2 46 0 160 2 46 0 161 2 46 0 162 2 46 0 165 2 46 0 166 2 46 0 169 2 46 0 170 9 145 0 217 12 149 0 218 9 153 0 219 9 157 0 220 9 161 0 222] 
#[0 3 194 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 55 0 58 0 59 0 62 0 64 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 3 194 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 55 0 58 0 59 0 62 0 64 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 3 194 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 55 0 58 0 59 0 62 0 64 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 1 30 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 55 0 58 0 59 0 62 0 64 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[1 3 198 0 2 6 157 0 3 6 161 0 4 3 198 0 6 3 198 0 7 6 165 0 8 3 198 0 9 3 198 0 10 3 198 0 11 3 198 0 15 3 198 0 19 3 198 0 20 3 198 0 21 3 198 0 22 3 198 0 25 3 198 0 26 3 198 0 27 3 198 0 28 3 198 0 30 3 198 0 31 3 198 0 32 3 198 0 33 3 198 0 35 3 198 0 36 3 198 0 37 3 198 0 38 3 198 0 39 3 198 0 40 3 198 0 41 3 198 0 42 3 198 0 44 3 198 0 45 3 198 0 46 3 198 0 47 3 198 0 48 3 198 0 51 3 198 0 53 3 198 0 55 3 198 0 58 3 198 0 59 3 198 0 62 3 198 0 64 3 198 0 66 3 198 0 67 3 198 0 68 3 198 0 69 3 198 0 70 3 198 0 71 3 198 0 72 3 198 0 73 3 198 0 74 3 198 0 75 3 198 0 76 3 198 0 77 3 198 0 80 3 198 0 82 3 198 0 86 3 198 0 88 3 198 0 89 3 198 0 90 3 198 0 91 3 198 0 93 3 198 0 94 3 198 0 95 3 198 0 96 3 198 0 97 3 198 0 100 3 198 0 103 3 198 0 106 3 198 0 109 3 198 0 110 3 198 0 111 3 198 0 121 3 198 0 126 3 198 0 127 3 198 0 128 3 198 0 129 3 198 0 130 3 198 0 133 3 198 0 153 3 198 0 154 3 198 0 155 3 198 0 157 3 198 0 163 3 198 0 164 3 198 0 167 3 198 0 168 3 198 2 97] 
#[1 3 198 0 2 6 157 0 3 6 161 0 4 3 198 0 6 3 198 0 7 6 165 0 8 3 198 0 9 3 198 0 10 3 198 0 11 3 198 0 15 3 198 0 19 3 198 0 20 3 198 0 21 3 198 0 22 3 198 0 25 3 198 0 26 3 198 0 27 3 198 0 28 3 198 0 30 3 198 0 31 3 198 0 32 3 198 0 33 3 198 0 35 3 198 0 36 3 198 0 37 3 198 0 38 3 198 0 39 3 198 0 40 3 198 0 41 3 198 0 42 3 198 0 44 3 198 0 45 3 198 0 46 3 198 0 47 3 198 0 48 3 198 0 51 3 198 0 53 3 198 0 55 3 198 0 58 3 198 0 59 3 198 0 62 3 198 0 64 3 198 0 66 3 198 0 67 3 198 0 68 3 198 0 69 3 198 0 70 3 198 0 71 3 198 0 72 3 198 0 73 3 198 0 74 3 198 0 75 3 198 0 76 3 198 0 77 3 198 0 80 3 198 0 82 3 198 0 86 3 198 0 88 3 198 0 89 3 198 0 90 3 198 0 91 3 198 0 93 3 198 0 94 3 198 0 95 3 198 0 96 3 198 0 97 3 198 0 100 3 198 0 103 3 198 0 106 3 198 0 109 3 198 0 110 3 198 0 111 3 198 0 121 3 198 0 126 3 198 0 127 3 198 0 128 3 198 0 129 3 198 0 130 3 198 0 133 3 198 0 153 3 198 0 154 3 198 0 155 3 198 0 157 3 198 0 163 3 198 0 164 3 198 0 167 3 198 0 168 3 198 2 97] 
#[1 3 202 0 2 3 202 0 6 3 202 0 7 6 169 0 9 3 202 0 10 3 202 0 11 3 202 0 15 6 173 0 19 3 202 0 20 3 202 0 21 3 202 0 22 3 202 0 25 3 202 0 26 3 202 0 27 3 202 0 28 3 202 0 30 3 202 0 31 3 202 0 32 3 202 0 33 3 202 0 35 3 202 0 36 3 202 0 37 3 202 0 38 3 202 0 39 3 202 0 40 3 202 0 41 3 202 0 42 3 202 0 44 3 202 0 45 3 202 0 46 3 202 0 47 3 202 0 48 3 202 0 51 3 202 0 53 3 202 0 55 3 202 0 58 3 202 0 59 3 202 0 62 3 202 0 64 3 202 0 66 3 202 0 67 3 202 0 68 3 202 0 69 3 202 0 70 3 202 0 71 3 202 0 72 3 202 0 73 3 202 0 74 3 202 0 75 3 202 0 76 3 202 0 77 3 202 0 80 3 202 0 82 3 202 0 86 3 202 0 88 3 202 0 89 3 202 0 90 3 202 0 91 3 202 0 93 3 202 0 94 3 202 0 95 3 202 0 96 3 202 0 97 3 202 0 100 3 202 0 103 3 202 0 106 3 202 0 109 3 202 0 110 3 202 0 111 3 202 0 121 3 202 0 126 3 202 0 127 3 202 0 128 3 202 0 129 3 202 0 130 3 202 0 133 3 202 0 153 3 202 0 154 3 202 0 155 3 202 0 157 3 202 0 163 3 202 0 164 3 202 0 167 3 202 0 168 3 202 2 97] 
#[1 3 202 0 2 3 202 0 6 3 202 0 7 6 169 0 9 3 202 0 10 3 202 0 11 3 202 0 15 6 173 0 19 3 202 0 20 3 202 0 21 3 202 0 22 3 202 0 25 3 202 0 26 3 202 0 27 3 202 0 28 3 202 0 30 3 202 0 31 3 202 0 32 3 202 0 33 3 202 0 35 3 202 0 36 3 202 0 37 3 202 0 38 3 202 0 39 3 202 0 40 3 202 0 41 3 202 0 42 3 202 0 44 3 202 0 45 3 202 0 46 3 202 0 47 3 202 0 48 3 202 0 51 3 202 0 53 3 202 0 55 3 202 0 58 3 202 0 59 3 202 0 62 3 202 0 64 3 202 0 66 3 202 0 67 3 202 0 68 3 202 0 69 3 202 0 70 3 202 0 71 3 202 0 72 3 202 0 73 3 202 0 74 3 202 0 75 3 202 0 76 3 202 0 77 3 202 0 80 3 202 0 82 3 202 0 86 3 202 0 88 3 202 0 89 3 202 0 90 3 202 0 91 3 202 0 93 3 202 0 94 3 202 0 95 3 202 0 96 3 202 0 97 3 202 0 100 3 202 0 103 3 202 0 106 3 202 0 109 3 202 0 110 3 202 0 111 3 202 0 121 3 202 0 126 3 202 0 127 3 202 0 128 3 202 0 129 3 202 0 130 3 202 0 133 3 202 0 153 3 202 0 154 3 202 0 155 3 202 0 157 3 202 0 163 3 202 0 164 3 202 0 167 3 202 0 168 3 202 2 97] 
#[1 3 206 0 2 3 206 0 6 6 177 0 7 3 206 0 10 3 206 0 11 3 206 0 15 3 206 0 20 3 206 0 21 3 206 0 22 3 206 0 25 3 206 0 26 3 206 0 27 3 206 0 28 3 206 0 30 3 206 0 31 3 206 0 32 3 206 0 33 3 206 0 35 3 206 0 36 3 206 0 37 3 206 0 38 3 206 0 39 3 206 0 40 3 206 0 41 3 206 0 42 3 206 0 44 3 206 0 45 3 206 0 46 3 206 0 47 3 206 0 48 3 206 0 51 3 206 0 53 3 206 0 55 3 206 0 58 3 206 0 59 3 206 0 62 3 206 0 64 3 206 0 66 3 206 0 67 3 206 0 68 3 206 0 69 3 206 0 70 3 206 0 71 3 206 0 72 3 206 0 73 3 206 0 74 3 206 0 75 3 206 0 76 3 206 0 77 3 206 0 80 3 206 0 82 3 206 0 86 3 206 0 88 3 206 0 89 3 206 0 90 3 206 0 91 3 206 0 93 3 206 0 94 3 206 0 95 3 206 0 96 3 206 0 97 3 206 0 100 3 206 0 103 3 206 0 106 3 206 0 109 3 206 0 110 3 206 0 111 3 206 0 121 3 206 0 126 3 206 0 127 3 206 0 128 3 206 0 129 3 206 0 130 3 206 0 133 3 206 0 153 6 181 0 154 3 206 0 155 3 206 0 157 3 206 0 163 3 206 0 164 3 206 0 167 3 206 0 168 3 206 2 97] 
#[1 3 206 0 2 3 206 0 6 6 177 0 7 3 206 0 10 3 206 0 11 3 206 0 15 3 206 0 20 3 206 0 21 3 206 0 22 3 206 0 25 3 206 0 26 3 206 0 27 3 206 0 28 3 206 0 30 3 206 0 31 3 206 0 32 3 206 0 33 3 206 0 35 3 206 0 36 3 206 0 37 3 206 0 38 3 206 0 39 3 206 0 40 3 206 0 41 3 206 0 42 3 206 0 44 3 206 0 45 3 206 0 46 3 206 0 47 3 206 0 48 3 206 0 51 3 206 0 53 3 206 0 55 3 206 0 58 3 206 0 59 3 206 0 62 3 206 0 64 3 206 0 66 3 206 0 67 3 206 0 68 3 206 0 69 3 206 0 70 3 206 0 71 3 206 0 72 3 206 0 73 3 206 0 74 3 206 0 75 3 206 0 76 3 206 0 77 3 206 0 80 3 206 0 82 3 206 0 86 3 206 0 88 3 206 0 89 3 206 0 90 3 206 0 91 3 206 0 93 3 206 0 94 3 206 0 95 3 206 0 96 3 206 0 97 3 206 0 100 3 206 0 103 3 206 0 106 3 206 0 109 3 206 0 110 3 206 0 111 3 206 0 121 3 206 0 126 3 206 0 127 3 206 0 128 3 206 0 129 3 206 0 130 3 206 0 133 3 206 0 153 6 181 0 154 3 206 0 155 3 206 0 157 3 206 0 163 3 206 0 164 3 206 0 167 3 206 0 168 3 206 2 97] 
#[1 3 206 0 2 0 186 0 4 3 206 0 6 3 206 0 10 3 206 0 11 3 206 0 15 3 206 0 20 3 206 0 21 3 206 0 22 3 206 0 25 3 206 0 26 3 206 0 27 3 206 0 28 3 206 0 30 3 206 0 31 3 206 0 32 3 206 0 33 3 206 0 35 3 206 0 36 3 206 0 37 3 206 0 38 3 206 0 39 3 206 0 40 3 206 0 41 3 206 0 42 3 206 0 44 3 206 0 45 3 206 0 46 3 206 0 47 3 206 0 48 3 206 0 51 3 206 0 53 3 206 0 55 3 206 0 58 3 206 0 59 3 206 0 62 3 206 0 64 3 206 0 66 3 206 0 67 3 206 0 68 3 206 0 69 3 206 0 70 3 206 0 71 3 206 0 72 3 206 0 73 3 206 0 74 0 187 0 75 0 191 0 76 3 206 0 77 3 206 0 80 3 206 0 82 3 206 0 86 3 206 0 88 3 206 0 89 3 206 0 90 3 206 0 91 3 206 0 93 3 206 0 94 3 206 0 95 3 206 0 96 3 206 0 97 3 206 0 100 3 206 0 103 3 206 0 106 3 206 0 109 3 206 0 110 3 206 0 111 3 206 0 121 3 206 0 126 3 206 0 127 3 206 0 128 3 206 0 129 3 206 0 130 3 206 0 133 3 206 0 153 3 206 0 155 3 206 0 157 3 206 0 163 3 206 0 164 3 206 0 167 3 206 0 168 3 206 2 97] 
#[1 3 206 0 2 0 186 0 4 3 206 0 6 3 206 0 10 3 206 0 11 3 206 0 15 3 206 0 20 3 206 0 21 3 206 0 22 3 206 0 25 3 206 0 26 3 206 0 27 3 206 0 28 3 206 0 30 3 206 0 31 3 206 0 32 3 206 0 33 3 206 0 35 3 206 0 36 3 206 0 37 3 206 0 38 3 206 0 39 3 206 0 40 3 206 0 41 3 206 0 42 3 206 0 44 3 206 0 45 3 206 0 46 3 206 0 47 3 206 0 48 3 206 0 51 3 206 0 53 3 206 0 55 3 206 0 58 3 206 0 59 3 206 0 62 3 206 0 64 3 206 0 66 3 206 0 67 3 206 0 68 3 206 0 69 3 206 0 70 3 206 0 71 3 206 0 72 3 206 0 73 3 206 0 74 0 187 0 75 0 191 0 76 3 206 0 77 3 206 0 80 3 206 0 82 3 206 0 86 3 206 0 88 3 206 0 89 3 206 0 90 3 206 0 91 3 206 0 93 3 206 0 94 3 206 0 95 3 206 0 96 3 206 0 97 3 206 0 100 3 206 0 103 3 206 0 106 3 206 0 109 3 206 0 110 3 206 0 111 3 206 0 121 3 206 0 126 3 206 0 127 3 206 0 128 3 206 0 129 3 206 0 130 3 206 0 133 3 206 0 153 3 206 0 155 3 206 0 157 3 206 0 163 3 206 0 164 3 206 0 167 3 206 0 168 3 206 2 97] 
#[1 3 206 0 2 3 206 0 6 6 177 0 7 3 206 0 10 3 206 0 11 3 206 0 15 3 206 0 20 3 206 0 21 3 206 0 22 3 206 0 25 3 206 0 26 3 206 0 27 3 206 0 28 3 206 0 30 3 206 0 31 3 206 0 32 3 206 0 33 3 206 0 35 3 206 0 36 3 206 0 37 3 206 0 38 3 206 0 39 3 206 0 40 3 206 0 41 3 206 0 42 3 206 0 44 3 206 0 45 3 206 0 46 3 206 0 47 3 206 0 48 3 206 0 51 3 206 0 53 3 206 0 55 3 206 0 58 3 206 0 59 3 206 0 62 3 206 0 64 3 206 0 66 3 206 0 67 3 206 0 68 3 206 0 69 3 206 0 70 3 206 0 71 3 206 0 72 3 206 0 73 3 206 0 74 3 206 0 75 3 206 0 76 3 206 0 77 3 206 0 80 3 206 0 82 3 206 0 86 3 206 0 88 3 206 0 89 3 206 0 90 3 206 0 91 3 206 0 93 3 206 0 94 3 206 0 95 3 206 0 96 3 206 0 97 3 206 0 100 3 206 0 103 3 206 0 106 3 206 0 109 3 206 0 110 3 206 0 111 3 206 0 121 3 206 0 126 3 206 0 127 3 206 0 128 3 206 0 129 3 206 0 130 3 206 0 133 3 206 0 153 6 181 0 154 3 206 0 155 3 206 0 157 3 206 0 163 3 206 0 164 3 206 0 167 3 206 0 168 3 206 2 97] 
#[1 3 206 0 2 3 206 0 6 6 177 0 7 3 206 0 10 3 206 0 11 3 206 0 15 3 206 0 20 3 206 0 21 3 206 0 22 3 206 0 25 3 206 0 26 3 206 0 27 3 206 0 28 3 206 0 30 3 206 0 31 3 206 0 32 3 206 0 33 3 206 0 35 3 206 0 36 3 206 0 37 3 206 0 38 3 206 0 39 3 206 0 40 3 206 0 41 3 206 0 42 3 206 0 44 3 206 0 45 3 206 0 46 3 206 0 47 3 206 0 48 3 206 0 51 3 206 0 53 3 206 0 55 3 206 0 58 3 206 0 59 3 206 0 62 3 206 0 64 3 206 0 66 3 206 0 67 3 206 0 68 3 206 0 69 3 206 0 70 3 206 0 71 3 206 0 72 3 206 0 73 3 206 0 74 3 206 0 75 3 206 0 76 3 206 0 77 3 206 0 80 3 206 0 82 3 206 0 86 3 206 0 88 3 206 0 89 3 206 0 90 3 206 0 91 3 206 0 93 3 206 0 94 3 206 0 95 3 206 0 96 3 206 0 97 3 206 0 100 3 206 0 103 3 206 0 106 3 206 0 109 3 206 0 110 3 206 0 111 3 206 0 121 3 206 0 126 3 206 0 127 3 206 0 128 3 206 0 129 3 206 0 130 3 206 0 133 3 206 0 153 6 181 0 154 3 206 0 155 3 206 0 157 3 206 0 163 3 206 0 164 3 206 0 167 3 206 0 168 3 206 2 97] 
#[1 3 210 0 2 6 185 0 6 6 189 0 10 3 210 0 11 6 193 0 15 3 210 0 20 3 210 0 21 3 210 0 22 3 210 0 25 3 210 0 26 3 210 0 27 3 210 0 28 3 210 0 30 6 197 0 31 3 210 0 32 3 210 0 33 3 210 0 35 3 210 0 36 3 210 0 37 3 210 0 38 3 210 0 39 3 210 0 40 3 210 0 41 3 210 0 42 3 210 0 44 3 210 0 45 3 210 0 46 3 210 0 47 3 210 0 48 3 210 0 51 3 210 0 53 3 210 0 55 3 210 0 58 6 201 0 59 3 210 0 62 3 210 0 64 3 210 0 66 3 210 0 67 3 210 0 68 3 210 0 69 3 210 0 70 3 210 0 71 3 210 0 72 3 210 0 73 3 210 0 74 3 210 0 75 3 210 0 76 3 210 0 77 3 210 0 80 3 210 0 82 3 210 0 86 3 210 0 88 3 210 0 89 3 210 0 90 3 210 0 91 3 210 0 93 3 210 0 94 3 210 0 95 3 210 0 96 3 210 0 97 3 210 0 100 3 210 0 103 3 210 0 106 3 210 0 109 3 210 0 110 3 210 0 111 3 210 0 121 3 210 0 126 3 210 0 127 3 210 0 128 3 210 0 129 3 210 0 130 3 210 0 133 6 205 0 153 3 210 0 155 3 210 0 157 3 210 0 163 3 210 0 164 3 210 0 167 3 210 0 168 3 210 2 97] 
#[1 3 210 0 2 6 185 0 6 6 189 0 10 3 210 0 11 6 193 0 15 3 210 0 20 3 210 0 21 3 210 0 22 3 210 0 25 3 210 0 26 3 210 0 27 3 210 0 28 3 210 0 30 6 197 0 31 3 210 0 32 3 210 0 33 3 210 0 35 3 210 0 36 3 210 0 37 3 210 0 38 3 210 0 39 3 210 0 40 3 210 0 41 3 210 0 42 3 210 0 44 3 210 0 45 3 210 0 46 3 210 0 47 3 210 0 48 3 210 0 51 3 210 0 53 3 210 0 55 3 210 0 58 6 201 0 59 3 210 0 62 3 210 0 64 3 210 0 66 3 210 0 67 3 210 0 68 3 210 0 69 3 210 0 70 3 210 0 71 3 210 0 72 3 210 0 73 3 210 0 74 3 210 0 75 3 210 0 76 3 210 0 77 3 210 0 80 3 210 0 82 3 210 0 86 3 210 0 88 3 210 0 89 3 210 0 90 3 210 0 91 3 210 0 93 3 210 0 94 3 210 0 95 3 210 0 96 3 210 0 97 3 210 0 100 3 210 0 103 3 210 0 106 3 210 0 109 3 210 0 110 3 210 0 111 3 210 0 121 3 210 0 126 3 210 0 127 3 210 0 128 3 210 0 129 3 210 0 130 3 210 0 133 6 205 0 153 3 210 0 155 3 210 0 157 3 210 0 163 3 210 0 164 3 210 0 167 3 210 0 168 3 210 2 97] 
#[1 3 214 0 2 3 214 0 11 3 214 0 20 3 214 0 21 3 214 0 22 3 214 0 25 3 214 0 26 3 214 0 27 3 214 0 28 7 45 0 32 3 214 0 35 3 214 0 36 3 214 0 37 3 214 0 38 3 214 0 39 3 214 0 40 3 214 0 41 3 214 0 42 3 214 0 44 3 214 0 45 3 214 0 46 3 214 0 47 3 214 0 48 3 214 0 51 3 214 0 53 3 214 0 55 3 214 0 58 3 214 0 62 3 214 0 64 3 214 0 66 3 214 0 67 3 214 0 68 3 214 0 69 3 214 0 70 3 214 0 71 3 214 0 72 3 214 0 73 3 214 0 74 3 214 0 75 3 214 0 76 3 214 0 77 3 214 0 80 3 214 0 82 3 214 0 86 3 214 0 88 3 214 0 89 3 214 0 90 3 214 0 91 3 214 0 93 3 214 0 94 3 214 0 95 3 214 0 96 3 214 0 97 3 214 0 100 3 214 0 103 3 214 0 106 3 214 0 109 3 214 0 110 3 214 0 111 3 214 0 121 3 214 0 126 3 214 0 127 3 214 0 128 3 214 0 129 3 214 0 130 3 214 0 133 3 214 0 155 3 214 0 157 3 214 0 163 3 214 0 164 3 214 0 167 3 214 0 168 3 214 2 97] 
#[1 3 218 0 2 3 218 0 11 3 218 0 20 3 218 0 21 3 218 0 22 3 218 0 25 3 218 0 26 3 218 0 27 3 218 0 28 3 218 0 35 3 218 0 36 6 217 0 37 3 218 0 38 3 218 0 39 3 218 0 40 3 218 0 41 3 218 0 42 3 218 0 44 3 218 0 45 3 218 0 46 3 218 0 47 3 218 0 48 3 218 0 51 3 218 0 53 3 218 0 55 3 218 0 58 3 218 0 62 3 218 0 64 3 218 0 66 3 218 0 67 3 218 0 68 3 218 0 69 3 218 0 70 3 218 0 71 3 218 0 72 3 218 0 73 3 218 0 74 3 218 0 75 3 218 0 76 3 218 0 77 3 218 0 80 3 218 0 82 3 218 0 86 3 218 0 88 3 218 0 89 3 218 0 90 3 218 0 91 3 218 0 93 3 218 0 94 3 218 0 95 3 218 0 96 3 218 0 97 3 218 0 100 3 218 0 103 3 218 0 106 3 218 0 109 3 218 0 110 3 218 0 111 3 218 0 121 3 218 0 126 3 218 0 127 3 218 0 128 3 218 0 129 3 218 0 130 3 218 0 133 3 218 0 155 3 218 0 157 3 218 0 163 3 218 0 164 3 218 0 167 3 218 0 168 3 218 2 97] 
#[1 3 222 0 2 3 222 0 11 3 222 0 20 3 222 0 21 3 222 0 22 3 222 0 25 3 222 0 26 3 222 0 27 3 222 0 28 3 222 0 35 6 221 0 36 3 222 0 38 3 222 0 39 3 222 0 40 3 222 0 41 3 222 0 42 3 222 0 44 3 222 0 45 3 222 0 46 3 222 0 47 3 222 0 48 3 222 0 51 3 222 0 53 3 222 0 55 3 222 0 58 3 222 0 62 3 222 0 64 3 222 0 66 3 222 0 67 3 222 0 68 3 222 0 69 3 222 0 70 3 222 0 71 3 222 0 72 3 222 0 73 3 222 0 74 3 222 0 75 3 222 0 76 3 222 0 77 3 222 0 80 3 222 0 82 3 222 0 86 3 222 0 88 3 222 0 89 3 222 0 90 3 222 0 91 3 222 0 93 3 222 0 94 3 222 0 95 3 222 0 96 3 222 0 97 3 222 0 100 3 222 0 103 3 222 0 106 3 222 0 109 3 222 0 110 3 222 0 111 3 222 0 121 3 222 0 126 3 222 0 127 3 222 0 128 3 222 0 129 3 222 0 130 3 222 0 133 3 222 0 155 3 222 0 157 3 222 0 163 3 222 0 164 3 222 0 167 3 222 0 168 3 222 2 97] 
#[0 3 226 0 2 0 11 0 20 0 21 0 22 0 25 0 26 0 27 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 55 0 58 0 62 0 64 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[1 3 230 0 2 3 230 0 11 3 230 0 20 3 230 0 21 3 230 0 22 3 230 0 25 3 230 0 26 3 230 0 27 3 230 0 28 6 225 0 35 3 230 0 38 3 230 0 39 3 230 0 40 3 230 0 41 3 230 0 42 3 230 0 44 3 230 0 45 3 230 0 46 3 230 0 47 3 230 0 48 3 230 0 51 3 230 0 53 3 230 0 55 3 230 0 58 3 230 0 62 3 230 0 64 3 230 0 66 3 230 0 67 3 230 0 68 3 230 0 69 3 230 0 70 3 230 0 71 3 230 0 72 3 230 0 73 3 230 0 74 3 230 0 75 3 230 0 76 3 230 0 77 3 230 0 80 3 230 0 82 3 230 0 86 3 230 0 88 3 230 0 89 3 230 0 90 3 230 0 91 3 230 0 93 3 230 0 94 3 230 0 95 3 230 0 96 3 230 0 97 3 230 0 100 3 230 0 103 3 230 0 106 3 230 0 109 3 230 0 110 3 230 0 111 3 230 0 121 3 230 0 126 3 230 0 127 3 230 0 128 3 230 0 129 3 230 0 130 3 230 0 133 3 230 0 155 3 230 0 157 3 230 0 163 3 230 0 164 3 230 0 167 3 230 0 168 3 230 2 97] 
#[0 12 153 0 58] 
#[0 3 234 0 2 0 11 0 20 0 21 0 22 0 25 0 26 0 27 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 55 0 58 0 62 0 64 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 3 238 0 2 0 11 0 20 0 21 0 22 0 25 0 26 0 27 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 55 0 58 0 62 0 64 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 3 238 0 2 0 11 0 20 0 21 0 22 0 25 0 26 0 27 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 55 0 58 0 62 0 64 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 12 157 0 57] 
#[0 12 161 0 157] 
#[0 3 242 0 20 0 22 0 26 0 27 0 89 0 128 0 129] 
#[1 3 246 0 20 3 246 0 22 3 246 0 26 3 246 0 27 12 165 0 62 3 246 0 89 3 246 0 128 3 246 0 129] 
#[0 3 250 0 20 0 22 0 26 0 27 0 62 0 89 0 128 0 129] 
#[1 3 254 0 20 3 254 0 22 3 254 0 26 3 254 0 27 3 254 0 62 3 254 0 89 12 169 0 126 12 173 0 127 3 254 0 128 3 254 0 129 12 177 1 88 12 181 1 89] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 12 185 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 12 189 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[1 4 2 0 2 4 2 0 11 4 2 0 20 4 2 0 21 4 2 0 22 4 2 0 25 4 2 0 26 4 2 0 27 4 2 0 39 4 2 0 40 4 2 0 41 4 2 0 42 4 2 0 44 4 2 0 45 4 2 0 46 4 2 0 47 4 2 0 48 4 2 0 51 4 2 0 53 4 2 0 55 4 2 0 58 4 2 0 62 4 2 0 64 4 2 0 66 4 2 0 67 4 2 0 68 4 2 0 69 4 2 0 70 4 2 0 71 4 2 0 72 4 2 0 73 4 2 0 74 4 2 0 76 0 195 0 77 4 2 0 80 4 2 0 82 4 2 0 86 4 2 0 88 4 2 0 89 4 2 0 90 4 2 0 91 4 2 0 93 4 2 0 94 4 2 0 95 4 2 0 96 4 2 0 97 4 2 0 100 4 2 0 103 4 2 0 106 4 2 0 109 4 2 0 110 4 2 0 111 4 2 0 121 4 2 0 126 4 2 0 127 4 2 0 128 4 2 0 129 4 2 0 130 4 2 0 133 4 2 0 155 4 2 0 157 4 2 0 163 4 2 0 164 4 2 0 167 4 2 0 168 12 197 1 77 12 201 1 92 4 2 2 97] 
#[0 4 6 0 2 0 11 0 20 0 21 0 22 0 25 0 26 0 27 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 55 0 58 0 62 0 64 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 4 10 0 2 0 11 0 20 0 21 0 22 0 25 0 26 0 27 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 55 0 58 0 62 0 64 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 4 14 0 20 0 22 0 26 0 27 0 89 0 128 0 129] 
#[1 4 18 0 2 4 18 0 11 4 18 0 20 4 18 0 21 4 18 0 22 4 18 0 25 4 18 0 26 4 18 0 27 4 18 0 28 6 209 0 30 4 18 0 32 6 213 0 33 4 18 0 35 4 18 0 36 4 18 0 37 4 18 0 38 4 18 0 39 4 18 0 40 4 18 0 41 4 18 0 42 4 18 0 44 4 18 0 45 4 18 0 46 4 18 0 47 4 18 0 48 4 18 0 51 4 18 0 53 4 18 0 55 4 18 0 58 4 18 0 62 4 18 0 64 4 18 0 66 4 18 0 67 4 18 0 68 4 18 0 69 4 18 0 70 4 18 0 71 4 18 0 72 4 18 0 73 4 18 0 74 4 18 0 75 4 18 0 76 4 18 0 77 4 18 0 80 4 18 0 82 4 18 0 86 4 18 0 88 4 18 0 89 4 18 0 90 4 18 0 91 4 18 0 93 4 18 0 94 4 18 0 95 4 18 0 96 4 18 0 97 4 18 0 100 4 18 0 103 4 18 0 106 4 18 0 109 4 18 0 110 4 18 0 111 4 18 0 121 4 18 0 126 4 18 0 127 4 18 0 128 4 18 0 129 4 18 0 130 4 18 0 133 4 18 0 155 4 18 0 157 4 18 0 163 4 18 0 164 4 18 0 167 4 18 0 168 4 18 2 97] 
#[0 4 22 0 11 0 21 0 47 0 50 0 51 0 54 0 76 0 88 0 90 0 91 0 94 0 95 0 97 0 100 0 106 0 109 0 110 0 111 0 121 0 155 2 97] 
#[0 12 205 0 55] 
#[1 7 105 0 157 12 209 0 178 4 237 0 189] 
#[0 4 26 0 11 0 21 0 47 0 50 0 54 0 76 0 88 0 90 0 91 0 94 0 95 0 97 0 100 0 106 0 109 0 110 0 111 0 121 0 155 2 97] 
#[0 4 30 0 58] 
#[0 4 30 0 58] 
#[1 7 105 0 157 1 113 0 178 7 109 0 180 4 237 0 189 12 213 2 52 7 117 2 60 7 121 2 61] 
#[0 12 217 0 58] 
#[1 0 10 0 11 0 10 0 21 0 10 0 47 0 45 0 50 0 49 0 76 0 10 0 88 0 10 0 90 0 10 0 91 0 10 0 94 0 10 0 95 0 10 0 97 0 10 0 100 0 10 0 106 0 10 0 109 0 10 0 110 0 10 0 111 0 10 0 121 4 34 0 155 0 53 0 182 0 57 0 183 0 61 0 184 0 65 0 185 0 69 0 186 0 73 0 187 0 77 0 252 0 81 1 155 0 85 2 54 0 89 2 55 0 93 2 56 12 221 2 75 4 34 2 97] 
#[0 4 38 2 97] 
#[0 4 42 0 11 0 21 0 47 0 50 0 76 0 88 0 90 0 91 0 94 0 95 0 97 0 100 0 106 0 109 0 110 0 111 0 121 0 155 2 97] 
#[0 4 46 0 11 0 21 0 47 0 50 0 76 0 88 0 90 0 91 0 94 0 95 0 97 0 100 0 106 0 109 0 110 0 111 0 121 2 97] 
#[0 4 50 0 49 0 52] 
#[1 0 30 0 11 0 30 0 21 0 30 0 47 0 30 0 50 3 221 0 54 0 30 0 76 0 30 0 88 0 30 0 90 0 30 0 91 0 30 0 94 0 30 0 95 0 30 0 97 0 30 0 100 0 30 0 106 0 30 0 109 0 30 0 110 0 30 0 111 0 30 0 121 0 30 0 155 3 225 0 173 3 229 0 174 3 233 0 175 3 237 0 176 3 241 0 177 12 225 1 128] 
#[0 4 54 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 50 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157 2 97] 
#[0 4 58 0 11 0 21 0 47 0 50 0 76 0 88 0 90 0 91 0 94 0 95 0 97 0 100 0 106 0 109 0 110 0 111 0 121 0 155 2 97] 
#[1 12 229 0 66 7 105 0 157 1 113 0 178 7 109 0 180 4 237 0 189 12 233 2 60 7 121 2 61] 
#[0 4 62 0 2 0 11 0 21 0 23 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 60 0 61 0 63 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 78 0 79 0 80 0 81 0 82 0 84 0 85 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 157] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 4 66 0 64 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 12 237 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 12 241 2 64 12 245 2 65 12 249 2 66 12 253 2 67 13 1 2 68 13 5 2 69 2 209 2 70 13 9 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[0 4 70 0 62 0 66] 
#[0 4 74 0 62 0 66] 
#[0 13 13 0 157] 
#[0 13 17 0 157] 
#[0 13 21 0 157] 
#[1 4 78 0 52 13 25 0 58 13 29 2 37 13 33 2 39] 
#[1 0 186 0 4 0 190 0 75 0 194 0 76 4 82 0 157] 
#[1 6 17 0 4 4 82 0 157] 
#[0 13 37 0 157] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 13 41 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[1 13 45 0 49 9 249 0 65 2 58 0 75 9 177 0 76] 
#[0 13 49 0 75] 
#[0 4 86 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[1 0 121 0 11 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 153 0 21 0 157 0 29 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 8 33 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 13 53 0 155 8 37 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 8 41 0 225 1 205 0 226 1 209 0 227 8 45 0 228 1 217 0 229 8 49 0 230 3 89 0 231 1 229 0 232 1 233 0 233 8 53 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 13 57 1 27 8 69 1 28 2 209 2 70 2 233 2 80 2 237 2 81 2 241 2 82] 
#[0 4 90 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 52 0 53 0 55 0 57 0 58 0 59 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 83 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 4 94 0 62 0 66] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 13 61 1 9 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 8 197 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[1 2 46 0 1 2 46 0 2 2 46 0 4 2 46 0 5 2 46 0 9 2 46 0 11 2 46 0 12 2 46 0 13 2 46 0 14 2 46 0 16 2 46 0 17 2 46 0 18 2 46 0 19 2 46 0 20 2 46 0 21 2 46 0 29 2 46 0 32 2 46 0 34 2 46 0 39 2 46 0 40 2 46 0 41 2 46 0 42 2 46 0 44 2 46 0 45 2 46 0 46 2 46 0 48 2 46 0 53 2 46 0 60 2 46 0 61 2 46 0 63 2 46 0 65 2 46 0 68 2 46 0 69 2 46 0 70 2 46 0 71 2 46 0 73 2 46 0 74 2 46 0 87 2 46 0 92 2 46 0 104 0 155 0 157 2 46 0 158 2 46 0 159 2 46 0 160 2 46 0 161 2 46 0 162 2 46 0 165 2 46 0 166 2 46 0 169 2 46 0 170 13 65 0 217 9 153 0 219 9 157 0 220 9 161 0 222] 
#[1 0 134 0 3 0 134 0 4 0 134 0 6 0 134 0 7 0 134 0 8 0 134 0 9 0 134 0 10 0 134 0 12 0 134 0 15 0 134 0 19 1 22 0 24 0 134 0 28 0 134 0 30 0 134 0 31 0 134 0 32 0 134 0 33 0 134 0 34 0 134 0 35 0 134 0 36 0 134 0 37 0 134 0 38 5 189 0 43 0 134 0 49 4 98 0 57 0 107 0 59 0 134 0 62 0 134 0 65 0 134 0 75 0 134 0 76 0 134 0 99 0 134 0 153 0 134 0 154 0 134 0 155 6 149 0 188 5 205 0 214] 
#[0 13 69 0 155] 
#[1 13 73 0 62 4 102 0 155] 
#[0 4 106 0 62 0 155] 
#[0 13 77 0 57] 
#[1 13 81 0 62 13 85 0 155] 
#[0 4 110 0 62 0 155] 
#[0 4 114 0 62 0 155] 
#[0 13 89 0 64] 
#[0 4 118 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 55 0 62 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[0 4 122 0 62 0 155] 
#[0 13 93 0 155] 
#[1 13 97 0 62 4 126 0 155] 
#[0 4 118 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 55 0 62 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[0 13 101 0 64] 
#[1 11 157 0 62 13 105 0 66] 
#[0 4 130 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 13 109 0 157] 
#[1 4 165 0 39 4 169 0 40 4 173 0 41 4 177 0 42 4 181 0 44 4 185 0 45 4 189 0 46 4 193 0 48 4 201 0 53 13 113 0 62 0 225 0 67 4 205 0 68 4 209 0 69 4 213 0 70 4 217 0 71 4 221 0 73 4 225 0 74 4 134 0 153 4 233 0 157 1 113 0 178 1 117 0 180 4 237 0 189 9 109 0 190 1 129 0 192 1 133 0 193 1 137 0 194 1 141 0 195 1 145 0 196 1 149 0 197 1 153 0 198 1 157 0 199 1 161 0 200 1 165 0 201 1 169 0 202 1 173 0 203 1 177 0 204 1 181 0 205 1 185 0 206 1 189 0 207 9 113 0 213 9 117 0 215 2 57 1 30 13 117 1 33 13 121 1 34 2 225 2 78 2 229 2 79] 
#[0 4 138 0 49 0 64] 
#[0 4 142 0 49 0 64] 
#[0 4 146 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 13 125 0 157] 
#[0 4 146 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 4 146 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 4 150 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 13 129 0 157] 
#[0 4 154 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 4 158 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 13 133 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[0 4 162 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 0 129 0 13 0 133 0 14 0 137 0 16 0 141 0 17 0 145 0 18 0 149 0 19 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 0 201 0 52 3 45 0 53 0 209 0 54 0 213 0 55 0 217 0 63 0 221 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 5 0 100 1 9 0 103 1 13 0 104 1 21 0 125 1 29 0 135 1 33 0 136 1 37 0 140 1 41 0 141 1 45 0 143 1 49 0 144 1 53 0 146 1 57 0 147 1 61 0 148 1 65 0 149 1 69 0 150 1 73 0 151 1 77 0 152 4 141 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 1 201 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 1 225 0 231 1 229 0 232 1 233 0 233 1 237 0 234 1 241 0 235 1 245 0 236 1 249 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 2 61 1 37 2 65 1 38 2 69 1 39 2 73 1 40 2 77 1 41 2 81 1 42 2 85 1 45 2 89 1 94 13 137 1 98 2 105 1 99 2 109 1 100 2 113 1 101 2 117 1 102 2 121 1 103 2 125 1 104 2 129 1 105 2 133 1 106 2 137 1 107 2 141 1 108 2 145 1 109 2 161 1 121 2 165 1 122 2 169 1 123 2 173 1 130 2 177 1 131 2 181 1 132 2 185 1 133 2 189 1 141 2 193 1 142 2 197 1 143 2 201 1 144 2 205 1 145 2 209 2 70 2 213 2 72 2 221 2 77 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 2 253 2 85] 
#[0 4 166 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 13 141 0 57] 
#[1 13 145 0 62 13 149 0 64] 
#[0 4 170 0 62 0 64] 
#[0 4 174 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 0 129 0 13 0 133 0 14 0 137 0 16 0 141 0 17 0 145 0 18 0 149 0 19 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 0 201 0 52 3 45 0 53 0 209 0 54 0 213 0 55 0 217 0 63 0 221 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 5 0 100 1 9 0 103 1 13 0 104 1 21 0 125 1 29 0 135 1 33 0 136 1 37 0 140 1 41 0 141 1 45 0 143 1 49 0 144 1 53 0 146 1 57 0 147 1 61 0 148 1 65 0 149 1 69 0 150 1 73 0 151 1 77 0 152 4 141 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 1 201 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 1 225 0 231 1 229 0 232 1 233 0 233 1 237 0 234 1 241 0 235 1 245 0 236 1 249 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 2 61 1 37 2 65 1 38 2 69 1 39 2 73 1 40 2 77 1 41 2 81 1 42 2 85 1 45 2 89 1 94 13 153 1 98 2 105 1 99 2 109 1 100 2 113 1 101 2 117 1 102 2 121 1 103 2 125 1 104 2 129 1 105 2 133 1 106 2 137 1 107 2 141 1 108 2 145 1 109 2 161 1 121 2 165 1 122 2 169 1 123 2 173 1 130 2 177 1 131 2 181 1 132 2 185 1 133 2 189 1 141 2 193 1 142 2 197 1 143 2 201 1 144 2 205 1 145 2 209 2 70 2 213 2 72 2 221 2 77 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 2 253 2 85] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 13 157 0 255 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 9 53 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[1 8 249 0 157 13 161 1 120] 
#[1 4 165 0 39 4 169 0 40 4 173 0 41 4 177 0 42 4 181 0 44 4 185 0 45 4 189 0 46 4 193 0 48 4 201 0 53 0 225 0 67 4 205 0 68 4 209 0 69 4 213 0 70 4 217 0 71 4 221 0 73 4 225 0 74 4 233 0 157 1 113 0 178 1 117 0 180 4 237 0 189 13 165 0 190 1 129 0 192 1 133 0 193 1 137 0 194 1 141 0 195 1 145 0 196 1 149 0 197 1 153 0 198 1 157 0 199 1 161 0 200 1 165 0 201 1 169 0 202 1 173 0 203 1 177 0 204 1 181 0 205 1 185 0 206 1 189 0 207 2 57 1 30 2 225 2 78 2 229 2 79] 
#[1 4 178 0 52 13 169 0 137 13 173 1 150 13 177 1 153] 
#[0 4 182 0 52 0 137] 
#[0 4 186 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 139 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[0 4 190 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 139 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[0 4 194 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 138 0 139 0 140 0 141 0 142 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[0 4 198 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 139 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 0 129 0 13 0 133 0 14 0 137 0 16 0 141 0 17 0 145 0 18 0 149 0 19 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 0 201 0 52 3 45 0 53 0 209 0 54 0 213 0 55 0 217 0 63 0 221 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 5 0 100 1 9 0 103 1 13 0 104 1 21 0 125 1 29 0 135 1 33 0 136 1 37 0 140 1 41 0 141 1 45 0 143 1 49 0 144 1 53 0 146 1 57 0 147 1 61 0 148 1 65 0 149 1 69 0 150 1 73 0 151 1 77 0 152 4 141 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 1 201 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 1 225 0 231 1 229 0 232 1 233 0 233 1 237 0 234 1 241 0 235 1 245 0 236 1 249 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 2 61 1 37 2 65 1 38 2 69 1 39 2 73 1 40 2 77 1 41 2 81 1 42 2 85 1 45 2 89 1 94 13 181 1 98 2 105 1 99 2 109 1 100 2 113 1 101 2 117 1 102 2 121 1 103 2 125 1 104 2 129 1 105 2 133 1 106 2 137 1 107 2 141 1 108 2 145 1 109 2 161 1 121 2 165 1 122 2 169 1 123 2 173 1 130 2 177 1 131 2 181 1 132 2 185 1 133 2 189 1 141 2 193 1 142 2 197 1 143 2 201 1 144 2 205 1 145 2 209 2 70 2 213 2 72 2 221 2 77 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 2 253 2 85] 
#[0 4 202 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 139 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[1 13 185 0 52 13 189 1 124] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 0 129 0 13 0 133 0 14 0 137 0 16 0 141 0 17 0 145 0 18 0 149 0 19 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 0 201 0 52 3 45 0 53 0 209 0 54 0 213 0 55 0 217 0 63 0 221 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 5 0 100 1 9 0 103 1 13 0 104 1 21 0 125 1 29 0 135 1 33 0 136 1 37 0 140 1 41 0 141 1 45 0 143 1 49 0 144 1 53 0 146 1 57 0 147 1 61 0 148 1 65 0 149 1 69 0 150 1 73 0 151 1 77 0 152 4 141 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 1 201 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 1 225 0 231 1 229 0 232 1 233 0 233 1 237 0 234 1 241 0 235 1 245 0 236 1 249 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 2 61 1 37 2 65 1 38 2 69 1 39 2 73 1 40 2 77 1 41 2 81 1 42 2 85 1 45 2 89 1 94 13 193 1 98 2 105 1 99 2 109 1 100 2 113 1 101 2 117 1 102 2 121 1 103 2 125 1 104 2 129 1 105 2 133 1 106 2 137 1 107 2 141 1 108 2 145 1 109 2 161 1 121 2 165 1 122 2 169 1 123 2 173 1 130 2 177 1 131 2 181 1 132 2 185 1 133 2 189 1 141 2 193 1 142 2 197 1 143 2 201 1 144 2 205 1 145 2 209 2 70 2 213 2 72 2 221 2 77 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 2 253 2 85] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 13 197 1 85 3 197 1 94 2 209 2 70 8 245 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 4 206 0 55 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 13 201 1 85 3 197 1 94 13 205 1 135 13 209 1 139 2 209 2 70 8 245 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 0 221 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 4 141 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 1 201 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 1 225 0 231 1 229 0 232 1 233 0 233 1 237 0 234 1 241 0 235 1 245 0 236 1 249 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 2 61 1 37 2 65 1 38 2 69 1 39 2 73 1 40 2 77 1 41 2 81 1 42 2 85 1 45 2 89 1 94 13 213 1 121 2 209 2 70 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84] 
#[0 13 217 0 23] 
#[0 4 210 0 2 0 4 0 6 0 10 0 11 0 15 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 52 0 53 0 55 0 58 0 59 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 83 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[1 4 165 0 39 4 169 0 40 4 173 0 41 4 177 0 42 4 181 0 44 4 185 0 45 4 189 0 46 4 193 0 48 4 201 0 53 0 225 0 67 4 205 0 68 4 209 0 69 4 213 0 70 4 217 0 71 4 221 0 73 4 225 0 74 4 233 0 157 1 113 0 178 1 117 0 180 4 237 0 189 9 109 0 190 1 129 0 192 1 133 0 193 1 137 0 194 1 141 0 195 1 145 0 196 1 149 0 197 1 153 0 198 1 157 0 199 1 161 0 200 1 165 0 201 1 169 0 202 1 173 0 203 1 177 0 204 1 181 0 205 1 185 0 206 1 189 0 207 13 221 0 215 2 57 1 30 2 225 2 78 2 229 2 79] 
#[0 4 214 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 52 0 53 0 55 0 57 0 58 0 59 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 83 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 4 218 0 2 0 4 0 6 0 10 0 11 0 15 0 20 0 21 0 22 0 24 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 52 0 53 0 55 0 58 0 59 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 83 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 153 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 4 222 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 4 226 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 4 230 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 4 234 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 20 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 53 0 60 0 61 0 63 0 65 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 104 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170] 
#[1 2 46 0 1 2 46 0 2 2 46 0 4 2 46 0 5 2 46 0 9 2 46 0 11 2 46 0 12 2 46 0 13 2 46 0 14 2 46 0 16 2 46 0 17 2 46 0 18 2 46 0 19 2 46 0 20 2 46 0 21 2 46 0 29 2 46 0 32 2 46 0 34 2 46 0 39 2 46 0 40 2 46 0 41 2 46 0 42 2 46 0 44 2 46 0 45 2 46 0 46 2 46 0 48 2 46 0 53 2 46 0 60 2 46 0 61 2 46 0 63 2 46 0 65 2 46 0 68 2 46 0 69 2 46 0 70 2 46 0 71 2 46 0 73 2 46 0 74 2 46 0 87 2 46 0 92 2 46 0 104 0 155 0 157 2 46 0 158 2 46 0 159 2 46 0 160 2 46 0 161 2 46 0 162 2 46 0 165 2 46 0 166 2 46 0 169 2 46 0 170 13 225 0 219 9 157 0 220 9 161 0 222] 
#[0 4 238 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 13 229 0 216 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 13 233 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 13 237 0 216 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 13 233 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[0 4 242 0 62 0 64 0 66] 
#[0 4 246 0 62 0 64 0 66] 
#[1 0 134 0 2 0 134 0 3 0 134 0 4 0 134 0 6 0 134 0 7 0 134 0 8 0 134 0 9 0 134 0 10 0 134 0 11 0 134 0 15 0 134 0 19 0 134 0 20 0 134 0 21 0 134 0 22 0 134 0 25 0 134 0 26 0 134 0 27 0 134 0 28 0 134 0 30 0 134 0 31 0 134 0 32 0 134 0 33 0 134 0 35 0 134 0 36 0 134 0 37 0 134 0 38 0 134 0 39 0 134 0 40 0 134 0 41 0 134 0 42 0 134 0 44 0 134 0 45 0 134 0 46 0 134 0 47 0 134 0 48 0 134 0 49 0 134 0 51 0 134 0 53 0 134 0 55 0 134 0 57 0 134 0 58 0 107 0 59 0 134 0 62 0 134 0 64 0 134 0 65 0 134 0 66 0 134 0 67 0 134 0 68 0 134 0 69 0 134 0 70 0 134 0 71 0 134 0 72 0 134 0 73 0 134 0 74 0 134 0 75 0 134 0 76 0 134 0 77 0 134 0 80 0 134 0 82 0 134 0 86 0 134 0 88 0 134 0 89 0 134 0 90 0 134 0 91 0 134 0 93 0 134 0 94 0 134 0 95 0 134 0 96 0 134 0 97 0 134 0 100 0 134 0 103 0 134 0 106 0 134 0 109 0 134 0 110 0 134 0 111 0 134 0 116 0 134 0 117 0 134 0 118 0 134 0 119 0 134 0 120 0 134 0 121 0 134 0 123 0 134 0 124 0 134 0 126 0 134 0 127 0 134 0 128 0 134 0 129 0 134 0 130 0 134 0 131 0 134 0 132 0 134 0 133 0 134 0 134 0 134 0 153 0 134 0 154 0 134 0 155 0 134 0 157 0 134 0 163 0 134 0 164 0 134 0 167 0 134 0 168 13 241 0 188 5 205 0 214 0 134 2 97] 
#[0 13 245 0 64] 
#[1 12 37 0 62 13 249 0 66] 
#[0 13 253 0 157] 
#[1 2 46 0 1 2 46 0 2 2 46 0 4 2 46 0 5 2 46 0 9 2 46 0 11 2 46 0 12 2 46 0 13 2 46 0 14 2 46 0 16 2 46 0 17 2 46 0 18 2 46 0 19 2 46 0 20 2 46 0 21 2 46 0 29 2 46 0 32 2 46 0 34 2 46 0 39 2 46 0 40 2 46 0 41 2 46 0 42 2 46 0 44 2 46 0 45 2 46 0 46 2 46 0 48 2 46 0 53 2 46 0 60 2 46 0 61 2 46 0 63 2 46 0 65 2 46 0 68 2 46 0 69 2 46 0 70 2 46 0 71 2 46 0 73 2 46 0 74 2 46 0 87 2 46 0 92 2 46 0 104 0 155 0 157 2 46 0 158 2 46 0 159 2 46 0 160 2 46 0 161 2 46 0 162 2 46 0 165 2 46 0 166 2 46 0 169 2 46 0 170 14 1 0 217 9 153 0 219 9 157 0 220 9 161 0 222] 
#[0 4 250 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 14 5 0 253 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 9 193 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 14 9 0 255 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 9 53 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 14 13 0 253 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 9 193 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[0 4 254 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 4 230 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 5 2 0 55 0 62 0 64] 
#[1 4 165 0 39 4 169 0 40 4 173 0 41 4 177 0 42 4 181 0 44 4 185 0 45 4 189 0 46 4 193 0 48 4 201 0 53 0 225 0 67 4 205 0 68 4 209 0 69 4 213 0 70 4 217 0 71 4 221 0 73 4 225 0 74 4 233 0 157 1 113 0 178 1 117 0 180 4 237 0 189 8 229 0 190 1 129 0 192 1 133 0 193 1 137 0 194 1 141 0 195 1 145 0 196 1 149 0 197 1 153 0 198 1 157 0 199 1 161 0 200 1 165 0 201 1 169 0 202 1 173 0 203 1 177 0 204 1 181 0 205 1 185 0 206 1 189 0 207 2 57 1 30 2 225 2 78 14 17 2 79] 
#[0 5 6 0 55 0 62 0 64] 
#[0 5 10 0 55 0 62 0 64] 
#[0 5 6 0 55 0 62 0 64] 
#[0 5 6 0 55 0 62 0 64] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 14 21 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[0 5 14 0 62 0 64] 
#[0 5 18 0 62 0 64] 
#[0 1 22 0 62 0 64] 
#[0 5 22 0 62 0 64] 
#[0 14 25 0 64] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 14 29 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 14 33 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[0 14 37 0 23] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 14 41 1 87 3 197 1 94 2 209 2 70 10 117 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[0 5 26 0 20 0 22 0 26 0 27 0 62 0 89 0 128 0 129] 
#[0 5 30 0 20 0 22 0 26 0 27 0 62 0 89 0 128 0 129] 
#[0 5 34 0 20 0 22 0 26 0 27 0 62 0 89 0 128 0 129] 
#[0 5 38 0 20 0 22 0 26 0 27 0 62 0 89 0 128 0 129] 
#[0 14 45 0 133] 
#[0 5 42 0 2 0 11 0 20 0 21 0 22 0 25 0 26 0 27 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 55 0 58 0 62 0 64 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 14 49 0 157] 
#[0 5 46 0 2 0 11 0 20 0 21 0 22 0 25 0 26 0 27 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 55 0 58 0 62 0 64 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 5 50 0 2 0 11 0 20 0 21 0 22 0 25 0 26 0 27 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 55 0 58 0 62 0 64 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 5 54 0 11 0 21 0 47 0 50 0 54 0 76 0 88 0 90 0 91 0 94 0 95 0 97 0 100 0 106 0 109 0 110 0 111 0 121 0 155 2 97] 
#[1 5 209 0 49 14 53 0 55] 
#[1 14 57 0 62 14 61 0 66] 
#[0 5 58 0 157] 
#[0 5 62 0 11 0 21 0 47 0 50 0 76 0 88 0 90 0 91 0 94 0 95 0 97 0 100 0 106 0 109 0 110 0 111 0 121 0 155 2 97] 
#[1 0 10 0 11 0 10 0 21 0 10 0 47 0 45 0 50 0 49 0 76 0 10 0 88 0 10 0 90 0 10 0 91 0 10 0 94 0 10 0 95 0 10 0 97 0 10 0 100 0 10 0 106 0 10 0 109 0 10 0 110 0 10 0 111 0 10 0 121 2 166 0 155 10 181 0 181 0 53 0 182 0 57 0 183 0 61 0 184 0 65 0 185 0 69 0 186 0 73 0 187 0 77 0 252 14 65 1 5 0 81 1 155 0 85 2 54 0 89 2 55 0 93 2 56 10 189 2 75] 
#[0 5 66 0 2 0 11 0 21 0 23 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 60 0 61 0 63 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 78 0 79 0 80 0 81 0 82 0 84 0 85 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 157] 
#[0 5 70 0 62 0 66] 
#[1 0 134 0 3 0 134 0 4 0 134 0 6 0 134 0 7 0 134 0 8 0 134 0 9 0 134 0 10 0 134 0 12 0 134 0 15 0 134 0 19 1 22 0 24 0 134 0 28 0 134 0 30 0 134 0 31 0 134 0 32 0 134 0 33 0 134 0 34 0 134 0 35 0 134 0 36 0 134 0 37 0 134 0 38 5 189 0 43 0 134 0 49 0 199 0 57 0 107 0 59 0 134 0 62 0 134 0 64 0 134 0 65 0 134 0 75 0 134 0 76 0 134 0 99 0 134 0 116 0 134 0 117 0 134 0 118 0 134 0 119 0 134 0 120 0 134 0 123 0 134 0 124 0 134 0 131 0 134 0 132 0 134 0 134 0 134 0 153 0 134 0 154 6 149 0 188 5 205 0 214] 
#[0 14 73 0 64] 
#[1 14 77 0 62 5 74 0 64] 
#[1 14 81 0 62 14 85 0 64] 
#[0 5 78 0 62 0 64] 
#[0 5 82 0 62 0 64] 
#[0 5 86 0 62 0 64] 
#[0 5 90 0 62 0 64] 
#[1 5 94 0 27 5 94 0 52 5 94 0 58 14 89 0 59 14 93 1 158 14 97 1 164] 
#[1 5 94 0 27 5 94 0 52 5 94 0 58 14 89 0 59 14 101 1 158 14 97 1 164] 
#[1 5 98 0 27 5 98 0 52 5 98 0 58 14 105 0 59 14 109 2 15 14 113 2 20] 
#[1 4 173 0 41 4 177 0 42 4 181 0 44 4 185 0 45 4 189 0 46 4 193 0 48 4 201 0 53 4 205 0 68 4 209 0 69 14 117 0 200] 
#[1 14 121 0 52 14 125 2 38] 
#[0 5 102 0 52] 
#[1 14 105 0 59 5 98 0 65 14 129 2 15 14 113 2 20] 
#[0 5 106 0 62 0 155] 
#[0 14 133 0 157] 
#[1 14 137 0 49 12 77 0 76] 
#[0 5 110 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 5 114 0 62 0 155] 
#[1 11 157 0 62 14 141 0 155] 
#[1 12 37 0 62 14 145 0 66] 
#[0 5 118 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[1 11 37 0 76 14 149 0 155 14 153 0 157 14 157 1 16 11 57 1 17] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 8 89 0 52 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 14 161 1 11 8 101 1 12 8 105 1 13 14 165 1 18 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 14 169 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 11 33 0 52 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 14 173 0 155 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 14 177 1 20 11 69 1 21 2 61 1 37 10 9 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 2 209 2 70 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[0 5 122 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[1 5 126 0 2 5 126 0 3 5 126 0 4 5 126 0 6 5 126 0 7 5 126 0 8 5 126 0 9 5 126 0 10 5 126 0 11 5 126 0 12 5 126 0 15 5 126 0 19 5 126 0 20 5 126 0 21 5 126 0 22 5 126 0 25 5 126 0 26 5 126 0 27 5 126 0 28 5 126 0 30 5 126 0 31 5 126 0 32 5 126 0 33 5 126 0 34 5 126 0 35 5 126 0 36 5 126 0 37 5 126 0 38 5 126 0 39 5 126 0 40 5 126 0 41 5 126 0 42 5 126 0 44 5 126 0 45 5 126 0 46 5 126 0 47 5 126 0 48 5 126 0 49 5 126 0 51 8 89 0 52 5 126 0 53 5 126 0 55 5 126 0 57 5 126 0 58 5 126 0 59 5 126 0 62 5 126 0 64 5 126 0 65 5 126 0 66 5 126 0 67 5 126 0 68 5 126 0 69 5 126 0 70 5 126 0 71 5 126 0 72 5 126 0 73 5 126 0 74 5 126 0 75 5 126 0 76 5 126 0 77 5 126 0 80 5 126 0 82 5 126 0 86 5 126 0 88 5 126 0 89 5 126 0 90 5 126 0 91 5 126 0 93 5 126 0 94 5 126 0 95 5 126 0 96 5 126 0 97 5 126 0 99 5 126 0 100 5 126 0 103 5 126 0 106 5 126 0 109 5 126 0 110 5 126 0 111 5 126 0 116 5 126 0 117 5 126 0 118 5 126 0 119 5 126 0 120 5 126 0 121 5 126 0 123 5 126 0 124 5 126 0 126 5 126 0 127 5 126 0 128 5 126 0 129 5 126 0 130 5 126 0 131 5 126 0 132 5 126 0 133 5 126 0 134 5 126 0 153 5 126 0 154 5 126 0 155 5 126 0 157 5 126 0 163 5 126 0 164 5 126 0 167 5 126 0 168 14 181 1 10 14 185 1 11 8 101 1 12 8 105 1 13 5 126 2 97] 
#[0 5 130 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 8 109 0 52 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 14 189 0 155 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 11 77 1 23 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 14 193 1 198 2 209 2 70 11 93 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[0 5 134 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[1 5 138 0 2 5 138 0 3 5 138 0 4 5 138 0 6 5 138 0 7 5 138 0 8 5 138 0 9 5 138 0 10 5 138 0 11 5 138 0 12 5 138 0 15 5 138 0 19 5 138 0 20 5 138 0 21 5 138 0 22 5 138 0 25 5 138 0 26 5 138 0 27 5 138 0 28 5 138 0 30 5 138 0 31 5 138 0 32 5 138 0 33 5 138 0 34 5 138 0 35 5 138 0 36 5 138 0 37 5 138 0 38 5 138 0 39 5 138 0 40 5 138 0 41 5 138 0 42 5 138 0 44 5 138 0 45 5 138 0 46 5 138 0 47 5 138 0 48 5 138 0 49 5 138 0 51 5 138 0 52 5 138 0 53 5 138 0 55 5 138 0 57 5 138 0 58 5 138 0 59 5 138 0 62 5 138 0 64 5 138 0 65 5 138 0 66 5 138 0 67 5 138 0 68 5 138 0 69 5 138 0 70 5 138 0 71 5 138 0 72 5 138 0 73 5 138 0 74 5 138 0 75 0 203 0 76 5 138 0 77 5 138 0 80 5 138 0 82 5 138 0 86 5 138 0 88 5 138 0 89 5 138 0 90 5 138 0 91 5 138 0 93 5 138 0 94 5 138 0 95 5 138 0 96 5 138 0 97 5 138 0 99 5 138 0 100 5 138 0 103 5 138 0 106 5 138 0 109 5 138 0 110 5 138 0 111 5 138 0 116 5 138 0 117 5 138 0 118 5 138 0 119 5 138 0 120 5 138 0 121 5 138 0 123 5 138 0 124 5 138 0 126 5 138 0 127 5 138 0 128 5 138 0 129 5 138 0 130 5 138 0 131 5 138 0 132 5 138 0 133 5 138 0 134 5 138 0 153 5 138 0 154 5 138 0 155 5 138 0 157 5 138 0 163 5 138 0 164 5 138 0 167 5 138 0 168 14 197 0 208 14 201 0 209 5 221 0 210 5 138 2 97] 
#[1 0 134 0 4 0 171 0 49 11 113 0 59 0 171 0 64 0 134 0 75 0 134 0 76 12 5 0 188 5 205 0 214 14 205 1 31 11 121 1 32] 
#[0 5 142 0 62 0 153] 
#[0 14 209 0 153] 
#[1 14 213 0 62 5 146 0 153] 
#[1 3 18 0 49 14 217 0 59 3 18 0 64 14 221 1 31 11 121 1 32] 
#[1 0 134 0 49 5 197 0 59 0 134 0 64 14 225 0 188 5 205 0 214] 
#[0 5 150 0 62 0 66 0 155] 
#[0 5 154 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 139 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 14 229 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 14 233 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 14 237 2 88 3 205 2 101] 
#[1 11 173 0 157 14 241 2 87] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 0 129 0 13 0 133 0 14 0 137 0 16 0 141 0 17 0 145 0 18 0 149 0 19 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 0 201 0 52 3 45 0 53 0 209 0 54 0 213 0 55 0 217 0 63 0 221 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 5 0 100 1 9 0 103 1 13 0 104 1 21 0 125 1 29 0 135 1 33 0 136 1 37 0 140 1 41 0 141 1 45 0 143 1 49 0 144 1 53 0 146 1 57 0 147 1 61 0 148 1 65 0 149 1 69 0 150 1 73 0 151 1 77 0 152 4 141 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 1 201 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 1 225 0 231 1 229 0 232 1 233 0 233 1 237 0 234 1 241 0 235 1 245 0 236 1 249 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 2 61 1 37 2 65 1 38 2 69 1 39 2 73 1 40 2 77 1 41 2 81 1 42 2 85 1 45 2 89 1 94 14 245 1 98 2 105 1 99 2 109 1 100 2 113 1 101 2 117 1 102 2 121 1 103 2 125 1 104 2 129 1 105 2 133 1 106 2 137 1 107 2 141 1 108 2 145 1 109 2 161 1 121 2 165 1 122 2 169 1 123 2 173 1 130 2 177 1 131 2 181 1 132 2 185 1 133 2 189 1 141 2 193 1 142 2 197 1 143 2 201 1 144 2 205 1 145 2 209 2 70 2 213 2 72 2 221 2 77 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 2 253 2 85] 
#[1 5 158 0 1 5 158 0 2 5 158 0 4 5 158 0 5 5 158 0 9 5 158 0 11 5 158 0 12 5 158 0 13 5 158 0 14 5 158 0 16 5 158 0 17 5 158 0 18 5 158 0 19 5 158 0 21 5 158 0 29 5 158 0 32 5 158 0 34 5 158 0 39 5 158 0 40 5 158 0 41 5 158 0 42 5 158 0 44 5 158 0 45 5 158 0 46 5 158 0 48 5 158 0 52 5 158 0 53 5 158 0 54 5 158 0 55 5 158 0 63 5 158 0 65 5 158 0 67 5 158 0 68 5 158 0 69 5 158 0 70 5 158 0 71 5 158 0 73 5 158 0 74 5 158 0 87 5 158 0 92 5 158 0 100 5 158 0 103 5 158 0 104 5 158 0 122 5 158 0 125 5 158 0 130 5 158 0 135 5 158 0 136 0 207 0 139 5 158 0 140 5 158 0 141 5 158 0 143 5 158 0 144 5 158 0 145 5 158 0 146 5 158 0 147 5 158 0 148 5 158 0 149 5 158 0 150 5 158 0 151 5 158 0 152 5 158 0 155 5 158 0 157 5 158 0 158 5 158 0 159 5 158 0 160 5 158 0 161 5 158 0 162 5 158 0 165 5 158 0 166 5 158 0 169 5 158 0 170 5 158 2 97] 
#[0 5 162 0 55 0 62] 
#[0 5 166 0 55 0 62] 
#[1 0 186 0 4 5 170 0 64 0 190 0 75 0 194 0 76 14 253 0 157 15 1 1 152] 
#[0 15 5 0 65] 
#[1 0 201 0 52 15 9 2 72] 
#[0 5 174 0 52] 
#[0 5 178 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 139 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[1 15 13 0 17 15 17 0 145 5 182 0 155 15 21 1 125 15 25 1 126 15 29 1 127 15 33 1 129 15 37 2 99] 
#[0 5 186 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 139 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[0 5 190 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 139 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[0 15 41 0 64] 
#[0 5 194 0 55] 
#[0 15 45 0 55] 
#[0 5 198 0 55] 
#[0 5 202 0 55 0 62 0 64] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 15 49 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[0 5 206 0 62 0 153] 
#[0 5 210 0 62 0 64 0 66] 
#[0 5 214 0 62 0 64 0 66] 
#[0 5 218 0 62 0 64 0 66] 
#[0 5 222 0 62 0 64 0 66] 
#[0 5 226 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[1 5 230 0 49 5 234 0 55 5 230 0 57 5 234 0 62 5 234 0 64 5 230 0 65 5 230 0 75 5 230 0 76 5 230 0 116 5 230 0 117 5 230 0 118 5 230 0 119 5 230 0 120 5 230 0 123 5 230 0 124 5 230 0 131 5 230 0 132 5 230 0 134] 
#[0 5 238 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[1 0 134 0 2 0 134 0 3 0 134 0 4 0 134 0 6 0 134 0 7 0 134 0 8 0 134 0 9 0 134 0 10 0 134 0 11 0 134 0 15 0 134 0 19 0 134 0 20 0 134 0 21 0 134 0 22 0 134 0 25 0 134 0 26 0 134 0 27 0 134 0 28 0 134 0 30 0 134 0 31 0 134 0 32 0 134 0 33 0 134 0 35 0 134 0 36 0 134 0 37 0 134 0 38 0 134 0 39 0 134 0 40 0 134 0 41 0 134 0 42 0 134 0 44 0 134 0 45 0 134 0 46 0 134 0 47 0 134 0 48 0 134 0 49 0 134 0 51 0 134 0 53 0 134 0 55 0 134 0 57 0 134 0 58 0 107 0 59 0 134 0 62 0 134 0 64 0 134 0 65 0 134 0 66 0 134 0 67 0 134 0 68 0 134 0 69 0 134 0 70 0 134 0 71 0 134 0 72 0 134 0 73 0 134 0 74 0 134 0 75 0 134 0 76 0 134 0 77 0 134 0 80 0 134 0 82 0 134 0 86 0 134 0 88 0 134 0 89 0 134 0 90 0 134 0 91 0 134 0 93 0 134 0 94 0 134 0 95 0 134 0 96 0 134 0 97 0 134 0 100 0 134 0 103 0 134 0 106 0 134 0 109 0 134 0 110 0 134 0 111 0 134 0 116 0 134 0 117 0 134 0 118 0 134 0 119 0 134 0 120 0 134 0 121 0 134 0 123 0 134 0 124 0 134 0 126 0 134 0 127 0 134 0 128 0 134 0 129 0 134 0 130 0 134 0 131 0 134 0 132 0 134 0 133 0 134 0 134 0 134 0 153 0 134 0 154 0 134 0 155 0 134 0 157 0 134 0 163 0 134 0 164 0 134 0 167 0 134 0 168 15 53 0 188 5 205 0 214 0 134 2 97] 
#[1 12 37 0 62 15 57 0 66] 
#[0 5 242 0 163] 
#[0 5 246 0 163 0 164 0 167 0 168] 
#[0 5 250 0 167] 
#[1 6 97 0 4 15 61 0 76] 
#[0 5 254 0 20 0 22 0 26 0 27 0 89 0 128 0 129] 
#[0 5 230 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 6 2 0 2 0 11 0 20 0 21 0 22 0 25 0 26 0 27 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 55 0 58 0 62 0 64 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 6 6 0 20 0 22 0 26 0 27 0 89 0 128 0 129] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 15 65 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[0 6 10 0 20 0 22 0 26 0 27 0 62 0 89 0 128 0 129] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 15 69 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[1 3 9 0 20 6 245 0 22 6 249 0 26 6 253 0 27 7 1 0 89 1 86 0 128 1 86 0 129 7 5 1 72 15 73 1 73 7 13 1 75 7 17 1 78 7 21 1 79 7 25 1 80 7 29 1 81 7 33 1 82 7 37 1 83 7 41 1 84] 
#[0 6 14 0 11 0 21 0 47 0 50 0 54 0 76 0 88 0 90 0 91 0 94 0 95 0 97 0 100 0 106 0 109 0 110 0 111 0 121 0 155 2 97] 
#[1 15 77 0 66 7 105 0 157 1 113 0 178 7 109 0 180 4 237 0 189 12 233 2 60 7 121 2 61] 
#[0 6 18 0 11 0 21 0 47 0 50 0 76 0 88 0 90 0 91 0 94 0 95 0 97 0 100 0 106 0 109 0 110 0 111 0 121 2 97] 
#[0 15 81 0 155] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 15 85 2 68 2 209 2 70 13 9 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[0 6 22 0 62 0 66] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 12 237 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 15 89 2 66 15 93 2 67 13 1 2 68 13 5 2 69 2 209 2 70 13 9 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[1 15 97 0 157 15 101 2 69] 
#[0 6 22 0 62 0 66] 
#[1 0 49 0 76 0 10 0 157 15 105 1 155 15 109 1 165 0 85 2 54 0 89 2 55 0 93 2 56] 
#[1 6 26 0 27 6 26 0 52 15 113 0 58 15 117 1 159 15 121 1 166] 
#[0 6 30 0 27 0 52 0 58 0 65] 
#[1 6 34 0 27 6 34 0 52 15 125 0 58 15 129 2 4 15 133 2 8] 
#[1 0 10 0 23 0 10 0 60 0 49 0 76 0 10 0 157 15 137 1 155 15 141 2 21 0 85 2 54 0 89 2 55 0 93 2 56] 
#[1 6 38 0 27 6 38 0 52 15 145 0 58 15 149 2 16 15 153 2 24] 
#[0 6 42 0 27 0 52 0 58 0 65] 
#[0 6 46 0 52] 
#[1 0 49 0 76 6 50 0 155 0 10 0 157 15 157 1 155 15 161 2 40 15 165 2 41 15 169 2 44 0 85 2 54 0 89 2 55 0 93 2 56] 
#[1 2 182 0 2 2 182 0 11 2 182 0 21 2 182 0 39 2 182 0 40 2 182 0 41 2 182 0 42 2 182 0 44 2 182 0 45 2 182 0 46 2 182 0 47 2 182 0 48 2 182 0 50 2 182 0 51 2 182 0 53 10 205 0 55 2 182 0 67 2 182 0 68 2 182 0 69 2 182 0 70 2 182 0 71 2 182 0 73 2 182 0 74 2 182 0 76 2 182 0 80 2 182 0 82 2 182 0 86 2 182 0 88 2 182 0 90 2 182 0 91 2 182 0 93 2 182 0 94 2 182 0 95 2 182 0 96 2 182 0 97 2 182 0 100 2 182 0 103 2 182 0 106 2 182 0 109 2 182 0 110 2 182 0 111 2 182 0 121 2 182 0 130 2 182 0 155 2 182 0 157 15 173 0 254 2 182 2 97] 
#[0 15 177 0 65] 
#[1 0 134 0 49 5 197 0 59 0 134 0 62 0 134 0 65 0 134 0 75 0 134 0 76 0 134 0 155 15 181 0 188 5 205 0 214] 
#[0 15 185 0 157] 
#[0 6 54 0 62 0 155] 
#[0 6 58 0 57] 
#[0 6 62 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 4 98 0 57] 
#[0 6 66 0 62 0 155] 
#[0 6 70 0 62 0 155] 
#[0 6 74 0 62 0 155] 
#[0 6 70 0 62 0 155] 
#[0 6 78 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 6 82 0 62 0 155] 
#[0 6 86 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 6 90 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 6 94 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 6 98 0 62 0 155] 
#[1 6 102 0 2 6 102 0 3 6 102 0 4 6 102 0 6 6 102 0 7 6 102 0 8 6 102 0 9 6 102 0 10 6 102 0 11 6 102 0 12 6 102 0 15 6 102 0 19 6 102 0 20 6 102 0 21 6 102 0 22 6 102 0 25 6 102 0 26 6 102 0 27 6 102 0 28 6 102 0 30 6 102 0 31 6 102 0 32 6 102 0 33 6 102 0 34 6 102 0 35 6 102 0 36 6 102 0 37 6 102 0 38 6 102 0 39 6 102 0 40 6 102 0 41 6 102 0 42 6 102 0 44 6 102 0 45 6 102 0 46 6 102 0 47 6 102 0 48 6 102 0 49 6 102 0 51 6 102 0 52 6 102 0 53 6 102 0 55 6 102 0 57 6 102 0 58 6 102 0 59 6 102 0 62 6 102 0 64 6 102 0 65 6 102 0 66 6 102 0 67 6 102 0 68 6 102 0 69 6 102 0 70 6 102 0 71 6 102 0 72 6 102 0 73 6 102 0 74 6 102 0 75 0 211 0 76 6 102 0 77 6 102 0 80 6 102 0 82 6 102 0 86 6 102 0 88 6 102 0 89 6 102 0 90 6 102 0 91 6 102 0 93 6 102 0 94 6 102 0 95 6 102 0 96 6 102 0 97 6 102 0 99 6 102 0 100 6 102 0 103 6 102 0 106 6 102 0 109 6 102 0 110 6 102 0 111 6 102 0 116 6 102 0 117 6 102 0 118 6 102 0 119 6 102 0 120 6 102 0 121 6 102 0 123 6 102 0 124 6 102 0 126 6 102 0 127 6 102 0 128 6 102 0 129 6 102 0 130 6 102 0 131 6 102 0 132 6 102 0 133 6 102 0 134 6 102 0 153 6 102 0 154 6 102 0 155 6 102 0 157 6 102 0 163 6 102 0 164 6 102 0 167 6 102 0 168 9 125 0 210 6 102 2 97] 
#[1 6 106 0 2 6 106 0 3 6 106 0 4 6 106 0 6 6 106 0 7 6 106 0 8 6 106 0 9 6 106 0 10 6 106 0 11 6 106 0 12 6 106 0 15 6 106 0 19 6 106 0 20 6 106 0 21 6 106 0 22 6 106 0 25 6 106 0 26 6 106 0 27 6 106 0 28 6 106 0 30 6 106 0 31 6 106 0 32 6 106 0 33 6 106 0 34 6 106 0 35 6 106 0 36 6 106 0 37 6 106 0 38 6 106 0 39 6 106 0 40 6 106 0 41 6 106 0 42 6 106 0 44 6 106 0 45 6 106 0 46 6 106 0 47 6 106 0 48 6 106 0 49 6 106 0 51 8 109 0 52 6 106 0 53 6 106 0 55 6 106 0 57 6 106 0 58 6 106 0 59 6 106 0 62 6 106 0 64 6 106 0 65 6 106 0 66 6 106 0 67 6 106 0 68 6 106 0 69 6 106 0 70 6 106 0 71 6 106 0 72 6 106 0 73 6 106 0 74 6 106 0 75 6 106 0 76 6 106 0 77 6 106 0 80 6 106 0 82 6 106 0 86 6 106 0 88 6 106 0 89 6 106 0 90 6 106 0 91 6 106 0 93 6 106 0 94 6 106 0 95 6 106 0 96 6 106 0 97 6 106 0 99 6 106 0 100 6 106 0 103 6 106 0 106 6 106 0 109 6 106 0 110 6 106 0 111 6 106 0 116 6 106 0 117 6 106 0 118 6 106 0 119 6 106 0 120 6 106 0 121 6 106 0 123 6 106 0 124 6 106 0 126 6 106 0 127 6 106 0 128 6 106 0 129 6 106 0 130 6 106 0 131 6 106 0 132 6 106 0 133 6 106 0 134 6 106 0 153 6 106 0 154 6 106 0 155 6 106 0 157 6 106 0 163 6 106 0 164 6 106 0 167 6 106 0 168 15 189 1 22 15 193 1 23 6 106 2 97] 
#[0 6 110 0 49 0 64] 
#[0 6 114 0 49 0 64] 
#[0 6 118 0 62 0 153] 
#[1 13 113 0 62 4 134 0 153 13 117 1 33 13 121 1 34] 
#[0 6 122 0 49 0 64] 
#[0 6 126 0 49 0 64] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 15 197 0 216 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 15 201 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 13 233 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[0 6 130 0 62 0 64] 
#[0 6 134 0 62 0 64] 
#[0 6 138 0 62 0 64] 
#[0 6 142 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 139 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 0 129 0 13 0 133 0 14 0 137 0 16 0 141 0 17 0 145 0 18 0 149 0 19 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 0 201 0 52 3 45 0 53 0 209 0 54 0 213 0 55 0 217 0 63 0 221 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 5 0 100 1 9 0 103 1 13 0 104 1 21 0 125 1 29 0 135 1 33 0 136 1 37 0 140 1 41 0 141 1 45 0 143 1 49 0 144 1 53 0 146 1 57 0 147 1 61 0 148 1 65 0 149 1 69 0 150 1 73 0 151 1 77 0 152 4 141 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 1 201 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 1 225 0 231 1 229 0 232 1 233 0 233 1 237 0 234 1 241 0 235 1 245 0 236 1 249 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 2 61 1 37 2 65 1 38 2 69 1 39 2 73 1 40 2 77 1 41 2 81 1 42 2 85 1 45 2 89 1 94 15 205 1 98 2 105 1 99 2 109 1 100 2 113 1 101 2 117 1 102 2 121 1 103 2 125 1 104 2 129 1 105 2 133 1 106 2 137 1 107 2 141 1 108 2 145 1 109 2 161 1 121 2 165 1 122 2 169 1 123 2 173 1 130 2 177 1 131 2 181 1 132 2 185 1 133 2 189 1 141 2 193 1 142 2 197 1 143 2 201 1 144 2 205 1 145 2 209 2 70 2 213 2 72 2 221 2 77 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 2 253 2 85] 
#[0 6 146 0 64] 
#[0 15 209 0 64] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 15 213 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[0 6 150 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 138 0 139 0 140 0 141 0 142 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[0 15 217 0 58] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 15 221 0 255 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 9 53 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[0 15 225 0 155] 
#[1 15 13 0 17 15 17 0 145 6 154 0 155 15 229 1 127 15 33 1 129 15 37 2 99] 
#[0 6 158 0 17 0 145 0 155] 
#[0 6 162 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 0 129 0 13 0 133 0 14 0 137 0 16 15 233 0 17 0 145 0 18 0 149 0 19 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 0 169 0 39 0 173 0 40 0 177 0 41 0 181 0 42 0 185 0 44 0 189 0 45 0 193 0 46 0 197 0 48 0 201 0 52 0 205 0 53 0 209 0 54 0 213 0 55 0 217 0 63 0 221 0 65 0 225 0 67 0 229 0 68 0 233 0 69 0 237 0 70 0 241 0 71 0 245 0 73 0 249 0 74 0 253 0 87 1 1 0 92 1 5 0 100 1 9 0 103 1 13 0 104 1 17 0 122 1 21 0 125 1 25 0 130 1 29 0 135 1 33 0 136 1 37 0 140 1 41 0 141 1 45 0 143 1 49 0 144 15 17 0 145 1 53 0 146 1 57 0 147 1 61 0 148 1 65 0 149 1 69 0 150 1 73 0 151 1 77 0 152 1 81 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 1 113 0 178 1 117 0 180 1 121 0 189 1 125 0 190 1 129 0 192 1 133 0 193 1 137 0 194 1 141 0 195 1 145 0 196 1 149 0 197 1 153 0 198 1 157 0 199 1 161 0 200 1 165 0 201 1 169 0 202 1 173 0 203 1 177 0 204 1 181 0 205 1 185 0 206 1 189 0 207 1 193 0 223 1 197 0 224 1 201 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 1 225 0 231 1 229 0 232 1 233 0 233 1 237 0 234 1 241 0 235 1 245 0 236 1 249 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 2 57 1 30 2 61 1 37 2 65 1 38 2 69 1 39 2 73 1 40 2 77 1 41 2 81 1 42 2 85 1 45 2 89 1 94 2 93 1 96 2 97 1 97 2 101 1 98 2 105 1 99 2 109 1 100 2 113 1 101 2 117 1 102 2 121 1 103 2 125 1 104 2 129 1 105 2 133 1 106 2 137 1 107 2 141 1 108 2 145 1 109 15 237 1 111 2 149 1 112 2 153 1 113 2 157 1 114 2 161 1 121 2 165 1 122 2 169 1 123 15 241 1 129 2 173 1 130 2 177 1 131 2 181 1 132 2 185 1 133 2 189 1 141 2 193 1 142 2 197 1 143 2 201 1 144 2 205 1 145 2 209 2 70 2 213 2 72 5 81 2 74 2 221 2 77 2 225 2 78 2 229 2 79 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 2 253 2 85] 
#[0 15 245 0 55] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 6 166 0 64 0 221 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 4 141 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 1 201 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 1 225 0 231 1 229 0 232 1 233 0 233 1 237 0 234 1 241 0 235 1 245 0 236 1 249 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 2 61 1 37 2 65 1 38 2 69 1 39 2 73 1 40 2 77 1 41 2 81 1 42 2 85 1 45 2 89 1 94 9 81 1 121 15 249 1 136 15 253 1 138 16 1 1 140 2 209 2 70 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84] 
#[0 16 5 0 64] 
#[0 6 170 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 6 174 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 16 9 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[0 16 13 0 25] 
#[0 6 178 0 2 0 11 0 20 0 21 0 22 0 25 0 26 0 27 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 55 0 58 0 62 0 64 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 6 182 0 2 0 11 0 20 0 21 0 22 0 25 0 26 0 27 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 55 0 58 0 62 0 64 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 126 0 127 0 128 0 129 0 130 0 133 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 6 186 0 11 0 21 0 47 0 50 0 76 0 88 0 90 0 91 0 94 0 95 0 97 0 100 0 106 0 109 0 110 0 111 0 121 2 97] 
#[0 6 190 0 11 0 21 0 47 0 50 0 55 0 76 0 88 0 90 0 91 0 94 0 95 0 97 0 100 0 106 0 109 0 110 0 111 0 121 0 155 2 97] 
#[0 6 194 0 62 0 64] 
#[1 14 81 0 62 16 17 0 64] 
#[0 6 198 0 62 0 64] 
#[0 14 69 0 57] 
#[0 6 202 0 62 0 64] 
#[1 16 21 0 157 16 25 0 194] 
#[1 16 29 0 62 16 33 0 153] 
#[1 4 221 0 73 4 225 0 74 7 105 0 157 1 113 0 178 16 37 0 180 4 237 0 189 16 41 0 203 16 45 0 204 16 49 1 167] 
#[1 16 53 0 27 6 206 0 52 16 57 1 160 16 61 1 168 16 65 1 169] 
#[0 6 210 0 27 0 52] 
#[1 7 105 0 157 1 113 0 178 16 69 0 180 4 237 0 189 16 45 0 204 16 73 1 167] 
#[1 16 53 0 27 6 206 0 52 16 77 1 160 16 61 1 168 16 65 1 169] 
#[0 6 214 0 27 0 52] 
#[1 16 81 0 23 16 85 0 60 6 218 0 157 16 89 2 22 16 93 2 23] 
#[1 16 97 0 62 16 101 0 153] 
#[1 7 105 0 157 1 113 0 178 16 69 0 180 4 237 0 189 16 45 0 204 16 105 1 167] 
#[1 16 53 0 27 6 206 0 52 16 109 1 160 16 61 1 168 16 65 1 169] 
#[0 6 222 0 27 0 52] 
#[0 16 113 0 157] 
#[0 16 117 0 155] 
#[1 16 121 0 62 6 226 0 155] 
#[0 6 230 0 62 0 155] 
#[0 6 234 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 50 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157 2 97] 
#[1 0 10 0 39 0 10 0 40 0 10 0 41 0 10 0 42 0 10 0 44 0 10 0 45 0 10 0 46 0 10 0 48 0 10 0 53 0 10 0 60 0 10 0 61 0 10 0 63 6 238 0 64 0 10 0 67 0 10 0 68 0 10 0 69 0 10 0 70 0 10 0 71 0 10 0 73 0 10 0 74 0 49 0 76 0 10 0 79 0 10 0 157 16 125 1 155 16 129 1 204 16 133 1 207 16 137 1 208 16 141 1 209 16 145 1 210 0 85 2 54 0 89 2 55 0 93 2 56] 
#[1 5 226 0 49 6 242 0 62 5 226 0 65 5 226 0 75 5 226 0 76 6 242 0 155] 
#[1 0 134 0 49 5 197 0 59 0 134 0 62 0 134 0 65 0 134 0 75 0 134 0 76 0 134 0 155 16 149 0 188 5 205 0 214] 
#[0 6 246 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 6 250 0 2 0 3 0 4 0 6 0 7 0 8 0 9 0 10 0 11 0 12 0 15 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 51 0 53 0 55 0 57 0 58 0 59 0 62 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 80 0 82 0 86 0 88 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 99 0 100 0 103 0 106 0 109 0 110 0 111 0 116 0 117 0 118 0 119 0 120 0 121 0 123 0 124 0 126 0 127 0 128 0 129 0 130 0 131 0 132 0 133 0 134 0 153 0 154 0 155 0 157 0 163 0 164 0 167 0 168 2 97] 
#[0 6 254 0 62 0 64] 
#[1 0 215 0 3 0 215 0 4 0 215 0 6 0 215 0 7 0 215 0 8 0 215 0 9 0 215 0 10 0 215 0 15 0 215 0 19 0 215 0 28 0 215 0 30 0 215 0 31 0 215 0 32 0 215 0 33 0 215 0 35 0 215 0 36 0 215 0 37 0 215 0 38 0 219 0 57 0 215 0 59 0 215 0 62 0 215 0 64 0 215 0 75 0 223 0 116 0 227 0 117 0 231 0 118 0 235 0 119 0 239 0 120 0 243 0 123 0 247 0 124 0 251 0 131 0 255 0 132 1 3 0 134 0 215 0 153 0 215 0 154 6 65 1 93] 
#[0 7 2 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 139 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[0 7 6 0 52 0 137] 
#[0 16 153 0 64] 
#[0 7 10 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170] 
#[0 16 157 0 58] 
#[0 7 14 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 139 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[0 7 18 0 17 0 145 0 155] 
#[1 15 217 0 58 5 29 0 65] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 0 129 0 13 0 133 0 14 0 137 0 16 1 7 0 17 0 145 0 18 0 149 0 19 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 0 169 0 39 0 173 0 40 0 177 0 41 0 181 0 42 0 185 0 44 0 189 0 45 0 193 0 46 0 197 0 48 0 201 0 52 0 205 0 53 0 209 0 54 0 213 0 55 0 217 0 63 0 221 0 65 0 225 0 67 0 229 0 68 0 233 0 69 0 237 0 70 0 241 0 71 0 245 0 73 0 249 0 74 0 253 0 87 1 1 0 92 1 5 0 100 1 9 0 103 1 13 0 104 1 17 0 122 1 21 0 125 1 25 0 130 1 29 0 135 1 33 0 136 1 37 0 140 1 41 0 141 1 45 0 143 1 49 0 144 7 22 0 145 1 53 0 146 1 57 0 147 1 61 0 148 1 65 0 149 1 69 0 150 1 73 0 151 1 77 0 152 7 22 0 155 1 81 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 1 113 0 178 1 117 0 180 1 121 0 189 1 125 0 190 1 129 0 192 1 133 0 193 1 137 0 194 1 141 0 195 1 145 0 196 1 149 0 197 1 153 0 198 1 157 0 199 1 161 0 200 1 165 0 201 1 169 0 202 1 173 0 203 1 177 0 204 1 181 0 205 1 185 0 206 1 189 0 207 1 193 0 223 1 197 0 224 1 201 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 1 225 0 231 1 229 0 232 1 233 0 233 1 237 0 234 1 241 0 235 1 245 0 236 1 249 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 2 57 1 30 2 61 1 37 2 65 1 38 2 69 1 39 2 73 1 40 2 77 1 41 2 81 1 42 2 85 1 45 2 89 1 94 2 93 1 96 2 97 1 97 2 101 1 98 2 105 1 99 2 109 1 100 2 113 1 101 2 117 1 102 2 121 1 103 2 125 1 104 2 129 1 105 2 133 1 106 2 137 1 107 2 141 1 108 2 145 1 109 2 149 1 112 2 153 1 113 2 157 1 114 2 161 1 121 2 165 1 122 2 169 1 123 2 173 1 130 2 177 1 131 2 181 1 132 2 185 1 133 2 189 1 141 2 193 1 142 2 197 1 143 2 201 1 144 2 205 1 145 2 209 2 70 2 213 2 72 8 205 2 74 2 221 2 77 2 225 2 78 2 229 2 79 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 2 253 2 85] 
#[0 7 26 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170] 
#[0 7 30 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 139 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[0 16 161 0 64] 
#[1 11 253 0 62 7 34 0 64] 
#[0 7 38 0 64] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 0 129 0 13 0 133 0 14 0 137 0 16 0 141 0 17 0 145 0 18 0 149 0 19 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 0 201 0 52 3 45 0 53 0 209 0 54 0 213 0 55 0 217 0 63 0 221 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 5 0 100 1 9 0 103 1 13 0 104 1 21 0 125 1 29 0 135 1 33 0 136 1 37 0 140 1 41 0 141 1 45 0 143 1 49 0 144 1 53 0 146 1 57 0 147 1 61 0 148 1 65 0 149 1 69 0 150 1 73 0 151 1 77 0 152 4 141 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 1 201 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 1 225 0 231 1 229 0 232 1 233 0 233 1 237 0 234 1 241 0 235 1 245 0 236 1 249 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 2 61 1 37 2 65 1 38 2 69 1 39 2 73 1 40 2 77 1 41 2 81 1 42 2 85 1 45 2 89 1 94 16 165 1 98 2 105 1 99 2 109 1 100 2 113 1 101 2 117 1 102 2 121 1 103 2 125 1 104 2 129 1 105 2 133 1 106 2 137 1 107 2 141 1 108 2 145 1 109 2 161 1 121 2 165 1 122 2 169 1 123 2 173 1 130 2 177 1 131 2 181 1 132 2 185 1 133 2 189 1 141 2 193 1 142 2 197 1 143 2 201 1 144 2 205 1 145 2 209 2 70 2 213 2 72 2 221 2 77 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 2 253 2 85] 
#[0 16 169 0 66] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 16 173 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[0 7 42 0 62 0 66] 
#[0 0 138 0 58 0 62 0 153] 
#[0 7 46 0 62 0 153] 
#[1 0 49 0 76 0 10 0 157 16 177 1 155 0 85 2 54 0 89 2 55 0 93 2 56] 
#[0 7 50 0 27 0 52 0 58 0 65] 
#[0 1 11 0 24 0 27 0 52 0 55 0 62] 
#[1 7 54 0 27 7 54 0 52 16 181 0 62] 
#[0 7 58 0 27 0 52 0 62] 
#[1 7 62 0 27 7 62 0 52 16 185 0 62] 
#[1 16 21 0 157 16 189 0 194] 
#[1 16 193 0 52 16 197 1 161] 
#[1 7 66 0 24 16 53 0 27 7 66 0 52 7 66 0 55 16 201 1 169] 
#[0 7 70 0 24 0 27 0 52 0 55] 
#[0 0 158 0 24 0 27 0 49 0 52 0 55 0 62] 
#[1 7 74 0 27 7 74 0 52 16 185 0 62] 
#[1 16 205 0 52 16 209 2 5] 
#[0 7 78 0 157] 
#[0 7 78 0 157] 
#[1 16 21 0 157 16 213 0 194] 
#[0 7 82 0 157] 
#[1 0 10 0 23 0 10 0 60 0 49 0 76 0 10 0 157 16 217 1 155 0 85 2 54 0 89 2 55 0 93 2 56] 
#[0 7 86 0 27 0 52 0 58 0 65] 
#[1 7 90 0 27 7 90 0 52 16 185 0 62] 
#[1 16 221 0 52 16 225 2 17] 
#[1 16 229 0 57 7 94 0 62 7 94 0 155] 
#[0 7 98 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 50 0 51 0 53 0 55 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157 2 97] 
#[1 0 49 0 76 16 233 0 155 0 10 0 157 15 157 1 155 16 237 2 44 0 85 2 54 0 89 2 55 0 93 2 56] 
#[1 7 102 0 39 7 102 0 40 7 102 0 41 7 102 0 42 7 102 0 44 7 102 0 45 7 102 0 46 7 102 0 48 7 102 0 53 16 241 0 60 16 245 0 61 16 249 0 63 7 102 0 67 7 102 0 68 7 102 0 69 7 102 0 70 7 102 0 71 7 102 0 73 7 102 0 74 16 253 0 79 7 102 0 157 17 1 1 211 17 5 1 214] 
#[0 17 9 0 64] 
#[0 7 106 0 64] 
#[1 17 13 0 62 7 110 0 64 7 110 0 66] 
#[0 7 114 0 64 0 66] 
#[0 7 118 0 62 0 64 0 66] 
#[1 6 170 0 49 7 122 0 62 6 170 0 65 6 170 0 75 6 170 0 76 7 122 0 155] 
#[0 7 126 0 52] 
#[0 7 130 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 0 129 0 13 0 133 0 14 0 137 0 16 0 141 0 17 0 145 0 18 0 149 0 19 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 0 201 0 52 3 45 0 53 0 209 0 54 0 213 0 55 0 217 0 63 0 221 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 5 0 100 1 9 0 103 1 13 0 104 1 21 0 125 1 29 0 135 1 33 0 136 1 37 0 140 1 41 0 141 1 45 0 143 1 49 0 144 1 53 0 146 1 57 0 147 1 61 0 148 1 65 0 149 1 69 0 150 1 73 0 151 1 77 0 152 4 141 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 1 201 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 1 225 0 231 1 229 0 232 1 233 0 233 1 237 0 234 1 241 0 235 1 245 0 236 1 249 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 2 61 1 37 2 65 1 38 2 69 1 39 2 73 1 40 2 77 1 41 2 81 1 42 2 85 1 45 2 89 1 94 17 17 1 98 2 105 1 99 2 109 1 100 2 113 1 101 2 117 1 102 2 121 1 103 2 125 1 104 2 129 1 105 2 133 1 106 2 137 1 107 2 141 1 108 2 145 1 109 2 161 1 121 2 165 1 122 2 169 1 123 2 173 1 130 2 177 1 131 2 181 1 132 2 185 1 133 2 189 1 141 2 193 1 142 2 197 1 143 2 201 1 144 2 205 1 145 2 209 2 70 2 213 2 72 2 221 2 77 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 2 253 2 85] 
#[0 7 134 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 139 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[0 7 138 0 55 0 62 0 64] 
#[0 17 21 0 72] 
#[1 16 21 0 157 17 25 0 194] 
#[1 7 105 0 157 1 113 0 178 16 69 0 180 4 237 0 189 16 45 0 204 17 29 1 167] 
#[1 7 105 0 157 1 113 0 178 16 69 0 180 4 237 0 189 17 33 0 204] 
#[0 17 37 0 58] 
#[1 0 10 0 2 0 10 0 11 0 10 0 21 0 10 0 39 0 10 0 40 0 10 0 41 0 10 0 42 0 10 0 44 0 10 0 45 0 10 0 46 0 10 0 47 0 10 0 48 0 10 0 51 0 10 0 53 0 10 0 67 0 10 0 68 0 10 0 69 0 10 0 70 0 10 0 71 0 10 0 73 0 10 0 74 0 49 0 76 0 10 0 80 0 10 0 82 0 10 0 86 0 10 0 88 0 10 0 90 0 10 0 91 0 10 0 93 0 10 0 94 0 10 0 95 0 10 0 96 0 10 0 97 0 10 0 100 0 10 0 106 0 10 0 109 0 10 0 110 0 10 0 111 0 10 0 121 0 10 0 130 7 142 0 155 0 10 0 157 17 41 0 182 0 57 0 183 0 61 0 184 0 65 0 185 0 69 0 186 0 73 0 187 17 45 1 155 17 49 1 175 17 53 1 176 17 57 1 177 17 61 1 178 17 65 1 179 17 69 1 180 17 73 1 181 17 77 1 182 17 81 1 183 17 85 1 184 17 89 1 185 17 93 1 186 17 97 1 187 17 101 1 199 0 85 2 54 0 89 2 55 0 93 2 56] 
#[1 2 182 0 2 2 182 0 11 2 182 0 21 2 182 0 39 2 182 0 40 2 182 0 41 2 182 0 42 2 182 0 44 2 182 0 45 2 182 0 46 2 182 0 47 2 182 0 48 2 182 0 50 2 182 0 51 2 182 0 53 10 205 0 55 2 182 0 67 2 182 0 68 2 182 0 69 2 182 0 70 2 182 0 71 2 182 0 73 2 182 0 74 2 182 0 76 2 182 0 80 2 182 0 82 2 182 0 86 2 182 0 88 2 182 0 90 2 182 0 91 2 182 0 93 2 182 0 94 2 182 0 95 2 182 0 96 2 182 0 97 2 182 0 100 2 182 0 103 2 182 0 106 2 182 0 109 2 182 0 110 2 182 0 111 2 182 0 121 2 182 0 130 2 182 0 155 2 182 0 157 17 105 0 254 2 182 2 97] 
#[0 7 146 0 24 0 27 0 52 0 55] 
#[1 0 10 0 11 0 10 0 21 0 10 0 39 0 10 0 40 0 10 0 41 0 10 0 42 0 10 0 44 0 10 0 45 0 10 0 46 0 10 0 47 0 10 0 48 0 10 0 51 0 10 0 53 0 10 0 67 0 10 0 68 0 10 0 69 0 10 0 70 0 10 0 71 0 10 0 73 0 10 0 74 0 49 0 76 0 10 0 80 0 10 0 82 0 10 0 86 0 10 0 88 0 10 0 90 0 10 0 91 0 10 0 93 0 10 0 94 0 10 0 95 0 10 0 96 0 10 0 97 0 10 0 100 0 10 0 103 0 10 0 106 0 10 0 109 0 10 0 110 0 10 0 111 0 10 0 121 0 10 0 130 7 150 0 155 0 10 0 157 17 109 0 182 0 57 0 183 0 61 0 184 0 65 0 185 0 69 0 186 0 73 0 187 17 113 1 155 17 117 1 178 17 121 1 179 17 125 1 180 17 129 1 181 17 133 1 182 17 137 1 183 17 141 1 184 17 145 1 185 17 149 1 187 17 101 1 199 17 153 2 9 17 157 2 10 17 161 2 11 0 85 2 54 0 89 2 55 0 93 2 56 17 165 2 89] 
#[1 2 182 0 2 2 182 0 11 2 182 0 21 2 182 0 39 2 182 0 40 2 182 0 41 2 182 0 42 2 182 0 44 2 182 0 45 2 182 0 46 2 182 0 47 2 182 0 48 2 182 0 50 2 182 0 51 2 182 0 53 10 205 0 55 2 182 0 67 2 182 0 68 2 182 0 69 2 182 0 70 2 182 0 71 2 182 0 73 2 182 0 74 2 182 0 76 2 182 0 80 2 182 0 82 2 182 0 86 2 182 0 88 2 182 0 90 2 182 0 91 2 182 0 93 2 182 0 94 2 182 0 95 2 182 0 96 2 182 0 97 2 182 0 100 2 182 0 103 2 182 0 106 2 182 0 109 2 182 0 110 2 182 0 111 2 182 0 121 2 182 0 130 2 182 0 155 2 182 0 157 17 169 0 254 2 182 2 97] 
#[0 7 154 0 62 0 153] 
#[1 16 81 0 23 16 85 0 60 6 218 0 157 17 173 2 22 16 93 2 23] 
#[1 0 10 0 11 0 10 0 39 0 10 0 40 0 10 0 41 0 10 0 42 0 10 0 44 0 10 0 45 0 10 0 46 0 10 0 48 0 10 0 53 0 10 0 67 0 10 0 68 0 10 0 69 0 10 0 70 0 10 0 71 0 10 0 73 0 10 0 74 0 49 0 76 0 10 0 80 7 158 0 155 0 10 0 157 17 177 1 155 17 181 2 25 17 185 2 26 17 189 2 27 17 193 2 28 17 197 2 29 17 201 2 30 17 205 2 31 0 85 2 54 0 89 2 55 0 93 2 56] 
#[1 2 182 0 2 2 182 0 11 2 182 0 21 2 182 0 39 2 182 0 40 2 182 0 41 2 182 0 42 2 182 0 44 2 182 0 45 2 182 0 46 2 182 0 47 2 182 0 48 2 182 0 50 2 182 0 51 2 182 0 53 10 205 0 55 2 182 0 67 2 182 0 68 2 182 0 69 2 182 0 70 2 182 0 71 2 182 0 73 2 182 0 74 2 182 0 76 2 182 0 80 2 182 0 82 2 182 0 86 2 182 0 88 2 182 0 90 2 182 0 91 2 182 0 93 2 182 0 94 2 182 0 95 2 182 0 96 2 182 0 97 2 182 0 100 2 182 0 103 2 182 0 106 2 182 0 109 2 182 0 110 2 182 0 111 2 182 0 121 2 182 0 130 2 182 0 155 2 182 0 157 17 209 0 254 2 182 2 97] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 17 213 0 255 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 9 53 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[0 7 162 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 50 0 51 0 53 0 55 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157 2 97] 
#[0 7 166 0 62 0 155] 
#[0 7 170 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 157] 
#[0 7 170 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 157] 
#[0 7 170 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 157] 
#[1 4 165 0 39 4 169 0 40 4 173 0 41 4 177 0 42 4 181 0 44 4 185 0 45 4 189 0 46 4 193 0 48 4 201 0 53 0 225 0 67 4 205 0 68 4 209 0 69 4 213 0 70 4 217 0 71 4 221 0 73 4 225 0 74 4 233 0 157 1 113 0 178 1 117 0 180 4 237 0 189 8 229 0 190 1 129 0 192 1 133 0 193 1 137 0 194 1 141 0 195 1 145 0 196 1 149 0 197 1 153 0 198 1 157 0 199 1 161 0 200 1 165 0 201 1 169 0 202 1 173 0 203 1 177 0 204 17 217 0 205 1 185 0 206 1 189 0 207 2 57 1 30 2 225 2 78 2 229 2 79] 
#[1 4 165 0 39 4 169 0 40 4 173 0 41 4 177 0 42 4 181 0 44 4 185 0 45 4 189 0 46 4 193 0 48 4 201 0 53 0 225 0 67 4 205 0 68 4 209 0 69 4 213 0 70 4 217 0 71 4 221 0 73 4 225 0 74 4 233 0 157 1 113 0 178 1 117 0 180 4 237 0 189 17 221 0 190 1 129 0 192 1 133 0 193 1 137 0 194 1 141 0 195 1 145 0 196 1 149 0 197 1 153 0 198 1 157 0 199 1 161 0 200 1 165 0 201 1 169 0 202 1 173 0 203 1 177 0 204 1 181 0 205 1 185 0 206 1 189 0 207 2 57 1 30 2 225 2 78 2 229 2 79] 
#[0 7 174 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 157] 
#[1 16 53 0 27 6 206 0 55 17 225 1 160 16 61 1 168 16 65 1 169] 
#[1 0 10 0 39 0 10 0 40 0 10 0 41 0 10 0 42 0 10 0 44 0 10 0 45 0 10 0 46 0 10 0 48 0 10 0 53 0 10 0 60 0 10 0 61 0 10 0 63 0 10 0 67 0 10 0 68 0 10 0 69 0 10 0 70 0 10 0 71 0 10 0 73 0 10 0 74 0 49 0 76 0 10 0 79 0 10 0 157 16 125 1 155 17 229 1 209 17 233 1 210 0 85 2 54 0 89 2 55 0 93 2 56] 
#[0 7 178 0 1 0 2 0 4 0 5 0 9 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 19 0 21 0 29 0 32 0 34 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 52 0 53 0 54 0 55 0 63 0 65 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 87 0 92 0 100 0 103 0 104 0 122 0 125 0 130 0 135 0 136 0 139 0 140 0 141 0 143 0 144 0 145 0 146 0 147 0 148 0 149 0 150 0 151 0 152 0 155 0 157 0 158 0 159 0 160 0 161 0 162 0 165 0 166 0 169 0 170 2 97] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 17 237 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[0 7 182 0 62 0 153] 
#[1 7 186 0 27 7 186 0 52 16 185 0 62] 
#[0 7 190 0 27 0 52 0 62] 
#[1 17 241 0 11 4 221 0 73 4 225 0 74 17 245 0 94 17 249 0 121 4 233 0 157 1 113 0 178 16 37 0 180 4 237 0 189 17 253 0 194 18 1 0 203 18 5 0 204 18 9 1 170 18 13 1 171 18 17 1 172 18 21 1 173 18 25 1 174] 
#[0 7 194 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[1 1 15 0 2 18 29 0 11 0 46 0 21 1 19 0 39 1 19 0 40 1 19 0 41 1 19 0 42 1 19 0 44 1 19 0 45 1 19 0 46 1 23 0 47 1 19 0 48 1 27 0 51 1 19 0 53 1 19 0 67 1 19 0 68 1 19 0 69 1 19 0 70 1 19 0 71 1 19 0 73 1 19 0 74 7 222 0 80 18 41 0 82 18 45 0 86 18 49 0 88 18 53 0 90 18 57 0 91 18 61 0 93 0 50 0 94 18 65 0 95 18 69 0 96 1 31 0 97 1 35 0 100 18 77 0 106 0 62 0 109 0 54 0 110 18 81 0 111 0 58 0 121 7 226 0 130 1 39 0 157 4 77 1 156 4 81 1 162 4 85 1 163 18 85 1 188 18 89 1 190 18 93 1 191 18 97 1 193 18 101 1 195 18 105 1 196 18 109 1 201 18 113 1 205 18 117 1 206 18 121 1 215 18 125 1 217 18 129 1 218 18 133 1 229 18 137 1 231 18 141 1 232 18 145 1 235 18 149 1 238 18 153 1 239 18 157 1 240 18 161 1 243 18 165 1 249 18 169 1 252 18 173 1 253 18 177 2 0 18 181 2 2 4 89 2 3 4 93 2 6 4 97 2 7 4 101 2 14 4 105 2 18 4 109 2 19 4 113 2 36 4 117 2 42 4 121 2 43 4 125 2 45 4 129 2 46 4 133 2 47 18 185 2 76] 
#[0 18 189 0 155] 
#[1 0 10 0 2 0 10 0 11 0 10 0 21 0 10 0 39 0 10 0 40 0 10 0 41 0 10 0 42 0 10 0 44 0 10 0 45 0 10 0 46 0 10 0 47 0 10 0 48 0 10 0 51 0 10 0 53 0 10 0 67 0 10 0 68 0 10 0 69 0 10 0 70 0 10 0 71 0 10 0 73 0 10 0 74 0 49 0 76 0 10 0 80 0 10 0 82 0 10 0 86 0 10 0 88 0 10 0 90 0 10 0 91 0 10 0 93 0 10 0 94 0 10 0 95 0 10 0 96 0 10 0 97 0 10 0 100 0 10 0 106 0 10 0 109 0 10 0 110 0 10 0 111 0 10 0 121 0 10 0 130 7 234 0 155 0 10 0 157 17 41 0 182 0 57 0 183 0 61 0 184 0 65 0 185 0 69 0 186 0 73 0 187 17 45 1 155 18 193 1 177 17 61 1 178 17 65 1 179 17 69 1 180 17 73 1 181 17 77 1 182 17 81 1 183 17 85 1 184 17 89 1 185 17 93 1 186 17 97 1 187 17 101 1 199 0 85 2 54 0 89 2 55 0 93 2 56] 
#[0 7 238 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[0 7 194 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[0 7 194 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[0 7 194 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[0 7 194 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[0 7 194 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[0 7 194 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[0 7 194 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[0 7 194 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[0 7 194 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[0 7 194 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[1 18 197 0 24 0 201 0 52 18 201 0 55 18 205 1 200 18 209 2 72] 
#[0 7 242 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 50 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157 2 97] 
#[0 7 246 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[1 18 213 0 11 0 46 0 21 1 19 0 39 1 19 0 40 1 19 0 41 1 19 0 42 1 19 0 44 1 19 0 45 1 19 0 46 1 23 0 47 1 19 0 48 1 27 0 51 1 19 0 53 1 19 0 67 1 19 0 68 1 19 0 69 1 19 0 70 1 19 0 71 1 19 0 73 1 19 0 74 7 222 0 80 18 41 0 82 18 45 0 86 18 217 0 88 18 53 0 90 18 221 0 91 18 61 0 93 0 50 0 94 18 65 0 95 18 69 0 96 1 31 0 97 1 43 0 100 7 250 0 103 18 229 0 106 0 62 0 109 0 54 0 110 18 233 0 111 0 58 0 121 7 226 0 130 1 39 0 157 4 77 1 156 4 81 1 162 4 85 1 163 18 85 1 188 18 89 1 190 18 93 1 191 18 97 1 193 18 101 1 195 18 105 1 196 18 109 1 201 18 113 1 205 18 117 1 206 18 121 1 215 18 125 1 217 18 129 1 218 18 133 1 229 18 137 1 231 18 141 1 232 18 145 1 235 18 149 1 238 18 153 1 239 18 157 1 240 18 161 1 243 18 165 1 249 18 169 1 252 18 173 1 253 18 177 2 0 18 237 2 2 4 89 2 3 4 93 2 6 4 97 2 7 4 101 2 14 4 105 2 18 4 109 2 19 4 113 2 36 4 117 2 42 4 121 2 43 4 125 2 45 4 129 2 46 4 133 2 47 18 241 2 76 18 245 2 90 18 249 2 93 18 253 2 94] 
#[0 7 246 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[0 7 246 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[0 7 246 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[0 7 246 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[0 7 246 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[0 7 246 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[0 7 246 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[0 7 246 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[0 7 246 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[0 19 1 0 155] 
#[1 0 10 0 11 0 10 0 21 0 10 0 39 0 10 0 40 0 10 0 41 0 10 0 42 0 10 0 44 0 10 0 45 0 10 0 46 0 10 0 47 0 10 0 48 0 10 0 51 0 10 0 53 0 10 0 67 0 10 0 68 0 10 0 69 0 10 0 70 0 10 0 71 0 10 0 73 0 10 0 74 0 49 0 76 0 10 0 80 0 10 0 82 0 10 0 86 0 10 0 88 0 10 0 90 0 10 0 91 0 10 0 93 0 10 0 94 0 10 0 95 0 10 0 96 0 10 0 97 0 10 0 100 0 10 0 103 0 10 0 106 0 10 0 109 0 10 0 110 0 10 0 111 0 10 0 121 0 10 0 130 7 254 0 155 0 10 0 157 17 109 0 182 0 57 0 183 0 61 0 184 0 65 0 185 0 69 0 186 0 73 0 187 17 113 1 155 17 117 1 178 17 121 1 179 17 125 1 180 17 129 1 181 17 133 1 182 17 137 1 183 17 141 1 184 17 145 1 185 17 149 1 187 17 101 1 199 19 5 2 11 0 85 2 54 0 89 2 55 0 93 2 56 17 165 2 89] 
#[0 8 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[0 7 246 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[0 8 6 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 50 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157 2 97] 
#[1 16 21 0 157 19 9 0 194] 
#[1 19 13 0 11 8 10 0 39 8 10 0 40 8 10 0 41 8 10 0 42 8 10 0 44 8 10 0 45 8 10 0 46 8 10 0 48 8 10 0 53 8 10 0 67 8 10 0 68 8 10 0 69 8 10 0 70 8 10 0 71 8 10 0 73 8 10 0 74 8 10 0 80 8 10 0 157 19 17 2 32] 
#[0 19 21 0 155] 
#[1 0 10 0 11 0 10 0 39 0 10 0 40 0 10 0 41 0 10 0 42 0 10 0 44 0 10 0 45 0 10 0 46 0 10 0 48 0 10 0 53 0 10 0 67 0 10 0 68 0 10 0 69 0 10 0 70 0 10 0 71 0 10 0 73 0 10 0 74 0 49 0 76 0 10 0 80 8 14 0 155 0 10 0 157 17 177 1 155 19 25 2 27 17 193 2 28 17 197 2 29 17 201 2 30 17 205 2 31 0 85 2 54 0 89 2 55 0 93 2 56] 
#[0 8 18 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 155 0 157] 
#[0 8 22 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 155 0 157] 
#[0 8 22 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 155 0 157] 
#[0 8 22 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 155 0 157] 
#[0 8 22 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 155 0 157] 
#[0 8 26 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 50 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157 2 97] 
#[0 8 30 0 62 0 155] 
#[1 0 210 0 4 0 210 0 75 0 210 0 76 19 29 0 157] 
#[1 0 186 0 4 0 190 0 75 0 194 0 76 19 33 0 157] 
#[0 19 37 0 55] 
#[0 8 34 0 64 0 66] 
#[0 8 38 0 62 0 64 0 66] 
#[1 8 42 0 20 8 42 0 22 8 42 0 26 8 42 0 27 19 41 0 77 8 42 0 89 8 42 0 128 8 42 0 129] 
#[0 19 45 0 65] 
#[0 8 46 0 24 0 27 0 52 0 55 0 62] 
#[0 8 50 0 24 0 27 0 52 0 55 0 62] 
#[0 8 54 0 24 0 27 0 52 0 55 0 62] 
#[0 8 58 0 24 0 27 0 52 0 55 0 62] 
#[0 8 62 0 24 0 27 0 52 0 55 0 62] 
#[0 8 66 0 24 0 27 0 52 0 55] 
#[1 8 70 0 24 8 70 0 27 8 70 0 52 8 70 0 55 19 49 0 62] 
#[1 8 74 0 24 8 74 0 27 8 74 0 52 8 74 0 55 19 53 0 62] 
#[0 8 70 0 24 0 27 0 52 0 55] 
#[0 8 54 0 24 0 27 0 52 0 55 0 62] 
#[1 1 47 0 11 1 130 0 21 1 51 0 39 1 51 0 40 1 51 0 41 1 51 0 42 1 51 0 44 1 51 0 45 1 51 0 46 1 55 0 47 1 51 0 48 1 59 0 51 1 51 0 53 1 51 0 67 1 51 0 68 1 51 0 69 1 51 0 70 1 51 0 71 1 51 0 73 1 51 0 74 8 94 0 80 1 59 0 82 1 59 0 86 1 47 0 88 1 63 0 90 1 47 0 91 8 86 0 93 1 134 0 94 1 63 0 95 8 86 0 96 1 67 0 97 1 71 0 100 1 47 0 106 1 126 0 109 1 138 0 110 1 47 0 111 1 142 0 121 8 90 0 130 1 51 0 157] 
#[1 1 55 0 11 1 75 0 39 1 75 0 40 1 75 0 41 1 75 0 42 1 75 0 44 1 75 0 45 1 75 0 46 1 79 0 47 1 75 0 48 1 83 0 51 1 75 0 53 1 75 0 67 1 75 0 68 1 75 0 69 1 75 0 70 1 75 0 71 1 75 0 73 1 75 0 74 8 94 0 80 1 87 0 82 1 87 0 86 1 55 0 88 1 91 0 90 1 55 0 91 8 86 0 93 1 91 0 95 8 86 0 96 1 95 0 97 1 99 0 100 1 55 0 106 8 102 0 107 8 102 0 108 1 79 0 111 1 142 0 121 1 103 0 157 19 65 2 2 19 69 2 76] 
#[1 8 106 0 2 1 59 0 11 1 107 0 39 1 107 0 40 1 107 0 41 1 107 0 42 1 107 0 44 1 107 0 45 1 107 0 46 1 111 0 47 1 107 0 48 1 115 0 51 1 107 0 53 1 107 0 67 1 107 0 68 1 107 0 69 1 107 0 70 1 107 0 71 1 107 0 73 1 107 0 74 8 94 0 80 1 59 0 82 1 59 0 86 1 119 0 88 1 59 0 90 1 119 0 91 1 59 0 95 8 98 0 97 1 123 0 100 1 119 0 106 8 102 0 107 8 102 0 108 1 115 0 111 1 127 0 157] 
#[1 1 59 0 11 1 131 0 39 1 131 0 40 1 131 0 41 1 131 0 42 1 131 0 44 1 131 0 45 1 131 0 46 1 87 0 47 1 131 0 48 1 59 0 51 1 131 0 53 1 131 0 67 1 131 0 68 1 131 0 69 1 131 0 70 1 131 0 71 1 131 0 73 1 131 0 74 8 94 0 80 1 59 0 82 1 59 0 86 1 59 0 88 1 59 0 90 1 59 0 91 1 59 0 95 8 98 0 97 1 59 0 100 1 59 0 106 1 59 0 111 1 131 0 157] 
#[1 1 59 0 11 1 131 0 39 1 131 0 40 1 131 0 41 1 131 0 42 1 131 0 44 1 131 0 45 1 131 0 46 1 87 0 47 1 131 0 48 1 59 0 51 1 131 0 53 1 131 0 67 1 131 0 68 1 131 0 69 1 131 0 70 1 131 0 71 1 131 0 73 1 131 0 74 8 94 0 80 1 59 0 82 1 59 0 86 1 59 0 88 1 59 0 90 1 59 0 91 1 59 0 95 8 98 0 97 1 59 0 100 1 59 0 106 1 59 0 111 1 131 0 157] 
#[1 1 47 0 11 1 130 0 21 1 51 0 39 1 51 0 40 1 51 0 41 1 51 0 42 1 51 0 44 1 51 0 45 1 51 0 46 1 55 0 47 1 51 0 48 1 119 0 51 1 51 0 53 1 51 0 67 1 51 0 68 1 51 0 69 1 51 0 70 1 51 0 71 1 51 0 73 1 51 0 74 8 94 0 80 1 59 0 82 1 59 0 86 1 135 0 88 1 63 0 90 1 135 0 91 8 86 0 93 1 134 0 94 1 63 0 95 8 86 0 96 1 67 0 97 1 139 0 100 1 135 0 106 1 126 0 109 1 138 0 110 1 135 0 111 1 142 0 121 8 90 0 130 1 143 0 157] 
#[1 1 63 0 11 1 131 0 39 1 131 0 40 1 131 0 41 1 131 0 42 1 131 0 44 1 131 0 45 1 131 0 46 1 91 0 47 1 131 0 48 1 59 0 51 1 131 0 53 1 131 0 67 1 131 0 68 1 131 0 69 1 131 0 70 1 131 0 71 1 131 0 73 1 131 0 74 8 94 0 80 1 59 0 82 1 59 0 86 1 63 0 88 1 63 0 90 1 63 0 91 1 63 0 95 1 95 0 97 1 63 0 100 1 63 0 106 1 63 0 111 1 142 0 121 1 131 0 157] 
#[1 1 47 0 11 1 130 0 21 1 51 0 39 1 51 0 40 1 51 0 41 1 51 0 42 1 51 0 44 1 51 0 45 1 51 0 46 1 55 0 47 1 51 0 48 1 119 0 51 1 51 0 53 1 51 0 67 1 51 0 68 1 51 0 69 1 51 0 70 1 51 0 71 1 51 0 73 1 51 0 74 8 94 0 80 1 59 0 82 1 59 0 86 1 135 0 88 1 63 0 90 1 135 0 91 8 86 0 93 1 134 0 94 1 63 0 95 8 86 0 96 1 67 0 97 1 139 0 100 1 135 0 106 1 126 0 109 1 138 0 110 1 135 0 111 1 142 0 121 8 90 0 130 1 143 0 157] 
#[0 8 86 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 88 0 91 0 93 0 96 0 100 0 106 0 111 0 157] 
#[1 1 63 0 11 1 131 0 39 1 131 0 40 1 131 0 41 1 131 0 42 1 131 0 44 1 131 0 45 1 131 0 46 1 91 0 47 1 131 0 48 1 59 0 51 1 131 0 53 1 131 0 67 1 131 0 68 1 131 0 69 1 131 0 70 1 131 0 71 1 131 0 73 1 131 0 74 8 94 0 80 1 59 0 82 1 59 0 86 1 63 0 88 1 63 0 90 1 63 0 91 1 63 0 95 1 95 0 97 1 63 0 100 1 63 0 106 1 63 0 111 1 142 0 121 1 131 0 157] 
#[0 8 86 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 88 0 91 0 93 0 96 0 100 0 106 0 111 0 157] 
#[1 8 114 0 2 1 71 0 11 1 130 0 21 1 147 0 39 1 147 0 40 1 147 0 41 1 147 0 42 1 147 0 44 1 147 0 45 1 147 0 46 1 151 0 47 1 147 0 48 1 155 0 51 1 147 0 53 1 147 0 67 1 147 0 68 1 147 0 69 1 147 0 70 1 147 0 71 1 147 0 73 1 147 0 74 8 94 0 80 1 59 0 82 1 59 0 86 1 139 0 88 1 63 0 90 1 139 0 91 8 86 0 93 1 134 0 94 1 63 0 95 8 86 0 96 1 67 0 97 1 159 0 100 1 139 0 106 8 102 0 107 8 102 0 108 1 138 0 110 1 159 0 111 1 142 0 121 1 163 0 157] 
#[1 1 47 0 11 1 130 0 21 1 51 0 39 1 51 0 40 1 51 0 41 1 51 0 42 1 51 0 44 1 51 0 45 1 51 0 46 1 55 0 47 1 51 0 48 1 119 0 51 1 51 0 53 1 51 0 67 1 51 0 68 1 51 0 69 1 51 0 70 1 51 0 71 1 51 0 73 1 51 0 74 8 94 0 80 1 59 0 82 1 59 0 86 1 135 0 88 1 63 0 90 1 135 0 91 8 86 0 93 1 134 0 94 1 63 0 95 8 86 0 96 1 67 0 97 1 139 0 100 1 135 0 106 1 126 0 109 1 138 0 110 1 135 0 111 1 142 0 121 8 90 0 130 1 143 0 157] 
#[1 1 47 0 11 1 130 0 21 1 147 0 39 1 147 0 40 1 147 0 41 1 147 0 42 1 147 0 44 1 147 0 45 1 147 0 46 1 79 0 47 1 147 0 48 1 115 0 51 1 147 0 53 1 147 0 67 1 147 0 68 1 147 0 69 1 147 0 70 1 147 0 71 1 147 0 73 1 147 0 74 8 94 0 80 1 59 0 82 1 59 0 86 1 135 0 88 1 63 0 90 1 135 0 91 8 86 0 93 1 134 0 94 1 63 0 95 8 86 0 96 1 67 0 97 1 159 0 100 1 135 0 106 8 102 0 107 8 102 0 108 1 126 0 109 1 138 0 110 1 167 0 111 1 142 0 121 8 90 0 130 1 163 0 157] 
#[0 19 73 0 130] 
#[1 19 77 0 11 19 81 0 88 19 85 0 91 19 89 0 106 19 93 0 111 8 118 0 130 19 97 1 191] 
#[0 8 122 0 11 0 88 0 91 0 106 0 111 0 130] 
#[1 4 165 0 39 4 169 0 40 4 173 0 41 4 177 0 42 4 181 0 44 4 185 0 45 4 189 0 46 4 193 0 48 4 201 0 53 0 225 0 67 4 205 0 68 4 209 0 69 4 213 0 70 4 217 0 71 4 221 0 73 4 225 0 74 4 233 0 157 1 113 0 178 1 117 0 180 4 237 0 189 19 101 0 190 1 129 0 192 1 133 0 193 1 137 0 194 1 141 0 195 1 145 0 196 1 149 0 197 1 153 0 198 1 157 0 199 1 161 0 200 1 165 0 201 1 169 0 202 1 173 0 203 1 177 0 204 1 181 0 205 1 185 0 206 1 189 0 207 2 57 1 30 2 225 2 78 2 229 2 79] 
#[1 19 105 0 11 8 126 0 39 8 126 0 40 8 126 0 41 8 126 0 42 8 126 0 44 8 126 0 45 8 126 0 46 19 109 0 47 8 126 0 48 8 126 0 53 8 126 0 67 8 126 0 68 8 126 0 69 8 126 0 70 8 126 0 71 8 126 0 73 8 126 0 74 19 113 0 88 19 117 0 91 18 61 0 93 18 69 0 96 19 121 0 100 19 125 0 106 19 129 0 111 8 126 0 157 19 133 1 196] 
#[0 8 130 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 88 0 91 0 93 0 96 0 100 0 106 0 111 0 157] 
#[1 1 146 0 39 1 146 0 40 1 146 0 41 1 146 0 42 1 146 0 44 1 146 0 45 1 146 0 46 1 146 0 48 1 146 0 53 1 146 0 67 1 146 0 68 1 146 0 69 1 146 0 70 1 146 0 71 1 146 0 73 1 146 0 74 7 129 0 97 1 146 0 157 19 137 1 157] 
#[1 19 141 0 11 8 134 0 39 8 134 0 40 8 134 0 41 8 134 0 42 8 134 0 44 8 134 0 45 8 134 0 46 19 145 0 47 8 134 0 48 19 149 0 51 8 134 0 53 8 134 0 67 8 134 0 68 8 134 0 69 8 134 0 70 8 134 0 71 8 134 0 73 8 134 0 74 19 153 0 82 19 157 0 86 19 161 0 88 19 165 0 90 19 169 0 91 19 173 0 95 8 134 0 97 19 177 0 100 19 181 0 106 19 185 0 111 8 134 0 157 19 189 1 206] 
#[0 8 138 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 82 0 86 0 88 0 90 0 91 0 95 0 97 0 100 0 106 0 111 0 157] 
#[1 4 165 0 39 4 169 0 40 4 173 0 41 4 177 0 42 4 181 0 44 4 185 0 45 4 189 0 46 4 193 0 48 4 201 0 53 0 225 0 67 4 205 0 68 4 209 0 69 4 213 0 70 4 217 0 71 4 221 0 73 4 225 0 74 4 233 0 157 1 113 0 178 1 117 0 180 4 237 0 189 19 193 0 190 1 129 0 192 1 133 0 193 1 137 0 194 1 141 0 195 1 145 0 196 1 149 0 197 1 153 0 198 1 157 0 199 1 161 0 200 1 165 0 201 1 169 0 202 1 173 0 203 1 177 0 204 1 181 0 205 1 185 0 206 1 189 0 207 2 57 1 30 2 225 2 78 2 229 2 79] 
#[1 19 197 0 11 8 142 0 39 8 142 0 40 8 142 0 41 8 142 0 42 8 142 0 44 8 142 0 45 8 142 0 46 19 201 0 47 8 142 0 48 19 205 0 51 8 142 0 53 8 142 0 67 8 142 0 68 8 142 0 69 8 142 0 70 8 142 0 71 8 142 0 73 8 142 0 74 19 209 0 82 19 213 0 86 19 217 0 88 19 221 0 90 19 225 0 91 19 229 0 95 19 233 0 100 19 237 0 106 19 241 0 111 8 142 0 157 19 245 1 218] 
#[0 8 146 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 82 0 86 0 88 0 90 0 91 0 95 0 100 0 106 0 111 0 157] 
#[0 19 249 0 80] 
#[1 19 253 0 11 20 1 0 47 20 5 0 51 8 150 0 80 20 9 0 82 20 13 0 86 20 17 0 88 20 21 0 90 20 25 0 91 20 29 0 95 20 33 0 100 20 37 0 106 20 41 0 111 20 45 1 232] 
#[0 8 154 0 11 0 47 0 51 0 80 0 82 0 86 0 88 0 90 0 91 0 95 0 100 0 106 0 111] 
#[1 4 165 0 39 4 169 0 40 4 173 0 41 4 177 0 42 4 181 0 44 4 185 0 45 4 189 0 46 4 193 0 48 4 201 0 53 0 225 0 67 4 205 0 68 4 209 0 69 4 213 0 70 4 217 0 71 4 221 0 73 4 225 0 74 4 233 0 157 1 113 0 178 1 117 0 180 4 237 0 189 20 49 0 190 1 129 0 192 1 133 0 193 1 137 0 194 1 141 0 195 1 145 0 196 1 149 0 197 1 153 0 198 1 157 0 199 1 161 0 200 1 165 0 201 1 169 0 202 1 173 0 203 1 177 0 204 1 181 0 205 1 185 0 206 1 189 0 207 2 57 1 30 20 53 1 236 2 225 2 78 2 229 2 79] 
#[1 20 57 0 11 8 158 0 39 8 158 0 40 8 158 0 41 8 158 0 42 8 158 0 44 8 158 0 45 8 158 0 46 8 158 0 48 20 61 0 51 8 158 0 53 8 158 0 67 8 158 0 68 8 158 0 69 8 158 0 70 8 158 0 71 8 158 0 73 8 158 0 74 20 65 0 82 20 69 0 86 20 73 0 88 20 77 0 90 20 81 0 91 20 85 0 95 20 89 0 100 20 93 0 106 20 97 0 111 8 158 0 157 20 101 1 239] 
#[0 8 162 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 82 0 86 0 88 0 90 0 91 0 95 0 100 0 106 0 111 0 157] 
#[1 4 165 0 39 4 169 0 40 4 173 0 41 4 177 0 42 4 181 0 44 4 185 0 45 4 189 0 46 20 105 0 47 4 193 0 48 20 109 0 51 4 201 0 53 0 225 0 67 4 205 0 68 4 209 0 69 4 213 0 70 4 217 0 71 4 221 0 73 4 225 0 74 20 113 0 100 20 117 0 107 20 121 0 108 20 125 0 111 4 233 0 157 1 113 0 178 1 117 0 180 4 237 0 189 20 129 0 190 1 129 0 192 1 133 0 193 1 137 0 194 1 141 0 195 1 145 0 196 1 149 0 197 1 153 0 198 1 157 0 199 1 161 0 200 1 165 0 201 1 169 0 202 1 173 0 203 1 177 0 204 1 181 0 205 1 185 0 206 1 189 0 207 2 57 1 30 20 133 1 241 20 137 1 243 20 141 1 244 20 145 1 245 20 149 1 246 2 225 2 78 2 229 2 79] 
#[0 8 166 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 100 0 107 0 108 0 111 0 157] 
#[1 20 153 0 157 20 157 1 250] 
#[1 20 161 0 51 20 165 0 88 20 169 0 91 20 173 0 100 20 177 0 106 20 181 0 111 8 170 0 157 20 185 1 253] 
#[0 8 174 0 51 0 88 0 91 0 100 0 106 0 111 0 157] 
#[0 20 189 0 157] 
#[1 7 202 0 2 1 171 0 47 19 61 0 100 20 197 2 76] 
#[1 7 198 0 2 1 175 0 47 19 57 0 51 20 205 2 2] 
#[0 8 178 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 50 0 51 0 53 0 55 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157 2 97] 
#[0 8 182 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 20 209 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[0 8 186 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[0 8 190 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[0 8 194 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[1 1 179 0 11 1 130 0 21 1 51 0 39 1 51 0 40 1 51 0 41 1 51 0 42 1 51 0 44 1 51 0 45 1 51 0 46 1 55 0 47 1 51 0 48 1 59 0 51 1 51 0 53 1 51 0 67 1 51 0 68 1 51 0 69 1 51 0 70 1 51 0 71 1 51 0 73 1 51 0 74 8 94 0 80 1 59 0 82 1 59 0 86 1 179 0 88 1 63 0 90 1 179 0 91 8 86 0 93 1 134 0 94 1 63 0 95 8 86 0 96 1 67 0 97 1 183 0 100 8 198 0 103 1 179 0 106 1 126 0 109 1 138 0 110 1 179 0 111 1 142 0 121 8 90 0 130 1 51 0 157] 
#[1 1 179 0 11 1 130 0 21 1 51 0 39 1 51 0 40 1 51 0 41 1 51 0 42 1 51 0 44 1 51 0 45 1 51 0 46 1 55 0 47 1 51 0 48 1 119 0 51 1 51 0 53 1 51 0 67 1 51 0 68 1 51 0 69 1 51 0 70 1 51 0 71 1 51 0 73 1 51 0 74 8 94 0 80 1 59 0 82 1 59 0 86 1 187 0 88 1 63 0 90 1 187 0 91 8 86 0 93 1 134 0 94 1 63 0 95 8 86 0 96 1 67 0 97 1 191 0 100 8 198 0 103 1 187 0 106 1 126 0 109 1 138 0 110 1 187 0 111 1 142 0 121 8 90 0 130 1 143 0 157] 
#[1 1 179 0 11 1 130 0 21 1 51 0 39 1 51 0 40 1 51 0 41 1 51 0 42 1 51 0 44 1 51 0 45 1 51 0 46 1 55 0 47 1 51 0 48 1 119 0 51 1 51 0 53 1 51 0 67 1 51 0 68 1 51 0 69 1 51 0 70 1 51 0 71 1 51 0 73 1 51 0 74 8 94 0 80 1 59 0 82 1 59 0 86 1 187 0 88 1 63 0 90 1 187 0 91 8 86 0 93 1 134 0 94 1 63 0 95 8 86 0 96 1 67 0 97 1 191 0 100 8 198 0 103 1 187 0 106 1 126 0 109 1 138 0 110 1 187 0 111 1 142 0 121 8 90 0 130 1 143 0 157] 
#[1 1 183 0 11 1 130 0 21 1 147 0 39 1 147 0 40 1 147 0 41 1 147 0 42 1 147 0 44 1 147 0 45 1 147 0 46 1 151 0 47 1 147 0 48 1 155 0 51 1 147 0 53 1 147 0 67 1 147 0 68 1 147 0 69 1 147 0 70 1 147 0 71 1 147 0 73 1 147 0 74 8 94 0 80 1 59 0 82 1 59 0 86 1 191 0 88 1 63 0 90 1 191 0 91 8 86 0 93 1 134 0 94 1 63 0 95 8 86 0 96 1 67 0 97 1 195 0 100 8 198 0 103 1 191 0 106 8 102 0 107 8 102 0 108 1 138 0 110 1 195 0 111 1 142 0 121 1 163 0 157] 
#[1 1 179 0 11 1 130 0 21 1 51 0 39 1 51 0 40 1 51 0 41 1 51 0 42 1 51 0 44 1 51 0 45 1 51 0 46 1 55 0 47 1 51 0 48 1 119 0 51 1 51 0 53 1 51 0 67 1 51 0 68 1 51 0 69 1 51 0 70 1 51 0 71 1 51 0 73 1 51 0 74 8 94 0 80 1 59 0 82 1 59 0 86 1 187 0 88 1 63 0 90 1 187 0 91 8 86 0 93 1 134 0 94 1 63 0 95 8 86 0 96 1 67 0 97 1 191 0 100 8 198 0 103 1 187 0 106 1 126 0 109 1 138 0 110 1 187 0 111 1 142 0 121 8 90 0 130 1 143 0 157] 
#[1 1 179 0 11 1 130 0 21 1 147 0 39 1 147 0 40 1 147 0 41 1 147 0 42 1 147 0 44 1 147 0 45 1 147 0 46 1 79 0 47 1 147 0 48 1 115 0 51 1 147 0 53 1 147 0 67 1 147 0 68 1 147 0 69 1 147 0 70 1 147 0 71 1 147 0 73 1 147 0 74 8 94 0 80 1 59 0 82 1 59 0 86 1 187 0 88 1 63 0 90 1 187 0 91 8 86 0 93 1 134 0 94 1 63 0 95 8 86 0 96 1 67 0 97 1 195 0 100 8 198 0 103 1 187 0 106 8 102 0 107 8 102 0 108 1 126 0 109 1 138 0 110 1 199 0 111 1 142 0 121 8 90 0 130 1 163 0 157] 
#[1 1 171 0 47 19 61 0 100 20 213 2 76] 
#[1 1 175 0 47 19 57 0 51 20 217 2 2] 
#[0 20 221 0 103] 
#[1 20 225 0 11 20 229 0 88 20 233 0 91 20 237 0 100 8 202 0 103 20 241 0 106 20 245 0 111 20 249 2 94] 
#[0 8 206 0 11 0 88 0 91 0 100 0 103 0 106 0 111] 
#[0 8 210 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 50 0 51 0 53 0 55 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157 2 97] 
#[0 8 214 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[0 8 218 0 62 0 153] 
#[0 8 222 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 80 0 157] 
#[1 4 165 0 39 4 169 0 40 4 173 0 41 4 177 0 42 4 181 0 44 4 185 0 45 4 189 0 46 4 193 0 48 4 201 0 53 0 225 0 67 4 205 0 68 4 209 0 69 4 213 0 70 4 217 0 71 4 221 0 73 4 225 0 74 20 253 0 80 4 233 0 157 1 113 0 178 1 117 0 180 4 237 0 189 21 1 0 190 1 129 0 192 1 133 0 193 1 137 0 194 1 141 0 195 1 145 0 196 1 149 0 197 1 153 0 198 1 157 0 199 1 161 0 200 1 165 0 201 1 169 0 202 1 173 0 203 1 177 0 204 1 181 0 205 1 185 0 206 1 189 0 207 10 253 1 30 21 5 1 202 2 225 2 78 2 229 2 79] 
#[0 8 226 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 50 0 51 0 53 0 55 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157 2 97] 
#[0 8 230 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 155 0 157] 
#[0 8 234 0 64 0 66] 
#[1 21 9 0 57 8 238 0 62 8 238 0 64 8 238 0 66 21 13 1 212 21 17 1 213] 
#[0 8 242 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 50 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157 2 97] 
#[0 21 21 0 157] 
#[0 21 25 0 64] 
#[1 17 241 0 11 4 233 0 157 1 113 0 178 16 69 0 180 4 237 0 189 17 253 0 194 18 5 0 204 21 29 1 172 21 33 1 173 18 25 1 174] 
#[1 17 241 0 11 4 233 0 157 1 113 0 178 16 69 0 180 4 237 0 189 21 37 0 194 18 5 0 204 21 41 1 173 21 45 1 174] 
#[0 8 106 0 2 0 47 0 100 0 157] 
#[0 8 114 0 2 0 47 0 51 0 157] 
#[1 19 61 0 100 1 203 0 157 21 49 2 76] 
#[1 19 57 0 51 7 198 0 157 21 53 2 2] 
#[1 4 165 0 39 4 169 0 40 4 173 0 41 4 177 0 42 4 181 0 44 4 185 0 45 4 189 0 46 4 193 0 48 4 201 0 53 0 225 0 67 4 205 0 68 4 209 0 69 4 213 0 70 4 217 0 71 4 221 0 73 4 225 0 74 4 233 0 157 1 113 0 178 1 117 0 180 4 237 0 189 21 57 0 190 1 129 0 192 1 133 0 193 1 137 0 194 1 141 0 195 1 145 0 196 1 149 0 197 1 153 0 198 1 157 0 199 1 161 0 200 1 165 0 201 1 169 0 202 1 173 0 203 1 177 0 204 1 181 0 205 1 185 0 206 1 189 0 207 2 57 1 30 2 225 2 78 2 229 2 79] 
#[0 8 90 0 11 0 88 0 91 0 106 0 111 0 130] 
#[0 8 90 0 11 0 88 0 91 0 106 0 111 0 130] 
#[0 8 90 0 11 0 88 0 91 0 106 0 111 0 130] 
#[0 8 90 0 11 0 88 0 91 0 106 0 111 0 130] 
#[0 8 90 0 11 0 88 0 91 0 106 0 111 0 130] 
#[0 8 250 0 11 0 88 0 91 0 106 0 111 0 130] 
#[1 0 186 0 4 0 190 0 75 0 194 0 76 21 61 0 157 21 65 1 194 21 69 1 197] 
#[0 8 86 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 88 0 91 0 93 0 96 0 100 0 106 0 111 0 157] 
#[0 8 86 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 88 0 91 0 93 0 96 0 100 0 106 0 111 0 157] 
#[0 8 86 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 88 0 91 0 93 0 96 0 100 0 106 0 111 0 157] 
#[0 8 86 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 88 0 91 0 93 0 96 0 100 0 106 0 111 0 157] 
#[0 8 86 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 88 0 91 0 93 0 96 0 100 0 106 0 111 0 157] 
#[0 8 86 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 88 0 91 0 93 0 96 0 100 0 106 0 111 0 157] 
#[0 8 86 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 88 0 91 0 93 0 96 0 100 0 106 0 111 0 157] 
#[0 8 254 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 88 0 91 0 93 0 96 0 100 0 106 0 111 0 157] 
#[1 4 165 0 39 4 169 0 40 4 173 0 41 4 177 0 42 4 181 0 44 4 185 0 45 4 189 0 46 4 193 0 48 4 201 0 53 0 225 0 67 4 205 0 68 4 209 0 69 4 213 0 70 4 217 0 71 4 221 0 73 4 225 0 74 4 233 0 157 1 113 0 178 1 117 0 180 4 237 0 189 10 249 0 190 1 129 0 192 1 133 0 193 1 137 0 194 1 141 0 195 1 145 0 196 1 149 0 197 1 153 0 198 1 157 0 199 1 161 0 200 1 165 0 201 1 169 0 202 1 173 0 203 1 177 0 204 1 181 0 205 1 185 0 206 1 189 0 207 10 253 1 30 21 73 1 202 2 225 2 78 2 229 2 79] 
#[0 8 98 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 82 0 86 0 88 0 90 0 91 0 95 0 97 0 100 0 106 0 111 0 157] 
#[0 8 98 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 82 0 86 0 88 0 90 0 91 0 95 0 97 0 100 0 106 0 111 0 157] 
#[0 8 98 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 82 0 86 0 88 0 90 0 91 0 95 0 97 0 100 0 106 0 111 0 157] 
#[0 8 98 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 82 0 86 0 88 0 90 0 91 0 95 0 97 0 100 0 106 0 111 0 157] 
#[0 8 98 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 82 0 86 0 88 0 90 0 91 0 95 0 97 0 100 0 106 0 111 0 157] 
#[0 8 98 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 82 0 86 0 88 0 90 0 91 0 95 0 97 0 100 0 106 0 111 0 157] 
#[0 8 98 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 82 0 86 0 88 0 90 0 91 0 95 0 97 0 100 0 106 0 111 0 157] 
#[0 8 98 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 82 0 86 0 88 0 90 0 91 0 95 0 97 0 100 0 106 0 111 0 157] 
#[0 8 98 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 82 0 86 0 88 0 90 0 91 0 95 0 97 0 100 0 106 0 111 0 157] 
#[0 8 98 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 82 0 86 0 88 0 90 0 91 0 95 0 97 0 100 0 106 0 111 0 157] 
#[0 8 98 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 82 0 86 0 88 0 90 0 91 0 95 0 97 0 100 0 106 0 111 0 157] 
#[0 8 98 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 82 0 86 0 88 0 90 0 91 0 95 0 97 0 100 0 106 0 111 0 157] 
#[0 9 2 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 82 0 86 0 88 0 90 0 91 0 95 0 97 0 100 0 106 0 111 0 157] 
#[1 0 186 0 4 0 190 0 75 0 194 0 76 21 77 0 157 1 113 0 178 16 69 0 180 4 237 0 189 21 81 0 204 21 85 1 203] 
#[0 8 78 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 82 0 86 0 88 0 90 0 91 0 95 0 100 0 106 0 111 0 157] 
#[0 8 78 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 82 0 86 0 88 0 90 0 91 0 95 0 100 0 106 0 111 0 157] 
#[0 8 78 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 82 0 86 0 88 0 90 0 91 0 95 0 100 0 106 0 111 0 157] 
#[0 8 78 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 82 0 86 0 88 0 90 0 91 0 95 0 100 0 106 0 111 0 157] 
#[0 8 78 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 82 0 86 0 88 0 90 0 91 0 95 0 100 0 106 0 111 0 157] 
#[0 8 78 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 82 0 86 0 88 0 90 0 91 0 95 0 100 0 106 0 111 0 157] 
#[0 8 78 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 82 0 86 0 88 0 90 0 91 0 95 0 100 0 106 0 111 0 157] 
#[0 8 78 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 82 0 86 0 88 0 90 0 91 0 95 0 100 0 106 0 111 0 157] 
#[0 8 78 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 82 0 86 0 88 0 90 0 91 0 95 0 100 0 106 0 111 0 157] 
#[0 8 78 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 82 0 86 0 88 0 90 0 91 0 95 0 100 0 106 0 111 0 157] 
#[0 8 78 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 82 0 86 0 88 0 90 0 91 0 95 0 100 0 106 0 111 0 157] 
#[0 8 78 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 82 0 86 0 88 0 90 0 91 0 95 0 100 0 106 0 111 0 157] 
#[0 9 6 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 82 0 86 0 88 0 90 0 91 0 95 0 100 0 106 0 111 0 157] 
#[1 4 165 0 39 4 169 0 40 4 173 0 41 4 177 0 42 4 181 0 44 4 185 0 45 4 189 0 46 4 193 0 48 4 201 0 53 0 225 0 67 4 205 0 68 4 209 0 69 4 213 0 70 4 217 0 71 4 221 0 73 4 225 0 74 4 233 0 157 1 113 0 178 1 117 0 180 4 237 0 189 21 89 0 190 1 129 0 192 1 133 0 193 1 137 0 194 1 141 0 195 1 145 0 196 1 149 0 197 1 153 0 198 1 157 0 199 1 161 0 200 1 165 0 201 1 169 0 202 1 173 0 203 1 177 0 204 1 181 0 205 1 185 0 206 1 189 0 207 2 57 1 30 2 225 2 78 2 229 2 79] 
#[0 8 94 0 11 0 47 0 51 0 80 0 82 0 86 0 88 0 90 0 91 0 95 0 100 0 106 0 111] 
#[0 8 94 0 11 0 47 0 51 0 80 0 82 0 86 0 88 0 90 0 91 0 95 0 100 0 106 0 111] 
#[0 8 94 0 11 0 47 0 51 0 80 0 82 0 86 0 88 0 90 0 91 0 95 0 100 0 106 0 111] 
#[0 8 94 0 11 0 47 0 51 0 80 0 82 0 86 0 88 0 90 0 91 0 95 0 100 0 106 0 111] 
#[0 8 94 0 11 0 47 0 51 0 80 0 82 0 86 0 88 0 90 0 91 0 95 0 100 0 106 0 111] 
#[0 8 94 0 11 0 47 0 51 0 80 0 82 0 86 0 88 0 90 0 91 0 95 0 100 0 106 0 111] 
#[0 8 94 0 11 0 47 0 51 0 80 0 82 0 86 0 88 0 90 0 91 0 95 0 100 0 106 0 111] 
#[0 8 94 0 11 0 47 0 51 0 80 0 82 0 86 0 88 0 90 0 91 0 95 0 100 0 106 0 111] 
#[0 8 94 0 11 0 47 0 51 0 80 0 82 0 86 0 88 0 90 0 91 0 95 0 100 0 106 0 111] 
#[0 8 94 0 11 0 47 0 51 0 80 0 82 0 86 0 88 0 90 0 91 0 95 0 100 0 106 0 111] 
#[0 8 94 0 11 0 47 0 51 0 80 0 82 0 86 0 88 0 90 0 91 0 95 0 100 0 106 0 111] 
#[0 8 94 0 11 0 47 0 51 0 80 0 82 0 86 0 88 0 90 0 91 0 95 0 100 0 106 0 111] 
#[0 9 10 0 11 0 47 0 51 0 80 0 82 0 86 0 88 0 90 0 91 0 95 0 100 0 106 0 111] 
#[1 0 186 0 4 21 93 0 63 0 190 0 75 0 194 0 76 7 105 0 157 1 113 0 178 16 69 0 180 4 237 0 189 21 97 0 204] 
#[1 21 101 0 24 21 105 0 52 21 109 1 237] 
#[0 8 82 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 82 0 86 0 88 0 90 0 91 0 95 0 100 0 106 0 111 0 157] 
#[0 8 82 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 82 0 86 0 88 0 90 0 91 0 95 0 100 0 106 0 111 0 157] 
#[0 8 82 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 82 0 86 0 88 0 90 0 91 0 95 0 100 0 106 0 111 0 157] 
#[0 8 82 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 82 0 86 0 88 0 90 0 91 0 95 0 100 0 106 0 111 0 157] 
#[0 8 82 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 82 0 86 0 88 0 90 0 91 0 95 0 100 0 106 0 111 0 157] 
#[0 8 82 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 82 0 86 0 88 0 90 0 91 0 95 0 100 0 106 0 111 0 157] 
#[0 8 82 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 82 0 86 0 88 0 90 0 91 0 95 0 100 0 106 0 111 0 157] 
#[0 8 82 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 82 0 86 0 88 0 90 0 91 0 95 0 100 0 106 0 111 0 157] 
#[0 8 82 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 82 0 86 0 88 0 90 0 91 0 95 0 100 0 106 0 111 0 157] 
#[0 8 82 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 82 0 86 0 88 0 90 0 91 0 95 0 100 0 106 0 111 0 157] 
#[0 8 82 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 82 0 86 0 88 0 90 0 91 0 95 0 100 0 106 0 111 0 157] 
#[0 9 14 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 82 0 86 0 88 0 90 0 91 0 95 0 100 0 106 0 111 0 157] 
#[0 8 102 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 100 0 107 0 108 0 111 0 157] 
#[0 8 102 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 100 0 107 0 108 0 111 0 157] 
#[0 8 102 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 100 0 107 0 108 0 111 0 157] 
#[0 21 113 0 83] 
#[0 21 117 0 83] 
#[0 8 102 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 100 0 107 0 108 0 111 0 157] 
#[1 0 186 0 4 0 190 0 75 0 194 0 76 21 121 0 83] 
#[1 21 125 0 24 0 201 0 52 21 129 0 55 21 133 1 242 21 137 2 72] 
#[0 9 18 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 100 0 107 0 108 0 111 0 157] 
#[0 9 22 0 24 0 52 0 55] 
#[0 9 26 0 24 0 52 0 55] 
#[0 9 30 0 24 0 52 0 55] 
#[0 21 141 0 65] 
#[1 0 201 0 52 21 145 0 55 21 149 1 251 21 153 2 72] 
#[0 8 110 0 51 0 88 0 91 0 100 0 106 0 111 0 157] 
#[0 8 110 0 51 0 88 0 91 0 100 0 106 0 111 0 157] 
#[0 8 110 0 51 0 88 0 91 0 100 0 106 0 111 0 157] 
#[0 8 110 0 51 0 88 0 91 0 100 0 106 0 111 0 157] 
#[0 8 110 0 51 0 88 0 91 0 100 0 106 0 111 0 157] 
#[0 8 110 0 51 0 88 0 91 0 100 0 106 0 111 0 157] 
#[0 9 34 0 51 0 88 0 91 0 100 0 106 0 111 0 157] 
#[0 21 157 0 65] 
#[1 21 161 0 100 9 38 0 157] 
#[1 21 165 0 2 21 169 0 47] 
#[1 19 57 0 51 7 198 0 157 21 173 2 2] 
#[1 21 177 0 2 21 181 0 47] 
#[0 21 185 0 55] 
#[0 21 169 0 47] 
#[0 21 181 0 47] 
#[1 4 165 0 39 4 169 0 40 4 173 0 41 4 177 0 42 4 181 0 44 4 185 0 45 4 189 0 46 4 193 0 48 4 201 0 53 0 225 0 67 4 205 0 68 4 209 0 69 4 213 0 70 4 217 0 71 4 221 0 73 4 225 0 74 4 233 0 157 1 113 0 178 1 117 0 180 4 237 0 189 21 189 0 190 1 129 0 192 1 133 0 193 1 137 0 194 1 141 0 195 1 145 0 196 1 149 0 197 1 153 0 198 1 157 0 199 1 161 0 200 1 165 0 201 1 169 0 202 1 173 0 203 1 177 0 204 1 181 0 205 1 185 0 206 1 189 0 207 2 57 1 30 2 225 2 78 2 229 2 79 21 193 2 91] 
#[0 8 198 0 11 0 88 0 91 0 100 0 103 0 106 0 111] 
#[0 8 198 0 11 0 88 0 91 0 100 0 103 0 106 0 111] 
#[0 8 198 0 11 0 88 0 91 0 100 0 103 0 106 0 111] 
#[0 8 198 0 11 0 88 0 91 0 100 0 103 0 106 0 111] 
#[0 8 198 0 11 0 88 0 91 0 100 0 103 0 106 0 111] 
#[0 8 198 0 11 0 88 0 91 0 100 0 103 0 106 0 111] 
#[0 9 42 0 11 0 88 0 91 0 100 0 103 0 106 0 111] 
#[1 4 165 0 39 4 169 0 40 4 173 0 41 4 177 0 42 4 181 0 44 4 185 0 45 4 189 0 46 4 193 0 48 4 201 0 53 0 225 0 67 4 205 0 68 4 209 0 69 4 213 0 70 4 217 0 71 4 221 0 73 4 225 0 74 4 233 0 157 1 113 0 178 1 117 0 180 4 237 0 189 21 197 0 190 1 129 0 192 1 133 0 193 1 137 0 194 1 141 0 195 1 145 0 196 1 149 0 197 1 153 0 198 1 157 0 199 1 161 0 200 1 165 0 201 1 169 0 202 1 173 0 203 1 177 0 204 1 181 0 205 1 185 0 206 1 189 0 207 2 57 1 30 2 225 2 78 2 229 2 79] 
#[1 0 186 0 4 21 201 0 63 0 190 0 75 0 194 0 76 1 207 0 157] 
#[0 21 209 0 157] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 21 213 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[0 9 46 0 62 0 64 0 66] 
#[0 9 50 0 62 0 64 0 66] 
#[0 9 54 0 20 0 22 0 26 0 27 0 89 0 128 0 129] 
#[0 9 58 0 24 0 27 0 52 0 55] 
#[1 9 62 0 24 9 62 0 27 9 62 0 52 9 62 0 55 21 217 0 62] 
#[0 9 66 0 24 0 27 0 52 0 55] 
#[0 9 70 0 24 0 27 0 52 0 55 0 62] 
#[0 9 74 0 24 0 27 0 52 0 55] 
#[0 9 70 0 24 0 27 0 52 0 55 0 62] 
#[0 9 78 0 157] 
#[0 9 78 0 157] 
#[1 0 186 0 4 0 190 0 75 0 194 0 76 21 221 0 157 21 225 1 189 21 229 1 192] 
#[1 9 82 0 55 21 233 0 57 9 82 0 62] 
#[1 21 237 0 55 21 241 0 62] 
#[0 9 86 0 55 0 62] 
#[1 21 77 0 157 1 113 0 178 16 69 0 180 4 237 0 189 21 81 0 204 21 245 1 203] 
#[1 9 90 0 24 5 189 0 43 0 134 0 49 9 90 0 52 1 211 0 59 9 90 0 65 8 85 0 188 5 205 0 214] 
#[0 21 249 0 49] 
#[1 21 253 0 24 22 1 0 52 22 5 1 216] 
#[1 0 186 0 4 0 190 0 75 0 194 0 76 22 9 0 157 1 113 0 178 16 69 0 180 4 237 0 189 21 81 0 204 22 13 1 194 21 69 1 197 22 17 1 203] 
#[0 22 21 0 76] 
#[0 22 25 0 49] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 22 29 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[1 0 49 0 76 0 10 0 78 0 10 0 81 0 10 0 88 0 10 0 91 0 10 0 106 22 33 1 155 22 37 1 219 22 41 1 222 22 45 1 224 0 85 2 54 0 89 2 55 0 93 2 56] 
#[0 9 94 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[1 4 165 0 39 4 169 0 40 4 173 0 41 4 177 0 42 4 181 0 44 4 185 0 45 4 189 0 46 4 193 0 48 4 201 0 53 0 225 0 67 4 205 0 68 4 209 0 69 4 213 0 70 4 217 0 71 4 221 0 73 4 225 0 74 4 233 0 157 1 113 0 178 1 117 0 180 4 237 0 189 22 49 0 190 1 129 0 192 1 133 0 193 1 137 0 194 1 141 0 195 1 145 0 196 1 149 0 197 1 153 0 198 1 157 0 199 1 161 0 200 1 165 0 201 1 169 0 202 1 173 0 203 1 177 0 204 1 181 0 205 1 185 0 206 1 189 0 207 2 57 1 30 2 225 2 78 2 229 2 79] 
#[1 4 165 0 39 4 169 0 40 4 173 0 41 4 177 0 42 4 181 0 44 4 185 0 45 4 189 0 46 4 193 0 48 4 201 0 53 0 225 0 67 4 205 0 68 4 209 0 69 4 213 0 70 4 217 0 71 4 221 0 73 4 225 0 74 4 233 0 157 1 113 0 178 1 117 0 180 4 237 0 189 22 53 0 190 1 129 0 192 1 133 0 193 1 137 0 194 1 141 0 195 1 145 0 196 1 149 0 197 1 153 0 198 1 157 0 199 1 161 0 200 1 165 0 201 1 169 0 202 1 173 0 203 1 177 0 204 1 181 0 205 1 185 0 206 1 189 0 207 2 57 1 30 2 225 2 78 2 229 2 79] 
#[1 22 57 0 2 22 61 0 3 22 65 0 4 22 69 0 5 22 73 0 6 22 77 0 7 22 81 0 8 22 85 0 9 22 89 0 10 22 93 0 12 22 97 0 19 22 101 0 30 22 105 0 32 22 109 0 33 22 113 0 34 22 117 0 36 22 121 0 37 22 125 0 59 22 129 0 87 22 133 0 92 22 137 0 153 22 141 0 154 22 145 1 247 22 149 1 248] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 22 153 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[0 9 98 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[0 9 102 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[0 9 106 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[1 0 10 0 39 0 10 0 40 0 10 0 41 0 10 0 42 0 10 0 44 0 10 0 45 0 10 0 46 0 10 0 48 0 10 0 53 0 10 0 60 0 10 0 61 0 10 0 63 6 238 0 64 0 10 0 67 0 10 0 68 0 10 0 69 0 10 0 70 0 10 0 71 0 10 0 73 0 10 0 74 0 49 0 76 0 10 0 79 0 10 0 157 16 125 1 155 22 157 1 204 16 133 1 207 16 137 1 208 16 141 1 209 16 145 1 210 0 85 2 54 0 89 2 55 0 93 2 56] 
#[0 9 110 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[0 9 114 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[0 9 118 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[0 22 161 0 64] 
#[0 9 122 0 157] 
#[0 22 165 0 157] 
#[0 9 126 0 157] 
#[0 9 130 0 157] 
#[0 22 169 0 157] 
#[0 9 126 0 157] 
#[0 9 134 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[1 0 186 0 4 0 190 0 75 0 194 0 76 9 138 0 157] 
#[1 22 173 0 157 22 177 2 92 22 181 2 95] 
#[1 0 186 0 4 0 190 0 75 0 194 0 76 22 185 0 157] 
#[0 22 189 0 76] 
#[0 22 193 0 52] 
#[1 14 89 0 59 5 94 0 65 22 197 1 158 14 97 1 164] 
#[0 9 142 0 62 0 64 0 66] 
#[1 17 241 0 11 4 233 0 157 1 113 0 178 16 69 0 180 4 237 0 189 21 37 0 194 18 5 0 204 22 201 1 173 21 45 1 174] 
#[0 22 205 0 57] 
#[1 22 209 0 55 22 213 0 62] 
#[0 9 146 0 55 0 62] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 8 109 0 52 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 11 77 1 23 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 22 217 1 198 2 209 2 70 11 93 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[0 9 150 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[1 21 61 0 157 22 221 1 197] 
#[1 14 89 0 59 5 94 0 65 22 225 1 158 14 97 1 164] 
#[0 22 229 0 157] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 22 233 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[1 0 49 0 76 0 10 0 78 0 10 0 81 0 10 0 88 0 10 0 91 0 10 0 106 22 33 1 155 22 237 1 219 22 41 1 222 22 45 1 224 0 85 2 54 0 89 2 55 0 93 2 56] 
#[0 9 154 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[1 5 189 0 43 0 134 0 49 9 90 0 52 9 82 0 55 21 233 0 57 5 197 0 59 9 82 0 62 8 85 0 188 5 205 0 214] 
#[1 22 241 0 55 21 241 0 62] 
#[0 22 245 0 52] 
#[1 0 10 0 39 0 10 0 40 0 10 0 41 0 10 0 42 0 10 0 44 0 10 0 45 0 10 0 46 0 10 0 48 0 10 0 53 0 10 0 60 0 10 0 61 0 10 0 63 0 10 0 67 0 10 0 68 0 10 0 69 0 10 0 70 0 10 0 71 0 10 0 73 0 10 0 74 0 49 0 76 0 10 0 79 0 10 0 157 16 125 1 155 22 249 1 207 16 137 1 208 16 141 1 209 16 145 1 210 0 85 2 54 0 89 2 55 0 93 2 56] 
#[0 22 253 0 63] 
#[0 23 1 0 55] 
#[1 9 158 0 78 9 158 0 81 23 5 0 88 23 9 0 91 23 13 0 106 23 17 1 226 23 21 1 228] 
#[0 23 25 0 155] 
#[1 0 49 0 76 0 10 0 81 0 10 0 88 0 10 0 91 0 10 0 106 9 162 0 155 23 29 1 155 23 33 1 223 23 37 1 224 0 85 2 54 0 89 2 55 0 93 2 56] 
#[1 0 49 0 76 0 10 0 78 0 10 0 88 0 10 0 91 0 10 0 106 9 166 0 155 23 41 1 155 23 45 1 222 23 49 1 225 0 85 2 54 0 89 2 55 0 93 2 56] 
#[1 0 186 0 4 23 53 0 65 0 190 0 75 0 194 0 76] 
#[1 0 186 0 4 23 57 0 65 0 190 0 75 0 194 0 76] 
#[0 9 170 0 65] 
#[0 9 174 0 65] 
#[0 9 174 0 65] 
#[0 9 170 0 65] 
#[0 9 174 0 65] 
#[0 9 174 0 65] 
#[0 9 174 0 65] 
#[0 1 215 0 65] 
#[0 9 174 0 65] 
#[0 9 170 0 65] 
#[0 1 215 0 65] 
#[0 9 174 0 65] 
#[0 9 174 0 65] 
#[0 9 174 0 65] 
#[0 9 170 0 65] 
#[0 9 174 0 65] 
#[0 9 174 0 65] 
#[0 9 174 0 65] 
#[0 9 170 0 65] 
#[0 9 170 0 65] 
#[0 9 174 0 65] 
#[0 9 174 0 65] 
#[0 23 61 0 65] 
#[0 23 65 0 65] 
#[0 23 69 0 55] 
#[0 23 73 0 64] 
#[1 0 201 0 52 23 77 0 55 23 81 2 1 23 85 2 72] 
#[0 23 89 0 65] 
#[0 23 93 0 65] 
#[0 23 97 0 76] 
#[1 23 101 0 55 22 173 0 157 23 105 2 95] 
#[0 9 178 0 55 0 157] 
#[0 23 109 0 55] 
#[1 0 10 0 39 0 10 0 40 0 10 0 41 0 10 0 42 0 10 0 44 0 10 0 45 0 10 0 46 0 10 0 48 0 10 0 53 0 10 0 60 0 10 0 61 0 10 0 63 0 10 0 67 0 10 0 68 0 10 0 69 0 10 0 70 0 10 0 71 0 10 0 73 0 10 0 74 0 49 0 76 0 10 0 79 0 10 0 157 16 125 1 155 23 113 1 207 16 137 1 208 16 141 1 209 16 145 1 210 0 85 2 54 0 89 2 55 0 93 2 56] 
#[1 0 49 0 76 0 10 0 78 0 10 0 81 23 117 1 155 23 121 2 33 23 125 2 34 23 129 2 35 0 85 2 54 0 89 2 55 0 93 2 56] 
#[0 23 133 0 65] 
#[0 9 182 0 24 0 27 0 52 0 55] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 23 137 0 255 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 9 53 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[0 9 186 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[1 21 221 0 157 23 141 1 192] 
#[0 9 190 0 55 0 62] 
#[0 9 194 0 55 0 62] 
#[0 23 145 0 65] 
#[0 9 198 0 24 0 52 0 59 0 65] 
#[0 9 202 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[0 23 149 0 155] 
#[0 9 206 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[1 0 49 0 76 0 10 0 84 0 10 0 85 23 153 1 155 23 157 1 230 23 161 1 233 23 165 1 234 0 85 2 54 0 89 2 55 0 93 2 56] 
#[0 23 169 0 66] 
#[0 23 173 0 76] 
#[0 9 210 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[1 9 214 0 78 9 214 0 81 23 177 0 106] 
#[0 9 214 0 78 0 81] 
#[1 9 214 0 78 9 214 0 81 23 181 0 88] 
#[1 23 185 0 78 23 189 0 81] 
#[0 9 218 0 78 0 81] 
#[0 9 222 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[1 9 158 0 81 23 5 0 88 23 9 0 91 23 13 0 106 23 193 1 226 23 21 1 228] 
#[0 9 226 0 155] 
#[0 9 230 0 155] 
#[1 9 158 0 78 23 5 0 88 23 9 0 91 23 13 0 106 23 197 1 226 23 21 1 228] 
#[0 9 234 0 155] 
#[0 9 238 0 155] 
#[1 4 165 0 39 4 169 0 40 4 173 0 41 4 177 0 42 4 181 0 44 4 185 0 45 4 189 0 46 4 193 0 48 4 201 0 53 0 225 0 67 4 205 0 68 4 209 0 69 4 213 0 70 4 217 0 71 4 221 0 73 4 225 0 74 4 233 0 157 1 113 0 178 1 117 0 180 4 237 0 189 23 201 0 190 1 129 0 192 1 133 0 193 1 137 0 194 1 141 0 195 1 145 0 196 1 149 0 197 1 153 0 198 1 157 0 199 1 161 0 200 1 165 0 201 1 169 0 202 1 173 0 203 1 177 0 204 1 181 0 205 1 185 0 206 1 189 0 207 2 57 1 30 2 225 2 78 2 229 2 79] 
#[1 4 165 0 39 4 169 0 40 4 173 0 41 4 177 0 42 4 181 0 44 4 185 0 45 4 189 0 46 4 193 0 48 4 201 0 53 0 225 0 67 4 205 0 68 4 209 0 69 4 213 0 70 4 217 0 71 4 221 0 73 4 225 0 74 4 233 0 157 1 113 0 178 1 117 0 180 4 237 0 189 23 205 0 190 1 129 0 192 1 133 0 193 1 137 0 194 1 141 0 195 1 145 0 196 1 149 0 197 1 153 0 198 1 157 0 199 1 161 0 200 1 165 0 201 1 169 0 202 1 173 0 203 1 177 0 204 1 181 0 205 1 185 0 206 1 189 0 207 2 57 1 30 2 225 2 78 2 229 2 79] 
#[1 4 165 0 39 4 169 0 40 4 173 0 41 4 177 0 42 4 181 0 44 4 185 0 45 4 189 0 46 4 193 0 48 4 201 0 53 0 225 0 67 4 205 0 68 4 209 0 69 4 213 0 70 4 217 0 71 4 221 0 73 4 225 0 74 4 233 0 157 1 113 0 178 1 117 0 180 4 237 0 189 23 209 0 190 1 129 0 192 1 133 0 193 1 137 0 194 1 141 0 195 1 145 0 196 1 149 0 197 1 153 0 198 1 157 0 199 1 161 0 200 1 165 0 201 1 169 0 202 1 173 0 203 1 177 0 204 1 181 0 205 1 185 0 206 1 189 0 207 2 57 1 30 2 225 2 78 2 229 2 79] 
#[1 4 165 0 39 4 169 0 40 4 173 0 41 4 177 0 42 4 181 0 44 4 185 0 45 4 189 0 46 4 193 0 48 4 201 0 53 0 225 0 67 4 205 0 68 4 209 0 69 4 213 0 70 4 217 0 71 4 221 0 73 4 225 0 74 4 233 0 157 1 113 0 178 1 117 0 180 4 237 0 189 23 213 0 190 1 129 0 192 1 133 0 193 1 137 0 194 1 141 0 195 1 145 0 196 1 149 0 197 1 153 0 198 1 157 0 199 1 161 0 200 1 165 0 201 1 169 0 202 1 173 0 203 1 177 0 204 1 181 0 205 1 185 0 206 1 189 0 207 2 57 1 30 2 225 2 78 2 229 2 79] 
#[0 9 242 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[1 9 246 0 52 9 246 0 55 23 217 0 58 23 221 1 254 23 225 1 255] 
#[0 9 250 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[0 9 254 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[0 10 2 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[0 23 229 0 64] 
#[0 23 233 0 64] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 23 237 0 255 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 2 209 2 70 9 53 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[0 10 6 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[0 10 10 0 55 0 157] 
#[0 10 14 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 155 0 157] 
#[0 23 241 0 66] 
#[1 23 245 0 78 23 249 0 81] 
#[0 23 253 0 155] 
#[1 0 49 0 76 0 10 0 81 10 18 0 155 24 1 1 155 24 5 2 35 0 85 2 54 0 89 2 55 0 93 2 56] 
#[1 0 49 0 76 0 10 0 78 10 22 0 155 24 9 1 155 24 13 2 34 0 85 2 54 0 89 2 55 0 93 2 56] 
#[1 0 10 0 39 0 10 0 40 0 10 0 41 0 10 0 42 0 10 0 44 0 10 0 45 0 10 0 46 0 10 0 48 0 10 0 53 0 10 0 60 0 10 0 61 0 10 0 63 6 238 0 64 0 10 0 67 0 10 0 68 0 10 0 69 0 10 0 70 0 10 0 71 0 10 0 73 0 10 0 74 0 49 0 76 0 10 0 79 0 10 0 157 16 125 1 155 24 17 1 204 16 133 1 207 16 137 1 208 16 141 1 209 16 145 1 210 0 85 2 54 0 89 2 55 0 93 2 56] 
#[0 10 26 0 55 0 62] 
#[0 10 30 0 55 0 62] 
#[1 0 10 0 39 0 10 0 40 0 10 0 41 0 10 0 42 0 10 0 44 0 10 0 45 0 10 0 46 0 10 0 48 0 10 0 53 0 10 0 60 0 10 0 61 0 10 0 63 6 238 0 64 0 10 0 67 0 10 0 68 0 10 0 69 0 10 0 70 0 10 0 71 0 10 0 73 0 10 0 74 0 49 0 76 0 10 0 79 0 10 0 157 16 125 1 155 24 21 1 204 16 133 1 207 16 137 1 208 16 141 1 209 16 145 1 210 0 85 2 54 0 89 2 55 0 93 2 56] 
#[1 10 34 0 2 10 34 0 11 10 34 0 21 10 34 0 39 10 34 0 40 10 34 0 41 10 34 0 42 10 34 0 44 10 34 0 45 10 34 0 46 10 34 0 47 10 34 0 48 10 34 0 51 10 34 0 53 24 25 0 57 10 34 0 67 10 34 0 68 10 34 0 69 10 34 0 70 10 34 0 71 10 34 0 73 10 34 0 74 10 34 0 76 10 34 0 80 10 34 0 82 10 34 0 86 10 34 0 88 10 34 0 90 10 34 0 91 10 34 0 93 10 34 0 94 10 34 0 95 10 34 0 96 10 34 0 97 10 34 0 100 10 34 0 103 10 34 0 106 10 34 0 109 10 34 0 110 10 34 0 111 10 34 0 121 10 34 0 130 10 34 0 155 10 34 0 157 24 29 1 220 24 33 1 221] 
#[1 24 37 0 84 24 41 0 85] 
#[0 24 45 0 155] 
#[1 0 49 0 76 0 10 0 84 24 49 1 155 24 53 1 234 0 85 2 54 0 89 2 55 0 93 2 56] 
#[1 0 49 0 76 0 10 0 85 24 57 1 155 24 61 1 233 0 85 2 54 0 89 2 55 0 93 2 56] 
#[0 10 38 0 24 0 52] 
#[1 0 10 0 39 0 10 0 40 0 10 0 41 0 10 0 42 0 10 0 44 0 10 0 45 0 10 0 46 0 10 0 48 0 10 0 53 0 10 0 60 0 10 0 61 0 10 0 63 0 10 0 67 0 10 0 68 0 10 0 69 0 10 0 70 0 10 0 71 0 10 0 73 0 10 0 74 0 49 0 76 0 10 0 79 0 10 0 157 16 125 1 155 24 65 1 207 16 137 1 208 16 141 1 209 16 145 1 210 0 85 2 54 0 89 2 55 0 93 2 56] 
#[0 10 42 0 78 0 81] 
#[0 10 42 0 78 0 81] 
#[1 0 201 0 52 24 69 0 55 24 73 1 227 24 77 2 72] 
#[1 0 201 0 52 24 69 0 55 24 81 1 227 24 77 2 72] 
#[0 23 189 0 81] 
#[0 23 185 0 78] 
#[1 0 186 0 4 0 190 0 75 0 194 0 76 24 85 0 157] 
#[1 0 186 0 4 0 190 0 75 0 194 0 76 24 89 0 157] 
#[1 0 186 0 4 0 190 0 75 0 194 0 76 24 93 0 157] 
#[1 0 186 0 4 0 190 0 75 0 194 0 76 24 97 0 157] 
#[1 24 101 0 29 24 105 0 63] 
#[0 10 46 0 52 0 55] 
#[0 10 50 0 52 0 55] 
#[1 18 197 0 24 0 201 0 52 18 201 0 55 24 109 1 200 18 209 2 72] 
#[1 18 197 0 24 0 201 0 52 18 201 0 55 24 113 1 200 18 209 2 72] 
#[0 24 117 0 66] 
#[0 24 121 0 52] 
#[0 24 125 0 55] 
#[0 24 129 0 55] 
#[0 10 54 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 155 0 157] 
#[0 23 249 0 81] 
#[0 10 58 0 155] 
#[0 23 245 0 78] 
#[0 10 62 0 155] 
#[0 24 133 0 64] 
#[0 24 137 0 64] 
#[1 0 101 0 1 0 105 0 2 0 109 0 4 0 113 0 5 0 117 0 9 0 121 0 11 0 125 0 12 3 1 0 13 0 133 0 14 0 137 0 16 0 141 0 17 3 5 0 18 0 149 0 19 3 9 0 20 0 153 0 21 0 157 0 29 0 161 0 32 0 165 0 34 3 13 0 39 3 17 0 40 3 21 0 41 3 25 0 42 3 29 0 44 3 33 0 45 3 37 0 46 3 41 0 48 8 109 0 52 3 45 0 53 0 217 0 63 3 49 0 65 3 53 0 68 3 57 0 69 3 61 0 70 3 65 0 71 3 69 0 73 3 73 0 74 0 253 0 87 1 1 0 92 1 13 0 104 3 77 0 157 1 85 0 158 1 89 0 159 1 93 0 160 1 97 0 161 0 14 0 162 1 101 0 165 0 18 0 166 1 105 0 169 1 109 0 170 3 81 0 189 1 193 0 223 1 197 0 224 3 85 0 225 1 205 0 226 1 209 0 227 1 213 0 228 1 217 0 229 1 221 0 230 3 89 0 231 1 229 0 232 1 233 0 233 1 237 0 234 3 93 0 235 3 97 0 236 3 101 0 237 1 253 0 238 2 1 0 239 2 5 0 240 2 9 0 241 2 13 0 242 2 17 0 243 2 21 0 244 2 25 0 245 2 29 0 246 2 33 0 247 2 37 0 249 2 41 1 1 2 45 1 6 2 49 1 7 2 53 1 8 3 105 1 21 11 77 1 23 2 61 1 37 3 109 1 38 3 113 1 39 3 117 1 40 2 77 1 41 3 121 1 42 3 125 1 46 3 129 1 47 3 133 1 48 3 137 1 49 3 141 1 50 3 145 1 52 3 149 1 53 3 153 1 54 3 157 1 55 3 161 1 56 3 165 1 57 3 169 1 58 3 173 1 60 3 177 1 62 3 181 1 63 3 185 1 70 3 189 1 72 3 193 1 74 3 197 1 94 24 141 1 198 2 209 2 70 11 93 2 73 2 233 2 80 2 237 2 81 2 241 2 82 2 245 2 83 2 249 2 84 3 205 2 101] 
#[0 10 66 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[0 10 70 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[1 0 201 0 52 24 145 2 72] 
#[1 0 201 0 52 24 149 2 72] 
#[0 10 74 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[0 24 37 0 84] 
#[0 10 78 0 155] 
#[0 24 41 0 85] 
#[0 10 82 0 155] 
#[0 24 153 0 66] 
#[0 10 86 0 76 0 78 0 81 0 88 0 91 0 106 0 155] 
#[0 10 90 0 76 0 81 0 88 0 91 0 106 0 155] 
#[0 10 94 0 76 0 78 0 81 0 88 0 91 0 106 0 155] 
#[0 10 98 0 76 0 78 0 88 0 91 0 106 0 155] 
#[0 24 157 0 64] 
#[0 24 161 0 64] 
#[0 24 165 0 64] 
#[0 24 169 0 62] 
#[0 24 173 0 65] 
#[0 24 177 0 65] 
#[0 10 102 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[0 10 102 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[0 10 106 0 55 0 157] 
#[1 0 49 0 76 0 10 0 78 0 10 0 81 23 117 1 155 24 181 2 33 23 125 2 34 23 129 2 35 0 85 2 54 0 89 2 55 0 93 2 56] 
#[0 10 110 0 76 0 81 0 155] 
#[0 10 114 0 76 0 78 0 155] 
#[1 16 53 0 27 6 206 0 55 24 185 1 160 16 61 1 168 16 65 1 169] 
#[1 6 206 0 24 16 53 0 27 6 206 0 52 6 206 0 55 24 189 1 160 16 61 1 168 16 65 1 169] 
#[0 10 118 0 2 0 11 0 21 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 51 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 82 0 86 0 88 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 100 0 103 0 106 0 109 0 110 0 111 0 121 0 130 0 155 0 157] 
#[0 10 122 0 76 0 85 0 155] 
#[0 10 126 0 76 0 84 0 155] 
#[0 10 130 0 24 0 52] 
#[0 10 134 0 24 0 52 0 55] 
#[0 10 138 0 24 0 52 0 55] 
#[0 10 142 0 24 0 52 0 55] 
#[1 4 165 0 39 4 169 0 40 4 173 0 41 4 177 0 42 4 181 0 44 4 185 0 45 4 189 0 46 4 193 0 48 4 201 0 53 0 225 0 67 4 205 0 68 4 209 0 69 4 213 0 70 4 217 0 71 4 221 0 73 4 225 0 74 4 233 0 157 1 113 0 178 1 117 0 180 4 237 0 189 24 193 0 190 1 129 0 192 1 133 0 193 1 137 0 194 1 141 0 195 1 145 0 196 1 149 0 197 1 153 0 198 1 157 0 199 1 161 0 200 1 165 0 201 1 169 0 202 1 173 0 203 1 177 0 204 1 181 0 205 1 185 0 206 1 189 0 207 2 57 1 30 2 225 2 78 2 229 2 79] 
#[1 2 46 0 1 2 46 0 2 2 46 0 4 2 46 0 5 2 46 0 9 2 46 0 11 2 46 0 12 2 46 0 13 2 46 0 14 2 46 0 16 2 46 0 17 2 46 0 18 2 46 0 19 2 46 0 20 2 46 0 21 2 46 0 29 2 46 0 32 2 46 0 34 2 46 0 39 2 46 0 40 2 46 0 41 2 46 0 42 2 46 0 44 2 46 0 45 2 46 0 46 2 46 0 48 2 46 0 53 2 46 0 60 2 46 0 61 2 46 0 63 2 50 0 64 2 46 0 65 2 46 0 68 2 46 0 69 2 46 0 70 2 46 0 71 2 46 0 73 2 46 0 74 2 46 0 87 2 46 0 92 2 46 0 104 0 155 0 157 2 46 0 158 2 46 0 159 2 46 0 160 2 46 0 161 2 46 0 162 2 46 0 165 2 46 0 166 2 46 0 169 2 46 0 170 9 145 0 217 24 197 0 218 9 153 0 219 9 157 0 220 9 161 0 222] 
#[1 2 46 0 1 2 46 0 2 2 46 0 4 2 46 0 5 2 46 0 9 2 46 0 11 2 46 0 12 2 46 0 13 2 46 0 14 2 46 0 16 2 46 0 17 2 46 0 18 2 46 0 19 2 46 0 20 2 46 0 21 2 46 0 29 2 46 0 32 2 46 0 34 2 46 0 39 2 46 0 40 2 46 0 41 2 46 0 42 2 46 0 44 2 46 0 45 2 46 0 46 2 46 0 48 2 46 0 53 2 46 0 60 2 46 0 61 2 46 0 63 2 50 0 64 2 46 0 65 2 46 0 68 2 46 0 69 2 46 0 70 2 46 0 71 2 46 0 73 2 46 0 74 2 46 0 87 2 46 0 92 2 46 0 104 0 155 0 157 2 46 0 158 2 46 0 159 2 46 0 160 2 46 0 161 2 46 0 162 2 46 0 165 2 46 0 166 2 46 0 169 2 46 0 170 9 145 0 217 24 201 0 218 9 153 0 219 9 157 0 220 9 161 0 222] 
#[0 24 205 0 155] 
#[0 24 209 0 55] 
#[0 10 146 0 24 0 52 0 55] 
#[1 0 186 0 4 0 190 0 75 0 194 0 76 24 213 0 157] 
#[0 24 217 0 64] 
#[0 24 221 0 64] 
#[0 10 150 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 155 0 157] 
#[0 10 154 0 11 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 53 0 67 0 68 0 69 0 70 0 71 0 73 0 74 0 76 0 80 0 155 0 157] 
#[0 24 225 0 64] 
#[0 10 158 0 52 0 55] 
#[0 10 162 0 52 0 55] 
#[0 10 166 0 24 0 52 0 55]
	).
]

{ #category : #private }
CSharpParser >> tryAllTokens [
	| id ids |
	id := scanner IdentifierId.
	ids := currentToken ids.
	^ (ids includes: id)
		ifTrue:
			[ ids first = id
				ifTrue: [ ^ false ].
			^ (self class keywords includes: currentToken value) not ]
		ifFalse: [ ^ false ]
]
