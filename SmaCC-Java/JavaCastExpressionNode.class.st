Class {
	#name : #JavaCastExpressionNode,
	#superclass : #JavaExpressionNode,
	#instVars : [
		'leftParen',
		'type',
		'rightParen',
		'expression'
	],
	#category : 'SmaCC-Java'
}

{ #category : #generated }
JavaCastExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitCastExpression: self
]

{ #category : #generated }
JavaCastExpressionNode >> expression [
	^ expression
]

{ #category : #generated }
JavaCastExpressionNode >> expression: aJavaExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aJavaExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
JavaCastExpressionNode >> ignoredTokenVariables [
	^ #(#leftParen #rightParen)
]

{ #category : #generated }
JavaCastExpressionNode >> leftParen [
	^ leftParen
]

{ #category : #generated }
JavaCastExpressionNode >> leftParen: aSmaCCToken [
	leftParen := aSmaCCToken
]

{ #category : #generated }
JavaCastExpressionNode >> nodeVariables [
	^ #(#type #expression)
]

{ #category : #generated }
JavaCastExpressionNode >> rightParen [
	^ rightParen
]

{ #category : #generated }
JavaCastExpressionNode >> rightParen: aSmaCCToken [
	rightParen := aSmaCCToken
]

{ #category : #generated }
JavaCastExpressionNode >> type [
	^ type
]

{ #category : #generated }
JavaCastExpressionNode >> type: aJavaTypeNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aJavaTypeNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]
