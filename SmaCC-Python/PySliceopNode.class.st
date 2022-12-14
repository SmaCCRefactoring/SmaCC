Class {
	#name : #PySliceopNode,
	#superclass : #PyRootNode,
	#instVars : [
		'colonToken',
		'test'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PySliceopNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitSliceop: self
]

{ #category : #generated }
PySliceopNode >> colonToken [
	^ colonToken
]

{ #category : #generated }
PySliceopNode >> colonToken: aSmaCCToken [
	colonToken := aSmaCCToken
]

{ #category : #generated }
PySliceopNode >> nodeVariables [
	^ #(#test)
]

{ #category : #generated }
PySliceopNode >> test [
	^ test
]

{ #category : #generated }
PySliceopNode >> test: aPyRootNode [
	self test notNil
		ifTrue: [ self test parent: nil ].
	test := aPyRootNode.
	self test notNil
		ifTrue: [ self test parent: self ]
]

{ #category : #generated }
PySliceopNode >> tokenVariables [
	^ #(#colonToken)
]
