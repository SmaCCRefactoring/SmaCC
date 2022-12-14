Class {
	#name : #PyAssertNode,
	#superclass : #PyRootNode,
	#instVars : [
		'assertToken',
		'condition'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyAssertNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitAssert: self
]

{ #category : #generated }
PyAssertNode >> assertToken [
	^ assertToken
]

{ #category : #generated }
PyAssertNode >> assertToken: aSmaCCToken [
	assertToken := aSmaCCToken
]

{ #category : #generated }
PyAssertNode >> condition [
	^ condition
]

{ #category : #generated }
PyAssertNode >> condition: aPyTestTestOptNode [
	self condition notNil
		ifTrue: [ self condition parent: nil ].
	condition := aPyTestTestOptNode.
	self condition notNil
		ifTrue: [ self condition parent: self ]
]

{ #category : #generated }
PyAssertNode >> nodeVariables [
	^ #(#condition)
]

{ #category : #generated }
PyAssertNode >> tokenVariables [
	^ #(#assertToken)
]
