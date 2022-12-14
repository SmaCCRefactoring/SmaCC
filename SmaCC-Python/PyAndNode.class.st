Class {
	#name : #PyAndNode,
	#superclass : #PyRootNode,
	#instVars : [
		'one',
		'andToken',
		'two'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyAndNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitAnd: self
]

{ #category : #generated }
PyAndNode >> andToken [
	^ andToken
]

{ #category : #generated }
PyAndNode >> andToken: aSmaCCToken [
	andToken := aSmaCCToken
]

{ #category : #generated }
PyAndNode >> nodeVariables [
	^ #(#one #two)
]

{ #category : #generated }
PyAndNode >> one [
	^ one
]

{ #category : #generated }
PyAndNode >> one: aPyRootNode [
	self one notNil
		ifTrue: [ self one parent: nil ].
	one := aPyRootNode.
	self one notNil
		ifTrue: [ self one parent: self ]
]

{ #category : #generated }
PyAndNode >> tokenVariables [
	^ #(#andToken)
]

{ #category : #generated }
PyAndNode >> two [
	^ two
]

{ #category : #generated }
PyAndNode >> two: aPyRootNode [
	self two notNil
		ifTrue: [ self two parent: nil ].
	two := aPyRootNode.
	self two notNil
		ifTrue: [ self two parent: self ]
]
