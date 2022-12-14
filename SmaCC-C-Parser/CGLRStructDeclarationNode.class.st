Class {
	#name : #CGLRStructDeclarationNode,
	#superclass : #CGLRAbstractNode,
	#instVars : [
		'declarators',
		'specifiers',
		'qualifiers',
		'commaTokens',
		'semicolonToken'
	],
	#category : 'SmaCC-C-Parser'
}

{ #category : #generated }
CGLRStructDeclarationNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitStructDeclaration: self
]

{ #category : #generated }
CGLRStructDeclarationNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
CGLRStructDeclarationNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
CGLRStructDeclarationNode >> compositeNodeVariables [
	^ #(#declarators)
]

{ #category : #generated }
CGLRStructDeclarationNode >> compositeTokenVariables [
	^ #(#qualifiers #commaTokens)
]

{ #category : #generated }
CGLRStructDeclarationNode >> declarators [
	^ declarators
]

{ #category : #generated }
CGLRStructDeclarationNode >> declarators: anOrderedCollection [
	self setParents: self declarators to: nil.
	declarators := anOrderedCollection.
	self setParents: self declarators to: self
]

{ #category : #'generated-initialize-release' }
CGLRStructDeclarationNode >> initialize [
	super initialize.
	specifiers := OrderedCollection new: 2.
	qualifiers := OrderedCollection new: 2.
	declarators := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
]

{ #category : #generated }
CGLRStructDeclarationNode >> otherVariables [
	^ #(#specifiers)
]

{ #category : #generated }
CGLRStructDeclarationNode >> qualifiers [
	^ qualifiers
]

{ #category : #generated }
CGLRStructDeclarationNode >> qualifiers: anOrderedCollection [
	qualifiers := anOrderedCollection
]

{ #category : #generated }
CGLRStructDeclarationNode >> semicolonToken [
	^ semicolonToken
]

{ #category : #generated }
CGLRStructDeclarationNode >> semicolonToken: aSmaCCToken [
	semicolonToken := aSmaCCToken
]

{ #category : #generated }
CGLRStructDeclarationNode >> specifiers [
	^ specifiers
]

{ #category : #generated }
CGLRStructDeclarationNode >> specifiers: anOrderedCollection [
	specifiers := anOrderedCollection
]

{ #category : #generated }
CGLRStructDeclarationNode >> tokenVariables [
	^ #(#semicolonToken)
]
