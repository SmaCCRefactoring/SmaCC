generated
definitionComment
"<DECIMAL_INTEGER>
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
	: \\ ([btnfr\""""\'\\] | ([0-3] [0-7]{0,2} | [4-7][0-7]?) | (u [0-9a-fA-F]{4,4}))	
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
	: [a-zA-Z_$] (\w|$)*	
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
	: \/\/ [^\r\n]* <eol> 
	| /\*([^*]|[\r\n]|(\*+([^*/]|[\r\n])))*\*+/
	| \# [^\r\n]* <eol> 
 	;



%annotate_tokens;
%root specification;
%prefix AST;
%suffix Node;

specification 
	: definition 'definition' {{}}
	| specification 'specification' definition 'definition' {{}}
	;
definition 
	: type_dcl 'typeDcl' "";"" {{}}
	| const_dcl 'constDcl' "";"" {{}}
	| except_dcl 'exceptDcl' "";"" {{}}
	| interface 'interface' "";"" {{}}
	| module 'module' "";"" {{}}
	;
module 
	: ""module"" <IDENTIFIER> 'id' ""{"" definitions 'definitions' ""}"" {{}}
	;
definitions 
	: definition 'definition' {{}}
	| definitions 'definitions' definition 'definition' {{}}
	;
interface 
	: interface_dcl 'interfaceDcl' {{}}
	| forward_dcl 'forwardDcl' {{}}
	;
interface_dcl 
	: interface_header 'interfaceHeader' ""{"" interface_body 'interfaceBody' ""}"" {{}}
	;
forward_dcl 
	: ""interface"" <IDENTIFIER> 'id' {{}}
	;
interface_header 
	: ""interface"" <IDENTIFIER> 'id' {{}}
	| ""interface"" <IDENTIFIER> 'id' inheritance_spec 'inheritanceSpec' {{}}
	;
interface_body 
	: export 'export' {{}}
	| interface_body 'interfaceBody' export 'export' {{}}
	;
export 
	: type_dcl 'typeDcl' "";"" {{}}
	| const_dcl 'constDcl' "";"" {{}}
	| except_dcl 'exceptDcl' "";"" {{}}
	| attr_dcl 'attrDcl' "";"" {{}}
	| op_dcl 'opDcl' "";"" {{}}
	;
inheritance_spec 
	: "":"" scoped_names 'scopedNames' {{}}
	;
scoped_names 
	: scoped_name 'scopedName' {{}}
	| scoped_names 'scopedNames' "","" scoped_name 'scopedName' {{}}
	;
scoped_name 
	: <IDENTIFIER> 'id' {{}}
	| ""::"" <IDENTIFIER> 'id' {{}}
	| scoped_name 'scopedName' ""::"" <IDENTIFIER> 'id' {{}}
	;
const_dcl 
	: ""const"" const_type 'constType' <IDENTIFIER> 'id' ""="" const_exp 'constExp' {{}}
	;
const_type 
	: integer_type 'integerType' {{}}
	| char_type 'charType' {{}}
	| boolean_type 'booleanType' {{}}
	| floating_pt_type 'floatingPtType' {{}}
	| string_type 'stringType' {{}}
	| scoped_name 'scopedName' {{}}
	;
const_exp 
	: or_expr 'orExpr' {{}}
	;
or_expr 
	: xor_expr 'xorExpr' {{}}
	| or_expr 'orExpr' ""|"" xor_expr 'xorExpr' {{}}
	;
xor_expr 
	: and_expr 'andExpr' {{}}
	| xor_expr 'xorExpr' ""^"" and_expr 'andExpr' {{}}
	;
and_expr 
	: shift_expr 'shiftExpr' {{}}
	| and_expr 'andExpr' ""&"" shift_expr 'shiftExpr' {{}}
	;
shift_expr 
	: add_expr 'addExpr' {{}}
	| shift_expr 'shiftExpr' "">>"" add_expr 'addExpr' {{}}
	| shift_expr 'shiftExpr' ""<<"" add_expr 'addExpr' {{}}
	;
add_expr 
	: mult_expr 'multExpr' {{}}
	| add_expr 'addExpr' ""+"" mult_expr 'multExpr' {{}}
	| add_expr 'addExpr' ""-"" mult_expr 'multExpr' {{}}
	;
mult_expr 
	: unary_expr 'unaryExpr' {{}}
	| mult_expr 'multExpr' ""*"" unary_expr 'unaryExpr' {{}}
	| mult_expr 'multExpr' ""/"" unary_expr 'unaryExpr' {{}}
	| mult_expr 'multExpr' ""%"" unary_expr 'unaryExpr' {{}}
	;
unary_expr 
	: unary_operator 'unaryOperator' primary_expr 'primaryExpr' {{}}
	| primary_expr 'primaryExpr' {{}}
	;
unary_operator 
	: ""-"" {{}}
	| ""+"" {{}}
	| ""~"" {{}}
	;
primary_expr 
	: scoped_name 'scopedName' {{}}
	| literal 'literal' {{}}
	| ""("" const_exp 'constExp' "")"" {{}}
	;
literal 
	: <INTEGER_LITERAL> {{}}
	| <STRING_LITERAL> {{}}
	| <CHARACTER_LITERAL> {{}}
	| <FLOATING_POINT_LITERAL> {{}}
	| boolean_literal 'booleanLiteral' {{}}
	;
boolean_literal 
	: ""TRUE"" {{}}
	| ""FALSE"" {{}}
	;
positive_int_const 
	: const_exp 'constExp' {{}}
	;
type_dcl 
	: ""typedef"" type_declarator 'typeDeclarator' {{}}
	| struct_type 'structType' {{}}
	| union_type 'unionType' {{}}
	| enum_type 'enumType' {{}}
	;
type_declarator 
	: type_spec 'typeSpec' declarators 'declarators' {{}}
	;
type_spec 
	: simple_type_spec 'simpleTypeSpec' {{}}
	| constr_type_spec 'constrTypeSpec' {{}}
	;
simple_type_spec 
	: base_type_spec 'baseTypeSpec' {{}}
	| template_type_spec 'templateTypeSpec' {{}}
	| scoped_name 'scopedName' {{}}
	;
base_type_spec 
	: floating_pt_type 'floatingPtType' {{}}
	| integer_type 'integerType' {{}}
	| char_type 'charType' {{}}
	| boolean_type 'booleanType' {{}}
	| octet_type 'octetType' {{}}
	| any_type 'anyType' {{}}
	;
template_type_spec 
	: sequence_type 'sequenceType' {{}}
	| string_type 'stringType' {{}}
	;
constr_type_spec 
	: struct_type 'structType' {{}}
	| union_type 'unionType' {{}}
	| enum_type 'enumType' {{}}
	;
declarators 
	: declarator 'declarator' {{}}
	| declarators 'declarators' "","" declarator 'declarator' {{}}
	;
declarator 
	: simple_declarator 'simpleDeclarator' {{}}
	| complex_declarator 'complexDeclarator' {{}}
	;
simple_declarator 
	: <IDENTIFIER> 'id' {{}}
	;
complex_declarator 
	: array_declarator 'arrayDeclarator' {{}}
	;
floating_pt_type 
	: ""float"" {{}}
	| ""double"" {{}}
	;
integer_type 
	: signed_int 'signedInt' {{}}
	| unsigned_int 'unsignedInt' {{}}
	;
signed_int 
	: signed_long_int 'signedLongInt' {{}}
	| signed_short_int 'signedShortInt' {{}}
	;
signed_long_int 
	: ""long"" {{}}
	;
signed_short_int 
	: ""short"" {{}}
	;
unsigned_int 
	: unsigned_long_int 'unsignedLongInt' {{}}
	| unsigned_short_int 'unsignedShortInt' {{}}
	;
unsigned_long_int 
	: ""unsigned"" ""long"" {{}}
	;
unsigned_short_int 
	: ""unsigned"" ""short"" {{}}
	;
char_type 
	: ""char"" {{}}
	;
boolean_type 
	: ""boolean"" {{}}
	;
octet_type 
	: ""octet"" {{}}
	;
any_type 
	: ""any"" {{}}
	;
struct_type 
	: ""struct"" <IDENTIFIER> 'id' ""{"" member_list 'memberList' ""}"" {{}}
	;
member_list 
	: member 'member' {{}}
	| member_list 'memberList' member 'member' {{}}
	;
member 
	: type_spec 'typeSpec' declarators 'declarators' "";"" {{}}
	;
union_type 
	: ""union"" <IDENTIFIER> 'id' ""switch"" ""("" switch_type_spec 'switchTypeSpec' "")"" ""{"" switch_body 'switchBody' ""}"" {{}}
	;
switch_type_spec 
	: integer_type 'integerType' {{}}
	| char_type 'charType' {{}}
	| boolean_type 'booleanType' {{}}
	| enum_type 'enumType' {{}}
	| scoped_name 'scopedName' {{}}
	;
switch_body 
	: case 'case' {{}}
	| switch_body 'switchBody' case 'case' {{}}
	;
case 
	: case_labels 'caseLabels' element_spec 'elementSpec' "";"" {{}}
	;
case_labels 
	: case_label 'caseLabel' {{}}
	| case_labels 'caseLabels' case_label 'caseLabel' {{}}
	;
case_label 
	: ""case"" const_exp 'constExp' "":"" {{}}
	| ""default"" "":"" {{}}
	;
element_spec 
	: type_spec 'typeSpec' declarator 'declarator' {{}}
	;
enum_type 
	: ""enum"" <IDENTIFIER> 'id' ""{"" enumerators 'enumerators' ""}"" {{}}
	;
enumerators 
	: enumerator 'enumerator' {{}}
	| enumerators 'enumerators' "","" enumerator 'enumerator' {{}}
	;
enumerator 
	: <IDENTIFIER> 'id' {{}}
	;
sequence_type 
	: ""sequence"" ""<"" simple_type_spec 'simpleTypeSpec' "","" positive_int_const 'positiveIntConst' "">"" {{}}
	| ""sequence"" ""<"" simple_type_spec 'simpleTypeSpec' "">"" {{}}
	;
string_type 
	: ""string"" ""<"" positive_int_const 'positiveIntConst' "">"" {{}}
	| ""string"" {{}}
	;
array_declarator 
	: <IDENTIFIER> 'id' fixed_array_sizes 'fixedArraySizes' {{}}
	;
fixed_array_sizes 
	: fixed_array_size 'fixedArraySize' {{}}
	| fixed_array_sizes 'fixedArraySizes' fixed_array_size 'fixedArraySize' {{}}
	;
fixed_array_size 
	: ""["" positive_int_const 'positiveIntConst' ""]"" {{}}
	;
attr_dcl 
	: ""attribute"" param_type_spec 'paramTypeSpec' simple_declarators 'simpleDeclarators' {{}}
	| ""readonly"" ""attribute"" param_type_spec 'paramTypeSpec' simple_declarators 'simpleDeclarators' {{}}
	;
simple_declarators 
	: simple_declarator 'simpleDeclarator' {{}}
	| simple_declarators 'simpleDeclarators' "","" simple_declarator 'simpleDeclarator' {{}}
	;
except_dcl 
	: ""exception"" <IDENTIFIER> 'id' ""{"" member_list 'memberList' ""}"" {{}}
	;
op_dcl 
	: op_type_spec 'opTypeSpec' <IDENTIFIER> 'id' parameter_dcls 'parameterDcls' op_dcl_options 'opDclOptions' {{}}
	| op_attribute 'opAttribute' op_type_spec 'opTypeSpec' <IDENTIFIER> 'id' parameter_dcls 'parameterDcls' op_dcl_options 'opDclOptions' {{}}
	;
op_dcl_options 
	: {{}}
	| raises_expr 'raisesExpr' {{}}
	| context_expr 'contextExpr' {{}}
	| raises_expr 'raisesExpr' context_expr 'contextExpr' {{}}
	;
op_attribute 
	: ""oneway"" {{}}
	;
op_type_spec 
	: param_type_spec 'paramTypeSpec' {{}}
	| ""void"" {{}}
	;
parameter_dcls 
	: ""("" param_dcls 'paramDcls' "")"" {{}}
	| ""("" "")"" {{}}
	;
param_dcls 
	: param_dcl 'paramDcl' {{}}
	| param_dcls 'paramDcls' "","" param_dcl 'paramDcl' {{}}
	;
param_dcl 
	: param_attribute 'paramAttribute' param_type_spec 'paramTypeSpec' simple_declarator 'simpleDeclarator' {{}}
	;
param_attribute 
	: ""in"" {{}}
	| ""out"" {{}}
	| ""inout"" {{}}
	;
raises_expr 
	: ""raises"" ""("" scoped_names 'scopedNames' "")"" {{}}
	;
context_expr 
	: ""context"" ""("" string_literals 'stringLiterals' "")"" {{}}
	;
string_literals 
	: <STRING_LITERAL> {{}}
	| string_literals 'stringLiterals' "","" <STRING_LITERAL> {{}}
	;
param_type_spec 
	: base_type_spec 'baseTypeSpec' {{}}
	| string_type 'stringType' {{}}
	| scoped_name 'scopedName' {{}}
	;"