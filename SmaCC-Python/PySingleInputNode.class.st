Class {
	#name : #PySingleInputNode,
	#superclass : #PyRootNode,
	#instVars : [
		'nEWLINEToken',
		'statement'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PySingleInputNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitSingleInput: self
]

{ #category : #generated }
PySingleInputNode >> nEWLINEToken [
	^ nEWLINEToken
]

{ #category : #generated }
PySingleInputNode >> nEWLINEToken: aSmaCCToken [
	nEWLINEToken := aSmaCCToken
]

{ #category : #generated }
PySingleInputNode >> nodeVariables [
	^ #(#statement)
]

{ #category : #generated }
PySingleInputNode >> statement [
	^ statement
]

{ #category : #generated }
PySingleInputNode >> statement: aPyRootNode [
	self statement notNil
		ifTrue: [ self statement parent: nil ].
	statement := aPyRootNode.
	self statement notNil
		ifTrue: [ self statement parent: self ]
]

{ #category : #generated }
PySingleInputNode >> tokenVariables [
	^ #(#nEWLINEToken)
]
