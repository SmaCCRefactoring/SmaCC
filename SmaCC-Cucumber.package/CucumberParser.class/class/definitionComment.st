generated
definitionComment
"#%root Root;
#%prefix Cuc;
#%suffix Node;
%glr ;

<tagKeyword> : @ ;
<py_string> : [ \t]* ( (\""\""\"" ([^\""] | \"" [^\""] | \""\"" [^\""] ) * \"" \"" \"") | (``` ( [^`] | `[^`] | ``[^`] )* ```) );
<rowKeyword> : \|;
<stepKeyword> : Given | When | Then | And | But ;
<examplesKeyword> : Examples\: ;
<scenarioOutlineKeyword> : Scenario\ Outline\: ;
<scenarioKeyword> : Scenario\: ;
<backgroundKeyword> : Background\: ;
<featureKeyword> : Feature\: ;
lineBegin <stepStart> :  [ \t]* <stepKeyword>;
lineBegin <scenarioStart> :  [ \t]* <scenarioKeyword>;
lineBegin <examplesStart> :  [ \t]* <examplesKeyword>;
lineBegin <scenarioOutlineStart> :  [ \t]* <scenarioOutlineKeyword>;
lineBegin <featureStart> :  [ \t]* <featureKeyword>;
lineBegin <backgroundStart> :  [ \t]* <backgroundKeyword>;
lineBegin <rowStart> :  [ \t]* <rowKeyword>;
lineBegin <tagStart> :  [ \t]* <tagKeyword>;
lineBegin <comment> : [ \t]* \# [^\r\n]* ;
lineBegin <noKeyword> : . ;
<line> : [^\r\n]+ ;
inRow <cell> : [^\r\n|]* \| ;
inRow <eol2> : [ \t]* (\r | \r\n | \n) ;
<eol> : [ \t]* (\r | \r\n | \n) ;

# Grammar part of it.
feature : tag* <featureStart> <line>+ background? feature_element+ ;

feature_element:
	scenario
	| scenario_outline
	; 

scenario :  tag* <scenarioStart> <line>+ step* ;

scenario_outline : tag* <scenarioOutlineStart> <line>+ step+ example+ ;

background : <backgroundStart> <line>* step+ ;
row : <rowStart> (<cell>)+ ;
table : row+ ;
step : <stepStart> <line> multiline_arg? ;
example : tag* <examplesStart> <line>* table ;
multiline_arg : table | <py_string> ;
tag : <tagStart> <line> ;"
