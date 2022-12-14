Class {
	#name : #JavaParser,
	#superclass : #SmaCCGLRParser,
	#category : 'SmaCC-Java'
}

{ #category : #'generated-accessing' }
JavaParser class >> cacheId [
	^'2017-05-03T19:38:52.744465+02:00'
]

{ #category : #generated }
JavaParser class >> definitionComment [
"%start goal block_statement expression type_declaration;
%glr;
%right ""else"";

%id <UNSIGNED_RIGHT_SHIFT> <SIGNED_RIGHT_SHIFT> <GREATER_THAN>;

%ignore_variables semicolon comma leftParen rightParen _leftParen _rightParen lt gt leftBracket rightBracket leftBrace rightBrace;

%prefix Java ;
%suffix Node ;
%root Program ;

%hierarchy IfStatement (IfElseStatement);
%hierarchy New (NewClass);
%hierarchy Literal (IntegerLiteral FloatLiteral BooleanLiteral CharacterLiteral StringLiteral Null);
%hierarchy PrimitiveType (BooleanType ByteType ShortType IntType LongType CharType FloatType DoubleType) ;
%hierarchy Type (PrimitiveType ClassType ArrayType) ;
%hierarchy Statement (Block LocalVariableDeclarationStatement EmptyStatement LabeledStatement
					ExpressionStatement IfStatement SwitchStatement WhileStatement DoWhileStatement
					ForStatement ForEachStatement BreakStatement ContinueStatement ReturnStatement ThrowStatement
					SynchronizedStatement TryStatement AssertStatement);
%hierarchy Expression (PostIncrementExpression PostDecrementExpression UnaryAddition UnarySubtraction
					PreIncrementExpression PreDecrementExpression UnaryBitInvert UnaryNot
					CastExpression BinaryExpression ConditionalExpression Assignment 
					ClassProperty FieldAccess MethodInvocation ArrayAccess
					New Literal Name NewArray LambdaExpression MethodReference);
%hierarchy Name (QualifiedName) ;
%hierarchy SingleTypeImportDeclaration (TypeImportOnDemandDeclaration);
%hierarchy VariableDeclaration (InitializedVariableDeclaration) ;
%hierarchy Parameter (VariableArgumentParameter);
%hierarchy AbstractMethodDeclaration (AnnotationMethodDeclaration);

<GREATER_THAN>
	: >
	;
<SIGNED_RIGHT_SHIFT>
	: >>
	;
<UNSIGNED_RIGHT_SHIFT>
	: >>>
	;
<DECIMAL_INTEGER>
	: 0 | [1-9] [0-9]*	
	;
<HEX_INTEGER>
	: 0[xX][0-9a-fA-F]+	
	;
<OCTAL_INTEGER>
	: 0[0-7]+	
	;
<EXPONENT>
	: [eE] [\-\+]? [0-9]+ 	
	;
<FLOAT_TYPE>
	: [fFdD]	
	;
<ESCAPE_SEQUENCE>
	: \\ ([btnfr\""\'\\] | ([0-3] [0-7]{0,2} | [4-7][0-7]?) | (u [0-9a-fA-F]{4,4}))	
	;
<INTEGER_LITERAL>
	: (<DECIMAL_INTEGER> | <HEX_INTEGER> | <OCTAL_INTEGER>) [lL]?	
	;
<FLOATING_POINT_LITERAL>
	: [0-9]+ \. [0-9]* <EXPONENT>? <FLOAT_TYPE>? 
	| \. [0-9]+ <EXPONENT>? <FLOAT_TYPE>? 
	| [0-9]+ <EXPONENT> <FLOAT_TYPE>? 
	| [0-9]+ <FLOAT_TYPE>	
	| <HEX_INTEGER> \. [0-9a-fA-F]+ [pP] [\-\+]? [0-9]+ <FLOAT_TYPE>?
	;
<BOOLEAN_LITERAL>
	: true 
	| false	
	;
<CHARACTER_LITERAL>
	: \' ([^\\\'] | <ESCAPE_SEQUENCE> ) \'	
	;
<STRING_LITERAL>
	: \"" ([^\\\""] | <ESCAPE_SEQUENCE> )* \""	
	;
<NULL_LITERAL>
	: null	
	;
<IDENTIFIER>
	: (<isLetter> | [a-zA-Z_$]) (<isLetter>|\w|$)*	
	;

<eol>
	: \r 
	| \n 
	| \r\n
	;
<whitespace>
	: \s+
	;
<comment>
	: \/\/ [^\r\n]* 
	| /\*([^*]|[\r\n]|(\*+([^*/]|[\r\n])))*\*+/
 	;
<patternToken>
	: (\`  [^\`]* \`)+
	;

goal 
	: compilation_unit 
	;
# 19.3) Lexical Structure.
literal 
	: <INTEGER_LITERAL> 'token' {{IntegerLiteral}}
	| <FLOATING_POINT_LITERAL> 'token' {{FloatLiteral}}
	| <BOOLEAN_LITERAL> 'token' {{BooleanLiteral}}
	| <CHARACTER_LITERAL> 'token' {{CharacterLiteral}}
	| <STRING_LITERAL> 'token' {{StringLiteral}}
	| <NULL_LITERAL> 'token' {{Null}}
	;
# 19.4) Types, Values, and Variables
type
	: primitive_type 
	| reference_type 
	;
primitive_type 
	: numeric_type 
	| ""boolean"" 'token' {{BooleanType}}
	;
numeric_type
	: integral_type 
	| floating_point_type 
	;
integral_type 
	: ""byte"" 'token' {{ByteType}}
	| ""short"" 'token' {{ShortType}}
	| ""int"" 'token' {{IntType}}
	| ""long"" 'token' {{LongType}}
	| ""char"" 'token' {{CharType}}
	;
floating_point_type 
	: ""float"" 'token' {{FloatType}}
	| ""double"" 'token' {{DoubleType}}
	;
reference_type 
	: class_or_interface_type 
	| array_type 
	;
class_or_interface_type 
	: type_name 'name' {{ClassType}}
	;
class_type 
	: class_or_interface_type 
	;
interface_type 
	: class_or_interface_type 
	;		
array_type 
	: primitive_type 'baseType' dims {{ArrayType}}
	| type_name 'baseType' dims {{ArrayType}}
	;
# 19.5) Names
name
	: simple_name 
	| qualified_name 
	;
simple_name 
	: <IDENTIFIER> 'name' {{Name}}
	;
qualified_name 
	: name 'nspace' ""."" 'period' <IDENTIFIER> 'name' {{QualifiedName}}
	;
# 19.6) ""package""s
compilation_unit 
	: package_declaration_opt 'packageDeclaration'
		import_declarations_opt 
		type_declarations_opt {{ProgramFile}}
	;
package_declaration_opt 
	: package_declaration
	|
	;
import_declarations_opt 
	: import_declarations
	|
	;
type_declarations_opt 
	: type_declarations 
	|
	;
import_declarations 
	: import_declaration 'import' 
	| import_declarations import_declaration 'import'
	;
type_declarations 
	: type_declaration 'typeDeclaration' 
	| type_declarations type_declaration 'typeDeclaration' 
	;
package_declaration 
	: annotations ""package"" 'packageToken' name 'name' "";"" 'semicolon' {{PackageDeclaration}}
	;
import_declaration 
	: single_type_import_declaration 
	| type_import_on_demand_declaration 
	;
single_type_import_declaration 
	: ""import"" 'importToken' static_opt name 'name' "";"" 'semicolon' {{SingleTypeImportDeclaration}}
	;
type_import_on_demand_declaration 
	: ""import"" 'importToken' static_opt name 'name' ""."" 'period' ""*"" 'star' "";"" 'semicolon' {{TypeImportOnDemandDeclaration}}
	;
type_declaration 
	: class_declaration 
	| interface_declaration 
	| annotation_interface_declaration
	| "";"" 'semicolon' {{EmptyDeclaration}}
	;
# 19.7) Productions used only in the LALR(1) grammar

modifiers_opt
	:
	| modifiers 
	;
modifiers 
	: modifier 'modifier'
	| modifiers modifier 'modifier'
	;
modifier 
	: ""public"" 'token' {{Modifier}}
	| ""protected"" 'token' {{Modifier}}
	| ""private"" 'token' {{Modifier}}
	| ""static"" 'token' {{Modifier}}
	| ""abstract"" 'token' {{Modifier}}
	| ""final"" 'token' {{Modifier}}
	| ""native"" 'token' {{Modifier}}
	| ""synchronized"" 'token' {{Modifier}}
	| ""transient"" 'token' {{Modifier}}
	| ""volatile"" 'token' {{Modifier}}
	| ""strictfp"" 'token' {{Modifier}} # note that semantic analysis must check that the
	                 # context of the modifier allows strictfp.
	| annotation
	;
# 19.8) Classes
# 19.8.1) Class Declaration:
class_declaration 
	: modifiers_opt ""class"" 'classToken' <IDENTIFIER> 'name' type_parameters_opt 'typeParameters' super_opt interfaces_opt class_body {{ClassDeclaration}}
	| enum_declaration
	;
super 
	: ""extends"" 'extendsToken' class_type 'superclass'
	;
super_opt 
	: 
	| super 
	;
interfaces 
	: ""implements"" 'implementsToken' interface_type_list
	;
interfaces_opt
	: 
	| interfaces 
	;
interface_type_list 
	: interface_type 'interface' 
	| interface_type_list "","" 'comma' interface_type 'interface' 
	;
class_body 
	: ""{"" 'leftBrace' class_body_declarations_opt ""}"" 'rightBrace'
	;
class_body_declarations_opt 
	: 
	| class_body_declarations
	;
class_body_declarations 
	: class_body_declaration 'declaration' 
	| class_body_declarations class_body_declaration 'declaration' 
	;
class_body_declaration 
	: class_member_declaration 
	| static_initializer 
	| constructor_declaration 
	| block 
	;
class_member_declaration 
	: field_declaration 
	| method_declaration 
	| type_declaration
	;
# 19.8.2) Field Declarations
field_declaration 
	: modifiers_opt type 'type' variable_declarators "";"" 'semicolon' {{FieldDeclaration}}
	;
variable_declarators 
	: variable_declarator 'variableDeclaration' 
	| variable_declarators "","" 'comma' variable_declarator 'variableDeclaration'
	;
variable_declarator 
	: variable_declarator_id 'variable' {{VariableDeclaration}}
	| initialized_variable_declarator
	;
initialized_variable_declarator
	: variable_declarator_id 'variable' ""="" 'equals' variable_initializer 'initializer' {{InitializedVariableDeclaration}}
	;
variable_declarator_id 
	: <IDENTIFIER> 'name' {{VariableName}}
	| variable_declarator_id 'variable' ""["" 'leftBracket' ""]"" 'rightBracket' {{ArrayVariableName}}
	;
variable_initializer 
	: expression 
	| array_initializer 
	;
# 19.8.3) Method Declarations
method_declaration 
	: method_header method_body 'body' {{MethodDeclaration}}
	;
method_header 
	: modifiers_opt type_parameters_opt 'typeParameters' type 'type' method_declarator 'declarator' throws_opt 'throws'
	| modifiers_opt type_parameters_opt 'typeParameters' void 'type' method_declarator 'declarator' throws_opt 'throws'
	;
####
void 
	: ""void"" 'voidToken' {{VoidType}} 
	;
####
method_declarator 
	: <IDENTIFIER> 'name' ""("" 'leftParen' formal_parameter_list_opt "")"" 'rightParen' {{MethodDeclarator}}
	| method_declarator 'declarator' ""["" 'leftBracket' ""]"" 'rightBracket' {{ArrayMethodDeclarator}} # deprecated
	# be careful; the above production also allows 'void foo() []'
	;
formal_parameter_list_opt 
	: 
	| formal_parameter_list 
	;
formal_parameter_list 
	: formal_parameter 'parameter' 
	| formal_parameter_list "","" 'comma' formal_parameter 'parameter' 
	;
formal_parameter 
	: variable_modifiers type 'type' variable_declarator_id 'variable' {{Parameter}}
	| variable_modifiers type 'type' ""..."" 'varArgsToken' variable_declarator_id 'variable' {{VariableArgumentParameter}}
	;
throws_opt 
	: 
	| throws 
	;
throws 
	: ""throws"" 'throwsToken' class_type_list {{Throws}}
	;
class_type_list 
	: class_type 'classType'
	| class_type_list "","" 'comma' class_type 'classType' 
	;
method_body 
	: block 
	| "";"" 'semicolon' {{EmptyMethodBody}}
	;
# 19.8.4) Static Initializers
static_initializer 
	: ""static"" 'staticToken' block 'block' {{StaticInitializer}}
	;
# 19.8.5) Constructor Declarations
constructor_declaration 
	: modifiers_opt constructor_declarator throws_opt 'throws'
			constructor_body 'body' {{ConstructorDeclaration}}
	;
constructor_declarator 
	: type_parameters_opt 'typeParameters' simple_name 'name' ""("" 'leftParen' formal_parameter_list_opt "")"" 'rightParen'
	;
constructor_body 
	: ""{"" 'leftBrace' explicit_constructor_invocation 'constructorInvocation'
			block_statements ""}"" 'rightBrace' {{ConstructorBody}}
	| ""{"" 'leftBrace' explicit_constructor_invocation 'constructorInvocation' ""}"" 'rightBrace' {{ConstructorBody}}
	| ""{"" 'leftBrace' block_statements ""}"" 'rightBrace' {{ConstructorBody}}
	| ""{"" 'leftBrace' ""}"" 'rightBrace' {{ConstructorBody}}
	;
explicit_constructor_invocation 
	: ""this"" 'thisToken' ""("" 'leftParen' argument_list_opt "")"" 'rightParen' "";"" 'semicolon' {{ThisConstructorInvocation}}
	| ""super"" 'superToken' ""("" 'leftParen' argument_list_opt "")"" 'rightParen' "";"" 'semicolon' {{SuperConstructorInvocation}}
	| primary 'primary' ""."" 'period' ""this"" 'thisToken' ""("" 'leftParen' argument_list_opt "")"" 'rightParen' "";"" 'semicolon' {{ThisConstructorInvocation}}
	| primary 'primary' ""."" 'period' ""super"" 'superToken' ""("" 'leftParen' argument_list_opt "")"" 'rightParen' "";"" 'semicolon' {{SuperConstructorInvocation}}
	;
# 19.9) Interfaces
# 19.9.1) Interface Declarations
interface_declaration 
	: modifiers_opt ""interface"" 'interfaceToken' <IDENTIFIER> 'name' type_parameters_opt 'typeParameters' extends_interfaces_opt 
			interface_body {{Interface}}
	;
annotation_interface_declaration
	: modifiers_opt ""@"" 'atToken' ""interface"" 'interfaceToken' <IDENTIFIER> 'name' annotation_interface_body {{AnnotationInterface}}
	;
annotation_interface_body
	: ""{"" 'leftBrace' annotation_interface_member_declarations_opt ""}"" 'rightBrace'
	;
annotation_interface_member_declarations_opt
	: 
	| annotation_interface_member_declarations
	;
annotation_interface_member_declarations
	: annotation_interface_member_declaration 'declaration'
	| annotation_interface_member_declarations annotation_interface_member_declaration 'declaration'
	;
annotation_interface_member_declaration
	: annotation_method_declaration
	| type_declaration
	| field_declaration
	;
annotation_method_declaration
	: abstract_method_declaration
	| method_header ""default"" 'defaultToken' variable_initializer 'value' "";"" 'semicolon' {{AnnotationMethodDeclaration}}
	| method_header ""default"" 'defaultToken' annotation 'value' "";"" 'semicolon' {{AnnotationMethodDeclaration}}
	;
extends_interfaces_opt 
	: 
	| extends_interfaces 
	;
extends_interfaces 
	: ""extends"" 'extendsToken' interface_type 'interfaceType' 
	| extends_interfaces "","" 'comma' interface_type 'interfaceType' 
	;
interface_body 
	: ""{"" 'leftBrace' interface_member_declarations_opt ""}"" 'rightBrace'
	;
interface_member_declarations_opt 
	: 
	| interface_member_declarations 
	;
interface_member_declarations 
	: interface_member_declaration 'declaration'
	| interface_member_declarations interface_member_declaration 'declaration'
	;
interface_member_declaration 
	: constant_declaration 
	| abstract_method_declaration 
	| type_declaration
	;
constant_declaration 
	: field_declaration 
	# need to semantically check that modifiers of field declaration
	# include only PUBLIC, ""static"", or ""final"". Other modifiers are
	# disallowed.
	;
abstract_method_declaration 
	: method_header "";"" 'semicolon' {{AbstractMethodDeclaration}}
	;
# 19.10) Arrays
array_initializer 
	: ""{"" 'leftBrace' variable_initializers "","" 'comma' ""}"" 'rightBrace' {{ArrayInitializer}}
	| ""{"" 'leftBrace' variable_initializers ""}"" 'rightBrace' {{ArrayInitializer}}
	| ""{"" 'leftBrace' "","" 'comma' ""}"" 'rightBrace' {{ArrayInitializer}}
	| ""{"" 'leftBrace' ""}"" 'rightBrace' {{ArrayInitializer}}
	;
variable_initializers 
	: variable_initializer 'initializer' 
	| variable_initializers "","" 'comma' variable_initializer 'initializer'
	;
# 19.11) Blocks and Statements
block 
	:	""{"" 'leftBrace' block_statements_opt ""}"" 'rightBrace' {{Block}}
	;
block_statements_opt 
	: 
	| block_statements 
	;
block_statements 
	: block_statement 'statement' 
	| block_statements block_statement 'statement' 
	;
block_statement 
	: local_variable_declaration_statement 
	| statement 
	| class_declaration 
	| interface_declaration 
	;
local_variable_declaration_statement 
	: local_variable_declaration 'declaration' "";"" 'semicolon' {{LocalVariableDeclarationStatement}}
	;
local_variable_declaration 
	: variable_modifiers type 'type' variable_declarators {{LocalVariableDeclaration}}
	;
statement 
	: statement_without_trailing_substatement 
	| labeled_statement 
	| if_then_statement 
	| if_then_else_statement 
	| while_statement 
	| for_statement
	| foreach_statement
	;
statement_without_trailing_substatement 
	: block 
	| empty_statement 
	| expression_statement 
	| switch_statement 
	| do_statement 
	| break_statement 
	| continue_statement 
	| return_statement 
	| synchronized_statement 
	| throw_statement 
	| try_statement 
	| assert_statement
	;
empty_statement 
	: "";"" 'semicolon' {{EmptyStatement}}
	;
labeled_statement 
	: <IDENTIFIER> 'identifier' "":"" 'colon' statement 'statement' {{LabeledStatement}}
	;
expression_statement 
	: statement_expression 'expression' "";"" 'semicolon' {{ExpressionStatement}}
	;
statement_expression 
	: assignment 
	| preincrement_expression 
	| predecrement_expression 
	| postincrement_expression 
	| postdecrement_expression 
	| method_invocation 
	| class_instance_creation_expression 
	;
if_then_statement 
	: ""if"" 'ifToken' ""("" 'leftParen' expression 'expression' "")"" 'rightParen' statement 'trueStatement' {{IfStatement}}
	;
if_then_else_statement 
	: ""if"" 'ifToken' ""("" 'leftParen' expression 'expression' "")"" 'rightParen' statement 'trueStatement'
			""else"" 'elseToken' statement 'falseStatement' {{IfElseStatement}}
	;
switch_statement 
	: ""switch"" 'switchToken' ""("" 'leftParen' expression 'expression' "")"" 'rightParen' switch_block 'block' {{SwitchStatement}}
	;
switch_block 
	: ""{"" 'leftBrace' switch_block_statement_groups switch_labels ""}"" 'rightBrace' {{SwitchBlock}}
	| ""{"" 'leftBrace' switch_block_statement_groups ""}"" 'rightBrace' {{SwitchBlock}}
	| ""{"" 'leftBrace' switch_labels ""}"" 'rightBrace' {{SwitchBlock}}
	| ""{"" 'leftBrace' ""}"" 'rightBrace' {{SwitchBlock}}
	;
switch_block_statement_groups 
	: switch_block_statement_group 'statementGroup' 
	| switch_block_statement_groups switch_block_statement_group 'statementGroup' 
	;
switch_block_statement_group 
	: switch_labels block_statements {{SwitchBlockStatementGroup}}
	;
switch_labels 
	: switch_label 'label' 
	| switch_labels switch_label 'label'
	;
switch_label 
	: ""case"" 'caseToken' constant_expression 'constant' "":"" 'colon' {{SwitchLabel}}
	| ""default"" 'defaultToken' "":"" 'colon' {{DefaultLabel}}
	;
while_statement 
	: ""while"" 'whileToken' ""("" 'leftParen' expression 'expression' "")"" 'rightParen' statement 'statement' {{WhileStatement}}
	;
do_statement 
	: ""do"" 'doToken' statement 'statement' ""while"" 'whileToken' ""("" 'leftParen' expression 'expression' "")"" 'rightParen' "";"" 'semicolon' {{DoWhileStatement}}
	;
for_statement 
	: ""for"" 'forToken' ""("" 'leftParen' for_init_opt 'initial' "";"" 'firstSemicolon' expression_opt 'test' "";"" 'secondSemicolon'
			for_update_opt 'update' "")"" 'rightParen' statement 'statement' {{ForStatement}}
	;
for_init_opt 
	: 
	| for_init 
	;
for_init 
	: statement_expression_list 
	| local_variable_declaration 
	;
for_update_opt 
	: 
	| for_update 
	;
for_update 
	: statement_expression_list 
	;
statement_expression_list 
	: statement_expression 'expression' {{StatementExpressionList}}
	| statement_expression_list "","" 'comma' statement_expression 'expression' {{StatementExpressionList}}
	;
identifier_opt 
	: 
	| <IDENTIFIER> 
	;
break_statement 
	: ""break"" 'breakToken' identifier_opt 'identifier' "";"" 'semicolon' {{BreakStatement}}
	;
continue_statement 
	: ""continue"" 'continueToken' identifier_opt 'identifier' "";"" 'semicolon' {{ContinueStatement}}
	;
return_statement 
	: ""return"" 'returnToken' expression_opt 'expression' "";"" 'semicolon' {{ReturnStatement}}
	;
throw_statement 
	: ""throw"" 'throwToken' expression 'expression' "";"" 'semicolon' {{ThrowStatement}}
	;
synchronized_statement 
	: ""synchronized"" 'synchronizedToken' ""("" 'leftParen' expression 'expression' "")"" 'rightParen' block 'block' {{SynchronizedStatement}}
	;
try_statement 
	: ""try"" 'tryToken' try_resources_opt block 'block' catches {{TryStatement}}
	| ""try"" 'tryToken' try_resources_opt block 'block' catches_opt finally 'finally' {{TryStatement}}
	;
try_resources_opt
	:
	| ""("" 'leftParen' try_resources semicolon_opt "")"" 'rightParen'
	;
try_resources
	: try_resource 'resource'
	| try_resources "";"" 'semicolon' try_resource 'resource' 
	;
try_resource
	: variable_modifiers type 'type' initialized_variable_declarator 'variableDeclaration' {{LocalVariableDeclaration}}
	;
semicolon_opt
	:
	| "";"" 'semicolon'
	;
catches_opt 
	: 
	| catches 
	;
catches 
	: catch_clause 'catch'
	| catches catch_clause 'catch'
	;
catch_clause 
	: ""catch"" 'catchToken' ""("" 'leftParen' formal_parameter 'parameter' "")"" 'rightParen' block 'block' {{CatchClause}}
	;
finally 
	: ""finally"" 'finallyToken' block 'block' {{FinallyClause}}
	;
assert_statement
	: ""assert"" 'assertToken' expression 'testExpression' "";"" 'semicolon' {{AssertStatement}}
	| ""assert"" 'assertToken' expression 'testExpression' "":"" 'colon' expression 'messageExpression' "";"" 'semicolon' {{AssertStatement}}
	;
# 19.12) Expressions
primary 
	: primary_no_new_array 
	| array_creation_expression 
	;
primary_no_new_array 
	: literal 
	| ""this"" 'name' {{Name}}
	| ""("" '_leftParen' expression "")"" '_rightParen' {{Expression}}
	| class_instance_creation_expression 
	| field_access 
	| method_invocation 
	| array_access 
	| primitive_type 'type' ""."" 'period' ""class"" 'classToken' {{ClassProperty}}
	| void 'type' ""."" 'period' ""class"" 'classToken' {{ClassProperty}}
	| array_type 'type' ""."" 'period' ""class"" 'classToken' {{ClassProperty}}
	| name 'name' ""."" 'period' ""class"" 'classToken' {{ClassProperty}} ###???
	| name 'name' ""."" 'period' ""this"" 'thisToken' {{ClassProperty}} ###???
	;
lambda_expression
	: lambda_parameters ""->"" 'arrowToken' lambda_function {{LambdaExpression}}
	;
lambda_parameters
	: ""("" 'leftParen' lambda_parameter_list_opt "")"" 'rightParen' 
	| untyped_lambda_parameter 'parameter'
	;
lambda_parameter_list_opt
	:
	| lambda_parameter_list
	;
lambda_parameter_list
	: lambda_parameter 'parameter'
	| lambda_parameter_list "","" 'comma' lambda_parameter 'parameter'
	;
lambda_parameter
	: formal_parameter
	| untyped_lambda_parameter
	;
untyped_lambda_parameter
	: variable_declarator_id 'variable' {{Parameter}}
	;
lambda_function
	: block 'value'
	| expression 'value'
	;
method_reference_expression
	: assignment_expression
	| assignment_expression 'receiver' ""::"" 'colonColonToken' <IDENTIFIER> 'name' {{MethodReference}}
	;
class_instance_creation_expression 
	: ""new"" 'newToken' class_type 'type' ""("" 'leftParen' argument_list_opt "")"" 'rightParen' {{New}}
	| ""new"" 'newToken' class_type 'type' ""("" 'leftParen' argument_list_opt "")"" 'rightParen' class_body {{NewClass}}
	| primary_or_name 'primary' ""."" 'period' ""new"" 'newToken' type_arguments_opt <IDENTIFIER> 'name' 
			type_arguments_or_diamond_opt ""("" 'leftParen' argument_list_opt "")"" 'rightParen' {{New}}
	| primary_or_name 'primary' ""."" 'period' ""new"" 'newToken' type_arguments_opt <IDENTIFIER> 'name' 
			type_arguments_or_diamond_opt ""("" 'leftParen' argument_list_opt "")"" 'rightParen' class_body {{NewClass}}
	;
argument_list_opt 
	: 
	| argument_list 
	;
argument_list 
	: expression 'expression' 
	| argument_list "","" 'comma' expression 'expression'
	;
array_creation_expression 
	: ""new"" 'newToken' primitive_type 'type' dim_exprs dims_opt {{NewArray}}
	| ""new"" 'newToken' class_or_interface_type 'type' dim_exprs dims_opt {{NewArray}}
	| ""new"" 'newToken' primitive_type 'type' dims array_initializer 'initializer' {{NewArray}}
	| ""new"" 'newToken' class_or_interface_type 'type' dims array_initializer 'initializer' {{NewArray}}
	;
dim_exprs 
	: dim_expr 'dimExpression' 
	| dim_exprs dim_expr 'dimExpression' 
	;
dim_expr 
	: ""["" 'leftBracket' expression 'expression' ""]"" 'rightBracket' {{DimensionExpression}}
	;
dims_opt 
	: 
	| dims 
	;
dims 
	: empty_dim_expr
	| dims empty_dim_expr
	;
empty_dim_expr
	: ""["" 'leftBracket' ""]"" 'rightBracket'
	;
field_access 
	: primary 'receiver' ""."" 'period' <IDENTIFIER> 'name' {{FieldAccess}}
	| ""super"" 'superToken' ""."" 'period' <IDENTIFIER> 'name' {{FieldAccess}}
	| name 'receiver' ""."" 'superPeriod' ""super"" 'superToken' ""."" 'period' <IDENTIFIER> 'name' {{FieldAccess}}###???
	;
method_invocation 
	: type_arguments_opt <IDENTIFIER> 'name' ""("" 'leftParen' argument_list_opt "")"" 'rightParen' {{MethodInvocation}}
	| primary_or_name 'receiver' ""."" 'period' type_arguments_opt <IDENTIFIER> 'name' ""("" 'leftParen' argument_list_opt "")"" 'rightParen' {{MethodInvocation}}
	| ""super"" 'superToken' ""."" 'period' type_arguments_opt <IDENTIFIER> 'name' ""("" 'leftParen' argument_list_opt "")"" 'rightParen' {{MethodInvocation}}
	| name 'receiver' ""."" 'superPeriod' ""super"" 'superToken' ""."" 'period' type_arguments_opt <IDENTIFIER> 'name' ""("" 'leftParen' argument_list_opt "")"" 'rightParen' {{MethodInvocation}}
	;
array_access 
	: name 'array' ""["" 'leftBracket' expression 'expression' ""]"" 'rightBracket' {{ArrayAccess}}
	| primary_no_new_array 'array' ""["" 'leftBracket' expression 'expression' ""]"" 'rightBracket' {{ArrayAccess}}
	;
postfix_expression 
	: primary 
	| name 
	| postincrement_expression 
	| postdecrement_expression 
	;
postincrement_expression 
	: postfix_expression 'expression' ""++"" 'plusPlus' {{PostIncrementExpression}}
	;
postdecrement_expression 
	: postfix_expression 'expression' ""--"" 'minusMinus' {{PostDecrementExpression}}
	;
unary_expression 
	: preincrement_expression 
	| predecrement_expression 
	| ""+"" 'plus' unary_expression 'expression' {{UnaryAddition}}
	| ""-"" 'minus' unary_expression 'expression' {{UnarySubtraction}}
	| unary_expression_not_plus_minus 
| assignment # HACK for VAGEN
	;
preincrement_expression 
	: ""++"" 'plusPlus' unary_expression 'expression' {{PreIncrementExpression}}
	;
predecrement_expression 
	: ""--"" 'minusMinus' unary_expression 'expression' {{PreDecrementExpression}}
	;
unary_expression_not_plus_minus 
	: postfix_expression 
	| ""~"" 'tilde' unary_expression 'expression' {{UnaryBitInvert}}
	| ""!"" 'bang' unary_expression 'expression' {{UnaryNot}}
	| cast_expression 
	;
cast_expression 
	: ""("" 'leftParen' type 'type' "")"" 'rightParen' unary_expression_not_plus_minus 'expression' {{CastExpression}}
	;
multiplicative_expression 
	: unary_expression 
	| multiplicative_expression 'leftExpression' ""*"" 'op' unary_expression 'rightExpression' {{BinaryExpression}}
	| multiplicative_expression 'leftExpression' ""/"" 'op' unary_expression 'rightExpression' {{BinaryExpression}}
	| multiplicative_expression 'leftExpression' ""%"" 'op' unary_expression 'rightExpression' {{BinaryExpression}}
	;
additive_expression 
	: multiplicative_expression 
	| additive_expression 'leftExpression' ""+"" 'op' multiplicative_expression 'rightExpression' {{BinaryExpression}}
	| additive_expression 'leftExpression' ""-"" 'op' multiplicative_expression 'rightExpression' {{BinaryExpression}}
	;
shift_expression 
	: additive_expression 
	| shift_expression 'leftExpression' ""<<"" 'op' additive_expression 'rightExpression' {{BinaryExpression}}
	| shift_expression 'leftExpression' <SIGNED_RIGHT_SHIFT> 'op' additive_expression 'rightExpression' {{BinaryExpression}}
	| shift_expression 'leftExpression' <UNSIGNED_RIGHT_SHIFT> 'op' additive_expression 'rightExpression' {{BinaryExpression}}
	;
relational_expression 
	: shift_expression 
	| relational_expression 'leftExpression' ""<"" 'op' shift_expression 'rightExpression' {{BinaryExpression}}
	| relational_expression 'leftExpression' <GREATER_THAN> 'op' shift_expression 'rightExpression' {{BinaryExpression}}
	| relational_expression 'leftExpression' ""<="" 'op' shift_expression 'rightExpression' {{BinaryExpression}}
	| relational_expression 'leftExpression' "">="" 'op' shift_expression 'rightExpression' {{BinaryExpression}}
	| relational_expression 'leftExpression' ""instanceof"" 'op' reference_type 'rightExpression' {{BinaryExpression}}
	;
equality_expression 
	: relational_expression 
	| equality_expression 'leftExpression' ""=="" 'op' relational_expression 'rightExpression' {{BinaryExpression}}
	| equality_expression 'leftExpression' ""!="" 'op' relational_expression 'rightExpression' {{BinaryExpression}}
	;
and_expression 
	: equality_expression 
	| and_expression 'leftExpression' ""&"" 'op' equality_expression 'rightExpression' {{BinaryExpression}}
	;
exclusive_or_expression 
	: and_expression 
	| exclusive_or_expression 'leftExpression' ""^"" 'op' and_expression 'rightExpression' {{BinaryExpression}}
	;
inclusive_or_expression 
	: exclusive_or_expression 
	| inclusive_or_expression 'leftExpression' ""|"" 'op' exclusive_or_expression 'rightExpression' {{BinaryExpression}}
	;
conditional_and_expression 
	: inclusive_or_expression 
	| conditional_and_expression 'leftExpression' ""&&"" 'op' inclusive_or_expression 'rightExpression' {{BinaryExpression}}
	;
conditional_or_expression 
	: conditional_and_expression 
	| conditional_or_expression 'leftExpression' ""||"" 'op' conditional_and_expression 'rightExpression' {{BinaryExpression}}
	;
conditional_expression 
	: conditional_or_expression 
	| conditional_or_expression 'testExpression' ""?"" 'questionMark' expression 'trueExpression'
			"":"" 'colon' conditional_expression 'falseExpression' {{ConditionalExpression}}
	;
assignment_expression 
	: conditional_expression 
	| assignment 
	;
assignment 
	: left_hand_side 'variable' assignment_operator 'op' expression 'value' {{Assignment}}
	;
left_hand_side 
	: name 
	| field_access 
	| array_access 
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
	| "">>>="" 
	| ""&="" 
	| ""^="" 
	| ""|="" 
	;
expression_opt 
	: 
	| expression 
	;
expression 
	: method_reference_expression 
	| lambda_expression
	;
constant_expression 
	: expression 
	;
####
annotations
	:
	| annotations annotation 'annotation'
	;
annotation
	: ""@"" 'at' name 'name' annotation_args_opt {{Annotation}}
	;
annotation_args_opt
	:
	| ""("" 'leftParen' annotation_args "")"" 'rightParen'
	;
annotation_args
	: 
	| elementValuePairs
	| elementValue 'value'
	;
elementValuePairs
	: elementValuePair 'value'
	| elementValuePairs "","" 'comma' elementValuePair 'value'
	;
elementValuePair
	: <IDENTIFIER> 'name' ""="" 'equals' elementValue 'value' {{ElementValuePair}}
	;
elementValue
	: conditional_expression
	| annotation
	| elementValueArrayInitializer
	;
elementValueArrayInitializer
	: ""{"" 'leftBrace' elementValues_opt comma_opt ""}"" 'rightBrace' {{ElementArrayInitializer}}
	;
elementValues_opt
	:
	| elementValues
	;
elementValues
	: elementValue 'value'
	| elementValues "","" 'comma' elementValue 'value'
	;
comma_opt
	:
	| "","" 'comma'
	;
static_opt
	:
	| ""static"" 'staticToken'
	;
enum_declaration
	: modifiers_opt ""enum"" 'enumToken' <IDENTIFIER> 'name' interfaces_opt enum_body {{EnumDeclaration}}
	;
enum_body
	: ""{"" 'leftBrace' enum_constants_opt comma_opt enum_body_declarations_opt ""}"" 'rightBrace'
	;
enum_constants_opt
	:
	| enum_constants
	;
enum_constants
	: enum_constant 'constant'
	| enum_constants "","" 'comma' enum_constant 'constant'
	;
enum_constant
	: annotations <IDENTIFIER> 'name' arguments_opt class_body_opt {{EnumConstant}}
	;
arguments_opt
	:
	| ""("" 'leftParen' argument_list_opt "")"" 'rightParen'
	;
class_body_opt
	:
	| class_body
	;
enum_body_declarations_opt
	:
	| enum_body_declarations
	;
enum_body_declarations
	: "";"" 'semicolon' class_body_declarations_opt
	;
type_parameters_opt
	:
	| ""<"" 'lt' type_parameters <GREATER_THAN> 'gt' {{TypeParameters}}
	;
type_parameters
	: type_parameter 'parameter'
	| type_parameters "","" 'comma' type_parameter 'parameter'
	;
type_parameter
	: <IDENTIFIER> 'name' extends_type_parameter_opt {{TypeParameter}}
	;
extends_type_parameter_opt
	:
	| ""extends"" 'extendsToken' type_bound 
	;
type_bound
	: type 'type'
	| type_bound ""&"" 'amp' type 'type'
	;
type_arguments_or_diamond_opt
	:
	| ""<"" 'typeArgLeft' type_arguments <GREATER_THAN> 'typeArgRight'
	| ""<"" 'typeArgLeft'  <GREATER_THAN> 'typeArgRight'
	;
type_arguments_opt
	:
	| ""<"" 'lt' type_arguments <GREATER_THAN> 'gt'
	| ""<"" 'lt'  <GREATER_THAN> 'gt'
	;
type_arguments
	: type_argument 'argument'
	| type_arguments "","" 'comma' type_argument 'argument'
	;
type_argument
	: type 'type' {{TypeArgument}}
	| ""?"" 'questionMark' type_argument_type {{TypeArgument}}
	;
type_argument_type
	: ""extends"" 'token' type 'type'
	| ""super"" 'token' type 'type'
	|
	;
type_name
	: simple_type_name 
	| qualified_type_name 
	;
simple_type_name 
	: <IDENTIFIER> 'name' type_arguments_opt {{TypeName}}
	;
qualified_type_name 
	: type_name 'nspace' ""."" 'period' <IDENTIFIER> 'name' type_arguments_opt {{QualifiedTypeName}}
	;
foreach_statement 
	: ""for"" 'forToken' ""("" 'leftParen' variable_modifiers type 'type' variable_declarator_id 'name' "":"" 'colon' expression 'expression' "")"" 'rightParen' statement 'statement' {{ForEachStatement}}
	;
variable_modifiers
	: 
	| variable_modifiers variable_modifier 'modifier'
	;
variable_modifier
	: ""final"" 'token' {{Modifier}}
	| annotation
	;
primary_or_name
	: primary
	| name
	;"
]

{ #category : #'generated-accessing' }
JavaParser class >> scannerClass [
	^JavaScanner
]

{ #category : #generated }
JavaParser class >> startingStateForblock_statement [
	^ 2
]

{ #category : #generated }
JavaParser class >> startingStateForexpression [
	^ 3
]

{ #category : #generated }
JavaParser class >> startingStateForgoal [
	^ 1
]

{ #category : #generated }
JavaParser class >> startingStateFortype_declaration [
	^ 4
]

{ #category : #generated }
JavaParser >> ambiguousTransitions [
^#(
#[ 0 6 0 10] 
#[ 0 18 0 77] 
#[ 0 18 0 81] 
#[ 0 18 0 85] 
#[ 0 18 0 89] 
#[ 0 18 0 93] 
#[ 0 18 0 97] 
#[ 0 18 0 101] 
#[ 0 18 0 105] 
#[ 0 18 0 117] 
#[ 0 18 0 149] 
#[ 0 18 0 22 0 229] 
#[ 0 22 1 241] 
#[ 0 14 0 149] 
#[ 0 22 0 229] 
#[ 0 22 3 65] 
#[ 0 22 0 126] 
#[ 0 154 3 121] 
#[ 0 149 0 162] 
#[ 0 154 3 161] 
#[ 0 18 0 22 1 241] 
#[ 0 22 0 126 0 202] 
#[ 0 126 0 202] 
#[ 0 126 0 153] 
#[ 0 210 0 214] 
#[ 0 226 4 49] 
#[ 0 238 4 53] 
#[ 0 238 4 57] 
#[ 0 238 4 61] 
#[ 0 242 4 65] 
#[ 0 242 4 69] 
#[ 0 246 4 73] 
#[ 0 246 4 77] 
#[ 0 246 4 81] 
#[ 0 250 4 85] 
#[ 0 250 4 89] 
#[ 0 250 4 93] 
#[ 0 250 4 97] 
#[ 0 250 4 101] 
#[ 0 254 4 105] 
#[ 0 254 4 109] 
#[ 1 2 4 113] 
#[ 1 6 4 117] 
#[ 1 10 4 121] 
#[ 1 14 4 125] 
#[ 1 18 4 129] 
#[ 1 18 4 133] 
#[ 0 22 4 185] 
#[ 0 22 0 153] 
#[ 0 18 0 22 3 65] 
#[ 0 22 6 85] 
#[ 0 18 5 137] 
#[ 2 130 4 53] 
#[ 2 130 4 57] 
#[ 2 130 4 61] 
#[ 2 134 4 65] 
#[ 2 134 4 69] 
#[ 2 138 4 73] 
#[ 2 138 4 77] 
#[ 2 138 4 81] 
#[ 2 142 4 85] 
#[ 2 142 4 89] 
#[ 2 142 4 93] 
#[ 2 142 4 97] 
#[ 2 142 4 101] 
#[ 2 146 4 105] 
#[ 2 146 4 109] 
#[ 2 150 4 113] 
#[ 2 154 4 117] 
#[ 2 158 4 121] 
#[ 2 162 4 125] 
#[ 0 126 7 109] 
#[ 0 22 7 213] 
#[ 3 42 8 105] 
#[ 3 238 9 197] 
#[ 0 77 2 74] 
#[ 0 81 2 74] 
#[ 0 85 2 74] 
#[ 0 89 2 74] 
#[ 0 93 2 74] 
#[ 0 97 2 74] 
#[ 0 101 2 74] 
#[ 0 105 2 74] 
#[ 2 74 2 213] 
#[ 0 154 11 89]
	).
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForabstract_method_declaration1: nodes [
	| result |
	result := JavaAbstractMethodDeclarationNode new.
	result addNodes: ((nodes at: 1) at: 1) to: result modifiers.
	result typeParameters: ((nodes at: 1) at: 2).
	result type: ((nodes at: 1) at: 3).
	result declarator: ((nodes at: 1) at: 4).
	result throws: ((nodes at: 1) at: 5).
	result semicolon: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForannotation1: nodes [
	| result |
	result := JavaAnnotationNode new.
	result _at: (nodes at: 1).
	result name: (nodes at: 2).
	result leftParen: ((nodes at: 3) at: 1).
	result addNodes: ((nodes at: 3) at: 2) to: result values.
	result addTokens: ((nodes at: 3) at: 3) to: result commas.
	result rightParen: ((nodes at: 3) at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForannotation_interface_body1: nodes [
	| result |
	result := Array new: 3.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: (nodes at: 2) to: (result at: 2).
	result at: 3 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForannotation_interface_declaration1: nodes [
	| result |
	result := JavaAnnotationInterfaceNode new.
	result addNodes: (nodes at: 1) to: result modifiers.
	result atToken: (nodes at: 2).
	result interfaceToken: (nodes at: 3).
	result name: (nodes at: 4).
	result leftBrace: ((nodes at: 5) at: 1).
	result addNodes: ((nodes at: 5) at: 2) to: result declarations.
	result rightBrace: ((nodes at: 5) at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForannotation_method_declaration3: nodes [
	| result |
	result := JavaAnnotationMethodDeclarationNode new.
	result addNodes: ((nodes at: 1) at: 1) to: result modifiers.
	result typeParameters: ((nodes at: 1) at: 2).
	result type: ((nodes at: 1) at: 3).
	result declarator: ((nodes at: 1) at: 4).
	result throws: ((nodes at: 1) at: 5).
	result defaultToken: (nodes at: 2).
	result value: (nodes at: 3).
	result semicolon: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForannotations1: nodes [
	| result |
	result := OrderedCollection new: 2.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForannotations2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: result.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForarray_access1: nodes [
	| result |
	result := JavaArrayAccessNode new.
	result array: (nodes at: 1).
	result leftBracket: (nodes at: 2).
	result expression: (nodes at: 3).
	result rightBracket: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForarray_creation_expression1: nodes [
	| result |
	result := JavaNewArrayNode new.
	result newToken: (nodes at: 1).
	result type: (nodes at: 2).
	result addNodes: (nodes at: 3) to: result dimExpressions.
	result addTokens: ((nodes at: 4) at: 1) to: result leftBrackets.
	result addTokens: ((nodes at: 4) at: 2) to: result rightBrackets.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForarray_creation_expression3: nodes [
	| result |
	result := JavaNewArrayNode new.
	result newToken: (nodes at: 1).
	result type: (nodes at: 2).
	result addTokens: ((nodes at: 3) at: 1) to: result leftBrackets.
	result addTokens: ((nodes at: 3) at: 2) to: result rightBrackets.
	result initializer: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForarray_initializer1: nodes [
	| result |
	result := JavaArrayInitializerNode new.
	result leftBrace: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result initializers.
	result addTokens: ((nodes at: 2) at: 2) to: result commas.
	result addToken: (nodes at: 3) to: result commas.
	result rightBrace: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForarray_initializer2: nodes [
	| result |
	result := JavaArrayInitializerNode new.
	result leftBrace: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result initializers.
	result addTokens: ((nodes at: 2) at: 2) to: result commas.
	result rightBrace: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForarray_initializer3: nodes [
	| result |
	result := JavaArrayInitializerNode new.
	result leftBrace: (nodes at: 1).
	result addToken: (nodes at: 2) to: result commas.
	result rightBrace: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForarray_initializer4: nodes [
	| result |
	result := JavaArrayInitializerNode new.
	result leftBrace: (nodes at: 1).
	result rightBrace: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForarray_type1: nodes [
	| result |
	result := JavaArrayTypeNode new.
	result baseType: (nodes at: 1).
	result addTokens: ((nodes at: 2) at: 1) to: result leftBrackets.
	result addTokens: ((nodes at: 2) at: 2) to: result rightBrackets.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForassert_statement1: nodes [
	| result |
	result := JavaAssertStatementNode new.
	result assertToken: (nodes at: 1).
	result testExpression: (nodes at: 2).
	result semicolon: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForassert_statement2: nodes [
	| result |
	result := JavaAssertStatementNode new.
	result assertToken: (nodes at: 1).
	result testExpression: (nodes at: 2).
	result colon: (nodes at: 3).
	result messageExpression: (nodes at: 4).
	result semicolon: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForassignment1: nodes [
	| result |
	result := JavaAssignmentNode new.
	result variable: (nodes at: 1).
	result op: (nodes at: 2).
	result value: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForblock1: nodes [
	| result |
	result := JavaBlockNode new.
	result leftBrace: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result statements.
	result rightBrace: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForbreak_statement1: nodes [
	| result |
	result := JavaBreakStatementNode new.
	result breakToken: (nodes at: 1).
	result identifier: (nodes at: 2).
	result semicolon: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForcast_expression1: nodes [
	| result |
	result := JavaCastExpressionNode new.
	result leftParen: (nodes at: 1).
	result type: (nodes at: 2).
	result rightParen: (nodes at: 3).
	result expression: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForcatch_clause1: nodes [
	| result |
	result := JavaCatchClauseNode new.
	result catchToken: (nodes at: 1).
	result leftParen: (nodes at: 2).
	result parameter: (nodes at: 3).
	result rightParen: (nodes at: 4).
	result block: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForclass_body_opt1: nodes [
	| result |
	result := Array new: 3.
	result at: 2 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForclass_declaration1: nodes [
	| result |
	result := JavaClassDeclarationNode new.
	result addNodes: (nodes at: 1) to: result modifiers.
	result classToken: (nodes at: 2).
	result name: (nodes at: 3).
	result typeParameters: (nodes at: 4).
	result extendsToken: ((nodes at: 5) at: 1).
	result superclass: ((nodes at: 5) at: 2).
	result implementsToken: ((nodes at: 6) at: 1).
	result addNodes: ((nodes at: 6) at: 2) to: result interfaces.
	result addTokens: ((nodes at: 6) at: 3) to: result commas.
	result leftBrace: ((nodes at: 7) at: 1).
	result addNodes: ((nodes at: 7) at: 2) to: result declarations.
	result rightBrace: ((nodes at: 7) at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForclass_instance_creation_expression1: nodes [
	| result |
	result := JavaNewNode new.
	result newToken: (nodes at: 1).
	result type: (nodes at: 2).
	result leftParen: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result expressions.
	result addTokens: ((nodes at: 4) at: 2) to: result commas.
	result rightParen: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForclass_instance_creation_expression2: nodes [
	| result |
	result := JavaNewClassNode new.
	result newToken: (nodes at: 1).
	result type: (nodes at: 2).
	result leftParen: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result expressions.
	result addTokens: ((nodes at: 4) at: 2) to: result commas.
	result rightParen: (nodes at: 5).
	result leftBrace: ((nodes at: 6) at: 1).
	result addNodes: ((nodes at: 6) at: 2) to: result declarations.
	result rightBrace: ((nodes at: 6) at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForclass_instance_creation_expression3: nodes [
	| result |
	result := JavaNewNode new.
	result primary: (nodes at: 1).
	result period: (nodes at: 2).
	result newToken: (nodes at: 3).
	result lt: ((nodes at: 4) at: 1).
	result addNodes: ((nodes at: 4) at: 2) to: result arguments.
	result addTokens: ((nodes at: 4) at: 3) to: result commas.
	result gt: ((nodes at: 4) at: 4).
	result name: (nodes at: 5).
	result typeArgLeft: ((nodes at: 6) at: 1).
	result addNodes: ((nodes at: 6) at: 2) to: result arguments.
	result addTokens: ((nodes at: 6) at: 3) to: result commas.
	result typeArgRight: ((nodes at: 6) at: 4).
	result leftParen: (nodes at: 7).
	result addNodes: ((nodes at: 8) at: 1) to: result expressions.
	result addTokens: ((nodes at: 8) at: 2) to: result commas.
	result rightParen: (nodes at: 9).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForclass_instance_creation_expression4: nodes [
	| result |
	result := JavaNewClassNode new.
	result primary: (nodes at: 1).
	result period: (nodes at: 2).
	result newToken: (nodes at: 3).
	result lt: ((nodes at: 4) at: 1).
	result addNodes: ((nodes at: 4) at: 2) to: result arguments.
	result addTokens: ((nodes at: 4) at: 3) to: result commas.
	result gt: ((nodes at: 4) at: 4).
	result name: (nodes at: 5).
	result typeArgLeft: ((nodes at: 6) at: 1).
	result addNodes: ((nodes at: 6) at: 2) to: result arguments.
	result addTokens: ((nodes at: 6) at: 3) to: result commas.
	result typeArgRight: ((nodes at: 6) at: 4).
	result leftParen: (nodes at: 7).
	result addNodes: ((nodes at: 8) at: 1) to: result expressions.
	result addTokens: ((nodes at: 8) at: 2) to: result commas.
	result rightParen: (nodes at: 9).
	result leftBrace: ((nodes at: 10) at: 1).
	result addNodes: ((nodes at: 10) at: 2) to: result declarations.
	result rightBrace: ((nodes at: 10) at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForclass_or_interface_type1: nodes [
	| result |
	result := JavaClassTypeNode new.
	result name: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForcompilation_unit1: nodes [
	| result |
	result := JavaProgramFileNode new.
	result packageDeclaration: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result imports.
	result addNodes: (nodes at: 3) to: result typeDeclarations.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForconditional_expression2: nodes [
	| result |
	result := JavaConditionalExpressionNode new.
	result testExpression: (nodes at: 1).
	result questionMark: (nodes at: 2).
	result trueExpression: (nodes at: 3).
	result colon: (nodes at: 4).
	result falseExpression: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForconstructor_body1: nodes [
	| result |
	result := JavaConstructorBodyNode new.
	result leftBrace: (nodes at: 1).
	result constructorInvocation: (nodes at: 2).
	result addNodes: (nodes at: 3) to: result statements.
	result rightBrace: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForconstructor_body2: nodes [
	| result |
	result := JavaConstructorBodyNode new.
	result leftBrace: (nodes at: 1).
	result constructorInvocation: (nodes at: 2).
	result rightBrace: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForconstructor_body3: nodes [
	| result |
	result := JavaConstructorBodyNode new.
	result leftBrace: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result statements.
	result rightBrace: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForconstructor_body4: nodes [
	| result |
	result := JavaConstructorBodyNode new.
	result leftBrace: (nodes at: 1).
	result rightBrace: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForconstructor_declaration1: nodes [
	| result |
	result := JavaConstructorDeclarationNode new.
	result addNodes: (nodes at: 1) to: result modifiers.
	result typeParameters: ((nodes at: 2) at: 1).
	result name: ((nodes at: 2) at: 2).
	result leftParen: ((nodes at: 2) at: 3).
	result addNodes: ((nodes at: 2) at: 4) to: result parameters.
	result addTokens: ((nodes at: 2) at: 5) to: result commas.
	result rightParen: ((nodes at: 2) at: 6).
	result throws: (nodes at: 3).
	result body: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForconstructor_declarator1: nodes [
	| result |
	result := Array new: 6.
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
JavaParser >> reduceActionForcontinue_statement1: nodes [
	| result |
	result := JavaContinueStatementNode new.
	result continueToken: (nodes at: 1).
	result identifier: (nodes at: 2).
	result semicolon: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFordim_expr1: nodes [
	| result |
	result := JavaDimensionExpressionNode new.
	result leftBracket: (nodes at: 1).
	result expression: (nodes at: 2).
	result rightBracket: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFordims1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	self add: ((nodes at: 1) at: 1) to: (result at: 1).
	self add: ((nodes at: 1) at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFordims2: nodes [
	| result |
	result := nodes at: 1.
	self add: ((nodes at: 2) at: 1) to: (result at: 1).
	self add: ((nodes at: 2) at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFordo_statement1: nodes [
	| result |
	result := JavaDoWhileStatementNode new.
	result doToken: (nodes at: 1).
	result statement: (nodes at: 2).
	result whileToken: (nodes at: 3).
	result leftParen: (nodes at: 4).
	result expression: (nodes at: 5).
	result rightParen: (nodes at: 6).
	result semicolon: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForelementValueArrayInitializer1: nodes [
	| result |
	result := JavaElementArrayInitializerNode new.
	result leftBrace: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result values.
	result addTokens: ((nodes at: 2) at: 2) to: result commas.
	result addToken: (nodes at: 3) to: result commas.
	result rightBrace: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForelementValuePair1: nodes [
	| result |
	result := JavaElementValuePairNode new.
	result name: (nodes at: 1).
	result equals: (nodes at: 2).
	result value: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForempty_dim_expr1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForempty_statement1: nodes [
	| result |
	result := JavaEmptyStatementNode new.
	result semicolon: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForenum_body1: nodes [
	| result |
	result := Array new: 6.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 3).
	self add: (nodes at: 3) to: (result at: 3).
	result at: 4 put: ((nodes at: 4) at: 1).
	self addAll: ((nodes at: 4) at: 2) to: (result at: 5).
	result at: 6 put: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForenum_body_declarations1: nodes [
	| result |
	result := Array new: 2.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self addAll: (nodes at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForenum_body_declarations_opt1: nodes [
	| result |
	result := Array new: 2.
	result at: 2 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForenum_constant1: nodes [
	| result |
	result := JavaEnumConstantNode new.
	result addNodes: (nodes at: 1) to: result annotations.
	result name: (nodes at: 2).
	result leftParen: ((nodes at: 3) at: 1).
	result addNodes: ((nodes at: 3) at: 2) to: result expressions.
	result addTokens: ((nodes at: 3) at: 3) to: result commas.
	result rightParen: ((nodes at: 3) at: 4).
	result leftBrace: ((nodes at: 4) at: 1).
	result addNodes: ((nodes at: 4) at: 2) to: result declarations.
	result rightBrace: ((nodes at: 4) at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForenum_declaration1: nodes [
	| result |
	result := JavaEnumDeclarationNode new.
	result addNodes: (nodes at: 1) to: result modifiers.
	result enumToken: (nodes at: 2).
	result name: (nodes at: 3).
	result implementsToken: ((nodes at: 4) at: 1).
	result addNodes: ((nodes at: 4) at: 2) to: result interfaces.
	result addTokens: ((nodes at: 4) at: 3) to: result commas.
	result leftBrace: ((nodes at: 5) at: 1).
	result addNodes: ((nodes at: 5) at: 2) to: result constants.
	result addTokens: ((nodes at: 5) at: 3) to: result commas.
	result semicolon: ((nodes at: 5) at: 4).
	result addNodes: ((nodes at: 5) at: 5) to: result declarations.
	result rightBrace: ((nodes at: 5) at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForexplicit_constructor_invocation1: nodes [
	| result |
	result := JavaThisConstructorInvocationNode new.
	result thisToken: (nodes at: 1).
	result leftParen: (nodes at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result expressions.
	result addTokens: ((nodes at: 3) at: 2) to: result commas.
	result rightParen: (nodes at: 4).
	result semicolon: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForexplicit_constructor_invocation2: nodes [
	| result |
	result := JavaSuperConstructorInvocationNode new.
	result superToken: (nodes at: 1).
	result leftParen: (nodes at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result expressions.
	result addTokens: ((nodes at: 3) at: 2) to: result commas.
	result rightParen: (nodes at: 4).
	result semicolon: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForexplicit_constructor_invocation3: nodes [
	| result |
	result := JavaThisConstructorInvocationNode new.
	result primary: (nodes at: 1).
	result period: (nodes at: 2).
	result thisToken: (nodes at: 3).
	result leftParen: (nodes at: 4).
	result addNodes: ((nodes at: 5) at: 1) to: result expressions.
	result addTokens: ((nodes at: 5) at: 2) to: result commas.
	result rightParen: (nodes at: 6).
	result semicolon: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForexplicit_constructor_invocation4: nodes [
	| result |
	result := JavaSuperConstructorInvocationNode new.
	result primary: (nodes at: 1).
	result period: (nodes at: 2).
	result superToken: (nodes at: 3).
	result leftParen: (nodes at: 4).
	result addNodes: ((nodes at: 5) at: 1) to: result expressions.
	result addTokens: ((nodes at: 5) at: 2) to: result commas.
	result rightParen: (nodes at: 6).
	result semicolon: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForexpression_statement1: nodes [
	| result |
	result := JavaExpressionStatementNode new.
	result expression: (nodes at: 1).
	result semicolon: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForextends_interfaces1: nodes [
	| result |
	result := Array new: 3.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self add: (nodes at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForextends_interfaces2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 3).
	self add: (nodes at: 3) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForfield_access1: nodes [
	| result |
	result := JavaFieldAccessNode new.
	result receiver: (nodes at: 1).
	result period: (nodes at: 2).
	result name: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForfield_access2: nodes [
	| result |
	result := JavaFieldAccessNode new.
	result superToken: (nodes at: 1).
	result period: (nodes at: 2).
	result name: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForfield_access3: nodes [
	| result |
	result := JavaFieldAccessNode new.
	result receiver: (nodes at: 1).
	result superPeriod: (nodes at: 2).
	result superToken: (nodes at: 3).
	result period: (nodes at: 4).
	result name: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForfield_declaration1: nodes [
	| result |
	result := JavaFieldDeclarationNode new.
	result addNodes: (nodes at: 1) to: result modifiers.
	result type: (nodes at: 2).
	result
		addNodes: ((nodes at: 3) at: 1)
		to: result variableDeclarations.
	result addTokens: ((nodes at: 3) at: 2) to: result commas.
	result semicolon: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForfinally1: nodes [
	| result |
	result := JavaFinallyClauseNode new.
	result finallyToken: (nodes at: 1).
	result block: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForfloating_point_type1: nodes [
	| result |
	result := JavaFloatTypeNode new.
	result token: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForfloating_point_type2: nodes [
	| result |
	result := JavaDoubleTypeNode new.
	result token: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForfor_statement1: nodes [
	| result |
	result := JavaForStatementNode new.
	result forToken: (nodes at: 1).
	result leftParen: (nodes at: 2).
	result initial: (nodes at: 3).
	result firstSemicolon: (nodes at: 4).
	result test: (nodes at: 5).
	result secondSemicolon: (nodes at: 6).
	result _update: (nodes at: 7).
	result rightParen: (nodes at: 8).
	result statement: (nodes at: 9).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForforeach_statement1: nodes [
	| result |
	result := JavaForEachStatementNode new.
	result forToken: (nodes at: 1).
	result leftParen: (nodes at: 2).
	result addNodes: (nodes at: 3) to: result modifiers.
	result type: (nodes at: 4).
	result name: (nodes at: 5).
	result colon: (nodes at: 6).
	result expression: (nodes at: 7).
	result rightParen: (nodes at: 8).
	result statement: (nodes at: 9).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForformal_parameter1: nodes [
	| result |
	result := JavaParameterNode new.
	result addNodes: (nodes at: 1) to: result modifiers.
	result type: (nodes at: 2).
	result variable: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForformal_parameter2: nodes [
	| result |
	result := JavaVariableArgumentParameterNode new.
	result addNodes: (nodes at: 1) to: result modifiers.
	result type: (nodes at: 2).
	result varArgsToken: (nodes at: 3).
	result variable: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForif_then_else_statement1: nodes [
	| result |
	result := JavaIfElseStatementNode new.
	result ifToken: (nodes at: 1).
	result leftParen: (nodes at: 2).
	result expression: (nodes at: 3).
	result rightParen: (nodes at: 4).
	result trueStatement: (nodes at: 5).
	result elseToken: (nodes at: 6).
	result falseStatement: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForif_then_statement1: nodes [
	| result |
	result := JavaIfStatementNode new.
	result ifToken: (nodes at: 1).
	result leftParen: (nodes at: 2).
	result expression: (nodes at: 3).
	result rightParen: (nodes at: 4).
	result trueStatement: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForinitialized_variable_declarator1: nodes [
	| result |
	result := JavaInitializedVariableDeclarationNode new.
	result variable: (nodes at: 1).
	result equals: (nodes at: 2).
	result initializer: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForintegral_type1: nodes [
	| result |
	result := JavaByteTypeNode new.
	result token: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForintegral_type2: nodes [
	| result |
	result := JavaShortTypeNode new.
	result token: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForintegral_type3: nodes [
	| result |
	result := JavaIntTypeNode new.
	result token: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForintegral_type4: nodes [
	| result |
	result := JavaLongTypeNode new.
	result token: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForintegral_type5: nodes [
	| result |
	result := JavaCharTypeNode new.
	result token: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForinterface_declaration1: nodes [
	| result |
	result := JavaInterfaceNode new.
	result addNodes: (nodes at: 1) to: result modifiers.
	result interfaceToken: (nodes at: 2).
	result name: (nodes at: 3).
	result typeParameters: (nodes at: 4).
	result extendsToken: ((nodes at: 5) at: 1).
	result addNodes: ((nodes at: 5) at: 2) to: result interfaceTypes.
	result addTokens: ((nodes at: 5) at: 3) to: result commas.
	result leftBrace: ((nodes at: 6) at: 1).
	result addNodes: ((nodes at: 6) at: 2) to: result declarations.
	result rightBrace: ((nodes at: 6) at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForinterfaces1: nodes [
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
JavaParser >> reduceActionForinterfaces_opt1: nodes [
	| result |
	result := Array new: 3.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForlabeled_statement1: nodes [
	| result |
	result := JavaLabeledStatementNode new.
	result identifier: (nodes at: 1).
	result colon: (nodes at: 2).
	result statement: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForlambda_expression1: nodes [
	| result |
	result := JavaLambdaExpressionNode new.
	result leftParen: ((nodes at: 1) at: 1).
	result addNodes: ((nodes at: 1) at: 2) to: result parameters.
	result addTokens: ((nodes at: 1) at: 3) to: result commas.
	result rightParen: ((nodes at: 1) at: 4).
	result arrowToken: (nodes at: 2).
	result value: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForlambda_parameter_list_opt1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForlambda_parameters2: nodes [
	| result |
	result := Array new: 4.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForliteral1: nodes [
	| result |
	result := JavaIntegerLiteralNode new.
	result token: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForliteral2: nodes [
	| result |
	result := JavaFloatLiteralNode new.
	result token: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForliteral3: nodes [
	| result |
	result := JavaBooleanLiteralNode new.
	result token: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForliteral4: nodes [
	| result |
	result := JavaCharacterLiteralNode new.
	result token: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForliteral5: nodes [
	| result |
	result := JavaStringLiteralNode new.
	result token: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForliteral6: nodes [
	| result |
	result := JavaNullNode new.
	result token: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForlocal_variable_declaration1: nodes [
	| result |
	result := JavaLocalVariableDeclarationNode new.
	result addNodes: (nodes at: 1) to: result modifiers.
	result type: (nodes at: 2).
	result
		addNodes: ((nodes at: 3) at: 1)
		to: result variableDeclarations.
	result addTokens: ((nodes at: 3) at: 2) to: result commas.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForlocal_variable_declaration_statement1: nodes [
	| result |
	result := JavaLocalVariableDeclarationStatementNode new.
	result declaration: (nodes at: 1).
	result semicolon: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFormethod_body2: nodes [
	| result |
	result := JavaEmptyMethodBodyNode new.
	result semicolon: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFormethod_declaration1: nodes [
	| result |
	result := JavaMethodDeclarationNode new.
	result addNodes: ((nodes at: 1) at: 1) to: result modifiers.
	result typeParameters: ((nodes at: 1) at: 2).
	result type: ((nodes at: 1) at: 3).
	result declarator: ((nodes at: 1) at: 4).
	result throws: ((nodes at: 1) at: 5).
	result body: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFormethod_declarator1: nodes [
	| result |
	result := JavaMethodDeclaratorNode new.
	result name: (nodes at: 1).
	result leftParen: (nodes at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result parameters.
	result addTokens: ((nodes at: 3) at: 2) to: result commas.
	result rightParen: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFormethod_declarator2: nodes [
	| result |
	result := JavaArrayMethodDeclaratorNode new.
	result declarator: (nodes at: 1).
	result leftBracket: (nodes at: 2).
	result rightBracket: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFormethod_header1: nodes [
	| result |
	result := Array new: 5.
	result at: 1 put: (OrderedCollection new: 2).
	self addAll: (nodes at: 1) to: (result at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	result at: 4 put: (nodes at: 4).
	result at: 5 put: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFormethod_invocation1: nodes [
	| result |
	result := JavaMethodInvocationNode new.
	result lt: ((nodes at: 1) at: 1).
	result addNodes: ((nodes at: 1) at: 2) to: result arguments.
	result addTokens: ((nodes at: 1) at: 3) to: result commas.
	result gt: ((nodes at: 1) at: 4).
	result name: (nodes at: 2).
	result leftParen: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result expressions.
	result addTokens: ((nodes at: 4) at: 2) to: result commas.
	result rightParen: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFormethod_invocation2: nodes [
	| result |
	result := JavaMethodInvocationNode new.
	result receiver: (nodes at: 1).
	result period: (nodes at: 2).
	result lt: ((nodes at: 3) at: 1).
	result addNodes: ((nodes at: 3) at: 2) to: result arguments.
	result addTokens: ((nodes at: 3) at: 3) to: result commas.
	result gt: ((nodes at: 3) at: 4).
	result name: (nodes at: 4).
	result leftParen: (nodes at: 5).
	result addNodes: ((nodes at: 6) at: 1) to: result expressions.
	result addTokens: ((nodes at: 6) at: 2) to: result commas.
	result rightParen: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFormethod_invocation3: nodes [
	| result |
	result := JavaMethodInvocationNode new.
	result superToken: (nodes at: 1).
	result period: (nodes at: 2).
	result lt: ((nodes at: 3) at: 1).
	result addNodes: ((nodes at: 3) at: 2) to: result arguments.
	result addTokens: ((nodes at: 3) at: 3) to: result commas.
	result gt: ((nodes at: 3) at: 4).
	result name: (nodes at: 4).
	result leftParen: (nodes at: 5).
	result addNodes: ((nodes at: 6) at: 1) to: result expressions.
	result addTokens: ((nodes at: 6) at: 2) to: result commas.
	result rightParen: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFormethod_invocation4: nodes [
	| result |
	result := JavaMethodInvocationNode new.
	result receiver: (nodes at: 1).
	result superPeriod: (nodes at: 2).
	result superToken: (nodes at: 3).
	result period: (nodes at: 4).
	result lt: ((nodes at: 5) at: 1).
	result addNodes: ((nodes at: 5) at: 2) to: result arguments.
	result addTokens: ((nodes at: 5) at: 3) to: result commas.
	result gt: ((nodes at: 5) at: 4).
	result name: (nodes at: 6).
	result leftParen: (nodes at: 7).
	result addNodes: ((nodes at: 8) at: 1) to: result expressions.
	result addTokens: ((nodes at: 8) at: 2) to: result commas.
	result rightParen: (nodes at: 9).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFormethod_reference_expression2: nodes [
	| result |
	result := JavaMethodReferenceNode new.
	result receiver: (nodes at: 1).
	result colonColonToken: (nodes at: 2).
	result name: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFormodifier11: nodes [
	| result |
	result := JavaModifierNode new.
	result token: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFormodifiers1: nodes [
	| result |
	result := OrderedCollection new: 2.
	self add: (nodes at: 1) to: result.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFormodifiers_opt2: nodes [
	| result |
	result := nodes at: 1.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFormultiplicative_expression2: nodes [
	| result |
	result := JavaBinaryExpressionNode new.
	result leftExpression: (nodes at: 1).
	result op: (nodes at: 2).
	result rightExpression: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForpackage_declaration1: nodes [
	| result |
	result := JavaPackageDeclarationNode new.
	result addNodes: (nodes at: 1) to: result annotations.
	result packageToken: (nodes at: 2).
	result name: (nodes at: 3).
	result semicolon: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForpackage_declaration_opt1: nodes [
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForpostdecrement_expression1: nodes [
	| result |
	result := JavaPostDecrementExpressionNode new.
	result expression: (nodes at: 1).
	result minusMinus: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForpostincrement_expression1: nodes [
	| result |
	result := JavaPostIncrementExpressionNode new.
	result expression: (nodes at: 1).
	result plusPlus: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForpredecrement_expression1: nodes [
	| result |
	result := JavaPreDecrementExpressionNode new.
	result minusMinus: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForpreincrement_expression1: nodes [
	| result |
	result := JavaPreIncrementExpressionNode new.
	result plusPlus: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForprimary_no_new_array11: nodes [
	| result |
	result := JavaClassPropertyNode new.
	result name: (nodes at: 1).
	result period: (nodes at: 2).
	result classToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForprimary_no_new_array12: nodes [
	| result |
	result := JavaClassPropertyNode new.
	result name: (nodes at: 1).
	result period: (nodes at: 2).
	result thisToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForprimary_no_new_array2: nodes [
	| result |
	result := JavaNameNode new.
	result name: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForprimary_no_new_array3: nodes [
	| result |
	result := nodes at: 2.
	result addFirstToken: (nodes at: 1) to: result _leftParens.
	result addToken: (nodes at: 3) to: result _rightParens.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForprimary_no_new_array8: nodes [
	| result |
	result := JavaClassPropertyNode new.
	result type: (nodes at: 1).
	result period: (nodes at: 2).
	result classToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForprimitive_type2: nodes [
	| result |
	result := JavaBooleanTypeNode new.
	result token: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForqualified_name1: nodes [
	| result |
	result := JavaQualifiedNameNode new.
	result nspace: (nodes at: 1).
	result period: (nodes at: 2).
	result name: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForqualified_type_name1: nodes [
	| result |
	result := JavaQualifiedTypeNameNode new.
	result nspace: (nodes at: 1).
	result period: (nodes at: 2).
	result name: (nodes at: 3).
	result lt: ((nodes at: 4) at: 1).
	result addNodes: ((nodes at: 4) at: 2) to: result arguments.
	result addTokens: ((nodes at: 4) at: 3) to: result commas.
	result gt: ((nodes at: 4) at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForreturn_statement1: nodes [
	| result |
	result := JavaReturnStatementNode new.
	result returnToken: (nodes at: 1).
	result expression: (nodes at: 2).
	result semicolon: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForsimple_type_name1: nodes [
	| result |
	result := JavaTypeNameNode new.
	result name: (nodes at: 1).
	result lt: ((nodes at: 2) at: 1).
	result addNodes: ((nodes at: 2) at: 2) to: result arguments.
	result addTokens: ((nodes at: 2) at: 3) to: result commas.
	result gt: ((nodes at: 2) at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForsingle_type_import_declaration1: nodes [
	| result |
	result := JavaSingleTypeImportDeclarationNode new.
	result importToken: (nodes at: 1).
	result staticToken: (nodes at: 2).
	result name: (nodes at: 3).
	result semicolon: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForstatement_expression_list1: nodes [
	| result |
	result := JavaStatementExpressionListNode new.
	result addNode: (nodes at: 1) to: result expressions.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForstatement_expression_list2: nodes [
	| result |
	result := nodes at: 1.
	result addToken: (nodes at: 2) to: result commas.
	result addNode: (nodes at: 3) to: result expressions.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForstatic_initializer1: nodes [
	| result |
	result := JavaStaticInitializerNode new.
	result staticToken: (nodes at: 1).
	result block: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForswitch_block1: nodes [
	| result |
	result := JavaSwitchBlockNode new.
	result leftBrace: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result statementGroups.
	result addNodes: (nodes at: 3) to: result labels.
	result rightBrace: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForswitch_block2: nodes [
	| result |
	result := JavaSwitchBlockNode new.
	result leftBrace: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result statementGroups.
	result rightBrace: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForswitch_block3: nodes [
	| result |
	result := JavaSwitchBlockNode new.
	result leftBrace: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result labels.
	result rightBrace: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForswitch_block4: nodes [
	| result |
	result := JavaSwitchBlockNode new.
	result leftBrace: (nodes at: 1).
	result rightBrace: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForswitch_block_statement_group1: nodes [
	| result |
	result := JavaSwitchBlockStatementGroupNode new.
	result addNodes: (nodes at: 1) to: result labels.
	result addNodes: (nodes at: 2) to: result statements.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForswitch_label1: nodes [
	| result |
	result := JavaSwitchLabelNode new.
	result caseToken: (nodes at: 1).
	result constant: (nodes at: 2).
	result colon: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForswitch_label2: nodes [
	| result |
	result := JavaDefaultLabelNode new.
	result defaultToken: (nodes at: 1).
	result colon: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForswitch_statement1: nodes [
	| result |
	result := JavaSwitchStatementNode new.
	result switchToken: (nodes at: 1).
	result leftParen: (nodes at: 2).
	result expression: (nodes at: 3).
	result rightParen: (nodes at: 4).
	result block: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForsynchronized_statement1: nodes [
	| result |
	result := JavaSynchronizedStatementNode new.
	result synchronizedToken: (nodes at: 1).
	result leftParen: (nodes at: 2).
	result expression: (nodes at: 3).
	result rightParen: (nodes at: 4).
	result block: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForthrow_statement1: nodes [
	| result |
	result := JavaThrowStatementNode new.
	result throwToken: (nodes at: 1).
	result expression: (nodes at: 2).
	result semicolon: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForthrows1: nodes [
	| result |
	result := JavaThrowsNode new.
	result throwsToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result classTypes.
	result addTokens: ((nodes at: 2) at: 2) to: result commas.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFortry_resource1: nodes [
	| result |
	result := JavaLocalVariableDeclarationNode new.
	result addNodes: (nodes at: 1) to: result modifiers.
	result type: (nodes at: 2).
	result addNode: (nodes at: 3) to: result variableDeclarations.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFortry_resources_opt2: nodes [
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
JavaParser >> reduceActionFortry_statement1: nodes [
	| result |
	result := JavaTryStatementNode new.
	result tryToken: (nodes at: 1).
	result leftParen: ((nodes at: 2) at: 1).
	result addNodes: ((nodes at: 2) at: 2) to: result resources.
	result addTokens: ((nodes at: 2) at: 3) to: result semicolons.
	result rightParen: ((nodes at: 2) at: 4).
	result block: (nodes at: 3).
	result addNodes: (nodes at: 4) to: result catches.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFortry_statement2: nodes [
	| result |
	result := JavaTryStatementNode new.
	result tryToken: (nodes at: 1).
	result leftParen: ((nodes at: 2) at: 1).
	result addNodes: ((nodes at: 2) at: 2) to: result resources.
	result addTokens: ((nodes at: 2) at: 3) to: result semicolons.
	result rightParen: ((nodes at: 2) at: 4).
	result block: (nodes at: 3).
	result addNodes: (nodes at: 4) to: result catches.
	result finally: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFortype_argument1: nodes [
	| result |
	result := JavaTypeArgumentNode new.
	result type: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFortype_argument2: nodes [
	| result |
	result := JavaTypeArgumentNode new.
	result questionMark: (nodes at: 1).
	result token: ((nodes at: 2) at: 1).
	result type: ((nodes at: 2) at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFortype_argument_type3: nodes [
	| result |
	result := Array new: 2.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFortype_arguments1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFortype_arguments2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 2).
	self add: (nodes at: 3) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFortype_arguments_opt1: nodes [
	| result |
	result := Array new: 4.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFortype_arguments_opt2: nodes [
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
JavaParser >> reduceActionFortype_arguments_opt3: nodes [
	| result |
	result := Array new: 4.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	result at: 4 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFortype_declaration4: nodes [
	| result |
	result := JavaEmptyDeclarationNode new.
	result semicolon: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFortype_import_on_demand_declaration1: nodes [
	| result |
	result := JavaTypeImportOnDemandDeclarationNode new.
	result importToken: (nodes at: 1).
	result staticToken: (nodes at: 2).
	result name: (nodes at: 3).
	result period: (nodes at: 4).
	result star: (nodes at: 5).
	result semicolon: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFortype_parameter1: nodes [
	| result |
	result := JavaTypeParameterNode new.
	result name: (nodes at: 1).
	result extendsToken: ((nodes at: 2) at: 1).
	result addNodes: ((nodes at: 2) at: 2) to: result types.
	result addTokens: ((nodes at: 2) at: 3) to: result amps.
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionFortype_parameters_opt2: nodes [
	| result |
	result := JavaTypeParametersNode new.
	result lt: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result parameters.
	result addTokens: ((nodes at: 2) at: 2) to: result commas.
	result gt: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForunary_expression3: nodes [
	| result |
	result := JavaUnaryAdditionNode new.
	result plus: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForunary_expression4: nodes [
	| result |
	result := JavaUnarySubtractionNode new.
	result minus: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForunary_expression_not_plus_minus2: nodes [
	| result |
	result := JavaUnaryBitInvertNode new.
	result tilde: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForunary_expression_not_plus_minus3: nodes [
	| result |
	result := JavaUnaryNotNode new.
	result bang: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForuntyped_lambda_parameter1: nodes [
	| result |
	result := JavaParameterNode new.
	result variable: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForvariable_declarator1: nodes [
	| result |
	result := JavaVariableDeclarationNode new.
	result variable: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForvariable_declarator_id1: nodes [
	| result |
	result := JavaVariableNameNode new.
	result name: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForvariable_declarator_id2: nodes [
	| result |
	result := JavaArrayVariableNameNode new.
	result variable: (nodes at: 1).
	result leftBracket: (nodes at: 2).
	result rightBracket: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForvoid1: nodes [
	| result |
	result := JavaVoidTypeNode new.
	result voidToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
JavaParser >> reduceActionForwhile_statement1: nodes [
	| result |
	result := JavaWhileStatementNode new.
	result whileToken: (nodes at: 1).
	result leftParen: (nodes at: 2).
	result expression: (nodes at: 3).
	result rightParen: (nodes at: 4).
	result statement: (nodes at: 5).
	^ result
]

{ #category : #generated }
JavaParser >> reduceTable [
^#(
	#(128 0 #nil) 
	#(135 0 #reduceActionForannotations1:) 
	#(143 0 #reduceActionForannotations1:) 
	#(177 0 #reduceActionForannotations1:) 
	#(265 0 #reduceActionFortype_arguments_opt1:) 
	#(129 0 #reduceActionForannotations1:) 
	#(128 1 #reduceActionForpackage_declaration_opt1:) 
	#(160 1 #reduceActionForpackage_declaration_opt1:) 
	#(200 0 #reduceActionForannotations1:) 
	#(144 1 #reduceActionFormodifier11:) 
	#(173 1 #reduceActionForvoid1:) 
	#(251 1 #reduceActionForprimary_no_new_array2:) 
	#(116 1 #reduceActionForintegral_type5:) 
	#(117 1 #reduceActionForfloating_point_type1:) 
	#(117 1 #reduceActionForfloating_point_type2:) 
	#(116 1 #reduceActionForintegral_type3:) 
	#(116 1 #reduceActionForintegral_type4:) 
	#(112 1 #reduceActionForprimitive_type2:) 
	#(116 1 #reduceActionForintegral_type1:) 
	#(116 1 #reduceActionForintegral_type2:) 
	#(211 1 #reduceActionForempty_statement1:) 
	#(243 0 #reduceActionFortype_arguments_opt1:) 
	#(242 0 #nil) 
	#(237 0 #nil) 
	#(111 1 #reduceActionForliteral1:) 
	#(111 1 #reduceActionForliteral2:) 
	#(111 1 #reduceActionForliteral3:) 
	#(111 1 #reduceActionForliteral4:) 
	#(111 1 #reduceActionForliteral5:) 
	#(111 1 #reduceActionForliteral6:) 
	#(124 1 #reduceActionForprimary_no_new_array2:) 
	#(251 1 #reduceActionForpackage_declaration_opt1:) 
	#(112 1 #reduceActionForpackage_declaration_opt1:) 
	#(115 1 #reduceActionForpackage_declaration_opt1:) 
	#(126 1 #reduceActionForpackage_declaration_opt1:) 
	#(272 1 #reduceActionForpackage_declaration_opt1:) 
	#(287 1 #reduceActionForpackage_declaration_opt1:) 
	#(264 1 #reduceActionForpackage_declaration_opt1:) 
	#(127 1 #reduceActionForpackage_declaration_opt1:) 
	#(143 1 #reduceActionFormodifiers_opt2:) 
	#(142 1 #reduceActionFormodifiers1:) 
	#(144 1 #reduceActionForpackage_declaration_opt1:) 
	#(139 1 #reduceActionForpackage_declaration_opt1:) 
	#(202 1 #reduceActionForpackage_declaration_opt1:) 
	#(204 1 #reduceActionForpackage_declaration_opt1:) 
	#(222 1 #reduceActionForpackage_declaration_opt1:) 
	#(185 1 #reduceActionForpackage_declaration_opt1:) 
	#(120 1 #reduceActionForpackage_declaration_opt1:) 
	#(258 0 #reduceActionForlambda_parameter_list_opt1:) 
	#(165 1 #reduceActionForvariable_declarator_id1:) 
	#(259 1 #reduceActionForuntyped_lambda_parameter1:) 
	#(273 1 #reduceActionForpackage_declaration_opt1:) 
	#(262 1 #reduceActionForpackage_declaration_opt1:) 
	#(110 1 #reduceActionForpackage_declaration_opt1:) 
	#(255 1 #reduceActionForlambda_parameters2:) 
	#(263 1 #reduceActionForpackage_declaration_opt1:) 
	#(274 1 #reduceActionForpackage_declaration_opt1:) 
	#(276 1 #reduceActionForpackage_declaration_opt1:) 
	#(277 1 #reduceActionForpackage_declaration_opt1:) 
	#(278 1 #reduceActionForpackage_declaration_opt1:) 
	#(279 1 #reduceActionForpackage_declaration_opt1:) 
	#(280 1 #reduceActionForpackage_declaration_opt1:) 
	#(281 1 #reduceActionForpackage_declaration_opt1:) 
	#(282 1 #reduceActionForpackage_declaration_opt1:) 
	#(283 1 #reduceActionForpackage_declaration_opt1:) 
	#(284 1 #reduceActionForpackage_declaration_opt1:) 
	#(285 1 #reduceActionForpackage_declaration_opt1:) 
	#(286 1 #reduceActionForpackage_declaration_opt1:) 
	#(109 1 #reduceActionFortype_declaration4:) 
	#(109 1 #reduceActionForpackage_declaration_opt1:) 
	#(138 0 #nil) 
	#(130 0 #reduceActionForannotations1:) 
	#(129 1 #reduceActionFormodifiers_opt2:) 
	#(132 1 #reduceActionFormodifiers1:) 
	#(134 1 #reduceActionForpackage_declaration_opt1:) 
	#(135 2 #reduceActionForannotations2:) 
	#(183 1 #reduceActionFormodifiers1:) 
	#(200 1 #reduceActionFormodifiers_opt2:) 
	#(289 0 #reduceActionFortype_arguments_opt1:) 
	#(312 0 #reduceActionFortype_argument_type3:) 
	#(265 2 #reduceActionFortype_arguments_opt3:) 
	#(114 1 #reduceActionForpackage_declaration_opt1:) 
	#(311 1 #reduceActionFortype_argument1:) 
	#(113 1 #reduceActionForpackage_declaration_opt1:) 
	#(118 1 #reduceActionForclass_or_interface_type1:) 
	#(310 1 #reduceActionFortype_arguments1:) 
	#(242 1 #reduceActionForpackage_declaration_opt1:) 
	#(237 1 #reduceActionForpackage_declaration_opt1:) 
	#(236 0 #nil) 
	#(121 1 #reduceActionForpackage_declaration_opt1:) 
	#(225 2 #reduceActionForpredecrement_expression1:) 
	#(224 2 #reduceActionForpreincrement_expression1:) 
	#(313 2 #reduceActionForsimple_type_name1:) 
	#(119 2 #reduceActionForarray_type1:) 
	#(123 1 #reduceActionFordims1:) 
	#(142 2 #reduceActionForannotations2:) 
	#(315 1 #reduceActionFormodifier11:) 
	#(315 1 #reduceActionForpackage_declaration_opt1:) 
	#(177 2 #reduceActionForannotations2:) 
	#(201 2 #reduceActionForlocal_variable_declaration_statement1:) 
	#(318 2 #reduceActionForexpression_statement1:) 
	#(227 2 #reduceActionForpostdecrement_expression1:) 
	#(226 2 #reduceActionForpostincrement_expression1:) 
	#(288 1 #reduceActionForpackage_declaration_opt1:) 
	#(261 1 #reduceActionForpackage_declaration_opt1:) 
	#(258 1 #reduceActionFormodifiers_opt2:) 
	#(260 1 #reduceActionFortype_arguments1:) 
	#(274 2 #reduceActionForunary_expression_not_plus_minus2:) 
	#(274 2 #reduceActionForunary_expression_not_plus_minus3:) 
	#(273 2 #reduceActionForunary_expression4:) 
	#(273 2 #reduceActionForunary_expression3:) 
	#(138 1 #reduceActionForpackage_declaration_opt1:) 
	#(133 1 #reduceActionFormodifiers1:) 
	#(212 3 #reduceActionForcompilation_unit1:) 
	#(130 1 #reduceActionFormodifiers_opt2:) 
	#(132 2 #reduceActionForannotations2:) 
	#(183 2 #reduceActionForannotations2:) 
	#(320 3 #reduceActionForblock1:) 
	#(251 3 #reduceActionForprimary_no_new_array3:) 
	#(253 3 #reduceActionForfield_access2:) 
	#(290 0 #reduceActionForlambda_parameter_list_opt1:) 
	#(145 3 #reduceActionForannotation1:) 
	#(311 2 #reduceActionFortype_argument2:) 
	#(265 3 #reduceActionFortype_arguments_opt2:) 
	#(248 0 #nil) 
	#(247 1 #reduceActionFortype_arguments1:) 
	#(245 0 #reduceActionForannotations1:) 
	#(216 3 #reduceActionForcontinue_statement1:) 
	#(217 3 #reduceActionForreturn_statement1:) 
	#(239 1 #reduceActionForpackage_declaration_opt1:) 
	#(240 1 #reduceActionForstatement_expression_list1:) 
	#(236 1 #reduceActionForpackage_declaration_opt1:) 
	#(215 3 #reduceActionForbreak_statement1:) 
	#(221 3 #reduceActionForassert_statement1:) 
	#(219 3 #reduceActionForthrow_statement1:) 
	#(269 0 #reduceActionForlambda_parameter_list_opt1:) 
	#(268 1 #reduceActionFormodifiers1:) 
	#(184 0 #reduceActionForlambda_parameter_list_opt1:) 
	#(205 3 #reduceActionForlabeled_statement1:) 
	#(271 2 #reduceActionForempty_dim_expr1:) 
	#(251 3 #reduceActionForprimary_no_new_array8:) 
	#(123 2 #reduceActionFordims2:) 
	#(251 3 #reduceActionForprimary_no_new_array11:) 
	#(251 3 #reduceActionForprimary_no_new_array12:) 
	#(125 3 #reduceActionForqualified_name1:) 
	#(146 0 #nil) 
	#(148 0 #reduceActionForinterfaces_opt1:) 
	#(203 3 #reduceActionForlocal_variable_declaration1:) 
	#(163 1 #reduceActionFortype_arguments1:) 
	#(164 1 #reduceActionForvariable_declarator1:) 
	#(164 1 #reduceActionForpackage_declaration_opt1:) 
	#(253 3 #reduceActionForfield_access1:) 
	#(223 3 #reduceActionForassignment1:) 
	#(255 3 #reduceActionFortype_arguments_opt2:) 
	#(165 3 #reduceActionForvariable_declarator_id2:) 
	#(256 1 #reduceActionForpackage_declaration_opt1:) 
	#(257 3 #reduceActionForlambda_expression1:) 
	#(263 3 #reduceActionFormethod_reference_expression2:) 
	#(276 3 #reduceActionFormultiplicative_expression2:) 
	#(277 3 #reduceActionFormultiplicative_expression2:) 
	#(278 3 #reduceActionFormultiplicative_expression2:) 
	#(279 3 #reduceActionFormultiplicative_expression2:) 
	#(280 3 #reduceActionFormultiplicative_expression2:) 
	#(281 3 #reduceActionFormultiplicative_expression2:) 
	#(282 3 #reduceActionFormultiplicative_expression2:) 
	#(283 3 #reduceActionFormultiplicative_expression2:) 
	#(284 3 #reduceActionFormultiplicative_expression2:) 
	#(285 3 #reduceActionFormultiplicative_expression2:) 
	#(133 2 #reduceActionForannotations2:) 
	#(131 4 #reduceActionForpackage_declaration1:) 
	#(295 0 #reduceActionForlambda_parameter_list_opt1:) 
	#(292 1 #reduceActionForpackage_declaration_opt1:) 
	#(290 1 #reduceActionFormodifiers_opt2:) 
	#(290 1 #reduceActionFortype_arguments1:) 
	#(291 1 #reduceActionFortype_arguments1:) 
	#(312 2 #reduceActionForempty_dim_expr1:) 
	#(310 3 #reduceActionFortype_arguments2:) 
	#(248 1 #reduceActionForpackage_declaration_opt1:) 
	#(220 4 #reduceActionFortry_statement1:) 
	#(245 1 #reduceActionFormodifiers_opt2:) 
	#(244 1 #reduceActionFormodifiers1:) 
	#(252 4 #reduceActionForarray_creation_expression3:) 
	#(269 1 #reduceActionFormodifiers_opt2:) 
	#(252 4 #reduceActionForarray_creation_expression1:) 
	#(268 2 #reduceActionForannotations2:) 
	#(267 1 #reduceActionFortype_arguments1:) 
	#(184 1 #reduceActionFormodifiers_opt2:) 
	#(314 4 #reduceActionForqualified_type_name1:) 
	#(254 4 #reduceActionForarray_access1:) 
	#(147 0 #reduceActionFortype_argument_type3:) 
	#(148 1 #reduceActionFormodifiers_opt2:) 
	#(186 0 #reduceActionForinterfaces_opt1:) 
	#(275 4 #reduceActionForcast_expression1:) 
	#(176 3 #reduceActionForformal_parameter1:) 
	#(260 3 #reduceActionFortype_arguments2:) 
	#(136 4 #reduceActionForsingle_type_import_declaration1:) 
	#(206 5 #reduceActionForif_then_statement1:) 
	#(218 5 #reduceActionForsynchronized_statement1:) 
	#(213 5 #reduceActionForswitch_statement1:) 
	#(297 1 #reduceActionFortype_arguments1:) 
	#(296 0 #nil) 
	#(295 1 #reduceActionFormodifiers_opt2:) 
	#(289 3 #reduceActionFortype_arguments_opt2:) 
	#(249 3 #reduceActionFortry_resource1:) 
	#(247 3 #reduceActionFortype_arguments2:) 
	#(243 4 #reduceActionFortry_resources_opt2:) 
	#(244 2 #reduceActionForannotations2:) 
	#(220 5 #reduceActionFortry_statement2:) 
	#(208 5 #reduceActionForwhile_statement1:) 
	#(240 3 #reduceActionForstatement_expression_list2:) 
	#(221 5 #reduceActionForassert_statement2:) 
	#(270 3 #reduceActionFordim_expr1:) 
	#(168 2 #reduceActionForarray_initializer4:) 
	#(167 1 #reduceActionForpackage_declaration_opt1:) 
	#(199 1 #reduceActionFortype_arguments1:) 
	#(229 5 #reduceActionForclass_instance_creation_expression1:) 
	#(253 5 #reduceActionForfield_access3:) 
	#(308 0 #reduceActionForinterfaces_opt1:) 
	#(306 1 #reduceActionFortype_arguments1:) 
	#(147 1 #reduceActionFormodifiers_opt2:) 
	#(122 1 #reduceActionForpackage_declaration_opt1:) 
	#(152 1 #reduceActionFortype_arguments1:) 
	#(153 2 #reduceActionForinterfaces1:) 
	#(299 0 #reduceActionForlambda_parameter_list_opt1:) 
	#(150 5 #reduceActionForenum_declaration1:) 
	#(186 1 #reduceActionFormodifiers_opt2:) 
	#(163 3 #reduceActionFortype_arguments2:) 
	#(166 3 #reduceActionForinitialized_variable_declarator1:) 
	#(266 0 #reduceActionFortype_arguments_opt1:) 
	#(228 5 #reduceActionFormethod_invocation1:) 
	#(176 4 #reduceActionForformal_parameter2:) 
	#(286 5 #reduceActionForconditional_expression2:) 
	#(189 0 #reduceActionForannotations1:) 
	#(141 5 #reduceActionForannotation_interface_declaration1:) 
	#(230 2 #reduceActionForswitch_block4:) 
	#(231 1 #reduceActionFormodifiers1:) 
	#(232 1 #reduceActionFormodifiers1:) 
	#(296 1 #reduceActionForpackage_declaration_opt1:) 
	#(293 3 #reduceActionForelementValuePair1:) 
	#(291 3 #reduceActionFortype_arguments2:) 
	#(246 2 #reduceActionForfinally1:) 
	#(238 0 #nil) 
	#(168 3 #reduceActionForarray_initializer3:) 
	#(168 3 #reduceActionForarray_initializer2:) 
	#(154 0 #reduceActionForannotations1:) 
	#(229 6 #reduceActionForclass_instance_creation_expression2:) 
	#(267 3 #reduceActionFortype_arguments2:) 
	#(307 2 #reduceActionFortype_parameter1:) 
	#(146 3 #reduceActionFortype_parameters_opt2:) 
	#(151 2 #reduceActionForempty_dim_expr1:) 
	#(299 1 #reduceActionFormodifiers_opt2:) 
	#(301 1 #reduceActionFortype_arguments1:) 
	#(194 2 #reduceActionForextends_interfaces1:) 
	#(195 0 #reduceActionForannotations1:) 
	#(140 6 #reduceActionForinterface_declaration1:) 
	#(191 1 #reduceActionForpackage_declaration_opt1:) 
	#(189 1 #reduceActionFormodifiers_opt2:) 
	#(190 1 #reduceActionFormodifiers1:) 
	#(192 1 #reduceActionForpackage_declaration_opt1:) 
	#(137 6 #reduceActionFortype_import_on_demand_declaration1:) 
	#(207 7 #reduceActionForif_then_else_statement1:) 
	#(228 7 #reduceActionFormethod_invocation3:) 
	#(234 2 #reduceActionForswitch_label2:) 
	#(235 1 #reduceActionForpackage_declaration_opt1:) 
	#(230 3 #reduceActionForswitch_block2:) 
	#(231 2 #reduceActionForannotations2:) 
	#(230 3 #reduceActionForswitch_block3:) 
	#(233 2 #reduceActionForswitch_block_statement_group1:) 
	#(232 2 #reduceActionForannotations2:) 
	#(294 4 #reduceActionForelementValueArrayInitializer1:) 
	#(297 3 #reduceActionFortype_arguments2:) 
	#(214 7 #reduceActionFordo_statement1:) 
	#(241 1 #reduceActionForpackage_declaration_opt1:) 
	#(238 1 #reduceActionForpackage_declaration_opt1:) 
	#(168 4 #reduceActionForarray_initializer1:) 
	#(199 3 #reduceActionFortype_arguments2:) 
	#(157 1 #reduceActionForpackage_declaration_opt1:) 
	#(154 1 #reduceActionFormodifiers_opt2:) 
	#(155 1 #reduceActionFormodifiers1:) 
	#(156 1 #reduceActionForpackage_declaration_opt1:) 
	#(309 1 #reduceActionFortype_arguments1:) 
	#(308 2 #reduceActionForinterfaces1:) 
	#(306 3 #reduceActionFortype_arguments2:) 
	#(139 7 #reduceActionForclass_declaration1:) 
	#(152 3 #reduceActionFortype_arguments2:) 
	#(303 0 #reduceActionFortype_arguments_opt1:) 
	#(300 0 #reduceActionForenum_body_declarations_opt1:) 
	#(197 1 #reduceActionForpackage_declaration_opt1:) 
	#(198 1 #reduceActionForpackage_declaration_opt1:) 
	#(195 1 #reduceActionFormodifiers_opt2:) 
	#(196 1 #reduceActionFormodifiers1:) 
	#(194 3 #reduceActionForextends_interfaces2:) 
	#(266 2 #reduceActionFortype_arguments_opt3:) 
	#(228 7 #reduceActionFormethod_invocation2:) 
	#(193 2 #reduceActionForabstract_method_declaration1:) 
	#(188 3 #reduceActionForannotation_interface_body1:) 
	#(190 2 #reduceActionForannotations2:) 
	#(234 3 #reduceActionForswitch_label1:) 
	#(230 4 #reduceActionForswitch_block1:) 
	#(250 5 #reduceActionForcatch_clause1:) 
	#(158 2 #reduceActionForstatic_initializer1:) 
	#(172 0 #nil) 
	#(149 3 #reduceActionForannotation_interface_body1:) 
	#(155 2 #reduceActionForannotations2:) 
	#(170 1 #reduceActionFormethod_body2:) 
	#(162 2 #reduceActionFormethod_declaration1:) 
	#(170 1 #reduceActionForpackage_declaration_opt1:) 
	#(304 0 #reduceActionForclass_body_opt1:) 
	#(300 1 #reduceActionFormodifiers_opt2:) 
	#(301 3 #reduceActionFortype_arguments2:) 
	#(187 3 #reduceActionForannotation_interface_body1:) 
	#(196 2 #reduceActionForannotations2:) 
	#(266 3 #reduceActionFortype_arguments_opt2:) 
	#(210 9 #reduceActionForforeach_statement1:) 
	#(209 9 #reduceActionForfor_statement1:) 
	#(172 1 #reduceActionForpackage_declaration_opt1:) 
	#(228 9 #reduceActionFormethod_invocation4:) 
	#(309 3 #reduceActionFortype_arguments2:) 
	#(304 1 #reduceActionFormodifiers_opt2:) 
	#(302 4 #reduceActionForenum_constant1:) 
	#(305 2 #reduceActionForenum_body_declarations1:) 
	#(298 5 #reduceActionForenum_body1:) 
	#(229 9 #reduceActionForclass_instance_creation_expression3:) 
	#(161 4 #reduceActionForfield_declaration1:) 
	#(192 4 #reduceActionForannotation_method_declaration3:) 
	#(174 0 #reduceActionForlambda_parameter_list_opt1:) 
	#(179 1 #reduceActionFortype_arguments1:) 
	#(178 2 #reduceActionForthrows1:) 
	#(159 4 #reduceActionForconstructor_declaration1:) 
	#(303 3 #reduceActionFortype_arguments_opt2:) 
	#(229 10 #reduceActionForclass_instance_creation_expression4:) 
	#(169 5 #reduceActionFormethod_header1:) 
	#(174 1 #reduceActionFormodifiers_opt2:) 
	#(175 1 #reduceActionFortype_arguments1:) 
	#(181 2 #reduceActionForconstructor_body4:) 
	#(171 3 #reduceActionFormethod_declarator2:) 
	#(180 5 #reduceActionForconstructor_declarator1:) 
	#(179 3 #reduceActionFortype_arguments2:) 
	#(181 3 #reduceActionForconstructor_body2:) 
	#(181 3 #reduceActionForconstructor_body3:) 
	#(171 4 #reduceActionFormethod_declarator1:) 
	#(175 3 #reduceActionFortype_arguments2:) 
	#(181 4 #reduceActionForconstructor_body1:) 
	#(182 5 #reduceActionForexplicit_constructor_invocation2:) 
	#(182 5 #reduceActionForexplicit_constructor_invocation1:) 
	#(182 7 #reduceActionForexplicit_constructor_invocation4:) 
	#(182 7 #reduceActionForexplicit_constructor_invocation3:)
	).
]

{ #category : #generated }
JavaParser >> symbolNames [
	^ #('"}"' '"="' '"["' '"]"' '","' '"{"' '"strictfp"' '"class"' '"extends"' '"implements"' '"void"' '"("' '"enum"' '"default"' '":"' '"if"' '"super"' '"interface"' '")"' '"..."' '"throws"' '"this"' '"transient"' '"volatile"' '"char"' '"float"' '"double"' '"."' '"int"' '"long"' '"else"' '"boolean"' '"byte"' '"short"' '"package"' '";"' '"abstract"' '"final"' '"native"' '"synchronized"' '"private"' '"static"' '"import"' '"*"' '"public"' '"protected"' '"switch"' '"@"' '"^"' '"|"' '"&&"' '"||"' '"!="' '"&"' '"<="' '">="' '"instanceof"' '"case"' '"?"' '"*="' '">>>="' '"&="' '"^="' '"|="' '"<<="' '">>="' '"/="' '"%="' '"+="' '"-="' '"=="' '"<"' '"<<"' '"try"' '"catch"' '"finally"' '"continue"' '"return"' '"while"' '"do"' '"for"' '"break"' '"assert"' '"throw"' '"~"' '"!"' '"/"' '"->"' '"%"' '"-"' '"+"' '"new"' '"::"' '"--"' '"++"' '<GREATER_THAN>' '<SIGNED_RIGHT_SHIFT>' '<UNSIGNED_RIGHT_SHIFT>' '<INTEGER_LITERAL>' '<FLOATING_POINT_LITERAL>' '<BOOLEAN_LITERAL>' '<CHARACTER_LITERAL>' '<STRING_LITERAL>' '<NULL_LITERAL>' '<IDENTIFIER>' '<whitespace>' '<comment>' '<patternToken>' 'type_declaration' 'expression' 'literal' 'primitive_type' 'reference_type' 'type' 'numeric_type' 'integral_type' 'floating_point_type' 'class_or_interface_type' 'array_type' 'type_name' 'class_type' 'interface_type' 'dims' 'simple_name' 'qualified_name' 'name' 'block_statement' 'package_declaration_opt' 'import_declarations_opt' 'type_declarations_opt' 'package_declaration' 'import_declarations' 'type_declarations' 'import_declaration' 'annotations' 'single_type_import_declaration' 'type_import_on_demand_declaration' 'static_opt' 'class_declaration' 'interface_declaration' 'annotation_interface_declaration' 'modifiers' 'modifiers_opt' 'modifier' 'annotation' 'type_parameters_opt' 'super_opt' 'interfaces_opt' 'class_body' 'enum_declaration' 'super' 'interface_type_list' 'interfaces' 'class_body_declarations_opt' 'class_body_declarations' 'class_body_declaration' 'class_member_declaration' 'static_initializer' 'constructor_declaration' 'goal' 'field_declaration' 'method_declaration' 'variable_declarators' 'variable_declarator' 'variable_declarator_id' 'initialized_variable_declarator' 'variable_initializer' 'array_initializer' 'method_header' 'method_body' 'method_declarator' 'throws_opt' 'void' 'formal_parameter_list_opt' 'formal_parameter_list' 'formal_parameter' 'variable_modifiers' 'throws' 'class_type_list' 'constructor_declarator' 'constructor_body' 'explicit_constructor_invocation' 'block_statements' 'argument_list_opt' 'primary' 'extends_interfaces_opt' 'interface_body' 'annotation_interface_body' 'annotation_interface_member_declarations_opt' 'annotation_interface_member_declarations' 'annotation_interface_member_declaration' 'annotation_method_declaration' 'abstract_method_declaration' 'extends_interfaces' 'interface_member_declarations_opt' 'interface_member_declarations' 'interface_member_declaration' 'constant_declaration' 'variable_initializers' 'block_statements_opt' 'local_variable_declaration_statement' 'statement' 'local_variable_declaration' 'statement_without_trailing_substatement' 'labeled_statement' 'if_then_statement' 'if_then_else_statement' 'while_statement' 'for_statement' 'foreach_statement' 'empty_statement' 'compilation_unit' 'switch_statement' 'do_statement' 'break_statement' 'continue_statement' 'return_statement' 'synchronized_statement' 'throw_statement' 'try_statement' 'assert_statement' 'statement_expression' 'assignment' 'preincrement_expression' 'predecrement_expression' 'postincrement_expression' 'postdecrement_expression' 'method_invocation' 'class_instance_creation_expression' 'switch_block' 'switch_block_statement_groups' 'switch_labels' 'switch_block_statement_group' 'switch_label' 'constant_expression' 'for_init_opt' 'expression_opt' 'for_update_opt' 'for_init' 'statement_expression_list' 'for_update' 'identifier_opt' 'try_resources_opt' 'catches' 'catches_opt' 'finally' 'try_resources' 'semicolon_opt' 'try_resource' 'catch_clause' 'primary_no_new_array' 'array_creation_expression' 'field_access' 'array_access' 'lambda_parameters' 'lambda_function' 'lambda_expression' 'lambda_parameter_list_opt' 'untyped_lambda_parameter' 'lambda_parameter_list' 'lambda_parameter' 'assignment_expression' 'method_reference_expression' 'primary_or_name' 'type_arguments_opt' 'type_arguments_or_diamond_opt' 'argument_list' 'dim_exprs' 'dims_opt' 'dim_expr' 'empty_dim_expr' 'postfix_expression' 'unary_expression' 'unary_expression_not_plus_minus' 'cast_expression' 'multiplicative_expression' 'additive_expression' 'shift_expression' 'relational_expression' 'equality_expression' 'and_expression' 'exclusive_or_expression' 'inclusive_or_expression' 'conditional_and_expression' 'conditional_or_expression' 'conditional_expression' 'left_hand_side' 'assignment_operator' 'annotation_args_opt' 'annotation_args' 'elementValuePairs' 'elementValue' 'elementValuePair' 'elementValueArrayInitializer' 'elementValues_opt' 'comma_opt' 'elementValues' 'enum_body' 'enum_constants_opt' 'enum_body_declarations_opt' 'enum_constants' 'enum_constant' 'arguments_opt' 'class_body_opt' 'enum_body_declarations' 'type_parameters' 'type_parameter' 'extends_type_parameter_opt' 'type_bound' 'type_arguments' 'type_argument' 'type_argument_type' 'simple_type_name' 'qualified_type_name' 'variable_modifier' 'E O F' 'error' 'expression_statement' 'B e g i n' 'block')
]

{ #category : #generated }
JavaParser >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #JavaProgramNode #JavaExpressionNode #JavaLiteralNode #JavaPrimitiveTypeNode #JavaTypeNode #JavaTypeNode #JavaPrimitiveTypeNode #JavaPrimitiveTypeNode #JavaPrimitiveTypeNode #JavaClassTypeNode #JavaArrayTypeNode #JavaProgramNode #JavaClassTypeNode #JavaClassTypeNode #OrderedCollection #JavaNameNode #JavaQualifiedNameNode #JavaNameNode #JavaProgramNode #JavaPackageDeclarationNode #OrderedCollection #OrderedCollection #JavaPackageDeclarationNode #OrderedCollection #OrderedCollection #JavaSingleTypeImportDeclarationNode #OrderedCollection #JavaSingleTypeImportDeclarationNode #JavaTypeImportOnDemandDeclarationNode #SmaCCToken #JavaProgramNode #JavaInterfaceNode #JavaAnnotationInterfaceNode #OrderedCollection #OrderedCollection #JavaProgramNode #JavaAnnotationNode #JavaTypeParametersNode #OrderedCollection #OrderedCollection #OrderedCollection #JavaEnumDeclarationNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #JavaProgramNode #JavaProgramNode #JavaStaticInitializerNode #JavaConstructorDeclarationNode #JavaProgramFileNode #JavaFieldDeclarationNode #JavaMethodDeclarationNode #OrderedCollection #JavaVariableDeclarationNode #JavaProgramNode #JavaInitializedVariableDeclarationNode #JavaProgramNode #JavaArrayInitializerNode #OrderedCollection #JavaProgramNode #JavaProgramNode #JavaThrowsNode #JavaVoidTypeNode #OrderedCollection #OrderedCollection #JavaParameterNode #OrderedCollection #JavaThrowsNode #OrderedCollection #OrderedCollection #JavaConstructorBodyNode #JavaProgramNode #OrderedCollection #OrderedCollection #JavaExpressionNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #JavaProgramNode #JavaAbstractMethodDeclarationNode #JavaAbstractMethodDeclarationNode #OrderedCollection #OrderedCollection #OrderedCollection #JavaProgramNode #JavaFieldDeclarationNode #OrderedCollection #OrderedCollection #JavaLocalVariableDeclarationStatementNode #JavaStatementNode #JavaLocalVariableDeclarationNode #JavaStatementNode #JavaLabeledStatementNode #JavaIfStatementNode #JavaIfElseStatementNode #JavaWhileStatementNode #JavaForStatementNode #JavaForEachStatementNode #JavaEmptyStatementNode #JavaProgramFileNode #JavaSwitchStatementNode #JavaDoWhileStatementNode #JavaBreakStatementNode #JavaContinueStatementNode #JavaReturnStatementNode #JavaSynchronizedStatementNode #JavaThrowStatementNode #JavaTryStatementNode #JavaAssertStatementNode #JavaExpressionNode #JavaAssignmentNode #JavaPreIncrementExpressionNode #JavaPreDecrementExpressionNode #JavaPostIncrementExpressionNode #JavaPostDecrementExpressionNode #JavaMethodInvocationNode #JavaNewNode #JavaSwitchBlockNode #OrderedCollection #OrderedCollection #JavaSwitchBlockStatementGroupNode #JavaProgramNode #JavaExpressionNode #JavaProgramNode #JavaExpressionNode #JavaStatementExpressionListNode #JavaProgramNode #JavaStatementExpressionListNode #JavaStatementExpressionListNode #SmaCCToken #OrderedCollection #OrderedCollection #OrderedCollection #JavaFinallyClauseNode #OrderedCollection #SmaCCToken #JavaLocalVariableDeclarationNode #JavaCatchClauseNode #JavaExpressionNode #JavaNewArrayNode #JavaFieldAccessNode #JavaArrayAccessNode #OrderedCollection #JavaProgramNode #JavaLambdaExpressionNode #OrderedCollection #JavaParameterNode #OrderedCollection #JavaParameterNode #JavaExpressionNode #JavaExpressionNode #JavaExpressionNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #JavaDimensionExpressionNode #OrderedCollection #JavaExpressionNode #JavaExpressionNode #JavaExpressionNode #JavaCastExpressionNode #JavaExpressionNode #JavaExpressionNode #JavaExpressionNode #JavaExpressionNode #JavaExpressionNode #JavaExpressionNode #JavaExpressionNode #JavaExpressionNode #JavaExpressionNode #JavaExpressionNode #JavaExpressionNode #JavaExpressionNode #SmaCCToken #OrderedCollection #OrderedCollection #OrderedCollection #JavaProgramNode #JavaElementValuePairNode #JavaElementArrayInitializerNode #OrderedCollection #SmaCCToken #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #JavaEnumConstantNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #JavaTypeParameterNode #OrderedCollection #OrderedCollection #OrderedCollection #JavaTypeArgumentNode #OrderedCollection #JavaTypeNameNode #JavaQualifiedTypeNameNode #JavaProgramNode #SmaCCToken #SmaCCToken #JavaExpressionStatementNode #JavaProgramFileNode #JavaBlockNode)
]

{ #category : #generated }
JavaParser >> transitionTable [
^#(
#[1 0 6 0 7 0 6 0 8 0 6 0 13 0 6 0 18 0 6 0 23 0 6 0 24 0 10 0 35 0 6 0 36 0 6 0 37 0 6 0 38 0 6 0 39 0 6 0 40 0 6 0 41 0 6 0 42 0 6 0 43 0 6 0 45 0 6 0 46 0 7 0 48 0 21 0 128 0 25 0 131 0 29 0 135 0 33 0 160 0 37 0 212 0 6 1 60] 
#[1 0 41 0 6 0 45 0 7 0 14 0 8 0 49 0 11 0 53 0 12 0 14 0 13 0 57 0 16 0 61 0 17 0 14 0 18 0 65 0 22 0 69 0 23 0 73 0 24 0 11 0 25 0 15 0 26 0 19 0 27 0 23 0 29 0 27 0 30 0 31 0 32 0 35 0 33 0 39 0 34 0 109 0 36 0 113 0 37 0 43 0 38 0 121 0 39 0 125 0 40 0 129 0 41 0 133 0 42 0 137 0 45 0 141 0 46 0 145 0 47 0 47 0 48 0 153 0 72 0 157 0 74 0 161 0 77 0 165 0 78 0 169 0 79 0 173 0 80 0 177 0 81 0 181 0 82 0 185 0 83 0 189 0 84 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 51 0 105 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 17 0 127 1 21 0 139 1 25 0 140 1 29 0 142 1 33 0 143 1 37 0 144 1 41 0 145 1 45 0 150 1 49 0 173 1 53 0 177 1 57 0 185 1 61 0 201 1 65 0 202 1 69 0 203 1 73 0 204 1 77 0 205 1 81 0 206 1 85 0 207 1 89 0 208 1 93 0 209 1 97 0 210 1 101 0 211 1 105 0 213 1 109 0 214 1 113 0 215 1 117 0 216 1 121 0 217 1 125 0 218 1 129 0 219 1 133 0 220 1 137 0 221 1 141 0 222 1 145 0 223 1 149 0 224 1 153 0 225 1 157 0 226 1 161 0 227 1 165 0 228 1 169 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 1 189 1 8 1 193 1 9 1 197 1 16 1 201 1 31 1 205 1 57 1 209 1 58 1 213 1 62 1 217 1 64] 
#[1 0 49 0 11 1 221 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 55 0 105 1 245 0 110 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 249 0 165 1 49 0 173 1 57 0 185 1 253 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 2 25 0 255 2 29 1 1 2 33 1 3 2 37 1 6 2 41 1 7 1 189 1 8 1 193 1 9 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 2 69 1 22 2 73 1 23 2 77 1 24 2 81 1 25 2 85 1 26 2 89 1 27 2 93 1 28 2 97 1 29 2 101 1 30 1 201 1 31 1 205 1 57 1 209 1 58] 
#[1 0 45 0 7 0 14 0 8 0 14 0 13 0 14 0 18 0 69 0 23 0 73 0 24 2 105 0 36 0 113 0 37 0 117 0 38 0 121 0 39 2 109 0 40 0 129 0 41 0 133 0 42 0 137 0 45 0 141 0 46 0 59 0 48 2 113 0 109 2 117 0 139 2 121 0 140 2 125 0 141 1 29 0 142 2 129 0 143 1 37 0 144 1 41 0 145 1 45 0 150] 
#[1 0 26 0 7 0 26 0 8 0 26 0 13 0 26 0 18 0 26 0 23 0 26 0 24 0 26 0 36 0 26 0 37 0 26 0 38 0 26 0 39 0 26 0 40 0 26 0 41 0 26 0 42 2 133 0 43 0 26 0 45 0 26 0 46 0 26 0 48 2 137 0 129 2 141 0 132 2 145 0 134 2 149 0 136 2 153 0 137 0 26 1 60] 
#[0 0 30 0 7 0 8 0 13 0 18 0 23 0 24 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 45 0 46 0 48 1 60] 
#[1 2 157 0 35 0 149 0 48 2 161 0 145] 
#[0 0 0 1 60] 
#[0 0 34 1 60] 
#[1 0 38 0 1 0 41 0 6 0 45 0 7 0 14 0 8 0 49 0 11 0 53 0 12 0 14 0 13 0 57 0 16 0 61 0 17 0 14 0 18 0 65 0 22 0 69 0 23 0 73 0 24 0 11 0 25 0 15 0 26 0 19 0 27 0 23 0 29 0 27 0 30 0 31 0 32 0 35 0 33 0 39 0 34 0 109 0 36 0 113 0 37 0 43 0 38 0 121 0 39 0 125 0 40 0 129 0 41 0 133 0 42 0 137 0 45 0 141 0 46 0 145 0 47 0 47 0 48 0 153 0 72 0 157 0 74 0 161 0 77 0 165 0 78 0 169 0 79 0 173 0 80 0 177 0 81 0 181 0 82 0 185 0 83 0 189 0 84 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 51 0 105 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 2 165 0 127 1 21 0 139 1 25 0 140 1 29 0 142 1 33 0 143 1 37 0 144 1 41 0 145 1 45 0 150 1 49 0 173 1 53 0 177 2 169 0 183 1 57 0 185 2 173 0 200 1 61 0 201 1 65 0 202 1 69 0 203 1 73 0 204 1 77 0 205 1 81 0 206 1 85 0 207 1 89 0 208 1 93 0 209 1 97 0 210 1 101 0 211 1 105 0 213 1 109 0 214 1 113 0 215 1 117 0 216 1 121 0 217 1 125 0 218 1 129 0 219 1 133 0 220 1 137 0 221 1 141 0 222 1 145 0 223 1 149 0 224 1 153 0 225 1 157 0 226 1 161 0 227 1 165 0 228 1 169 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 1 189 1 8 1 193 1 9 1 197 1 16 1 201 1 31 1 205 1 57 1 209 1 58 1 213 1 62 1 217 1 64] 
#[0 0 42 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105] 
#[0 0 46 0 28 0 105] 
#[1 0 49 0 11 1 221 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 55 0 105 2 177 0 110 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 249 0 165 1 49 0 173 1 57 0 185 1 253 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 2 25 0 255 2 29 1 1 2 33 1 3 2 37 1 6 2 41 1 7 1 189 1 8 1 193 1 9 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 2 69 1 22 2 73 1 23 2 77 1 24 2 81 1 25 2 85 1 26 2 89 1 27 2 93 1 28 2 97 1 29 2 101 1 30 1 201 1 31 1 205 1 57 1 209 1 58] 
#[0 2 181 0 12] 
#[0 2 185 0 28] 
#[0 0 50 0 1 0 3 0 4 0 5 0 15 0 19 0 28 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 98 1 60] 
#[0 0 42 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105] 
#[0 0 42 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105] 
#[0 0 54 0 3 0 5 0 19 0 20 0 28 0 54 0 96 0 105] 
#[0 0 58 0 3 0 5 0 19 0 20 0 28 0 54 0 96 0 105] 
#[0 0 62 0 3 0 5 0 19 0 20 0 28 0 54 0 96 0 105] 
#[0 0 66 0 3 0 5 0 19 0 20 0 28 0 54 0 96 0 105] 
#[0 0 70 0 3 0 5 0 19 0 20 0 28 0 54 0 96 0 105] 
#[0 0 74 0 3 0 5 0 19 0 20 0 28 0 54 0 96 0 105] 
#[0 0 78 0 3 0 5 0 19 0 20 0 28 0 54 0 96 0 105] 
#[0 0 82 0 3 0 5 0 19 0 20 0 28 0 54 0 96 0 105] 
#[0 0 86 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[0 0 42 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105] 
#[0 0 42 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105] 
#[0 0 42 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105] 
#[1 0 42 0 7 0 42 0 8 2 189 0 12 0 42 0 13 0 42 0 18 0 42 0 23 0 42 0 24 0 42 0 37 0 42 0 38 0 42 0 39 0 42 0 40 0 42 0 41 0 42 0 42 0 42 0 45 0 42 0 46 0 42 0 48] 
#[0 0 42 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105] 
#[0 0 42 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105] 
#[0 0 42 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105] 
#[0 0 42 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105] 
#[0 2 193 0 12] 
#[1 2 197 0 105 1 5 0 124 1 9 0 125 2 201 0 126] 
#[1 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 2 205 0 59 2 209 0 96 2 213 0 105 2 217 0 112 2 221 0 113 2 225 0 114 0 241 0 115 0 245 0 116 0 249 0 117 2 229 0 118 2 233 0 119 2 237 0 120 2 241 1 54 2 245 1 55 1 205 1 57 1 209 1 58] 
#[1 0 90 0 6 2 249 0 12 2 253 0 243] 
#[1 0 94 0 36 3 1 0 105 3 5 0 242] 
#[1 0 49 0 11 1 221 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 98 0 36 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 55 0 105 3 9 0 110 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 249 0 165 1 49 0 173 1 57 0 185 1 253 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 3 13 0 237 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 2 25 0 255 2 29 1 1 2 33 1 3 2 37 1 6 2 41 1 7 1 189 1 8 1 193 1 9 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 2 69 1 22 2 73 1 23 2 77 1 24 2 81 1 25 2 85 1 26 2 89 1 27 2 93 1 28 2 97 1 29 2 101 1 30 1 201 1 31 1 205 1 57 1 209 1 58] 
#[0 3 17 0 12] 
#[1 0 41 0 6 0 49 0 11 0 53 0 12 0 57 0 16 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 109 0 36 3 21 0 40 0 145 0 47 0 153 0 72 0 157 0 74 0 161 0 77 0 165 0 78 0 169 0 79 0 173 0 80 0 177 0 81 0 181 0 82 0 185 0 83 0 189 0 84 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 63 0 105 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 49 0 173 1 57 0 185 3 25 0 202 1 73 0 204 1 77 0 205 1 81 0 206 1 85 0 207 1 89 0 208 1 93 0 209 1 97 0 210 1 101 0 211 1 105 0 213 1 109 0 214 1 113 0 215 1 117 0 216 1 121 0 217 1 125 0 218 1 129 0 219 1 133 0 220 1 137 0 221 1 141 0 222 1 145 0 223 1 149 0 224 1 153 0 225 1 157 0 226 1 161 0 227 1 165 0 228 1 169 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 1 189 1 8 1 193 1 9 1 197 1 16 1 201 1 31 1 205 1 57 1 209 1 58 1 213 1 62 1 217 1 64] 
#[0 3 29 0 12] 
#[1 0 94 0 36 3 1 0 105 3 33 0 242] 
#[1 0 49 0 11 1 221 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 55 0 105 3 37 0 110 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 249 0 165 1 49 0 173 1 57 0 185 1 253 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 2 25 0 255 2 29 1 1 2 33 1 3 2 37 1 6 2 41 1 7 1 189 1 8 1 193 1 9 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 2 69 1 22 2 73 1 23 2 77 1 24 2 81 1 25 2 85 1 26 2 89 1 27 2 93 1 28 2 97 1 29 2 101 1 30 1 201 1 31 1 205 1 57 1 209 1 58] 
#[1 0 49 0 11 1 221 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 55 0 105 3 41 0 110 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 249 0 165 1 49 0 173 1 57 0 185 1 253 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 2 25 0 255 2 29 1 1 2 33 1 3 2 37 1 6 2 41 1 7 1 189 1 8 1 193 1 9 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 2 69 1 22 2 73 1 23 2 77 1 24 2 81 1 25 2 85 1 26 2 89 1 27 2 93 1 28 2 97 1 29 2 101 1 30 1 201 1 31 1 205 1 57 1 209 1 58] 
#[1 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 2 213 0 105 3 45 0 112 0 241 0 115 0 245 0 116 0 249 0 117 3 49 0 118 3 53 0 120 3 57 0 121 1 205 1 57 1 209 1 58] 
#[1 0 49 0 11 3 61 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 67 0 105 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 49 0 173 1 57 0 185 3 69 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 1 189 1 8 1 193 1 9 2 45 1 16 3 73 1 17 2 53 1 18 2 57 1 19 1 201 1 31 1 205 1 57 1 209 1 58] 
#[1 0 49 0 11 3 61 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 67 0 105 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 49 0 173 1 57 0 185 3 69 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 1 189 1 8 1 193 1 9 2 45 1 16 3 77 1 17 2 53 1 18 2 57 1 19 1 201 1 31 1 205 1 57 1 209 1 58] 
#[0 0 102 0 1 0 3 0 4 0 5 0 15 0 19 0 28 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 98 1 60] 
#[0 0 106 0 1 0 3 0 4 0 5 0 15 0 19 0 28 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 98 1 60] 
#[0 0 110 0 1 0 3 0 4 0 5 0 15 0 19 0 28 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 98 1 60] 
#[0 0 114 0 1 0 3 0 4 0 5 0 15 0 19 0 28 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 98 1 60] 
#[0 0 118 0 1 0 3 0 4 0 5 0 15 0 19 0 28 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 98 1 60] 
#[0 0 122 0 1 0 3 0 4 0 5 0 15 0 19 0 28 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 98 1 60] 
#[1 0 126 0 2 0 71 0 3 3 81 0 15 0 71 0 28 0 126 0 60 0 126 0 61 0 126 0 62 0 126 0 63 0 126 0 64 0 126 0 65 0 126 0 66 0 126 0 67 0 126 0 68 0 126 0 69 0 126 0 70 0 153 0 72 0 126 0 94 0 126 0 95 3 85 1 9] 
#[0 0 130 0 1 0 3 0 4 0 5 0 15 0 19 0 28 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 98 1 60] 
#[1 3 89 0 3 3 93 0 28 3 97 0 123 3 101 1 15] 
#[0 0 134 0 3 0 5 0 19 0 20 0 28 0 54 0 96 0 105] 
#[0 0 138 0 3 0 5 0 19 0 20 0 28 0 54 0 96 0 105] 
#[0 0 138 0 3 0 5 0 19 0 20 0 28 0 54 0 96 0 105] 
#[0 3 105 0 28] 
#[1 3 89 0 3 3 109 0 28 3 113 0 123 3 101 1 15] 
#[0 0 142 0 1 0 2 0 3 0 4 0 5 0 7 0 8 0 11 0 12 0 13 0 15 0 18 0 19 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 60 0 61 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 98 0 105 1 60] 
#[0 0 142 0 1 0 2 0 3 0 4 0 5 0 7 0 8 0 11 0 12 0 13 0 15 0 18 0 19 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 60 0 61 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 98 0 105 1 60] 
#[1 0 146 0 1 0 150 0 2 3 117 0 3 0 146 0 4 0 146 0 5 0 146 0 15 0 146 0 19 0 75 0 28 0 146 0 36 0 146 0 44 0 146 0 49 0 146 0 50 0 146 0 51 0 146 0 52 0 146 0 53 0 146 0 54 0 146 0 55 0 146 0 56 0 146 0 57 0 146 0 59 0 150 0 60 0 150 0 61 0 150 0 62 0 150 0 63 0 150 0 64 0 150 0 65 0 150 0 66 0 150 0 67 0 150 0 68 0 150 0 69 0 150 0 70 0 146 0 71 0 146 0 72 0 146 0 73 0 146 0 87 0 146 0 89 0 146 0 90 0 146 0 91 0 146 0 93 0 146 0 94 0 146 0 95 0 146 0 96 0 146 0 97 0 146 0 98 0 146 1 60] 
#[0 0 0 1 60] 
#[0 0 158 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[0 0 158 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[1 0 45 0 7 0 162 0 8 0 162 0 11 0 162 0 13 0 162 0 18 0 69 0 23 0 73 0 24 0 162 0 25 0 162 0 26 0 162 0 27 0 162 0 29 0 162 0 30 0 162 0 32 0 162 0 33 0 162 0 34 0 113 0 37 0 117 0 38 0 121 0 39 2 109 0 40 0 129 0 41 0 133 0 42 0 137 0 45 0 141 0 46 0 79 0 48 0 162 0 72 0 162 0 105 3 125 0 144 1 41 0 145] 
#[1 3 129 0 8 3 133 0 13 3 137 0 18] 
#[0 0 166 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105] 
#[0 0 170 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105] 
#[0 0 174 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[0 3 141 0 28] 
#[1 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 3 145 0 38 0 149 0 48 2 213 0 105 2 217 0 112 2 221 0 113 3 149 0 114 0 241 0 115 0 245 0 116 0 249 0 117 2 229 0 118 2 233 0 119 2 237 0 120 3 153 0 145 1 205 1 57 1 209 1 58 3 157 1 59] 
#[1 0 146 0 1 0 146 0 4 0 146 0 5 0 146 0 15 0 146 0 19 0 83 0 28 0 146 0 36 0 146 0 44 0 146 0 49 0 146 0 50 0 146 0 51 0 146 0 52 0 146 0 53 0 146 0 54 0 146 0 55 0 146 0 56 0 146 0 57 0 146 0 59 0 146 0 71 0 146 0 72 0 146 0 73 0 146 0 87 0 146 0 89 0 146 0 90 0 146 0 91 0 146 0 93 0 146 0 94 0 146 0 95 0 146 0 96 0 146 0 97 0 146 0 98 0 146 1 60] 
#[0 0 158 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[0 0 158 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[0 3 165 0 36] 
#[0 0 178 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[0 0 178 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[0 0 178 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[0 0 178 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[0 0 178 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[0 0 178 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[0 0 178 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[0 0 182 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[0 0 182 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[0 0 182 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[0 0 182 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[0 0 182 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[0 0 182 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[0 0 182 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[0 0 182 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[0 0 182 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[0 0 182 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[0 3 169 0 36] 
#[0 0 186 0 5 0 19 0 36] 
#[0 0 186 0 5 0 19 0 36] 
#[0 0 186 0 5 0 19 0 36] 
#[1 0 186 0 5 0 186 0 19 0 186 0 36 0 146 0 94 0 146 0 95] 
#[1 0 186 0 5 0 186 0 19 0 186 0 36 0 146 0 94 0 146 0 95] 
#[1 0 130 0 3 0 186 0 5 0 186 0 19 0 130 0 28 0 186 0 36 0 130 0 94 0 130 0 95] 
#[1 0 130 0 3 0 186 0 5 0 186 0 19 0 130 0 28 0 186 0 36 0 130 0 94 0 130 0 95] 
#[1 0 190 0 1 3 173 0 3 0 190 0 4 0 190 0 5 0 190 0 15 0 190 0 19 0 190 0 28 0 190 0 36 0 190 0 44 0 190 0 49 0 190 0 50 0 190 0 51 0 190 0 52 0 190 0 53 0 190 0 54 0 190 0 55 0 190 0 56 0 190 0 57 0 190 0 59 0 190 0 71 0 190 0 72 0 190 0 73 0 190 0 87 0 190 0 89 0 190 0 90 0 190 0 91 0 190 0 93 0 190 0 94 0 190 0 95 0 190 0 96 0 190 0 97 0 190 0 98 0 190 1 60] 
#[0 0 190 0 1 0 4 0 5 0 15 0 19 0 28 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 98 1 60] 
#[1 0 130 0 1 0 150 0 2 0 130 0 3 0 130 0 4 0 130 0 5 0 130 0 15 0 130 0 19 0 130 0 28 0 130 0 36 0 130 0 44 0 130 0 49 0 130 0 50 0 130 0 51 0 130 0 52 0 130 0 53 0 130 0 54 0 130 0 55 0 130 0 56 0 130 0 57 0 130 0 59 0 150 0 60 0 150 0 61 0 150 0 62 0 150 0 63 0 150 0 64 0 150 0 65 0 150 0 66 0 150 0 67 0 150 0 68 0 150 0 69 0 150 0 70 0 130 0 71 0 130 0 72 0 130 0 73 0 130 0 87 0 130 0 89 0 130 0 90 0 130 0 91 0 130 0 93 0 130 0 94 0 130 0 95 0 130 0 96 0 130 0 97 0 130 0 98 0 130 1 60] 
#[1 0 130 0 1 0 150 0 2 0 130 0 3 0 130 0 4 0 130 0 5 0 130 0 15 0 130 0 19 0 130 0 28 0 130 0 36 0 130 0 44 0 130 0 49 0 130 0 50 0 130 0 51 0 130 0 52 0 130 0 53 0 130 0 54 0 130 0 55 0 130 0 56 0 130 0 57 0 130 0 59 0 150 0 60 0 150 0 61 0 150 0 62 0 150 0 63 0 150 0 64 0 150 0 65 0 150 0 66 0 150 0 67 0 150 0 68 0 150 0 69 0 150 0 70 0 130 0 71 0 130 0 72 0 130 0 73 0 130 0 87 0 130 0 89 0 130 0 90 0 130 0 91 0 130 0 93 0 130 0 94 0 130 0 95 0 130 0 96 0 130 0 97 0 130 0 98 0 130 1 60] 
#[0 3 177 0 28] 
#[0 3 181 0 105] 
#[1 3 185 0 94 3 189 0 95] 
#[1 3 193 0 2 3 197 0 60 3 201 0 61 3 205 0 62 3 209 0 63 3 213 0 64 3 217 0 65 3 221 0 66 3 225 0 67 3 229 0 68 3 233 0 69 3 237 0 70 3 241 1 32] 
#[0 0 194 0 1 0 3 0 4 0 5 0 6 0 10 0 12 0 14 0 15 0 19 0 20 0 28 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 96 0 97 0 98 0 105 1 60] 
#[0 0 194 0 1 0 3 0 4 0 5 0 6 0 10 0 12 0 14 0 15 0 19 0 20 0 28 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 96 0 97 0 98 0 105 1 60] 
#[0 0 182 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[0 0 182 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[1 0 49 0 11 1 221 0 12 0 61 0 17 0 198 0 19 0 65 0 22 0 11 0 25 0 15 0 26 0 19 0 27 0 23 0 29 0 27 0 30 0 31 0 32 0 35 0 33 0 39 0 34 0 18 0 38 0 18 0 48 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 87 0 105 2 177 0 110 0 233 0 111 3 245 0 112 2 221 0 113 3 249 0 114 0 241 0 115 0 245 0 116 0 249 0 117 2 229 0 118 3 253 0 119 2 237 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 249 0 165 1 49 0 173 4 1 0 176 4 5 0 177 1 57 0 185 1 253 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 2 25 0 255 2 29 1 1 4 9 1 2 4 13 1 3 4 17 1 4 4 21 1 5 2 37 1 6 2 41 1 7 1 189 1 8 1 193 1 9 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 2 69 1 22 2 73 1 23 2 77 1 24 2 81 1 25 2 85 1 26 2 89 1 27 2 93 1 28 2 97 1 29 2 101 1 30 1 201 1 31 1 205 1 57 1 209 1 58] 
#[1 0 49 0 11 3 61 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 67 0 105 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 49 0 173 1 57 0 185 3 69 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 1 189 1 8 1 193 1 9 2 45 1 16 4 25 1 17 2 53 1 18 2 57 1 19 1 201 1 31 1 205 1 57 1 209 1 58] 
#[1 0 49 0 11 3 61 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 67 0 105 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 49 0 173 1 57 0 185 3 69 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 1 189 1 8 1 193 1 9 2 45 1 16 4 29 1 17 2 53 1 18 2 57 1 19 1 201 1 31 1 205 1 57 1 209 1 58] 
#[1 0 49 0 11 3 61 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 67 0 105 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 49 0 173 1 57 0 185 3 69 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 1 189 1 8 1 193 1 9 2 45 1 16 4 33 1 17 2 53 1 18 2 57 1 19 1 201 1 31 1 205 1 57 1 209 1 58] 
#[1 0 49 0 11 3 61 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 67 0 105 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 49 0 173 1 57 0 185 3 69 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 1 189 1 8 1 193 1 9 2 45 1 16 4 37 1 17 2 53 1 18 2 57 1 19 1 201 1 31 1 205 1 57 1 209 1 58] 
#[1 0 126 0 1 0 126 0 2 0 91 0 3 0 126 0 4 0 95 0 5 0 126 0 15 0 91 0 19 0 71 0 28 0 126 0 36 0 126 0 44 0 126 0 49 0 126 0 50 0 126 0 51 0 126 0 52 0 126 0 53 0 126 0 54 0 126 0 55 0 126 0 56 0 126 0 57 0 126 0 59 0 126 0 60 0 126 0 61 0 126 0 62 0 126 0 63 0 126 0 64 0 126 0 65 0 126 0 66 0 126 0 67 0 126 0 68 0 126 0 69 0 126 0 70 0 126 0 71 0 99 0 72 0 126 0 73 0 126 0 87 0 202 0 88 0 126 0 89 0 126 0 90 0 126 0 91 0 126 0 93 0 126 0 94 0 126 0 95 0 126 0 96 0 126 0 97 0 126 0 98 3 85 1 9 0 126 1 60] 
#[0 0 0 1 60] 
#[1 4 41 0 3 0 206 0 5 0 206 0 19 0 206 0 88] 
#[0 0 103 0 1 0 4 0 5 0 15 0 19 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 96 0 97 0 98 1 60] 
#[0 0 210 0 1 0 4 0 5 0 15 0 19 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 96 0 97 0 98 1 60] 
#[0 0 210 0 1 0 4 0 5 0 15 0 19 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 96 0 97 0 98 1 60] 
#[0 0 146 0 1 0 4 0 5 0 15 0 19 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 98 1 60] 
#[0 0 146 0 1 0 4 0 5 0 15 0 19 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 98 1 60] 
#[0 0 130 0 1 0 3 0 4 0 5 0 15 0 19 0 28 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 98 1 60] 
#[0 0 130 0 1 0 3 0 4 0 5 0 15 0 19 0 28 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 98 1 60] 
#[0 4 45 0 88] 
#[0 0 218 0 1 0 4 0 5 0 15 0 19 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 96 0 97 0 98 1 60] 
#[0 0 222 0 88] 
#[1 0 226 0 1 0 226 0 4 0 226 0 5 0 226 0 15 0 226 0 19 0 226 0 36 0 226 0 44 0 226 0 49 0 226 0 50 0 226 0 51 0 226 0 52 0 226 0 53 0 226 0 54 0 226 0 55 0 226 0 56 0 226 0 57 0 226 0 59 0 226 0 71 0 226 0 72 0 226 0 73 0 226 0 87 0 226 0 89 0 226 0 90 0 226 0 91 0 107 0 93 0 226 0 96 0 226 0 97 0 226 0 98 0 226 1 60] 
#[0 0 218 0 1 0 4 0 5 0 15 0 19 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 96 0 97 0 98 1 60] 
#[1 0 230 0 1 0 230 0 4 0 230 0 5 0 230 0 15 0 230 0 19 0 230 0 36 0 230 0 44 0 230 0 49 0 230 0 50 0 230 0 51 0 230 0 52 0 230 0 53 0 230 0 54 0 230 0 55 0 230 0 56 0 230 0 57 0 230 0 59 0 230 0 71 0 230 0 72 0 230 0 73 0 230 0 87 0 230 0 89 0 230 0 90 0 230 0 91 0 230 0 93 3 185 0 94 3 189 0 95 0 230 0 96 0 230 0 97 0 230 0 98 0 230 1 60] 
#[0 0 234 0 1 0 4 0 5 0 15 0 19 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 96 0 97 0 98 1 60] 
#[0 0 210 0 1 0 4 0 5 0 15 0 19 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 96 0 97 0 98 1 60] 
#[0 0 230 0 1 0 4 0 5 0 15 0 19 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 96 0 97 0 98 1 60] 
#[1 0 238 0 1 0 238 0 4 0 238 0 5 0 238 0 15 0 238 0 19 0 238 0 36 0 111 0 44 0 238 0 49 0 238 0 50 0 238 0 51 0 238 0 52 0 238 0 53 0 238 0 54 0 238 0 55 0 238 0 56 0 238 0 57 0 238 0 59 0 238 0 71 0 238 0 72 0 238 0 73 0 115 0 87 0 119 0 89 0 238 0 90 0 238 0 91 0 238 0 93 0 238 0 96 0 238 0 97 0 238 0 98 0 238 1 60] 
#[1 0 242 0 1 0 242 0 4 0 242 0 5 0 242 0 15 0 242 0 19 0 242 0 36 0 242 0 44 0 242 0 49 0 242 0 50 0 242 0 51 0 242 0 52 0 242 0 53 0 242 0 54 0 242 0 55 0 242 0 56 0 242 0 57 0 242 0 59 0 242 0 71 0 242 0 72 0 242 0 73 0 242 0 87 0 242 0 89 0 123 0 90 0 127 0 91 0 242 0 93 0 242 0 96 0 242 0 97 0 242 0 98 0 242 1 60] 
#[1 0 246 0 1 0 246 0 4 0 246 0 5 0 246 0 15 0 246 0 19 0 246 0 36 0 246 0 44 0 246 0 49 0 246 0 50 0 246 0 51 0 246 0 52 0 246 0 53 0 246 0 54 0 246 0 55 0 246 0 56 0 246 0 57 0 246 0 59 0 246 0 71 0 246 0 72 0 131 0 73 0 246 0 87 0 246 0 89 0 246 0 90 0 246 0 91 0 246 0 93 0 246 0 96 0 135 0 97 0 139 0 98 0 246 1 60] 
#[1 0 250 0 1 0 250 0 4 0 250 0 5 0 250 0 15 0 250 0 19 0 250 0 36 0 250 0 44 0 250 0 49 0 250 0 50 0 250 0 51 0 250 0 52 0 250 0 53 0 250 0 54 0 143 0 55 0 147 0 56 0 151 0 57 0 250 0 59 0 250 0 71 0 155 0 72 0 250 0 73 0 250 0 87 0 250 0 89 0 250 0 90 0 250 0 91 0 250 0 93 0 159 0 96 0 250 0 97 0 250 0 98 0 250 1 60] 
#[1 0 254 0 1 0 254 0 4 0 254 0 5 0 254 0 15 0 254 0 19 0 254 0 36 0 254 0 44 0 254 0 49 0 254 0 50 0 254 0 51 0 254 0 52 0 163 0 53 0 254 0 54 0 254 0 55 0 254 0 56 0 254 0 57 0 254 0 59 0 167 0 71 0 254 0 72 0 254 0 73 0 254 0 87 0 254 0 89 0 254 0 90 0 254 0 91 0 254 0 93 0 254 0 96 0 254 0 97 0 254 0 98 0 254 1 60] 
#[1 1 2 0 1 1 2 0 4 1 2 0 5 1 2 0 15 1 2 0 19 1 2 0 36 1 2 0 44 1 2 0 49 1 2 0 50 1 2 0 51 1 2 0 52 1 2 0 53 0 171 0 54 1 2 0 55 1 2 0 56 1 2 0 57 1 2 0 59 1 2 0 71 1 2 0 72 1 2 0 73 1 2 0 87 1 2 0 89 1 2 0 90 1 2 0 91 1 2 0 93 1 2 0 96 1 2 0 97 1 2 0 98 1 2 1 60] 
#[1 1 6 0 1 1 6 0 4 1 6 0 5 1 6 0 15 1 6 0 19 1 6 0 36 1 6 0 44 0 175 0 49 1 6 0 50 1 6 0 51 1 6 0 52 1 6 0 53 1 6 0 54 1 6 0 55 1 6 0 56 1 6 0 57 1 6 0 59 1 6 0 71 1 6 0 72 1 6 0 73 1 6 0 87 1 6 0 89 1 6 0 90 1 6 0 91 1 6 0 93 1 6 0 96 1 6 0 97 1 6 0 98 1 6 1 60] 
#[1 1 10 0 1 1 10 0 4 1 10 0 5 1 10 0 15 1 10 0 19 1 10 0 36 1 10 0 44 1 10 0 49 0 179 0 50 1 10 0 51 1 10 0 52 1 10 0 53 1 10 0 54 1 10 0 55 1 10 0 56 1 10 0 57 1 10 0 59 1 10 0 71 1 10 0 72 1 10 0 73 1 10 0 87 1 10 0 89 1 10 0 90 1 10 0 91 1 10 0 93 1 10 0 96 1 10 0 97 1 10 0 98 1 10 1 60] 
#[1 1 14 0 1 1 14 0 4 1 14 0 5 1 14 0 15 1 14 0 19 1 14 0 36 1 14 0 44 1 14 0 49 1 14 0 50 0 183 0 51 1 14 0 52 1 14 0 53 1 14 0 54 1 14 0 55 1 14 0 56 1 14 0 57 1 14 0 59 1 14 0 71 1 14 0 72 1 14 0 73 1 14 0 87 1 14 0 89 1 14 0 90 1 14 0 91 1 14 0 93 1 14 0 96 1 14 0 97 1 14 0 98 1 14 1 60] 
#[1 1 18 0 1 1 18 0 4 1 18 0 5 1 18 0 15 1 18 0 19 1 18 0 36 1 18 0 44 1 18 0 49 1 18 0 50 1 18 0 51 0 187 0 52 1 18 0 53 1 18 0 54 1 18 0 55 1 18 0 56 1 18 0 57 0 191 0 59 1 18 0 71 1 18 0 72 1 18 0 73 1 18 0 87 1 18 0 89 1 18 0 90 1 18 0 91 1 18 0 93 1 18 0 96 1 18 0 97 1 18 0 98 1 18 1 60] 
#[0 0 214 0 1 0 4 0 5 0 15 0 19 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 96 0 97 0 98 1 60] 
#[0 1 22 0 1 0 6 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105 1 60] 
#[0 0 42 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105] 
#[0 0 0 1 60] 
#[0 1 26 0 1 0 6 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105 1 60] 
#[0 1 26 0 1 0 6 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105 1 60] 
#[0 1 26 0 1 0 6 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105 1 60] 
#[1 3 129 0 8 3 133 0 13 3 137 0 18 4 137 0 48] 
#[1 4 141 0 42 1 30 0 105 4 145 0 138] 
#[1 0 45 0 7 0 14 0 8 0 14 0 13 0 14 0 18 0 69 0 23 0 73 0 24 2 105 0 36 0 113 0 37 0 117 0 38 0 121 0 39 2 109 0 40 0 129 0 41 0 133 0 42 0 137 0 45 0 141 0 46 0 59 0 48 4 149 0 109 4 153 0 130 4 157 0 133 2 117 0 139 2 121 0 140 2 125 0 141 1 29 0 142 2 129 0 143 1 37 0 144 1 41 0 145 1 45 0 150 1 34 1 60] 
#[1 1 38 0 7 1 38 0 8 1 38 0 13 1 38 0 18 1 38 0 23 1 38 0 24 1 38 0 36 1 38 0 37 1 38 0 38 1 38 0 39 1 38 0 40 1 38 0 41 1 38 0 42 2 133 0 43 1 38 0 45 1 38 0 46 1 38 0 48 4 161 0 134 2 149 0 136 2 153 0 137 1 38 1 60] 
#[0 1 42 0 7 0 8 0 13 0 18 0 23 0 24 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 45 0 46 0 48 1 60] 
#[0 1 46 0 7 0 8 0 13 0 18 0 23 0 24 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 45 0 46 0 48 1 60] 
#[0 1 46 0 7 0 8 0 13 0 18 0 23 0 24 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 45 0 46 0 48 1 60] 
#[1 2 197 0 105 1 5 0 124 1 9 0 125 4 165 0 126] 
#[0 1 50 0 35 0 48 0 105] 
#[0 1 54 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[1 1 58 0 1 0 41 0 6 0 45 0 7 0 14 0 8 0 49 0 11 0 53 0 12 0 14 0 13 0 57 0 16 0 61 0 17 0 14 0 18 0 65 0 22 0 69 0 23 0 73 0 24 0 11 0 25 0 15 0 26 0 19 0 27 0 23 0 29 0 27 0 30 0 31 0 32 0 35 0 33 0 39 0 34 0 109 0 36 0 113 0 37 0 43 0 38 0 121 0 39 0 125 0 40 0 129 0 41 0 133 0 42 0 137 0 45 0 141 0 46 0 145 0 47 0 47 0 48 0 153 0 72 0 157 0 74 0 161 0 77 0 165 0 78 0 169 0 79 0 173 0 80 0 177 0 81 0 181 0 82 0 185 0 83 0 189 0 84 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 51 0 105 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 4 169 0 127 1 21 0 139 1 25 0 140 1 29 0 142 1 33 0 143 1 37 0 144 1 41 0 145 1 45 0 150 1 49 0 173 1 53 0 177 1 57 0 185 1 61 0 201 1 65 0 202 1 69 0 203 1 73 0 204 1 77 0 205 1 81 0 206 1 85 0 207 1 89 0 208 1 93 0 209 1 97 0 210 1 101 0 211 1 105 0 213 1 109 0 214 1 113 0 215 1 117 0 216 1 121 0 217 1 125 0 218 1 129 0 219 1 133 0 220 1 137 0 221 1 141 0 222 1 145 0 223 1 149 0 224 1 153 0 225 1 157 0 226 1 161 0 227 1 165 0 228 1 169 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 1 189 1 8 1 193 1 9 1 197 1 16 1 201 1 31 1 205 1 57 1 209 1 58 1 213 1 62 1 217 1 64] 
#[0 4 173 0 1] 
#[0 4 177 0 19] 
#[1 0 49 0 11 1 221 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 55 0 105 4 181 0 110 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 249 0 165 1 49 0 173 1 57 0 185 1 253 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 2 25 0 255 2 29 1 1 2 33 1 3 2 37 1 6 2 41 1 7 1 189 1 8 1 193 1 9 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 2 69 1 22 2 73 1 23 2 77 1 24 2 81 1 25 2 85 1 26 2 89 1 27 2 93 1 28 2 97 1 29 2 101 1 30 1 201 1 31 1 205 1 57 1 209 1 58] 
#[1 0 153 0 72 0 195 0 105 4 189 1 9] 
#[1 0 49 0 11 1 221 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 55 0 105 4 193 0 110 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 249 0 165 1 49 0 173 1 57 0 185 1 253 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 2 25 0 255 2 29 1 1 2 33 1 3 2 37 1 6 2 41 1 7 1 189 1 8 1 193 1 9 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 2 69 1 22 2 73 1 23 2 77 1 24 2 81 1 25 2 85 1 26 2 89 1 27 2 93 1 28 2 97 1 29 2 101 1 30 1 201 1 31 1 205 1 57 1 209 1 58] 
#[1 0 49 0 11 1 221 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 55 0 105 4 197 0 110 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 249 0 165 1 49 0 173 1 57 0 185 1 253 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 2 25 0 255 2 29 1 1 2 33 1 3 2 37 1 6 2 41 1 7 1 189 1 8 1 193 1 9 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 2 69 1 22 2 73 1 23 2 77 1 24 2 81 1 25 2 85 1 26 2 89 1 27 2 93 1 28 2 97 1 29 2 101 1 30 1 201 1 31 1 205 1 57 1 209 1 58] 
#[0 0 126 0 1 0 5 0 7 0 8 0 11 0 12 0 13 0 18 0 19 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105] 
#[1 1 62 0 1 1 62 0 5 1 62 0 7 1 62 0 8 1 62 0 11 4 201 0 12 1 62 0 13 1 62 0 18 1 62 0 19 1 62 0 23 1 62 0 24 1 62 0 25 1 62 0 26 1 62 0 27 4 205 0 28 1 62 0 29 1 62 0 30 1 62 0 32 1 62 0 33 1 62 0 34 1 62 0 35 1 62 0 36 1 62 0 37 1 62 0 38 1 62 0 39 1 62 0 40 1 62 0 41 1 62 0 42 1 62 0 45 1 62 0 46 1 62 0 48 1 62 0 72 1 62 0 105 4 209 1 33] 
#[1 1 66 0 5 4 213 0 9 4 217 0 17 1 66 0 96 4 221 1 56] 
#[0 1 70 0 1 0 3 0 4 0 5 0 6 0 10 0 12 0 14 0 15 0 19 0 20 0 28 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 96 0 97 0 98 0 105 1 60] 
#[1 0 22 0 1 0 22 0 3 0 22 0 4 0 22 0 5 0 22 0 6 0 22 0 10 0 22 0 12 0 22 0 14 0 22 0 15 0 22 0 19 0 22 0 20 0 22 0 28 0 22 0 36 0 22 0 44 0 22 0 49 0 22 0 50 0 22 0 51 0 22 0 52 0 22 0 53 0 22 0 54 0 22 0 55 0 22 0 56 0 22 0 57 0 22 0 59 0 22 0 71 0 199 0 72 0 22 0 73 0 22 0 87 0 22 0 89 0 22 0 90 0 22 0 91 0 22 0 93 0 22 0 96 0 22 0 97 0 22 0 98 0 22 0 105 3 85 1 9 0 22 1 60] 
#[1 3 89 0 3 1 74 0 5 1 74 0 20 1 74 0 54 1 74 0 96 1 74 0 105 3 97 0 123 3 101 1 15] 
#[0 1 74 0 5 0 19 0 20 0 54 0 96 0 105] 
#[0 1 78 0 5 0 96] 
#[0 1 82 0 1 0 4 0 5 0 15 0 19 0 20 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 96 0 97 0 98 0 105 1 60] 
#[0 1 82 0 1 0 4 0 5 0 15 0 19 0 20 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 96 0 97 0 98 0 105 1 60] 
#[1 1 86 0 1 3 89 0 3 1 86 0 4 1 86 0 5 1 86 0 15 1 86 0 19 1 86 0 20 3 109 0 28 1 86 0 36 1 86 0 44 1 86 0 49 1 86 0 50 1 86 0 51 1 86 0 52 1 86 0 53 1 86 0 54 1 86 0 55 1 86 0 56 1 86 0 57 1 86 0 59 1 86 0 71 1 86 0 72 1 86 0 73 1 86 0 87 1 86 0 89 1 86 0 90 1 86 0 91 1 86 0 93 1 86 0 96 1 86 0 97 1 86 0 98 1 86 0 105 3 113 0 123 3 101 1 15 1 86 1 60] 
#[1 4 225 0 5 4 229 0 96] 
#[0 1 90 0 5 0 96] 
#[1 0 18 0 25 0 18 0 26 0 18 0 27 0 18 0 29 0 18 0 30 0 18 0 32 0 18 0 33 0 18 0 34 0 18 0 38 0 18 0 48 0 18 0 105 4 233 0 177 4 237 0 247 4 241 0 249] 
#[1 0 41 0 6 4 245 1 64] 
#[0 1 94 0 36] 
#[0 4 249 0 36] 
#[0 1 98 0 36] 
#[0 4 253 0 36] 
#[1 0 49 0 11 1 221 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 55 0 105 5 1 0 110 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 249 0 165 1 49 0 173 1 57 0 185 1 253 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 2 25 0 255 2 29 1 1 2 33 1 3 2 37 1 6 2 41 1 7 1 189 1 8 1 193 1 9 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 2 69 1 22 2 73 1 23 2 77 1 24 2 81 1 25 2 85 1 26 2 89 1 27 2 93 1 28 2 97 1 29 2 101 1 30 1 201 1 31 1 205 1 57 1 209 1 58] 
#[0 2 189 0 12] 
#[0 5 5 0 79] 
#[1 0 49 0 11 0 53 0 12 0 61 0 17 0 65 0 22 0 11 0 25 0 15 0 26 0 19 0 27 0 23 0 29 0 27 0 30 0 31 0 32 0 35 0 33 0 39 0 34 1 102 0 36 0 18 0 38 0 18 0 48 0 153 0 72 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 203 0 105 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 49 0 173 5 9 0 177 1 57 0 185 5 13 0 203 5 17 0 222 1 145 0 223 1 149 0 224 1 153 0 225 1 157 0 226 1 161 0 227 1 165 0 228 1 169 0 229 5 21 0 236 5 25 0 239 5 29 0 240 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 1 189 1 8 1 193 1 9 1 197 1 16 1 201 1 31 1 205 1 57 1 209 1 58] 
#[0 5 33 0 36] 
#[1 5 37 0 15 5 41 0 36] 
#[0 5 45 0 36] 
#[1 5 49 0 3 5 53 0 123 5 57 1 12 5 61 1 14 3 101 1 15] 
#[1 5 49 0 3 1 106 0 12 5 65 0 123 5 69 1 12 5 61 1 14 3 101 1 15] 
#[1 1 86 0 3 1 86 0 5 1 86 0 6 1 86 0 10 1 86 0 12 1 86 0 14 3 109 0 28 1 86 0 36] 
#[0 5 73 0 12] 
#[1 0 49 0 11 1 221 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 55 0 105 2 177 0 110 0 233 0 111 3 245 0 112 2 221 0 113 3 249 0 114 0 241 0 115 0 245 0 116 0 249 0 117 2 229 0 118 3 253 0 119 2 237 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 249 0 165 1 49 0 173 1 57 0 185 1 253 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 2 25 0 255 2 29 1 1 2 33 1 3 2 37 1 6 2 41 1 7 1 189 1 8 1 193 1 9 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 2 69 1 22 2 73 1 23 2 77 1 24 2 81 1 25 2 85 1 26 2 89 1 27 2 93 1 28 2 97 1 29 2 101 1 30 1 201 1 31 1 205 1 57 1 209 1 58] 
#[1 0 126 0 1 0 126 0 2 0 71 0 3 0 126 0 4 0 126 0 5 0 126 0 12 0 126 0 15 0 126 0 19 0 71 0 28 0 126 0 36 0 126 0 44 0 126 0 49 0 126 0 50 0 126 0 51 0 126 0 52 0 126 0 53 0 126 0 54 0 126 0 55 0 126 0 56 0 126 0 57 0 126 0 59 0 126 0 60 0 126 0 61 0 126 0 62 0 126 0 63 0 126 0 64 0 126 0 65 0 126 0 66 0 126 0 67 0 126 0 68 0 126 0 69 0 126 0 70 0 126 0 71 0 99 0 72 0 126 0 73 0 126 0 87 0 126 0 89 0 126 0 90 0 126 0 91 0 126 0 93 0 126 0 94 0 126 0 95 0 126 0 96 0 126 0 97 0 126 0 98 0 22 0 105 3 85 1 9 0 126 1 60] 
#[0 0 210 0 1 0 4 0 5 0 15 0 19 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 96 0 97 0 98 1 60] 
#[0 1 110 0 1 0 4 0 5 0 15 0 19 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 96 0 97 0 98 1 60] 
#[0 1 114 0 1 0 4 0 5 0 15 0 19 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 96 0 97 0 98 1 60] 
#[1 0 41 0 6 0 49 0 11 0 53 0 12 0 57 0 16 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 109 0 36 3 21 0 40 0 145 0 47 0 153 0 72 0 157 0 74 0 161 0 77 0 165 0 78 0 169 0 79 0 173 0 80 0 177 0 81 0 181 0 82 0 185 0 83 0 189 0 84 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 63 0 105 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 49 0 173 1 57 0 185 5 77 0 202 1 73 0 204 1 77 0 205 1 81 0 206 1 85 0 207 1 89 0 208 1 93 0 209 1 97 0 210 1 101 0 211 1 105 0 213 1 109 0 214 1 113 0 215 1 117 0 216 1 121 0 217 1 125 0 218 1 129 0 219 1 133 0 220 1 137 0 221 1 141 0 222 1 145 0 223 1 149 0 224 1 153 0 225 1 157 0 226 1 161 0 227 1 165 0 228 1 169 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 1 189 1 8 1 193 1 9 1 197 1 16 1 201 1 31 1 205 1 57 1 209 1 58 1 213 1 62 1 217 1 64] 
#[0 1 118 0 1 0 3 0 4 0 5 0 6 0 10 0 12 0 14 0 15 0 19 0 20 0 28 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 96 0 97 0 98 0 105 1 60] 
#[0 5 81 0 4] 
#[0 5 85 0 8] 
#[1 1 122 0 1 3 89 0 3 1 122 0 4 1 122 0 5 1 122 0 15 1 122 0 19 1 122 0 20 1 122 0 28 1 122 0 36 1 122 0 44 1 122 0 49 1 122 0 50 1 122 0 51 1 122 0 52 1 122 0 53 1 122 0 54 1 122 0 55 1 122 0 56 1 122 0 57 1 122 0 59 1 122 0 71 1 122 0 72 1 122 0 73 1 122 0 87 1 122 0 89 1 122 0 90 1 122 0 91 1 122 0 93 1 122 0 96 1 122 0 97 1 122 0 98 1 122 0 105 5 89 1 15 1 122 1 60] 
#[0 1 126 0 1 0 3 0 4 0 5 0 6 0 15 0 19 0 20 0 28 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 98 0 105 1 60] 
#[0 5 93 0 8] 
#[0 5 97 0 105] 
#[1 1 122 0 1 3 89 0 3 1 122 0 4 1 122 0 5 1 122 0 15 1 122 0 19 1 122 0 20 1 122 0 28 1 122 0 36 1 122 0 44 1 122 0 49 1 122 0 50 1 122 0 51 1 122 0 52 1 122 0 53 1 122 0 54 1 122 0 55 1 122 0 56 1 122 0 57 1 122 0 59 1 122 0 71 1 122 0 72 1 122 0 73 1 122 0 87 1 122 0 89 1 122 0 90 1 122 0 91 1 122 0 93 1 122 0 96 1 122 0 97 1 122 0 98 1 122 0 105 5 89 1 15 1 122 1 60] 
#[1 0 49 0 11 1 221 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 55 0 105 5 101 0 110 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 249 0 165 1 49 0 173 1 57 0 185 1 253 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 2 25 0 255 2 29 1 1 2 33 1 3 2 37 1 6 2 41 1 7 1 189 1 8 1 193 1 9 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 2 69 1 22 2 73 1 23 2 77 1 24 2 81 1 25 2 85 1 26 2 89 1 27 2 93 1 28 2 97 1 29 2 101 1 30 1 201 1 31 1 205 1 57 1 209 1 58] 
#[1 5 105 0 8 5 109 0 17 5 113 0 22 5 117 0 105] 
#[0 1 130 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105] 
#[0 5 121 0 105] 
#[0 5 125 0 105] 
#[0 5 129 0 105] 
#[0 5 133 0 8] 
#[0 1 134 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 38 0 48 0 105] 
#[1 5 137 0 105 5 141 0 163 5 145 0 164 5 149 0 165 5 153 0 166] 
#[0 1 138 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 38 0 48 0 105] 
#[0 1 142 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 38 0 48 0 105] 
#[0 5 157 0 105] 
#[0 1 146 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[0 1 150 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[1 0 49 0 11 1 221 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 55 0 105 5 161 0 110 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 249 0 165 1 49 0 173 1 57 0 185 1 253 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 2 25 0 255 2 29 1 1 2 33 1 3 2 37 1 6 2 41 1 7 1 189 1 8 1 193 1 9 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 2 69 1 22 2 73 1 23 2 77 1 24 2 81 1 25 2 85 1 26 2 89 1 27 2 93 1 28 2 97 1 29 2 101 1 30 1 201 1 31 1 205 1 57 1 209 1 58] 
#[1 0 153 0 72 5 165 0 92 0 22 0 105 5 169 1 9] 
#[0 5 173 0 12] 
#[0 1 154 0 1 0 4 0 5 0 15 0 19 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 98 1 60] 
#[0 1 158 0 1 0 4 0 5 0 15 0 19 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 98 1 60] 
#[0 1 162 0 11 0 12 0 17 0 22 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 72 0 85 0 86 0 90 0 91 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 1 162 0 11 0 12 0 17 0 22 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 72 0 85 0 86 0 90 0 91 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 1 162 0 11 0 12 0 17 0 22 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 72 0 85 0 86 0 90 0 91 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 1 162 0 11 0 12 0 17 0 22 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 72 0 85 0 86 0 90 0 91 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 1 162 0 11 0 12 0 17 0 22 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 72 0 85 0 86 0 90 0 91 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 1 162 0 11 0 12 0 17 0 22 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 72 0 85 0 86 0 90 0 91 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 1 162 0 11 0 12 0 17 0 22 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 72 0 85 0 86 0 90 0 91 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 1 162 0 11 0 12 0 17 0 22 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 72 0 85 0 86 0 90 0 91 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 1 162 0 11 0 12 0 17 0 22 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 72 0 85 0 86 0 90 0 91 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 1 162 0 11 0 12 0 17 0 22 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 72 0 85 0 86 0 90 0 91 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 1 162 0 11 0 12 0 17 0 22 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 72 0 85 0 86 0 90 0 91 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 1 162 0 11 0 12 0 17 0 22 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 72 0 85 0 86 0 90 0 91 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[1 0 49 0 11 1 221 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 55 0 105 5 177 0 110 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 249 0 165 1 49 0 173 1 57 0 185 1 253 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 2 25 0 255 2 29 1 1 2 33 1 3 2 37 1 6 2 41 1 7 1 189 1 8 1 193 1 9 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 2 69 1 22 2 73 1 23 2 77 1 24 2 81 1 25 2 85 1 26 2 89 1 27 2 93 1 28 2 97 1 29 2 101 1 30 1 201 1 31 1 205 1 57 1 209 1 58] 
#[1 3 89 0 3 1 74 0 19 3 93 0 28 3 97 0 123 3 101 1 15] 
#[0 5 181 0 19] 
#[1 1 82 0 19 3 105 0 28] 
#[0 1 166 0 5 0 19] 
#[1 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 3 145 0 38 0 149 0 48 2 213 0 105 2 217 0 112 2 221 0 113 5 185 0 114 0 241 0 115 0 245 0 116 0 249 0 117 2 229 0 118 2 233 0 119 2 237 0 120 3 153 0 145 1 205 1 57 1 209 1 58 3 157 1 59] 
#[0 5 189 0 19] 
#[1 1 166 0 5 1 166 0 19 0 222 0 88] 
#[1 5 193 0 5 1 170 0 19] 
#[0 1 174 0 5 0 19] 
#[0 1 178 0 1 0 4 0 5 0 15 0 19 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 96 0 97 0 98 1 60] 
#[0 1 182 0 1 0 4 0 5 0 15 0 19 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 96 0 97 0 98 1 60] 
#[0 1 186 0 1 0 4 0 5 0 15 0 19 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 96 0 97 0 98 1 60] 
#[0 1 190 0 1 0 4 0 5 0 15 0 19 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 96 0 97 0 98 1 60] 
#[0 5 197 0 4] 
#[1 0 41 0 6 0 49 0 11 1 221 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 55 0 105 5 201 0 110 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 249 0 165 1 49 0 173 1 57 0 185 1 253 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 2 25 0 255 5 205 1 0 2 29 1 1 2 33 1 3 2 37 1 6 2 41 1 7 1 189 1 8 1 193 1 9 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 2 69 1 22 2 73 1 23 2 77 1 24 2 81 1 25 2 85 1 26 2 89 1 27 2 93 1 28 2 97 1 29 2 101 1 30 1 201 1 31 1 205 1 57 1 209 1 58 5 209 1 64] 
#[0 5 213 0 105] 
#[1 0 49 0 11 3 61 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 67 0 105 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 49 0 173 1 57 0 185 3 69 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 1 189 1 8 1 193 1 9 2 45 1 16 5 217 1 17 2 53 1 18 2 57 1 19 1 201 1 31 1 205 1 57 1 209 1 58] 
#[1 0 49 0 11 3 61 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 67 0 105 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 49 0 173 1 57 0 185 3 69 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 1 189 1 8 1 193 1 9 2 45 1 16 5 221 1 17 2 53 1 18 2 57 1 19 1 201 1 31 1 205 1 57 1 209 1 58] 
#[1 0 49 0 11 3 61 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 67 0 105 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 49 0 173 1 57 0 185 3 69 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 1 189 1 8 1 193 1 9 2 45 1 16 5 225 1 17 2 53 1 18 2 57 1 19 1 201 1 31 1 205 1 57 1 209 1 58] 
#[1 0 49 0 11 3 61 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 67 0 105 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 49 0 173 1 57 0 185 3 69 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 1 189 1 8 1 193 1 9 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 5 229 1 20 1 201 1 31 1 205 1 57 1 209 1 58] 
#[1 0 49 0 11 3 61 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 67 0 105 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 49 0 173 1 57 0 185 3 69 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 1 189 1 8 1 193 1 9 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 5 233 1 20 1 201 1 31 1 205 1 57 1 209 1 58] 
#[1 0 49 0 11 3 61 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 67 0 105 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 49 0 173 1 57 0 185 3 69 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 1 189 1 8 1 193 1 9 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 5 237 1 21 1 201 1 31 1 205 1 57 1 209 1 58] 
#[1 0 49 0 11 3 61 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 67 0 105 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 49 0 173 1 57 0 185 3 69 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 1 189 1 8 1 193 1 9 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 5 241 1 21 1 201 1 31 1 205 1 57 1 209 1 58] 
#[1 0 49 0 11 3 61 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 67 0 105 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 49 0 173 1 57 0 185 3 69 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 1 189 1 8 1 193 1 9 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 5 245 1 21 1 201 1 31 1 205 1 57 1 209 1 58] 
#[1 0 49 0 11 3 61 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 67 0 105 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 49 0 173 1 57 0 185 3 69 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 1 189 1 8 1 193 1 9 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 5 249 1 22 1 201 1 31 1 205 1 57 1 209 1 58] 
#[1 0 49 0 11 3 61 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 67 0 105 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 49 0 173 1 57 0 185 3 69 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 1 189 1 8 1 193 1 9 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 5 253 1 22 1 201 1 31 1 205 1 57 1 209 1 58] 
#[1 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 2 213 0 105 6 1 0 112 6 5 0 113 0 241 0 115 0 245 0 116 0 249 0 117 2 229 0 118 2 233 0 119 2 237 0 120 1 205 1 57 1 209 1 58] 
#[1 0 49 0 11 3 61 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 67 0 105 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 49 0 173 1 57 0 185 3 69 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 1 189 1 8 1 193 1 9 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 6 9 1 22 1 201 1 31 1 205 1 57 1 209 1 58] 
#[1 0 49 0 11 3 61 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 67 0 105 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 49 0 173 1 57 0 185 3 69 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 1 189 1 8 1 193 1 9 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 6 13 1 22 1 201 1 31 1 205 1 57 1 209 1 58] 
#[1 0 49 0 11 3 61 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 67 0 105 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 49 0 173 1 57 0 185 3 69 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 1 189 1 8 1 193 1 9 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 2 69 1 22 6 17 1 23 1 201 1 31 1 205 1 57 1 209 1 58] 
#[1 0 49 0 11 3 61 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 67 0 105 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 49 0 173 1 57 0 185 3 69 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 1 189 1 8 1 193 1 9 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 2 69 1 22 6 21 1 23 1 201 1 31 1 205 1 57 1 209 1 58] 
#[1 0 49 0 11 3 61 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 67 0 105 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 49 0 173 1 57 0 185 3 69 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 1 189 1 8 1 193 1 9 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 2 69 1 22 2 73 1 23 6 25 1 24 1 201 1 31 1 205 1 57 1 209 1 58] 
#[1 0 49 0 11 3 61 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 67 0 105 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 49 0 173 1 57 0 185 3 69 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 1 189 1 8 1 193 1 9 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 2 69 1 22 2 73 1 23 2 77 1 24 6 29 1 25 1 201 1 31 1 205 1 57 1 209 1 58] 
#[1 0 49 0 11 3 61 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 67 0 105 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 49 0 173 1 57 0 185 3 69 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 1 189 1 8 1 193 1 9 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 2 69 1 22 2 73 1 23 2 77 1 24 2 81 1 25 6 33 1 26 1 201 1 31 1 205 1 57 1 209 1 58] 
#[1 0 49 0 11 3 61 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 67 0 105 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 49 0 173 1 57 0 185 3 69 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 1 189 1 8 1 193 1 9 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 2 69 1 22 2 73 1 23 2 77 1 24 2 81 1 25 2 85 1 26 6 37 1 27 1 201 1 31 1 205 1 57 1 209 1 58] 
#[1 0 49 0 11 3 61 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 67 0 105 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 49 0 173 1 57 0 185 3 69 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 1 189 1 8 1 193 1 9 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 2 69 1 22 2 73 1 23 2 77 1 24 2 81 1 25 2 85 1 26 2 89 1 27 6 41 1 28 1 201 1 31 1 205 1 57 1 209 1 58] 
#[1 0 49 0 11 1 221 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 55 0 105 6 45 0 110 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 249 0 165 1 49 0 173 1 57 0 185 1 253 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 2 25 0 255 2 29 1 1 2 33 1 3 2 37 1 6 2 41 1 7 1 189 1 8 1 193 1 9 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 2 69 1 22 2 73 1 23 2 77 1 24 2 81 1 25 2 85 1 26 2 89 1 27 2 93 1 28 2 97 1 29 2 101 1 30 1 201 1 31 1 205 1 57 1 209 1 58] 
#[0 6 49 0 18] 
#[0 1 194 0 105] 
#[1 2 197 0 105 1 5 0 124 1 9 0 125 6 53 0 126] 
#[0 1 198 0 7 0 8 0 13 0 18 0 23 0 24 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 1 60] 
#[0 1 202 1 60] 
#[1 0 45 0 7 0 14 0 8 0 14 0 13 0 14 0 18 0 69 0 23 0 73 0 24 2 105 0 36 0 113 0 37 0 117 0 38 0 121 0 39 2 109 0 40 0 129 0 41 0 133 0 42 0 137 0 45 0 141 0 46 0 59 0 48 6 57 0 109 2 117 0 139 2 121 0 140 2 125 0 141 1 29 0 142 2 129 0 143 1 37 0 144 1 41 0 145 1 45 0 150 1 206 1 60] 
#[0 1 210 0 7 0 8 0 13 0 18 0 23 0 24 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 45 0 46 0 48 1 60] 
#[1 4 205 0 28 6 61 0 36] 
#[0 1 214 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 1 218 0 1 0 4 0 5 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 87 0 89 0 90 0 91 0 92 0 93 0 94 0 95 0 96 0 97 0 98 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[0 1 222 0 1 0 3 0 4 0 5 0 15 0 19 0 28 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 98 1 60] 
#[0 6 65 0 19] 
#[0 1 226 0 1 0 2 0 3 0 4 0 5 0 15 0 19 0 28 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 60 0 61 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 98 1 60] 
#[0 6 69 0 105] 
#[0 6 73 0 19] 
#[0 6 77 0 19] 
#[1 6 81 0 6 0 49 0 11 3 61 0 12 0 61 0 17 1 230 0 19 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 149 0 48 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 207 0 105 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 6 89 0 145 1 49 0 173 1 57 0 185 3 69 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 1 189 1 8 1 193 1 9 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 2 69 1 22 2 73 1 23 2 77 1 24 2 81 1 25 2 85 1 26 2 89 1 27 2 93 1 28 2 97 1 29 6 93 1 30 1 201 1 31 6 97 1 34 6 101 1 35 6 105 1 36 6 109 1 37 6 113 1 38 1 205 1 57 1 209 1 58] 
#[0 5 117 0 105] 
#[0 1 234 0 1 0 5 0 7 0 8 0 11 0 13 0 18 0 19 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105] 
#[1 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 2 213 0 105 2 217 0 112 2 221 0 113 6 117 0 114 0 241 0 115 0 245 0 116 0 249 0 117 2 229 0 118 2 233 0 119 2 237 0 120 1 205 1 57 1 209 1 58] 
#[1 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 2 213 0 105 2 217 0 112 2 221 0 113 6 121 0 114 0 241 0 115 0 245 0 116 0 249 0 117 2 229 0 118 2 233 0 119 2 237 0 120 1 205 1 57 1 209 1 58] 
#[0 1 238 0 5 0 96] 
#[1 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 2 205 0 59 2 213 0 105 2 217 0 112 2 221 0 113 2 225 0 114 0 241 0 115 0 245 0 116 0 249 0 117 2 229 0 118 2 233 0 119 2 237 0 120 6 125 1 55 1 205 1 57 1 209 1 58] 
#[0 1 242 0 1 0 3 0 4 0 5 0 6 0 10 0 12 0 14 0 15 0 19 0 20 0 28 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 96 0 97 0 98 0 105 1 60] 
#[1 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 3 145 0 38 0 149 0 48 2 213 0 105 2 217 0 112 2 221 0 113 6 129 0 114 0 241 0 115 0 245 0 116 0 249 0 117 2 229 0 118 2 233 0 119 2 237 0 120 3 153 0 145 1 205 1 57 1 209 1 58 3 157 1 59] 
#[1 1 246 0 19 6 133 0 36 6 137 0 248] 
#[0 1 250 0 19 0 36] 
#[1 6 141 0 75 1 254 0 76 6 145 0 244 6 149 0 245 6 153 0 250] 
#[0 2 2 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[0 2 6 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[0 6 157 0 19] 
#[0 6 161 0 12] 
#[1 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 3 145 0 38 0 149 0 48 2 213 0 105 2 217 0 112 2 221 0 113 6 165 0 114 0 241 0 115 0 245 0 116 0 249 0 117 2 229 0 118 2 233 0 119 2 237 0 120 3 153 0 145 1 205 1 57 1 209 1 58 3 157 1 59] 
#[0 2 10 0 36] 
#[0 2 14 0 5 0 19 0 36] 
#[0 6 169 0 36] 
#[0 2 18 0 36] 
#[1 6 173 0 5 2 10 0 36] 
#[0 2 22 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[1 0 49 0 11 1 221 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 55 0 105 6 177 0 110 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 249 0 165 1 49 0 173 1 57 0 185 1 253 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 2 25 0 255 2 29 1 1 2 33 1 3 2 37 1 6 2 41 1 7 1 189 1 8 1 193 1 9 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 2 69 1 22 2 73 1 23 2 77 1 24 2 81 1 25 2 85 1 26 2 89 1 27 2 93 1 28 2 97 1 29 2 101 1 30 1 201 1 31 1 205 1 57 1 209 1 58] 
#[0 2 26 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[0 2 30 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[1 5 81 0 4 0 49 0 11 1 221 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 55 0 105 6 181 0 110 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 249 0 165 1 49 0 173 1 57 0 185 1 253 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 2 25 0 255 2 29 1 1 2 33 1 3 2 37 1 6 2 41 1 7 1 189 1 8 1 193 1 9 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 2 69 1 22 2 73 1 23 2 77 1 24 2 81 1 25 2 85 1 26 2 89 1 27 2 93 1 28 2 97 1 29 2 101 1 30 1 201 1 31 1 205 1 57 1 209 1 58] 
#[1 3 89 0 3 6 185 0 6 6 189 0 168 5 89 1 15] 
#[1 2 34 0 1 5 49 0 3 2 34 0 4 2 34 0 5 2 34 0 15 2 34 0 19 2 34 0 28 2 34 0 36 2 34 0 44 2 34 0 49 2 34 0 50 2 34 0 51 2 34 0 52 2 34 0 53 2 34 0 54 2 34 0 55 2 34 0 56 2 34 0 57 2 34 0 59 2 34 0 71 2 34 0 72 2 34 0 73 2 34 0 87 2 34 0 89 2 34 0 90 2 34 0 91 2 34 0 93 2 34 0 94 2 34 0 95 2 34 0 96 2 34 0 97 2 34 0 98 6 193 0 123 6 197 1 13 6 201 1 14 3 101 1 15 2 34 1 60] 
#[0 2 38 0 1 0 3 0 4 0 5 0 15 0 19 0 28 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 98 1 60] 
#[1 3 89 0 3 6 185 0 6 6 205 0 168 5 89 1 15] 
#[1 2 34 0 1 5 49 0 3 2 34 0 4 2 34 0 5 2 34 0 15 2 34 0 19 2 34 0 28 2 34 0 36 2 34 0 44 2 34 0 49 2 34 0 50 2 34 0 51 2 34 0 52 2 34 0 53 2 34 0 54 2 34 0 55 2 34 0 56 2 34 0 57 2 34 0 59 2 34 0 71 2 34 0 72 2 34 0 73 2 34 0 87 2 34 0 89 2 34 0 90 2 34 0 91 2 34 0 93 2 34 0 94 2 34 0 95 2 34 0 96 2 34 0 97 2 34 0 98 6 193 0 123 6 209 1 13 6 201 1 14 3 101 1 15 2 34 1 60] 
#[1 0 49 0 11 1 221 0 12 0 61 0 17 2 42 0 19 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 55 0 105 6 213 0 110 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 249 0 165 1 49 0 173 6 217 0 184 1 57 0 185 1 253 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 2 25 0 255 2 29 1 1 2 33 1 3 2 37 1 6 2 41 1 7 1 189 1 8 1 193 1 9 6 221 1 11 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 2 69 1 22 2 73 1 23 2 77 1 24 2 81 1 25 2 85 1 26 2 89 1 27 2 93 1 28 2 97 1 29 2 101 1 30 1 201 1 31 1 205 1 57 1 209 1 58] 
#[0 2 46 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[0 2 50 0 1 0 3 0 4 0 5 0 6 0 15 0 19 0 20 0 28 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 98 0 105 1 60] 
#[0 2 54 0 1 0 3 0 4 0 5 0 15 0 19 0 28 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 98 1 60] 
#[0 2 58 0 1 0 3 0 4 0 5 0 6 0 15 0 19 0 20 0 28 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 98 0 105 1 60] 
#[0 2 54 0 1 0 3 0 4 0 5 0 15 0 19 0 28 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 98 1 60] 
#[1 0 22 0 1 0 22 0 3 0 22 0 4 0 22 0 5 0 22 0 6 0 22 0 10 0 22 0 12 0 22 0 14 0 22 0 15 0 22 0 19 0 22 0 20 0 22 0 28 0 22 0 36 0 22 0 44 0 22 0 49 0 22 0 50 0 22 0 51 0 22 0 52 0 22 0 53 0 22 0 54 0 22 0 55 0 22 0 56 0 22 0 57 0 22 0 59 0 22 0 71 0 199 0 72 0 22 0 73 0 22 0 87 0 22 0 89 0 22 0 90 0 22 0 91 0 22 0 93 0 22 0 96 0 22 0 97 0 22 0 98 0 22 0 105 6 225 1 9 0 22 1 60] 
#[0 6 229 0 4] 
#[0 2 62 0 1 0 3 0 4 0 5 0 15 0 19 0 28 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 98 1 60] 
#[0 6 233 0 28] 
#[0 2 66 0 1 0 3 0 4 0 5 0 15 0 19 0 28 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 98 1 60] 
#[0 2 70 0 1 0 2 0 3 0 4 0 5 0 7 0 8 0 11 0 12 0 13 0 15 0 18 0 19 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 60 0 61 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 98 0 105 1 60] 
#[1 2 74 0 6 2 74 0 9 2 74 0 10 6 237 0 72 6 241 0 146] 
#[1 2 78 0 6 6 245 0 10 6 249 0 148 6 253 0 153] 
#[1 2 74 0 6 2 74 0 9 6 237 0 72 7 1 0 146] 
#[0 2 54 0 1 0 3 0 4 0 5 0 15 0 19 0 28 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 98 1 60] 
#[0 0 202 0 2 0 3 0 5 0 15 0 19 0 36] 
#[1 7 5 0 5 2 82 0 36] 
#[0 2 86 0 5 0 36] 
#[1 7 9 0 2 4 41 0 3 2 90 0 5 2 90 0 36] 
#[0 2 94 0 5 0 36] 
#[0 2 98 0 1 0 2 0 3 0 4 0 5 0 15 0 19 0 28 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 60 0 61 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 98 1 60] 
#[0 7 13 0 4] 
#[1 0 153 0 72 0 22 0 105 7 17 1 9] 
#[0 7 21 0 105] 
#[1 0 49 0 11 1 221 0 12 0 61 0 17 2 42 0 19 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 55 0 105 6 213 0 110 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 249 0 165 1 49 0 173 7 25 0 184 1 57 0 185 1 253 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 2 25 0 255 2 29 1 1 2 33 1 3 2 37 1 6 2 41 1 7 1 189 1 8 1 193 1 9 6 221 1 11 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 2 69 1 22 2 73 1 23 2 77 1 24 2 81 1 25 2 85 1 26 2 89 1 27 2 93 1 28 2 97 1 29 2 101 1 30 1 201 1 31 1 205 1 57 1 209 1 58] 
#[0 2 102 0 1 0 4 0 5 0 15 0 19 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 96 0 97 0 98 1 60] 
#[1 0 49 0 11 3 61 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 0 193 0 92 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 67 0 105 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 7 29 0 126 1 49 0 173 1 57 0 185 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 7 33 0 253 7 37 0 254 1 189 1 8 1 193 1 9 2 45 1 16 7 41 1 18 2 57 1 19 1 205 1 57 1 209 1 58] 
#[1 7 45 0 20 5 137 0 105 7 49 0 165] 
#[0 2 106 0 88] 
#[1 0 18 0 25 0 18 0 26 0 18 0 27 0 18 0 29 0 18 0 30 0 18 0 32 0 18 0 33 0 18 0 34 0 18 0 38 0 18 0 48 0 211 0 105 1 249 0 165 4 1 0 176 4 5 0 177 7 53 1 3 7 57 1 5] 
#[0 2 110 0 2 0 3 0 5 0 15 0 19 0 36 0 88] 
#[0 2 114 0 1 0 4 0 5 0 15 0 19 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 96 0 97 0 98 1 60] 
#[0 2 118 0 1 0 4 0 5 0 15 0 19 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 96 0 97 0 98 1 60] 
#[0 2 114 0 1 0 4 0 5 0 15 0 19 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 96 0 97 0 98 1 60] 
#[0 2 122 0 1 0 4 0 5 0 15 0 19 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 96 0 97 0 98 1 60] 
#[0 2 126 0 1 0 4 0 5 0 15 0 19 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 96 0 97 0 98 1 60] 
#[0 2 126 0 1 0 4 0 5 0 15 0 19 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 96 0 97 0 98 1 60] 
#[0 2 126 0 1 0 4 0 5 0 15 0 19 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 96 0 97 0 98 1 60] 
#[1 2 130 0 1 2 130 0 4 2 130 0 5 2 130 0 15 2 130 0 19 2 130 0 36 0 215 0 44 2 130 0 49 2 130 0 50 2 130 0 51 2 130 0 52 2 130 0 53 2 130 0 54 2 130 0 55 2 130 0 56 2 130 0 57 2 130 0 59 2 130 0 71 2 130 0 72 2 130 0 73 0 219 0 87 0 223 0 89 2 130 0 90 2 130 0 91 2 130 0 93 2 130 0 96 2 130 0 97 2 130 0 98 2 130 1 60] 
#[1 2 130 0 1 2 130 0 4 2 130 0 5 2 130 0 15 2 130 0 19 2 130 0 36 0 215 0 44 2 130 0 49 2 130 0 50 2 130 0 51 2 130 0 52 2 130 0 53 2 130 0 54 2 130 0 55 2 130 0 56 2 130 0 57 2 130 0 59 2 130 0 71 2 130 0 72 2 130 0 73 0 219 0 87 0 223 0 89 2 130 0 90 2 130 0 91 2 130 0 93 2 130 0 96 2 130 0 97 2 130 0 98 2 130 1 60] 
#[1 2 134 0 1 2 134 0 4 2 134 0 5 2 134 0 15 2 134 0 19 2 134 0 36 2 134 0 44 2 134 0 49 2 134 0 50 2 134 0 51 2 134 0 52 2 134 0 53 2 134 0 54 2 134 0 55 2 134 0 56 2 134 0 57 2 134 0 59 2 134 0 71 2 134 0 72 2 134 0 73 2 134 0 87 2 134 0 89 0 227 0 90 0 231 0 91 2 134 0 93 2 134 0 96 2 134 0 97 2 134 0 98 2 134 1 60] 
#[1 2 134 0 1 2 134 0 4 2 134 0 5 2 134 0 15 2 134 0 19 2 134 0 36 2 134 0 44 2 134 0 49 2 134 0 50 2 134 0 51 2 134 0 52 2 134 0 53 2 134 0 54 2 134 0 55 2 134 0 56 2 134 0 57 2 134 0 59 2 134 0 71 2 134 0 72 2 134 0 73 2 134 0 87 2 134 0 89 0 227 0 90 0 231 0 91 2 134 0 93 2 134 0 96 2 134 0 97 2 134 0 98 2 134 1 60] 
#[1 2 134 0 1 2 134 0 4 2 134 0 5 2 134 0 15 2 134 0 19 2 134 0 36 2 134 0 44 2 134 0 49 2 134 0 50 2 134 0 51 2 134 0 52 2 134 0 53 2 134 0 54 2 134 0 55 2 134 0 56 2 134 0 57 2 134 0 59 2 134 0 71 2 134 0 72 2 134 0 73 2 134 0 87 2 134 0 89 0 227 0 90 0 231 0 91 2 134 0 93 2 134 0 96 2 134 0 97 2 134 0 98 2 134 1 60] 
#[1 2 138 0 1 2 138 0 4 2 138 0 5 2 138 0 15 2 138 0 19 2 138 0 36 2 138 0 44 2 138 0 49 2 138 0 50 2 138 0 51 2 138 0 52 2 138 0 53 2 138 0 54 2 138 0 55 2 138 0 56 2 138 0 57 2 138 0 59 2 138 0 71 2 138 0 72 0 235 0 73 2 138 0 87 2 138 0 89 2 138 0 90 2 138 0 91 2 138 0 93 2 138 0 96 0 239 0 97 0 243 0 98 2 138 1 60] 
#[1 2 138 0 1 2 138 0 4 2 138 0 5 2 138 0 15 2 138 0 19 2 138 0 36 2 138 0 44 2 138 0 49 2 138 0 50 2 138 0 51 2 138 0 52 2 138 0 53 2 138 0 54 2 138 0 55 2 138 0 56 2 138 0 57 2 138 0 59 2 138 0 71 2 138 0 72 0 235 0 73 2 138 0 87 2 138 0 89 2 138 0 90 2 138 0 91 2 138 0 93 2 138 0 96 0 239 0 97 0 243 0 98 2 138 1 60] 
#[1 3 89 0 3 3 97 0 123 3 101 1 15] 
#[0 2 138 0 1 0 4 0 5 0 15 0 19 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 96 0 97 0 98 1 60] 
#[1 2 138 0 1 2 138 0 4 2 138 0 5 2 138 0 15 2 138 0 19 2 138 0 36 2 138 0 44 2 138 0 49 2 138 0 50 2 138 0 51 2 138 0 52 2 138 0 53 2 138 0 54 2 138 0 55 2 138 0 56 2 138 0 57 2 138 0 59 2 138 0 71 2 138 0 72 0 235 0 73 2 138 0 87 2 138 0 89 2 138 0 90 2 138 0 91 2 138 0 93 2 138 0 96 0 239 0 97 0 243 0 98 2 138 1 60] 
#[1 2 138 0 1 2 138 0 4 2 138 0 5 2 138 0 15 2 138 0 19 2 138 0 36 2 138 0 44 2 138 0 49 2 138 0 50 2 138 0 51 2 138 0 52 2 138 0 53 2 138 0 54 2 138 0 55 2 138 0 56 2 138 0 57 2 138 0 59 2 138 0 71 2 138 0 72 0 235 0 73 2 138 0 87 2 138 0 89 2 138 0 90 2 138 0 91 2 138 0 93 2 138 0 96 0 239 0 97 0 243 0 98 2 138 1 60] 
#[1 2 142 0 1 2 142 0 4 2 142 0 5 2 142 0 15 2 142 0 19 2 142 0 36 2 142 0 44 2 142 0 49 2 142 0 50 2 142 0 51 2 142 0 52 2 142 0 53 2 142 0 54 0 247 0 55 0 251 0 56 0 255 0 57 2 142 0 59 2 142 0 71 1 3 0 72 2 142 0 73 2 142 0 87 2 142 0 89 2 142 0 90 2 142 0 91 2 142 0 93 1 7 0 96 2 142 0 97 2 142 0 98 2 142 1 60] 
#[1 2 142 0 1 2 142 0 4 2 142 0 5 2 142 0 15 2 142 0 19 2 142 0 36 2 142 0 44 2 142 0 49 2 142 0 50 2 142 0 51 2 142 0 52 2 142 0 53 2 142 0 54 0 247 0 55 0 251 0 56 0 255 0 57 2 142 0 59 2 142 0 71 1 3 0 72 2 142 0 73 2 142 0 87 2 142 0 89 2 142 0 90 2 142 0 91 2 142 0 93 1 7 0 96 2 142 0 97 2 142 0 98 2 142 1 60] 
#[1 2 146 0 1 2 146 0 4 2 146 0 5 2 146 0 15 2 146 0 19 2 146 0 36 2 146 0 44 2 146 0 49 2 146 0 50 2 146 0 51 2 146 0 52 1 11 0 53 2 146 0 54 2 146 0 55 2 146 0 56 2 146 0 57 2 146 0 59 1 15 0 71 2 146 0 72 2 146 0 73 2 146 0 87 2 146 0 89 2 146 0 90 2 146 0 91 2 146 0 93 2 146 0 96 2 146 0 97 2 146 0 98 2 146 1 60] 
#[1 2 150 0 1 2 150 0 4 2 150 0 5 2 150 0 15 2 150 0 19 2 150 0 36 2 150 0 44 2 150 0 49 2 150 0 50 2 150 0 51 2 150 0 52 2 150 0 53 1 19 0 54 2 150 0 55 2 150 0 56 2 150 0 57 2 150 0 59 2 150 0 71 2 150 0 72 2 150 0 73 2 150 0 87 2 150 0 89 2 150 0 90 2 150 0 91 2 150 0 93 2 150 0 96 2 150 0 97 2 150 0 98 2 150 1 60] 
#[1 2 154 0 1 2 154 0 4 2 154 0 5 2 154 0 15 2 154 0 19 2 154 0 36 2 154 0 44 1 23 0 49 2 154 0 50 2 154 0 51 2 154 0 52 2 154 0 53 2 154 0 54 2 154 0 55 2 154 0 56 2 154 0 57 2 154 0 59 2 154 0 71 2 154 0 72 2 154 0 73 2 154 0 87 2 154 0 89 2 154 0 90 2 154 0 91 2 154 0 93 2 154 0 96 2 154 0 97 2 154 0 98 2 154 1 60] 
#[1 2 158 0 1 2 158 0 4 2 158 0 5 2 158 0 15 2 158 0 19 2 158 0 36 2 158 0 44 2 158 0 49 1 27 0 50 2 158 0 51 2 158 0 52 2 158 0 53 2 158 0 54 2 158 0 55 2 158 0 56 2 158 0 57 2 158 0 59 2 158 0 71 2 158 0 72 2 158 0 73 2 158 0 87 2 158 0 89 2 158 0 90 2 158 0 91 2 158 0 93 2 158 0 96 2 158 0 97 2 158 0 98 2 158 1 60] 
#[1 2 162 0 1 2 162 0 4 2 162 0 5 2 162 0 15 2 162 0 19 2 162 0 36 2 162 0 44 2 162 0 49 2 162 0 50 1 31 0 51 2 162 0 52 2 162 0 53 2 162 0 54 2 162 0 55 2 162 0 56 2 162 0 57 2 162 0 59 2 162 0 71 2 162 0 72 2 162 0 73 2 162 0 87 2 162 0 89 2 162 0 90 2 162 0 91 2 162 0 93 2 162 0 96 2 162 0 97 2 162 0 98 2 162 1 60] 
#[0 7 61 0 15] 
#[0 7 65 0 105] 
#[1 7 69 0 28 7 73 0 36] 
#[0 2 166 0 7 0 8 0 13 0 18 0 23 0 24 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 1 60] 
#[0 2 170 0 7 0 8 0 13 0 18 0 23 0 24 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 45 0 46 0 48 1 60] 
#[1 0 41 0 6 0 49 0 11 0 53 0 12 0 57 0 16 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 109 0 36 3 21 0 40 0 145 0 47 0 153 0 72 0 157 0 74 0 161 0 77 0 165 0 78 0 169 0 79 0 173 0 80 0 177 0 81 0 181 0 82 0 185 0 83 0 189 0 84 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 63 0 105 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 49 0 173 1 57 0 185 7 77 0 202 1 73 0 204 1 77 0 205 1 81 0 206 1 85 0 207 1 89 0 208 1 93 0 209 1 97 0 210 1 101 0 211 1 105 0 213 1 109 0 214 1 113 0 215 1 117 0 216 1 121 0 217 1 125 0 218 1 129 0 219 1 133 0 220 1 137 0 221 1 141 0 222 1 145 0 223 1 149 0 224 1 153 0 225 1 157 0 226 1 161 0 227 1 165 0 228 1 169 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 1 189 1 8 1 193 1 9 1 197 1 16 1 201 1 31 1 205 1 57 1 209 1 58 1 213 1 62 1 217 1 64] 
#[0 7 81 0 12] 
#[1 0 41 0 6 7 85 1 64] 
#[1 7 89 0 6 7 93 0 230] 
#[1 2 174 0 1 2 174 0 5 6 81 0 6 0 49 0 11 3 61 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 149 0 48 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 67 0 105 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 6 89 0 145 1 49 0 173 1 57 0 185 3 69 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 1 189 1 8 1 193 1 9 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 2 69 1 22 2 73 1 23 2 77 1 24 2 81 1 25 2 85 1 26 2 89 1 27 2 93 1 28 2 97 1 29 6 93 1 30 1 201 1 31 7 97 1 36 6 113 1 38 7 101 1 39 7 105 1 41 1 205 1 57 1 209 1 58] 
#[1 1 35 0 2 0 71 0 3 0 126 0 19 0 71 0 28 0 126 0 44 0 126 0 49 0 126 0 50 0 126 0 51 0 126 0 52 0 126 0 53 0 126 0 54 0 126 0 55 0 126 0 56 0 126 0 57 0 126 0 59 0 126 0 60 0 126 0 61 0 126 0 62 0 126 0 63 0 126 0 64 0 126 0 65 0 126 0 66 0 126 0 67 0 126 0 68 0 126 0 69 0 126 0 70 0 126 0 71 0 99 0 72 0 126 0 73 0 126 0 87 0 126 0 89 0 126 0 90 0 126 0 91 0 126 0 94 0 126 0 95 0 126 0 96 0 126 0 97 0 126 0 98 3 85 1 9] 
#[0 2 178 0 1 0 5 0 19] 
#[0 2 178 0 1 0 5 0 19] 
#[0 7 113 0 19] 
#[1 7 117 0 5 2 182 0 19] 
#[0 2 186 0 19] 
#[0 2 190 0 5 0 19] 
#[0 2 178 0 1 0 5 0 19] 
#[0 2 194 0 5 0 96] 
#[0 2 194 0 5 0 96] 
#[0 2 198 0 5 0 96] 
#[1 5 137 0 105 7 121 0 165 7 125 0 166] 
#[1 2 202 0 19 0 18 0 25 0 18 0 26 0 18 0 27 0 18 0 29 0 18 0 30 0 18 0 32 0 18 0 33 0 18 0 34 0 18 0 38 0 18 0 48 0 18 0 105 4 233 0 177 7 129 0 249] 
#[0 7 133 0 19] 
#[0 7 137 0 12] 
#[1 2 206 0 1 2 206 0 6 2 206 0 7 2 206 0 8 2 206 0 11 2 206 0 12 2 206 0 13 2 206 0 14 2 206 0 16 2 206 0 17 2 206 0 18 2 206 0 22 2 206 0 23 2 206 0 24 2 206 0 25 2 206 0 26 2 206 0 27 2 206 0 29 2 206 0 30 2 206 0 31 2 206 0 32 2 206 0 33 2 206 0 34 2 206 0 36 2 206 0 37 2 206 0 38 2 206 0 39 2 206 0 40 2 206 0 41 2 206 0 42 2 206 0 45 2 206 0 46 2 206 0 47 2 206 0 48 2 206 0 58 2 206 0 72 2 206 0 74 6 141 0 75 2 210 0 76 2 206 0 77 2 206 0 78 2 206 0 79 2 206 0 80 2 206 0 81 2 206 0 82 2 206 0 83 2 206 0 84 2 206 0 92 2 206 0 94 2 206 0 95 2 206 0 99 2 206 0 100 2 206 0 101 2 206 0 102 2 206 0 103 2 206 0 104 2 206 0 105 7 141 0 250 2 206 1 60] 
#[1 7 145 0 76 7 149 0 246] 
#[0 2 214 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[1 0 41 0 6 0 49 0 11 0 53 0 12 0 57 0 16 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 109 0 36 3 21 0 40 0 145 0 47 0 153 0 72 0 157 0 74 0 161 0 77 0 165 0 78 0 169 0 79 0 173 0 80 0 177 0 81 0 181 0 82 0 185 0 83 0 189 0 84 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 63 0 105 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 49 0 173 1 57 0 185 7 153 0 202 1 73 0 204 1 77 0 205 1 81 0 206 1 85 0 207 1 89 0 208 1 93 0 209 1 97 0 210 1 101 0 211 1 105 0 213 1 109 0 214 1 113 0 215 1 117 0 216 1 121 0 217 1 125 0 218 1 129 0 219 1 133 0 220 1 137 0 221 1 141 0 222 1 145 0 223 1 149 0 224 1 153 0 225 1 157 0 226 1 161 0 227 1 165 0 228 1 169 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 1 189 1 8 1 193 1 9 1 197 1 16 1 201 1 31 1 205 1 57 1 209 1 58 1 213 1 62 1 217 1 64] 
#[1 0 49 0 11 1 221 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 55 0 105 7 157 0 110 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 249 0 165 1 49 0 173 1 57 0 185 1 253 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 2 25 0 255 2 29 1 1 2 33 1 3 2 37 1 6 2 41 1 7 1 189 1 8 1 193 1 9 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 2 69 1 22 2 73 1 23 2 77 1 24 2 81 1 25 2 85 1 26 2 89 1 27 2 93 1 28 2 97 1 29 2 101 1 30 1 201 1 31 1 205 1 57 1 209 1 58] 
#[1 5 137 0 105 5 141 0 163 5 145 0 164 7 161 0 165 5 153 0 166] 
#[1 0 49 0 11 1 221 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 98 0 36 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 55 0 105 3 9 0 110 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 249 0 165 1 49 0 173 1 57 0 185 1 253 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 7 165 0 237 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 2 25 0 255 2 29 1 1 2 33 1 3 2 37 1 6 2 41 1 7 1 189 1 8 1 193 1 9 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 2 69 1 22 2 73 1 23 2 77 1 24 2 81 1 25 2 85 1 26 2 89 1 27 2 93 1 28 2 97 1 29 2 101 1 30 1 201 1 31 1 205 1 57 1 209 1 58] 
#[1 0 49 0 11 0 53 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 67 0 105 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 49 0 173 1 57 0 185 7 169 0 222 1 145 0 223 1 149 0 224 1 153 0 225 1 157 0 226 1 161 0 227 1 165 0 228 1 169 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 1 189 1 8 1 193 1 9 1 197 1 16 1 201 1 31 1 205 1 57 1 209 1 58] 
#[0 7 173 0 36] 
#[0 7 177 0 4] 
#[1 7 181 0 1 7 185 0 5 6 185 0 6 0 49 0 11 1 221 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 55 0 105 7 189 0 110 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 249 0 165 7 193 0 167 7 197 0 168 1 49 0 173 1 57 0 185 7 201 0 199 1 253 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 2 25 0 255 2 29 1 1 2 33 1 3 2 37 1 6 2 41 1 7 1 189 1 8 1 193 1 9 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 2 69 1 22 2 73 1 23 2 77 1 24 2 81 1 25 2 85 1 26 2 89 1 27 2 93 1 28 2 97 1 29 2 101 1 30 1 201 1 31 1 205 1 57 1 209 1 58] 
#[0 2 218 0 1 0 4 0 5 0 15 0 19 0 28 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 98 1 60] 
#[1 2 222 0 1 3 89 0 3 2 222 0 4 2 222 0 5 2 222 0 15 2 222 0 19 2 222 0 28 2 222 0 36 2 222 0 44 2 222 0 49 2 222 0 50 2 222 0 51 2 222 0 52 2 222 0 53 2 222 0 54 2 222 0 55 2 222 0 56 2 222 0 57 2 222 0 59 2 222 0 71 2 222 0 72 2 222 0 73 2 222 0 87 2 222 0 89 2 222 0 90 2 222 0 91 2 222 0 93 2 222 0 94 2 222 0 95 2 222 0 96 2 222 0 97 2 222 0 98 5 89 1 15 2 222 1 60] 
#[0 2 226 0 1 0 4 0 5 0 15 0 19 0 28 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 98 1 60] 
#[0 2 230 0 1 0 3 0 4 0 5 0 15 0 19 0 28 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 98 1 60] 
#[0 2 218 0 1 0 4 0 5 0 15 0 19 0 28 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 98 1 60] 
#[0 2 226 0 1 0 4 0 5 0 15 0 19 0 28 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 98 1 60] 
#[0 2 234 0 5 0 19] 
#[0 7 205 0 19] 
#[1 7 209 0 5 2 238 0 19] 
#[0 2 242 0 1 0 3 0 4 0 5 0 6 0 10 0 12 0 14 0 15 0 19 0 20 0 28 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 96 0 97 0 98 0 105 1 60] 
#[0 2 246 0 1 0 2 0 3 0 4 0 5 0 15 0 19 0 28 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 60 0 61 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 98 1 60] 
#[1 0 153 0 72 1 39 0 105 7 217 1 9] 
#[1 7 221 0 105 7 225 1 50 7 229 1 51] 
#[1 2 250 0 6 7 233 0 9 2 250 0 10 7 237 0 147 7 241 0 151] 
#[1 2 213 0 105 7 245 0 118 3 53 0 120 7 249 0 122 7 253 0 152 1 205 1 57 1 209 1 58] 
#[1 8 1 0 6 8 5 1 42] 
#[0 2 254 0 6] 
#[1 3 2 0 6 8 9 0 9 8 13 0 186 8 17 0 194] 
#[1 5 137 0 105 8 21 0 164 5 149 0 165 5 153 0 166] 
#[1 6 185 0 6 0 49 0 11 1 221 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 55 0 105 7 189 0 110 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 249 0 165 8 25 0 167 7 197 0 168 1 49 0 173 1 57 0 185 1 253 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 2 25 0 255 2 29 1 1 2 33 1 3 2 37 1 6 2 41 1 7 1 189 1 8 1 193 1 9 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 2 69 1 22 2 73 1 23 2 77 1 24 2 81 1 25 2 85 1 26 2 89 1 27 2 93 1 28 2 97 1 29 2 101 1 30 1 201 1 31 1 205 1 57 1 209 1 58] 
#[0 2 246 0 1 0 2 0 3 0 4 0 5 0 15 0 19 0 28 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 60 0 61 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 98 1 60] 
#[0 8 29 0 105] 
#[0 8 33 0 12] 
#[0 8 37 0 19] 
#[1 0 146 0 1 3 117 0 3 0 146 0 4 0 146 0 5 0 146 0 15 0 146 0 19 0 75 0 28 0 146 0 36 0 146 0 44 0 146 0 49 0 146 0 50 0 146 0 51 0 146 0 52 0 146 0 53 0 146 0 54 0 146 0 55 0 146 0 56 0 146 0 57 0 146 0 59 0 146 0 71 0 146 0 72 0 146 0 73 0 146 0 87 0 146 0 89 0 146 0 90 0 146 0 91 0 146 0 93 0 146 0 94 0 146 0 95 0 146 0 96 0 146 0 97 0 146 0 98 0 146 1 60] 
#[0 0 130 0 1 0 3 0 4 0 5 0 15 0 19 0 28 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 98 1 60] 
#[0 0 130 0 1 0 3 0 4 0 5 0 15 0 19 0 28 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 98 1 60] 
#[0 3 6 0 1 0 4 0 5 0 15 0 19 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 96 0 97 0 98 1 60] 
#[1 5 137 0 105 8 41 0 165] 
#[1 4 41 0 3 3 10 0 5 3 10 0 19] 
#[0 1 166 0 5 0 19] 
#[0 3 14 0 5 0 19] 
#[1 0 49 0 11 3 61 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 67 0 105 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 49 0 173 1 57 0 185 3 69 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 1 189 1 8 1 193 1 9 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 2 69 1 22 2 73 1 23 2 77 1 24 2 81 1 25 2 85 1 26 2 89 1 27 2 93 1 28 2 97 1 29 8 45 1 30 1 201 1 31 1 205 1 57 1 209 1 58] 
#[1 8 49 0 6 8 53 0 188] 
#[1 8 57 0 44 5 117 0 105] 
#[0 3 18 0 7 0 8 0 13 0 18 0 23 0 24 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 45 0 46 0 48 1 60] 
#[1 3 22 0 1 3 22 0 6 3 22 0 7 3 22 0 8 3 22 0 11 3 22 0 12 3 22 0 13 3 22 0 14 3 22 0 16 3 22 0 17 3 22 0 18 3 22 0 22 3 22 0 23 3 22 0 24 3 22 0 25 3 22 0 26 3 22 0 27 3 22 0 29 3 22 0 30 8 61 0 31 3 22 0 32 3 22 0 33 3 22 0 34 3 22 0 36 3 22 0 37 3 22 0 38 3 22 0 39 3 22 0 40 3 22 0 41 3 22 0 42 3 22 0 45 3 22 0 46 3 22 0 47 3 22 0 48 3 22 0 58 3 22 0 72 3 22 0 74 3 22 0 77 3 22 0 78 3 22 0 79 3 22 0 80 3 22 0 81 3 22 0 82 3 22 0 83 3 22 0 84 3 22 0 92 3 22 0 94 3 22 0 95 3 22 0 99 3 22 0 100 3 22 0 101 3 22 0 102 3 22 0 103 3 22 0 104 3 22 0 105 3 22 1 60] 
#[1 0 49 0 11 1 221 0 12 0 61 0 17 2 42 0 19 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 55 0 105 6 213 0 110 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 249 0 165 1 49 0 173 8 65 0 184 1 57 0 185 1 253 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 2 25 0 255 2 29 1 1 2 33 1 3 2 37 1 6 2 41 1 7 1 189 1 8 1 193 1 9 6 221 1 11 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 2 69 1 22 2 73 1 23 2 77 1 24 2 81 1 25 2 85 1 26 2 89 1 27 2 93 1 28 2 97 1 29 2 101 1 30 1 201 1 31 1 205 1 57 1 209 1 58] 
#[0 3 26 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[1 8 69 0 1 8 73 0 14 8 77 0 58 8 81 0 231 8 85 0 232 8 89 0 233 8 93 0 234] 
#[0 3 30 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[0 3 34 0 1 0 5] 
#[1 3 38 0 1 8 97 0 5 8 101 1 40] 
#[1 3 42 0 1 1 43 0 5] 
#[1 6 81 0 6 0 49 0 11 3 61 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 149 0 48 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 67 0 105 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 6 89 0 145 1 49 0 173 1 57 0 185 3 69 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 1 189 1 8 1 193 1 9 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 2 69 1 22 2 73 1 23 2 77 1 24 2 81 1 25 2 85 1 26 2 89 1 27 2 93 1 28 2 97 1 29 6 93 1 30 1 201 1 31 8 109 1 36 6 113 1 38 1 205 1 57 1 209 1 58] 
#[0 3 46 0 1 0 5 0 7 0 8 0 11 0 13 0 18 0 19 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105] 
#[1 8 113 0 105 8 117 1 37] 
#[1 7 9 0 2 4 41 0 3] 
#[0 3 50 0 19 0 36] 
#[0 3 54 0 19 0 36] 
#[0 3 58 0 6] 
#[1 0 18 0 25 0 18 0 26 0 18 0 27 0 18 0 29 0 18 0 30 0 18 0 32 0 18 0 33 0 18 0 34 0 18 0 38 0 18 0 48 0 18 0 105 8 121 0 176 4 5 0 177] 
#[0 3 62 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[1 0 41 0 6 8 125 1 64] 
#[0 3 66 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[0 3 70 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[0 8 129 0 19] 
#[1 7 9 0 2 4 41 0 3 2 90 0 5 8 133 0 15 2 90 0 36] 
#[0 8 137 0 36] 
#[0 3 74 0 5 0 19 0 36] 
#[0 3 78 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[0 3 82 0 1 0 3 0 4 0 5 0 15 0 19 0 28 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 98 1 60] 
#[0 3 86 0 1 0 4 0 5 0 15 0 19 0 28 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 98 1 60] 
#[0 8 141 0 1] 
#[0 3 90 0 1 0 5 0 19 0 36] 
#[0 3 94 0 1 0 5] 
#[0 3 90 0 1 0 5 0 19 0 36] 
#[1 8 145 0 1 8 149 0 5] 
#[1 3 98 0 1 3 98 0 3 3 98 0 4 3 98 0 5 8 153 0 6 3 98 0 15 3 98 0 19 3 98 0 28 3 98 0 36 3 98 0 44 3 98 0 49 3 98 0 50 3 98 0 51 3 98 0 52 3 98 0 53 3 98 0 54 3 98 0 55 3 98 0 56 3 98 0 57 3 98 0 59 3 98 0 71 3 98 0 72 3 98 0 73 3 98 0 87 3 98 0 89 3 98 0 90 3 98 0 91 3 98 0 93 3 98 0 94 3 98 0 95 3 98 0 96 3 98 0 97 3 98 0 98 8 157 0 149 3 98 1 60] 
#[1 0 49 0 11 1 221 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 55 0 105 8 161 0 110 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 249 0 165 1 49 0 173 1 57 0 185 1 253 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 2 25 0 255 2 29 1 1 2 33 1 3 2 37 1 6 2 41 1 7 1 189 1 8 1 193 1 9 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 2 69 1 22 2 73 1 23 2 77 1 24 2 81 1 25 2 85 1 26 2 89 1 27 2 93 1 28 2 97 1 29 2 101 1 30 1 201 1 31 1 205 1 57 1 209 1 58] 
#[0 3 102 0 1 0 2 0 3 0 4 0 5 0 15 0 19 0 28 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 60 0 61 0 62 0 63 0 64 0 65 0 66 0 67 0 68 0 69 0 70 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 98 1 60] 
#[0 8 165 0 105] 
#[1 3 106 0 5 8 169 0 9 3 106 0 96 8 173 1 52] 
#[1 8 177 0 5 8 181 0 96] 
#[0 3 110 0 5 0 96] 
#[1 2 213 0 105 8 185 0 118 3 53 0 120 8 189 0 121 1 205 1 57 1 209 1 58] 
#[1 2 78 0 6 6 245 0 10 8 193 0 148 6 253 0 153] 
#[0 3 114 0 6 0 10] 
#[0 3 118 0 5 0 6] 
#[0 3 122 0 5 0 6] 
#[1 8 197 0 5 3 126 0 6] 
#[1 3 130 0 1 3 130 0 5 3 130 0 36 0 10 0 48 0 10 0 105 8 201 0 135 8 205 1 43 8 209 1 45 8 213 1 46] 
#[0 3 134 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[1 2 213 0 105 7 245 0 118 3 53 0 120 8 217 0 122 1 205 1 57 1 209 1 58] 
#[1 8 221 0 6 8 225 0 187] 
#[1 8 229 0 5 3 138 0 6] 
#[0 3 142 0 5 0 36] 
#[0 3 146 0 5 0 19 0 36] 
#[1 3 150 0 12 8 233 0 72 8 237 1 10] 
#[1 0 49 0 11 1 221 0 12 0 61 0 17 2 42 0 19 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 55 0 105 6 213 0 110 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 249 0 165 1 49 0 173 8 241 0 184 1 57 0 185 1 253 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 2 25 0 255 2 29 1 1 2 33 1 3 2 37 1 6 2 41 1 7 1 189 1 8 1 193 1 9 6 221 1 11 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 2 69 1 22 2 73 1 23 2 77 1 24 2 81 1 25 2 85 1 26 2 89 1 27 2 93 1 28 2 97 1 29 2 101 1 30 1 201 1 31 1 205 1 57 1 209 1 58] 
#[0 3 154 0 1 0 3 0 4 0 5 0 15 0 19 0 28 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 98 1 60] 
#[1 4 41 0 3 3 158 0 5 3 158 0 19] 
#[0 3 162 0 1 0 4 0 5 0 15 0 19 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 96 0 97 0 98 1 60] 
#[1 3 166 0 1 0 45 0 7 0 14 0 8 0 14 0 11 0 14 0 13 0 14 0 18 0 69 0 23 0 73 0 24 0 14 0 25 0 14 0 26 0 14 0 27 0 14 0 29 0 14 0 30 0 14 0 32 0 14 0 33 0 14 0 34 2 105 0 36 0 113 0 37 0 117 0 38 0 121 0 39 2 109 0 40 0 129 0 41 0 133 0 42 0 137 0 45 0 141 0 46 0 59 0 48 0 14 0 72 0 14 0 105 8 245 0 109 2 117 0 139 2 121 0 140 2 125 0 141 1 29 0 142 8 249 0 143 1 37 0 144 1 41 0 145 1 45 0 150 8 253 0 161 9 1 0 169 9 5 0 189 9 9 0 190 9 13 0 191 9 17 0 192 9 21 0 193] 
#[0 3 170 0 1 0 6 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105 1 60] 
#[0 9 25 0 36] 
#[1 0 41 0 6 0 49 0 11 0 53 0 12 0 57 0 16 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 109 0 36 3 21 0 40 0 145 0 47 0 153 0 72 0 157 0 74 0 161 0 77 0 165 0 78 0 169 0 79 0 173 0 80 0 177 0 81 0 181 0 82 0 185 0 83 0 189 0 84 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 63 0 105 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 49 0 173 1 57 0 185 9 29 0 202 1 73 0 204 1 77 0 205 1 81 0 206 1 85 0 207 1 89 0 208 1 93 0 209 1 97 0 210 1 101 0 211 1 105 0 213 1 109 0 214 1 113 0 215 1 117 0 216 1 121 0 217 1 125 0 218 1 129 0 219 1 133 0 220 1 137 0 221 1 141 0 222 1 145 0 223 1 149 0 224 1 153 0 225 1 157 0 226 1 161 0 227 1 165 0 228 1 169 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 1 189 1 8 1 193 1 9 1 197 1 16 1 201 1 31 1 205 1 57 1 209 1 58 1 213 1 62 1 217 1 64] 
#[0 9 33 0 19] 
#[0 3 174 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[0 9 37 0 15] 
#[1 0 49 0 11 1 221 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 55 0 105 9 41 0 110 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 249 0 165 1 49 0 173 1 57 0 185 1 253 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 9 45 0 235 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 2 25 0 255 2 29 1 1 2 33 1 3 2 37 1 6 2 41 1 7 1 189 1 8 1 193 1 9 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 2 69 1 22 2 73 1 23 2 77 1 24 2 81 1 25 2 85 1 26 2 89 1 27 2 93 1 28 2 97 1 29 2 101 1 30 1 201 1 31 1 205 1 57 1 209 1 58] 
#[1 9 49 0 1 8 73 0 14 8 77 0 58 9 53 0 232 9 57 0 233 8 93 0 234] 
#[1 9 61 0 1 0 41 0 6 0 45 0 7 0 14 0 8 0 49 0 11 0 53 0 12 0 14 0 13 8 73 0 14 0 57 0 16 0 61 0 17 0 14 0 18 0 65 0 22 0 69 0 23 0 73 0 24 0 11 0 25 0 15 0 26 0 19 0 27 0 23 0 29 0 27 0 30 0 31 0 32 0 35 0 33 0 39 0 34 0 109 0 36 0 113 0 37 0 43 0 38 0 121 0 39 0 125 0 40 0 129 0 41 0 133 0 42 0 137 0 45 0 141 0 46 0 145 0 47 0 47 0 48 8 77 0 58 0 153 0 72 0 157 0 74 0 161 0 77 0 165 0 78 0 169 0 79 0 173 0 80 0 177 0 81 0 181 0 82 0 185 0 83 0 189 0 84 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 51 0 105 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 2 165 0 127 1 21 0 139 1 25 0 140 1 29 0 142 1 33 0 143 1 37 0 144 1 41 0 145 1 45 0 150 1 49 0 173 1 53 0 177 9 65 0 183 1 57 0 185 1 61 0 201 1 65 0 202 1 69 0 203 1 73 0 204 1 77 0 205 1 81 0 206 1 85 0 207 1 89 0 208 1 93 0 209 1 97 0 210 1 101 0 211 1 105 0 213 1 109 0 214 1 113 0 215 1 117 0 216 1 121 0 217 1 125 0 218 1 129 0 219 1 133 0 220 1 137 0 221 1 141 0 222 1 145 0 223 1 149 0 224 1 153 0 225 1 157 0 226 1 161 0 227 1 165 0 228 1 169 0 229 9 69 0 234 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 1 189 1 8 1 193 1 9 1 197 1 16 1 201 1 31 1 205 1 57 1 209 1 58 1 213 1 62 1 217 1 64] 
#[0 3 178 0 1 0 14 0 58] 
#[0 3 182 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 3 186 0 1 0 36] 
#[0 9 73 0 1] 
#[1 6 81 0 6 0 49 0 11 3 61 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 149 0 48 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 67 0 105 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 6 89 0 145 1 49 0 173 1 57 0 185 3 69 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 1 189 1 8 1 193 1 9 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 2 69 1 22 2 73 1 23 2 77 1 24 2 81 1 25 2 85 1 26 2 89 1 27 2 93 1 28 2 97 1 29 6 93 1 30 1 201 1 31 9 77 1 36 6 113 1 38 1 205 1 57 1 209 1 58] 
#[0 3 190 0 5 0 19] 
#[0 7 109 0 2] 
#[0 3 194 0 5 0 19] 
#[0 9 81 0 19] 
#[0 3 198 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[0 9 85 0 36] 
#[1 0 49 0 11 1 221 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 55 0 105 9 89 0 110 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 249 0 165 1 49 0 173 1 57 0 185 1 253 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 2 25 0 255 2 29 1 1 2 33 1 3 2 37 1 6 2 41 1 7 1 189 1 8 1 193 1 9 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 2 69 1 22 2 73 1 23 2 77 1 24 2 81 1 25 2 85 1 26 2 89 1 27 2 93 1 28 2 97 1 29 2 101 1 30 1 201 1 31 1 205 1 57 1 209 1 58] 
#[1 0 49 0 11 0 53 0 12 0 61 0 17 3 202 0 19 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 67 0 105 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 49 0 173 1 57 0 185 5 17 0 222 1 145 0 223 1 149 0 224 1 153 0 225 1 157 0 226 1 161 0 227 1 165 0 228 1 169 0 229 9 93 0 238 9 97 0 240 9 101 0 241 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 1 189 1 8 1 193 1 9 1 197 1 16 1 201 1 31 1 205 1 57 1 209 1 58] 
#[0 3 206 0 1 0 4 0 5 0 15 0 19 0 28 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 98 1 60] 
#[0 3 210 0 1 0 4 0 5 0 15 0 19 0 28 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 98 1 60] 
#[1 9 105 0 1 6 185 0 6 0 49 0 11 1 221 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 55 0 105 7 189 0 110 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 249 0 165 9 109 0 167 7 197 0 168 1 49 0 173 1 57 0 185 1 253 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 2 25 0 255 2 29 1 1 2 33 1 3 2 37 1 6 2 41 1 7 1 189 1 8 1 193 1 9 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 2 69 1 22 2 73 1 23 2 77 1 24 2 81 1 25 2 85 1 26 2 89 1 27 2 93 1 28 2 97 1 29 2 101 1 30 1 201 1 31 1 205 1 57 1 209 1 58] 
#[1 3 214 0 1 0 41 0 6 0 45 0 7 0 14 0 8 0 14 0 11 0 14 0 13 0 14 0 18 0 69 0 23 0 73 0 24 0 14 0 25 0 14 0 26 0 14 0 27 0 14 0 29 0 14 0 30 0 14 0 32 0 14 0 33 0 14 0 34 2 105 0 36 0 113 0 37 0 117 0 38 0 121 0 39 2 109 0 40 0 129 0 41 9 113 0 42 0 137 0 45 0 141 0 46 0 59 0 48 0 14 0 72 0 14 0 105 9 117 0 109 2 117 0 139 2 121 0 140 2 125 0 141 1 29 0 142 9 121 0 143 1 37 0 144 1 41 0 145 1 45 0 150 9 125 0 154 9 129 0 155 9 133 0 156 9 137 0 157 9 141 0 158 9 145 0 159 9 149 0 161 9 153 0 162 9 157 0 169 9 161 1 64] 
#[0 3 218 0 1 0 3 0 4 0 5 0 15 0 19 0 28 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 98 1 60] 
#[0 3 222 0 5 0 19] 
#[0 9 165 0 12] 
#[1 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 2 213 0 105 2 217 0 112 2 221 0 113 9 169 0 114 0 241 0 115 0 245 0 116 0 249 0 117 2 229 0 118 2 233 0 119 2 237 0 120 9 173 1 53 1 205 1 57 1 209 1 58] 
#[0 3 226 0 5 0 96] 
#[1 7 221 0 105 9 177 1 51] 
#[0 3 230 0 6 0 9 0 10 0 11 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 105] 
#[0 1 106 0 5 0 6 0 10 0 14 0 36] 
#[0 3 234 0 6 0 10] 
#[1 8 153 0 6 9 181 0 149] 
#[1 2 213 0 105 7 245 0 118 3 53 0 120 9 185 0 122 1 205 1 57 1 209 1 58] 
#[1 0 149 0 48 9 189 0 105 2 161 0 145] 
#[1 3 38 0 1 8 97 0 5 3 38 0 36 9 193 1 40] 
#[1 3 238 0 1 1 47 0 5 3 238 0 36] 
#[0 3 242 0 1 0 5 0 36] 
#[0 3 246 0 5 0 6] 
#[1 3 250 0 1 0 45 0 7 0 14 0 8 0 14 0 11 0 14 0 13 0 14 0 18 0 69 0 23 0 73 0 24 0 14 0 25 0 14 0 26 0 14 0 27 0 14 0 29 0 14 0 30 0 14 0 32 0 14 0 33 0 14 0 34 2 105 0 36 0 113 0 37 0 117 0 38 0 121 0 39 2 109 0 40 0 129 0 41 0 133 0 42 0 137 0 45 0 141 0 46 0 59 0 48 0 14 0 72 0 14 0 105 9 201 0 109 2 117 0 139 2 121 0 140 2 125 0 141 1 29 0 142 8 249 0 143 1 37 0 144 1 41 0 145 1 45 0 150 9 205 0 161 9 209 0 169 9 213 0 193 9 217 0 195 9 221 0 196 9 225 0 197 9 229 0 198] 
#[0 3 254 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[1 2 213 0 105 7 245 0 118 3 53 0 120 9 233 0 122 1 205 1 57 1 209 1 58] 
#[1 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 2 205 0 59 9 237 0 96 2 213 0 105 2 217 0 112 2 221 0 113 2 225 0 114 0 241 0 115 0 245 0 116 0 249 0 117 2 229 0 118 2 233 0 119 2 237 0 120 9 241 1 54 2 245 1 55 1 205 1 57 1 209 1 58] 
#[0 9 245 0 12] 
#[0 9 249 0 19] 
#[0 4 2 0 1 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105] 
#[1 3 129 0 8 2 74 0 11 3 133 0 13 3 137 0 18 1 51 0 25 1 55 0 26 1 59 0 27 1 63 0 29 1 67 0 30 1 71 0 32 1 75 0 33 1 79 0 34 4 137 0 48 6 237 0 72 1 83 0 105 2 217 0 112 2 221 0 113 9 253 0 114 0 241 0 115 0 245 0 116 0 249 0 117 2 229 0 118 2 233 0 119 2 237 0 120 10 1 0 146 1 205 1 57 1 209 1 58] 
#[0 4 2 0 1 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105] 
#[1 10 5 0 14 10 9 0 36] 
#[0 10 13 0 1] 
#[1 4 6 0 1 0 45 0 7 0 14 0 8 0 14 0 11 0 14 0 13 0 14 0 18 0 69 0 23 0 73 0 24 0 14 0 25 0 14 0 26 0 14 0 27 0 14 0 29 0 14 0 30 0 14 0 32 0 14 0 33 0 14 0 34 2 105 0 36 0 113 0 37 0 117 0 38 0 121 0 39 2 109 0 40 0 129 0 41 0 133 0 42 0 137 0 45 0 141 0 46 0 59 0 48 0 14 0 72 0 14 0 105 8 245 0 109 2 117 0 139 2 121 0 140 2 125 0 141 1 29 0 142 8 249 0 143 1 37 0 144 1 41 0 145 1 45 0 150 8 253 0 161 9 1 0 169 10 17 0 191 9 17 0 192 9 21 0 193] 
#[0 4 10 0 1 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105] 
#[0 4 2 0 1 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105] 
#[0 4 14 0 1 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105] 
#[0 4 18 0 7 0 8 0 13 0 18 0 23 0 24 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 45 0 46 0 48 1 60] 
#[0 4 22 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[0 4 26 0 1 0 3 0 4 0 5 0 15 0 19 0 28 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 98 1 60] 
#[0 4 30 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 4 34 0 15] 
#[0 10 21 0 15] 
#[0 4 38 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[1 10 25 0 1 0 41 0 6 0 45 0 7 0 14 0 8 0 49 0 11 0 53 0 12 0 14 0 13 8 73 0 14 0 57 0 16 0 61 0 17 0 14 0 18 0 65 0 22 0 69 0 23 0 73 0 24 0 11 0 25 0 15 0 26 0 19 0 27 0 23 0 29 0 27 0 30 0 31 0 32 0 35 0 33 0 39 0 34 0 109 0 36 0 113 0 37 0 43 0 38 0 121 0 39 0 125 0 40 0 129 0 41 0 133 0 42 0 137 0 45 0 141 0 46 0 145 0 47 0 47 0 48 8 77 0 58 0 153 0 72 0 157 0 74 0 161 0 77 0 165 0 78 0 169 0 79 0 173 0 80 0 177 0 81 0 181 0 82 0 185 0 83 0 189 0 84 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 51 0 105 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 2 165 0 127 1 21 0 139 1 25 0 140 1 29 0 142 1 33 0 143 1 37 0 144 1 41 0 145 1 45 0 150 1 49 0 173 1 53 0 177 9 65 0 183 1 57 0 185 1 61 0 201 1 65 0 202 1 69 0 203 1 73 0 204 1 77 0 205 1 81 0 206 1 85 0 207 1 89 0 208 1 93 0 209 1 97 0 210 1 101 0 211 1 105 0 213 1 109 0 214 1 113 0 215 1 117 0 216 1 121 0 217 1 125 0 218 1 129 0 219 1 133 0 220 1 137 0 221 1 141 0 222 1 145 0 223 1 149 0 224 1 153 0 225 1 157 0 226 1 161 0 227 1 165 0 228 1 169 0 229 9 69 0 234 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 1 189 1 8 1 193 1 9 1 197 1 16 1 201 1 31 1 205 1 57 1 209 1 58 1 213 1 62 1 217 1 64] 
#[0 4 42 0 1 0 14 0 58] 
#[0 4 46 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[1 4 50 0 1 0 41 0 6 0 45 0 7 0 14 0 8 0 49 0 11 0 53 0 12 0 14 0 13 4 50 0 14 0 57 0 16 0 61 0 17 0 14 0 18 0 65 0 22 0 69 0 23 0 73 0 24 0 11 0 25 0 15 0 26 0 19 0 27 0 23 0 29 0 27 0 30 0 31 0 32 0 35 0 33 0 39 0 34 0 109 0 36 0 113 0 37 0 43 0 38 0 121 0 39 0 125 0 40 0 129 0 41 0 133 0 42 0 137 0 45 0 141 0 46 0 145 0 47 0 47 0 48 4 50 0 58 0 153 0 72 0 157 0 74 0 161 0 77 0 165 0 78 0 169 0 79 0 173 0 80 0 177 0 81 0 181 0 82 0 185 0 83 0 189 0 84 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 51 0 105 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 4 169 0 127 1 21 0 139 1 25 0 140 1 29 0 142 1 33 0 143 1 37 0 144 1 41 0 145 1 45 0 150 1 49 0 173 1 53 0 177 1 57 0 185 1 61 0 201 1 65 0 202 1 69 0 203 1 73 0 204 1 77 0 205 1 81 0 206 1 85 0 207 1 89 0 208 1 93 0 209 1 97 0 210 1 101 0 211 1 105 0 213 1 109 0 214 1 113 0 215 1 117 0 216 1 121 0 217 1 125 0 218 1 129 0 219 1 133 0 220 1 137 0 221 1 141 0 222 1 145 0 223 1 149 0 224 1 153 0 225 1 157 0 226 1 161 0 227 1 165 0 228 1 169 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 1 189 1 8 1 193 1 9 1 197 1 16 1 201 1 31 1 205 1 57 1 209 1 58 1 213 1 62 1 217 1 64] 
#[0 4 54 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 4 58 0 1 0 5 0 19] 
#[0 4 62 0 1 0 5] 
#[1 0 41 0 6 10 29 1 64] 
#[0 4 66 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[0 10 33 0 19] 
#[0 10 37 0 19] 
#[1 6 173 0 5 4 70 0 19] 
#[0 4 74 0 19] 
#[0 4 78 0 1 0 4 0 5 0 15 0 19 0 28 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 98 1 60] 
#[0 4 82 0 1 0 5] 
#[1 0 41 0 6 0 42 0 7 0 42 0 8 0 42 0 11 0 42 0 13 0 42 0 18 0 42 0 23 0 42 0 24 0 42 0 25 0 42 0 26 0 42 0 27 0 42 0 29 0 42 0 30 0 42 0 32 0 42 0 33 0 42 0 34 0 42 0 37 0 42 0 38 0 42 0 39 0 42 0 40 0 42 0 41 0 42 0 42 0 42 0 45 0 42 0 46 0 42 0 48 0 42 0 72 0 42 0 105 10 41 1 64] 
#[0 4 86 0 1 0 6 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105] 
#[1 3 129 0 8 2 74 0 11 3 133 0 13 3 137 0 18 1 51 0 25 1 55 0 26 1 59 0 27 1 63 0 29 1 67 0 30 1 71 0 32 1 75 0 33 1 79 0 34 4 137 0 48 6 237 0 72 1 83 0 105 2 217 0 112 2 221 0 113 9 253 0 114 0 241 0 115 0 245 0 116 0 249 0 117 2 229 0 118 2 233 0 119 2 237 0 120 10 45 0 146 10 49 0 180 1 205 1 57 1 209 1 58] 
#[0 10 53 0 1] 
#[1 4 90 0 1 0 41 0 6 0 45 0 7 0 14 0 8 0 14 0 11 0 14 0 13 0 14 0 18 0 69 0 23 0 73 0 24 0 14 0 25 0 14 0 26 0 14 0 27 0 14 0 29 0 14 0 30 0 14 0 32 0 14 0 33 0 14 0 34 2 105 0 36 0 113 0 37 0 117 0 38 0 121 0 39 2 109 0 40 0 129 0 41 9 113 0 42 0 137 0 45 0 141 0 46 0 59 0 48 0 14 0 72 0 14 0 105 9 117 0 109 2 117 0 139 2 121 0 140 2 125 0 141 1 29 0 142 9 121 0 143 1 37 0 144 1 41 0 145 1 45 0 150 10 57 0 156 9 137 0 157 9 141 0 158 9 145 0 159 9 149 0 161 9 153 0 162 9 157 0 169 9 161 1 64] 
#[0 4 94 0 1 0 6 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105] 
#[0 4 98 0 1 0 6 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105] 
#[0 4 98 0 1 0 6 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105] 
#[0 4 98 0 1 0 6 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105] 
#[0 4 86 0 1 0 6 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105] 
#[0 4 86 0 1 0 6 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105] 
#[1 0 41 0 6 10 61 0 36 10 65 0 170 10 69 1 64] 
#[0 4 98 0 1 0 6 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105] 
#[1 0 49 0 11 1 221 0 12 0 61 0 17 2 42 0 19 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 55 0 105 6 213 0 110 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 249 0 165 1 49 0 173 10 73 0 184 1 57 0 185 1 253 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 2 25 0 255 2 29 1 1 2 33 1 3 2 37 1 6 2 41 1 7 1 189 1 8 1 193 1 9 6 221 1 11 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 2 69 1 22 2 73 1 23 2 77 1 24 2 81 1 25 2 85 1 26 2 89 1 27 2 93 1 28 2 97 1 29 2 101 1 30 1 201 1 31 1 205 1 57 1 209 1 58] 
#[0 4 102 0 5 0 54 0 96] 
#[1 4 106 0 5 10 77 0 54 4 106 0 96] 
#[0 4 110 0 5 0 96] 
#[0 4 114 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[0 4 118 0 5 0 6] 
#[1 4 122 0 1 4 122 0 5 4 122 0 6 10 81 0 12 4 122 0 36 10 85 1 47] 
#[1 4 126 0 1 10 89 0 36 10 93 1 44 10 97 1 49] 
#[1 0 10 0 48 0 10 0 105 8 201 0 135 10 101 1 46] 
#[0 4 130 0 1 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105] 
#[0 4 134 0 1 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105] 
#[0 10 9 0 36] 
#[0 4 130 0 1 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105] 
#[0 10 105 0 1] 
#[1 4 138 0 1 0 45 0 7 0 14 0 8 0 14 0 11 0 14 0 13 0 14 0 18 0 69 0 23 0 73 0 24 0 14 0 25 0 14 0 26 0 14 0 27 0 14 0 29 0 14 0 30 0 14 0 32 0 14 0 33 0 14 0 34 2 105 0 36 0 113 0 37 0 117 0 38 0 121 0 39 2 109 0 40 0 129 0 41 0 133 0 42 0 137 0 45 0 141 0 46 0 59 0 48 0 14 0 72 0 14 0 105 9 201 0 109 2 117 0 139 2 121 0 140 2 125 0 141 1 29 0 142 8 249 0 143 1 37 0 144 1 41 0 145 1 45 0 150 9 205 0 161 9 209 0 169 9 213 0 193 10 109 0 197 9 229 0 198] 
#[0 4 142 0 1 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105] 
#[0 4 130 0 1 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105] 
#[0 4 146 0 5 0 6] 
#[0 4 150 0 12] 
#[1 4 225 0 5 10 113 0 96] 
#[1 0 49 0 11 1 221 0 12 0 61 0 17 2 42 0 19 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 55 0 105 6 213 0 110 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 249 0 165 1 49 0 173 10 117 0 184 1 57 0 185 1 253 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 2 25 0 255 2 29 1 1 2 33 1 3 2 37 1 6 2 41 1 7 1 189 1 8 1 193 1 9 6 221 1 11 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 2 69 1 22 2 73 1 23 2 77 1 24 2 81 1 25 2 85 1 26 2 89 1 27 2 93 1 28 2 97 1 29 2 101 1 30 1 201 1 31 1 205 1 57 1 209 1 58] 
#[0 4 154 0 1 0 3 0 4 0 5 0 15 0 19 0 28 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 98 1 60] 
#[1 5 137 0 105 10 121 0 163 5 145 0 164 5 149 0 165 5 153 0 166] 
#[1 0 49 0 11 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 2 213 0 105 2 217 0 112 2 221 0 113 10 125 0 114 0 241 0 115 0 245 0 116 0 249 0 117 2 229 0 118 2 233 0 119 2 237 0 120 10 129 0 173 1 205 1 57 1 209 1 58] 
#[1 6 185 0 6 0 49 0 11 1 221 0 12 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 149 0 48 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 55 0 105 7 189 0 110 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 10 133 0 145 1 249 0 165 10 137 0 167 7 197 0 168 1 49 0 173 1 57 0 185 1 253 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 2 25 0 255 2 29 1 1 2 33 1 3 2 37 1 6 2 41 1 7 1 189 1 8 1 193 1 9 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 2 69 1 22 2 73 1 23 2 77 1 24 2 81 1 25 2 85 1 26 2 89 1 27 2 93 1 28 2 97 1 29 2 101 1 30 1 201 1 31 1 205 1 57 1 209 1 58] 
#[0 4 158 0 1 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105] 
#[0 4 162 0 1 0 6 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105 1 60] 
#[0 4 166 0 1 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105] 
#[0 4 170 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 4 174 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[0 4 178 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[1 0 41 0 6 0 49 0 11 0 53 0 12 0 57 0 16 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 109 0 36 3 21 0 40 0 145 0 47 0 153 0 72 0 157 0 74 0 161 0 77 0 165 0 78 0 169 0 79 0 173 0 80 0 177 0 81 0 181 0 82 0 185 0 83 0 189 0 84 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 63 0 105 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 49 0 173 1 57 0 185 10 141 0 202 1 73 0 204 1 77 0 205 1 81 0 206 1 85 0 207 1 89 0 208 1 93 0 209 1 97 0 210 1 101 0 211 1 105 0 213 1 109 0 214 1 113 0 215 1 117 0 216 1 121 0 217 1 125 0 218 1 129 0 219 1 133 0 220 1 137 0 221 1 141 0 222 1 145 0 223 1 149 0 224 1 153 0 225 1 157 0 226 1 161 0 227 1 165 0 228 1 169 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 1 189 1 8 1 193 1 9 1 197 1 16 1 201 1 31 1 205 1 57 1 209 1 58 1 213 1 62 1 217 1 64] 
#[1 0 41 0 6 0 49 0 11 0 53 0 12 0 57 0 16 0 61 0 17 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 109 0 36 3 21 0 40 0 145 0 47 0 153 0 72 0 157 0 74 0 161 0 77 0 165 0 78 0 169 0 79 0 173 0 80 0 177 0 81 0 181 0 82 0 185 0 83 0 189 0 84 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 63 0 105 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 49 0 173 1 57 0 185 10 145 0 202 1 73 0 204 1 77 0 205 1 81 0 206 1 85 0 207 1 89 0 208 1 93 0 209 1 97 0 210 1 101 0 211 1 105 0 213 1 109 0 214 1 113 0 215 1 117 0 216 1 121 0 217 1 125 0 218 1 129 0 219 1 133 0 220 1 137 0 221 1 141 0 222 1 145 0 223 1 149 0 224 1 153 0 225 1 157 0 226 1 161 0 227 1 165 0 228 1 169 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 1 189 1 8 1 193 1 9 1 197 1 16 1 201 1 31 1 205 1 57 1 209 1 58 1 213 1 62 1 217 1 64] 
#[0 4 182 0 1 0 6 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105] 
#[1 0 49 0 11 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 3 65 0 105 2 217 0 112 2 221 0 113 10 125 0 114 0 241 0 115 0 245 0 116 0 249 0 117 2 229 0 118 2 233 0 119 2 237 0 120 10 149 0 124 10 129 0 173 1 205 1 57 1 209 1 58] 
#[1 4 186 0 6 10 153 0 21 10 157 0 172 10 161 0 178] 
#[0 4 190 0 1 0 3 0 4 0 5 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 15 0 16 0 17 0 18 0 19 0 22 0 23 0 24 0 25 0 26 0 27 0 28 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 44 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 58 0 59 0 71 0 72 0 73 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 87 0 89 0 90 0 91 0 92 0 93 0 94 0 95 0 96 0 97 0 98 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[0 4 194 0 1 0 6 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105] 
#[0 4 198 0 1 0 6 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105] 
#[0 4 202 0 1 0 6 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105] 
#[0 4 206 0 1 0 6 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105] 
#[0 10 165 0 19] 
#[1 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 2 213 0 105 2 217 0 112 2 221 0 113 10 169 0 114 0 241 0 115 0 245 0 116 0 249 0 117 2 229 0 118 2 233 0 119 2 237 0 120 1 205 1 57 1 209 1 58] 
#[1 0 49 0 11 1 221 0 12 0 61 0 17 2 42 0 19 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 55 0 105 6 213 0 110 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 249 0 165 1 49 0 173 10 173 0 184 1 57 0 185 1 253 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 2 25 0 255 2 29 1 1 2 33 1 3 2 37 1 6 2 41 1 7 1 189 1 8 1 193 1 9 6 221 1 11 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 2 69 1 22 2 73 1 23 2 77 1 24 2 81 1 25 2 85 1 26 2 89 1 27 2 93 1 28 2 97 1 29 2 101 1 30 1 201 1 31 1 205 1 57 1 209 1 58] 
#[1 4 210 0 1 4 210 0 5 8 153 0 6 4 210 0 36 10 177 0 149 10 181 1 48] 
#[1 3 214 0 1 0 41 0 6 0 45 0 7 0 14 0 8 0 14 0 11 0 14 0 13 0 14 0 18 0 69 0 23 0 73 0 24 0 14 0 25 0 14 0 26 0 14 0 27 0 14 0 29 0 14 0 30 0 14 0 32 0 14 0 33 0 14 0 34 2 105 0 36 0 113 0 37 0 117 0 38 0 121 0 39 2 109 0 40 0 129 0 41 9 113 0 42 0 137 0 45 0 141 0 46 0 59 0 48 0 14 0 72 0 14 0 105 9 117 0 109 2 117 0 139 2 121 0 140 2 125 0 141 1 29 0 142 9 121 0 143 1 37 0 144 1 41 0 145 1 45 0 150 10 185 0 154 9 129 0 155 9 133 0 156 9 137 0 157 9 141 0 158 9 145 0 159 9 149 0 161 9 153 0 162 9 157 0 169 9 161 1 64] 
#[0 10 189 0 1] 
#[0 4 214 0 1] 
#[0 4 218 0 1 0 5 0 36] 
#[0 4 222 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[0 4 226 0 1 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105] 
#[0 4 230 0 12] 
#[0 10 193 0 19] 
#[1 7 5 0 5 10 197 0 36] 
#[1 10 201 0 105 10 205 0 171] 
#[1 10 201 0 105 10 209 0 171] 
#[0 10 213 0 36] 
#[0 10 217 0 36] 
#[0 4 234 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[0 4 238 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[0 10 221 0 12] 
#[1 2 213 0 105 8 185 0 118 3 53 0 120 10 225 0 121 10 229 0 179 1 205 1 57 1 209 1 58] 
#[1 10 233 0 6 10 237 0 181] 
#[0 4 242 0 6 0 14 0 36] 
#[0 4 246 0 1 0 3 0 4 0 5 0 15 0 19 0 28 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 98 1 60] 
#[0 4 250 0 5 0 54 0 96] 
#[0 10 241 0 19] 
#[0 4 254 0 1 0 5 0 36] 
#[0 5 2 0 1 0 5 0 36] 
#[0 5 6 0 1] 
#[0 5 10 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 14 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 58 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105 1 60] 
#[1 5 14 0 1 5 14 0 3 5 14 0 4 5 14 0 5 8 153 0 6 5 14 0 15 5 14 0 19 5 14 0 28 5 14 0 36 5 14 0 44 5 14 0 49 5 14 0 50 5 14 0 51 5 14 0 52 5 14 0 53 5 14 0 54 5 14 0 55 5 14 0 56 5 14 0 57 5 14 0 59 5 14 0 71 5 14 0 72 5 14 0 73 5 14 0 87 5 14 0 89 5 14 0 90 5 14 0 91 5 14 0 93 5 14 0 94 5 14 0 95 5 14 0 96 5 14 0 97 5 14 0 98 10 245 0 149 5 14 1 60] 
#[0 5 18 0 1 0 6 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105] 
#[0 10 249 0 12] 
#[1 10 253 0 3 4 186 0 6 4 186 0 14 10 153 0 21 4 186 0 36 11 1 0 172 10 161 0 178] 
#[1 10 253 0 3 4 186 0 6 4 186 0 14 10 153 0 21 4 186 0 36 11 5 0 172 10 161 0 178] 
#[0 5 22 0 1 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105] 
#[0 5 22 0 1 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105] 
#[1 5 26 0 19 0 18 0 25 0 18 0 26 0 18 0 27 0 18 0 29 0 18 0 30 0 18 0 32 0 18 0 33 0 18 0 34 0 18 0 38 0 18 0 48 0 18 0 105 11 9 0 174 11 13 0 175 11 17 0 176 4 5 0 177] 
#[0 5 30 0 5 0 6 0 14 0 36] 
#[1 11 21 0 5 5 34 0 6 5 34 0 14 5 34 0 36] 
#[1 11 25 0 1 0 41 0 6 0 45 0 7 0 14 0 8 0 49 0 11 0 53 0 12 0 14 0 13 0 57 0 16 11 29 0 17 0 14 0 18 11 33 0 22 0 69 0 23 0 73 0 24 0 11 0 25 0 15 0 26 0 19 0 27 0 23 0 29 0 27 0 30 0 31 0 32 0 35 0 33 0 39 0 34 0 109 0 36 0 113 0 37 0 43 0 38 0 121 0 39 0 125 0 40 0 129 0 41 0 133 0 42 0 137 0 45 0 141 0 46 0 145 0 47 0 47 0 48 0 153 0 72 0 157 0 74 0 161 0 77 0 165 0 78 0 169 0 79 0 173 0 80 0 177 0 81 0 181 0 82 0 185 0 83 0 189 0 84 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 51 0 105 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 2 165 0 127 1 21 0 139 1 25 0 140 1 29 0 142 1 33 0 143 1 37 0 144 1 41 0 145 1 45 0 150 1 49 0 173 1 53 0 177 11 37 0 182 11 41 0 183 11 45 0 185 1 61 0 201 1 65 0 202 1 69 0 203 1 73 0 204 1 77 0 205 1 81 0 206 1 85 0 207 1 89 0 208 1 93 0 209 1 97 0 210 1 101 0 211 1 105 0 213 1 109 0 214 1 113 0 215 1 117 0 216 1 121 0 217 1 125 0 218 1 129 0 219 1 133 0 220 1 137 0 221 1 141 0 222 1 145 0 223 1 149 0 224 1 153 0 225 1 157 0 226 1 161 0 227 1 165 0 228 1 169 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 1 189 1 8 1 193 1 9 1 197 1 16 1 201 1 31 1 205 1 57 1 209 1 58 1 213 1 62 1 217 1 64] 
#[0 5 38 0 1 0 6 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105] 
#[0 5 42 0 1 0 5 0 6 0 36] 
#[0 5 46 0 1 0 3 0 4 0 5 0 15 0 19 0 28 0 36 0 44 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 57 0 59 0 71 0 72 0 73 0 87 0 89 0 90 0 91 0 93 0 94 0 95 0 96 0 97 0 98 1 60] 
#[1 5 26 0 19 0 18 0 25 0 18 0 26 0 18 0 27 0 18 0 29 0 18 0 30 0 18 0 32 0 18 0 33 0 18 0 34 0 18 0 38 0 18 0 48 0 18 0 105 11 49 0 174 11 13 0 175 11 17 0 176 4 5 0 177] 
#[0 11 53 0 4] 
#[0 5 50 0 6 0 14 0 36] 
#[0 5 50 0 6 0 14 0 36] 
#[0 11 57 0 19] 
#[1 11 61 0 5 5 54 0 19] 
#[0 5 58 0 5 0 19] 
#[1 2 213 0 105 8 185 0 118 3 53 0 120 11 65 0 121 1 205 1 57 1 209 1 58] 
#[0 5 62 0 1 0 6 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105] 
#[1 11 69 0 12 2 185 0 28] 
#[1 0 50 0 3 11 73 0 12 0 50 0 28 0 50 0 94 0 50 0 95] 
#[1 11 77 0 1 0 41 0 6 0 45 0 7 0 14 0 8 0 49 0 11 0 53 0 12 0 14 0 13 0 57 0 16 0 61 0 17 0 14 0 18 0 65 0 22 0 69 0 23 0 73 0 24 0 11 0 25 0 15 0 26 0 19 0 27 0 23 0 29 0 27 0 30 0 31 0 32 0 35 0 33 0 39 0 34 0 109 0 36 0 113 0 37 0 43 0 38 0 121 0 39 0 125 0 40 0 129 0 41 0 133 0 42 0 137 0 45 0 141 0 46 0 145 0 47 0 47 0 48 0 153 0 72 0 157 0 74 0 161 0 77 0 165 0 78 0 169 0 79 0 173 0 80 0 177 0 81 0 181 0 82 0 185 0 83 0 189 0 84 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 51 0 105 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 2 165 0 127 1 21 0 139 1 25 0 140 1 29 0 142 1 33 0 143 1 37 0 144 1 41 0 145 1 45 0 150 1 49 0 173 1 53 0 177 11 81 0 183 1 57 0 185 1 61 0 201 1 65 0 202 1 69 0 203 1 73 0 204 1 77 0 205 1 81 0 206 1 85 0 207 1 89 0 208 1 93 0 209 1 97 0 210 1 101 0 211 1 105 0 213 1 109 0 214 1 113 0 215 1 117 0 216 1 121 0 217 1 125 0 218 1 129 0 219 1 133 0 220 1 137 0 221 1 141 0 222 1 145 0 223 1 149 0 224 1 153 0 225 1 157 0 226 1 161 0 227 1 165 0 228 1 169 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 1 189 1 8 1 193 1 9 1 197 1 16 1 201 1 31 1 205 1 57 1 209 1 58 1 213 1 62 1 217 1 64] 
#[1 11 85 0 1 0 41 0 6 0 45 0 7 0 14 0 8 0 49 0 11 0 53 0 12 0 14 0 13 0 57 0 16 0 61 0 17 0 14 0 18 0 65 0 22 0 69 0 23 0 73 0 24 0 11 0 25 0 15 0 26 0 19 0 27 0 23 0 29 0 27 0 30 0 31 0 32 0 35 0 33 0 39 0 34 0 109 0 36 0 113 0 37 0 43 0 38 0 121 0 39 0 125 0 40 0 129 0 41 0 133 0 42 0 137 0 45 0 141 0 46 0 145 0 47 0 47 0 48 0 153 0 72 0 157 0 74 0 161 0 77 0 165 0 78 0 169 0 79 0 173 0 80 0 177 0 81 0 181 0 82 0 185 0 83 0 189 0 84 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 51 0 105 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 4 169 0 127 1 21 0 139 1 25 0 140 1 29 0 142 1 33 0 143 1 37 0 144 1 41 0 145 1 45 0 150 1 49 0 173 1 53 0 177 1 57 0 185 1 61 0 201 1 65 0 202 1 69 0 203 1 73 0 204 1 77 0 205 1 81 0 206 1 85 0 207 1 89 0 208 1 93 0 209 1 97 0 210 1 101 0 211 1 105 0 213 1 109 0 214 1 113 0 215 1 117 0 216 1 121 0 217 1 125 0 218 1 129 0 219 1 133 0 220 1 137 0 221 1 141 0 222 1 145 0 223 1 149 0 224 1 153 0 225 1 157 0 226 1 161 0 227 1 165 0 228 1 169 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 1 189 1 8 1 193 1 9 1 197 1 16 1 201 1 31 1 205 1 57 1 209 1 58 1 213 1 62 1 217 1 64] 
#[1 1 87 0 28 0 146 0 94 0 146 0 95] 
#[0 11 93 0 19] 
#[0 5 66 0 3 0 6 0 14 0 21 0 36] 
#[0 5 70 0 6 0 21] 
#[1 0 18 0 25 0 18 0 26 0 18 0 27 0 18 0 29 0 18 0 30 0 18 0 32 0 18 0 33 0 18 0 34 0 18 0 38 0 18 0 48 0 18 0 105 11 97 0 176 4 5 0 177] 
#[0 5 74 0 5 0 6 0 14 0 36] 
#[1 0 49 0 11 1 221 0 12 0 61 0 17 2 42 0 19 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 55 0 105 6 213 0 110 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 249 0 165 1 49 0 173 11 101 0 184 1 57 0 185 1 253 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 2 25 0 255 2 29 1 1 2 33 1 3 2 37 1 6 2 41 1 7 1 189 1 8 1 193 1 9 6 221 1 11 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 2 69 1 22 2 73 1 23 2 77 1 24 2 81 1 25 2 85 1 26 2 89 1 27 2 93 1 28 2 97 1 29 2 101 1 30 1 201 1 31 1 205 1 57 1 209 1 58] 
#[1 0 49 0 11 1 221 0 12 0 61 0 17 2 42 0 19 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 55 0 105 6 213 0 110 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 249 0 165 1 49 0 173 11 105 0 184 1 57 0 185 1 253 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 2 25 0 255 2 29 1 1 2 33 1 3 2 37 1 6 2 41 1 7 1 189 1 8 1 193 1 9 6 221 1 11 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 2 69 1 22 2 73 1 23 2 77 1 24 2 81 1 25 2 85 1 26 2 89 1 27 2 93 1 28 2 97 1 29 2 101 1 30 1 201 1 31 1 205 1 57 1 209 1 58] 
#[0 5 78 0 1 0 6 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105] 
#[1 11 109 0 1 0 41 0 6 0 45 0 7 0 14 0 8 0 49 0 11 0 53 0 12 0 14 0 13 0 57 0 16 0 61 0 17 0 14 0 18 0 65 0 22 0 69 0 23 0 73 0 24 0 11 0 25 0 15 0 26 0 19 0 27 0 23 0 29 0 27 0 30 0 31 0 32 0 35 0 33 0 39 0 34 0 109 0 36 0 113 0 37 0 43 0 38 0 121 0 39 0 125 0 40 0 129 0 41 0 133 0 42 0 137 0 45 0 141 0 46 0 145 0 47 0 47 0 48 0 153 0 72 0 157 0 74 0 161 0 77 0 165 0 78 0 169 0 79 0 173 0 80 0 177 0 81 0 181 0 82 0 185 0 83 0 189 0 84 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 51 0 105 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 4 169 0 127 1 21 0 139 1 25 0 140 1 29 0 142 1 33 0 143 1 37 0 144 1 41 0 145 1 45 0 150 1 49 0 173 1 53 0 177 1 57 0 185 1 61 0 201 1 65 0 202 1 69 0 203 1 73 0 204 1 77 0 205 1 81 0 206 1 85 0 207 1 89 0 208 1 93 0 209 1 97 0 210 1 101 0 211 1 105 0 213 1 109 0 214 1 113 0 215 1 117 0 216 1 121 0 217 1 125 0 218 1 129 0 219 1 133 0 220 1 137 0 221 1 141 0 222 1 145 0 223 1 149 0 224 1 153 0 225 1 157 0 226 1 161 0 227 1 165 0 228 1 169 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 1 189 1 8 1 193 1 9 1 197 1 16 1 201 1 31 1 205 1 57 1 209 1 58 1 213 1 62 1 217 1 64] 
#[0 5 82 0 1 0 6 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105] 
#[1 11 113 0 17 11 117 0 22 5 157 0 105] 
#[0 5 86 0 3 0 6 0 14 0 21 0 36] 
#[0 5 90 0 5 0 19] 
#[0 11 121 0 19] 
#[0 11 125 0 19] 
#[0 5 94 0 1 0 6 0 7 0 8 0 11 0 13 0 18 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 48 0 72 0 105] 
#[0 11 129 0 12] 
#[0 11 133 0 12] 
#[0 11 137 0 36] 
#[0 11 141 0 36] 
#[1 0 49 0 11 1 221 0 12 0 61 0 17 2 42 0 19 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 55 0 105 6 213 0 110 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 249 0 165 1 49 0 173 11 145 0 184 1 57 0 185 1 253 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 2 25 0 255 2 29 1 1 2 33 1 3 2 37 1 6 2 41 1 7 1 189 1 8 1 193 1 9 6 221 1 11 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 2 69 1 22 2 73 1 23 2 77 1 24 2 81 1 25 2 85 1 26 2 89 1 27 2 93 1 28 2 97 1 29 2 101 1 30 1 201 1 31 1 205 1 57 1 209 1 58] 
#[1 0 49 0 11 1 221 0 12 0 61 0 17 2 42 0 19 0 65 0 22 0 77 0 25 0 81 0 26 0 85 0 27 0 89 0 29 0 93 0 30 0 97 0 32 0 101 0 33 0 105 0 34 0 153 0 72 1 225 0 85 1 229 0 86 1 233 0 90 1 237 0 91 0 193 0 92 0 197 0 94 0 201 0 95 0 205 0 99 0 209 0 100 0 213 0 101 0 217 0 102 0 221 0 103 0 225 0 104 0 55 0 105 6 213 0 110 0 233 0 111 0 237 0 112 0 241 0 115 0 245 0 116 0 249 0 117 0 253 0 119 1 1 0 120 1 5 0 124 1 9 0 125 1 13 0 126 1 249 0 165 1 49 0 173 11 149 0 184 1 57 0 185 1 253 0 223 2 1 0 224 2 5 0 225 2 9 0 226 2 13 0 227 2 17 0 228 2 21 0 229 1 173 0 251 1 177 0 252 1 181 0 253 1 185 0 254 2 25 0 255 2 29 1 1 2 33 1 3 2 37 1 6 2 41 1 7 1 189 1 8 1 193 1 9 6 221 1 11 2 45 1 16 2 49 1 17 2 53 1 18 2 57 1 19 2 61 1 20 2 65 1 21 2 69 1 22 2 73 1 23 2 77 1 24 2 81 1 25 2 85 1 26 2 89 1 27 2 93 1 28 2 97 1 29 2 101 1 30 1 201 1 31 1 205 1 57 1 209 1 58] 
#[0 5 98 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 5 102 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 11 153 0 19] 
#[0 11 157 0 19] 
#[0 11 161 0 36] 
#[0 11 165 0 36] 
#[0 5 106 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105] 
#[0 5 110 0 1 0 6 0 7 0 8 0 11 0 12 0 13 0 16 0 17 0 18 0 22 0 23 0 24 0 25 0 26 0 27 0 29 0 30 0 32 0 33 0 34 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 45 0 46 0 47 0 48 0 72 0 74 0 77 0 78 0 79 0 80 0 81 0 82 0 83 0 84 0 92 0 94 0 95 0 99 0 100 0 101 0 102 0 103 0 104 0 105]
	).
]
