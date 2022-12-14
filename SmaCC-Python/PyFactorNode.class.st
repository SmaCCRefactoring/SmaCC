Class {
	#name : #PyFactorNode,
	#superclass : #PyRootNode,
	#instVars : [
		'plusToken',
		'factor',
		'minusToken',
		'tildeToken'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyFactorNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitFactor: self
]

{ #category : #generated }
PyFactorNode >> factor [
	^ factor
]

{ #category : #generated }
PyFactorNode >> factor: aPyRootNode [
	self factor notNil
		ifTrue: [ self factor parent: nil ].
	factor := aPyRootNode.
	self factor notNil
		ifTrue: [ self factor parent: self ]
]

{ #category : #generated }
PyFactorNode >> minusToken [
	^ minusToken
]

{ #category : #generated }
PyFactorNode >> minusToken: aSmaCCToken [
	minusToken := aSmaCCToken
]

{ #category : #generated }
PyFactorNode >> nodeVariables [
	^ #(#factor)
]

{ #category : #generated }
PyFactorNode >> plusToken [
	^ plusToken
]

{ #category : #generated }
PyFactorNode >> plusToken: aSmaCCToken [
	plusToken := aSmaCCToken
]

{ #category : #generated }
PyFactorNode >> tildeToken [
	^ tildeToken
]

{ #category : #generated }
PyFactorNode >> tildeToken: aSmaCCToken [
	tildeToken := aSmaCCToken
]

{ #category : #generated }
PyFactorNode >> tokenVariables [
	^ #(#plusToken #minusToken #tildeToken)
]
