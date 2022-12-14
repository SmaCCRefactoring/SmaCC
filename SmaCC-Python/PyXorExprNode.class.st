Class {
	#name : #PyXorExprNode,
	#superclass : #PyRootNode,
	#instVars : [
		'one',
		'upArrowToken',
		'two'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyXorExprNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitXorExpr: self
]

{ #category : #generated }
PyXorExprNode >> nodeVariables [
	^ #(#one #two)
]

{ #category : #generated }
PyXorExprNode >> one [
	^ one
]

{ #category : #generated }
PyXorExprNode >> one: aPyRootNode [
	self one notNil
		ifTrue: [ self one parent: nil ].
	one := aPyRootNode.
	self one notNil
		ifTrue: [ self one parent: self ]
]

{ #category : #generated }
PyXorExprNode >> tokenVariables [
	^ #(#upArrowToken)
]

{ #category : #generated }
PyXorExprNode >> two [
	^ two
]

{ #category : #generated }
PyXorExprNode >> two: aPyRootNode [
	self two notNil
		ifTrue: [ self two parent: nil ].
	two := aPyRootNode.
	self two notNil
		ifTrue: [ self two parent: self ]
]

{ #category : #generated }
PyXorExprNode >> upArrowToken [
	^ upArrowToken
]

{ #category : #generated }
PyXorExprNode >> upArrowToken: aSmaCCToken [
	upArrowToken := aSmaCCToken
]
