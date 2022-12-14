Class {
	#name : #PyDottedNameNode,
	#superclass : #PyRootNode,
	#instVars : [
		'periodTokens',
		'names'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyDottedNameNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitDottedName: self
]

{ #category : #generated }
PyDottedNameNode >> compositeTokenVariables [
	^ #(#periodTokens #names)
]

{ #category : #'generated-initialize-release' }
PyDottedNameNode >> initialize [
	super initialize.
	periodTokens := OrderedCollection new: 2.
	names := OrderedCollection new: 2.
]

{ #category : #generated }
PyDottedNameNode >> names [
	^ names
]

{ #category : #generated }
PyDottedNameNode >> names: anOrderedCollection [
	names := anOrderedCollection
]

{ #category : #generated }
PyDottedNameNode >> periodTokens [
	^ periodTokens
]

{ #category : #generated }
PyDottedNameNode >> periodTokens: anOrderedCollection [
	periodTokens := anOrderedCollection
]
