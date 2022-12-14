Class {
	#name : #CGLRStructOrUnionSpecifierNode,
	#superclass : #CGLRAbstractNode,
	#instVars : [
		'prefix',
		'symbol',
		'members',
		'lEFT_BRACEToken',
		'rIGHT_BRACEToken'
	],
	#category : 'SmaCC-C-Parser'
}

{ #category : #generated }
CGLRStructOrUnionSpecifierNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitStructOrUnionSpecifier: self
]

{ #category : #generated }
CGLRStructOrUnionSpecifierNode >> compositeNodeVariables [
	^ #(#members)
]

{ #category : #'generated-initialize-release' }
CGLRStructOrUnionSpecifierNode >> initialize [
	super initialize.
	members := OrderedCollection new: 2.
]

{ #category : #generated }
CGLRStructOrUnionSpecifierNode >> lEFT_BRACEToken [
	^ lEFT_BRACEToken
]

{ #category : #generated }
CGLRStructOrUnionSpecifierNode >> lEFT_BRACEToken: aSmaCCToken [
	lEFT_BRACEToken := aSmaCCToken
]

{ #category : #generated }
CGLRStructOrUnionSpecifierNode >> members [
	^ members
]

{ #category : #generated }
CGLRStructOrUnionSpecifierNode >> members: anOrderedCollection [
	self setParents: self members to: nil.
	members := anOrderedCollection.
	self setParents: self members to: self
]

{ #category : #generated }
CGLRStructOrUnionSpecifierNode >> nodeVariables [
	^ #(#symbol)
]

{ #category : #generated }
CGLRStructOrUnionSpecifierNode >> prefix [
	^ prefix
]

{ #category : #generated }
CGLRStructOrUnionSpecifierNode >> prefix: aSmaCCToken [
	prefix := aSmaCCToken
]

{ #category : #generated }
CGLRStructOrUnionSpecifierNode >> rIGHT_BRACEToken [
	^ rIGHT_BRACEToken
]

{ #category : #generated }
CGLRStructOrUnionSpecifierNode >> rIGHT_BRACEToken: aSmaCCToken [
	rIGHT_BRACEToken := aSmaCCToken
]

{ #category : #generated }
CGLRStructOrUnionSpecifierNode >> symbol [
	^ symbol
]

{ #category : #generated }
CGLRStructOrUnionSpecifierNode >> symbol: aCGLRIdentifierNode [
	self symbol notNil
		ifTrue: [ self symbol parent: nil ].
	symbol := aCGLRIdentifierNode.
	self symbol notNil
		ifTrue: [ self symbol parent: self ]
]

{ #category : #generated }
CGLRStructOrUnionSpecifierNode >> tokenVariables [
	^ #(#prefix #lEFT_BRACEToken #rIGHT_BRACEToken)
]
