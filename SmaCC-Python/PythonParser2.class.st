Class {
	#name : #PythonParser2,
	#superclass : #SmaCCParser,
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PythonParser2 class >> definitionComment [
"# Python Grammar and Lexer extracted from Python2 documentation on 16/04/2014 (Python 2.7.6)
# As seen from this grammar, the python doc and the implemented python scanner/parser diverge in several places
# https://docs.python.org/2/reference/index.html

#Identifiers
<name> :  ( [a-zA-Z]  | _ ) ([a-zA-Z]  | [0-9] | _)*;

# String literals
<stringprefix> :  r | u | ur | R | U | UR | Ur | uR | b | B | br | Br | bR | BR;
<escapeseq>       :  \\.;
<shortstring>  : 
		\' ( [^\\\n\r\'] | <escapeseq> )* \'
		| \"" ( [^\\\n\r\""] | <escapeseq>)* \"";
<longstring> :
		\'\'\' ( [^\\\'] | <escapeseq> | \'[^\'] | \'\'[^\'] )* \'\'\'
		| \""\""\"" ( [^\\\""] | <escapeseq> | \""[^\""] | \""\""[^\""] )* \""\""\"" ;
<string> : <stringprefix>?(<shortstring> | <longstring>);

# Integer literals
<decimalinteger> :  [1-9] [0-9]* | 0 ; 
<octinteger> :  0 (o | O) [0-7]+ | 0 [0-7]+;
<hexinteger> :  0 (x | X) [0-9a-fA-F]+;
<bininteger> :  0 (b | B) [01]+;
<integer> :  <decimalinteger> | <octinteger> | <hexinteger> | <bininteger>;
<longinteger> : <integer> (l | L) ;

#Float literals
<pointfloat> :  ([0-9]+ \. [0-9]*) | (\. [0-9]+) ; #Is that true that one can write 0000. ? Yes. Oh, and .50 is accepted in Python, not in the doc of Python.
<exponentfloat> :  ([0-9]+ | <pointfloat>) (e | E) (\+|\-)? [0-9]+ ;
<floatnumber> :  <pointfloat> | <exponentfloat> ;

#Imaginary literals
<imagnumber> : (<floatnumber> | [0-9]+) j ; #Is that true that one can write 0000j ? Yes.

#All number literals
<number> : <longinteger> | <integer> | <floatnumber> | <imagnumber> ;

#Modes
<cr>	: \r | \n | \r\n ;
lineBegin <emptyLine> : <cr> ;
lineBegin <blankLine> : [ \t\f]* ((\# [^\r\n]*  <cr>?) | <cr>) ;
lineBegin <indent> : [ \t\f]+ ;
lineBegin <noindent>  : [^ \t\f\#] ;
<comment> : \#[^\r\n]* ;
<whitespace> : [ \t]+ | \\<cr>;

<NEWLINE> : <cr> ;


<lparen> : \( ;
<rparen> : \) ;
<lbrack>	 : \[ ;
<rbrack> : \] ;
<lcurly> : \{ ;
<rcurly>	: \} ;

%id <INDENT> <DEDENT> <NEWLINE> <lbrack> <lcurly> <lparen> <rbrack> <rcurly> <rparen> ;

# Grammar for Python

# Note:  Changing the grammar specified in this file will most likely
#        require corresponding changes in the parser module
#        (../Modules/parsermodule.c).  If you can""t make the changes to
#        that module yourself, please co-ordinate the required changes
#        with someone who can; ask around on python-dev for help.  Fred
#        Drake <fdrake@acm.org> will probably be listening there.

# NOTE WELL: You should also follow all the steps listed in PEP 306,
# ""How to Change Python""s Grammar""

# Start symbols for the grammar:
#       single_input is a single interactive statement;
#       file_input is a module or sequence of commands read from an input file;
#       eval_input is the input for the eval() and input() functions.
# NB: compound_stmt in single_input is followed by extra <NEWLINE>!

%start file_input single_input eval_input ;

# Note: Grammar rewritten to eliminate () [] * ? + ThierryGoubier 5/5/2014 22:34

%annotate_tokens;
%root Root;
%prefix Py;
%suffix Node;

file_input: {{}}
	| file_input <NEWLINE> {{}}
	| file_input stmt 'statement' {{}}
	;

single_input: 
	<NEWLINE> {{}}
	| simple_stmt 'statement' {{}}
	| compound_stmt 'statement' <NEWLINE> {{}}
	;

eval_input:
	testlist newline_opts {{}}
	;

newline_opts:
	| newline_opts <NEWLINE>
	;

decorator:
	""@"" dotted_name 'dotted_name' paren_arglist_opt 'args' <NEWLINE> {{}}
	;
paren_arglist_opt:
	| <lparen> arglist_opt <rparen> { '2' }
	;
arglist_opt:
	| arglist
	;

decorators:
	decorators decorator 'decorator' {{}}
	| decorator 'decorator' {{}}
	;
decorated:
	decorators 'decorators' classdef 'classdef' {{}}
	| decorators 'decorators' funcdef 'funcdef' {{}}
	;
funcdef:
	""def"" <name> 'fname' parameters 'parameters' "":"" suite {{}}
	;
parameters:
	<lparen> varargslist_opt <rparen> { '2' }
	;
varargslist_opt:
	| varargslist {{VarArgList}}
	;
varargslist:
	fpdef 'arg' init_opt 'init' "","" varargslist
	| ""*"" <name> 'sname'
	| ""*"" <name> 'sname' "","" ""**"" <name> 'ssname'
	| ""**"" <name>  'sname'
	| fpdef 'arg' init_opt 'init' comma_opt
	;

init_opt:
	| ""="" test 'test' {{}}
	;

fpdef:
	<name> {{}}
	| <lparen> fplist <rparen> {{}}
	;

fplist:
	fpdef 'fpdef' "","" fplist
	| fpdef 'fpdef' comma_opt
	;

stmt:
	simple_stmt 'stmt'
	| compound_stmt 'stmt'
	;

simple_stmt:
	small_stmt 'stmt' "";"" simple_stmt {{}}
	| small_stmt 'stmt' semicolon_opt <NEWLINE> {{}}
	;
semicolon_opt:
	| "";""
	;
expr_stmt: 
	testlist assign_after {{}}
	| testlist augassign 'assign' yield_or_testlist 'to' {{}}
	;
assign_after:
	| assign_after ""="" 'assign' yield_or_testlist 'to'
	;
yield_or_testlist:
	yield_expr
	| testlist
	;
augassign:
	""+=""
	| ""-=""
	| ""*=""
	| ""/=""
	| ""%=""
	| ""&=""
	| ""|=""
	| ""^=""
	| ""<<=""
	| "">>=""
	| ""**=""
	| ""//=""
	;
# For normal assignments, additional restrictions enforced by the interpreter
print_stmt:
	""print"" testlist_opt {{Print}}
	| ""print"" "">>"" testlist {{Print}}
	;
del_stmt:
	""del"" exprlist {{Del}}
	;
pass_stmt:
	""pass"" {{Pass}}
	;
flow_stmt:
	break_stmt
	| continue_stmt
	| return_stmt
	| raise_stmt
	| yield_stmt
	;
break_stmt:
	""break"" {{Break}}
	;
continue_stmt:
	""continue"" {{Continue}}
	;
return_stmt:
	""return"" testlist_opt {{Return}}
	;
yield_stmt:
	yield_expr {{Yield}}
	;
raise_stmt:
	""raise"" {{Raise}}
	| ""raise"" test 'arg1' {{Raise}}
	| ""raise"" test 'arg1' "","" test 'arg2'  {{Raise}}
	| ""raise"" test 'arg1' "","" test 'arg2' "","" test 'arg3' {{Raise}}
	;
import_stmt:
	import_name
	| import_from
	;
import_name:
	""import"" dotted_as_names {{Import}}
	;
import_from:
	""from"" dotopt_dotted_name 'from' ""import"" import_names_star {{Import}}
	;
dotopt_dotted_name:
	dotted_name 'name' {{}}
	| dots 'dots' {{}}
	| dots 'dots' dotted_name 'name' {{}}
	;
dots:
	dots ""."" {{}}
	| ""."" {{}}
	;
import_names_star:
	""*""
	| <lparen> import_as_names <rparen>
	| import_as_names
	;
import_as_name:
	<name> 'name'
	| <name> 'name' ""as"" <name> 'rename'
	;
dotted_as_name:
	dotted_name 'name'
	| dotted_name 'name' ""as"" <name> 'rename'
	;
import_as_names:
	import_as_names_in comma_opt
	;
import_as_names_in:
	import_as_names_in "","" import_as_name
	| import_as_name
	;
dotted_as_names:
	dotted_as_names "","" dotted_as_name
	| dotted_as_name
	;
dotted_name:
	dotted_name ""."" <name> 'name' {{DottedName}}
	| <name> 'name' {{DottedName}}
	;
global_stmt:
	""global"" namelist {{Global}}
	;
namelist:
	namelist "","" <name>
	| <name>
	;
exec_stmt:
	""exec"" expr 'expr' {{Exec}}
	| ""exec"" expr 'expr' ""in"" test_test_opt 'tests_opt' {{Exec}}
	;

test_test_opt:
	test 'test1' {{}}
	| test 'test1' "","" test 'test2' {{}}
	;
assert_stmt:
	""assert"" test_test_opt 'condition' {{Assert}}
	;
small_stmt:
	expr_stmt
	| print_stmt
	| del_stmt
	| pass_stmt
	| flow_stmt
	| import_stmt
	| global_stmt
	| exec_stmt
	| assert_stmt
	;
compound_stmt:
	if_stmt
	| while_stmt
	| for_stmt
	| try_stmt
	| with_stmt
	| funcdef 
	| classdef
	| decorated 
	;
if_stmt:
	""if"" test 'if' "":"" suite elifs_opt 'elsif' else_opt 'else' {{If}}
	;
elifs_opt:
	| elifs_opt 'elifs_opt' ""elif"" test 'elif' "":"" suite {{Elif}}
	;
else_opt:
	| ""else"" "":"" suite {{Else}}
	;

while_stmt:
	""while"" test 'test' "":"" suite else_opt 'else' {{While}}
	;
for_stmt:
	""for"" exprlist ""in"" testlist "":"" suite else_opt 'else' {{For}}
	;
try_stmt:
	""try"" "":"" suite except_list else_opt 'else' finally_opt 'finally' {{Try}}
	| ""try"" "":"" suite ""finally"" "":"" suite {{Try}}
	;
finally_opt:
	| ""finally"" "":"" suite {{Finally}}
	;
except_list:
	except_list except_clause 'clause' "":"" suite
	| except_clause 'clause' "":"" suite
	;
with_stmt:
	""with"" with_items "":"" suite {{With}}
	;
with_items:
	with_items "","" with_item 'withItem'
	| with_item 'withItem'
	;
with_item:
	test 'test' {{WithItem}}
	| test 'test' ""as"" expr 'expr'  {{WithItem}}
	;
# NB compile.c makes sure that the default except clause is last
except_clause: 
	""except"" {{ExceptClause}}
	| ""except"" test 'except' {{ExceptClause}}
	| ""except"" test 'except' ""as"" test 'another' {{ExceptClause}}
	| ""except"" test 'except' "","" test 'except2' {{ExceptClause}}
	;

suite:
	simple_stmt 'statement'
	| <NEWLINE> <INDENT> stmts  <DEDENT>
	;

stmts:
	stmts stmt 'statement'
	| stmt 'statement'
	;

# Backward compatibility cruft to support:
# [ x for x in lambda: True, lambda: False if x() ]
# even while also allowing:
# lambda x: 5 if x else 2
# (But not a mix of the two)
testlist_safe:
	old_test 'test'
	| old_test 'test' "","" old_tests comma_opt
	;
old_tests:
	old_tests "","" old_test 'test'
	| old_test 'test'
	;
old_test:
	or_test
	| old_lambdef
	;
old_lambdef:
	""lambda"" varargslist_opt 'args' "":"" old_test 'body' {{Lambda}}
	;
or_test:
	and_test
	| and_test 'one' ""or"" or_test 'two' {{Or}}
	;
and_test:
	not_test
	| not_test 'one' ""and"" and_test 'two' {{And}}
	;
not_test:
	""not"" not_test 'negated' {{Not}}
	| comparison
	;
comparison:
	expr
	| expr 'one' comp_op 'op' comparison 'two' {{Comparison}}
	;
comp_op:
	""<"" {{}}
	| "">"" {{}}
	| ""=="" {{}}
	| "">="" {{}}
	| ""<="" {{}}
	| ""<>"" {{}}
	| ""!="" {{}}
	| ""in"" {{}}
	| ""not"" ""in"" {{}}
	| ""is"" {{}}
	| ""is"" ""not"" {{}}
	;
expr:
	xor_expr 
	| xor_expr 'one' ""|"" expr 'two' {{VBarExpr}}
	;
xor_expr:
	and_expr
	| and_expr 'one' ""^"" xor_expr  'two' {{XorExpr}}
	;
and_expr:
	shift_expr
	| shift_expr 'one' ""&"" and_expr 'two'  {{AndExpr}}
	;
shift_expr:
	arith_expr
	| arith_expr 'one' ""<<"" shift_expr 'two' {{LShiftExpr}}
	| arith_expr 'one' "">>"" shift_expr 'two' {{RShiftExpr}}
	;
arith_expr:
	term
	| term 'one' ""+"" arith_expr 'two'  {{PlusExpr}}
	| term 'one' ""-"" arith_expr 'two'  {{MinusExpr}}
	;
term:
	factor
	| factor 'factor' ""*"" term 'term'  {{}}
	| factor 'factor' ""/"" term 'term'  {{}}
	| factor 'factor' ""%"" term 'term' {{}}
	| factor 'factor' ""//"" term 'term' {{}}
	;
factor:
	power
	| ""+"" factor 'factor' {{}}
	| ""-"" factor 'factor' {{}}
	| ""~"" factor 'factor' {{}}
	;

power:
	atom 'atom' trailers_opt {{}}
	| atom 'atom' trailers_opt ""**"" factor 'factor' {{}}
	;
trailers_opt:
	| trailers_opt trailer 'trailer'
	;
atom: 
	<lparen> <rparen> {{}}
	| <lparen> yield_expr 'list' <rparen> {{}}
	| <lparen> testlist_comp 'list' <rparen> {{}}
	| <lbrack> <rbrack> {{}}
	| <lbrack> listmaker 'list' <rbrack> {{}}
	| <lcurly> dictorsetmaker 'list' <rcurly> {{}}
	| <lcurly>  <rcurly> {{}}
	| ""`"" testlist1 'list' ""`"" {{BackTick}}
	| <name>  {{Symbol}}
	| <number> {{Number}}
	| strings
	;
strings:
	<string> 'string' strings {{Strings}}
	| <string> 'string'  {{Strings}}
	;
listmaker:
	test 'test' list_for 'list_for' {{}}
	| testlist
	;
testlist_comp:
	test 'test' comp_for 'comp_for' {{}}
	| testlist
	;
lambdef:
	""lambda"" varargslist_opt 'arguments' "":"" test 'body' {{Lambda}}
	;
trailer: 
	<lparen> <rparen> {{}}
	| <lparen> arglist <rparen> {{}}
	| <lbrack> subscriptlist <rbrack> {{}}
	| ""."" <name>  {{}}
	;
subscriptlist:
	subscript 'subscript' "","" subscriptlist
	| subscript 'subscript' comma_opt
	;
subscript:
	""."" ""."" ""."" {{}}
	| test 'test' {{}}
	| test_opt 'test' "":"" test_opt 'test2' sliceop 'slice' {{}}
	;
test_opt:
	| test
	;
sliceop:
	| "":"" test_opt 'test' {{}}
	;

exprlist:
	expr 'expr' "","" exprlist
	| expr 'expr' comma_opt
	;
comma_opt:
	| "",""
	;

test:
	or_test
	| or_test 'or' ""if"" or_test 'if' ""else"" test 'else' {{IfTest}}
	| lambdef
	;
testlist:
	test 'test' "","" testlist
	| test 'test' comma_opt
	;

testlist_opt:
	| testlist
	;
dictorsetmaker: 
	test 'test' "":"" test 'test2' comp_for 'comp' {{}}
	| test 'test' "":"" test 'test2' more_tests 'more' {{}}
	| test 'test' comp_for 'comp' {{}}
	| testlist
	;
more_tests:
	comma_opt
	| "","" test 'test' "":"" test 'test2' more_tests 'more_tests' {{}}
	;
classdef:
	""class"" <name> 'cname' "":"" suite {{Classdef}}
	| ""class"" <name> 'cname' <lparen> testlist_opt<rparen> "":"" suite {{Classdef}}
	;

arglist: 
	argument 'argument' "","" arglist
	| argument 'argument' comma_opt
	| ""*"" test 'argument' more_args
	| ""**"" test 'argument'
	;
more_args:
	| "","" ""**"" test 'argument'
	| "","" argument 'argument' more_args
	;
# The reason that keywords are test nodes instead of <name> is that using <name>
# results in an ambiguity. ast.c makes sure it""s a <name>.
argument:
	test 'test' {{}}
	| test 'test' comp_for 'comp' {{}}
	| test 'test' ""="" test 'test2' {{}}
	;

list_iter:
	list_for
	| list_if
	;
list_for:
	""for"" exprlist ""in"" testlist_safe {{ListFor}}
	| ""for"" exprlist ""in"" testlist_safe list_iter 'list' {{ListFor}}
	;
list_if:
	""if"" old_test 'condition' {{ListIf}}
	| ""if"" old_test 'condition' list_iter 'iter' {{ListIf}}
	;

comp_iter:
	comp_for
	| comp_if
	;

comp_for:
	""for"" exprlist ""in"" or_test 'in' {{CompFor}}
	| ""for"" exprlist ""in"" or_test 'in' comp_iter 'comp' {{CompFor}}
	;
comp_if:
	""if"" old_test 'condition' {{CompIf}}
	| ""if"" old_test 'condition' comp_iter 'iter' {{CompIf}}
	;

testlist1:
	test 'test' "","" testlist1 'tests' {{}}
	| test 'test'
	;

# not used in grammar, but may appear in ""node"" passed from Parser to Compiler
#encoding_decl: <name> ;

yield_expr:
	""yield"" testlist_opt {{Yield}}
	;"
]

{ #category : #accessing }
PythonParser2 class >> eval: aString [
	^self parse: aString startingAt: self startingStateForeval_input
]

{ #category : #'generated-accessing' }
PythonParser2 class >> scannerClass [
	^PythonScanner2
]

{ #category : #generated }
PythonParser2 class >> startingStateForeval_input [
	^ 3
]

{ #category : #generated }
PythonParser2 class >> startingStateForfile_input [
	^ 1
]

{ #category : #generated }
PythonParser2 class >> startingStateForsingle_input [
	^ 2
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForand_expr2: nodes [
	| result |
	result := PyAndExprNode new.
	result one: (nodes at: 1).
	result andToken: (nodes at: 2).
	result two: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForand_test2: nodes [
	| result |
	result := PyAndNode new.
	result one: (nodes at: 1).
	result andToken: (nodes at: 2).
	result two: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForarglist2: nodes [
	| result |
	result := Array new: 4.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self add: (nodes at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForarglist3: nodes [
	| result |
	result := Array new: 4.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (nodes at: 1).
	self add: (nodes at: 2) to: (result at: 1).
	self addAll: ((nodes at: 3) at: 1) to: (result at: 2).
	result at: 4 put: ((nodes at: 3) at: 2).
	self addAll: ((nodes at: 3) at: 3) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForarglist4: nodes [
	| result |
	result := Array new: 4.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 4 put: (nodes at: 1).
	self add: (nodes at: 2) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForargument1: nodes [
	| result |
	result := PyArgumentNode new.
	result test: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForargument2: nodes [
	| result |
	result := PyArgumentNode new.
	result test: (nodes at: 1).
	result comp: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForargument3: nodes [
	| result |
	result := PyArgumentNode new.
	result test: (nodes at: 1).
	result equalToken: (nodes at: 2).
	result test2: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForarith_expr2: nodes [
	| result |
	result := PyPlusExprNode new.
	result one: (nodes at: 1).
	result plusToken: (nodes at: 2).
	result two: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForarith_expr3: nodes [
	| result |
	result := PyMinusExprNode new.
	result one: (nodes at: 1).
	result minusToken: (nodes at: 2).
	result two: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForassert_stmt1: nodes [
	| result |
	result := PyAssertNode new.
	result assertToken: (nodes at: 1).
	result condition: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForatom10: nodes [
	| result |
	result := PyNumberNode new.
	result numberToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForatom1: nodes [
	| result |
	result := PyAtomNode new.
	result lparenToken: (nodes at: 1).
	result rparenToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForatom2: nodes [
	| result |
	result := PyAtomNode new.
	result lparenToken: (nodes at: 1).
	result list: (nodes at: 2).
	result rparenToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForatom4: nodes [
	| result |
	result := PyAtomNode new.
	result lbrackToken: (nodes at: 1).
	result rbrackToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForatom5: nodes [
	| result |
	result := PyAtomNode new.
	result lbrackToken: (nodes at: 1).
	result list: (nodes at: 2).
	result rbrackToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForatom6: nodes [
	| result |
	result := PyAtomNode new.
	result lcurlyToken: (nodes at: 1).
	result list: (nodes at: 2).
	result rcurlyToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForatom7: nodes [
	| result |
	result := PyAtomNode new.
	result lcurlyToken: (nodes at: 1).
	result rcurlyToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForatom8: nodes [
	| result |
	result := PyBackTickNode new.
	result addToken: (nodes at: 1) to: result _Tokens.
	result list: (nodes at: 2).
	result addToken: (nodes at: 3) to: result _Tokens.
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForatom9: nodes [
	| result |
	result := PySymbolNode new.
	result nameToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForbreak_stmt1: nodes [
	| result |
	result := PyBreakNode new.
	result breakToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForclassdef1: nodes [
	| result |
	result := PyClassdefNode new.
	result classToken: (nodes at: 1).
	result cname: (nodes at: 2).
	result colonToken: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result statements.
	result nEWLINEToken: ((nodes at: 4) at: 2).
	result iNDENTToken: ((nodes at: 4) at: 3).
	result dEDENTToken: ((nodes at: 4) at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForclassdef2: nodes [
	| result |
	result := PyClassdefNode new.
	result classToken: (nodes at: 1).
	result cname: (nodes at: 2).
	result lparenToken: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result tests.
	result addTokens: ((nodes at: 4) at: 2) to: result commaTokens.
	result rparenToken: (nodes at: 5).
	result colonToken: (nodes at: 6).
	result addNodes: ((nodes at: 7) at: 1) to: result statements.
	result nEWLINEToken: ((nodes at: 7) at: 2).
	result iNDENTToken: ((nodes at: 7) at: 3).
	result dEDENTToken: ((nodes at: 7) at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForcomp_for1: nodes [
	| result |
	result := PyCompForNode new.
	result forToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result exprs.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	result inToken: (nodes at: 3).
	result _in: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForcomp_for2: nodes [
	| result |
	result := PyCompForNode new.
	result forToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result exprs.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	result inToken: (nodes at: 3).
	result _in: (nodes at: 4).
	result comp: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForcomp_if1: nodes [
	| result |
	result := PyCompIfNode new.
	result ifToken: (nodes at: 1).
	result condition: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForcomp_if2: nodes [
	| result |
	result := PyCompIfNode new.
	result ifToken: (nodes at: 1).
	result condition: (nodes at: 2).
	result iter: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForcomp_op10: nodes [
	| result |
	result := PyCompOpNode new.
	result isToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForcomp_op11: nodes [
	| result |
	result := PyCompOpNode new.
	result isToken: (nodes at: 1).
	result notToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForcomp_op1: nodes [
	| result |
	result := PyCompOpNode new.
	result lessThanToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForcomp_op2: nodes [
	| result |
	result := PyCompOpNode new.
	result greaterThanToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForcomp_op3: nodes [
	| result |
	result := PyCompOpNode new.
	result equalEqualToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForcomp_op4: nodes [
	| result |
	result := PyCompOpNode new.
	result greaterThanEqualToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForcomp_op5: nodes [
	| result |
	result := PyCompOpNode new.
	result lessThanEqualToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForcomp_op6: nodes [
	| result |
	result := PyCompOpNode new.
	result lessThanGreaterThanToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForcomp_op7: nodes [
	| result |
	result := PyCompOpNode new.
	result bangEqualToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForcomp_op8: nodes [
	| result |
	result := PyCompOpNode new.
	result inToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForcomp_op9: nodes [
	| result |
	result := PyCompOpNode new.
	result notToken: (nodes at: 1).
	result inToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForcomparison2: nodes [
	| result |
	result := PyComparisonNode new.
	result one: (nodes at: 1).
	result op: (nodes at: 2).
	result two: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForcompound_stmt7: nodes [
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForcontinue_stmt1: nodes [
	| result |
	result := PyContinueNode new.
	result continueToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionFordecorated1: nodes [
	| result |
	result := PyDecoratedNode new.
	result decorators: (nodes at: 1).
	result classdef: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionFordecorated2: nodes [
	| result |
	result := PyDecoratedNode new.
	result decorators: (nodes at: 1).
	result funcdef: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionFordecorator1: nodes [
	| result |
	result := PyDecoratorNode new.
	result _Token: (nodes at: 1).
	result dotted_name: (nodes at: 2).
	result args: (nodes at: 3).
	result nEWLINEToken: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionFordecorators1: nodes [
	| result |
	result := nodes at: 1.
	result addNode: (nodes at: 2) to: result decorators.
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionFordecorators2: nodes [
	| result |
	result := PyDecoratorsNode new.
	result addNode: (nodes at: 1) to: result decorators.
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionFordel_stmt1: nodes [
	| result |
	result := PyDelNode new.
	result delToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result exprs.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionFordictorsetmaker1: nodes [
	| result |
	result := PyDictorsetmakerNode new.
	result test: (nodes at: 1).
	result colonToken: (nodes at: 2).
	result test2: (nodes at: 3).
	result comp: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionFordictorsetmaker2: nodes [
	| result |
	result := PyDictorsetmakerNode new.
	result test: (nodes at: 1).
	result colonToken: (nodes at: 2).
	result test2: (nodes at: 3).
	result more: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionFordictorsetmaker3: nodes [
	| result |
	result := PyDictorsetmakerNode new.
	result test: (nodes at: 1).
	result comp: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionFordotopt_dotted_name1: nodes [
	| result |
	result := PyDotoptDottedNameNode new.
	result name: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionFordotopt_dotted_name2: nodes [
	| result |
	result := PyDotoptDottedNameNode new.
	result dots: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionFordotopt_dotted_name3: nodes [
	| result |
	result := PyDotoptDottedNameNode new.
	result dots: (nodes at: 1).
	result name: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionFordots1: nodes [
	| result |
	result := nodes at: 1.
	result addToken: (nodes at: 2) to: result periodTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionFordots2: nodes [
	| result |
	result := PyDotsNode new.
	result addToken: (nodes at: 1) to: result periodTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionFordotted_as_name1: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionFordotted_as_name2: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionFordotted_as_names1: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 1).
	self add: ((nodes at: 3) at: 1) to: (result at: 2).
	self add: ((nodes at: 3) at: 2) to: (result at: 3).
	self add: ((nodes at: 3) at: 3) to: (result at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionFordotted_as_names2: nodes [
	| result |
	result := Array new: 4.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	self add: ((nodes at: 1) at: 1) to: (result at: 2).
	self add: ((nodes at: 1) at: 2) to: (result at: 3).
	self add: ((nodes at: 1) at: 3) to: (result at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionFordotted_name1: nodes [
	| result |
	result := nodes at: 1.
	result addToken: (nodes at: 2) to: result periodTokens.
	result addToken: (nodes at: 3) to: result names.
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionFordotted_name2: nodes [
	| result |
	result := PyDottedNameNode new.
	result addToken: (nodes at: 1) to: result names.
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForelifs_opt2: nodes [
	| result |
	result := PyElifNode new.
	result elifs_opt: (nodes at: 1).
	result elifToken: (nodes at: 2).
	result elif: (nodes at: 3).
	result colonToken: (nodes at: 4).
	result addNodes: ((nodes at: 5) at: 1) to: result statements.
	result nEWLINEToken: ((nodes at: 5) at: 2).
	result iNDENTToken: ((nodes at: 5) at: 3).
	result dEDENTToken: ((nodes at: 5) at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForelse_opt2: nodes [
	| result |
	result := PyElseNode new.
	result elseToken: (nodes at: 1).
	result colonToken: (nodes at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result statements.
	result nEWLINEToken: ((nodes at: 3) at: 2).
	result iNDENTToken: ((nodes at: 3) at: 3).
	result dEDENTToken: ((nodes at: 3) at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForeval_input1: nodes [
	| result |
	result := PyEvalInputNode new.
	result addNodes: ((nodes at: 1) at: 1) to: result tests.
	result addTokens: ((nodes at: 1) at: 2) to: result commaTokens.
	result addTokens: (nodes at: 2) to: result nEWLINETokens.
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForexcept_clause1: nodes [
	| result |
	result := PyExceptClauseNode new.
	result exceptToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForexcept_clause2: nodes [
	| result |
	result := PyExceptClauseNode new.
	result exceptToken: (nodes at: 1).
	result except: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForexcept_clause3: nodes [
	| result |
	result := PyExceptClauseNode new.
	result exceptToken: (nodes at: 1).
	result except: (nodes at: 2).
	result asToken: (nodes at: 3).
	result another: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForexcept_clause4: nodes [
	| result |
	result := PyExceptClauseNode new.
	result exceptToken: (nodes at: 1).
	result except: (nodes at: 2).
	result commaToken: (nodes at: 3).
	result except2: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForexcept_list1: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 1).
	self add: (nodes at: 3) to: (result at: 2).
	self addAll: ((nodes at: 4) at: 1) to: (result at: 3).
	self add: ((nodes at: 4) at: 2) to: (result at: 4).
	self add: ((nodes at: 4) at: 3) to: (result at: 5).
	self add: ((nodes at: 4) at: 4) to: (result at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForexcept_list2: nodes [
	| result |
	result := Array new: 6.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self add: (nodes at: 2) to: (result at: 2).
	self addAll: ((nodes at: 3) at: 1) to: (result at: 3).
	self add: ((nodes at: 3) at: 2) to: (result at: 4).
	self add: ((nodes at: 3) at: 3) to: (result at: 5).
	self add: ((nodes at: 3) at: 4) to: (result at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForexec_stmt1: nodes [
	| result |
	result := PyExecNode new.
	result execToken: (nodes at: 1).
	result expr: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForexec_stmt2: nodes [
	| result |
	result := PyExecNode new.
	result execToken: (nodes at: 1).
	result expr: (nodes at: 2).
	result inToken: (nodes at: 3).
	result tests_opt: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForexpr2: nodes [
	| result |
	result := PyVBarExprNode new.
	result one: (nodes at: 1).
	result orToken: (nodes at: 2).
	result two: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForexpr_stmt1: nodes [
	| result |
	result := PyExprStmtNode new.
	result addNodes: ((nodes at: 1) at: 1) to: result tests.
	result addTokens: ((nodes at: 1) at: 2) to: result commaTokens.
	result addTokens: ((nodes at: 2) at: 1) to: result assigns.
	result addObjects: ((nodes at: 2) at: 2) to: result tos.
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForexpr_stmt2: nodes [
	| result |
	result := PyExprStmtNode new.
	result addNodes: ((nodes at: 1) at: 1) to: result tests.
	result addTokens: ((nodes at: 1) at: 2) to: result commaTokens.
	result addToken: (nodes at: 2) to: result assigns.
	result addObject: (nodes at: 3) to: result tos.
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForfactor2: nodes [
	| result |
	result := PyFactorNode new.
	result plusToken: (nodes at: 1).
	result factor: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForfactor3: nodes [
	| result |
	result := PyFactorNode new.
	result minusToken: (nodes at: 1).
	result factor: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForfactor4: nodes [
	| result |
	result := PyFactorNode new.
	result tildeToken: (nodes at: 1).
	result factor: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForfile_input1: nodes [
	| result |
	result := PyFileInputNode new.
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForfile_input2: nodes [
	| result |
	result := nodes at: 1.
	result addToken: (nodes at: 2) to: result nEWLINETokens.
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForfile_input3: nodes [
	| result |
	result := nodes at: 1.
	result addNode: (nodes at: 2) to: result statements.
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForfinally_opt2: nodes [
	| result |
	result := PyFinallyNode new.
	result finallyToken: (nodes at: 1).
	result colonToken: (nodes at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result statements.
	result nEWLINEToken: ((nodes at: 3) at: 2).
	result iNDENTToken: ((nodes at: 3) at: 3).
	result dEDENTToken: ((nodes at: 3) at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForfor_stmt1: nodes [
	| result |
	result := PyForNode new.
	result forToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result exprs.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	result inToken: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result tests.
	result addTokens: ((nodes at: 4) at: 2) to: result commaTokens.
	result colonToken: (nodes at: 5).
	result addNodes: ((nodes at: 6) at: 1) to: result statements.
	result nEWLINEToken: ((nodes at: 6) at: 2).
	result iNDENTToken: ((nodes at: 6) at: 3).
	result dEDENTToken: ((nodes at: 6) at: 4).
	result else: (nodes at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForfpdef1: nodes [
	| result |
	result := PyFpdefNode new.
	result nameToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForfpdef2: nodes [
	| result |
	result := PyFpdefNode new.
	result lparenToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result fpdefs.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	result rparenToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForfuncdef1: nodes [
	| result |
	result := PyFuncdefNode new.
	result defToken: (nodes at: 1).
	result fname: (nodes at: 2).
	result parameters: (nodes at: 3).
	result colonToken: (nodes at: 4).
	result addNodes: ((nodes at: 5) at: 1) to: result statements.
	result nEWLINEToken: ((nodes at: 5) at: 2).
	result iNDENTToken: ((nodes at: 5) at: 3).
	result dEDENTToken: ((nodes at: 5) at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForglobal_stmt1: nodes [
	| result |
	result := PyGlobalNode new.
	result globalToken: (nodes at: 1).
	result addTokens: ((nodes at: 2) at: 1) to: result commaTokens.
	result addTokens: ((nodes at: 2) at: 2) to: result nameTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForif_stmt1: nodes [
	| result |
	result := PyIfNode new.
	result ifToken: (nodes at: 1).
	result if: (nodes at: 2).
	result colonToken: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result statements.
	result nEWLINEToken: ((nodes at: 4) at: 2).
	result iNDENTToken: ((nodes at: 4) at: 3).
	result dEDENTToken: ((nodes at: 4) at: 4).
	result elsif: (nodes at: 5).
	result else: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForimport_as_names1: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForimport_from1: nodes [
	| result |
	result := PyImportNode new.
	result fromToken: (nodes at: 1).
	result from: (nodes at: 2).
	result importToken: (nodes at: 3).
	result timesToken: ((nodes at: 4) at: 1).
	result lparenToken: ((nodes at: 4) at: 2).
	result addTokens: ((nodes at: 4) at: 3) to: result commaTokens.
	result addObjects: ((nodes at: 4) at: 4) to: result names.
	result addTokens: ((nodes at: 4) at: 5) to: result asTokens.
	result addTokens: ((nodes at: 4) at: 6) to: result renames.
	result rparenToken: ((nodes at: 4) at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForimport_name1: nodes [
	| result |
	result := PyImportNode new.
	result importToken: (nodes at: 1).
	result addTokens: ((nodes at: 2) at: 1) to: result commaTokens.
	result addObjects: ((nodes at: 2) at: 2) to: result names.
	result addTokens: ((nodes at: 2) at: 3) to: result asTokens.
	result addTokens: ((nodes at: 2) at: 4) to: result renames.
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForimport_names_star1: nodes [
	| result |
	result := Array new: 7.
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForimport_names_star2: nodes [
	| result |
	result := Array new: 7.
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 2 put: (nodes at: 1).
	self addAll: ((nodes at: 2) at: 1) to: (result at: 3).
	self addAll: ((nodes at: 2) at: 2) to: (result at: 4).
	self addAll: ((nodes at: 2) at: 3) to: (result at: 5).
	self addAll: ((nodes at: 2) at: 4) to: (result at: 6).
	result at: 7 put: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForimport_names_star3: nodes [
	| result |
	result := Array new: 7.
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 3).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 4).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 5).
	self addAll: ((nodes at: 1) at: 4) to: (result at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForinit_opt2: nodes [
	| result |
	result := PyInitOptNode new.
	result equalToken: (nodes at: 1).
	result test: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForlambdef1: nodes [
	| result |
	result := PyLambdaNode new.
	result lambdaToken: (nodes at: 1).
	result arguments: (nodes at: 2).
	result colonToken: (nodes at: 3).
	result body: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForlist_for1: nodes [
	| result |
	result := PyListForNode new.
	result forToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result exprs.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	result inToken: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result tests.
	result addTokens: ((nodes at: 4) at: 2) to: result commaTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForlist_for2: nodes [
	| result |
	result := PyListForNode new.
	result forToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result exprs.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	result inToken: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result tests.
	result addTokens: ((nodes at: 4) at: 2) to: result commaTokens.
	result list: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForlist_if1: nodes [
	| result |
	result := PyListIfNode new.
	result ifToken: (nodes at: 1).
	result condition: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForlist_if2: nodes [
	| result |
	result := PyListIfNode new.
	result ifToken: (nodes at: 1).
	result condition: (nodes at: 2).
	result iter: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForlistmaker1: nodes [
	| result |
	result := PyListmakerNode new.
	result test: (nodes at: 1).
	result list_for: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionFormore_args1: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionFormore_args2: nodes [
	| result |
	result := Array new: 3.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	result at: 2 put: (nodes at: 2).
	self add: (nodes at: 3) to: (result at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionFormore_args3: nodes [
	| result |
	result := nodes at: 3.
	self addFirst: (nodes at: 1) to: (result at: 1).
	self addFirst: (nodes at: 2) to: (result at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionFormore_tests2: nodes [
	| result |
	result := PyMoreTestsNode new.
	result commaToken: (nodes at: 1).
	result test: (nodes at: 2).
	result colonToken: (nodes at: 3).
	result test2: (nodes at: 4).
	result more_tests: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionFornamelist1: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 1).
	self add: (nodes at: 3) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionFornamelist2: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionFornot_test1: nodes [
	| result |
	result := PyNotNode new.
	result notToken: (nodes at: 1).
	result negated: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForold_lambdef1: nodes [
	| result |
	result := PyLambdaNode new.
	result lambdaToken: (nodes at: 1).
	result args: (nodes at: 2).
	result colonToken: (nodes at: 3).
	result body: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForor_test2: nodes [
	| result |
	result := PyOrNode new.
	result one: (nodes at: 1).
	result orToken: (nodes at: 2).
	result two: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForpass_stmt1: nodes [
	| result |
	result := PyPassNode new.
	result passToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForpower1: nodes [
	| result |
	result := PyPowerNode new.
	result atom: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result trailers.
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForpower2: nodes [
	| result |
	result := PyPowerNode new.
	result atom: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result trailers.
	result timesTimesToken: (nodes at: 3).
	result factor: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForprint_stmt1: nodes [
	| result |
	result := PyPrintNode new.
	result printToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result tests.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForprint_stmt2: nodes [
	| result |
	result := PyPrintNode new.
	result printToken: (nodes at: 1).
	result greaterThanGreaterThanToken: (nodes at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result tests.
	result addTokens: ((nodes at: 3) at: 2) to: result commaTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForraise_stmt1: nodes [
	| result |
	result := PyRaiseNode new.
	result raiseToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForraise_stmt2: nodes [
	| result |
	result := PyRaiseNode new.
	result raiseToken: (nodes at: 1).
	result arg1: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForraise_stmt3: nodes [
	| result |
	result := PyRaiseNode new.
	result raiseToken: (nodes at: 1).
	result arg1: (nodes at: 2).
	result addToken: (nodes at: 3) to: result commaTokens.
	result arg2: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForraise_stmt4: nodes [
	| result |
	result := PyRaiseNode new.
	result raiseToken: (nodes at: 1).
	result arg1: (nodes at: 2).
	result addToken: (nodes at: 3) to: result commaTokens.
	result arg2: (nodes at: 4).
	result addToken: (nodes at: 5) to: result commaTokens.
	result arg3: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForreturn_stmt1: nodes [
	| result |
	result := PyReturnNode new.
	result returnToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result tests.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForshift_expr2: nodes [
	| result |
	result := PyLShiftExprNode new.
	result one: (nodes at: 1).
	result lessThanLessThanToken: (nodes at: 2).
	result two: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForshift_expr3: nodes [
	| result |
	result := PyRShiftExprNode new.
	result one: (nodes at: 1).
	result greaterThanGreaterThanToken: (nodes at: 2).
	result two: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForsimple_stmt1: nodes [
	| result |
	result := nodes at: 3.
	result addFirstNode: (nodes at: 1) to: result stmts.
	result addFirstToken: (nodes at: 2) to: result semicolonTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForsimple_stmt2: nodes [
	| result |
	result := PySimpleStmtNode new.
	result addNode: (nodes at: 1) to: result stmts.
	result addToken: (nodes at: 2) to: result semicolonTokens.
	result nEWLINEToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForsingle_input1: nodes [
	| result |
	result := PySingleInputNode new.
	result nEWLINEToken: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForsingle_input2: nodes [
	| result |
	result := PySingleInputNode new.
	result statement: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForsingle_input3: nodes [
	| result |
	result := PySingleInputNode new.
	result statement: (nodes at: 1).
	result nEWLINEToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForsliceop2: nodes [
	| result |
	result := PySliceopNode new.
	result colonToken: (nodes at: 1).
	result test: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForstmts2: nodes [
	| result |
	result := OrderedCollection new: 2.
	self add: (nodes at: 1) to: result.
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForstrings1: nodes [
	| result |
	result := nodes at: 2.
	result addFirstToken: (nodes at: 1) to: result strings.
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForstrings2: nodes [
	| result |
	result := PyStringsNode new.
	result addToken: (nodes at: 1) to: result strings.
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForsubscript1: nodes [
	| result |
	result := PySubscriptNode new.
	result addToken: (nodes at: 1) to: result periodTokens.
	result addToken: (nodes at: 2) to: result periodTokens.
	result addToken: (nodes at: 3) to: result periodTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForsubscript2: nodes [
	| result |
	result := PySubscriptNode new.
	result test: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForsubscript3: nodes [
	| result |
	result := PySubscriptNode new.
	result test: (nodes at: 1).
	result colonToken: (nodes at: 2).
	result test2: (nodes at: 3).
	result slice: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForsuite1: nodes [
	| result |
	result := Array new: 4.
	result at: 1 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForsuite2: nodes [
	| result |
	result := Array new: 4.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (nodes at: 1).
	result at: 3 put: (nodes at: 2).
	self addAll: (nodes at: 3) to: (result at: 1).
	result at: 4 put: (nodes at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForterm2: nodes [
	| result |
	result := PyTermNode new.
	result factor: (nodes at: 1).
	result timesToken: (nodes at: 2).
	result term: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForterm3: nodes [
	| result |
	result := PyTermNode new.
	result factor: (nodes at: 1).
	result divideToken: (nodes at: 2).
	result term: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForterm4: nodes [
	| result |
	result := PyTermNode new.
	result factor: (nodes at: 1).
	result percentToken: (nodes at: 2).
	result term: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForterm5: nodes [
	| result |
	result := PyTermNode new.
	result factor: (nodes at: 1).
	result divideDivideToken: (nodes at: 2).
	result term: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionFortest2: nodes [
	| result |
	result := PyIfTestNode new.
	result or: (nodes at: 1).
	result ifToken: (nodes at: 2).
	result if: (nodes at: 3).
	result elseToken: (nodes at: 4).
	result else: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionFortest_test_opt1: nodes [
	| result |
	result := PyTestTestOptNode new.
	result test1: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionFortest_test_opt2: nodes [
	| result |
	result := PyTestTestOptNode new.
	result test1: (nodes at: 1).
	result commaToken: (nodes at: 2).
	result test2: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionFortestlist11: nodes [
	| result |
	result := PyTestlist1Node new.
	result test: (nodes at: 1).
	result commaToken: (nodes at: 2).
	result tests: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionFortestlist1: nodes [
	| result |
	result := nodes at: 3.
	self addFirst: (nodes at: 1) to: (result at: 1).
	self addFirst: (nodes at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionFortestlist2: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self add: (nodes at: 2) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionFortestlist_comp1: nodes [
	| result |
	result := PyTestlistCompNode new.
	result test: (nodes at: 1).
	result comp_for: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionFortestlist_opt1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionFortestlist_safe1: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionFortestlist_safe2: nodes [
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self add: (nodes at: 2) to: (result at: 2).
	self addAll: ((nodes at: 3) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 3) at: 2) to: (result at: 1).
	self add: (nodes at: 4) to: (result at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionFortrailer1: nodes [
	| result |
	result := PyTrailerNode new.
	result lparenToken: (nodes at: 1).
	result rparenToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionFortrailer2: nodes [
	| result |
	result := PyTrailerNode new.
	result lparenToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result arguments.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	result timesToken: ((nodes at: 2) at: 3).
	result timesTimesToken: ((nodes at: 2) at: 4).
	result rparenToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionFortrailer3: nodes [
	| result |
	result := PyTrailerNode new.
	result lbrackToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result subscripts.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	result rbrackToken: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionFortrailer4: nodes [
	| result |
	result := PyTrailerNode new.
	result periodToken: (nodes at: 1).
	result nameToken: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionFortrailers_opt1: nodes [
	| result |
	result := OrderedCollection new: 2.
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionFortrailers_opt2: nodes [
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: result.
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionFortry_stmt1: nodes [
	| result |
	result := PyTryNode new.
	result tryToken: (nodes at: 1).
	result addToken: (nodes at: 2) to: result colonTokens.
	result addNodes: ((nodes at: 3) at: 1) to: result statements.
	result addToken: ((nodes at: 3) at: 2) to: result nEWLINETokens.
	result addToken: ((nodes at: 3) at: 3) to: result iNDENTTokens.
	result addToken: ((nodes at: 3) at: 4) to: result dEDENTTokens.
	result addNodes: ((nodes at: 4) at: 1) to: result clauses.
	result addTokens: ((nodes at: 4) at: 2) to: result colonTokens.
	result addNodes: ((nodes at: 4) at: 3) to: result statements.
	result addTokens: ((nodes at: 4) at: 4) to: result nEWLINETokens.
	result addTokens: ((nodes at: 4) at: 5) to: result iNDENTTokens.
	result addTokens: ((nodes at: 4) at: 6) to: result dEDENTTokens.
	result else: (nodes at: 5).
	result finally: (nodes at: 6).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionFortry_stmt2: nodes [
	| result |
	result := PyTryNode new.
	result tryToken: (nodes at: 1).
	result addToken: (nodes at: 2) to: result colonTokens.
	result addNodes: ((nodes at: 3) at: 1) to: result statements.
	result addToken: ((nodes at: 3) at: 2) to: result nEWLINETokens.
	result addToken: ((nodes at: 3) at: 3) to: result iNDENTTokens.
	result addToken: ((nodes at: 3) at: 4) to: result dEDENTTokens.
	result finallyToken: (nodes at: 4).
	result addToken: (nodes at: 5) to: result colonTokens.
	result addNodes: ((nodes at: 6) at: 1) to: result statements.
	result addToken: ((nodes at: 6) at: 2) to: result nEWLINETokens.
	result addToken: ((nodes at: 6) at: 3) to: result iNDENTTokens.
	result addToken: ((nodes at: 6) at: 4) to: result dEDENTTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForvarargslist1: nodes [
	| result |
	result := nodes at: 4.
	self addFirst: (nodes at: 1) to: (result at: 1).
	self addFirst: (nodes at: 2) to: (result at: 2).
	self addFirst: (nodes at: 3) to: (result at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForvarargslist2: nodes [
	| result |
	result := Array new: 7.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (nodes at: 1).
	result at: 5 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForvarargslist3: nodes [
	| result |
	result := Array new: 7.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (nodes at: 1).
	result at: 5 put: (nodes at: 2).
	self add: (nodes at: 3) to: (result at: 3).
	result at: 6 put: (nodes at: 4).
	result at: 7 put: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForvarargslist4: nodes [
	| result |
	result := Array new: 7.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 6 put: (nodes at: 1).
	result at: 5 put: (nodes at: 2).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForvarargslist5: nodes [
	| result |
	result := Array new: 7.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	self add: (nodes at: 1) to: (result at: 1).
	self add: (nodes at: 2) to: (result at: 2).
	self add: (nodes at: 3) to: (result at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForvarargslist_opt2: nodes [
	| result |
	result := PyVarArgListNode new.
	result addNodes: ((nodes at: 1) at: 1) to: result args.
	result addNodes: ((nodes at: 1) at: 2) to: result inits.
	result addTokens: ((nodes at: 1) at: 3) to: result commaTokens.
	result timesToken: ((nodes at: 1) at: 4).
	result sname: ((nodes at: 1) at: 5).
	result timesTimesToken: ((nodes at: 1) at: 6).
	result ssname: ((nodes at: 1) at: 7).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForwhile_stmt1: nodes [
	| result |
	result := PyWhileNode new.
	result whileToken: (nodes at: 1).
	result test: (nodes at: 2).
	result colonToken: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result statements.
	result nEWLINEToken: ((nodes at: 4) at: 2).
	result iNDENTToken: ((nodes at: 4) at: 3).
	result dEDENTToken: ((nodes at: 4) at: 4).
	result else: (nodes at: 5).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForwith_item1: nodes [
	| result |
	result := PyWithItemNode new.
	result test: (nodes at: 1).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForwith_item2: nodes [
	| result |
	result := PyWithItemNode new.
	result test: (nodes at: 1).
	result asToken: (nodes at: 2).
	result expr: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForwith_stmt1: nodes [
	| result |
	result := PyWithNode new.
	result withToken: (nodes at: 1).
	result addTokens: ((nodes at: 2) at: 1) to: result commaTokens.
	result addNodes: ((nodes at: 2) at: 2) to: result withItems.
	result colonToken: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result statements.
	result nEWLINEToken: ((nodes at: 4) at: 2).
	result iNDENTToken: ((nodes at: 4) at: 3).
	result dEDENTToken: ((nodes at: 4) at: 4).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForxor_expr2: nodes [
	| result |
	result := PyXorExprNode new.
	result one: (nodes at: 1).
	result upArrowToken: (nodes at: 2).
	result two: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForyield_expr1: nodes [
	| result |
	result := PyYieldNode new.
	result yieldToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result tests.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	^ result
]

{ #category : #'generated-reduction actions' }
PythonParser2 >> reduceActionForyield_stmt1: nodes [
	| result |
	result := nodes at: 1.
	^ result
]

{ #category : #generated }
PythonParser2 >> reduceTable [
^#(
	#(200 0 #reduceActionForfile_input1:) 
	#(119 1 #reduceActionForpass_stmt1:) 
	#(115 0 #reduceActionFortestlist_opt1:) 
	#(120 1 #reduceActionForbreak_stmt1:) 
	#(121 1 #reduceActionForcontinue_stmt1:) 
	#(123 1 #reduceActionForraise_stmt1:) 
	#(101 0 #nil) 
	#(172 1 #reduceActionForatom9:) 
	#(180 1 #reduceActionForstrings2:) 
	#(172 1 #reduceActionForatom10:) 
	#(181 1 #reduceActionForsingle_input1:) 
	#(110 0 #reduceActionFortestlist_opt1:) 
	#(94 1 #reduceActionFordecorators2:) 
	#(102 1 #reduceActionForcompound_stmt7:) 
	#(105 0 #nil) 
	#(109 0 #nil) 
	#(108 1 #reduceActionForcompound_stmt7:) 
	#(124 1 #reduceActionForyield_stmt1:) 
	#(125 1 #reduceActionForcompound_stmt7:) 
	#(128 1 #reduceActionForcompound_stmt7:) 
	#(181 1 #reduceActionForsingle_input2:) 
	#(106 1 #reduceActionForcompound_stmt7:) 
	#(159 1 #reduceActionForcompound_stmt7:) 
	#(161 1 #reduceActionForcompound_stmt7:) 
	#(162 1 #reduceActionForcompound_stmt7:) 
	#(199 1 #reduceActionForcompound_stmt7:) 
	#(165 1 #reduceActionForcompound_stmt7:) 
	#(166 1 #reduceActionForcompound_stmt7:) 
	#(167 1 #reduceActionForcompound_stmt7:) 
	#(168 1 #reduceActionForcompound_stmt7:) 
	#(169 1 #reduceActionForcompound_stmt7:) 
	#(170 1 #reduceActionForcompound_stmt7:) 
	#(173 0 #reduceActionFortrailers_opt1:) 
	#(172 1 #reduceActionForcompound_stmt7:) 
	#(163 1 #reduceActionForcompound_stmt7:) 
	#(88 0 #reduceActionFortrailers_opt1:) 
	#(200 2 #reduceActionForfile_input2:) 
	#(200 2 #reduceActionForfile_input3:) 
	#(98 1 #reduceActionForcompound_stmt7:) 
	#(118 2 #reduceActionFordel_stmt1:) 
	#(115 1 #reduceActionForyield_stmt1:) 
	#(116 2 #reduceActionForprint_stmt1:) 
	#(137 1 #reduceActionFornamelist2:) 
	#(138 2 #reduceActionForglobal_stmt1:) 
	#(132 1 #reduceActionFordots2:) 
	#(89 1 #reduceActionFordotted_name2:) 
	#(130 1 #reduceActionFordotopt_dotted_name1:) 
	#(130 1 #reduceActionFordotopt_dotted_name2:) 
	#(114 2 #reduceActionForyield_expr1:) 
	#(123 2 #reduceActionForraise_stmt2:) 
	#(135 1 #reduceActionFordotted_as_name1:) 
	#(126 2 #reduceActionForimport_name1:) 
	#(129 1 #reduceActionFordotted_as_names2:) 
	#(122 2 #reduceActionForreturn_stmt1:) 
	#(141 2 #reduceActionForexec_stmt1:) 
	#(90 0 #nil) 
	#(140 1 #reduceActionFortest_test_opt1:) 
	#(142 2 #reduceActionForassert_stmt1:) 
	#(170 2 #reduceActionForfactor2:) 
	#(178 1 #reduceActionForcompound_stmt7:) 
	#(170 2 #reduceActionForfactor4:) 
	#(170 2 #reduceActionForfactor3:) 
	#(154 1 #reduceActionForwith_item1:) 
	#(153 1 #reduceActionFornamelist2:) 
	#(162 2 #reduceActionFornot_test1:) 
	#(103 1 #reduceActionForfpdef1:) 
	#(104 0 #nil) 
	#(101 1 #reduceActionForvarargslist_opt2:) 
	#(180 2 #reduceActionForstrings1:) 
	#(172 2 #reduceActionForatom1:) 
	#(175 1 #reduceActionForcompound_stmt7:) 
	#(172 2 #reduceActionForatom4:) 
	#(176 1 #reduceActionForcompound_stmt7:) 
	#(172 2 #reduceActionForatom7:) 
	#(177 1 #reduceActionForcompound_stmt7:) 
	#(111 1 #reduceActionForcompound_stmt7:) 
	#(113 2 #reduceActionForexpr_stmt1:) 
	#(94 2 #reduceActionFordecorators1:) 
	#(97 2 #reduceActionFordecorated1:) 
	#(97 2 #reduceActionFordecorated2:) 
	#(181 2 #reduceActionForsingle_input3:) 
	#(105 1 #reduceActionForcompound_stmt7:) 
	#(87 2 #reduceActionFortestlist2:) 
	#(109 1 #reduceActionForcompound_stmt7:) 
	#(171 2 #reduceActionForpower1:) 
	#(164 1 #reduceActionForcomp_op8:) 
	#(164 1 #reduceActionForcomp_op6:) 
	#(164 1 #reduceActionForcomp_op7:) 
	#(164 1 #reduceActionForcomp_op5:) 
	#(164 1 #reduceActionForcomp_op10:) 
	#(164 1 #reduceActionForcomp_op4:) 
	#(164 1 #reduceActionForcomp_op3:) 
	#(164 1 #reduceActionForcomp_op1:) 
	#(164 1 #reduceActionForcomp_op2:) 
	#(139 2 #reduceActionForeval_input1:) 
	#(117 2 #reduceActionFortestlist2:) 
	#(116 3 #reduceActionForprint_stmt2:) 
	#(132 2 #reduceActionFordots1:) 
	#(130 2 #reduceActionFordotopt_dotted_name3:) 
	#(92 0 #nil) 
	#(172 3 #reduceActionForatom8:) 
	#(100 1 #reduceActionForsuite1:) 
	#(203 2 #reduceActionForvarargslist2:) 
	#(203 2 #reduceActionForvarargslist4:) 
	#(175 2 #reduceActionFortestlist_comp1:) 
	#(172 3 #reduceActionForatom2:) 
	#(176 2 #reduceActionForlistmaker1:) 
	#(172 3 #reduceActionForatom5:) 
	#(177 2 #reduceActionFordictorsetmaker3:) 
	#(172 3 #reduceActionForatom6:) 
	#(112 1 #reduceActionForcompound_stmt7:) 
	#(113 3 #reduceActionForexpr_stmt2:) 
	#(87 3 #reduceActionFortestlist1:) 
	#(131 3 #reduceActionForsimple_stmt1:) 
	#(131 3 #reduceActionForsimple_stmt2:) 
	#(159 3 #reduceActionForor_test2:) 
	#(161 3 #reduceActionForand_test2:) 
	#(199 3 #reduceActionForexpr2:) 
	#(165 3 #reduceActionForxor_expr2:) 
	#(166 3 #reduceActionForand_expr2:) 
	#(167 3 #reduceActionForshift_expr3:) 
	#(167 3 #reduceActionForshift_expr2:) 
	#(168 3 #reduceActionForarith_expr2:) 
	#(168 3 #reduceActionForarith_expr3:) 
	#(169 3 #reduceActionForterm2:) 
	#(169 3 #reduceActionForterm5:) 
	#(169 3 #reduceActionForterm3:) 
	#(169 3 #reduceActionForterm4:) 
	#(187 0 #nil) 
	#(173 2 #reduceActionFortrailers_opt2:) 
	#(164 2 #reduceActionForcomp_op11:) 
	#(164 2 #reduceActionForcomp_op9:) 
	#(163 3 #reduceActionForcomparison2:) 
	#(88 2 #reduceActionFortrailers_opt2:) 
	#(117 3 #reduceActionFortestlist1:) 
	#(137 3 #reduceActionFornamelist1:) 
	#(89 3 #reduceActionFordotted_name1:) 
	#(179 1 #reduceActionForimport_names_star1:) 
	#(134 1 #reduceActionFordotted_as_name1:) 
	#(179 1 #reduceActionForimport_names_star3:) 
	#(136 1 #reduceActionFordotted_as_names2:) 
	#(127 4 #reduceActionForimport_from1:) 
	#(123 4 #reduceActionForraise_stmt3:) 
	#(135 3 #reduceActionFordotted_as_name2:) 
	#(129 3 #reduceActionFordotted_as_names1:) 
	#(141 4 #reduceActionForexec_stmt2:) 
	#(92 1 #reduceActionForcompound_stmt7:) 
	#(190 1 #reduceActionForargument1:) 
	#(91 4 #reduceActionFordecorator1:) 
	#(140 3 #reduceActionFortest_test_opt2:) 
	#(178 3 #reduceActionFortestlist11:) 
	#(95 4 #reduceActionForclassdef1:) 
	#(152 1 #reduceActionForexcept_clause1:) 
	#(149 0 #nil) 
	#(148 0 #nil) 
	#(154 3 #reduceActionForwith_item2:) 
	#(147 4 #reduceActionForwith_stmt1:) 
	#(153 3 #reduceActionFornamelist1:) 
	#(107 2 #reduceActionFortestlist2:) 
	#(103 3 #reduceActionForfpdef2:) 
	#(184 4 #reduceActionForlambdef1:) 
	#(104 2 #reduceActionForinit_opt2:) 
	#(203 3 #reduceActionForvarargslist5:) 
	#(110 3 #reduceActionFornamelist1:) 
	#(171 4 #reduceActionForpower2:) 
	#(174 2 #reduceActionFortrailer4:) 
	#(174 2 #reduceActionFortrailer1:) 
	#(187 1 #reduceActionForcompound_stmt7:) 
	#(186 1 #reduceActionForsubscript2:) 
	#(133 2 #reduceActionForimport_as_names1:) 
	#(191 0 #reduceActionFormore_args1:) 
	#(93 2 #reduceActionForarglist4:) 
	#(90 3 #liftSecondValue:) 
	#(190 2 #reduceActionForargument2:) 
	#(93 2 #reduceActionForarglist2:) 
	#(99 3 #liftSecondValue:) 
	#(96 5 #reduceActionForfuncdef1:) 
	#(155 1 #reduceActionForstmts2:) 
	#(152 2 #reduceActionForexcept_clause2:) 
	#(151 0 #nil) 
	#(144 5 #reduceActionForwhile_stmt1:) 
	#(107 3 #reduceActionFortestlist1:) 
	#(203 4 #reduceActionForvarargslist1:) 
	#(189 1 #reduceActionForcompound_stmt7:) 
	#(177 4 #reduceActionFordictorsetmaker1:) 
	#(177 4 #reduceActionFordictorsetmaker2:) 
	#(106 5 #reduceActionFortest2:) 
	#(174 3 #reduceActionFortrailer2:) 
	#(174 3 #reduceActionFortrailer3:) 
	#(185 2 #reduceActionFortestlist2:) 
	#(134 3 #reduceActionFordotted_as_name2:) 
	#(179 3 #reduceActionForimport_names_star2:) 
	#(136 3 #reduceActionFordotted_as_names1:) 
	#(123 6 #reduceActionForraise_stmt4:) 
	#(93 3 #reduceActionForarglist3:) 
	#(190 3 #reduceActionForargument3:) 
	#(93 3 #reduceActionFortestlist1:) 
	#(155 2 #reduceActionFortrailers_opt2:) 
	#(100 4 #reduceActionForsuite2:) 
	#(146 6 #reduceActionFortry_stmt2:) 
	#(146 6 #reduceActionFortry_stmt1:) 
	#(150 3 #reduceActionForexcept_list2:) 
	#(143 6 #reduceActionForif_stmt1:) 
	#(203 5 #reduceActionForvarargslist3:) 
	#(183 4 #reduceActionForcomp_for1:) 
	#(158 1 #reduceActionFortestlist_safe1:) 
	#(182 4 #reduceActionForlist_for1:) 
	#(156 1 #reduceActionForcompound_stmt7:) 
	#(186 3 #reduceActionForsubscript1:) 
	#(185 3 #reduceActionFortestlist1:) 
	#(188 0 #nil) 
	#(95 7 #reduceActionForclassdef2:) 
	#(145 7 #reduceActionForfor_stmt1:) 
	#(152 4 #reduceActionForexcept_clause3:) 
	#(152 4 #reduceActionForexcept_clause4:) 
	#(149 3 #reduceActionForelse_opt2:) 
	#(150 4 #reduceActionForexcept_list1:) 
	#(195 1 #reduceActionForcompound_stmt7:) 
	#(183 5 #reduceActionForcomp_for2:) 
	#(193 1 #reduceActionForcompound_stmt7:) 
	#(182 5 #reduceActionForlist_for2:) 
	#(186 4 #reduceActionForsubscript3:) 
	#(191 3 #reduceActionFormore_args2:) 
	#(191 3 #reduceActionFormore_args3:) 
	#(151 3 #reduceActionForfinally_opt2:) 
	#(194 2 #reduceActionForcomp_if1:) 
	#(157 1 #reduceActionFornamelist2:) 
	#(192 2 #reduceActionForlist_if1:) 
	#(188 2 #reduceActionForsliceop2:) 
	#(148 5 #reduceActionForelifs_opt2:) 
	#(194 3 #reduceActionForcomp_if2:) 
	#(160 4 #reduceActionForold_lambdef1:) 
	#(158 4 #reduceActionFortestlist_safe2:) 
	#(192 3 #reduceActionForlist_if2:) 
	#(189 5 #reduceActionFormore_tests2:) 
	#(157 3 #reduceActionFornamelist1:)
	).
]

{ #category : #generated }
PythonParser2 >> symbolNames [
	^ #('"del"' '"pass"' '"print"' '">>"' '"**="' '"//="' '"break"' '"continue"' '">>="' '"as"' '"global"' '"from"' '"yield"' '"raise"' '"import"' '"<<="' '"return"' '"exec"' '"*"' '"**"' '":"' '","' '"@"' '"def"' '"="' '";"' '"."' '"&="' '"|="' '"/="' '"%="' '"-="' '"*="' '"^="' '"+="' '"in"' '"^"' '"&"' '"assert"' '"|"' '"<>"' '"!="' '"<<"' '"+"' '"<="' '"`"' '"class"' '"//"' '"~"' '"/"' '"%"' '"is"' '"-"' '">="' '"for"' '"try"' '"else"' '"=="' '"if"' '"elif"' '"finally"' '"while"' '"with"' '"<"' '"not"' '"and"' '">"' '"lambda"' '"except"' '"or"' '<name>' '<string>' '<number>' '<emptyLine>' '<blankLine>' '<indent>' '<noindent>' '<comment>' '<whitespace>' '<NEWLINE>' '<lparen>' '<rparen>' '<lbrack>' '<rbrack>' '<lcurly>' '<rcurly>' 'testlist' 'newline_opts' 'dotted_name' 'paren_arglist_opt' 'decorator' 'arglist_opt' 'arglist' 'decorators' 'classdef' 'funcdef' 'decorated' 'stmt' 'parameters' 'suite' 'varargslist_opt' 'compound_stmt' 'fpdef' 'init_opt' 'comma_opt' 'test' 'fplist' 'small_stmt' 'semicolon_opt' 'assign_after' 'augassign' 'yield_or_testlist' 'expr_stmt' 'yield_expr' 'testlist_opt' 'print_stmt' 'exprlist' 'del_stmt' 'pass_stmt' 'break_stmt' 'continue_stmt' 'return_stmt' 'raise_stmt' 'yield_stmt' 'flow_stmt' 'import_name' 'import_from' 'import_stmt' 'dotted_as_names' 'dotopt_dotted_name' 'simple_stmt' 'dots' 'import_as_names' 'import_as_name' 'dotted_as_name' 'import_as_names_in' 'namelist' 'global_stmt' 'eval_input' 'test_test_opt' 'exec_stmt' 'assert_stmt' 'if_stmt' 'while_stmt' 'for_stmt' 'try_stmt' 'with_stmt' 'elifs_opt' 'else_opt' 'except_list' 'finally_opt' 'except_clause' 'with_items' 'with_item' 'stmts' 'old_test' 'old_tests' 'testlist_safe' 'or_test' 'old_lambdef' 'and_test' 'not_test' 'comparison' 'comp_op' 'xor_expr' 'and_expr' 'shift_expr' 'arith_expr' 'term' 'factor' 'power' 'atom' 'trailers_opt' 'trailer' 'testlist_comp' 'listmaker' 'dictorsetmaker' 'testlist1' 'import_names_star' 'strings' 'single_input' 'list_for' 'comp_for' 'lambdef' 'subscriptlist' 'subscript' 'test_opt' 'sliceop' 'more_tests' 'argument' 'more_args' 'list_if' 'list_iter' 'comp_if' 'comp_iter' 'E O F' 'error' 'B e g i n' 'expr' 'file_input' '<DEDENT>' '<INDENT>' 'varargslist')
]

{ #category : #generated }
PythonParser2 >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #OrderedCollection #OrderedCollection #PyDottedNameNode #OrderedCollection #PyDecoratorNode #OrderedCollection #OrderedCollection #PyDecoratorsNode #PyClassdefNode #PyFuncdefNode #PyDecoratedNode #PyRootNode #PyVarArgListNode #OrderedCollection #PyVarArgListNode #PyRootNode #PyFpdefNode #PyInitOptNode #SmaCCToken #PyRootNode #OrderedCollection #PyRootNode #SmaCCToken #OrderedCollection #SmaCCToken #Object #PyExprStmtNode #PyYieldNode #OrderedCollection #PyPrintNode #OrderedCollection #PyDelNode #PyPassNode #PyBreakNode #PyContinueNode #PyReturnNode #PyRaiseNode #PyYieldNode #PyRootNode #PyImportNode #PyImportNode #PyImportNode #OrderedCollection #PyDotoptDottedNameNode #PySimpleStmtNode #PyDotsNode #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #OrderedCollection #PyGlobalNode #PyEvalInputNode #PyTestTestOptNode #PyExecNode #PyAssertNode #PyIfNode #PyWhileNode #PyForNode #PyTryNode #PyWithNode #PyElifNode #PyElseNode #OrderedCollection #PyFinallyNode #PyExceptClauseNode #OrderedCollection #PyWithItemNode #OrderedCollection #PyRootNode #OrderedCollection #OrderedCollection #PyRootNode #PyLambdaNode #PyRootNode #PyRootNode #PyRootNode #PyCompOpNode #PyRootNode #PyRootNode #PyRootNode #PyRootNode #PyRootNode #PyRootNode #PyPowerNode #PyRootNode #OrderedCollection #PyTrailerNode #Object #Object #Object #PyRootNode #OrderedCollection #PyStringsNode #PySingleInputNode #PyListForNode #PyCompForNode #PyLambdaNode #OrderedCollection #PySubscriptNode #PyRootNode #PySliceopNode #Object #PyArgumentNode #OrderedCollection #PyListIfNode #PyRootNode #PyCompIfNode #PyRootNode #SmaCCToken #SmaCCToken #PyFileInputNode #PyRootNode #PyFileInputNode #SmaCCToken #SmaCCToken #OrderedCollection)
]

{ #category : #generated }
PythonParser2 >> transitionTable [
^#(
#[1 0 6 0 1 0 6 0 2 0 6 0 3 0 6 0 7 0 6 0 8 0 6 0 11 0 6 0 12 0 6 0 13 0 6 0 14 0 6 0 15 0 6 0 17 0 6 0 18 0 6 0 23 0 6 0 24 0 6 0 39 0 6 0 44 0 6 0 46 0 6 0 47 0 6 0 49 0 6 0 53 0 6 0 55 0 6 0 56 0 6 0 59 0 6 0 62 0 6 0 63 0 6 0 65 0 6 0 68 0 6 0 71 0 6 0 72 0 6 0 73 0 6 0 80 0 6 0 81 0 6 0 83 0 6 0 85 0 6 0 196 0 17 0 200] 
#[1 0 21 0 1 0 25 0 2 0 29 0 3 0 33 0 7 0 37 0 8 0 41 0 11 0 45 0 12 0 49 0 13 0 53 0 14 0 57 0 15 0 61 0 17 0 65 0 18 0 69 0 23 0 73 0 24 0 77 0 39 0 81 0 44 0 85 0 46 0 89 0 47 0 93 0 49 0 97 0 53 0 101 0 55 0 105 0 56 0 109 0 59 0 113 0 62 0 117 0 63 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 141 0 80 0 145 0 81 0 149 0 83 0 153 0 85 0 157 0 87 0 161 0 91 0 165 0 94 0 169 0 95 0 173 0 96 0 177 0 97 0 181 0 102 0 185 0 106 0 189 0 108 0 193 0 113 0 197 0 114 0 201 0 116 0 205 0 118 0 209 0 119 0 213 0 120 0 217 0 121 0 221 0 122 0 225 0 123 0 229 0 124 0 233 0 125 0 237 0 126 0 241 0 127 0 245 0 128 0 249 0 131 0 253 0 138 1 1 0 141 1 5 0 142 1 9 0 143 1 13 0 144 1 17 0 145 1 21 0 146 1 25 0 147 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 81 0 181 1 85 0 184 1 89 0 199] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 1 93 0 87 0 185 0 106 1 97 0 139 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 1 89 0 199] 
#[1 0 21 0 1 0 25 0 2 0 29 0 3 0 33 0 7 0 37 0 8 0 41 0 11 0 45 0 12 0 49 0 13 0 53 0 14 0 57 0 15 0 61 0 17 0 65 0 18 0 69 0 23 0 73 0 24 0 77 0 39 0 81 0 44 0 85 0 46 0 89 0 47 0 93 0 49 0 97 0 53 0 101 0 55 0 105 0 56 0 109 0 59 0 113 0 62 0 117 0 63 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 1 101 0 80 0 145 0 81 0 149 0 83 0 153 0 85 0 157 0 87 0 161 0 91 0 165 0 94 0 169 0 95 0 173 0 96 0 177 0 97 1 105 0 98 1 109 0 102 0 185 0 106 0 189 0 108 0 193 0 113 0 197 0 114 0 201 0 116 0 205 0 118 0 209 0 119 0 213 0 120 0 217 0 121 0 221 0 122 0 225 0 123 0 229 0 124 0 233 0 125 0 237 0 126 0 241 0 127 0 245 0 128 1 113 0 131 0 253 0 138 1 1 0 141 1 5 0 142 1 9 0 143 1 13 0 144 1 17 0 145 1 21 0 146 1 25 0 147 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 0 0 0 196 1 89 0 199] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 1 117 0 117 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 121 0 199] 
#[0 0 10 0 26 0 80] 
#[1 1 125 0 4 0 14 0 26 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 14 0 80 0 145 0 81 0 149 0 83 0 153 0 85 1 129 0 87 0 185 0 106 1 133 0 115 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 1 89 0 199] 
#[0 0 18 0 26 0 80] 
#[0 0 22 0 26 0 80] 
#[1 1 137 0 71 1 141 0 137] 
#[1 1 145 0 27 1 149 0 71 1 153 0 89 1 157 0 130 1 161 0 132] 
#[1 0 14 0 25 0 14 0 26 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 14 0 80 0 145 0 81 0 14 0 82 0 149 0 83 0 153 0 85 1 129 0 87 0 185 0 106 1 165 0 115 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 1 89 0 199] 
#[1 0 26 0 26 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 26 0 80 0 145 0 81 0 149 0 83 0 153 0 85 1 169 0 106 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 1 89 0 199] 
#[1 1 149 0 71 1 173 0 89 1 177 0 129 1 181 0 135] 
#[1 0 14 0 26 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 14 0 80 0 145 0 81 0 149 0 83 0 153 0 85 1 129 0 87 0 185 0 106 1 185 0 115 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 1 89 0 199] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 189 0 199] 
#[1 1 149 0 71 1 193 0 89] 
#[0 1 197 0 71] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 1 201 0 106 1 205 0 140 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 1 89 0 199] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 1 209 0 170 1 69 0 171 1 73 0 172 1 77 0 180] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 1 213 0 106 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 217 0 178 1 77 0 180 1 85 0 184 1 89 0 199] 
#[0 1 221 0 71] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 1 225 0 170 1 69 0 171 1 73 0 172 1 77 0 180] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 1 229 0 170 1 69 0 171 1 73 0 172 1 77 0 180] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 1 233 0 117 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 121 0 199] 
#[0 1 237 0 21] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 1 241 0 106 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 1 89 0 199] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 1 245 0 106 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 1 89 0 199] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 1 249 0 106 1 253 0 153 2 1 0 154 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 1 89 0 199] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 2 5 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 89 0 199] 
#[1 2 9 0 19 2 13 0 20 0 30 0 21 2 17 0 71 2 21 0 81 2 25 0 101 2 29 0 103 2 33 0 203] 
#[0 0 34 0 4 0 5 0 6 0 9 0 10 0 16 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 58 0 59 0 64 0 65 0 66 0 67 0 70 0 80 0 81 0 82 0 83 0 84 0 86 0 196] 
#[1 0 38 0 4 0 38 0 5 0 38 0 6 0 38 0 9 0 38 0 10 0 38 0 16 0 38 0 19 0 38 0 20 0 38 0 21 0 38 0 22 0 38 0 25 0 38 0 26 0 38 0 27 0 38 0 28 0 38 0 29 0 38 0 30 0 38 0 31 0 38 0 32 0 38 0 33 0 38 0 34 0 38 0 35 0 38 0 36 0 38 0 37 0 38 0 38 0 38 0 40 0 38 0 41 0 38 0 42 0 38 0 43 0 38 0 44 0 38 0 45 0 38 0 46 0 38 0 48 0 38 0 50 0 38 0 51 0 38 0 52 0 38 0 53 0 38 0 54 0 38 0 55 0 38 0 57 0 38 0 58 0 38 0 59 0 38 0 64 0 38 0 65 0 38 0 66 0 38 0 67 0 38 0 70 0 133 0 72 0 38 0 80 0 38 0 81 0 38 0 82 0 38 0 83 0 38 0 84 0 38 0 86 2 37 0 180 0 38 0 196] 
#[0 0 42 0 4 0 5 0 6 0 9 0 10 0 16 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 58 0 59 0 64 0 65 0 66 0 67 0 70 0 80 0 81 0 82 0 83 0 84 0 86 0 196] 
#[0 0 46 0 196] 
#[1 0 49 0 13 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 2 41 0 82 0 149 0 83 0 153 0 85 2 45 0 87 2 49 0 106 2 53 0 114 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 2 57 0 175 1 77 0 180 1 85 0 184 1 89 0 199] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 2 61 0 84 0 153 0 85 2 65 0 87 2 69 0 106 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 2 73 0 176 1 77 0 180 1 85 0 184 1 89 0 199] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 2 77 0 86 2 81 0 87 2 85 0 106 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 2 89 0 177 1 77 0 180 1 85 0 184 1 89 0 199] 
#[1 2 93 0 5 2 97 0 6 2 101 0 9 2 105 0 16 0 50 0 25 0 50 0 26 2 109 0 28 2 113 0 29 2 117 0 30 2 121 0 31 2 125 0 32 2 129 0 33 2 133 0 34 2 137 0 35 0 50 0 80 2 141 0 110 2 145 0 111] 
#[0 0 54 0 23 0 24 0 47] 
#[1 0 69 0 23 0 73 0 24 0 89 0 47 2 149 0 91 2 153 0 95 2 157 0 96] 
#[0 0 58 0 1 0 2 0 3 0 7 0 8 0 11 0 12 0 13 0 14 0 15 0 17 0 18 0 23 0 24 0 39 0 44 0 46 0 47 0 49 0 53 0 55 0 56 0 59 0 62 0 63 0 65 0 68 0 71 0 72 0 73 0 80 0 81 0 83 0 85 0 196 0 201] 
#[0 0 58 0 1 0 2 0 3 0 7 0 8 0 11 0 12 0 13 0 14 0 15 0 17 0 18 0 23 0 24 0 39 0 44 0 46 0 47 0 49 0 53 0 55 0 56 0 59 0 62 0 63 0 65 0 68 0 71 0 72 0 73 0 80 0 81 0 83 0 85 0 196 0 201] 
#[0 0 58 0 1 0 2 0 3 0 7 0 8 0 11 0 12 0 13 0 14 0 15 0 17 0 18 0 23 0 24 0 39 0 44 0 46 0 47 0 49 0 53 0 55 0 56 0 59 0 62 0 63 0 65 0 68 0 71 0 72 0 73 0 80 0 81 0 83 0 85 0 196 0 201] 
#[0 2 161 0 80] 
#[1 0 62 0 5 0 62 0 6 0 62 0 9 0 62 0 16 0 62 0 21 2 165 0 22 0 62 0 25 0 62 0 26 0 62 0 28 0 62 0 29 0 62 0 30 0 62 0 31 0 62 0 32 0 62 0 33 0 62 0 34 0 62 0 35 0 62 0 80 0 62 0 82 0 62 0 84 0 62 0 86 2 169 0 105 0 62 0 196] 
#[1 2 173 0 26 0 66 0 80 2 177 0 109] 
#[0 0 70 0 26 0 80] 
#[0 0 74 0 26 0 80] 
#[0 0 70 0 26 0 80] 
#[0 0 70 0 26 0 80] 
#[0 0 70 0 26 0 80] 
#[0 0 78 0 26 0 80] 
#[0 0 78 0 26 0 80] 
#[0 0 78 0 26 0 80] 
#[0 0 78 0 26 0 80] 
#[0 0 78 0 26 0 80] 
#[0 0 70 0 26 0 80] 
#[0 0 82 0 26 0 80] 
#[0 0 82 0 26 0 80] 
#[0 0 70 0 26 0 80] 
#[0 0 86 0 196] 
#[0 0 70 0 26 0 80] 
#[0 0 70 0 26 0 80] 
#[0 0 70 0 26 0 80] 
#[0 0 58 0 1 0 2 0 3 0 7 0 8 0 11 0 12 0 13 0 14 0 15 0 17 0 18 0 23 0 24 0 39 0 44 0 46 0 47 0 49 0 53 0 55 0 56 0 59 0 62 0 63 0 65 0 68 0 71 0 72 0 73 0 80 0 81 0 83 0 85 0 196 0 201] 
#[0 0 58 0 1 0 2 0 3 0 7 0 8 0 11 0 12 0 13 0 14 0 15 0 17 0 18 0 23 0 24 0 39 0 44 0 46 0 47 0 49 0 53 0 55 0 56 0 59 0 62 0 63 0 65 0 68 0 71 0 72 0 73 0 80 0 81 0 83 0 85 0 196 0 201] 
#[0 0 58 0 1 0 2 0 3 0 7 0 8 0 11 0 12 0 13 0 14 0 15 0 17 0 18 0 23 0 24 0 39 0 44 0 46 0 47 0 49 0 53 0 55 0 56 0 59 0 62 0 63 0 65 0 68 0 71 0 72 0 73 0 80 0 81 0 83 0 85 0 196 0 201] 
#[0 0 58 0 1 0 2 0 3 0 7 0 8 0 11 0 12 0 13 0 14 0 15 0 17 0 18 0 23 0 24 0 39 0 44 0 46 0 47 0 49 0 53 0 55 0 56 0 59 0 62 0 63 0 65 0 68 0 71 0 72 0 73 0 80 0 81 0 83 0 85 0 196 0 201] 
#[0 0 58 0 1 0 2 0 3 0 7 0 8 0 11 0 12 0 13 0 14 0 15 0 17 0 18 0 23 0 24 0 39 0 44 0 46 0 47 0 49 0 53 0 55 0 56 0 59 0 62 0 63 0 65 0 68 0 71 0 72 0 73 0 80 0 81 0 83 0 85 0 196 0 201] 
#[1 0 90 0 5 0 90 0 6 0 90 0 9 0 90 0 10 0 90 0 16 0 90 0 21 0 90 0 22 0 90 0 25 0 90 0 26 0 90 0 28 0 90 0 29 0 90 0 30 0 90 0 31 0 90 0 32 0 90 0 33 0 90 0 34 0 90 0 35 0 90 0 46 0 90 0 55 2 181 0 59 0 90 0 80 0 90 0 82 0 90 0 84 0 90 0 86 0 90 0 196] 
#[1 0 94 0 5 0 94 0 6 0 94 0 9 0 94 0 10 0 94 0 16 0 94 0 21 0 94 0 22 0 94 0 25 0 94 0 26 0 94 0 28 0 94 0 29 0 94 0 30 0 94 0 31 0 94 0 32 0 94 0 33 0 94 0 34 0 94 0 35 0 94 0 46 0 94 0 55 0 94 0 57 0 94 0 59 2 185 0 70 0 94 0 80 0 94 0 82 0 94 0 84 0 94 0 86 0 94 0 196] 
#[1 0 98 0 5 0 98 0 6 0 98 0 9 0 98 0 10 0 98 0 16 0 98 0 21 0 98 0 22 0 98 0 25 0 98 0 26 0 98 0 28 0 98 0 29 0 98 0 30 0 98 0 31 0 98 0 32 0 98 0 33 0 98 0 34 0 98 0 35 0 98 0 46 0 98 0 55 0 98 0 57 0 98 0 59 2 189 0 66 0 98 0 70 0 98 0 80 0 98 0 82 0 98 0 84 0 98 0 86 0 98 0 196] 
#[0 0 102 0 5 0 6 0 9 0 10 0 16 0 21 0 22 0 25 0 26 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 46 0 55 0 57 0 59 0 66 0 70 0 80 0 82 0 84 0 86 0 196] 
#[1 0 106 0 5 0 106 0 6 0 106 0 9 0 106 0 10 0 106 0 16 0 106 0 21 0 106 0 22 0 106 0 25 0 106 0 26 0 106 0 28 0 106 0 29 0 106 0 30 0 106 0 31 0 106 0 32 0 106 0 33 0 106 0 34 0 106 0 35 0 106 0 36 2 193 0 40 0 106 0 41 0 106 0 42 0 106 0 45 0 106 0 46 0 106 0 52 0 106 0 54 0 106 0 55 0 106 0 57 0 106 0 58 0 106 0 59 0 106 0 64 0 106 0 65 0 106 0 66 0 106 0 67 0 106 0 70 0 106 0 80 0 106 0 82 0 106 0 84 0 106 0 86 0 106 0 196] 
#[1 0 110 0 5 0 110 0 6 0 110 0 9 0 110 0 10 0 110 0 16 0 110 0 21 0 110 0 22 0 110 0 25 0 110 0 26 0 110 0 28 0 110 0 29 0 110 0 30 0 110 0 31 0 110 0 32 0 110 0 33 0 110 0 34 0 110 0 35 0 110 0 36 2 197 0 37 0 110 0 40 0 110 0 41 0 110 0 42 0 110 0 45 0 110 0 46 0 110 0 52 0 110 0 54 0 110 0 55 0 110 0 57 0 110 0 58 0 110 0 59 0 110 0 64 0 110 0 65 0 110 0 66 0 110 0 67 0 110 0 70 0 110 0 80 0 110 0 82 0 110 0 84 0 110 0 86 0 110 0 196] 
#[1 0 114 0 5 0 114 0 6 0 114 0 9 0 114 0 10 0 114 0 16 0 114 0 21 0 114 0 22 0 114 0 25 0 114 0 26 0 114 0 28 0 114 0 29 0 114 0 30 0 114 0 31 0 114 0 32 0 114 0 33 0 114 0 34 0 114 0 35 0 114 0 36 0 114 0 37 2 201 0 38 0 114 0 40 0 114 0 41 0 114 0 42 0 114 0 45 0 114 0 46 0 114 0 52 0 114 0 54 0 114 0 55 0 114 0 57 0 114 0 58 0 114 0 59 0 114 0 64 0 114 0 65 0 114 0 66 0 114 0 67 0 114 0 70 0 114 0 80 0 114 0 82 0 114 0 84 0 114 0 86 0 114 0 196] 
#[1 2 205 0 4 0 118 0 5 0 118 0 6 0 118 0 9 0 118 0 10 0 118 0 16 0 118 0 21 0 118 0 22 0 118 0 25 0 118 0 26 0 118 0 28 0 118 0 29 0 118 0 30 0 118 0 31 0 118 0 32 0 118 0 33 0 118 0 34 0 118 0 35 0 118 0 36 0 118 0 37 0 118 0 38 0 118 0 40 0 118 0 41 0 118 0 42 2 209 0 43 0 118 0 45 0 118 0 46 0 118 0 52 0 118 0 54 0 118 0 55 0 118 0 57 0 118 0 58 0 118 0 59 0 118 0 64 0 118 0 65 0 118 0 66 0 118 0 67 0 118 0 70 0 118 0 80 0 118 0 82 0 118 0 84 0 118 0 86 0 118 0 196] 
#[1 0 122 0 4 0 122 0 5 0 122 0 6 0 122 0 9 0 122 0 10 0 122 0 16 0 122 0 21 0 122 0 22 0 122 0 25 0 122 0 26 0 122 0 28 0 122 0 29 0 122 0 30 0 122 0 31 0 122 0 32 0 122 0 33 0 122 0 34 0 122 0 35 0 122 0 36 0 122 0 37 0 122 0 38 0 122 0 40 0 122 0 41 0 122 0 42 0 122 0 43 2 213 0 44 0 122 0 45 0 122 0 46 0 122 0 52 2 217 0 53 0 122 0 54 0 122 0 55 0 122 0 57 0 122 0 58 0 122 0 59 0 122 0 64 0 122 0 65 0 122 0 66 0 122 0 67 0 122 0 70 0 122 0 80 0 122 0 82 0 122 0 84 0 122 0 86 0 122 0 196] 
#[1 0 126 0 4 0 126 0 5 0 126 0 6 0 126 0 9 0 126 0 10 0 126 0 16 2 221 0 19 0 126 0 21 0 126 0 22 0 126 0 25 0 126 0 26 0 126 0 28 0 126 0 29 0 126 0 30 0 126 0 31 0 126 0 32 0 126 0 33 0 126 0 34 0 126 0 35 0 126 0 36 0 126 0 37 0 126 0 38 0 126 0 40 0 126 0 41 0 126 0 42 0 126 0 43 0 126 0 44 0 126 0 45 0 126 0 46 2 225 0 48 2 229 0 50 2 233 0 51 0 126 0 52 0 126 0 53 0 126 0 54 0 126 0 55 0 126 0 57 0 126 0 58 0 126 0 59 0 126 0 64 0 126 0 65 0 126 0 66 0 126 0 67 0 126 0 70 0 126 0 80 0 126 0 82 0 126 0 84 0 126 0 86 0 126 0 196] 
#[0 0 130 0 4 0 5 0 6 0 9 0 10 0 16 0 19 0 21 0 22 0 25 0 26 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 58 0 59 0 64 0 65 0 66 0 67 0 70 0 80 0 82 0 84 0 86 0 196] 
#[1 0 134 0 4 0 134 0 5 0 134 0 6 0 134 0 9 0 134 0 10 0 134 0 16 0 134 0 19 0 134 0 20 0 134 0 21 0 134 0 22 0 134 0 25 0 134 0 26 0 134 0 27 0 134 0 28 0 134 0 29 0 134 0 30 0 134 0 31 0 134 0 32 0 134 0 33 0 134 0 34 0 134 0 35 0 134 0 36 0 134 0 37 0 134 0 38 0 134 0 40 0 134 0 41 0 134 0 42 0 134 0 43 0 134 0 44 0 134 0 45 0 134 0 46 0 134 0 48 0 134 0 50 0 134 0 51 0 134 0 52 0 134 0 53 0 134 0 54 0 134 0 55 0 134 0 57 0 134 0 58 0 134 0 59 0 134 0 64 0 134 0 65 0 134 0 66 0 134 0 67 0 134 0 70 0 134 0 80 0 134 0 81 0 134 0 82 0 134 0 83 0 134 0 84 0 134 0 86 2 237 0 173 0 134 0 196] 
#[0 0 138 0 4 0 5 0 6 0 9 0 10 0 16 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 58 0 59 0 64 0 65 0 66 0 67 0 70 0 80 0 81 0 82 0 83 0 84 0 86 0 196] 
#[0 0 0 0 196] 
#[0 0 90 0 5 0 6 0 9 0 10 0 16 0 21 0 22 0 25 0 26 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 46 0 55 0 80 0 82 0 84 0 86 0 196] 
#[1 0 142 0 5 0 142 0 6 0 142 0 9 0 142 0 10 0 142 0 16 0 142 0 21 0 142 0 22 0 142 0 25 0 142 0 26 0 142 0 28 0 142 0 29 0 142 0 30 0 142 0 31 0 142 0 32 0 142 0 33 0 142 0 34 0 142 0 35 2 241 0 36 2 245 0 41 2 249 0 42 2 253 0 45 0 142 0 46 3 1 0 52 3 5 0 54 0 142 0 55 0 142 0 57 3 9 0 58 0 142 0 59 3 13 0 64 3 17 0 65 0 142 0 66 3 21 0 67 0 142 0 70 0 142 0 80 0 142 0 82 0 142 0 84 0 142 0 86 3 25 0 164 0 142 0 196] 
#[1 0 146 0 80 3 29 0 88 0 146 0 196] 
#[0 0 0 0 196] 
#[0 0 150 0 1 0 2 0 3 0 7 0 8 0 11 0 12 0 13 0 14 0 15 0 17 0 18 0 23 0 24 0 39 0 44 0 46 0 47 0 49 0 53 0 55 0 56 0 59 0 62 0 63 0 65 0 68 0 71 0 72 0 73 0 80 0 81 0 83 0 85 0 196] 
#[0 0 154 0 1 0 2 0 3 0 7 0 8 0 11 0 12 0 13 0 14 0 15 0 17 0 18 0 23 0 24 0 39 0 44 0 46 0 47 0 49 0 53 0 55 0 56 0 59 0 62 0 63 0 65 0 68 0 71 0 72 0 73 0 80 0 81 0 83 0 85 0 196] 
#[0 0 158 0 1 0 2 0 3 0 7 0 8 0 11 0 12 0 13 0 14 0 15 0 17 0 18 0 23 0 24 0 39 0 44 0 46 0 47 0 49 0 53 0 55 0 56 0 59 0 62 0 63 0 65 0 68 0 71 0 72 0 73 0 80 0 81 0 83 0 85 0 196 0 201] 
#[0 0 158 0 1 0 2 0 3 0 7 0 8 0 11 0 12 0 13 0 14 0 15 0 17 0 18 0 23 0 24 0 39 0 44 0 46 0 47 0 49 0 53 0 55 0 56 0 59 0 62 0 63 0 65 0 68 0 71 0 72 0 73 0 80 0 81 0 83 0 85 0 196 0 201] 
#[0 0 162 0 26 0 80] 
#[1 3 33 0 22 0 62 0 26 0 62 0 36 0 62 0 80 3 37 0 105] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 3 41 0 87 0 185 0 106 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 1 89 0 199] 
#[0 0 166 0 25 0 26 0 80 0 82] 
#[0 0 170 0 26 0 80] 
#[0 0 174 0 22 0 26 0 80] 
#[1 3 45 0 22 0 178 0 26 0 178 0 80] 
#[0 0 182 0 15 0 27 0 71] 
#[0 0 186 0 10 0 15 0 22 0 26 0 27 0 80 0 81] 
#[1 0 190 0 15 3 49 0 27] 
#[0 3 53 0 15] 
#[1 0 194 0 15 3 57 0 27 1 149 0 71 3 61 0 89] 
#[0 0 198 0 25 0 26 0 80 0 82] 
#[1 3 65 0 22 0 202 0 26 0 202 0 80] 
#[1 3 69 0 10 0 206 0 22 0 206 0 26 3 49 0 27 0 206 0 80] 
#[1 3 73 0 22 0 210 0 26 0 210 0 80] 
#[0 0 214 0 22 0 26 0 80] 
#[0 0 218 0 26 0 80] 
#[1 0 222 0 26 3 77 0 36 0 222 0 80] 
#[1 3 49 0 27 0 226 0 80 3 81 0 81 3 85 0 90] 
#[1 3 89 0 81 3 93 0 99] 
#[1 3 97 0 22 0 230 0 26 0 230 0 80] 
#[0 0 234 0 26 0 80] 
#[0 0 238 0 4 0 5 0 6 0 9 0 10 0 16 0 19 0 21 0 22 0 25 0 26 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 58 0 59 0 64 0 65 0 66 0 67 0 70 0 80 0 82 0 84 0 86 0 196] 
#[1 3 101 0 22 0 242 0 46] 
#[0 3 105 0 46] 
#[1 3 109 0 21 3 113 0 81] 
#[0 0 246 0 4 0 5 0 6 0 9 0 10 0 16 0 19 0 21 0 22 0 25 0 26 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 58 0 59 0 64 0 65 0 66 0 67 0 70 0 80 0 82 0 84 0 86 0 196] 
#[0 0 250 0 4 0 5 0 6 0 9 0 10 0 16 0 19 0 21 0 22 0 25 0 26 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 58 0 59 0 64 0 65 0 66 0 67 0 70 0 80 0 82 0 84 0 86 0 196] 
#[0 3 117 0 36] 
#[1 0 21 0 1 0 25 0 2 0 29 0 3 0 33 0 7 0 37 0 8 0 41 0 11 0 45 0 12 0 49 0 13 0 53 0 14 0 57 0 15 0 61 0 17 0 65 0 18 0 77 0 39 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 3 121 0 80 0 145 0 81 0 149 0 83 0 153 0 85 0 157 0 87 3 125 0 100 0 185 0 106 0 189 0 108 0 193 0 113 0 197 0 114 0 201 0 116 0 205 0 118 0 209 0 119 0 213 0 120 0 217 0 121 0 221 0 122 0 225 0 123 0 229 0 124 0 233 0 125 0 237 0 126 0 241 0 127 0 245 0 128 3 129 0 131 0 253 0 138 1 1 0 141 1 5 0 142 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 1 89 0 199] 
#[0 3 133 0 21] 
#[0 3 137 0 21] 
#[1 3 141 0 10 0 254 0 21 0 254 0 22] 
#[1 3 145 0 21 3 149 0 22] 
#[0 1 2 0 21 0 22] 
#[0 1 6 0 5 0 6 0 9 0 10 0 16 0 21 0 22 0 25 0 26 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 46 0 55 0 57 0 59 0 66 0 70 0 80 0 82 0 84 0 86 0 196] 
#[0 3 153 0 71] 
#[0 3 157 0 71] 
#[0 1 10 0 21 0 22 0 25 0 82] 
#[1 2 17 0 71 2 21 0 81 3 161 0 103 3 165 0 107] 
#[0 3 169 0 21] 
#[1 1 14 0 21 1 14 0 22 3 173 0 25 1 14 0 82 3 177 0 104] 
#[0 1 18 0 21 0 82] 
#[0 1 22 0 4 0 5 0 6 0 9 0 10 0 16 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 58 0 59 0 64 0 65 0 66 0 67 0 70 0 80 0 81 0 82 0 83 0 84 0 86 0 196] 
#[0 1 26 0 4 0 5 0 6 0 9 0 10 0 16 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 58 0 59 0 64 0 65 0 66 0 67 0 70 0 80 0 81 0 82 0 83 0 84 0 86 0 196] 
#[0 1 30 0 82] 
#[1 2 165 0 22 3 181 0 55 0 62 0 82 2 169 0 105 3 185 0 183] 
#[0 3 189 0 82] 
#[0 3 193 0 82] 
#[0 1 34 0 4 0 5 0 6 0 9 0 10 0 16 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 58 0 59 0 64 0 65 0 66 0 67 0 70 0 80 0 81 0 82 0 83 0 84 0 86 0 196] 
#[0 1 38 0 84] 
#[1 2 165 0 22 3 197 0 55 0 62 0 84 2 169 0 105 3 201 0 182] 
#[0 3 205 0 84] 
#[0 1 42 0 4 0 5 0 6 0 9 0 10 0 16 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 58 0 59 0 64 0 65 0 66 0 67 0 70 0 80 0 81 0 82 0 83 0 84 0 86 0 196] 
#[0 1 46 0 86] 
#[1 3 209 0 21 2 165 0 22 3 181 0 55 0 62 0 86 2 169 0 105 3 213 0 183] 
#[0 3 217 0 86] 
#[0 1 50 0 13 0 44 0 46 0 49 0 53 0 65 0 68 0 71 0 72 0 73 0 81 0 83 0 85] 
#[0 1 50 0 13 0 44 0 46 0 49 0 53 0 65 0 68 0 71 0 72 0 73 0 81 0 83 0 85] 
#[0 1 50 0 13 0 44 0 46 0 49 0 53 0 65 0 68 0 71 0 72 0 73 0 81 0 83 0 85] 
#[0 1 50 0 13 0 44 0 46 0 49 0 53 0 65 0 68 0 71 0 72 0 73 0 81 0 83 0 85] 
#[0 1 50 0 13 0 44 0 46 0 49 0 53 0 65 0 68 0 71 0 72 0 73 0 81 0 83 0 85] 
#[0 1 50 0 13 0 44 0 46 0 49 0 53 0 65 0 68 0 71 0 72 0 73 0 81 0 83 0 85] 
#[0 1 50 0 13 0 44 0 46 0 49 0 53 0 65 0 68 0 71 0 72 0 73 0 81 0 83 0 85] 
#[0 1 50 0 13 0 44 0 46 0 49 0 53 0 65 0 68 0 71 0 72 0 73 0 81 0 83 0 85] 
#[0 1 50 0 13 0 44 0 46 0 49 0 53 0 65 0 68 0 71 0 72 0 73 0 81 0 83 0 85] 
#[0 1 50 0 13 0 44 0 46 0 49 0 53 0 65 0 68 0 71 0 72 0 73 0 81 0 83 0 85] 
#[0 1 50 0 13 0 44 0 46 0 49 0 53 0 65 0 68 0 71 0 72 0 73 0 81 0 83 0 85] 
#[0 1 50 0 13 0 44 0 46 0 49 0 53 0 65 0 68 0 71 0 72 0 73 0 81 0 83 0 85] 
#[1 3 221 0 25 1 54 0 26 1 54 0 80] 
#[1 0 49 0 13 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 3 225 0 87 0 185 0 106 3 229 0 112 3 233 0 114 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 1 89 0 199] 
#[0 1 58 0 23 0 24 0 47] 
#[0 1 62 0 1 0 2 0 3 0 7 0 8 0 11 0 12 0 13 0 14 0 15 0 17 0 18 0 23 0 24 0 39 0 44 0 46 0 47 0 49 0 53 0 55 0 56 0 59 0 62 0 63 0 65 0 68 0 71 0 72 0 73 0 80 0 81 0 83 0 85 0 196 0 201] 
#[0 1 66 0 1 0 2 0 3 0 7 0 8 0 11 0 12 0 13 0 14 0 15 0 17 0 18 0 23 0 24 0 39 0 44 0 46 0 47 0 49 0 53 0 55 0 56 0 59 0 62 0 63 0 65 0 68 0 71 0 72 0 73 0 80 0 81 0 83 0 85 0 196 0 201] 
#[0 1 70 0 196] 
#[1 1 74 0 5 1 74 0 6 1 74 0 9 1 74 0 16 1 74 0 21 1 74 0 25 1 74 0 26 1 74 0 28 1 74 0 29 1 74 0 30 1 74 0 31 1 74 0 32 1 74 0 33 1 74 0 34 1 74 0 35 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 1 74 0 80 0 145 0 81 1 74 0 82 0 149 0 83 1 74 0 84 0 153 0 85 1 74 0 86 3 237 0 87 0 185 0 106 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 1 74 0 196 1 89 0 199] 
#[0 1 78 0 5 0 6 0 9 0 16 0 21 0 25 0 26 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 80 0 82 0 84 0 86 0 196] 
#[1 0 21 0 1 0 25 0 2 0 29 0 3 0 33 0 7 0 37 0 8 0 41 0 11 0 45 0 12 0 49 0 13 0 53 0 14 0 57 0 15 0 61 0 17 0 65 0 18 0 77 0 39 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 1 82 0 80 0 145 0 81 0 149 0 83 0 153 0 85 0 157 0 87 0 185 0 106 0 189 0 108 0 193 0 113 0 197 0 114 0 201 0 116 0 205 0 118 0 209 0 119 0 213 0 120 0 217 0 121 0 221 0 122 0 225 0 123 0 229 0 124 0 233 0 125 0 237 0 126 0 241 0 127 0 245 0 128 3 241 0 131 0 253 0 138 1 1 0 141 1 5 0 142 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 1 89 0 199] 
#[0 3 245 0 80] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 3 249 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 89 0 199] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 3 253 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 89 0 199] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 4 1 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 89 0 199] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 4 5 0 199] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 4 9 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 4 13 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 4 17 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 4 21 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 4 25 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 4 29 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 4 33 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 4 37 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 4 41 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 4 45 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180] 
#[1 1 86 0 4 1 86 0 5 1 86 0 6 1 86 0 9 1 86 0 10 1 86 0 16 1 86 0 19 4 49 0 20 1 86 0 21 1 86 0 22 1 86 0 25 1 86 0 26 4 53 0 27 1 86 0 28 1 86 0 29 1 86 0 30 1 86 0 31 1 86 0 32 1 86 0 33 1 86 0 34 1 86 0 35 1 86 0 36 1 86 0 37 1 86 0 38 1 86 0 40 1 86 0 41 1 86 0 42 1 86 0 43 1 86 0 44 1 86 0 45 1 86 0 46 1 86 0 48 1 86 0 50 1 86 0 51 1 86 0 52 1 86 0 53 1 86 0 54 1 86 0 55 1 86 0 57 1 86 0 58 1 86 0 59 1 86 0 64 1 86 0 65 1 86 0 66 1 86 0 67 1 86 0 70 1 86 0 80 4 57 0 81 1 86 0 82 4 61 0 83 1 86 0 84 1 86 0 86 4 65 0 174 1 86 0 196] 
#[0 1 90 0 44 0 46 0 49 0 53 0 71 0 72 0 73 0 81 0 83 0 85] 
#[0 1 94 0 44 0 46 0 49 0 53 0 71 0 72 0 73 0 81 0 83 0 85] 
#[0 1 98 0 44 0 46 0 49 0 53 0 71 0 72 0 73 0 81 0 83 0 85] 
#[0 1 102 0 44 0 46 0 49 0 53 0 71 0 72 0 73 0 81 0 83 0 85] 
#[1 1 106 0 44 1 106 0 46 1 106 0 49 1 106 0 53 4 69 0 65 1 106 0 71 1 106 0 72 1 106 0 73 1 106 0 81 1 106 0 83 1 106 0 85] 
#[0 1 110 0 44 0 46 0 49 0 53 0 71 0 72 0 73 0 81 0 83 0 85] 
#[0 1 114 0 44 0 46 0 49 0 53 0 71 0 72 0 73 0 81 0 83 0 85] 
#[0 1 118 0 44 0 46 0 49 0 53 0 71 0 72 0 73 0 81 0 83 0 85] 
#[0 4 73 0 36] 
#[0 1 122 0 44 0 46 0 49 0 53 0 71 0 72 0 73 0 81 0 83 0 85] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 4 77 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 89 0 199] 
#[1 4 81 0 80 1 126 0 196] 
#[1 1 74 0 26 1 74 0 36 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 129 0 71 0 133 0 72 0 137 0 73 1 74 0 80 0 145 0 81 0 149 0 83 0 153 0 85 4 85 0 117 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 121 0 199] 
#[0 1 130 0 26 0 36 0 80] 
#[0 1 134 0 26 0 80] 
#[0 4 89 0 71] 
#[0 4 93 0 71] 
#[1 4 97 0 19 4 101 0 71 4 105 0 81 4 109 0 133 4 113 0 134 4 117 0 136 4 121 0 179] 
#[0 1 138 0 15 0 27 0 71] 
#[1 1 142 0 15 3 49 0 27] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 4 125 0 106 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 1 89 0 199] 
#[0 4 129 0 71] 
#[1 1 149 0 71 1 173 0 89 4 133 0 135] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 1 201 0 106 4 137 0 140 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 1 89 0 199] 
#[1 4 141 0 19 4 145 0 20 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 1 146 0 82 0 149 0 83 0 153 0 85 4 149 0 92 4 153 0 93 4 157 0 106 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 4 161 0 190 1 89 0 199] 
#[0 4 165 0 80] 
#[1 2 9 0 19 2 13 0 20 2 17 0 71 2 21 0 81 0 30 0 82 4 169 0 101 2 29 0 103 2 33 0 203] 
#[0 4 173 0 21] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 4 177 0 106 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 1 89 0 199] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 1 213 0 106 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 4 181 0 178 1 77 0 180 1 85 0 184 1 89 0 199] 
#[0 1 150 0 4 0 5 0 6 0 9 0 10 0 16 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 58 0 59 0 64 0 65 0 66 0 67 0 70 0 80 0 81 0 82 0 83 0 84 0 86 0 196] 
#[1 0 21 0 1 0 25 0 2 0 29 0 3 0 33 0 7 0 37 0 8 0 41 0 11 0 45 0 12 0 49 0 13 0 53 0 14 0 57 0 15 0 61 0 17 0 65 0 18 0 77 0 39 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 3 121 0 80 0 145 0 81 0 149 0 83 0 153 0 85 0 157 0 87 4 185 0 100 0 185 0 106 0 189 0 108 0 193 0 113 0 197 0 114 0 201 0 116 0 205 0 118 0 209 0 119 0 213 0 120 0 217 0 121 0 221 0 122 0 225 0 123 0 229 0 124 0 233 0 125 0 237 0 126 0 241 0 127 0 245 0 128 3 129 0 131 0 253 0 138 1 1 0 141 1 5 0 142 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 1 89 0 199] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 14 0 82 0 149 0 83 0 153 0 85 1 129 0 87 0 185 0 106 4 189 0 115 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 1 89 0 199] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 4 193 0 87 0 185 0 106 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 1 89 0 199] 
#[0 4 197 0 202] 
#[1 4 201 0 61 4 205 0 69 4 209 0 150 4 213 0 152] 
#[0 1 154 0 1 0 2 0 3 0 7 0 8 0 11 0 12 0 13 0 14 0 15 0 17 0 18 0 23 0 24 0 39 0 44 0 46 0 47 0 49 0 53 0 55 0 56 0 57 0 59 0 60 0 61 0 62 0 63 0 65 0 68 0 69 0 71 0 72 0 73 0 80 0 81 0 83 0 85 0 196 0 201] 
#[1 0 21 0 1 0 25 0 2 0 29 0 3 0 33 0 7 0 37 0 8 0 41 0 11 0 45 0 12 0 49 0 13 0 53 0 14 0 57 0 15 0 61 0 17 0 65 0 18 0 77 0 39 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 3 121 0 80 0 145 0 81 0 149 0 83 0 153 0 85 0 157 0 87 4 217 0 100 0 185 0 106 0 189 0 108 0 193 0 113 0 197 0 114 0 201 0 116 0 205 0 118 0 209 0 119 0 213 0 120 0 217 0 121 0 221 0 122 0 225 0 123 0 229 0 124 0 233 0 125 0 237 0 126 0 241 0 127 0 245 0 128 3 129 0 131 0 253 0 138 1 1 0 141 1 5 0 142 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 1 89 0 199] 
#[1 0 21 0 1 0 25 0 2 0 29 0 3 0 33 0 7 0 37 0 8 0 41 0 11 0 45 0 12 0 49 0 13 0 53 0 14 0 57 0 15 0 61 0 17 0 65 0 18 0 77 0 39 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 3 121 0 80 0 145 0 81 0 149 0 83 0 153 0 85 0 157 0 87 4 221 0 100 0 185 0 106 0 189 0 108 0 193 0 113 0 197 0 114 0 201 0 116 0 205 0 118 0 209 0 119 0 213 0 120 0 217 0 121 0 221 0 122 0 225 0 123 0 229 0 124 0 233 0 125 0 237 0 126 0 241 0 127 0 245 0 128 3 129 0 131 0 253 0 138 1 1 0 141 1 5 0 142 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 1 89 0 199] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 4 225 0 199] 
#[1 0 21 0 1 0 25 0 2 0 29 0 3 0 33 0 7 0 37 0 8 0 41 0 11 0 45 0 12 0 49 0 13 0 53 0 14 0 57 0 15 0 61 0 17 0 65 0 18 0 77 0 39 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 3 121 0 80 0 145 0 81 0 149 0 83 0 153 0 85 0 157 0 87 4 229 0 100 0 185 0 106 0 189 0 108 0 193 0 113 0 197 0 114 0 201 0 116 0 205 0 118 0 209 0 119 0 213 0 120 0 217 0 121 0 221 0 122 0 225 0 123 0 229 0 124 0 233 0 125 0 237 0 126 0 241 0 127 0 245 0 128 3 129 0 131 0 253 0 138 1 1 0 141 1 5 0 142 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 1 89 0 199] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 1 249 0 106 4 233 0 154 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 1 89 0 199] 
#[1 1 158 0 21 4 237 0 22 1 158 0 82] 
#[0 1 162 0 21 0 82] 
#[1 4 241 0 22 0 62 0 82 4 245 0 105] 
#[0 4 249 0 82] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 4 253 0 106 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 1 89 0 199] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 5 1 0 106 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 1 89 0 199] 
#[1 0 62 0 21 5 5 0 22 0 62 0 82 5 9 0 105] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 5 13 0 117 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 121 0 199] 
#[0 1 166 0 82] 
#[0 1 170 0 4 0 5 0 6 0 9 0 10 0 16 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 58 0 59 0 64 0 65 0 66 0 67 0 70 0 80 0 81 0 82 0 83 0 84 0 86 0 196] 
#[0 1 170 0 4 0 5 0 6 0 9 0 10 0 16 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 58 0 59 0 64 0 65 0 66 0 67 0 70 0 80 0 81 0 82 0 83 0 84 0 86 0 196] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 5 17 0 117 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 121 0 199] 
#[0 1 174 0 84] 
#[0 1 178 0 4 0 5 0 6 0 9 0 10 0 16 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 58 0 59 0 64 0 65 0 66 0 67 0 70 0 80 0 81 0 82 0 83 0 84 0 86 0 196] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 5 21 0 106 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 1 89 0 199] 
#[0 1 182 0 86] 
#[0 1 186 0 4 0 5 0 6 0 9 0 10 0 16 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 58 0 59 0 64 0 65 0 66 0 67 0 70 0 80 0 81 0 82 0 83 0 84 0 86 0 196] 
#[1 0 49 0 13 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 3 225 0 87 0 185 0 106 5 25 0 112 3 233 0 114 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 1 89 0 199] 
#[0 1 190 0 25 0 26 0 80] 
#[0 1 194 0 26 0 80] 
#[0 1 190 0 25 0 26 0 80] 
#[0 1 198 0 5 0 6 0 9 0 16 0 21 0 25 0 26 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 80 0 82 0 84 0 86 0 196] 
#[0 1 202 0 1 0 2 0 3 0 7 0 8 0 11 0 12 0 13 0 14 0 15 0 17 0 18 0 23 0 24 0 39 0 44 0 46 0 47 0 49 0 53 0 55 0 56 0 57 0 59 0 60 0 61 0 62 0 63 0 65 0 68 0 69 0 71 0 72 0 73 0 80 0 81 0 83 0 85 0 196 0 201] 
#[0 1 206 0 1 0 2 0 3 0 7 0 8 0 11 0 12 0 13 0 14 0 15 0 17 0 18 0 23 0 24 0 39 0 44 0 46 0 47 0 49 0 53 0 55 0 56 0 57 0 59 0 60 0 61 0 62 0 63 0 65 0 68 0 69 0 71 0 72 0 73 0 80 0 81 0 83 0 85 0 196 0 201] 
#[0 5 29 0 57] 
#[0 1 210 0 5 0 6 0 9 0 10 0 16 0 21 0 22 0 25 0 26 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 46 0 55 0 57 0 59 0 80 0 82 0 84 0 86 0 196] 
#[0 1 214 0 5 0 6 0 9 0 10 0 16 0 21 0 22 0 25 0 26 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 46 0 55 0 57 0 59 0 70 0 80 0 82 0 84 0 86 0 196] 
#[0 1 218 0 5 0 6 0 9 0 10 0 16 0 21 0 22 0 25 0 26 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 41 0 42 0 45 0 46 0 52 0 54 0 55 0 57 0 58 0 59 0 64 0 65 0 66 0 67 0 70 0 80 0 82 0 84 0 86 0 196] 
#[0 1 222 0 5 0 6 0 9 0 10 0 16 0 21 0 22 0 25 0 26 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 40 0 41 0 42 0 45 0 46 0 52 0 54 0 55 0 57 0 58 0 59 0 64 0 65 0 66 0 67 0 70 0 80 0 82 0 84 0 86 0 196] 
#[0 1 226 0 5 0 6 0 9 0 10 0 16 0 21 0 22 0 25 0 26 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 40 0 41 0 42 0 45 0 46 0 52 0 54 0 55 0 57 0 58 0 59 0 64 0 65 0 66 0 67 0 70 0 80 0 82 0 84 0 86 0 196] 
#[0 1 230 0 5 0 6 0 9 0 10 0 16 0 21 0 22 0 25 0 26 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 40 0 41 0 42 0 45 0 46 0 52 0 54 0 55 0 57 0 58 0 59 0 64 0 65 0 66 0 67 0 70 0 80 0 82 0 84 0 86 0 196] 
#[0 1 234 0 5 0 6 0 9 0 10 0 16 0 21 0 22 0 25 0 26 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 40 0 41 0 42 0 45 0 46 0 52 0 54 0 55 0 57 0 58 0 59 0 64 0 65 0 66 0 67 0 70 0 80 0 82 0 84 0 86 0 196] 
#[0 1 238 0 4 0 5 0 6 0 9 0 10 0 16 0 21 0 22 0 25 0 26 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 40 0 41 0 42 0 43 0 45 0 46 0 52 0 54 0 55 0 57 0 58 0 59 0 64 0 65 0 66 0 67 0 70 0 80 0 82 0 84 0 86 0 196] 
#[0 1 242 0 4 0 5 0 6 0 9 0 10 0 16 0 21 0 22 0 25 0 26 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 40 0 41 0 42 0 43 0 45 0 46 0 52 0 54 0 55 0 57 0 58 0 59 0 64 0 65 0 66 0 67 0 70 0 80 0 82 0 84 0 86 0 196] 
#[0 1 246 0 4 0 5 0 6 0 9 0 10 0 16 0 21 0 22 0 25 0 26 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 52 0 53 0 54 0 55 0 57 0 58 0 59 0 64 0 65 0 66 0 67 0 70 0 80 0 82 0 84 0 86 0 196] 
#[0 1 250 0 4 0 5 0 6 0 9 0 10 0 16 0 21 0 22 0 25 0 26 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 52 0 53 0 54 0 55 0 57 0 58 0 59 0 64 0 65 0 66 0 67 0 70 0 80 0 82 0 84 0 86 0 196] 
#[0 1 254 0 4 0 5 0 6 0 9 0 10 0 16 0 21 0 22 0 25 0 26 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 52 0 53 0 54 0 55 0 57 0 58 0 59 0 64 0 65 0 66 0 67 0 70 0 80 0 82 0 84 0 86 0 196] 
#[0 2 2 0 4 0 5 0 6 0 9 0 10 0 16 0 21 0 22 0 25 0 26 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 52 0 53 0 54 0 55 0 57 0 58 0 59 0 64 0 65 0 66 0 67 0 70 0 80 0 82 0 84 0 86 0 196] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 5 33 0 170 1 69 0 171 1 73 0 172 1 77 0 180] 
#[0 5 37 0 71] 
#[1 4 141 0 19 4 145 0 20 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 5 41 0 82 0 149 0 83 0 153 0 85 5 45 0 93 4 157 0 106 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 4 161 0 190 1 89 0 199] 
#[1 2 6 0 21 5 49 0 27 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 5 53 0 106 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 5 57 0 185 5 61 0 186 5 65 0 187 1 89 0 199] 
#[0 2 10 0 4 0 5 0 6 0 9 0 10 0 16 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 58 0 59 0 64 0 65 0 66 0 67 0 70 0 80 0 81 0 82 0 83 0 84 0 86 0 196] 
#[0 2 14 0 44 0 46 0 49 0 53 0 71 0 72 0 73 0 81 0 83 0 85] 
#[0 2 18 0 44 0 46 0 49 0 53 0 71 0 72 0 73 0 81 0 83 0 85] 
#[0 2 22 0 5 0 6 0 9 0 10 0 16 0 21 0 22 0 25 0 26 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 46 0 55 0 57 0 59 0 66 0 70 0 80 0 82 0 84 0 86 0 196] 
#[0 2 26 0 80 0 196] 
#[0 2 30 0 26 0 36 0 80] 
#[0 2 34 0 22 0 26 0 80] 
#[0 2 38 0 10 0 15 0 22 0 26 0 27 0 80 0 81] 
#[0 2 42 0 26 0 80] 
#[1 5 69 0 10 2 46 0 22 2 46 0 26 2 46 0 80 2 46 0 82] 
#[1 4 101 0 71 5 73 0 133 4 113 0 134 4 117 0 136] 
#[0 2 50 0 26 0 80] 
#[0 2 54 0 22 0 26 0 80 0 82] 
#[1 5 77 0 22 0 62 0 26 0 62 0 80 0 62 0 82 5 81 0 105] 
#[0 2 58 0 26 0 80] 
#[1 5 85 0 22 2 62 0 26 2 62 0 80] 
#[0 2 66 0 22 0 26 0 80] 
#[0 2 70 0 22 0 26 0 80] 
#[0 2 74 0 26 0 80] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 5 89 0 106 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 1 89 0 199] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 5 93 0 106 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 1 89 0 199] 
#[0 5 97 0 82] 
#[0 2 78 0 82] 
#[1 2 82 0 22 5 101 0 25 3 181 0 55 2 82 0 82 5 105 0 183] 
#[1 5 109 0 22 0 62 0 82 5 113 0 105] 
#[0 2 86 0 23 0 24 0 47] 
#[0 5 117 0 82] 
#[1 0 21 0 1 0 25 0 2 0 29 0 3 0 33 0 7 0 37 0 8 0 41 0 11 0 45 0 12 0 49 0 13 0 53 0 14 0 57 0 15 0 61 0 17 0 65 0 18 0 77 0 39 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 3 121 0 80 0 145 0 81 0 149 0 83 0 153 0 85 0 157 0 87 5 121 0 100 0 185 0 106 0 189 0 108 0 193 0 113 0 197 0 114 0 201 0 116 0 205 0 118 0 209 0 119 0 213 0 120 0 217 0 121 0 221 0 122 0 225 0 123 0 229 0 124 0 233 0 125 0 237 0 126 0 241 0 127 0 245 0 128 3 129 0 131 0 253 0 138 1 1 0 141 1 5 0 142 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 1 89 0 199] 
#[0 2 90 0 26 0 80] 
#[0 2 94 0 46] 
#[0 2 98 0 1 0 2 0 3 0 7 0 8 0 11 0 12 0 13 0 14 0 15 0 17 0 18 0 23 0 24 0 39 0 44 0 46 0 47 0 49 0 53 0 55 0 56 0 59 0 62 0 63 0 65 0 68 0 71 0 72 0 73 0 80 0 81 0 83 0 85 0 196 0 201] 
#[0 5 125 0 82] 
#[0 5 129 0 21] 
#[1 0 21 0 1 0 25 0 2 0 29 0 3 0 33 0 7 0 37 0 8 0 41 0 11 0 45 0 12 0 49 0 13 0 53 0 14 0 57 0 15 0 61 0 17 0 65 0 18 0 69 0 23 0 73 0 24 0 77 0 39 0 81 0 44 0 85 0 46 0 89 0 47 0 93 0 49 0 97 0 53 0 101 0 55 0 105 0 56 0 109 0 59 0 113 0 62 0 117 0 63 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 0 157 0 87 0 161 0 91 0 165 0 94 0 169 0 95 0 173 0 96 0 177 0 97 5 133 0 98 1 109 0 102 0 185 0 106 0 189 0 108 0 193 0 113 0 197 0 114 0 201 0 116 0 205 0 118 0 209 0 119 0 213 0 120 0 217 0 121 0 221 0 122 0 225 0 123 0 229 0 124 0 233 0 125 0 237 0 126 0 241 0 127 0 245 0 128 1 113 0 131 0 253 0 138 1 1 0 141 1 5 0 142 1 9 0 143 1 13 0 144 1 17 0 145 1 21 0 146 1 25 0 147 5 137 0 155 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 1 89 0 199] 
#[0 5 141 0 21] 
#[1 2 102 0 21 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 5 145 0 106 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 1 89 0 199] 
#[1 2 106 0 1 2 106 0 2 2 106 0 3 2 106 0 7 2 106 0 8 2 106 0 11 2 106 0 12 2 106 0 13 2 106 0 14 2 106 0 15 2 106 0 17 2 106 0 18 2 106 0 23 2 106 0 24 2 106 0 39 2 106 0 44 2 106 0 46 2 106 0 47 2 106 0 49 2 106 0 53 2 106 0 55 2 106 0 56 5 149 0 57 2 106 0 59 2 106 0 61 2 106 0 62 2 106 0 63 2 106 0 65 2 106 0 68 4 205 0 69 2 106 0 71 2 106 0 72 2 106 0 73 2 106 0 80 2 106 0 81 2 106 0 83 2 106 0 85 5 153 0 149 5 157 0 152 2 106 0 196 2 106 0 201] 
#[0 5 161 0 21] 
#[1 2 110 0 1 2 110 0 2 2 110 0 3 2 110 0 7 2 110 0 8 2 110 0 11 2 110 0 12 2 110 0 13 2 110 0 14 2 110 0 15 2 110 0 17 2 110 0 18 2 110 0 23 2 110 0 24 2 110 0 39 2 110 0 44 2 110 0 46 2 110 0 47 2 110 0 49 2 110 0 53 2 110 0 55 2 110 0 56 2 110 0 57 2 110 0 59 2 110 0 60 2 110 0 62 2 110 0 63 2 110 0 65 2 110 0 68 2 110 0 71 2 110 0 72 2 110 0 73 2 110 0 80 2 110 0 81 2 110 0 83 2 110 0 85 5 165 0 148 2 110 0 196 2 110 0 201] 
#[1 2 106 0 1 2 106 0 2 2 106 0 3 2 106 0 7 2 106 0 8 2 106 0 11 2 106 0 12 2 106 0 13 2 106 0 14 2 106 0 15 2 106 0 17 2 106 0 18 2 106 0 23 2 106 0 24 2 106 0 39 2 106 0 44 2 106 0 46 2 106 0 47 2 106 0 49 2 106 0 53 2 106 0 55 2 106 0 56 5 149 0 57 2 106 0 59 2 106 0 62 2 106 0 63 2 106 0 65 2 106 0 68 2 106 0 71 2 106 0 72 2 106 0 73 2 106 0 80 2 106 0 81 2 106 0 83 2 106 0 85 5 169 0 149 2 106 0 196 2 106 0 201] 
#[0 2 114 0 21 0 22] 
#[0 2 118 0 1 0 2 0 3 0 7 0 8 0 11 0 12 0 13 0 14 0 15 0 17 0 18 0 23 0 24 0 39 0 44 0 46 0 47 0 49 0 53 0 55 0 56 0 59 0 62 0 63 0 65 0 68 0 71 0 72 0 73 0 80 0 81 0 83 0 85 0 196 0 201] 
#[0 2 122 0 21 0 22] 
#[0 5 173 0 20] 
#[1 2 17 0 71 2 21 0 81 1 74 0 82 3 161 0 103 5 177 0 107] 
#[0 2 126 0 82] 
#[0 2 130 0 21 0 22 0 25 0 82] 
#[0 2 134 0 5 0 6 0 9 0 10 0 16 0 21 0 22 0 25 0 26 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 46 0 55 0 80 0 82 0 84 0 86 0 196] 
#[0 2 138 0 21 0 22 0 82] 
#[1 2 9 0 19 2 13 0 20 1 74 0 21 2 17 0 71 2 21 0 81 1 74 0 82 2 29 0 103 5 181 0 203] 
#[0 2 142 0 21 0 82] 
#[0 5 185 0 36] 
#[0 5 189 0 36] 
#[1 5 193 0 22 3 181 0 55 0 62 0 86 5 197 0 105 5 201 0 183 5 205 0 189] 
#[0 2 146 0 25 0 26 0 80] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 5 209 0 106 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 1 89 0 199] 
#[0 2 150 0 4 0 5 0 6 0 9 0 10 0 16 0 19 0 21 0 22 0 25 0 26 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 58 0 59 0 64 0 65 0 66 0 67 0 70 0 80 0 82 0 84 0 86 0 196] 
#[0 2 154 0 4 0 5 0 6 0 9 0 10 0 16 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 58 0 59 0 64 0 65 0 66 0 67 0 70 0 80 0 81 0 82 0 83 0 84 0 86 0 196] 
#[0 2 158 0 4 0 5 0 6 0 9 0 10 0 16 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 58 0 59 0 64 0 65 0 66 0 67 0 70 0 80 0 81 0 82 0 83 0 84 0 86 0 196] 
#[0 5 213 0 82] 
#[0 5 217 0 27] 
#[1 2 162 0 21 2 166 0 22 2 166 0 84] 
#[0 5 221 0 84] 
#[1 5 225 0 22 0 62 0 84 5 229 0 105] 
#[0 5 233 0 21] 
#[0 5 237 0 71] 
#[0 5 241 0 82] 
#[1 1 74 0 26 4 101 0 71 1 74 0 80 1 74 0 82 5 245 0 134] 
#[0 2 170 0 26 0 80 0 82] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 5 249 0 106 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 1 89 0 199] 
#[1 5 253 0 22 2 174 0 82 6 1 0 191] 
#[0 2 178 0 82] 
#[0 2 182 0 80] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 6 5 0 106 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 1 89 0 199] 
#[0 2 186 0 22 0 82] 
#[1 4 141 0 19 4 145 0 20 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 1 74 0 82 0 149 0 83 0 153 0 85 6 9 0 93 4 157 0 106 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 4 161 0 190 1 89 0 199] 
#[0 2 190 0 82] 
#[0 2 194 0 21] 
#[0 2 198 0 1 0 2 0 3 0 7 0 8 0 11 0 12 0 13 0 14 0 15 0 17 0 18 0 23 0 24 0 39 0 44 0 46 0 47 0 49 0 53 0 55 0 56 0 59 0 62 0 63 0 65 0 68 0 71 0 72 0 73 0 80 0 81 0 83 0 85 0 196 0 201] 
#[0 6 13 0 21] 
#[1 0 21 0 1 0 25 0 2 0 29 0 3 0 33 0 7 0 37 0 8 0 41 0 11 0 45 0 12 0 49 0 13 0 53 0 14 0 57 0 15 0 61 0 17 0 65 0 18 0 77 0 39 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 3 121 0 80 0 145 0 81 0 149 0 83 0 153 0 85 0 157 0 87 6 17 0 100 0 185 0 106 0 189 0 108 0 193 0 113 0 197 0 114 0 201 0 116 0 205 0 118 0 209 0 119 0 213 0 120 0 217 0 121 0 221 0 122 0 225 0 123 0 229 0 124 0 233 0 125 0 237 0 126 0 241 0 127 0 245 0 128 3 129 0 131 0 253 0 138 1 1 0 141 1 5 0 142 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 1 89 0 199] 
#[0 2 202 0 1 0 2 0 3 0 7 0 8 0 11 0 12 0 13 0 14 0 15 0 17 0 18 0 23 0 24 0 39 0 44 0 46 0 47 0 49 0 53 0 55 0 56 0 59 0 62 0 63 0 65 0 68 0 71 0 72 0 73 0 81 0 83 0 85 0 201] 
#[1 0 21 0 1 0 25 0 2 0 29 0 3 0 33 0 7 0 37 0 8 0 41 0 11 0 45 0 12 0 49 0 13 0 53 0 14 0 57 0 15 0 61 0 17 0 65 0 18 0 69 0 23 0 73 0 24 0 77 0 39 0 81 0 44 0 85 0 46 0 89 0 47 0 93 0 49 0 97 0 53 0 101 0 55 0 105 0 56 0 109 0 59 0 113 0 62 0 117 0 63 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 0 157 0 87 0 161 0 91 0 165 0 94 0 169 0 95 0 173 0 96 0 177 0 97 6 21 0 98 1 109 0 102 0 185 0 106 0 189 0 108 0 193 0 113 0 197 0 114 0 201 0 116 0 205 0 118 0 209 0 119 0 213 0 120 0 217 0 121 0 221 0 122 0 225 0 123 0 229 0 124 0 233 0 125 0 237 0 126 0 241 0 127 0 245 0 128 1 113 0 131 0 253 0 138 1 1 0 141 1 5 0 142 1 9 0 143 1 13 0 144 1 17 0 145 1 21 0 146 1 25 0 147 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 1 89 0 199 6 25 0 201] 
#[1 0 21 0 1 0 25 0 2 0 29 0 3 0 33 0 7 0 37 0 8 0 41 0 11 0 45 0 12 0 49 0 13 0 53 0 14 0 57 0 15 0 61 0 17 0 65 0 18 0 77 0 39 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 3 121 0 80 0 145 0 81 0 149 0 83 0 153 0 85 0 157 0 87 6 29 0 100 0 185 0 106 0 189 0 108 0 193 0 113 0 197 0 114 0 201 0 116 0 205 0 118 0 209 0 119 0 213 0 120 0 217 0 121 0 221 0 122 0 225 0 123 0 229 0 124 0 233 0 125 0 237 0 126 0 241 0 127 0 245 0 128 3 129 0 131 0 253 0 138 1 1 0 141 1 5 0 142 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 1 89 0 199] 
#[1 6 33 0 10 2 206 0 21 6 37 0 22] 
#[0 6 41 0 21] 
#[1 2 210 0 1 2 210 0 2 2 210 0 3 2 210 0 7 2 210 0 8 2 210 0 11 2 210 0 12 2 210 0 13 2 210 0 14 2 210 0 15 2 210 0 17 2 210 0 18 2 210 0 23 2 210 0 24 2 210 0 39 2 210 0 44 2 210 0 46 2 210 0 47 2 210 0 49 2 210 0 53 2 210 0 55 2 210 0 56 2 210 0 59 6 45 0 61 2 210 0 62 2 210 0 63 2 210 0 65 2 210 0 68 2 210 0 71 2 210 0 72 2 210 0 73 2 210 0 80 2 210 0 81 2 210 0 83 2 210 0 85 6 49 0 151 2 210 0 196 2 210 0 201] 
#[0 6 53 0 21] 
#[1 0 21 0 1 0 25 0 2 0 29 0 3 0 33 0 7 0 37 0 8 0 41 0 11 0 45 0 12 0 49 0 13 0 53 0 14 0 57 0 15 0 61 0 17 0 65 0 18 0 77 0 39 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 3 121 0 80 0 145 0 81 0 149 0 83 0 153 0 85 0 157 0 87 6 57 0 100 0 185 0 106 0 189 0 108 0 193 0 113 0 197 0 114 0 201 0 116 0 205 0 118 0 209 0 119 0 213 0 120 0 217 0 121 0 221 0 122 0 225 0 123 0 229 0 124 0 233 0 125 0 237 0 126 0 241 0 127 0 245 0 128 3 129 0 131 0 253 0 138 1 1 0 141 1 5 0 142 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 1 89 0 199] 
#[1 2 106 0 1 2 106 0 2 2 106 0 3 2 106 0 7 2 106 0 8 2 106 0 11 2 106 0 12 2 106 0 13 2 106 0 14 2 106 0 15 2 106 0 17 2 106 0 18 2 106 0 23 2 106 0 24 2 106 0 39 2 106 0 44 2 106 0 46 2 106 0 47 2 106 0 49 2 106 0 53 2 106 0 55 2 106 0 56 5 149 0 57 2 106 0 59 6 61 0 60 2 106 0 62 2 106 0 63 2 106 0 65 2 106 0 68 2 106 0 71 2 106 0 72 2 106 0 73 2 106 0 80 2 106 0 81 2 106 0 83 2 106 0 85 6 65 0 149 2 106 0 196 2 106 0 201] 
#[0 2 214 0 1 0 2 0 3 0 7 0 8 0 11 0 12 0 13 0 14 0 15 0 17 0 18 0 23 0 24 0 39 0 44 0 46 0 47 0 49 0 53 0 55 0 56 0 59 0 62 0 63 0 65 0 68 0 71 0 72 0 73 0 80 0 81 0 83 0 85 0 196 0 201] 
#[0 6 69 0 71] 
#[0 2 218 0 82] 
#[0 2 222 0 21 0 82] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 6 73 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 89 0 199] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 6 77 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 6 81 0 156 6 85 0 158 6 89 0 159 6 93 0 160 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 89 0 199] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 1 74 0 86 6 97 0 106 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 1 89 0 199] 
#[0 2 226 0 86] 
#[0 2 230 0 86] 
#[0 2 234 0 86] 
#[0 2 238 0 5 0 6 0 9 0 10 0 16 0 21 0 22 0 25 0 26 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 46 0 55 0 80 0 82 0 84 0 86 0 196] 
#[0 2 242 0 4 0 5 0 6 0 9 0 10 0 16 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 58 0 59 0 64 0 65 0 66 0 67 0 70 0 80 0 81 0 82 0 83 0 84 0 86 0 196] 
#[0 6 101 0 27] 
#[0 2 246 0 4 0 5 0 6 0 9 0 10 0 16 0 19 0 20 0 21 0 22 0 25 0 26 0 27 0 28 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 48 0 50 0 51 0 52 0 53 0 54 0 55 0 57 0 58 0 59 0 64 0 65 0 66 0 67 0 70 0 80 0 81 0 82 0 83 0 84 0 86 0 196] 
#[1 2 6 0 21 5 49 0 27 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 1 74 0 84 0 153 0 85 5 53 0 106 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 6 105 0 185 5 61 0 186 5 65 0 187 1 89 0 199] 
#[0 2 250 0 84] 
#[1 2 6 0 21 2 6 0 22 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 2 6 0 84 0 153 0 85 6 109 0 106 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 6 113 0 187 1 89 0 199] 
#[0 2 254 0 22 0 26 0 80 0 82] 
#[0 3 2 0 26 0 80] 
#[0 3 6 0 22 0 26 0 80 0 82] 
#[0 3 10 0 26 0 80] 
#[1 6 117 0 20 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 4 157 0 106 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 6 121 0 190 1 89 0 199] 
#[0 3 14 0 82] 
#[0 3 18 0 22 0 82] 
#[0 3 22 0 82] 
#[1 0 21 0 1 0 25 0 2 0 29 0 3 0 33 0 7 0 37 0 8 0 41 0 11 0 45 0 12 0 49 0 13 0 53 0 14 0 57 0 15 0 61 0 17 0 65 0 18 0 77 0 39 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 3 121 0 80 0 145 0 81 0 149 0 83 0 153 0 85 0 157 0 87 6 125 0 100 0 185 0 106 0 189 0 108 0 193 0 113 0 197 0 114 0 201 0 116 0 205 0 118 0 209 0 119 0 213 0 120 0 217 0 121 0 221 0 122 0 225 0 123 0 229 0 124 0 233 0 125 0 237 0 126 0 241 0 127 0 245 0 128 3 129 0 131 0 253 0 138 1 1 0 141 1 5 0 142 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 1 89 0 199] 
#[1 2 106 0 1 2 106 0 2 2 106 0 3 2 106 0 7 2 106 0 8 2 106 0 11 2 106 0 12 2 106 0 13 2 106 0 14 2 106 0 15 2 106 0 17 2 106 0 18 2 106 0 23 2 106 0 24 2 106 0 39 2 106 0 44 2 106 0 46 2 106 0 47 2 106 0 49 2 106 0 53 2 106 0 55 2 106 0 56 5 149 0 57 2 106 0 59 2 106 0 62 2 106 0 63 2 106 0 65 2 106 0 68 2 106 0 71 2 106 0 72 2 106 0 73 2 106 0 80 2 106 0 81 2 106 0 83 2 106 0 85 6 129 0 149 2 106 0 196 2 106 0 201] 
#[0 3 26 0 1 0 2 0 3 0 7 0 8 0 11 0 12 0 13 0 14 0 15 0 17 0 18 0 23 0 24 0 39 0 44 0 46 0 47 0 49 0 53 0 55 0 56 0 59 0 62 0 63 0 65 0 68 0 71 0 72 0 73 0 81 0 83 0 85 0 201] 
#[0 3 30 0 1 0 2 0 3 0 7 0 8 0 11 0 12 0 13 0 14 0 15 0 17 0 18 0 23 0 24 0 39 0 44 0 46 0 47 0 49 0 53 0 55 0 56 0 57 0 59 0 60 0 61 0 62 0 63 0 65 0 68 0 69 0 71 0 72 0 73 0 80 0 81 0 83 0 85 0 196 0 201] 
#[0 3 34 0 1 0 2 0 3 0 7 0 8 0 11 0 12 0 13 0 14 0 15 0 17 0 18 0 23 0 24 0 39 0 44 0 46 0 47 0 49 0 53 0 55 0 56 0 59 0 62 0 63 0 65 0 68 0 71 0 72 0 73 0 80 0 81 0 83 0 85 0 196 0 201] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 6 133 0 106 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 1 89 0 199] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 6 137 0 106 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 1 89 0 199] 
#[1 0 21 0 1 0 25 0 2 0 29 0 3 0 33 0 7 0 37 0 8 0 41 0 11 0 45 0 12 0 49 0 13 0 53 0 14 0 57 0 15 0 61 0 17 0 65 0 18 0 77 0 39 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 3 121 0 80 0 145 0 81 0 149 0 83 0 153 0 85 0 157 0 87 6 141 0 100 0 185 0 106 0 189 0 108 0 193 0 113 0 197 0 114 0 201 0 116 0 205 0 118 0 209 0 119 0 213 0 120 0 217 0 121 0 221 0 122 0 225 0 123 0 229 0 124 0 233 0 125 0 237 0 126 0 241 0 127 0 245 0 128 3 129 0 131 0 253 0 138 1 1 0 141 1 5 0 142 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 1 89 0 199] 
#[0 6 145 0 21] 
#[0 3 38 0 1 0 2 0 3 0 7 0 8 0 11 0 12 0 13 0 14 0 15 0 17 0 18 0 23 0 24 0 39 0 44 0 46 0 47 0 49 0 53 0 55 0 56 0 59 0 62 0 63 0 65 0 68 0 71 0 72 0 73 0 80 0 81 0 83 0 85 0 196 0 201] 
#[1 0 21 0 1 0 25 0 2 0 29 0 3 0 33 0 7 0 37 0 8 0 41 0 11 0 45 0 12 0 49 0 13 0 53 0 14 0 57 0 15 0 61 0 17 0 65 0 18 0 77 0 39 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 3 121 0 80 0 145 0 81 0 149 0 83 0 153 0 85 0 157 0 87 6 149 0 100 0 185 0 106 0 189 0 108 0 193 0 113 0 197 0 114 0 201 0 116 0 205 0 118 0 209 0 119 0 213 0 120 0 217 0 121 0 221 0 122 0 225 0 123 0 229 0 124 0 233 0 125 0 237 0 126 0 241 0 127 0 245 0 128 3 129 0 131 0 253 0 138 1 1 0 141 1 5 0 142 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 1 89 0 199] 
#[0 3 42 0 1 0 2 0 3 0 7 0 8 0 11 0 12 0 13 0 14 0 15 0 17 0 18 0 23 0 24 0 39 0 44 0 46 0 47 0 49 0 53 0 55 0 56 0 57 0 59 0 61 0 62 0 63 0 65 0 68 0 69 0 71 0 72 0 73 0 80 0 81 0 83 0 85 0 196 0 201] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 6 153 0 106 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 1 89 0 199] 
#[0 3 46 0 1 0 2 0 3 0 7 0 8 0 11 0 12 0 13 0 14 0 15 0 17 0 18 0 23 0 24 0 39 0 44 0 46 0 47 0 49 0 53 0 55 0 56 0 59 0 62 0 63 0 65 0 68 0 71 0 72 0 73 0 80 0 81 0 83 0 85 0 196 0 201] 
#[0 3 50 0 21 0 82] 
#[1 3 54 0 22 3 181 0 55 6 157 0 59 3 54 0 82 3 54 0 86 6 161 0 183 6 165 0 194 6 169 0 195] 
#[1 2 9 0 19 2 13 0 20 0 30 0 21 2 17 0 71 2 21 0 81 6 173 0 101 2 29 0 103 2 33 0 203] 
#[1 6 177 0 22 3 58 0 55 3 58 0 59 3 58 0 84] 
#[1 3 197 0 55 6 181 0 59 3 62 0 84 6 185 0 182 6 189 0 192 6 193 0 193] 
#[0 3 66 0 22 0 55 0 59 0 82 0 84 0 86] 
#[0 3 66 0 22 0 55 0 59 0 82 0 84 0 86] 
#[0 6 197 0 21] 
#[0 3 70 0 22 0 84] 
#[0 3 74 0 84] 
#[0 2 162 0 21 0 22 0 84] 
#[1 6 201 0 21 3 78 0 22 3 78 0 84 6 205 0 188] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 6 209 0 106 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 1 89 0 199] 
#[1 5 253 0 22 2 174 0 82 6 213 0 191] 
#[0 3 82 0 1 0 2 0 3 0 7 0 8 0 11 0 12 0 13 0 14 0 15 0 17 0 18 0 23 0 24 0 39 0 44 0 46 0 47 0 49 0 53 0 55 0 56 0 59 0 62 0 63 0 65 0 68 0 71 0 72 0 73 0 80 0 81 0 83 0 85 0 196 0 201] 
#[0 3 86 0 1 0 2 0 3 0 7 0 8 0 11 0 12 0 13 0 14 0 15 0 17 0 18 0 23 0 24 0 39 0 44 0 46 0 47 0 49 0 53 0 55 0 56 0 59 0 62 0 63 0 65 0 68 0 71 0 72 0 73 0 80 0 81 0 83 0 85 0 196 0 201] 
#[0 3 90 0 21] 
#[0 3 94 0 21] 
#[0 3 98 0 1 0 2 0 3 0 7 0 8 0 11 0 12 0 13 0 14 0 15 0 17 0 18 0 23 0 24 0 39 0 44 0 46 0 47 0 49 0 53 0 55 0 56 0 59 0 61 0 62 0 63 0 65 0 68 0 71 0 72 0 73 0 80 0 81 0 83 0 85 0 196 0 201] 
#[1 0 21 0 1 0 25 0 2 0 29 0 3 0 33 0 7 0 37 0 8 0 41 0 11 0 45 0 12 0 49 0 13 0 53 0 14 0 57 0 15 0 61 0 17 0 65 0 18 0 77 0 39 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 3 121 0 80 0 145 0 81 0 149 0 83 0 153 0 85 0 157 0 87 6 217 0 100 0 185 0 106 0 189 0 108 0 193 0 113 0 197 0 114 0 201 0 116 0 205 0 118 0 209 0 119 0 213 0 120 0 217 0 121 0 221 0 122 0 225 0 123 0 229 0 124 0 233 0 125 0 237 0 126 0 241 0 127 0 245 0 128 3 129 0 131 0 253 0 138 1 1 0 141 1 5 0 142 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 1 89 0 199] 
#[0 3 102 0 1 0 2 0 3 0 7 0 8 0 11 0 12 0 13 0 14 0 15 0 17 0 18 0 23 0 24 0 39 0 44 0 46 0 47 0 49 0 53 0 55 0 56 0 57 0 59 0 61 0 62 0 63 0 65 0 68 0 69 0 71 0 72 0 73 0 80 0 81 0 83 0 85 0 196 0 201] 
#[0 6 221 0 21] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 6 77 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 6 225 0 156 6 89 0 159 6 93 0 160 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 89 0 199] 
#[0 3 106 0 22 0 82 0 86] 
#[0 3 106 0 22 0 82 0 86] 
#[0 3 110 0 22 0 82 0 86] 
#[0 6 229 0 21] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 6 77 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 6 233 0 156 6 237 0 157 6 89 0 159 6 93 0 160 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 89 0 199] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 6 77 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 6 241 0 156 6 89 0 159 6 93 0 160 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 89 0 199] 
#[0 3 114 0 84] 
#[0 3 114 0 84] 
#[0 3 118 0 84] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 6 245 0 106 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 1 89 0 199] 
#[1 2 6 0 22 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 2 6 0 84 0 153 0 85 6 109 0 106 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 6 249 0 187 1 89 0 199] 
#[0 3 122 0 22 0 84] 
#[0 3 126 0 82] 
#[0 3 130 0 82] 
#[0 3 134 0 1 0 2 0 3 0 7 0 8 0 11 0 12 0 13 0 14 0 15 0 17 0 18 0 23 0 24 0 39 0 44 0 46 0 47 0 49 0 53 0 55 0 56 0 59 0 62 0 63 0 65 0 68 0 71 0 72 0 73 0 80 0 81 0 83 0 85 0 196 0 201] 
#[1 0 21 0 1 0 25 0 2 0 29 0 3 0 33 0 7 0 37 0 8 0 41 0 11 0 45 0 12 0 49 0 13 0 53 0 14 0 57 0 15 0 61 0 17 0 65 0 18 0 77 0 39 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 0 125 0 68 0 129 0 71 0 133 0 72 0 137 0 73 3 121 0 80 0 145 0 81 0 149 0 83 0 153 0 85 0 157 0 87 6 253 0 100 0 185 0 106 0 189 0 108 0 193 0 113 0 197 0 114 0 201 0 116 0 205 0 118 0 209 0 119 0 213 0 120 0 217 0 121 0 221 0 122 0 225 0 123 0 229 0 124 0 233 0 125 0 237 0 126 0 241 0 127 0 245 0 128 3 129 0 131 0 253 0 138 1 1 0 141 1 5 0 142 1 29 0 159 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 85 0 184 1 89 0 199] 
#[1 3 138 0 22 3 181 0 55 6 157 0 59 3 138 0 82 3 138 0 86 6 161 0 183 6 165 0 194 7 1 0 195] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 0 121 0 65 6 77 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 0 153 0 85 7 5 0 156 6 89 0 159 6 93 0 160 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 89 0 199] 
#[0 3 142 0 22 0 55 0 59 0 84] 
#[1 7 9 0 22 0 62 0 55 0 62 0 59 0 62 0 84 7 13 0 105] 
#[1 3 197 0 55 6 181 0 59 3 146 0 84 6 185 0 182 6 189 0 192 7 17 0 193] 
#[1 5 193 0 22 0 62 0 86 5 197 0 105 7 21 0 189] 
#[0 3 150 0 22 0 84] 
#[0 3 154 0 1 0 2 0 3 0 7 0 8 0 11 0 12 0 13 0 14 0 15 0 17 0 18 0 23 0 24 0 39 0 44 0 46 0 47 0 49 0 53 0 55 0 56 0 57 0 59 0 60 0 62 0 63 0 65 0 68 0 71 0 72 0 73 0 80 0 81 0 83 0 85 0 196 0 201] 
#[0 3 158 0 22 0 82 0 86] 
#[0 3 162 0 22 0 55 0 59 0 82 0 84 0 86] 
#[1 0 81 0 44 0 85 0 46 0 93 0 49 0 97 0 53 1 74 0 55 1 74 0 59 0 121 0 65 6 77 0 68 0 129 0 71 0 133 0 72 0 137 0 73 0 145 0 81 0 149 0 83 1 74 0 84 0 153 0 85 7 25 0 156 6 89 0 159 6 93 0 160 1 33 0 161 1 37 0 162 1 41 0 163 1 45 0 165 1 49 0 166 1 53 0 167 1 57 0 168 1 61 0 169 1 65 0 170 1 69 0 171 1 73 0 172 1 77 0 180 1 89 0 199] 
#[0 3 166 0 55 0 59 0 84] 
#[0 3 170 0 84] 
#[0 3 174 0 86] 
#[0 3 178 0 22 0 55 0 59 0 84]
	).
]
