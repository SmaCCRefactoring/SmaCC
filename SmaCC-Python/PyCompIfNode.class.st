Class {
	#name : #PyCompIfNode,
	#superclass : #PyRootNode,
	#instVars : [
		'ifToken',
		'condition',
		'iter'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyCompIfNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitCompIf: self
]

{ #category : #generated }
PyCompIfNode >> condition [
	^ condition
]

{ #category : #generated }
PyCompIfNode >> condition: aPyRootNode [
	self condition notNil
		ifTrue: [ self condition parent: nil ].
	condition := aPyRootNode.
	self condition notNil
		ifTrue: [ self condition parent: self ]
]

{ #category : #generated }
PyCompIfNode >> ifToken [
	^ ifToken
]

{ #category : #generated }
PyCompIfNode >> ifToken: aSmaCCToken [
	ifToken := aSmaCCToken
]

{ #category : #generated }
PyCompIfNode >> iter [
	^ iter
]

{ #category : #generated }
PyCompIfNode >> iter: aPyRootNode [
	self iter notNil
		ifTrue: [ self iter parent: nil ].
	iter := aPyRootNode.
	self iter notNil
		ifTrue: [ self iter parent: self ]
]

{ #category : #generated }
PyCompIfNode >> nodeVariables [
	^ #(#condition #iter)
]

{ #category : #generated }
PyCompIfNode >> tokenVariables [
	^ #(#ifToken)
]
