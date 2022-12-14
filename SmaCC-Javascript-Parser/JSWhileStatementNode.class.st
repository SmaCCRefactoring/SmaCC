Class {
	#name : #JSWhileStatementNode,
	#superclass : #JSStatementNode,
	#instVars : [
		'whileToken',
		'leftParen',
		'expression',
		'rightParen',
		'statement'
	],
	#category : 'SmaCC-Javascript-Parser'
}

{ #category : #generated }
JSWhileStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitWhileStatement: self
]

{ #category : #generated }
JSWhileStatementNode >> expression [
	^ expression
]

{ #category : #generated }
JSWhileStatementNode >> expression: aJSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aJSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
JSWhileStatementNode >> ignoredTokenVariables [
	^ #(#leftParen #rightParen)
]

{ #category : #generated }
JSWhileStatementNode >> leftParen [
	^ leftParen
]

{ #category : #generated }
JSWhileStatementNode >> leftParen: aSmaCCToken [
	leftParen := aSmaCCToken
]

{ #category : #generated }
JSWhileStatementNode >> nodeVariables [
	^ #(#expression #statement)
]

{ #category : #generated }
JSWhileStatementNode >> rightParen [
	^ rightParen
]

{ #category : #generated }
JSWhileStatementNode >> rightParen: aSmaCCToken [
	rightParen := aSmaCCToken
]

{ #category : #generated }
JSWhileStatementNode >> statement [
	^ statement
]

{ #category : #generated }
JSWhileStatementNode >> statement: aJSStatementNode [
	self statement notNil
		ifTrue: [ self statement parent: nil ].
	statement := aJSStatementNode.
	self statement notNil
		ifTrue: [ self statement parent: self ]
]

{ #category : #generated }
JSWhileStatementNode >> tokenVariables [
	^ #(#whileToken)
]

{ #category : #generated }
JSWhileStatementNode >> whileToken [
	^ whileToken
]

{ #category : #generated }
JSWhileStatementNode >> whileToken: aSmaCCToken [
	whileToken := aSmaCCToken
]
