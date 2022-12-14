Class {
	#name : #CGLRExpressionStatementNode,
	#superclass : #CGLRAbstractNode,
	#instVars : [
		'semicolonToken',
		'expression'
	],
	#category : 'SmaCC-C-Parser'
}

{ #category : #generated }
CGLRExpressionStatementNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitExpressionStatement: self
]

{ #category : #generated }
CGLRExpressionStatementNode >> expression [
	^ expression
]

{ #category : #generated }
CGLRExpressionStatementNode >> expression: aCGLRExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aCGLRExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
CGLRExpressionStatementNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
CGLRExpressionStatementNode >> semicolonToken [
	^ semicolonToken
]

{ #category : #generated }
CGLRExpressionStatementNode >> semicolonToken: aSmaCCToken [
	semicolonToken := aSmaCCToken
]

{ #category : #generated }
CGLRExpressionStatementNode >> tokenVariables [
	^ #(#semicolonToken)
]
