Class {
	#name : #CGLRCallNode,
	#superclass : #CGLRAbstractNode,
	#instVars : [
		'arguments',
		'commaTokens',
		'f',
		'leftParenToken',
		'rightParenToken'
	],
	#category : 'SmaCC-C-Parser'
}

{ #category : #generated }
CGLRCallNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitCall: self
]

{ #category : #generated }
CGLRCallNode >> arguments [
	^ arguments
]

{ #category : #generated }
CGLRCallNode >> arguments: anOrderedCollection [
	self setParents: self arguments to: nil.
	arguments := anOrderedCollection.
	self setParents: self arguments to: self
]

{ #category : #generated }
CGLRCallNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
CGLRCallNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
CGLRCallNode >> compositeNodeVariables [
	^ #(#arguments)
]

{ #category : #generated }
CGLRCallNode >> compositeTokenVariables [
	^ #(#commaTokens)
]

{ #category : #generated }
CGLRCallNode >> f [
	^ f
]

{ #category : #generated }
CGLRCallNode >> f: aCGLRAbstractNode [
	self f notNil
		ifTrue: [ self f parent: nil ].
	f := aCGLRAbstractNode.
	self f notNil
		ifTrue: [ self f parent: self ]
]

{ #category : #'generated-initialize-release' }
CGLRCallNode >> initialize [
	super initialize.
	arguments := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
]

{ #category : #generated }
CGLRCallNode >> leftParenToken [
	^ leftParenToken
]

{ #category : #generated }
CGLRCallNode >> leftParenToken: aSmaCCToken [
	leftParenToken := aSmaCCToken
]

{ #category : #generated }
CGLRCallNode >> nodeVariables [
	^ #(#f)
]

{ #category : #generated }
CGLRCallNode >> rightParenToken [
	^ rightParenToken
]

{ #category : #generated }
CGLRCallNode >> rightParenToken: aSmaCCToken [
	rightParenToken := aSmaCCToken
]

{ #category : #generated }
CGLRCallNode >> tokenVariables [
	^ #(#leftParenToken #rightParenToken)
]
