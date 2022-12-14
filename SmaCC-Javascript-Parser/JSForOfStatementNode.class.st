Class {
	#name : #JSForOfStatementNode,
	#superclass : #JSStatementNode,
	#instVars : [
		'forToken',
		'leftParen',
		'variable',
		'ofToken',
		'expression',
		'rightParen',
		'statement',
		'varToken'
	],
	#category : 'SmaCC-Javascript-Parser'
}

{ #category : #generated }
JSForOfStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitForOfStatement: self
]

{ #category : #generated }
JSForOfStatementNode >> expression [
	^ expression
]

{ #category : #generated }
JSForOfStatementNode >> expression: aJSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aJSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
JSForOfStatementNode >> forToken [
	^ forToken
]

{ #category : #generated }
JSForOfStatementNode >> forToken: aSmaCCToken [
	forToken := aSmaCCToken
]

{ #category : #generated }
JSForOfStatementNode >> ignoredTokenVariables [
	^ #(#leftParen #rightParen)
]

{ #category : #generated }
JSForOfStatementNode >> leftParen [
	^ leftParen
]

{ #category : #generated }
JSForOfStatementNode >> leftParen: aSmaCCToken [
	leftParen := aSmaCCToken
]

{ #category : #generated }
JSForOfStatementNode >> nodeVariables [
	^ #(#variable #expression #statement)
]

{ #category : #generated }
JSForOfStatementNode >> ofToken [
	^ ofToken
]

{ #category : #generated }
JSForOfStatementNode >> ofToken: aSmaCCToken [
	ofToken := aSmaCCToken
]

{ #category : #generated }
JSForOfStatementNode >> rightParen [
	^ rightParen
]

{ #category : #generated }
JSForOfStatementNode >> rightParen: aSmaCCToken [
	rightParen := aSmaCCToken
]

{ #category : #generated }
JSForOfStatementNode >> statement [
	^ statement
]

{ #category : #generated }
JSForOfStatementNode >> statement: aJSStatementNode [
	self statement notNil
		ifTrue: [ self statement parent: nil ].
	statement := aJSStatementNode.
	self statement notNil
		ifTrue: [ self statement parent: self ]
]

{ #category : #generated }
JSForOfStatementNode >> tokenVariables [
	^ #(#forToken #ofToken #varToken)
]

{ #category : #generated }
JSForOfStatementNode >> varToken [
	^ varToken
]

{ #category : #generated }
JSForOfStatementNode >> varToken: aSmaCCToken [
	varToken := aSmaCCToken
]

{ #category : #generated }
JSForOfStatementNode >> variable [
	^ variable
]

{ #category : #generated }
JSForOfStatementNode >> variable: aJSProgramNode [
	self variable notNil
		ifTrue: [ self variable parent: nil ].
	variable := aJSProgramNode.
	self variable notNil
		ifTrue: [ self variable parent: self ]
]
