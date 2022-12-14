Class {
	#name : #CGLRCastExpressionNode,
	#superclass : #CGLRAbstractNode,
	#instVars : [
		'expr',
		'type',
		'leftParenToken',
		'rightParenToken'
	],
	#category : 'SmaCC-C-Parser'
}

{ #category : #generated }
CGLRCastExpressionNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitCastExpression: self
]

{ #category : #generated }
CGLRCastExpressionNode >> expr [
	^ expr
]

{ #category : #generated }
CGLRCastExpressionNode >> expr: aCGLRAbstractNode [
	self expr notNil
		ifTrue: [ self expr parent: nil ].
	expr := aCGLRAbstractNode.
	self expr notNil
		ifTrue: [ self expr parent: self ]
]

{ #category : #generated }
CGLRCastExpressionNode >> leftParenToken [
	^ leftParenToken
]

{ #category : #generated }
CGLRCastExpressionNode >> leftParenToken: aSmaCCToken [
	leftParenToken := aSmaCCToken
]

{ #category : #generated }
CGLRCastExpressionNode >> nodeVariables [
	^ #(#type #expr)
]

{ #category : #generated }
CGLRCastExpressionNode >> rightParenToken [
	^ rightParenToken
]

{ #category : #generated }
CGLRCastExpressionNode >> rightParenToken: aSmaCCToken [
	rightParenToken := aSmaCCToken
]

{ #category : #generated }
CGLRCastExpressionNode >> tokenVariables [
	^ #(#leftParenToken #rightParenToken)
]

{ #category : #generated }
CGLRCastExpressionNode >> type [
	^ type
]

{ #category : #generated }
CGLRCastExpressionNode >> type: aCGLRTypeNameNode [
	self type notNil
		ifTrue: [ self type parent: nil ].
	type := aCGLRTypeNameNode.
	self type notNil
		ifTrue: [ self type parent: self ]
]
