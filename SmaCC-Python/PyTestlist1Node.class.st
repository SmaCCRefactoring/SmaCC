Class {
	#name : #PyTestlist1Node,
	#superclass : #PyRootNode,
	#instVars : [
		'tests',
		'test',
		'commaToken'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyTestlist1Node >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitTestlist1: self
]

{ #category : #generated }
PyTestlist1Node >> commaToken [
	^ commaToken
]

{ #category : #generated }
PyTestlist1Node >> commaToken: aSmaCCToken [
	commaToken := aSmaCCToken
]

{ #category : #generated }
PyTestlist1Node >> nodeVariables [
	^ #(#test #tests)
]

{ #category : #generated }
PyTestlist1Node >> test [
	^ test
]

{ #category : #generated }
PyTestlist1Node >> test: aPyRootNode [
	self test notNil
		ifTrue: [ self test parent: nil ].
	test := aPyRootNode.
	self test notNil
		ifTrue: [ self test parent: self ]
]

{ #category : #generated }
PyTestlist1Node >> tests [
	^ tests
]

{ #category : #generated }
PyTestlist1Node >> tests: aPyRootNode [
	self tests notNil
		ifTrue: [ self tests parent: nil ].
	tests := aPyRootNode.
	self tests notNil
		ifTrue: [ self tests parent: self ]
]

{ #category : #generated }
PyTestlist1Node >> tokenVariables [
	^ #(#commaToken)
]
