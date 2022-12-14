Class {
	#name : #CGLRWhileStatementNode,
	#superclass : #CGLRAbstractNode,
	#instVars : [
		'statement',
		'whileToken',
		'leftParenToken',
		'rightParenToken',
		'while'
	],
	#category : 'SmaCC-C-Parser'
}

{ #category : #generated }
CGLRWhileStatementNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitWhileStatement: self
]

{ #category : #generated }
CGLRWhileStatementNode >> leftParenToken [
	^ leftParenToken
]

{ #category : #generated }
CGLRWhileStatementNode >> leftParenToken: aSmaCCToken [
	leftParenToken := aSmaCCToken
]

{ #category : #generated }
CGLRWhileStatementNode >> nodeVariables [
	^ #(#while #statement)
]

{ #category : #generated }
CGLRWhileStatementNode >> rightParenToken [
	^ rightParenToken
]

{ #category : #generated }
CGLRWhileStatementNode >> rightParenToken: aSmaCCToken [
	rightParenToken := aSmaCCToken
]

{ #category : #generated }
CGLRWhileStatementNode >> statement [
	^ statement
]

{ #category : #generated }
CGLRWhileStatementNode >> statement: aCGLRAbstractNode [
	self statement notNil
		ifTrue: [ self statement parent: nil ].
	statement := aCGLRAbstractNode.
	self statement notNil
		ifTrue: [ self statement parent: self ]
]

{ #category : #generated }
CGLRWhileStatementNode >> tokenVariables [
	^ #(#whileToken #leftParenToken #rightParenToken)
]

{ #category : #generated }
CGLRWhileStatementNode >> while [
	^ while
]

{ #category : #generated }
CGLRWhileStatementNode >> while: aCGLRExpressionNode [
	self while notNil
		ifTrue: [ self while parent: nil ].
	while := aCGLRExpressionNode.
	self while notNil
		ifTrue: [ self while parent: self ]
]

{ #category : #generated }
CGLRWhileStatementNode >> whileToken [
	^ whileToken
]

{ #category : #generated }
CGLRWhileStatementNode >> whileToken: aSmaCCToken [
	whileToken := aSmaCCToken
]
