Class {
	#name : #CGLRAssignmentNode,
	#superclass : #CGLRAbstractNode,
	#instVars : [
		'lvalue',
		'op',
		'rvalue'
	],
	#category : 'SmaCC-C-Parser'
}

{ #category : #generated }
CGLRAssignmentNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitAssignment: self
]

{ #category : #generated }
CGLRAssignmentNode >> lvalue [
	^ lvalue
]

{ #category : #generated }
CGLRAssignmentNode >> lvalue: aCGLRAbstractNode [
	self lvalue notNil
		ifTrue: [ self lvalue parent: nil ].
	lvalue := aCGLRAbstractNode.
	self lvalue notNil
		ifTrue: [ self lvalue parent: self ]
]

{ #category : #generated }
CGLRAssignmentNode >> nodeVariables [
	^ #(#lvalue #rvalue)
]

{ #category : #generated }
CGLRAssignmentNode >> op [
	^ op
]

{ #category : #generated }
CGLRAssignmentNode >> op: aSmaCCToken [
	op := aSmaCCToken
]

{ #category : #generated }
CGLRAssignmentNode >> rvalue [
	^ rvalue
]

{ #category : #generated }
CGLRAssignmentNode >> rvalue: aCGLRAbstractNode [
	self rvalue notNil
		ifTrue: [ self rvalue parent: nil ].
	rvalue := aCGLRAbstractNode.
	self rvalue notNil
		ifTrue: [ self rvalue parent: self ]
]

{ #category : #generated }
CGLRAssignmentNode >> tokenVariables [
	^ #(#op)
]
