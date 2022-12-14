Class {
	#name : #PyTestTestOptNode,
	#superclass : #PyRootNode,
	#instVars : [
		'test1',
		'commaToken',
		'test2'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyTestTestOptNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitTestTestOpt: self
]

{ #category : #generated }
PyTestTestOptNode >> commaToken [
	^ commaToken
]

{ #category : #generated }
PyTestTestOptNode >> commaToken: aSmaCCToken [
	commaToken := aSmaCCToken
]

{ #category : #generated }
PyTestTestOptNode >> nodeVariables [
	^ #(#test1 #test2)
]

{ #category : #generated }
PyTestTestOptNode >> test1 [
	^ test1
]

{ #category : #generated }
PyTestTestOptNode >> test1: aPyRootNode [
	self test1 notNil
		ifTrue: [ self test1 parent: nil ].
	test1 := aPyRootNode.
	self test1 notNil
		ifTrue: [ self test1 parent: self ]
]

{ #category : #generated }
PyTestTestOptNode >> test2 [
	^ test2
]

{ #category : #generated }
PyTestTestOptNode >> test2: aPyRootNode [
	self test2 notNil
		ifTrue: [ self test2 parent: nil ].
	test2 := aPyRootNode.
	self test2 notNil
		ifTrue: [ self test2 parent: self ]
]

{ #category : #generated }
PyTestTestOptNode >> tokenVariables [
	^ #(#commaToken)
]
