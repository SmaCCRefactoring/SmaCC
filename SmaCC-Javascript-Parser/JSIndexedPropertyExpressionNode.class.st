Class {
	#name : #JSIndexedPropertyExpressionNode,
	#superclass : #JSExpressionNode,
	#instVars : [
		'expression',
		'leftBracket',
		'fieldExpression',
		'rightBracket'
	],
	#category : 'SmaCC-Javascript-Parser'
}

{ #category : #generated }
JSIndexedPropertyExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitIndexedPropertyExpression: self
]

{ #category : #generated }
JSIndexedPropertyExpressionNode >> expression [
	^ expression
]

{ #category : #generated }
JSIndexedPropertyExpressionNode >> expression: aJSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aJSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
JSIndexedPropertyExpressionNode >> fieldExpression [
	^ fieldExpression
]

{ #category : #generated }
JSIndexedPropertyExpressionNode >> fieldExpression: aJSExpressionNode [
	self fieldExpression notNil
		ifTrue: [ self fieldExpression parent: nil ].
	fieldExpression := aJSExpressionNode.
	self fieldExpression notNil
		ifTrue: [ self fieldExpression parent: self ]
]

{ #category : #generated }
JSIndexedPropertyExpressionNode >> ignoredTokenVariables [
	^ #(#leftBracket #rightBracket)
]

{ #category : #generated }
JSIndexedPropertyExpressionNode >> leftBracket [
	^ leftBracket
]

{ #category : #generated }
JSIndexedPropertyExpressionNode >> leftBracket: aSmaCCToken [
	leftBracket := aSmaCCToken
]

{ #category : #generated }
JSIndexedPropertyExpressionNode >> nodeVariables [
	^ #(#expression #fieldExpression)
]

{ #category : #generated }
JSIndexedPropertyExpressionNode >> rightBracket [
	^ rightBracket
]

{ #category : #generated }
JSIndexedPropertyExpressionNode >> rightBracket: aSmaCCToken [
	rightBracket := aSmaCCToken
]
