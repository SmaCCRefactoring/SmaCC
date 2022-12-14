Class {
	#name : #CSQualifiedIdentifierNode,
	#superclass : #CSProgramNode,
	#instVars : [
		'names',
		'periodTokens'
	],
	#category : 'SmaCC-CSharp'
}

{ #category : #generated }
CSQualifiedIdentifierNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitQualifiedIdentifier: self
]

{ #category : #generated }
CSQualifiedIdentifierNode >> compositeTokenVariables [
	^ #(#names #periodTokens)
]

{ #category : #'generated-initialize-release' }
CSQualifiedIdentifierNode >> initialize [
	super initialize.
	names := OrderedCollection new: 2.
	periodTokens := OrderedCollection new: 2.
]

{ #category : #generated }
CSQualifiedIdentifierNode >> names [
	^ names
]

{ #category : #generated }
CSQualifiedIdentifierNode >> names: anOrderedCollection [
	names := anOrderedCollection
]

{ #category : #generated }
CSQualifiedIdentifierNode >> periodTokens [
	^ periodTokens
]

{ #category : #generated }
CSQualifiedIdentifierNode >> periodTokens: anOrderedCollection [
	periodTokens := anOrderedCollection
]
