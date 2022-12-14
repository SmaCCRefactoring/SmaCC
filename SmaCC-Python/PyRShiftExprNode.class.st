Class {
	#name : #PyRShiftExprNode,
	#superclass : #PyRootNode,
	#instVars : [
		'one',
		'greaterThanGreaterThanToken',
		'two'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyRShiftExprNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitRShiftExpr: self
]

{ #category : #generated }
PyRShiftExprNode >> greaterThanGreaterThanToken [
	^ greaterThanGreaterThanToken
]

{ #category : #generated }
PyRShiftExprNode >> greaterThanGreaterThanToken: aSmaCCToken [
	greaterThanGreaterThanToken := aSmaCCToken
]

{ #category : #generated }
PyRShiftExprNode >> nodeVariables [
	^ #(#one #two)
]

{ #category : #generated }
PyRShiftExprNode >> one [
	^ one
]

{ #category : #generated }
PyRShiftExprNode >> one: aPyRootNode [
	self one notNil
		ifTrue: [ self one parent: nil ].
	one := aPyRootNode.
	self one notNil
		ifTrue: [ self one parent: self ]
]

{ #category : #generated }
PyRShiftExprNode >> tokenVariables [
	^ #(#greaterThanGreaterThanToken)
]

{ #category : #generated }
PyRShiftExprNode >> two [
	^ two
]

{ #category : #generated }
PyRShiftExprNode >> two: aPyRootNode [
	self two notNil
		ifTrue: [ self two parent: nil ].
	two := aPyRootNode.
	self two notNil
		ifTrue: [ self two parent: self ]
]
