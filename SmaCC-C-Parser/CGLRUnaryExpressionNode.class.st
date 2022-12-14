Class {
	#name : #CGLRUnaryExpressionNode,
	#superclass : #CGLRAbstractNode,
	#instVars : [
		'op',
		'expr',
		'sizeofToken',
		'leftParenToken',
		'type'
	],
	#category : 'SmaCC-C-Parser'
}

{ #category : #generated }
CGLRUnaryExpressionNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitUnaryExpression: self
]

{ #category : #generated }
CGLRUnaryExpressionNode >> expr [
	^ expr
]

{ #category : #generated }
CGLRUnaryExpressionNode >> expr: anObject [
	expr := anObject
]

{ #category : #generated }
CGLRUnaryExpressionNode >> leftParenToken [
	^ leftParenToken
]

{ #category : #generated }
CGLRUnaryExpressionNode >> leftParenToken: aSmaCCToken [
	leftParenToken := aSmaCCToken
]

{ #category : #generated }
CGLRUnaryExpressionNode >> nodeVariables [
	^ #(#type)
]

{ #category : #generated }
CGLRUnaryExpressionNode >> op [
	^ op
]

{ #category : #generated }
CGLRUnaryExpressionNode >> op: aSmaCCToken [
	op := aSmaCCToken
]

{ #category : #generated }
CGLRUnaryExpressionNode >> otherVariables [
	^ #(#expr)
]

{ #category : #generated }
CGLRUnaryExpressionNode >> sizeofToken [
	^ sizeofToken
]

{ #category : #generated }
CGLRUnaryExpressionNode >> sizeofToken: aSmaCCToken [
	sizeofToken := aSmaCCToken
]

{ #category : #generated }
CGLRUnaryExpressionNode >> tokenVariables [
	^ #(#op #sizeofToken #leftParenToken)
]

{ #category : #generated }
CGLRUnaryExpressionNode >> type [
	^ type
]

{ #category : #generated }
CGLRUnaryExpressionNode >> type: aCGLRTypeNameNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aCGLRTypeNameNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]
