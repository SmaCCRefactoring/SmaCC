Class {
	#name : #CGLRFunctionDeclaratorNode,
	#superclass : #CGLRAbstractNode,
	#instVars : [
		'identifiers',
		'declarator',
		'parameters',
		'ellipsis',
		'leftParenToken',
		'commaTokens',
		'rightParenToken'
	],
	#category : 'SmaCC-C-Parser'
}

{ #category : #generated }
CGLRFunctionDeclaratorNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitFunctionDeclarator: self
]

{ #category : #generated }
CGLRFunctionDeclaratorNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
CGLRFunctionDeclaratorNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
CGLRFunctionDeclaratorNode >> compositeNodeVariables [
	^ #(#parameters #identifiers)
]

{ #category : #generated }
CGLRFunctionDeclaratorNode >> compositeTokenVariables [
	^ #(#commaTokens)
]

{ #category : #generated }
CGLRFunctionDeclaratorNode >> declarator [
	^ declarator
]

{ #category : #generated }
CGLRFunctionDeclaratorNode >> declarator: aCGLRAbstractNode [
	self declarator notNil
		ifTrue: [ self declarator parent: nil ].
	declarator := aCGLRAbstractNode.
	self declarator notNil
		ifTrue: [ self declarator parent: self ]
]

{ #category : #generated }
CGLRFunctionDeclaratorNode >> ellipsis [
	^ ellipsis
]

{ #category : #generated }
CGLRFunctionDeclaratorNode >> ellipsis: aSmaCCToken [
	ellipsis := aSmaCCToken
]

{ #category : #generated }
CGLRFunctionDeclaratorNode >> identifiers [
	^ identifiers
]

{ #category : #generated }
CGLRFunctionDeclaratorNode >> identifiers: anOrderedCollection [
	self setParents: self identifiers to: nil.
	identifiers := anOrderedCollection.
	self setParents: self identifiers to: self
]

{ #category : #'generated-initialize-release' }
CGLRFunctionDeclaratorNode >> initialize [
	super initialize.
	parameters := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
	identifiers := OrderedCollection new: 2.
]

{ #category : #generated }
CGLRFunctionDeclaratorNode >> leftParenToken [
	^ leftParenToken
]

{ #category : #generated }
CGLRFunctionDeclaratorNode >> leftParenToken: aSmaCCToken [
	leftParenToken := aSmaCCToken
]

{ #category : #generated }
CGLRFunctionDeclaratorNode >> nodeVariables [
	^ #(#declarator)
]

{ #category : #generated }
CGLRFunctionDeclaratorNode >> parameters [
	^ parameters
]

{ #category : #generated }
CGLRFunctionDeclaratorNode >> parameters: anOrderedCollection [
	self setParents: self parameters to: nil.
	parameters := anOrderedCollection.
	self setParents: self parameters to: self
]

{ #category : #generated }
CGLRFunctionDeclaratorNode >> rightParenToken [
	^ rightParenToken
]

{ #category : #generated }
CGLRFunctionDeclaratorNode >> rightParenToken: aSmaCCToken [
	rightParenToken := aSmaCCToken
]

{ #category : #generated }
CGLRFunctionDeclaratorNode >> tokenVariables [
	^ #(#leftParenToken #ellipsis #rightParenToken)
]
