Class {
	#name : #CGLRDeclarationNode,
	#superclass : #CGLRAbstractNode,
	#instVars : [
		'specifiers',
		'declarators',
		'semicolonToken',
		'commaTokens'
	],
	#category : 'SmaCC-C-Parser'
}

{ #category : #generated }
CGLRDeclarationNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitDeclaration: self
]

{ #category : #generated }
CGLRDeclarationNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
CGLRDeclarationNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
CGLRDeclarationNode >> compositeNodeVariables [
	^ #(#declarators)
]

{ #category : #generated }
CGLRDeclarationNode >> compositeTokenVariables [
	^ #(#commaTokens)
]

{ #category : #generated }
CGLRDeclarationNode >> declarators [
	^ declarators
]

{ #category : #generated }
CGLRDeclarationNode >> declarators: anOrderedCollection [
	self setParents: self declarators to: nil.
	declarators := anOrderedCollection.
	self setParents: self declarators to: self
]

{ #category : #'generated-initialize-release' }
CGLRDeclarationNode >> initialize [
	super initialize.
	specifiers := OrderedCollection new: 2.
	declarators := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
]

{ #category : #generated }
CGLRDeclarationNode >> otherVariables [
	^ #(#specifiers)
]

{ #category : #generated }
CGLRDeclarationNode >> semicolonToken [
	^ semicolonToken
]

{ #category : #generated }
CGLRDeclarationNode >> semicolonToken: aSmaCCToken [
	semicolonToken := aSmaCCToken
]

{ #category : #generated }
CGLRDeclarationNode >> specifiers [
	^ specifiers
]

{ #category : #generated }
CGLRDeclarationNode >> specifiers: anOrderedCollection [
	specifiers := anOrderedCollection
]

{ #category : #generated }
CGLRDeclarationNode >> tokenVariables [
	^ #(#semicolonToken)
]
