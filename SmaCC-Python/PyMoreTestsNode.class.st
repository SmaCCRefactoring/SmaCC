Class {
	#name : #PyMoreTestsNode,
	#superclass : #PyRootNode,
	#instVars : [
		'commaToken',
		'test',
		'colonToken',
		'test2',
		'more_tests'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyMoreTestsNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitMoreTests: self
]

{ #category : #generated }
PyMoreTestsNode >> colonToken [
	^ colonToken
]

{ #category : #generated }
PyMoreTestsNode >> colonToken: aSmaCCToken [
	colonToken := aSmaCCToken
]

{ #category : #generated }
PyMoreTestsNode >> commaToken [
	^ commaToken
]

{ #category : #generated }
PyMoreTestsNode >> commaToken: aSmaCCToken [
	commaToken := aSmaCCToken
]

{ #category : #generated }
PyMoreTestsNode >> more_tests [
	^ more_tests
]

{ #category : #generated }
PyMoreTestsNode >> more_tests: anObject [
	more_tests := anObject
]

{ #category : #generated }
PyMoreTestsNode >> nodeVariables [
	^ #(#test #test2)
]

{ #category : #generated }
PyMoreTestsNode >> otherVariables [
	^ #(#more_tests)
]

{ #category : #generated }
PyMoreTestsNode >> test [
	^ test
]

{ #category : #generated }
PyMoreTestsNode >> test2 [
	^ test2
]

{ #category : #generated }
PyMoreTestsNode >> test2: aPyRootNode [
	self test2 notNil
		ifTrue: [ self test2 parent: nil ].
	test2 := aPyRootNode.
	self test2 notNil
		ifTrue: [ self test2 parent: self ]
]

{ #category : #generated }
PyMoreTestsNode >> test: aPyRootNode [
	self test notNil
		ifTrue: [ self test parent: nil ].
	test := aPyRootNode.
	self test notNil
		ifTrue: [ self test parent: self ]
]

{ #category : #generated }
PyMoreTestsNode >> tokenVariables [
	^ #(#commaToken #colonToken)
]
