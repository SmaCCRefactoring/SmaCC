Class {
	#name : #PyAndExprNode,
	#superclass : #PyRootNode,
	#instVars : [
		'one',
		'andToken',
		'two'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyAndExprNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitAndExpr: self
]

{ #category : #generated }
PyAndExprNode >> andToken [
	^ andToken
]

{ #category : #generated }
PyAndExprNode >> andToken: aSmaCCToken [
	andToken := aSmaCCToken
]

{ #category : #generated }
PyAndExprNode >> nodeVariables [
	^ #(#one #two)
]

{ #category : #generated }
PyAndExprNode >> one [
	^ one
]

{ #category : #generated }
PyAndExprNode >> one: aPyRootNode [
	self one notNil
		ifTrue: [ self one parent: nil ].
	one := aPyRootNode.
	self one notNil
		ifTrue: [ self one parent: self ]
]

{ #category : #generated }
PyAndExprNode >> tokenVariables [
	^ #(#andToken)
]

{ #category : #generated }
PyAndExprNode >> two [
	^ two
]

{ #category : #generated }
PyAndExprNode >> two: aPyRootNode [
	self two notNil
		ifTrue: [ self two parent: nil ].
	two := aPyRootNode.
	self two notNil
		ifTrue: [ self two parent: self ]
]
