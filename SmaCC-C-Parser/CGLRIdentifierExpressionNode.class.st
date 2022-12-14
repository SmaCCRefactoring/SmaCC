Class {
	#name : #CGLRIdentifierExpressionNode,
	#superclass : #CGLRAbstractNode,
	#instVars : [
		'symbol'
	],
	#category : 'SmaCC-C-Parser'
}

{ #category : #generated }
CGLRIdentifierExpressionNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitIdentifierExpression: self
]

{ #category : #generated }
CGLRIdentifierExpressionNode >> nodeVariables [
	^ #(#symbol)
]

{ #category : #generated }
CGLRIdentifierExpressionNode >> symbol [
	^ symbol
]

{ #category : #generated }
CGLRIdentifierExpressionNode >> symbol: aCGLRIdentifierNode [
	self symbol notNil
		ifTrue: [ self symbol parent: nil ].
	symbol := aCGLRIdentifierNode.
	self symbol notNil
		ifTrue: [ self symbol parent: self ]
]
