Class {
	#name : #PyWithItemNode,
	#superclass : #PyRootNode,
	#instVars : [
		'test',
		'asToken',
		'expr'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyWithItemNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitWithItem: self
]

{ #category : #generated }
PyWithItemNode >> asToken [
	^ asToken
]

{ #category : #generated }
PyWithItemNode >> asToken: aSmaCCToken [
	asToken := aSmaCCToken
]

{ #category : #generated }
PyWithItemNode >> expr [
	^ expr
]

{ #category : #generated }
PyWithItemNode >> expr: aPyRootNode [
	self expr notNil
		ifTrue: [ self expr parent: nil ].
	expr := aPyRootNode.
	self expr notNil
		ifTrue: [ self expr parent: self ]
]

{ #category : #generated }
PyWithItemNode >> nodeVariables [
	^ #(#test #expr)
]

{ #category : #generated }
PyWithItemNode >> test [
	^ test
]

{ #category : #generated }
PyWithItemNode >> test: aPyRootNode [
	self test notNil
		ifTrue: [ self test parent: nil ].
	test := aPyRootNode.
	self test notNil
		ifTrue: [ self test parent: self ]
]

{ #category : #generated }
PyWithItemNode >> tokenVariables [
	^ #(#asToken)
]
