Class {
	#name : #JSWithStatementNode,
	#superclass : #JSStatementNode,
	#instVars : [
		'withToken',
		'leftParen',
		'expression',
		'rightParen',
		'statement'
	],
	#category : 'SmaCC-Javascript-Parser'
}

{ #category : #generated }
JSWithStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitWithStatement: self
]

{ #category : #generated }
JSWithStatementNode >> expression [
	^ expression
]

{ #category : #generated }
JSWithStatementNode >> expression: aJSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aJSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
JSWithStatementNode >> ignoredTokenVariables [
	^ #(#leftParen #rightParen)
]

{ #category : #generated }
JSWithStatementNode >> leftParen [
	^ leftParen
]

{ #category : #generated }
JSWithStatementNode >> leftParen: aSmaCCToken [
	leftParen := aSmaCCToken
]

{ #category : #generated }
JSWithStatementNode >> nodeVariables [
	^ #(#expression #statement)
]

{ #category : #generated }
JSWithStatementNode >> rightParen [
	^ rightParen
]

{ #category : #generated }
JSWithStatementNode >> rightParen: aSmaCCToken [
	rightParen := aSmaCCToken
]

{ #category : #generated }
JSWithStatementNode >> statement [
	^ statement
]

{ #category : #generated }
JSWithStatementNode >> statement: aJSStatementNode [
	self statement notNil
		ifTrue: [ self statement parent: nil ].
	statement := aJSStatementNode.
	self statement notNil
		ifTrue: [ self statement parent: self ]
]

{ #category : #generated }
JSWithStatementNode >> tokenVariables [
	^ #(#withToken)
]

{ #category : #generated }
JSWithStatementNode >> withToken [
	^ withToken
]

{ #category : #generated }
JSWithStatementNode >> withToken: aSmaCCToken [
	withToken := aSmaCCToken
]
