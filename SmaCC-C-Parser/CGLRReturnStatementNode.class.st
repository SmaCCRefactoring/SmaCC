Class {
	#name : #CGLRReturnStatementNode,
	#superclass : #CGLRAbstractNode,
	#instVars : [
		'returnToken',
		'semicolonToken',
		'expr'
	],
	#category : 'SmaCC-C-Parser'
}

{ #category : #generated }
CGLRReturnStatementNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitReturnStatement: self
]

{ #category : #generated }
CGLRReturnStatementNode >> expr [
	^ expr
]

{ #category : #generated }
CGLRReturnStatementNode >> expr: aCGLRExpressionNode [
	self expr notNil
		ifTrue: [ self expr parent: nil ].
	expr := aCGLRExpressionNode.
	self expr notNil
		ifTrue: [ self expr parent: self ]
]

{ #category : #generated }
CGLRReturnStatementNode >> nodeVariables [
	^ #(#expr)
]

{ #category : #generated }
CGLRReturnStatementNode >> returnToken [
	^ returnToken
]

{ #category : #generated }
CGLRReturnStatementNode >> returnToken: aSmaCCToken [
	returnToken := aSmaCCToken
]

{ #category : #generated }
CGLRReturnStatementNode >> semicolonToken [
	^ semicolonToken
]

{ #category : #generated }
CGLRReturnStatementNode >> semicolonToken: aSmaCCToken [
	semicolonToken := aSmaCCToken
]

{ #category : #generated }
CGLRReturnStatementNode >> tokenVariables [
	^ #(#returnToken #semicolonToken)
]
