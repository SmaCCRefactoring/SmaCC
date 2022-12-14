Class {
	#name : #CGLRParenthesizedExpressionNode,
	#superclass : #CGLRAbstractNode,
	#instVars : [
		'leftParenToken',
		'rightParenToken',
		'expression'
	],
	#category : 'SmaCC-C-Parser'
}

{ #category : #generated }
CGLRParenthesizedExpressionNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitParenthesizedExpression: self
]

{ #category : #generated }
CGLRParenthesizedExpressionNode >> expression [
	^ expression
]

{ #category : #generated }
CGLRParenthesizedExpressionNode >> expression: aCGLRExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aCGLRExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
CGLRParenthesizedExpressionNode >> leftParenToken [
	^ leftParenToken
]

{ #category : #generated }
CGLRParenthesizedExpressionNode >> leftParenToken: aSmaCCToken [
	leftParenToken := aSmaCCToken
]

{ #category : #generated }
CGLRParenthesizedExpressionNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
CGLRParenthesizedExpressionNode >> rightParenToken [
	^ rightParenToken
]

{ #category : #generated }
CGLRParenthesizedExpressionNode >> rightParenToken: aSmaCCToken [
	rightParenToken := aSmaCCToken
]

{ #category : #generated }
CGLRParenthesizedExpressionNode >> tokenVariables [
	^ #(#leftParenToken #rightParenToken)
]
