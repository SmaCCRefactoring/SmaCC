Class {
	#name : #PyNotNode,
	#superclass : #PyRootNode,
	#instVars : [
		'notToken',
		'negated'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyNotNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitNot: self
]

{ #category : #generated }
PyNotNode >> negated [
	^ negated
]

{ #category : #generated }
PyNotNode >> negated: aPyRootNode [
	self negated notNil
		ifTrue: [ self negated parent: nil ].
	negated := aPyRootNode.
	self negated notNil
		ifTrue: [ self negated parent: self ]
]

{ #category : #generated }
PyNotNode >> nodeVariables [
	^ #(#negated)
]

{ #category : #generated }
PyNotNode >> notToken [
	^ notToken
]

{ #category : #generated }
PyNotNode >> notToken: aSmaCCToken [
	notToken := aSmaCCToken
]

{ #category : #generated }
PyNotNode >> tokenVariables [
	^ #(#notToken)
]
