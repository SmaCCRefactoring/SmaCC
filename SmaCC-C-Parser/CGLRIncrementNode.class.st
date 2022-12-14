Class {
	#name : #CGLRIncrementNode,
	#superclass : #CGLRAbstractNode,
	#instVars : [
		'object',
		'plusPlusToken'
	],
	#category : 'SmaCC-C-Parser'
}

{ #category : #generated }
CGLRIncrementNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitIncrement: self
]

{ #category : #generated }
CGLRIncrementNode >> nodeVariables [
	^ #(#object)
]

{ #category : #generated }
CGLRIncrementNode >> object [
	^ object
]

{ #category : #generated }
CGLRIncrementNode >> object: aCGLRAbstractNode [
	self object notNil
		ifTrue: [ self object parent: nil ].
	object := aCGLRAbstractNode.
	self object notNil
		ifTrue: [ self object parent: self ]
]

{ #category : #generated }
CGLRIncrementNode >> plusPlusToken [
	^ plusPlusToken
]

{ #category : #generated }
CGLRIncrementNode >> plusPlusToken: aSmaCCToken [
	plusPlusToken := aSmaCCToken
]

{ #category : #generated }
CGLRIncrementNode >> tokenVariables [
	^ #(#plusPlusToken)
]
