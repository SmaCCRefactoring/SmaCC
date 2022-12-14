Class {
	#name : #PyInitOptNode,
	#superclass : #PyRootNode,
	#instVars : [
		'equalToken',
		'test'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyInitOptNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitInitOpt: self
]

{ #category : #generated }
PyInitOptNode >> equalToken [
	^ equalToken
]

{ #category : #generated }
PyInitOptNode >> equalToken: aSmaCCToken [
	equalToken := aSmaCCToken
]

{ #category : #generated }
PyInitOptNode >> nodeVariables [
	^ #(#test)
]

{ #category : #generated }
PyInitOptNode >> test [
	^ test
]

{ #category : #generated }
PyInitOptNode >> test: aPyRootNode [
	self test notNil
		ifTrue: [ self test parent: nil ].
	test := aPyRootNode.
	self test notNil
		ifTrue: [ self test parent: self ]
]

{ #category : #generated }
PyInitOptNode >> tokenVariables [
	^ #(#equalToken)
]
