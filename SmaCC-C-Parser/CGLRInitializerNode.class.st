Class {
	#name : #CGLRInitializerNode,
	#superclass : #CGLRAbstractNode,
	#instVars : [
		'initializers',
		'lEFT_BRACEToken',
		'commaTokens',
		'rIGHT_BRACEToken'
	],
	#category : 'SmaCC-C-Parser'
}

{ #category : #generated }
CGLRInitializerNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitInitializer: self
]

{ #category : #generated }
CGLRInitializerNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
CGLRInitializerNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
CGLRInitializerNode >> compositeNodeVariables [
	^ #(#initializers)
]

{ #category : #generated }
CGLRInitializerNode >> compositeTokenVariables [
	^ #(#commaTokens)
]

{ #category : #'generated-initialize-release' }
CGLRInitializerNode >> initialize [
	super initialize.
	initializers := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
]

{ #category : #generated }
CGLRInitializerNode >> initializers [
	^ initializers
]

{ #category : #generated }
CGLRInitializerNode >> initializers: anOrderedCollection [
	self setParents: self initializers to: nil.
	initializers := anOrderedCollection.
	self setParents: self initializers to: self
]

{ #category : #generated }
CGLRInitializerNode >> lEFT_BRACEToken [
	^ lEFT_BRACEToken
]

{ #category : #generated }
CGLRInitializerNode >> lEFT_BRACEToken: aSmaCCToken [
	lEFT_BRACEToken := aSmaCCToken
]

{ #category : #generated }
CGLRInitializerNode >> rIGHT_BRACEToken [
	^ rIGHT_BRACEToken
]

{ #category : #generated }
CGLRInitializerNode >> rIGHT_BRACEToken: aSmaCCToken [
	rIGHT_BRACEToken := aSmaCCToken
]

{ #category : #generated }
CGLRInitializerNode >> tokenVariables [
	^ #(#lEFT_BRACEToken #rIGHT_BRACEToken)
]
