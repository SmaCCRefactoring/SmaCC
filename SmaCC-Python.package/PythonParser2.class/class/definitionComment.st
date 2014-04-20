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
		\'\'\' ( [^\\] | <escapeseq> )* \'\'\'
		| \""\""\"" ( [^\\] | <escapeseq> )* \""\""\"" ;
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
<imagnumber> : (<floatnumber> | [0-9]+) ; #Is that true that one can write 0000j ? Yes.

#All number literals
<number> : <longinteger> | <integer> | <floatnumber> | <imagnumber> ;

#Modes
<cr>	: \r | \n | \r\n ;
lineBegin <emptyLine> : <cr> ;
lineBegin <blankLine> : [ \t\f]* (\# [^\r\n]* )? <cr> ;
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

file_input: (<NEWLINE> | stmt)* ;
single_input: <NEWLINE> | simple_stmt | compound_stmt <NEWLINE> ;
eval_input: testlist <NEWLINE>* ;

decorator: ""@"" dotted_name [ <lparen> [arglist] <rparen> ] <NEWLINE> ;
decorators: decorator+ ;
decorated: decorators (classdef | funcdef) ;
funcdef: ""def"" <name> parameters "":"" suite ;
parameters: <lparen> [varargslist] <rparen> ;
varargslist: (fpdef [""="" test] "","")* 
              ((""*"" <name> ["","" ""**"" <name>]) | (""**"" <name>) 
              | (fpdef [""="" test] ["",""])) ;
fpdef: <name> | <lparen> fplist <rparen> ;
fplist: fpdef ("","" fpdef)* ["",""] ;

stmt: simple_stmt | compound_stmt ;
simple_stmt: small_stmt ("";"" small_stmt)* ["";""] <NEWLINE> ;
small_stmt: (expr_stmt | print_stmt  | del_stmt | pass_stmt | flow_stmt |
             import_stmt | global_stmt | exec_stmt | assert_stmt) ;
expr_stmt: testlist (augassign (yield_expr|testlist) |
                     (""="" (yield_expr|testlist))*) ;
augassign: (""+="" | ""-="" | ""*="" | ""/="" | ""%="" | ""&="" | ""|="" | ""^="" |
            ""<<="" | "">>="" | ""**="" | ""//="") ;
# For normal assignments, additional restrictions enforced by the interpreter
print_stmt: ""print"" ( [ test ("","" test)* ["",""] ] |
                      "">>"" test [ ("","" test)+ ["",""] ] ) ;
del_stmt: ""del"" exprlist ;
pass_stmt: ""pass"" ;
flow_stmt: break_stmt | continue_stmt | return_stmt | raise_stmt | yield_stmt ;
break_stmt: ""break"" ;
continue_stmt: ""continue"" ;
return_stmt: ""return"" [testlist] ;
yield_stmt: yield_expr ;
raise_stmt: ""raise"" [test ["","" test ["","" test]]] ;
import_stmt: import_name | import_from ;
import_name: ""import"" dotted_as_names ;
import_from: (""from"" (dotted_name | ("".""+ dotted_name?))
              ""import"" (""*"" | (<lparen> import_as_names <rparen>) | import_as_names)) ;
import_as_name: <name> [""as"" <name>] ;
dotted_as_name: dotted_name [""as"" <name>] ;
import_as_names: import_as_name ("","" import_as_name)* ["",""] ;
dotted_as_names: dotted_as_name ("","" dotted_as_name)* ;
dotted_name: <name> (""."" <name>)* ;
global_stmt: ""global"" <name> ("","" <name>)* ;
exec_stmt: ""exec"" expr [""in"" test ["","" test]] ;
assert_stmt: ""assert"" test ["","" test] ;

compound_stmt: if_stmt | while_stmt | for_stmt | try_stmt | with_stmt | funcdef | classdef | decorated ;
if_stmt: ""if"" test "":"" suite (""elif"" test "":"" suite)* [""else"" "":"" suite] ;
while_stmt: ""while"" test "":"" suite [""else"" "":"" suite] ;
for_stmt: ""for"" exprlist ""in"" testlist "":"" suite [""else"" "":"" suite] ;
try_stmt: (""try"" "":"" suite
           (((except_clause "":"" suite)+
            [""else"" "":"" suite]
            [""finally"" "":"" suite]) |
           (""finally"" "":"" suite))) ;
with_stmt: ""with"" with_item ("","" with_item)*  "":"" suite ;
with_item: test [""as"" expr] ;
# NB compile.c makes sure that the default except clause is last
except_clause: ""except"" [test [(""as"" | "","") test]] ;
suite: simple_stmt | (<NEWLINE> <INDENT> stmt+ <DEDENT>) ;

# Backward compatibility cruft to support:
# [ x for x in lambda: True, lambda: False if x() ]
# even while also allowing:
# lambda x: 5 if x else 2
# (But not a mix of the two)
testlist_safe: old_test [("","" old_test)+ ["",""]] ;
old_test: or_test | old_lambdef ;
old_lambdef: ""lambda"" [varargslist] "":"" old_test ;

test: (or_test [""if"" or_test ""else"" test]) | lambdef ;
or_test: and_test (""or"" and_test)* ;
and_test: not_test (""and"" not_test)* ;
not_test: (""not"" not_test) | comparison ;
comparison: expr (comp_op expr)* ;
comp_op: ""<""|"">""|""==""|"">=""|""<=""|""<>""|""!=""|""in""|(""not"" ""in"")|""is""|(""is"" ""not"") ;
expr: xor_expr (""|"" xor_expr)* ;
xor_expr: and_expr (""^"" and_expr)* ;
and_expr: shift_expr (""&"" shift_expr)* ;
shift_expr: arith_expr ((""<<""|"">>"") arith_expr)* ;
arith_expr: term ((""+""|""-"") term)* ;
term: factor ((""*""|""/""|""%""|""//"") factor)* ;
factor: (""+""|""-""|""~"") factor | power ;
power: atom trailer* [""**"" factor] ;
atom: ((<lparen> [yield_expr|testlist_comp] <rparen>) |
       (<lbrack> [listmaker] <rbrack>) |
       (<lcurly> [dictorsetmaker] <rcurly>) |
       (""`"" testlist1 ""`"") |
       <name> | <number> | <string>+) ;
listmaker: test ( list_for | (("","" test)* ["",""]) ) ;
testlist_comp: test ( comp_for | (("","" test)* ["",""]) ) ;
lambdef: ""lambda"" [varargslist] "":"" test ;
trailer: <lparen> [arglist] <rparen> | <lbrack> subscriptlist <rbrack> | ""."" <name> ;
subscriptlist: subscript ("","" subscript)* ["",""] ;
subscript: ""."" ""."" ""."" | test | [test] "":"" [test] [sliceop] ;
sliceop: "":"" [test] ;
exprlist: expr ("","" expr)* ["",""] ;
testlist: test ("","" test)* ["",""] ;
dictorsetmaker: ( (test "":"" test (comp_for | ("","" test "":"" test)* ["",""])) |
                  (test (comp_for | ("","" test)* ["",""])) ) ;

classdef: ""class"" <name> [<lparen> [testlist] <rparen>] "":"" suite ;

arglist: (argument "","")* (argument ["",""]
                         |""*"" test ("","" argument)* ["","" ""**"" test] 
                         |""**"" test) ;
# The reason that keywords are test nodes instead of <name> is that using <name>
# results in an ambiguity. ast.c makes sure it""s a <name>.
argument: test [comp_for] | test ""="" test ;

list_iter: list_for | list_if ;
list_for: ""for"" exprlist ""in"" testlist_safe [list_iter] ;
list_if: ""if"" old_test [list_iter] ;

comp_iter: comp_for | comp_if ;
comp_for: ""for"" exprlist ""in"" or_test [comp_iter] ;
comp_if: ""if"" old_test [comp_iter] ;

testlist1: test ("","" test)* ;

# not used in grammar, but may appear in ""node"" passed from Parser to Compiler
#encoding_decl: <name> ;

yield_expr: ""yield"" [testlist] ;"
