Class {
	#name : #PyPlusExprNode,
	#superclass : #PyRootNode,
	#instVars : [
		'one',
		'plusToken',
		'two'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyPlusExprNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitPlusExpr: self
]

{ #category : #generated }
PyPlusExprNode >> nodeVariables [
	^ #(#one #two)
]

{ #category : #generated }
PyPlusExprNode >> one [
	^ one
]

{ #category : #generated }
PyPlusExprNode >> one: aPyRootNode [
	self one notNil
		ifTrue: [ self one parent: nil ].
	one := aPyRootNode.
	self one notNil
		ifTrue: [ self one parent: self ]
]

{ #category : #generated }
PyPlusExprNode >> plusToken [
	^ plusToken
]

{ #category : #generated }
PyPlusExprNode >> plusToken: aSmaCCToken [
	plusToken := aSmaCCToken
]

{ #category : #generated }
PyPlusExprNode >> tokenVariables [
	^ #(#plusToken)
]

{ #category : #generated }
PyPlusExprNode >> two [
	^ two
]

{ #category : #generated }
PyPlusExprNode >> two: aPyRootNode [
	self two notNil
		ifTrue: [ self two parent: nil ].
	two := aPyRootNode.
	self two notNil
		ifTrue: [ self two parent: self ]
]
