generated
definitionComment
"%root Root;
%prefix Cuc;
%suffix Node;
%glr ;

<tag> : @ ([^@\r\n\t ])+ ;
<space> : [  \t] ;
<line_to_eol> : (!(\r?\n))* ;
<eol> : \r?\n ;
<white> : <space> | <eol> ;
<comment_line> : <space>* \# <line_to_eol> ;
<comment> : (<comment_line> <white>)* ;
<open_py_string> : <space>* \""\""\"" <space>* <eol> ;
<close_py_string> : <eol> <space>* \""\""\"" <white> ;
<py_string> : <open_py_string> (!<close_py_string>)* <close_py_string> ;
<row_start> : <space> * \|;
<cell> : [^\r\n|]+ \| ;
<step_keyword> : Given | When | Then | And | But ;
<examples_keyword> : Examples\: ;
<scenario_outline_keyword> : Scenario\ Outline\: ;
<scenario_keyword> : Scenario\: ;
<background_keyword> : Background\: ;
<feature_keyword> : Feature\: ;
<reserved_words_and_symbols> : (<step_keyword> \ ) | <scenario_keyword> | <scenario_outline_keyword> | <row_start> | <tag> | \# ;
<whitespace> : \s ;

after_keyword <lines_to_keyword> : (!(<eol> <space>* <reserved_words_and_symbols>))* ;


# Grammar part of it.
feature : tags ""Feature:"" <lines_to_keyword> background? 'background' feature_elements {{}} ;

feature_elements :
	| feature_element 'feature_element' feature_elements
	;

feature_element:
	scenario
	| scenario_outline
	; 

scenario :  tags <scenario_keyword> <lines_to_keyword> steps {{}} ;

scenario_outline : tags <scenario_outline_keyword> <lines_to_keyword> steps examples_sections {{}};

tags :
	| <tag> 'tag' tags
	;

background : <comment> <background_keyword> <space>* <lines_to_keyword>? <eol>+ steps ;
row : <row_start> (<cell>| <row_start>)+ <eol> ;
table : row+ ;
steps : step* ;
step : <comment> <step_keyword> <space>* <line_to_eol> (<eol>+) multiline_arg? <white> ;
examples_sections : examples* ;
examples : <comment> <space>* <examples_keyword> <space>* <lines_to_keyword>? <eol> table <white> ;
multiline_arg : table | <py_string> ;"
