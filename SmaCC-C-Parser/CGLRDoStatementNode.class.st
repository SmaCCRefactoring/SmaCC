Class {
	#name : #CGLRDoStatementNode,
	#superclass : #CGLRAbstractNode,
	#instVars : [
		'statement',
		'doToken',
		'whileToken',
		'leftParenToken',
		'rightParenToken',
		'semicolonToken',
		'while'
	],
	#category : 'SmaCC-C-Parser'
}

{ #category : #generated }
CGLRDoStatementNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitDoStatement: self
]

{ #category : #generated }
CGLRDoStatementNode >> doToken [
	^ doToken
]

{ #category : #generated }
CGLRDoStatementNode >> doToken: aSmaCCToken [
	doToken := aSmaCCToken
]

{ #category : #generated }
CGLRDoStatementNode >> leftParenToken [
	^ leftParenToken
]

{ #category : #generated }
CGLRDoStatementNode >> leftParenToken: aSmaCCToken [
	leftParenToken := aSmaCCToken
]

{ #category : #generated }
CGLRDoStatementNode >> nodeVariables [
	^ #(#statement #while)
]

{ #category : #generated }
CGLRDoStatementNode >> rightParenToken [
	^ rightParenToken
]

{ #category : #generated }
CGLRDoStatementNode >> rightParenToken: aSmaCCToken [
	rightParenToken := aSmaCCToken
]

{ #category : #generated }
CGLRDoStatementNode >> semicolonToken [
	^ semicolonToken
]

{ #category : #generated }
CGLRDoStatementNode >> semicolonToken: aSmaCCToken [
	semicolonToken := aSmaCCToken
]

{ #category : #generated }
CGLRDoStatementNode >> statement [
	^ statement
]

{ #category : #generated }
CGLRDoStatementNode >> statement: aCGLRAbstractNode [
	self statement notNil
		ifTrue: [ self statement parent: nil ].
	statement := aCGLRAbstractNode.
	self statement notNil
		ifTrue: [ self statement parent: self ]
]

{ #category : #generated }
CGLRDoStatementNode >> tokenVariables [
	^ #(#doToken #whileToken #leftParenToken #rightParenToken #semicolonToken)
]

{ #category : #generated }
CGLRDoStatementNode >> while [
	^ while
]

{ #category : #generated }
CGLRDoStatementNode >> while: aCGLRExpressionNode [
	self while notNil
		ifTrue: [ self while parent: nil ].
	while := aCGLRExpressionNode.
	self while notNil
		ifTrue: [ self while parent: self ]
]

{ #category : #generated }
CGLRDoStatementNode >> whileToken [
	^ whileToken
]

{ #category : #generated }
CGLRDoStatementNode >> whileToken: aSmaCCToken [
	whileToken := aSmaCCToken
]
