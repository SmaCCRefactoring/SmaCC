Class {
	#name : #CGLREnumNode,
	#superclass : #CGLRAbstractNode,
	#instVars : [
		'enumerators',
		'identifier',
		'enumToken',
		'lEFT_BRACEToken',
		'commaTokens',
		'rIGHT_BRACEToken'
	],
	#category : 'SmaCC-C-Parser'
}

{ #category : #generated }
CGLREnumNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitEnum: self
]

{ #category : #generated }
CGLREnumNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
CGLREnumNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
CGLREnumNode >> compositeNodeVariables [
	^ #(#enumerators)
]

{ #category : #generated }
CGLREnumNode >> compositeTokenVariables [
	^ #(#commaTokens)
]

{ #category : #generated }
CGLREnumNode >> enumToken [
	^ enumToken
]

{ #category : #generated }
CGLREnumNode >> enumToken: aSmaCCToken [
	enumToken := aSmaCCToken
]

{ #category : #generated }
CGLREnumNode >> enumerators [
	^ enumerators
]

{ #category : #generated }
CGLREnumNode >> enumerators: anOrderedCollection [
	self setParents: self enumerators to: nil.
	enumerators := anOrderedCollection.
	self setParents: self enumerators to: self
]

{ #category : #generated }
CGLREnumNode >> identifier [
	^ identifier
]

{ #category : #generated }
CGLREnumNode >> identifier: aCGLRIdentifierNode [
	self identifier notNil
		ifTrue: [ self identifier parent: nil ].
	identifier := aCGLRIdentifierNode.
	self identifier notNil
		ifTrue: [ self identifier parent: self ]
]

{ #category : #'generated-initialize-release' }
CGLREnumNode >> initialize [
	super initialize.
	enumerators := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
]

{ #category : #generated }
CGLREnumNode >> lEFT_BRACEToken [
	^ lEFT_BRACEToken
]

{ #category : #generated }
CGLREnumNode >> lEFT_BRACEToken: aSmaCCToken [
	lEFT_BRACEToken := aSmaCCToken
]

{ #category : #generated }
CGLREnumNode >> nodeVariables [
	^ #(#identifier)
]

{ #category : #generated }
CGLREnumNode >> rIGHT_BRACEToken [
	^ rIGHT_BRACEToken
]

{ #category : #generated }
CGLREnumNode >> rIGHT_BRACEToken: aSmaCCToken [
	rIGHT_BRACEToken := aSmaCCToken
]

{ #category : #generated }
CGLREnumNode >> tokenVariables [
	^ #(#enumToken #lEFT_BRACEToken #rIGHT_BRACEToken)
]
