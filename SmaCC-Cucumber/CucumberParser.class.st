"
I parse the gherkin language
"
Class {
	#name : #CucumberParser,
	#superclass : #SmaCCGLRParser,
	#category : 'SmaCC-Cucumber'
}

{ #category : #generated }
CucumberParser class >> definitionComment [
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
]

{ #category : #'generated-accessing' }
CucumberParser class >> scannerClass [
	^CucumberScanner
]

{ #category : #generated }
CucumberParser class >> startingStateForfeature [
	^ 1
]

{ #category : #generated }
CucumberParser >> ambiguousTransitions [
^#(
#[ 0 6 0 126]
	).
]

{ #category : #'generated-reduction actions' }
CucumberParser >> reduceActionFor_line__1: nodes [
	^ OrderedCollection with: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
CucumberParser >> reduceActionForbackground_2: nodes [
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
CucumberParser >> reduceActionFortag_1: nodes [
	^ OrderedCollection new
]

{ #category : #'generated-reduction actions' }
CucumberParser >> reduceActionFortag_2: nodes [
	^ (nodes at: 1)
		add: (nodes at: 2);
		yourself
]

{ #category : #generated }
CucumberParser >> reduceTable [
^#(
	#(40 0 #reduceActionFortag_1:) 
	#(40 2 #reduceActionFortag_2:) 
	#(34 1 #reduceActionFor_line__1:) 
	#(30 0 #nil) 
	#(41 2 #reduceFor:) 
	#(22 0 #reduceActionFortag_1:) 
	#(34 2 #reduceActionFortag_2:) 
	#(30 1 #reduceActionForbackground_2:) 
	#(17 5 #reduceFor:) 
	#(21 1 #reduceActionFor_line__1:) 
	#(23 1 #reduceFor:) 
	#(22 2 #reduceActionFortag_2:) 
	#(33 3 #reduceFor:) 
	#(18 1 #reduceActionFor_line__1:) 
	#(21 2 #reduceActionFortag_2:) 
	#(32 0 #nil) 
	#(18 2 #reduceActionFortag_2:) 
	#(16 0 #reduceActionFortag_1:) 
	#(31 1 #reduceFor:) 
	#(28 1 #reduceActionFor_line__1:) 
	#(29 1 #reduceFor:) 
	#(32 1 #reduceActionForbackground_2:) 
	#(24 3 #reduceFor:) 
	#(39 4 #reduceFor:) 
	#(38 1 #reduceActionForbackground_2:) 
	#(27 2 #reduceFor:) 
	#(26 1 #reduceActionFor_line__1:) 
	#(28 2 #reduceActionFortag_2:) 
	#(16 2 #reduceActionFortag_2:) 
	#(20 1 #reduceActionFor_line__1:) 
	#(35 5 #reduceFor:) 
	#(26 2 #reduceActionFortag_2:) 
	#(20 2 #reduceActionFortag_2:) 
	#(19 4 #reduceFor:)
	).
]

{ #category : #generated }
CucumberParser >> transitionTable [
^#(
#[1 0 6 0 6 0 6 0 9 0 9 0 17 0 13 0 40] 
#[0 0 0 0 36] 
#[1 0 17 0 6 0 21 0 9 0 25 0 41] 
#[1 0 29 0 12 0 33 0 34] 
#[0 0 37 0 12] 
#[0 0 10 0 3 0 4 0 5 0 6 0 9] 
#[0 0 14 0 2 0 3 0 5 0 7 0 9 0 12 0 36] 
#[1 0 18 0 3 0 18 0 5 0 41 0 7 0 18 0 9 0 45 0 12 0 49 0 30 0 53 0 33] 
#[0 0 22 0 3 0 4 0 5 0 6 0 9] 
#[1 0 26 0 2 0 26 0 12 0 57 0 22] 
#[0 0 30 0 2 0 3 0 5 0 7 0 9 0 12 0 36] 
#[1 0 6 0 3 0 6 0 5 0 6 0 9 0 61 0 21 0 65 0 23 0 69 0 35 0 73 0 39 0 77 0 40] 
#[0 0 34 0 3 0 5 0 9] 
#[1 0 81 0 2 0 85 0 12 0 89 0 18 0 93 0 24] 
#[1 0 6 0 3 0 6 0 5 0 6 0 9 0 97 0 23 0 69 0 35 0 38 0 36 0 73 0 39 0 77 0 40] 
#[0 0 42 0 3 0 5 0 9 0 36] 
#[0 0 46 0 3 0 5 0 9 0 36] 
#[0 0 46 0 3 0 5 0 9 0 36] 
#[1 0 101 0 3 0 105 0 5 0 21 0 9 0 25 0 41] 
#[0 0 109 0 12] 
#[0 0 50 0 2 0 8 0 12] 
#[1 0 81 0 2 0 54 0 3 0 54 0 5 0 54 0 9 0 113 0 24] 
#[0 0 58 0 2 0 3 0 4 0 5 0 9] 
#[0 0 62 0 3 0 5 0 9 0 36] 
#[1 0 29 0 12 0 117 0 34] 
#[1 0 29 0 12 0 121 0 34] 
#[1 0 125 0 1 0 66 0 2 0 66 0 3 0 66 0 4 0 66 0 5 0 129 0 8 0 66 0 9 0 133 0 27 0 137 0 28 0 141 0 29 0 145 0 31 0 149 0 32 0 66 0 36] 
#[0 0 70 0 2 0 3 0 4 0 5 0 9] 
#[1 0 74 0 2 0 74 0 3 0 74 0 5 0 74 0 9 0 45 0 12 0 153 0 16 0 74 0 36] 
#[1 0 81 0 2 0 45 0 12 0 157 0 18 0 93 0 24] 
#[0 0 78 0 2 0 3 0 4 0 5 0 9 0 36] 
#[1 0 161 0 13 0 165 0 26 0 169 0 38] 
#[0 0 82 0 2 0 3 0 4 0 5 0 8 0 9 0 36] 
#[1 0 86 0 2 0 86 0 3 0 86 0 4 0 86 0 5 0 129 0 8 0 86 0 9 0 173 0 27 0 86 0 36] 
#[0 0 78 0 2 0 3 0 4 0 5 0 9 0 36] 
#[0 0 90 0 2 0 3 0 4 0 5 0 9 0 36] 
#[0 0 94 0 2 0 3 0 4 0 5 0 9 0 36] 
#[1 0 81 0 2 0 98 0 3 0 98 0 5 0 98 0 9 0 177 0 24 0 98 0 36] 
#[1 0 81 0 2 0 6 0 4 0 6 0 9 0 181 0 19 0 185 0 20 0 113 0 24 0 189 0 40] 
#[0 0 102 0 2 0 3 0 4 0 5 0 8 0 9 0 13 0 36] 
#[1 0 106 0 2 0 106 0 3 0 106 0 4 0 106 0 5 0 106 0 8 0 106 0 9 0 161 0 13 0 106 0 36 0 193 0 38] 
#[0 0 110 0 2 0 3 0 4 0 5 0 8 0 9 0 13 0 36] 
#[0 0 114 0 2 0 3 0 4 0 5 0 8 0 9 0 36] 
#[0 0 118 0 2 0 3 0 5 0 9 0 36] 
#[0 0 122 0 3 0 4 0 5 0 9 0 36] 
#[1 0 126 0 3 0 6 0 4 0 126 0 5 0 7 0 9 0 197 0 19 0 126 0 36 0 189 0 40] 
#[1 0 201 0 4 0 21 0 9 0 25 0 41] 
#[0 0 130 0 2 0 3 0 4 0 5 0 8 0 9 0 13 0 36] 
#[0 0 134 0 3 0 4 0 5 0 9 0 36] 
#[1 0 26 0 8 0 26 0 12 0 205 0 22] 
#[1 0 129 0 8 0 85 0 12 0 133 0 27 0 137 0 28 0 209 0 29] 
#[0 0 138 0 3 0 4 0 5 0 9 0 36]
	).
]
