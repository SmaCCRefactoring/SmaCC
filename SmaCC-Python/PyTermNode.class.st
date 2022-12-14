Class {
	#name : #PyTermNode,
	#superclass : #PyRootNode,
	#instVars : [
		'factor',
		'timesToken',
		'term',
		'divideToken',
		'percentToken',
		'divideDivideToken'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyTermNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitTerm: self
]

{ #category : #generated }
PyTermNode >> divideDivideToken [
	^ divideDivideToken
]

{ #category : #generated }
PyTermNode >> divideDivideToken: aSmaCCToken [
	divideDivideToken := aSmaCCToken
]

{ #category : #generated }
PyTermNode >> divideToken [
	^ divideToken
]

{ #category : #generated }
PyTermNode >> divideToken: aSmaCCToken [
	divideToken := aSmaCCToken
]

{ #category : #generated }
PyTermNode >> factor [
	^ factor
]

{ #category : #generated }
PyTermNode >> factor: aPyRootNode [
	self factor notNil
		ifTrue: [ self factor parent: nil ].
	factor := aPyRootNode.
	self factor notNil
		ifTrue: [ self factor parent: self ]
]

{ #category : #generated }
PyTermNode >> nodeVariables [
	^ #(#factor #term)
]

{ #category : #generated }
PyTermNode >> percentToken [
	^ percentToken
]

{ #category : #generated }
PyTermNode >> percentToken: aSmaCCToken [
	percentToken := aSmaCCToken
]

{ #category : #generated }
PyTermNode >> term [
	^ term
]

{ #category : #generated }
PyTermNode >> term: aPyRootNode [
	self term notNil
		ifTrue: [ self term parent: nil ].
	term := aPyRootNode.
	self term notNil
		ifTrue: [ self term parent: self ]
]

{ #category : #generated }
PyTermNode >> timesToken [
	^ timesToken
]

{ #category : #generated }
PyTermNode >> timesToken: aSmaCCToken [
	timesToken := aSmaCCToken
]

{ #category : #generated }
PyTermNode >> tokenVariables [
	^ #(#timesToken #divideToken #percentToken #divideDivideToken)
]
