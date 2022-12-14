Class {
	#name : #CGLRPointNode,
	#superclass : #CGLRAbstractNode,
	#instVars : [
		'object',
		'periodToken',
		'member'
	],
	#category : 'SmaCC-C-Parser'
}

{ #category : #generated }
CGLRPointNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitPoint: self
]

{ #category : #generated }
CGLRPointNode >> member [
	^ member
]

{ #category : #generated }
CGLRPointNode >> member: aCGLRIdentifierNode [
	self member notNil
		ifTrue: [ self member parent: nil ].
	member := aCGLRIdentifierNode.
	self member notNil
		ifTrue: [ self member parent: self ]
]

{ #category : #generated }
CGLRPointNode >> nodeVariables [
	^ #(#object #member)
]

{ #category : #generated }
CGLRPointNode >> object [
	^ object
]

{ #category : #generated }
CGLRPointNode >> object: aCGLRAbstractNode [
	self object notNil
		ifTrue: [ self object parent: nil ].
	object := aCGLRAbstractNode.
	self object notNil
		ifTrue: [ self object parent: self ]
]

{ #category : #generated }
CGLRPointNode >> periodToken [
	^ periodToken
]

{ #category : #generated }
CGLRPointNode >> periodToken: aSmaCCToken [
	periodToken := aSmaCCToken
]

{ #category : #generated }
CGLRPointNode >> tokenVariables [
	^ #(#periodToken)
]
