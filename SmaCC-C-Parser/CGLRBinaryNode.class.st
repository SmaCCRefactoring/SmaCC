Class {
	#name : #CGLRBinaryNode,
	#superclass : #CGLRAbstractNode,
	#instVars : [
		'left',
		'op',
		'right'
	],
	#category : 'SmaCC-C-Parser'
}

{ #category : #generated }
CGLRBinaryNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitBinary: self
]

{ #category : #generated }
CGLRBinaryNode >> left [
	^ left
]

{ #category : #generated }
CGLRBinaryNode >> left: aCGLRAbstractNode [
	self left notNil
		ifTrue: [ self left parent: nil ].
	left := aCGLRAbstractNode.
	self left notNil
		ifTrue: [ self left parent: self ]
]

{ #category : #generated }
CGLRBinaryNode >> nodeVariables [
	^ #(#left #right)
]

{ #category : #generated }
CGLRBinaryNode >> op [
	^ op
]

{ #category : #generated }
CGLRBinaryNode >> op: aSmaCCToken [
	op := aSmaCCToken
]

{ #category : #generated }
CGLRBinaryNode >> right [
	^ right
]

{ #category : #generated }
CGLRBinaryNode >> right: aCGLRAbstractNode [
	self right notNil
		ifTrue: [ self right parent: nil ].
	right := aCGLRAbstractNode.
	self right notNil
		ifTrue: [ self right parent: self ]
]

{ #category : #generated }
CGLRBinaryNode >> tokenVariables [
	^ #(#op)
]
