Class {
	#name : #CGLRDecrementNode,
	#superclass : #CGLRAbstractNode,
	#instVars : [
		'object',
		'minusMinusToken'
	],
	#category : 'SmaCC-C-Parser'
}

{ #category : #generated }
CGLRDecrementNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitDecrement: self
]

{ #category : #generated }
CGLRDecrementNode >> minusMinusToken [
	^ minusMinusToken
]

{ #category : #generated }
CGLRDecrementNode >> minusMinusToken: aSmaCCToken [
	minusMinusToken := aSmaCCToken
]

{ #category : #generated }
CGLRDecrementNode >> nodeVariables [
	^ #(#object)
]

{ #category : #generated }
CGLRDecrementNode >> object [
	^ object
]

{ #category : #generated }
CGLRDecrementNode >> object: aCGLRAbstractNode [
	self object notNil
		ifTrue: [ self object parent: nil ].
	object := aCGLRAbstractNode.
	self object notNil
		ifTrue: [ self object parent: self ]
]

{ #category : #generated }
CGLRDecrementNode >> tokenVariables [
	^ #(#minusMinusToken)
]
