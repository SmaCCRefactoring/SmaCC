generated
definitionComment
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
	<NEWLINE>
	| simple_stmt
	| compound_stmt <NEWLINE>
	;
eval_input:
	testlist newline_opts
	;
newline_opts:
	| newline_opts <NEWLINE>
	;

decorator:
	""@"" dotted_name paren_arglist_opt <NEWLINE>
	;
paren_arglist_opt:
	| <lparen> arglist_opt <rparen>
	;
arglist_opt:
	| arglist
	;

decorators:
	decorators decorator
	| decorator
	;
decorated:
	decorators classdef
	| decorators funcdef
	;
funcdef:
	""def"" <name> 'fname' parameters 'parameters' "":"" suite 'body' {{}}
	;
parameters:
	<lparen> varargslist_opt <rparen>
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
	| ""="" test
	;
fpdef:
	<name>
	| <lparen> fplist <rparen>
	;
fplist:
	fpdef "","" fplist
	| fpdef comma_opt
	;

stmt:
	simple_stmt
	| compound_stmt
	;
simple_stmt:
	small_stmt "";"" simple_stmt 'simple'
	| small_stmt 'simple' semicolon_opt <NEWLINE>
	;
semicolon_opt:
	| "";""
	;
expr_stmt: 
	testlist assign_after
	| testlist augassign yield_or_testlist
	;
assign_after:
	| assign_after ""="" yield_or_testlist
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
	""print"" testlist_opt 'arguments' {{Print}}
	| ""print"" "">>"" testlist 'arguments' {{Print}}
	;
del_stmt:
	""del"" exprlist
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
	""return"" testlist_opt 'args' {{Return}}
	;
yield_stmt:
	yield_expr
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
	dotted_name
	| dots
	| dots dotted_name
	;
dots:
	dots "".""
	| "".""
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
	""exec"" expr
	| ""exec"" expr ""in"" test_test_opt
	;
test_test_opt:
	test
	| test "","" test
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
	""if"" test 'if' "":"" suite 'then' elifs_opt 'elsif' else_opt 'else' {{IfStmt}}
	;
elifs_opt: {{}}
	| elifs_opt ""elif"" test 'elif' "":"" suite 'then' {{Elif}}
	;
else_opt:
	| ""else"" "":"" suite 'else' {{Else}}
	;
while_stmt:
	""while"" test "":"" suite else_opt {{While}}
	;
for_stmt:
	""for"" exprlist ""in"" testlist "":"" suite else_opt {{For}}
	;
try_stmt:
	""try"" "":"" suite except_list else_opt finally_opt {{Try}}
	| ""try"" "":"" suite ""finally"" "":"" suite {{Try}}
	;
finally_opt:
	| ""finally"" "":"" suite
	;
except_list:
	except_list except_clause "":"" suite
	| except_clause "":"" suite
	;
with_stmt:
	""with"" with_items "":"" suite
	;
with_items:
	with_items "","" with_item
	| with_item
	;
with_item:
	test
	| test ""as"" expr
	;
# NB compile.c makes sure that the default except clause is last
except_clause: 
	""except""
	| ""except"" test
	| ""except"" test ""as"" test
	| ""except"" test "","" test
	;
suite:
	simple_stmt
	| <NEWLINE> <INDENT> stmts <DEDENT>
	;
stmts:
	stmts stmt 'statement' {{Statements}}
	| stmt 'statement' {{Statements}}
	;

# Backward compatibility cruft to support:
# [ x for x in lambda: True, lambda: False if x() ]
# even while also allowing:
# lambda x: 5 if x else 2
# (But not a mix of the two)
testlist_safe:
	old_test 
	| old_test "","" old_tests comma_opt
	;
old_tests:
	old_tests "","" old_test
	| old_test
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
	""<""
	| "">""
	| ""==""
	| "">=""
	| ""<=""
	| ""<>""
	| ""!=""
	| ""in""
	| ""not"" ""in"" 
	| ""is""
	| ""is"" ""not""
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
	atom trailers_opt
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
	test list_for
	| testlist
	;
testlist_comp:
	test comp_for
	| testlist
	;
lambdef:
	""lambda"" varargslist_opt 'arguments' "":"" test 'body' {{Lambda}}
	;
trailer: 
	<lparen> <rparen>
	| <lparen> arglist <rparen>
	| <lbrack> subscriptlist <rbrack>
	| ""."" <name>
	;
subscriptlist:
	subscript "","" subscriptlist
	| subscript comma_opt
	;
subscript:
	""."" ""."" "".""
	| test
	| test_opt "":"" test_opt sliceop
	;
test_opt:
	| test
	;
sliceop:
	| "":"" test_opt
	;
exprlist:
	expr "","" exprlist
	| expr comma_opt
	;
comma_opt:
	| "",""
	;
test:
	or_test
	| or_test ""if"" or_test 'if' ""else"" test 'else'
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
	test "":"" test comp_for
	| test "":"" test more_tests
	| test comp_for
	| testlist
	;
more_tests:
	comma_opt
	| "","" test "":"" test more_tests
	;
classdef:
	""class"" <name> 'cname' "":"" suite 'body' {{}}
	| ""class"" <name> 'cname' <lparen> testlist_opt<rparen> "":"" suite 'body' {{}}
	;

arglist: 
	argument "","" arglist
	| argument comma_opt
	| ""*"" test more_args
	| ""**"" test
	;
more_args:
	| "","" ""**"" test
	| "","" argument more_args
	;
# The reason that keywords are test nodes instead of <name> is that using <name>
# results in an ambiguity. ast.c makes sure it""s a <name>.
argument:
	test
	| test comp_for
	| test ""="" test
	;

list_iter:
	list_for
	| list_if
	;
list_for:
	""for"" exprlist ""in"" testlist_safe
	| ""for"" exprlist ""in"" testlist_safe list_iter
	;
list_if:
	""if"" old_test
	| ""if"" old_test list_iter
	;

comp_iter:
	comp_for
	| comp_if
	;
comp_for:
	""for"" exprlist ""in"" or_test
	| ""for"" exprlist ""in"" or_test comp_iter
	;
comp_if:
	""if"" old_test
	| ""if"" old_test comp_iter
	;

testlist1:
	test 
	| test "","" testlist1
	;

# not used in grammar, but may appear in ""node"" passed from Parser to Compiler
#encoding_decl: <name> ;

yield_expr:
	""yield"" testlist_opt 'arguments' {{Yield}}
	;"
