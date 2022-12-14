Class {
	#name : #CGLRArrowNode,
	#superclass : #CGLRAbstractNode,
	#instVars : [
		'_pointer',
		'minusGreaterThanToken',
		'member'
	],
	#category : 'SmaCC-C-Parser'
}

{ #category : #generated }
CGLRArrowNode >> _pointer [
	^ _pointer
]

{ #category : #generated }
CGLRArrowNode >> _pointer: aCGLRAbstractNode [
	self _pointer notNil
		ifTrue: [ self _pointer parent: nil ].
	_pointer := aCGLRAbstractNode.
	self _pointer notNil
		ifTrue: [ self _pointer parent: self ]
]

{ #category : #generated }
CGLRArrowNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitArrow: self
]

{ #category : #generated }
CGLRArrowNode >> member [
	^ member
]

{ #category : #generated }
CGLRArrowNode >> member: aCGLRIdentifierNode [
	self member notNil
		ifTrue: [ self member parent: nil ].
	member := aCGLRIdentifierNode.
	self member notNil
		ifTrue: [ self member parent: self ]
]

{ #category : #generated }
CGLRArrowNode >> minusGreaterThanToken [
	^ minusGreaterThanToken
]

{ #category : #generated }
CGLRArrowNode >> minusGreaterThanToken: aSmaCCToken [
	minusGreaterThanToken := aSmaCCToken
]

{ #category : #generated }
CGLRArrowNode >> nodeVariables [
	^ #(#_pointer #member)
]

{ #category : #generated }
CGLRArrowNode >> tokenVariables [
	^ #(#minusGreaterThanToken)
]
