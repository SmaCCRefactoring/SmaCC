Class {
	#name : #PyMinusExprNode,
	#superclass : #PyRootNode,
	#instVars : [
		'one',
		'minusToken',
		'two'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyMinusExprNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitMinusExpr: self
]

{ #category : #generated }
PyMinusExprNode >> minusToken [
	^ minusToken
]

{ #category : #generated }
PyMinusExprNode >> minusToken: aSmaCCToken [
	minusToken := aSmaCCToken
]

{ #category : #generated }
PyMinusExprNode >> nodeVariables [
	^ #(#one #two)
]

{ #category : #generated }
PyMinusExprNode >> one [
	^ one
]

{ #category : #generated }
PyMinusExprNode >> one: aPyRootNode [
	self one notNil
		ifTrue: [ self one parent: nil ].
	one := aPyRootNode.
	self one notNil
		ifTrue: [ self one parent: self ]
]

{ #category : #generated }
PyMinusExprNode >> tokenVariables [
	^ #(#minusToken)
]

{ #category : #generated }
PyMinusExprNode >> two [
	^ two
]

{ #category : #generated }
PyMinusExprNode >> two: aPyRootNode [
	self two notNil
		ifTrue: [ self two parent: nil ].
	two := aPyRootNode.
	self two notNil
		ifTrue: [ self two parent: self ]
]
