Class {
	#name : #OMGParser,
	#superclass : #SmaCCParser,
	#category : 'SmaCC-IDL'
}

{ #category : #'generated-accessing' }
OMGParser class >> cacheId [
	^'2017-05-03T19:34:49.946165+02:00'
]

{ #category : #generated }
OMGParser class >> definitionComment [
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
]

{ #category : #'generated-accessing' }
OMGParser class >> scannerClass [
	^OMGScanner
]

{ #category : #generated }
OMGParser class >> startingStateForspecification [
	^ 1
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForadd_expr1: nodes [
	| result |
	result := ASTAddExprNode new.
	result multExpr: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForadd_expr2: nodes [
	| result |
	result := ASTAddExprNode new.
	result addExpr: (nodes at: 1).
	result plusToken: (nodes at: 2).
	result multExpr: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForadd_expr3: nodes [
	| result |
	result := ASTAddExprNode new.
	result addExpr: (nodes at: 1).
	result minusToken: (nodes at: 2).
	result multExpr: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForand_expr1: nodes [
	| result |
	result := ASTAndExprNode new.
	result shiftExpr: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForand_expr2: nodes [
	| result |
	result := ASTAndExprNode new.
	result andExpr: (nodes at: 1).
	result andToken: (nodes at: 2).
	result shiftExpr: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForany_type1: nodes [
	| result |
	result := ASTAnyTypeNode new.
	result anyToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForarray_declarator1: nodes [
	| result |
	result := ASTArrayDeclaratorNode new.
	result id: (nodes at: 1).
	result fixedArraySizes: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForattr_dcl1: nodes [
	| result |
	result := ASTAttrDclNode new.
	result attributeToken: (nodes at: 1).
	result paramTypeSpec: (nodes at: 2).
	result simpleDeclarators: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForattr_dcl2: nodes [
	| result |
	result := ASTAttrDclNode new.
	result readonlyToken: (nodes at: 1).
	result attributeToken: (nodes at: 2).
	result paramTypeSpec: (nodes at: 3).
	result simpleDeclarators: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForbase_type_spec1: nodes [
	| result |
	result := ASTBaseTypeSpecNode new.
	result floatingPtType: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForbase_type_spec2: nodes [
	| result |
	result := ASTBaseTypeSpecNode new.
	result integerType: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForbase_type_spec3: nodes [
	| result |
	result := ASTBaseTypeSpecNode new.
	result charType: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForbase_type_spec4: nodes [
	| result |
	result := ASTBaseTypeSpecNode new.
	result booleanType: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForbase_type_spec5: nodes [
	| result |
	result := ASTBaseTypeSpecNode new.
	result octetType: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForbase_type_spec6: nodes [
	| result |
	result := ASTBaseTypeSpecNode new.
	result anyType: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForboolean_literal1: nodes [
	| result |
	result := ASTBooleanLiteralNode new.
	result tRUEToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForboolean_literal2: nodes [
	| result |
	result := ASTBooleanLiteralNode new.
	result fALSEToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForboolean_type1: nodes [
	| result |
	result := ASTBooleanTypeNode new.
	result booleanToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForcase1: nodes [
	| result |
	result := ASTCaseNode new.
	result caseLabels: (nodes at: 1).
	result elementSpec: (nodes at: 2).
	result semicolonToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForcase_label1: nodes [
	| result |
	result := ASTCaseLabelNode new.
	result caseToken: (nodes at: 1).
	result constExp: (nodes at: 2).
	result colonToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForcase_label2: nodes [
	| result |
	result := ASTCaseLabelNode new.
	result defaultToken: (nodes at: 1).
	result colonToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForcase_labels1: nodes [
	| result |
	result := ASTCaseLabelsNode new.
	result caseLabel: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForcase_labels2: nodes [
	| result |
	result := ASTCaseLabelsNode new.
	result caseLabels: (nodes at: 1).
	result caseLabel: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForchar_type1: nodes [
	| result |
	result := ASTCharTypeNode new.
	result charToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForcomplex_declarator1: nodes [
	| result |
	result := ASTComplexDeclaratorNode new.
	result arrayDeclarator: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForconst_dcl1: nodes [
	| result |
	result := ASTConstDclNode new.
	result constToken: (nodes at: 1).
	result constType: (nodes at: 2).
	result id: (nodes at: 3).
	result equalToken: (nodes at: 4).
	result constExp: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForconst_exp1: nodes [
	| result |
	result := ASTConstExpNode new.
	result orExpr: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForconst_type1: nodes [
	| result |
	result := ASTConstTypeNode new.
	result integerType: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForconst_type2: nodes [
	| result |
	result := ASTConstTypeNode new.
	result charType: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForconst_type3: nodes [
	| result |
	result := ASTConstTypeNode new.
	result booleanType: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForconst_type4: nodes [
	| result |
	result := ASTConstTypeNode new.
	result floatingPtType: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForconst_type5: nodes [
	| result |
	result := ASTConstTypeNode new.
	result stringType: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForconst_type6: nodes [
	| result |
	result := ASTConstTypeNode new.
	result scopedName: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForconstr_type_spec1: nodes [
	| result |
	result := ASTConstrTypeSpecNode new.
	result structType: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForconstr_type_spec2: nodes [
	| result |
	result := ASTConstrTypeSpecNode new.
	result unionType: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForconstr_type_spec3: nodes [
	| result |
	result := ASTConstrTypeSpecNode new.
	result enumType: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForcontext_expr1: nodes [
	| result |
	result := ASTContextExprNode new.
	result contextToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result stringLiterals: (nodes at: 3).
	result rightParenToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionFordeclarator1: nodes [
	| result |
	result := ASTDeclaratorNode new.
	result simpleDeclarator: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionFordeclarator2: nodes [
	| result |
	result := ASTDeclaratorNode new.
	result complexDeclarator: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionFordeclarators1: nodes [
	| result |
	result := ASTDeclaratorsNode new.
	result declarator: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionFordeclarators2: nodes [
	| result |
	result := ASTDeclaratorsNode new.
	result declarators: (nodes at: 1).
	result commaToken: (nodes at: 2).
	result declarator: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionFordefinition1: nodes [
	| result |
	result := ASTDefinitionNode new.
	result typeDcl: (nodes at: 1).
	result semicolonToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionFordefinition2: nodes [
	| result |
	result := ASTDefinitionNode new.
	result constDcl: (nodes at: 1).
	result semicolonToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionFordefinition3: nodes [
	| result |
	result := ASTDefinitionNode new.
	result exceptDcl: (nodes at: 1).
	result semicolonToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionFordefinition4: nodes [
	| result |
	result := ASTDefinitionNode new.
	result interface: (nodes at: 1).
	result semicolonToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionFordefinition5: nodes [
	| result |
	result := ASTDefinitionNode new.
	result module: (nodes at: 1).
	result semicolonToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionFordefinitions1: nodes [
	| result |
	result := ASTDefinitionsNode new.
	result definition: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionFordefinitions2: nodes [
	| result |
	result := ASTDefinitionsNode new.
	result definitions: (nodes at: 1).
	result definition: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForelement_spec1: nodes [
	| result |
	result := ASTElementSpecNode new.
	result typeSpec: (nodes at: 1).
	result declarator: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForenum_type1: nodes [
	| result |
	result := ASTEnumTypeNode new.
	result enumToken: (nodes at: 1).
	result id: (nodes at: 2).
	result leftBraceToken: (nodes at: 3).
	result enumerators: (nodes at: 4).
	result rightBraceToken: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForenumerator1: nodes [
	| result |
	result := ASTEnumeratorNode new.
	result id: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForenumerators1: nodes [
	| result |
	result := ASTEnumeratorsNode new.
	result enumerator: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForenumerators2: nodes [
	| result |
	result := ASTEnumeratorsNode new.
	result enumerators: (nodes at: 1).
	result commaToken: (nodes at: 2).
	result enumerator: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForexcept_dcl1: nodes [
	| result |
	result := ASTExceptDclNode new.
	result exceptionToken: (nodes at: 1).
	result id: (nodes at: 2).
	result leftBraceToken: (nodes at: 3).
	result memberList: (nodes at: 4).
	result rightBraceToken: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForexport1: nodes [
	| result |
	result := ASTExportNode new.
	result typeDcl: (nodes at: 1).
	result semicolonToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForexport2: nodes [
	| result |
	result := ASTExportNode new.
	result constDcl: (nodes at: 1).
	result semicolonToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForexport3: nodes [
	| result |
	result := ASTExportNode new.
	result exceptDcl: (nodes at: 1).
	result semicolonToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForexport4: nodes [
	| result |
	result := ASTExportNode new.
	result attrDcl: (nodes at: 1).
	result semicolonToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForexport5: nodes [
	| result |
	result := ASTExportNode new.
	result opDcl: (nodes at: 1).
	result semicolonToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForfixed_array_size1: nodes [
	| result |
	result := ASTFixedArraySizeNode new.
	result leftBracketToken: (nodes at: 1).
	result positiveIntConst: (nodes at: 2).
	result rightBracketToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForfixed_array_sizes1: nodes [
	| result |
	result := ASTFixedArraySizesNode new.
	result fixedArraySize: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForfixed_array_sizes2: nodes [
	| result |
	result := ASTFixedArraySizesNode new.
	result fixedArraySizes: (nodes at: 1).
	result fixedArraySize: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForfloating_pt_type1: nodes [
	| result |
	result := ASTFloatingPtTypeNode new.
	result floatToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForfloating_pt_type2: nodes [
	| result |
	result := ASTFloatingPtTypeNode new.
	result doubleToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForforward_dcl1: nodes [
	| result |
	result := ASTForwardDclNode new.
	result interfaceToken: (nodes at: 1).
	result id: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForinheritance_spec1: nodes [
	| result |
	result := ASTInheritanceSpecNode new.
	result colonToken: (nodes at: 1).
	result scopedNames: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForinteger_type1: nodes [
	| result |
	result := ASTIntegerTypeNode new.
	result signedInt: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForinteger_type2: nodes [
	| result |
	result := ASTIntegerTypeNode new.
	result unsignedInt: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForinterface1: nodes [
	| result |
	result := ASTInterfaceNode new.
	result interfaceDcl: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForinterface2: nodes [
	| result |
	result := ASTInterfaceNode new.
	result forwardDcl: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForinterface_body1: nodes [
	| result |
	result := ASTInterfaceBodyNode new.
	result export: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForinterface_body2: nodes [
	| result |
	result := ASTInterfaceBodyNode new.
	result interfaceBody: (nodes at: 1).
	result export: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForinterface_dcl1: nodes [
	| result |
	result := ASTInterfaceDclNode new.
	result interfaceHeader: (nodes at: 1).
	result leftBraceToken: (nodes at: 2).
	result interfaceBody: (nodes at: 3).
	result rightBraceToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForinterface_header1: nodes [
	| result |
	result := ASTInterfaceHeaderNode new.
	result interfaceToken: (nodes at: 1).
	result id: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForinterface_header2: nodes [
	| result |
	result := ASTInterfaceHeaderNode new.
	result interfaceToken: (nodes at: 1).
	result id: (nodes at: 2).
	result inheritanceSpec: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForliteral1: nodes [
	| result |
	result := ASTLiteralNode new.
	result iNTEGER_LITERALToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForliteral2: nodes [
	| result |
	result := ASTLiteralNode new.
	result sTRING_LITERALToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForliteral3: nodes [
	| result |
	result := ASTLiteralNode new.
	result cHARACTER_LITERALToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForliteral4: nodes [
	| result |
	result := ASTLiteralNode new.
	result fLOATING_POINT_LITERALToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForliteral5: nodes [
	| result |
	result := ASTLiteralNode new.
	result booleanLiteral: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionFormember1: nodes [
	| result |
	result := ASTMemberNode new.
	result typeSpec: (nodes at: 1).
	result declarators: (nodes at: 2).
	result semicolonToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionFormember_list1: nodes [
	| result |
	result := ASTMemberListNode new.
	result member: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionFormember_list2: nodes [
	| result |
	result := ASTMemberListNode new.
	result memberList: (nodes at: 1).
	result member: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionFormodule1: nodes [
	| result |
	result := ASTModuleNode new.
	result moduleToken: (nodes at: 1).
	result id: (nodes at: 2).
	result leftBraceToken: (nodes at: 3).
	result definitions: (nodes at: 4).
	result rightBraceToken: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionFormult_expr1: nodes [
	| result |
	result := ASTMultExprNode new.
	result unaryExpr: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionFormult_expr2: nodes [
	| result |
	result := ASTMultExprNode new.
	result multExpr: (nodes at: 1).
	result timesToken: (nodes at: 2).
	result unaryExpr: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionFormult_expr3: nodes [
	| result |
	result := ASTMultExprNode new.
	result multExpr: (nodes at: 1).
	result divideToken: (nodes at: 2).
	result unaryExpr: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionFormult_expr4: nodes [
	| result |
	result := ASTMultExprNode new.
	result multExpr: (nodes at: 1).
	result percentToken: (nodes at: 2).
	result unaryExpr: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForoctet_type1: nodes [
	| result |
	result := ASTOctetTypeNode new.
	result octetToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForop_attribute1: nodes [
	| result |
	result := ASTOpAttributeNode new.
	result onewayToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForop_dcl1: nodes [
	| result |
	result := ASTOpDclNode new.
	result opTypeSpec: (nodes at: 1).
	result id: (nodes at: 2).
	result parameterDcls: (nodes at: 3).
	result opDclOptions: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForop_dcl2: nodes [
	| result |
	result := ASTOpDclNode new.
	result opAttribute: (nodes at: 1).
	result opTypeSpec: (nodes at: 2).
	result id: (nodes at: 3).
	result parameterDcls: (nodes at: 4).
	result opDclOptions: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForop_dcl_options1: nodes [
	| result |
	result := ASTOpDclOptionsNode new.
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForop_dcl_options2: nodes [
	| result |
	result := ASTOpDclOptionsNode new.
	result raisesExpr: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForop_dcl_options3: nodes [
	| result |
	result := ASTOpDclOptionsNode new.
	result contextExpr: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForop_dcl_options4: nodes [
	| result |
	result := ASTOpDclOptionsNode new.
	result raisesExpr: (nodes at: 1).
	result contextExpr: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForop_type_spec1: nodes [
	| result |
	result := ASTOpTypeSpecNode new.
	result paramTypeSpec: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForop_type_spec2: nodes [
	| result |
	result := ASTOpTypeSpecNode new.
	result voidToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForor_expr1: nodes [
	| result |
	result := ASTOrExprNode new.
	result xorExpr: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForor_expr2: nodes [
	| result |
	result := ASTOrExprNode new.
	result orExpr: (nodes at: 1).
	result orToken: (nodes at: 2).
	result xorExpr: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForparam_attribute1: nodes [
	| result |
	result := ASTParamAttributeNode new.
	result inToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForparam_attribute2: nodes [
	| result |
	result := ASTParamAttributeNode new.
	result outToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForparam_attribute3: nodes [
	| result |
	result := ASTParamAttributeNode new.
	result inoutToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForparam_dcl1: nodes [
	| result |
	result := ASTParamDclNode new.
	result paramAttribute: (nodes at: 1).
	result paramTypeSpec: (nodes at: 2).
	result simpleDeclarator: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForparam_dcls1: nodes [
	| result |
	result := ASTParamDclsNode new.
	result paramDcl: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForparam_dcls2: nodes [
	| result |
	result := ASTParamDclsNode new.
	result paramDcls: (nodes at: 1).
	result commaToken: (nodes at: 2).
	result paramDcl: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForparam_type_spec1: nodes [
	| result |
	result := ASTParamTypeSpecNode new.
	result baseTypeSpec: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForparam_type_spec2: nodes [
	| result |
	result := ASTParamTypeSpecNode new.
	result stringType: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForparam_type_spec3: nodes [
	| result |
	result := ASTParamTypeSpecNode new.
	result scopedName: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForparameter_dcls1: nodes [
	| result |
	result := ASTParameterDclsNode new.
	result leftParenToken: (nodes at: 1).
	result paramDcls: (nodes at: 2).
	result rightParenToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForparameter_dcls2: nodes [
	| result |
	result := ASTParameterDclsNode new.
	result leftParenToken: (nodes at: 1).
	result rightParenToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForpositive_int_const1: nodes [
	| result |
	result := ASTPositiveIntConstNode new.
	result constExp: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForprimary_expr1: nodes [
	| result |
	result := ASTPrimaryExprNode new.
	result scopedName: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForprimary_expr2: nodes [
	| result |
	result := ASTPrimaryExprNode new.
	result literal: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForprimary_expr3: nodes [
	| result |
	result := ASTPrimaryExprNode new.
	result leftParenToken: (nodes at: 1).
	result constExp: (nodes at: 2).
	result rightParenToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForraises_expr1: nodes [
	| result |
	result := ASTRaisesExprNode new.
	result raisesToken: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result scopedNames: (nodes at: 3).
	result rightParenToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForscoped_name1: nodes [
	| result |
	result := ASTScopedNameNode new.
	result id: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForscoped_name2: nodes [
	| result |
	result := ASTScopedNameNode new.
	result colonColonToken: (nodes at: 1).
	result id: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForscoped_name3: nodes [
	| result |
	result := ASTScopedNameNode new.
	result scopedName: (nodes at: 1).
	result colonColonToken: (nodes at: 2).
	result id: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForscoped_names1: nodes [
	| result |
	result := ASTScopedNamesNode new.
	result scopedName: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForscoped_names2: nodes [
	| result |
	result := ASTScopedNamesNode new.
	result scopedNames: (nodes at: 1).
	result commaToken: (nodes at: 2).
	result scopedName: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForsequence_type1: nodes [
	| result |
	result := ASTSequenceTypeNode new.
	result sequenceToken: (nodes at: 1).
	result lessThanToken: (nodes at: 2).
	result simpleTypeSpec: (nodes at: 3).
	result commaToken: (nodes at: 4).
	result positiveIntConst: (nodes at: 5).
	result greaterThanToken: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForsequence_type2: nodes [
	| result |
	result := ASTSequenceTypeNode new.
	result sequenceToken: (nodes at: 1).
	result lessThanToken: (nodes at: 2).
	result simpleTypeSpec: (nodes at: 3).
	result greaterThanToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForshift_expr1: nodes [
	| result |
	result := ASTShiftExprNode new.
	result addExpr: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForshift_expr2: nodes [
	| result |
	result := ASTShiftExprNode new.
	result shiftExpr: (nodes at: 1).
	result greaterThanGreaterThanToken: (nodes at: 2).
	result addExpr: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForshift_expr3: nodes [
	| result |
	result := ASTShiftExprNode new.
	result shiftExpr: (nodes at: 1).
	result lessThanLessThanToken: (nodes at: 2).
	result addExpr: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForsigned_int1: nodes [
	| result |
	result := ASTSignedIntNode new.
	result signedLongInt: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForsigned_int2: nodes [
	| result |
	result := ASTSignedIntNode new.
	result signedShortInt: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForsigned_long_int1: nodes [
	| result |
	result := ASTSignedLongIntNode new.
	result longToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForsigned_short_int1: nodes [
	| result |
	result := ASTSignedShortIntNode new.
	result shortToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForsimple_declarator1: nodes [
	| result |
	result := ASTSimpleDeclaratorNode new.
	result id: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForsimple_declarators1: nodes [
	| result |
	result := ASTSimpleDeclaratorsNode new.
	result simpleDeclarator: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForsimple_declarators2: nodes [
	| result |
	result := ASTSimpleDeclaratorsNode new.
	result simpleDeclarators: (nodes at: 1).
	result commaToken: (nodes at: 2).
	result simpleDeclarator: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForsimple_type_spec1: nodes [
	| result |
	result := ASTSimpleTypeSpecNode new.
	result baseTypeSpec: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForsimple_type_spec2: nodes [
	| result |
	result := ASTSimpleTypeSpecNode new.
	result templateTypeSpec: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForsimple_type_spec3: nodes [
	| result |
	result := ASTSimpleTypeSpecNode new.
	result scopedName: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForspecification1: nodes [
	| result |
	result := ASTSpecificationNode new.
	result definition: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForspecification2: nodes [
	| result |
	result := ASTSpecificationNode new.
	result specification: (nodes at: 1).
	result definition: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForstring_literals1: nodes [
	| result |
	result := ASTStringLiteralsNode new.
	result sTRING_LITERALToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForstring_literals2: nodes [
	| result |
	result := ASTStringLiteralsNode new.
	result stringLiterals: (nodes at: 1).
	result commaToken: (nodes at: 2).
	result sTRING_LITERALToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForstring_type1: nodes [
	| result |
	result := ASTStringTypeNode new.
	result stringToken: (nodes at: 1).
	result lessThanToken: (nodes at: 2).
	result positiveIntConst: (nodes at: 3).
	result greaterThanToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForstring_type2: nodes [
	| result |
	result := ASTStringTypeNode new.
	result stringToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForstruct_type1: nodes [
	| result |
	result := ASTStructTypeNode new.
	result structToken: (nodes at: 1).
	result id: (nodes at: 2).
	result leftBraceToken: (nodes at: 3).
	result memberList: (nodes at: 4).
	result rightBraceToken: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForswitch_body1: nodes [
	| result |
	result := ASTSwitchBodyNode new.
	result case: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForswitch_body2: nodes [
	| result |
	result := ASTSwitchBodyNode new.
	result switchBody: (nodes at: 1).
	result case: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForswitch_type_spec1: nodes [
	| result |
	result := ASTSwitchTypeSpecNode new.
	result integerType: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForswitch_type_spec2: nodes [
	| result |
	result := ASTSwitchTypeSpecNode new.
	result charType: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForswitch_type_spec3: nodes [
	| result |
	result := ASTSwitchTypeSpecNode new.
	result booleanType: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForswitch_type_spec4: nodes [
	| result |
	result := ASTSwitchTypeSpecNode new.
	result enumType: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForswitch_type_spec5: nodes [
	| result |
	result := ASTSwitchTypeSpecNode new.
	result scopedName: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionFortemplate_type_spec1: nodes [
	| result |
	result := ASTTemplateTypeSpecNode new.
	result sequenceType: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionFortemplate_type_spec2: nodes [
	| result |
	result := ASTTemplateTypeSpecNode new.
	result stringType: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionFortype_dcl1: nodes [
	| result |
	result := ASTTypeDclNode new.
	result typedefToken: (nodes at: 1).
	result typeDeclarator: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionFortype_dcl2: nodes [
	| result |
	result := ASTTypeDclNode new.
	result structType: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionFortype_dcl3: nodes [
	| result |
	result := ASTTypeDclNode new.
	result unionType: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionFortype_dcl4: nodes [
	| result |
	result := ASTTypeDclNode new.
	result enumType: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionFortype_declarator1: nodes [
	| result |
	result := ASTTypeDeclaratorNode new.
	result typeSpec: (nodes at: 1).
	result declarators: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionFortype_spec1: nodes [
	| result |
	result := ASTTypeSpecNode new.
	result simpleTypeSpec: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionFortype_spec2: nodes [
	| result |
	result := ASTTypeSpecNode new.
	result constrTypeSpec: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForunary_expr1: nodes [
	| result |
	result := ASTUnaryExprNode new.
	result unaryOperator: (nodes at: 1).
	result primaryExpr: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForunary_expr2: nodes [
	| result |
	result := ASTUnaryExprNode new.
	result primaryExpr: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForunary_operator1: nodes [
	| result |
	result := ASTUnaryOperatorNode new.
	result minusToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForunary_operator2: nodes [
	| result |
	result := ASTUnaryOperatorNode new.
	result plusToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForunary_operator3: nodes [
	| result |
	result := ASTUnaryOperatorNode new.
	result tildeToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForunion_type1: nodes [
	| result |
	result := ASTUnionTypeNode new.
	result unionToken: (nodes at: 1).
	result id: (nodes at: 2).
	result switchToken: (nodes at: 3).
	result leftParenToken: (nodes at: 4).
	result switchTypeSpec: (nodes at: 5).
	result rightParenToken: (nodes at: 6).
	result leftBraceToken: (nodes at: 7).
	result switchBody: (nodes at: 8).
	result rightBraceToken: (nodes at: 9).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForunsigned_int1: nodes [
	| result |
	result := ASTUnsignedIntNode new.
	result unsignedLongInt: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForunsigned_int2: nodes [
	| result |
	result := ASTUnsignedIntNode new.
	result unsignedShortInt: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForunsigned_long_int1: nodes [
	| result |
	result := ASTUnsignedLongIntNode new.
	result unsignedToken: (nodes at: 1).
	result longToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForunsigned_short_int1: nodes [
	| result |
	result := ASTUnsignedShortIntNode new.
	result unsignedToken: (nodes at: 1).
	result shortToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForxor_expr1: nodes [
	| result |
	result := ASTXorExprNode new.
	result andExpr: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
OMGParser >> reduceActionForxor_expr2: nodes [
	| result |
	result := ASTXorExprNode new.
	result xorExpr: (nodes at: 1).
	result upArrowToken: (nodes at: 2).
	result andExpr: (nodes at: 3).
	^ result
]

{ #category : #generated }
OMGParser >> reduceTable [
^#(
	#(150 1 #reduceActionForinterface1:) 
	#(150 1 #reduceActionForinterface2:) 
	#(97 1 #reduceActionForspecification1:) 
	#(95 1 #reduceActionFortype_dcl2:) 
	#(95 1 #reduceActionFortype_dcl3:) 
	#(95 1 #reduceActionFortype_dcl4:) 
	#(70 2 #reduceActionForinterface_header1:) 
	#(69 2 #reduceActionForforward_dcl1:) 
	#(83 1 #reduceActionForfloating_pt_type1:) 
	#(83 1 #reduceActionForfloating_pt_type2:) 
	#(120 1 #reduceActionForsigned_long_int1:) 
	#(84 1 #reduceActionForstring_type2:) 
	#(111 1 #reduceActionForoctet_type1:) 
	#(81 1 #reduceActionForchar_type1:) 
	#(112 1 #reduceActionForany_type1:) 
	#(121 1 #reduceActionForsigned_short_int1:) 
	#(82 1 #reduceActionForboolean_type1:) 
	#(77 1 #reduceActionForscoped_name1:) 
	#(107 1 #reduceActionForsimple_type_spec3:) 
	#(109 1 #reduceActionForbase_type_spec2:) 
	#(109 1 #reduceActionForbase_type_spec3:) 
	#(109 1 #reduceActionForbase_type_spec4:) 
	#(109 1 #reduceActionForbase_type_spec1:) 
	#(110 1 #reduceActionFortemplate_type_spec2:) 
	#(95 2 #reduceActionFortype_dcl1:) 
	#(108 1 #reduceActionForconstr_type_spec1:) 
	#(108 1 #reduceActionForconstr_type_spec2:) 
	#(108 1 #reduceActionForconstr_type_spec3:) 
	#(105 1 #reduceActionFortype_spec1:) 
	#(105 1 #reduceActionFortype_spec2:) 
	#(107 1 #reduceActionForsimple_type_spec1:) 
	#(107 1 #reduceActionForsimple_type_spec2:) 
	#(109 1 #reduceActionForbase_type_spec5:) 
	#(109 1 #reduceActionForbase_type_spec6:) 
	#(110 1 #reduceActionFortemplate_type_spec1:) 
	#(80 1 #reduceActionForinteger_type1:) 
	#(80 1 #reduceActionForinteger_type2:) 
	#(118 1 #reduceActionForsigned_int1:) 
	#(118 1 #reduceActionForsigned_int2:) 
	#(119 1 #reduceActionForunsigned_int1:) 
	#(119 1 #reduceActionForunsigned_int2:) 
	#(78 1 #reduceActionForconst_type6:) 
	#(78 1 #reduceActionForconst_type1:) 
	#(78 1 #reduceActionForconst_type2:) 
	#(78 1 #reduceActionForconst_type3:) 
	#(78 1 #reduceActionForconst_type4:) 
	#(78 1 #reduceActionForconst_type5:) 
	#(98 2 #reduceActionFordefinition5:) 
	#(98 2 #reduceActionFordefinition3:) 
	#(98 2 #reduceActionFordefinition2:) 
	#(98 2 #reduceActionFordefinition1:) 
	#(97 2 #reduceActionForspecification2:) 
	#(98 2 #reduceActionFordefinition4:) 
	#(70 3 #reduceActionForinterface_header2:) 
	#(77 2 #reduceActionForscoped_name2:) 
	#(122 2 #reduceActionForunsigned_long_int1:) 
	#(123 2 #reduceActionForunsigned_short_int1:) 
	#(115 1 #reduceActionForsimple_declarator1:) 
	#(101 2 #reduceActionFortype_declarator1:) 
	#(106 1 #reduceActionFordeclarators1:) 
	#(114 1 #reduceActionFordeclarator1:) 
	#(114 1 #reduceActionFordeclarator2:) 
	#(116 1 #reduceActionForcomplex_declarator1:) 
	#(141 1 #reduceActionForop_attribute1:) 
	#(138 1 #reduceActionForop_type_spec2:) 
	#(71 1 #reduceActionForinterface_body1:) 
	#(136 1 #reduceActionForparam_type_spec3:) 
	#(136 1 #reduceActionForparam_type_spec2:) 
	#(136 1 #reduceActionForparam_type_spec1:) 
	#(138 1 #reduceActionForop_type_spec1:) 
	#(151 1 #reduceActionForscoped_names1:) 
	#(72 2 #reduceActionForinheritance_spec1:) 
	#(67 1 #reduceActionFordefinitions1:) 
	#(92 1 #reduceActionForunary_operator3:) 
	#(92 1 #reduceActionForunary_operator2:) 
	#(92 1 #reduceActionForunary_operator1:) 
	#(99 1 #reduceActionForboolean_literal2:) 
	#(99 1 #reduceActionForboolean_literal1:) 
	#(94 1 #reduceActionForliteral1:) 
	#(94 1 #reduceActionForliteral4:) 
	#(94 1 #reduceActionForliteral3:) 
	#(94 1 #reduceActionForliteral2:) 
	#(93 1 #reduceActionForprimary_expr1:) 
	#(100 1 #reduceActionForpositive_int_const1:) 
	#(79 1 #reduceActionForconst_exp1:) 
	#(85 1 #reduceActionForor_expr1:) 
	#(86 1 #reduceActionForxor_expr1:) 
	#(87 1 #reduceActionForand_expr1:) 
	#(88 1 #reduceActionForshift_expr1:) 
	#(89 1 #reduceActionForadd_expr1:) 
	#(90 1 #reduceActionFormult_expr1:) 
	#(91 1 #reduceActionForunary_expr2:) 
	#(93 1 #reduceActionForprimary_expr2:) 
	#(94 1 #reduceActionForliteral5:) 
	#(77 3 #reduceActionForscoped_name3:) 
	#(117 2 #reduceActionForarray_declarator1:) 
	#(134 1 #reduceActionForfixed_array_sizes1:) 
	#(124 1 #reduceActionFormember_list1:) 
	#(133 1 #reduceActionForenumerator1:) 
	#(132 1 #reduceActionForenumerators1:) 
	#(73 2 #reduceActionForexport3:) 
	#(68 4 #reduceActionForinterface_dcl1:) 
	#(71 2 #reduceActionForinterface_body2:) 
	#(73 2 #reduceActionForexport4:) 
	#(73 2 #reduceActionForexport5:) 
	#(73 2 #reduceActionForexport2:) 
	#(73 2 #reduceActionForexport1:) 
	#(65 5 #reduceActionFormodule1:) 
	#(67 2 #reduceActionFordefinitions2:) 
	#(91 2 #reduceActionForunary_expr1:) 
	#(84 4 #reduceActionForstring_type1:) 
	#(113 4 #reduceActionForsequence_type2:) 
	#(134 2 #reduceActionForfixed_array_sizes2:) 
	#(106 3 #reduceActionFordeclarators2:) 
	#(76 5 #reduceActionForconst_dcl1:) 
	#(66 5 #reduceActionForexcept_dcl1:) 
	#(124 2 #reduceActionFormember_list2:) 
	#(102 5 #reduceActionForstruct_type1:) 
	#(104 5 #reduceActionForenum_type1:) 
	#(126 1 #reduceActionForswitch_type_spec5:) 
	#(126 1 #reduceActionForswitch_type_spec1:) 
	#(126 1 #reduceActionForswitch_type_spec2:) 
	#(126 1 #reduceActionForswitch_type_spec3:) 
	#(126 1 #reduceActionForswitch_type_spec4:) 
	#(137 1 #reduceActionForsimple_declarators1:) 
	#(74 3 #reduceActionForattr_dcl1:) 
	#(140 0 #reduceActionForop_dcl_options1:) 
	#(151 3 #reduceActionForscoped_names2:) 
	#(93 3 #reduceActionForprimary_expr3:) 
	#(85 3 #reduceActionForor_expr2:) 
	#(86 3 #reduceActionForxor_expr2:) 
	#(87 3 #reduceActionForand_expr2:) 
	#(88 3 #reduceActionForshift_expr2:) 
	#(88 3 #reduceActionForshift_expr3:) 
	#(89 3 #reduceActionForadd_expr2:) 
	#(89 3 #reduceActionForadd_expr3:) 
	#(90 3 #reduceActionFormult_expr4:) 
	#(90 3 #reduceActionFormult_expr3:) 
	#(90 3 #reduceActionFormult_expr2:) 
	#(135 3 #reduceActionForfixed_array_size1:) 
	#(125 3 #reduceActionFormember1:) 
	#(132 3 #reduceActionForenumerators2:) 
	#(74 4 #reduceActionForattr_dcl2:) 
	#(139 2 #reduceActionForparameter_dcls2:) 
	#(146 1 #reduceActionForparam_attribute3:) 
	#(146 1 #reduceActionForparam_attribute2:) 
	#(146 1 #reduceActionForparam_attribute1:) 
	#(144 1 #reduceActionForparam_dcls1:) 
	#(75 4 #reduceActionForop_dcl1:) 
	#(140 1 #reduceActionForop_dcl_options2:) 
	#(140 1 #reduceActionForop_dcl_options3:) 
	#(113 6 #reduceActionForsequence_type1:) 
	#(137 3 #reduceActionForsimple_declarators2:) 
	#(139 3 #reduceActionForparameter_dcls1:) 
	#(140 2 #reduceActionForop_dcl_options4:) 
	#(75 5 #reduceActionForop_dcl2:) 
	#(127 1 #reduceActionForswitch_body1:) 
	#(129 1 #reduceActionForcase_labels1:) 
	#(144 3 #reduceActionForparam_dcls2:) 
	#(145 3 #reduceActionForparam_dcl1:) 
	#(147 1 #reduceActionForstring_literals1:) 
	#(131 2 #reduceActionForcase_label2:) 
	#(103 9 #reduceActionForunion_type1:) 
	#(127 2 #reduceActionForswitch_body2:) 
	#(129 2 #reduceActionForcase_labels2:) 
	#(143 4 #reduceActionForcontext_expr1:) 
	#(142 4 #reduceActionForraises_expr1:) 
	#(131 3 #reduceActionForcase_label1:) 
	#(130 2 #reduceActionForelement_spec1:) 
	#(128 3 #reduceActionForcase1:) 
	#(147 3 #reduceActionForstring_literals2:)
	).
]

{ #category : #generated }
OMGParser >> symbolNames [
	^ #('"%"' '"/"' '"*"' '"~"' '"+"' '"("' '"-"' '"float"' '"context"' '"FALSE"' '">>"' '")"' '"<<"' '"TRUE"' '"double"' '"interface"' '"}"' '"{"' '":"' '";"' '","' '"module"' '"^"' '"|"' '"="' '"&"' '"::"' '"typedef"' '"const"' '"readonly"' '"attribute"' '"]"' '"exception"' '"long"' '"oneway"' '"["' '"raises"' '"inout"' '"out"' '"string"' '"void"' '">"' '"in"' '"<"' '"octet"' '"sequence"' '"char"' '"any"' '"short"' '"boolean"' '"unsigned"' '"struct"' '"default"' '"enum"' '"case"' '"union"' '"switch"' '<INTEGER_LITERAL>' '<FLOATING_POINT_LITERAL>' '<CHARACTER_LITERAL>' '<STRING_LITERAL>' '<IDENTIFIER>' '<whitespace>' '<comment>' 'module' 'except_dcl' 'definitions' 'interface_dcl' 'forward_dcl' 'interface_header' 'interface_body' 'inheritance_spec' 'export' 'attr_dcl' 'op_dcl' 'const_dcl' 'scoped_name' 'const_type' 'const_exp' 'integer_type' 'char_type' 'boolean_type' 'floating_pt_type' 'string_type' 'or_expr' 'xor_expr' 'and_expr' 'shift_expr' 'add_expr' 'mult_expr' 'unary_expr' 'unary_operator' 'primary_expr' 'literal' 'type_dcl' 'B e g i n' 'specification' 'definition' 'boolean_literal' 'positive_int_const' 'type_declarator' 'struct_type' 'union_type' 'enum_type' 'type_spec' 'declarators' 'simple_type_spec' 'constr_type_spec' 'base_type_spec' 'template_type_spec' 'octet_type' 'any_type' 'sequence_type' 'declarator' 'simple_declarator' 'complex_declarator' 'array_declarator' 'signed_int' 'unsigned_int' 'signed_long_int' 'signed_short_int' 'unsigned_long_int' 'unsigned_short_int' 'member_list' 'member' 'switch_type_spec' 'switch_body' 'case' 'case_labels' 'element_spec' 'case_label' 'enumerators' 'enumerator' 'fixed_array_sizes' 'fixed_array_size' 'param_type_spec' 'simple_declarators' 'op_type_spec' 'parameter_dcls' 'op_dcl_options' 'op_attribute' 'raises_expr' 'context_expr' 'param_dcls' 'param_dcl' 'param_attribute' 'string_literals' 'E O F' 'error' 'interface' 'scoped_names')
]

{ #category : #generated }
OMGParser >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #ASTModuleNode #ASTExceptDclNode #ASTDefinitionsNode #ASTInterfaceDclNode #ASTForwardDclNode #ASTInterfaceHeaderNode #ASTInterfaceBodyNode #ASTInheritanceSpecNode #ASTExportNode #ASTAttrDclNode #ASTOpDclNode #ASTConstDclNode #ASTScopedNameNode #ASTConstTypeNode #ASTConstExpNode #ASTIntegerTypeNode #ASTCharTypeNode #ASTBooleanTypeNode #ASTFloatingPtTypeNode #ASTStringTypeNode #ASTOrExprNode #ASTXorExprNode #ASTAndExprNode #ASTShiftExprNode #ASTAddExprNode #ASTMultExprNode #ASTUnaryExprNode #ASTUnaryOperatorNode #ASTPrimaryExprNode #ASTLiteralNode #ASTTypeDclNode #ASTSpecificationNode #ASTSpecificationNode #ASTDefinitionNode #ASTBooleanLiteralNode #ASTPositiveIntConstNode #ASTTypeDeclaratorNode #ASTStructTypeNode #ASTUnionTypeNode #ASTEnumTypeNode #ASTTypeSpecNode #ASTDeclaratorsNode #ASTSimpleTypeSpecNode #ASTConstrTypeSpecNode #ASTBaseTypeSpecNode #ASTTemplateTypeSpecNode #ASTOctetTypeNode #ASTAnyTypeNode #ASTSequenceTypeNode #ASTDeclaratorNode #ASTSimpleDeclaratorNode #ASTComplexDeclaratorNode #ASTArrayDeclaratorNode #ASTSignedIntNode #ASTUnsignedIntNode #ASTSignedLongIntNode #ASTSignedShortIntNode #ASTUnsignedLongIntNode #ASTUnsignedShortIntNode #ASTMemberListNode #ASTMemberNode #ASTSwitchTypeSpecNode #ASTSwitchBodyNode #ASTCaseNode #ASTCaseLabelsNode #ASTElementSpecNode #ASTCaseLabelNode #ASTEnumeratorsNode #ASTEnumeratorNode #ASTFixedArraySizesNode #ASTFixedArraySizeNode #ASTParamTypeSpecNode #ASTSimpleDeclaratorsNode #ASTOpTypeSpecNode #ASTParameterDclsNode #ASTOpDclOptionsNode #ASTOpAttributeNode #ASTRaisesExprNode #ASTContextExprNode #ASTParamDclsNode #ASTParamDclNode #ASTParamAttributeNode #ASTStringLiteralsNode #SmaCCToken #SmaCCToken #ASTInterfaceNode #ASTScopedNamesNode)
]

{ #category : #generated }
OMGParser >> transitionTable [
^#(
#[1 0 9 0 16 0 13 0 22 0 17 0 28 0 21 0 29 0 25 0 33 0 29 0 52 0 33 0 54 0 37 0 56 0 41 0 65 0 45 0 66 0 49 0 68 0 53 0 69 0 57 0 70 0 61 0 76 0 65 0 95 0 69 0 97 0 73 0 98 0 77 0 102 0 81 0 103 0 85 0 104 0 89 0 150] 
#[0 0 93 0 62] 
#[0 0 97 0 62] 
#[1 0 101 0 8 0 105 0 15 0 109 0 27 0 113 0 34 0 117 0 40 0 121 0 45 0 125 0 46 0 129 0 47 0 133 0 48 0 137 0 49 0 141 0 50 0 145 0 51 0 29 0 52 0 33 0 54 0 37 0 56 0 149 0 62 0 153 0 77 0 157 0 80 0 161 0 81 0 165 0 82 0 169 0 83 0 173 0 84 0 177 0 101 0 181 0 102 0 185 0 103 0 189 0 104 0 193 0 105 0 197 0 107 0 201 0 108 0 205 0 109 0 209 0 110 0 213 0 111 0 217 0 112 0 221 0 113 0 225 0 118 0 229 0 119 0 233 0 120 0 237 0 121 0 241 0 122 0 245 0 123] 
#[1 0 101 0 8 0 105 0 15 0 109 0 27 0 113 0 34 0 117 0 40 0 129 0 47 0 137 0 49 0 141 0 50 0 145 0 51 0 149 0 62 0 249 0 77 0 253 0 78 1 1 0 80 1 5 0 81 1 9 0 82 1 13 0 83 1 17 0 84 0 225 0 118 0 229 0 119 0 233 0 120 0 237 0 121 0 241 0 122 0 245 0 123] 
#[0 1 21 0 62] 
#[0 1 25 0 62] 
#[0 1 29 0 62] 
#[0 1 33 0 62] 
#[0 1 37 0 20] 
#[0 1 41 0 20] 
#[0 0 6 0 20] 
#[0 0 10 0 20] 
#[0 1 45 0 18] 
#[0 1 49 0 20] 
#[0 1 53 0 20] 
#[1 0 9 0 16 0 13 0 22 0 17 0 28 0 21 0 29 0 25 0 33 0 29 0 52 0 33 0 54 0 37 0 56 0 41 0 65 0 45 0 66 0 49 0 68 0 53 0 69 0 57 0 70 0 61 0 76 0 65 0 95 1 57 0 98 0 77 0 102 0 81 0 103 0 85 0 104 0 0 0 148 0 89 0 150] 
#[0 0 14 0 16 0 22 0 28 0 29 0 33 0 52 0 54 0 56 0 148] 
#[0 0 18 0 20] 
#[0 0 22 0 20] 
#[0 0 26 0 20] 
#[0 1 61 0 20] 
#[1 0 30 0 18 1 65 0 19 0 34 0 20 1 69 0 72] 
#[0 1 73 0 18] 
#[0 0 38 0 21 0 42 0 62] 
#[0 0 42 0 21 0 42 0 62] 
#[0 1 77 0 62] 
#[0 0 46 0 12 0 21 0 42 0 62] 
#[1 0 50 0 21 0 50 0 42 1 81 0 44 0 50 0 62] 
#[0 0 54 0 21 0 42 0 62] 
#[0 1 85 0 44] 
#[0 0 58 0 12 0 21 0 42 0 62] 
#[0 0 62 0 21 0 42 0 62] 
#[0 0 66 0 12 0 21 0 42 0 62] 
#[0 0 70 0 12 0 21 0 42 0 62] 
#[1 1 89 0 34 1 93 0 49] 
#[0 0 74 0 1 0 2 0 3 0 5 0 7 0 11 0 12 0 13 0 18 0 19 0 20 0 21 0 23 0 24 0 26 0 27 0 32 0 42 0 62] 
#[1 0 78 0 21 1 97 0 27 0 78 0 42 0 78 0 62] 
#[0 0 82 0 21 0 42 0 62] 
#[0 0 86 0 21 0 42 0 62] 
#[0 0 90 0 21 0 42 0 62] 
#[0 0 94 0 21 0 42 0 62] 
#[0 0 98 0 21 0 42 0 62] 
#[0 0 102 0 20] 
#[0 0 106 0 62] 
#[0 0 110 0 62] 
#[0 0 114 0 62] 
#[1 1 101 0 62 1 105 0 106 1 109 0 114 1 113 0 115 1 117 0 116 1 121 0 117] 
#[0 0 118 0 62] 
#[0 0 122 0 62] 
#[0 0 126 0 21 0 42 0 62] 
#[0 0 130 0 21 0 42 0 62] 
#[0 0 134 0 21 0 42 0 62] 
#[0 0 138 0 21 0 42 0 62] 
#[0 0 142 0 21 0 42 0 62] 
#[0 0 146 0 12 0 21 0 42 0 62] 
#[0 0 150 0 12 0 21 0 42 0 62] 
#[0 0 154 0 12 0 21 0 42 0 62] 
#[0 0 158 0 12 0 21 0 42 0 62] 
#[0 0 162 0 12 0 21 0 42 0 62] 
#[0 0 166 0 12 0 21 0 42 0 62] 
#[1 1 97 0 27 0 170 0 62] 
#[0 1 125 0 62] 
#[0 0 174 0 62] 
#[0 0 178 0 62] 
#[0 0 182 0 62] 
#[0 0 186 0 62] 
#[0 0 190 0 62] 
#[0 1 129 0 18] 
#[0 1 133 0 18] 
#[0 1 137 0 18] 
#[0 1 141 0 57] 
#[0 0 194 0 16 0 17 0 22 0 28 0 29 0 33 0 52 0 54 0 56 0 148] 
#[0 0 198 0 16 0 17 0 22 0 28 0 29 0 33 0 52 0 54 0 56 0 148] 
#[1 0 101 0 8 0 105 0 15 0 109 0 27 0 17 0 28 0 21 0 29 1 145 0 30 1 149 0 31 0 25 0 33 0 113 0 34 1 153 0 35 0 117 0 40 1 157 0 41 0 121 0 45 0 129 0 47 0 133 0 48 0 137 0 49 0 141 0 50 0 145 0 51 0 29 0 52 0 33 0 54 0 37 0 56 0 149 0 62 1 161 0 66 1 165 0 71 1 169 0 73 1 173 0 74 1 177 0 75 1 181 0 76 1 185 0 77 0 157 0 80 0 161 0 81 0 165 0 82 0 169 0 83 1 189 0 84 1 193 0 95 0 77 0 102 0 81 0 103 0 85 0 104 1 197 0 109 0 213 0 111 0 217 0 112 0 225 0 118 0 229 0 119 0 233 0 120 0 237 0 121 0 241 0 122 0 245 0 123 1 201 0 136 1 205 0 138 1 209 0 141] 
#[0 0 202 0 16 0 17 0 22 0 28 0 29 0 33 0 52 0 54 0 56 0 148] 
#[0 0 206 0 16 0 17 0 22 0 28 0 29 0 33 0 52 0 54 0 56 0 148] 
#[0 0 210 0 16 0 22 0 28 0 29 0 33 0 52 0 54 0 56 0 148] 
#[0 0 214 0 16 0 17 0 22 0 28 0 29 0 33 0 52 0 54 0 56 0 148] 
#[1 0 109 0 27 0 149 0 62 1 213 0 77 1 217 0 151] 
#[0 0 218 0 18] 
#[1 0 9 0 16 0 13 0 22 0 17 0 28 0 21 0 29 0 25 0 33 0 29 0 52 0 33 0 54 0 37 0 56 0 41 0 65 0 45 0 66 1 221 0 67 0 49 0 68 0 53 0 69 0 57 0 70 0 61 0 76 0 65 0 95 1 225 0 98 0 77 0 102 0 81 0 103 0 85 0 104 0 89 0 150] 
#[0 0 222 0 1 0 2 0 3 0 5 0 7 0 11 0 12 0 13 0 18 0 19 0 20 0 21 0 23 0 24 0 26 0 27 0 32 0 42 0 62] 
#[1 1 229 0 4 1 233 0 5 1 237 0 6 1 241 0 7 1 245 0 10 1 249 0 14 0 109 0 27 1 253 0 58 2 1 0 59 2 5 0 60 2 9 0 61 0 149 0 62 2 13 0 77 2 17 0 79 2 21 0 85 2 25 0 86 2 29 0 87 2 33 0 88 2 37 0 89 2 41 0 90 2 45 0 91 2 49 0 92 2 53 0 93 2 57 0 94 2 61 0 99 2 65 0 100] 
#[1 0 101 0 8 0 105 0 15 0 109 0 27 0 113 0 34 0 117 0 40 0 121 0 45 0 125 0 46 0 129 0 47 0 133 0 48 0 137 0 49 0 141 0 50 0 145 0 51 0 149 0 62 0 153 0 77 0 157 0 80 0 161 0 81 0 165 0 82 0 169 0 83 0 173 0 84 2 69 0 107 0 205 0 109 0 209 0 110 0 213 0 111 0 217 0 112 0 221 0 113 0 225 0 118 0 229 0 119 0 233 0 120 0 237 0 121 0 241 0 122 0 245 0 123] 
#[0 0 226 0 12 0 21 0 42 0 62] 
#[0 0 230 0 12 0 21 0 42 0 62] 
#[0 2 73 0 62] 
#[1 0 234 0 20 0 234 0 21 2 77 0 36 2 81 0 134 2 85 0 135] 
#[1 0 238 0 20 2 89 0 21] 
#[0 0 242 0 20 0 21] 
#[0 0 246 0 20 0 21] 
#[0 0 250 0 20 0 21] 
#[0 0 254 0 20 0 21] 
#[0 2 93 0 25] 
#[1 0 101 0 8 0 105 0 15 0 109 0 27 0 113 0 34 0 117 0 40 0 121 0 45 0 125 0 46 0 129 0 47 0 133 0 48 0 137 0 49 0 141 0 50 0 145 0 51 0 29 0 52 0 33 0 54 0 37 0 56 0 149 0 62 0 153 0 77 0 157 0 80 0 161 0 81 0 165 0 82 0 169 0 83 0 173 0 84 0 181 0 102 0 185 0 103 0 189 0 104 2 97 0 105 0 197 0 107 0 201 0 108 0 205 0 109 0 209 0 110 0 213 0 111 0 217 0 112 0 221 0 113 0 225 0 118 0 229 0 119 0 233 0 120 0 237 0 121 0 241 0 122 0 245 0 123 2 101 0 124 2 105 0 125] 
#[1 0 101 0 8 0 105 0 15 0 109 0 27 0 113 0 34 0 117 0 40 0 121 0 45 0 125 0 46 0 129 0 47 0 133 0 48 0 137 0 49 0 141 0 50 0 145 0 51 0 29 0 52 0 33 0 54 0 37 0 56 0 149 0 62 0 153 0 77 0 157 0 80 0 161 0 81 0 165 0 82 0 169 0 83 0 173 0 84 0 181 0 102 0 185 0 103 0 189 0 104 2 97 0 105 0 197 0 107 0 201 0 108 0 205 0 109 0 209 0 110 0 213 0 111 0 217 0 112 0 221 0 113 0 225 0 118 0 229 0 119 0 233 0 120 0 237 0 121 0 241 0 122 0 245 0 123 2 109 0 124 2 105 0 125] 
#[1 2 113 0 62 2 117 0 132 2 121 0 133] 
#[0 2 125 0 6] 
#[0 2 129 0 31] 
#[1 0 101 0 8 0 105 0 15 0 109 0 27 0 113 0 34 0 117 0 40 0 121 0 45 0 129 0 47 0 133 0 48 0 137 0 49 0 141 0 50 0 145 0 51 0 149 0 62 1 185 0 77 0 157 0 80 0 161 0 81 0 165 0 82 0 169 0 83 1 189 0 84 1 197 0 109 0 213 0 111 0 217 0 112 0 225 0 118 0 229 0 119 0 233 0 120 0 237 0 121 0 241 0 122 0 245 0 123 2 133 0 136] 
#[0 1 2 0 8 0 15 0 27 0 34 0 40 0 41 0 45 0 47 0 48 0 49 0 50 0 51 0 62] 
#[0 1 6 0 62] 
#[0 2 137 0 20] 
#[1 0 101 0 8 0 105 0 15 2 141 0 17 0 109 0 27 0 17 0 28 0 21 0 29 1 145 0 30 1 149 0 31 0 25 0 33 0 113 0 34 1 153 0 35 0 117 0 40 1 157 0 41 0 121 0 45 0 129 0 47 0 133 0 48 0 137 0 49 0 141 0 50 0 145 0 51 0 29 0 52 0 33 0 54 0 37 0 56 0 149 0 62 1 161 0 66 2 145 0 73 1 173 0 74 1 177 0 75 1 181 0 76 1 185 0 77 0 157 0 80 0 161 0 81 0 165 0 82 0 169 0 83 1 189 0 84 1 193 0 95 0 77 0 102 0 81 0 103 0 85 0 104 1 197 0 109 0 213 0 111 0 217 0 112 0 225 0 118 0 229 0 119 0 233 0 120 0 237 0 121 0 241 0 122 0 245 0 123 1 201 0 136 1 205 0 138 1 209 0 141] 
#[0 1 10 0 8 0 15 0 17 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 40 0 41 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 54 0 56 0 62] 
#[0 2 149 0 20] 
#[0 2 153 0 20] 
#[0 2 157 0 20] 
#[1 1 97 0 27 1 14 0 62] 
#[0 1 18 0 62] 
#[0 2 161 0 20] 
#[0 1 22 0 62] 
#[0 1 26 0 62] 
#[0 2 165 0 62] 
#[1 0 101 0 8 0 105 0 15 0 109 0 27 0 113 0 34 0 117 0 40 1 157 0 41 0 121 0 45 0 129 0 47 0 133 0 48 0 137 0 49 0 141 0 50 0 145 0 51 0 149 0 62 1 185 0 77 0 157 0 80 0 161 0 81 0 165 0 82 0 169 0 83 1 189 0 84 1 197 0 109 0 213 0 111 0 217 0 112 0 225 0 118 0 229 0 119 0 233 0 120 0 237 0 121 0 241 0 122 0 245 0 123 1 201 0 136 2 169 0 138] 
#[1 1 30 0 12 1 30 0 18 1 30 0 21 1 97 0 27] 
#[1 1 34 0 18 2 173 0 21] 
#[1 0 9 0 16 2 177 0 17 0 13 0 22 0 17 0 28 0 21 0 29 0 25 0 33 0 29 0 52 0 33 0 54 0 37 0 56 0 41 0 65 0 45 0 66 0 49 0 68 0 53 0 69 0 57 0 70 0 61 0 76 0 65 0 95 2 181 0 98 0 77 0 102 0 81 0 103 0 85 0 104 0 89 0 150] 
#[0 1 38 0 16 0 17 0 22 0 28 0 29 0 33 0 52 0 54 0 56] 
#[0 1 42 0 6 0 10 0 14 0 27 0 58 0 59 0 60 0 61 0 62] 
#[0 1 46 0 6 0 10 0 14 0 27 0 58 0 59 0 60 0 61 0 62] 
#[1 1 229 0 4 1 233 0 5 1 237 0 6 1 241 0 7 1 245 0 10 1 249 0 14 0 109 0 27 1 253 0 58 2 1 0 59 2 5 0 60 2 9 0 61 0 149 0 62 2 13 0 77 2 185 0 79 2 21 0 85 2 25 0 86 2 29 0 87 2 33 0 88 2 37 0 89 2 41 0 90 2 45 0 91 2 49 0 92 2 53 0 93 2 57 0 94 2 61 0 99] 
#[0 1 50 0 6 0 10 0 14 0 27 0 58 0 59 0 60 0 61 0 62] 
#[0 1 54 0 1 0 2 0 3 0 5 0 7 0 11 0 12 0 13 0 19 0 20 0 23 0 24 0 26 0 32 0 42] 
#[0 1 58 0 1 0 2 0 3 0 5 0 7 0 11 0 12 0 13 0 19 0 20 0 23 0 24 0 26 0 32 0 42] 
#[0 1 62 0 1 0 2 0 3 0 5 0 7 0 11 0 12 0 13 0 19 0 20 0 23 0 24 0 26 0 32 0 42] 
#[0 1 66 0 1 0 2 0 3 0 5 0 7 0 11 0 12 0 13 0 19 0 20 0 23 0 24 0 26 0 32 0 42] 
#[0 1 70 0 1 0 2 0 3 0 5 0 7 0 11 0 12 0 13 0 19 0 20 0 23 0 24 0 26 0 32 0 42] 
#[0 1 74 0 1 0 2 0 3 0 5 0 7 0 11 0 12 0 13 0 19 0 20 0 23 0 24 0 26 0 32 0 42] 
#[1 1 78 0 1 1 78 0 2 1 78 0 3 1 78 0 5 1 78 0 7 1 78 0 11 1 78 0 12 1 78 0 13 1 78 0 19 1 78 0 20 1 78 0 23 1 78 0 24 1 78 0 26 1 97 0 27 1 78 0 32 1 78 0 42] 
#[0 1 82 0 32 0 42] 
#[1 1 86 0 12 1 86 0 19 1 86 0 20 2 189 0 24 1 86 0 32 1 86 0 42] 
#[1 1 90 0 12 1 90 0 19 1 90 0 20 2 193 0 23 1 90 0 24 1 90 0 32 1 90 0 42] 
#[1 1 94 0 12 1 94 0 19 1 94 0 20 1 94 0 23 1 94 0 24 2 197 0 26 1 94 0 32 1 94 0 42] 
#[1 2 201 0 11 1 98 0 12 2 205 0 13 1 98 0 19 1 98 0 20 1 98 0 23 1 98 0 24 1 98 0 26 1 98 0 32 1 98 0 42] 
#[1 2 209 0 5 2 213 0 7 1 102 0 11 1 102 0 12 1 102 0 13 1 102 0 19 1 102 0 20 1 102 0 23 1 102 0 24 1 102 0 26 1 102 0 32 1 102 0 42] 
#[1 2 217 0 1 2 221 0 2 2 225 0 3 1 106 0 5 1 106 0 7 1 106 0 11 1 106 0 12 1 106 0 13 1 106 0 19 1 106 0 20 1 106 0 23 1 106 0 24 1 106 0 26 1 106 0 32 1 106 0 42] 
#[0 1 110 0 1 0 2 0 3 0 5 0 7 0 11 0 12 0 13 0 19 0 20 0 23 0 24 0 26 0 32 0 42] 
#[1 1 237 0 6 1 245 0 10 1 249 0 14 0 109 0 27 1 253 0 58 2 1 0 59 2 5 0 60 2 9 0 61 0 149 0 62 2 13 0 77 2 229 0 93 2 57 0 94 2 61 0 99] 
#[0 1 114 0 1 0 2 0 3 0 5 0 7 0 11 0 12 0 13 0 19 0 20 0 23 0 24 0 26 0 32 0 42] 
#[0 1 118 0 1 0 2 0 3 0 5 0 7 0 11 0 12 0 13 0 19 0 20 0 23 0 24 0 26 0 32 0 42] 
#[0 1 122 0 1 0 2 0 3 0 5 0 7 0 11 0 12 0 13 0 19 0 20 0 23 0 24 0 26 0 32 0 42] 
#[0 2 233 0 42] 
#[1 2 237 0 21 2 241 0 42] 
#[0 1 126 0 1 0 2 0 3 0 5 0 7 0 11 0 12 0 13 0 18 0 19 0 20 0 21 0 23 0 24 0 26 0 27 0 32 0 42 0 62] 
#[1 1 229 0 4 1 233 0 5 1 237 0 6 1 241 0 7 1 245 0 10 1 249 0 14 0 109 0 27 1 253 0 58 2 1 0 59 2 5 0 60 2 9 0 61 0 149 0 62 2 13 0 77 2 17 0 79 2 21 0 85 2 25 0 86 2 29 0 87 2 33 0 88 2 37 0 89 2 41 0 90 2 45 0 91 2 49 0 92 2 53 0 93 2 57 0 94 2 61 0 99 2 245 0 100] 
#[1 1 130 0 20 1 130 0 21 2 77 0 36 2 249 0 135] 
#[0 1 134 0 20 0 21 0 36] 
#[1 1 101 0 62 2 253 0 114 1 113 0 115 1 117 0 116 1 121 0 117] 
#[1 1 229 0 4 1 233 0 5 1 237 0 6 1 241 0 7 1 245 0 10 1 249 0 14 0 109 0 27 1 253 0 58 2 1 0 59 2 5 0 60 2 9 0 61 0 149 0 62 2 13 0 77 3 1 0 79 2 21 0 85 2 25 0 86 2 29 0 87 2 33 0 88 2 37 0 89 2 41 0 90 2 45 0 91 2 49 0 92 2 53 0 93 2 57 0 94 2 61 0 99] 
#[1 1 101 0 62 3 5 0 106 1 109 0 114 1 113 0 115 1 117 0 116 1 121 0 117] 
#[1 0 101 0 8 0 105 0 15 3 9 0 17 0 109 0 27 0 113 0 34 0 117 0 40 0 121 0 45 0 125 0 46 0 129 0 47 0 133 0 48 0 137 0 49 0 141 0 50 0 145 0 51 0 29 0 52 0 33 0 54 0 37 0 56 0 149 0 62 0 153 0 77 0 157 0 80 0 161 0 81 0 165 0 82 0 169 0 83 0 173 0 84 0 181 0 102 0 185 0 103 0 189 0 104 2 97 0 105 0 197 0 107 0 201 0 108 0 205 0 109 0 209 0 110 0 213 0 111 0 217 0 112 0 221 0 113 0 225 0 118 0 229 0 119 0 233 0 120 0 237 0 121 0 241 0 122 0 245 0 123 3 13 0 125] 
#[0 1 138 0 8 0 15 0 17 0 27 0 34 0 40 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 54 0 56 0 62] 
#[1 0 101 0 8 0 105 0 15 3 17 0 17 0 109 0 27 0 113 0 34 0 117 0 40 0 121 0 45 0 125 0 46 0 129 0 47 0 133 0 48 0 137 0 49 0 141 0 50 0 145 0 51 0 29 0 52 0 33 0 54 0 37 0 56 0 149 0 62 0 153 0 77 0 157 0 80 0 161 0 81 0 165 0 82 0 169 0 83 0 173 0 84 0 181 0 102 0 185 0 103 0 189 0 104 2 97 0 105 0 197 0 107 0 201 0 108 0 205 0 109 0 209 0 110 0 213 0 111 0 217 0 112 0 221 0 113 0 225 0 118 0 229 0 119 0 233 0 120 0 237 0 121 0 241 0 122 0 245 0 123 3 13 0 125] 
#[0 1 142 0 17 0 21] 
#[1 3 21 0 17 3 25 0 21] 
#[0 1 146 0 17 0 21] 
#[1 0 109 0 27 0 113 0 34 0 129 0 47 0 137 0 49 0 141 0 50 0 145 0 51 0 33 0 54 0 149 0 62 3 29 0 77 3 33 0 80 3 37 0 81 3 41 0 82 3 45 0 104 0 225 0 118 0 229 0 119 0 233 0 120 0 237 0 121 0 241 0 122 0 245 0 123 3 49 0 126] 
#[1 0 101 0 8 0 105 0 15 0 109 0 27 0 113 0 34 0 117 0 40 0 121 0 45 0 129 0 47 0 133 0 48 0 137 0 49 0 141 0 50 0 145 0 51 0 149 0 62 1 185 0 77 0 157 0 80 0 161 0 81 0 165 0 82 0 169 0 83 1 189 0 84 1 197 0 109 0 213 0 111 0 217 0 112 0 225 0 118 0 229 0 119 0 233 0 120 0 237 0 121 0 241 0 122 0 245 0 123 3 53 0 136] 
#[1 3 57 0 62 3 61 0 115 3 65 0 137] 
#[0 1 150 0 8 0 15 0 17 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 40 0 41 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 54 0 56 0 62] 
#[0 1 154 0 20] 
#[0 1 158 0 8 0 15 0 17 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 40 0 41 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 54 0 56 0 62] 
#[0 1 162 0 8 0 15 0 17 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 40 0 41 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 54 0 56 0 62] 
#[0 1 166 0 8 0 15 0 17 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 40 0 41 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 54 0 56 0 62] 
#[0 1 170 0 8 0 15 0 17 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 40 0 41 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 54 0 56 0 62] 
#[0 1 174 0 8 0 15 0 17 0 27 0 28 0 29 0 30 0 31 0 33 0 34 0 35 0 40 0 41 0 45 0 47 0 48 0 49 0 50 0 51 0 52 0 54 0 56 0 62] 
#[1 3 69 0 6 3 73 0 139] 
#[0 3 77 0 62] 
#[1 0 109 0 27 0 149 0 62 3 81 0 77] 
#[0 1 178 0 20] 
#[0 1 182 0 16 0 17 0 22 0 28 0 29 0 33 0 52 0 54 0 56] 
#[0 3 85 0 12] 
#[1 1 229 0 4 1 233 0 5 1 237 0 6 1 241 0 7 1 245 0 10 1 249 0 14 0 109 0 27 1 253 0 58 2 1 0 59 2 5 0 60 2 9 0 61 0 149 0 62 2 13 0 77 3 89 0 86 2 29 0 87 2 33 0 88 2 37 0 89 2 41 0 90 2 45 0 91 2 49 0 92 2 53 0 93 2 57 0 94 2 61 0 99] 
#[1 1 229 0 4 1 233 0 5 1 237 0 6 1 241 0 7 1 245 0 10 1 249 0 14 0 109 0 27 1 253 0 58 2 1 0 59 2 5 0 60 2 9 0 61 0 149 0 62 2 13 0 77 3 93 0 87 2 33 0 88 2 37 0 89 2 41 0 90 2 45 0 91 2 49 0 92 2 53 0 93 2 57 0 94 2 61 0 99] 
#[1 1 229 0 4 1 233 0 5 1 237 0 6 1 241 0 7 1 245 0 10 1 249 0 14 0 109 0 27 1 253 0 58 2 1 0 59 2 5 0 60 2 9 0 61 0 149 0 62 2 13 0 77 3 97 0 88 2 37 0 89 2 41 0 90 2 45 0 91 2 49 0 92 2 53 0 93 2 57 0 94 2 61 0 99] 
#[1 1 229 0 4 1 233 0 5 1 237 0 6 1 241 0 7 1 245 0 10 1 249 0 14 0 109 0 27 1 253 0 58 2 1 0 59 2 5 0 60 2 9 0 61 0 149 0 62 2 13 0 77 3 101 0 89 2 41 0 90 2 45 0 91 2 49 0 92 2 53 0 93 2 57 0 94 2 61 0 99] 
#[1 1 229 0 4 1 233 0 5 1 237 0 6 1 241 0 7 1 245 0 10 1 249 0 14 0 109 0 27 1 253 0 58 2 1 0 59 2 5 0 60 2 9 0 61 0 149 0 62 2 13 0 77 3 105 0 89 2 41 0 90 2 45 0 91 2 49 0 92 2 53 0 93 2 57 0 94 2 61 0 99] 
#[1 1 229 0 4 1 233 0 5 1 237 0 6 1 241 0 7 1 245 0 10 1 249 0 14 0 109 0 27 1 253 0 58 2 1 0 59 2 5 0 60 2 9 0 61 0 149 0 62 2 13 0 77 3 109 0 90 2 45 0 91 2 49 0 92 2 53 0 93 2 57 0 94 2 61 0 99] 
#[1 1 229 0 4 1 233 0 5 1 237 0 6 1 241 0 7 1 245 0 10 1 249 0 14 0 109 0 27 1 253 0 58 2 1 0 59 2 5 0 60 2 9 0 61 0 149 0 62 2 13 0 77 3 113 0 90 2 45 0 91 2 49 0 92 2 53 0 93 2 57 0 94 2 61 0 99] 
#[1 1 229 0 4 1 233 0 5 1 237 0 6 1 241 0 7 1 245 0 10 1 249 0 14 0 109 0 27 1 253 0 58 2 1 0 59 2 5 0 60 2 9 0 61 0 149 0 62 2 13 0 77 3 117 0 91 2 49 0 92 2 53 0 93 2 57 0 94 2 61 0 99] 
#[1 1 229 0 4 1 233 0 5 1 237 0 6 1 241 0 7 1 245 0 10 1 249 0 14 0 109 0 27 1 253 0 58 2 1 0 59 2 5 0 60 2 9 0 61 0 149 0 62 2 13 0 77 3 121 0 91 2 49 0 92 2 53 0 93 2 57 0 94 2 61 0 99] 
#[1 1 229 0 4 1 233 0 5 1 237 0 6 1 241 0 7 1 245 0 10 1 249 0 14 0 109 0 27 1 253 0 58 2 1 0 59 2 5 0 60 2 9 0 61 0 149 0 62 2 13 0 77 3 125 0 91 2 49 0 92 2 53 0 93 2 57 0 94 2 61 0 99] 
#[0 1 186 0 1 0 2 0 3 0 5 0 7 0 11 0 12 0 13 0 19 0 20 0 23 0 24 0 26 0 32 0 42] 
#[0 1 190 0 21 0 42 0 62] 
#[1 1 229 0 4 1 233 0 5 1 237 0 6 1 241 0 7 1 245 0 10 1 249 0 14 0 109 0 27 1 253 0 58 2 1 0 59 2 5 0 60 2 9 0 61 0 149 0 62 2 13 0 77 2 17 0 79 2 21 0 85 2 25 0 86 2 29 0 87 2 33 0 88 2 37 0 89 2 41 0 90 2 45 0 91 2 49 0 92 2 53 0 93 2 57 0 94 2 61 0 99 3 129 0 100] 
#[0 1 194 0 21 0 42 0 62] 
#[0 3 133 0 32] 
#[0 1 198 0 20 0 21 0 36] 
#[0 1 202 0 20 0 21] 
#[0 1 206 0 20] 
#[1 3 137 0 20 2 89 0 21] 
#[0 1 210 0 20] 
#[0 1 214 0 8 0 15 0 17 0 27 0 34 0 40 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 54 0 56 0 62] 
#[0 1 218 0 20 0 62] 
#[0 1 222 0 12 0 20 0 62] 
#[1 2 113 0 62 3 141 0 133] 
#[1 1 226 0 12 1 97 0 27] 
#[0 1 230 0 12] 
#[0 1 234 0 12] 
#[0 1 238 0 12] 
#[0 1 242 0 12] 
#[0 3 145 0 12] 
#[1 3 57 0 62 3 61 0 115 3 149 0 137] 
#[0 0 234 0 12 0 20 0 21] 
#[0 1 246 0 20 0 21] 
#[1 1 250 0 20 3 153 0 21] 
#[1 3 157 0 12 3 161 0 38 3 165 0 39 3 169 0 43 3 173 0 144 3 177 0 145 3 181 0 146] 
#[1 3 185 0 9 1 254 0 20 3 189 0 37 3 193 0 140 3 197 0 142 3 201 0 143] 
#[1 3 69 0 6 3 205 0 139] 
#[1 2 2 0 12 2 2 0 18 2 2 0 21 1 97 0 27] 
#[0 2 6 0 1 0 2 0 3 0 5 0 7 0 11 0 12 0 13 0 19 0 20 0 23 0 24 0 26 0 32 0 42] 
#[1 2 10 0 12 2 10 0 19 2 10 0 20 2 193 0 23 2 10 0 24 2 10 0 32 2 10 0 42] 
#[1 2 14 0 12 2 14 0 19 2 14 0 20 2 14 0 23 2 14 0 24 2 197 0 26 2 14 0 32 2 14 0 42] 
#[1 2 201 0 11 2 18 0 12 2 205 0 13 2 18 0 19 2 18 0 20 2 18 0 23 2 18 0 24 2 18 0 26 2 18 0 32 2 18 0 42] 
#[1 2 209 0 5 2 213 0 7 2 22 0 11 2 22 0 12 2 22 0 13 2 22 0 19 2 22 0 20 2 22 0 23 2 22 0 24 2 22 0 26 2 22 0 32 2 22 0 42] 
#[1 2 209 0 5 2 213 0 7 2 26 0 11 2 26 0 12 2 26 0 13 2 26 0 19 2 26 0 20 2 26 0 23 2 26 0 24 2 26 0 26 2 26 0 32 2 26 0 42] 
#[1 2 217 0 1 2 221 0 2 2 225 0 3 2 30 0 5 2 30 0 7 2 30 0 11 2 30 0 12 2 30 0 13 2 30 0 19 2 30 0 20 2 30 0 23 2 30 0 24 2 30 0 26 2 30 0 32 2 30 0 42] 
#[1 2 217 0 1 2 221 0 2 2 225 0 3 2 34 0 5 2 34 0 7 2 34 0 11 2 34 0 12 2 34 0 13 2 34 0 19 2 34 0 20 2 34 0 23 2 34 0 24 2 34 0 26 2 34 0 32 2 34 0 42] 
#[0 2 38 0 1 0 2 0 3 0 5 0 7 0 11 0 12 0 13 0 19 0 20 0 23 0 24 0 26 0 32 0 42] 
#[0 2 42 0 1 0 2 0 3 0 5 0 7 0 11 0 12 0 13 0 19 0 20 0 23 0 24 0 26 0 32 0 42] 
#[0 2 46 0 1 0 2 0 3 0 5 0 7 0 11 0 12 0 13 0 19 0 20 0 23 0 24 0 26 0 32 0 42] 
#[0 3 209 0 42] 
#[0 2 50 0 20 0 21 0 36] 
#[0 2 54 0 8 0 15 0 17 0 27 0 34 0 40 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 54 0 56 0 62] 
#[0 2 58 0 17 0 21] 
#[0 3 213 0 18] 
#[1 2 62 0 20 3 153 0 21] 
#[1 3 57 0 62 3 217 0 115] 
#[0 2 66 0 9 0 20 0 37] 
#[0 2 70 0 8 0 15 0 27 0 34 0 40 0 45 0 47 0 48 0 49 0 50 0 51 0 62] 
#[0 2 74 0 8 0 15 0 27 0 34 0 40 0 45 0 47 0 48 0 49 0 50 0 51 0 62] 
#[0 2 78 0 8 0 15 0 27 0 34 0 40 0 45 0 47 0 48 0 49 0 50 0 51 0 62] 
#[1 3 221 0 12 3 225 0 21] 
#[0 2 82 0 12 0 21] 
#[1 0 101 0 8 0 105 0 15 0 109 0 27 0 113 0 34 0 117 0 40 0 121 0 45 0 129 0 47 0 133 0 48 0 137 0 49 0 141 0 50 0 145 0 51 0 149 0 62 1 185 0 77 0 157 0 80 0 161 0 81 0 165 0 82 0 169 0 83 1 189 0 84 1 197 0 109 0 213 0 111 0 217 0 112 0 225 0 118 0 229 0 119 0 233 0 120 0 237 0 121 0 241 0 122 0 245 0 123 3 229 0 136] 
#[0 3 233 0 6] 
#[0 3 237 0 6] 
#[0 2 86 0 20] 
#[1 3 185 0 9 2 90 0 20 3 241 0 143] 
#[0 2 94 0 20] 
#[1 3 185 0 9 1 254 0 20 3 189 0 37 3 245 0 140 3 197 0 142 3 201 0 143] 
#[0 2 98 0 21 0 42 0 62] 
#[1 3 249 0 53 3 253 0 55 4 1 0 127 4 5 0 128 4 9 0 129 4 13 0 131] 
#[0 2 102 0 20 0 21] 
#[0 2 106 0 9 0 20 0 37] 
#[1 3 161 0 38 3 165 0 39 3 169 0 43 4 17 0 145 3 181 0 146] 
#[1 3 57 0 62 4 21 0 115] 
#[1 4 25 0 61 4 29 0 147] 
#[1 0 109 0 27 0 149 0 62 1 213 0 77 4 33 0 151] 
#[0 2 110 0 20] 
#[0 2 114 0 20] 
#[0 4 37 0 19] 
#[1 1 229 0 4 1 233 0 5 1 237 0 6 1 241 0 7 1 245 0 10 1 249 0 14 0 109 0 27 1 253 0 58 2 1 0 59 2 5 0 60 2 9 0 61 0 149 0 62 2 13 0 77 4 41 0 79 2 21 0 85 2 25 0 86 2 29 0 87 2 33 0 88 2 37 0 89 2 41 0 90 2 45 0 91 2 49 0 92 2 53 0 93 2 57 0 94 2 61 0 99] 
#[1 4 45 0 17 3 249 0 53 3 253 0 55 4 49 0 128 4 9 0 129 4 13 0 131] 
#[0 2 118 0 17 0 53 0 55] 
#[1 0 101 0 8 0 105 0 15 0 109 0 27 0 113 0 34 0 117 0 40 0 121 0 45 0 125 0 46 0 129 0 47 0 133 0 48 0 137 0 49 0 141 0 50 0 145 0 51 0 29 0 52 3 249 0 53 0 33 0 54 3 253 0 55 0 37 0 56 0 149 0 62 0 153 0 77 0 157 0 80 0 161 0 81 0 165 0 82 0 169 0 83 0 173 0 84 0 181 0 102 0 185 0 103 0 189 0 104 4 53 0 105 0 197 0 107 0 201 0 108 0 205 0 109 0 209 0 110 0 213 0 111 0 217 0 112 0 221 0 113 0 225 0 118 0 229 0 119 0 233 0 120 0 237 0 121 0 241 0 122 0 245 0 123 4 57 0 130 4 61 0 131] 
#[0 2 122 0 8 0 15 0 27 0 34 0 40 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 62] 
#[0 2 126 0 12 0 21] 
#[0 2 130 0 12 0 21] 
#[0 2 134 0 12 0 21] 
#[1 4 65 0 12 4 69 0 21] 
#[1 4 73 0 12 2 173 0 21] 
#[0 2 138 0 8 0 15 0 27 0 34 0 40 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 62] 
#[0 4 77 0 19] 
#[0 2 142 0 20 0 62] 
#[0 2 146 0 17 0 53 0 55] 
#[1 1 101 0 62 4 81 0 114 1 113 0 115 1 117 0 116 1 121 0 117] 
#[0 4 85 0 20] 
#[0 2 150 0 8 0 15 0 27 0 34 0 40 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 62] 
#[0 2 154 0 20] 
#[0 4 89 0 61] 
#[0 2 158 0 9 0 20] 
#[0 2 162 0 8 0 15 0 27 0 34 0 40 0 45 0 46 0 47 0 48 0 49 0 50 0 51 0 52 0 53 0 54 0 55 0 56 0 62] 
#[0 2 166 0 20] 
#[0 2 170 0 17 0 53 0 55] 
#[0 2 174 0 12 0 21]
	).
]
