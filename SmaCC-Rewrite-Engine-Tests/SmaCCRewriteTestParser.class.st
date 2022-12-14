Class {
	#name : #SmaCCRewriteTestParser,
	#superclass : #SmaCCGLRParser,
	#category : 'SmaCC-Rewrite-Engine-Tests'
}

{ #category : #'generated-accessing' }
SmaCCRewriteTestParser class >> cacheId [
	^'2017-05-03T21:10:05.510713+02:00'
]

{ #category : #generated }
SmaCCRewriteTestParser class >> definitionComment [
"%glr;

%left ""+"" ""-"";
%left ""*"" ""/"";
%right ""^"";

%prefix SmaCCRewriteTest;
%suffix Node;
%root Expression;
%ignore_variables leftParen rightParen;

%hierarchy Expression (
	Number
	BinaryExpression
	);

<number>
	: \d+
	;

<whitespace>
	: \s+
	;

<patternToken>
	: \` [^\`]* \`
	;

Expression
	: ""("" 'leftParen' Expression "")"" 'rightParen' {{Expression}}
	| Expression 'left' ""+"" 'operator' Expression 'right' {{BinaryExpression}}
	| Expression 'left' ""-"" 'operator' Expression 'right' {{BinaryExpression}}
	| Expression 'left' ""*"" 'operator' Expression 'right' {{BinaryExpression}}
	| Expression 'left' ""/"" 'operator' Expression 'right' {{BinaryExpression}}
	| Expression 'left' ""^"" 'operator' Expression 'right' {{BinaryExpression}}
	| <number> 'number' {{Number}}
	;"
]

{ #category : #'generated-accessing' }
SmaCCRewriteTestParser class >> scannerClass [
	^SmaCCRewriteTestScanner
]

{ #category : #generated }
SmaCCRewriteTestParser class >> startingStateForExpression [
	^ 1
]

{ #category : #'generated-reduction actions' }
SmaCCRewriteTestParser >> reduceActionForExpression1: nodes [
	| result |
	result := nodes at: 2.
	result addFirstToken: (nodes at: 1) to: result leftParens.
	result addToken: (nodes at: 3) to: result rightParens.
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCRewriteTestParser >> reduceActionForExpression3: nodes [
	| result |
	result := SmaCCRewriteTestBinaryExpressionNode new.
	result left: (nodes at: 1).
	result operator: (nodes at: 2).
	result right: (nodes at: 3).
	^ result
]

{ #category : #'generated-reduction actions' }
SmaCCRewriteTestParser >> reduceActionForExpression7: nodes [
	| result |
	result := SmaCCRewriteTestNumberNode new.
	result number: (nodes at: 1).
	^ result
]

{ #category : #generated }
SmaCCRewriteTestParser >> reduceTable [
^#(
	#(14 1 #reduceActionForExpression7:) 
	#(14 3 #reduceActionForExpression1:) 
	#(14 3 #reduceActionForExpression3:)
	).
]

{ #category : #generated }
SmaCCRewriteTestParser >> symbolNames [
	^ #('"-"' '")"' '"+"' '"*"' '"("' '"^"' '"/"' '<number>' '<whitespace>' '<patternToken>' 'B e g i n' 'error' 'E O F' 'Expression')
]

{ #category : #generated }
SmaCCRewriteTestParser >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCRewriteTestExpressionNode #SmaCCToken #SmaCCToken #SmaCCRewriteTestExpressionNode)
]

{ #category : #generated }
SmaCCRewriteTestParser >> transitionTable [
^#(
#[1 0 9 0 5 0 13 0 8 0 17 0 14] 
#[1 0 9 0 5 0 13 0 8 0 21 0 14] 
#[0 0 6 0 1 0 2 0 3 0 4 0 6 0 7 0 13] 
#[1 0 25 0 1 0 29 0 3 0 33 0 4 0 37 0 6 0 41 0 7 0 0 0 13] 
#[1 0 25 0 1 0 45 0 2 0 29 0 3 0 33 0 4 0 37 0 6 0 41 0 7] 
#[1 0 9 0 5 0 13 0 8 0 49 0 14] 
#[1 0 9 0 5 0 13 0 8 0 53 0 14] 
#[1 0 9 0 5 0 13 0 8 0 57 0 14] 
#[1 0 9 0 5 0 13 0 8 0 61 0 14] 
#[1 0 9 0 5 0 13 0 8 0 65 0 14] 
#[0 0 10 0 1 0 2 0 3 0 4 0 6 0 7 0 13] 
#[1 0 14 0 1 0 14 0 2 0 14 0 3 0 33 0 4 0 37 0 6 0 41 0 7 0 14 0 13] 
#[1 0 14 0 1 0 14 0 2 0 14 0 3 0 33 0 4 0 37 0 6 0 41 0 7 0 14 0 13] 
#[1 0 14 0 1 0 14 0 2 0 14 0 3 0 14 0 4 0 37 0 6 0 14 0 7 0 14 0 13] 
#[1 0 14 0 1 0 14 0 2 0 14 0 3 0 14 0 4 0 37 0 6 0 14 0 7 0 14 0 13] 
#[1 0 14 0 1 0 14 0 2 0 14 0 3 0 14 0 4 0 37 0 6 0 14 0 7 0 14 0 13]
	).
]
