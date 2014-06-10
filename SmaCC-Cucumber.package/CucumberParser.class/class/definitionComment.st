generated
definitionComment
"<tag> : @ ([^@\r\n\t ])+ ;
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
<keyword_space> : \ ;
<reserved_words_and_symbols> : (<step_keyword> <keyword_space>) | <scenario_keyword> | <scenario_outline_keyword> | <row_start> | (<space> * <tag>) | <comment_line> ;
<lines_to_keyword> : (!(<eol> <space>* <reserved_words_and_symbols>))* ;
<header> : (!(<comment> (<tag> | <scenario_keyword> | <background_keyword>)))* ;

feature : <white> <comment> tags <header> background? feature_elements <comment>? ;
feature_elements : (scenario | scenario_outline)* ;
scenario : <comment> tags <scenario_keyword> <space>* <lines_to_keyword> <white> steps ;
scenario_outline : <comment> tags <scenario_outline_keyword> <space>* <lines_to_keyword> <white> steps examples_sections <white> ;
tags : <white> (<tag> (<space>|<eol>)+)* ;
background : <comment> <background_keyword> <space>* <lines_to_keyword>? <eol>+ steps ;
row : <row_start> (<cell>| <row_start>)+ <eol> ;
table : row+ ;
steps : step* ;
step : <comment> <step_keyword> <keyword_space> <line_to_eol> (<eol>+) multiline_arg? <white> ;
examples_sections : examples* ;
examples : <comment> <space>* <examples_keyword> <space>* <lines_to_keyword>? <eol> table <white> ;
multiline_arg : table | <py_string> ;


%root Root;
%prefix Cuc;
%suffix Node;"
