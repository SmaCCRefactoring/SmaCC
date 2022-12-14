Class {
	#name : #PyFileInputNode,
	#superclass : #PyRootNode,
	#instVars : [
		'nEWLINETokens',
		'statements'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyFileInputNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitFileInput: self
]

{ #category : #generated }
PyFileInputNode >> compositeNodeVariables [
	^ #(#statements)
]

{ #category : #generated }
PyFileInputNode >> compositeTokenVariables [
	^ #(#nEWLINETokens)
]

{ #category : #'generated-initialize-release' }
PyFileInputNode >> initialize [
	super initialize.
	nEWLINETokens := OrderedCollection new: 2.
	statements := OrderedCollection new: 2.
]

{ #category : #generated }
PyFileInputNode >> nEWLINETokens [
	^ nEWLINETokens
]

{ #category : #generated }
PyFileInputNode >> nEWLINETokens: anOrderedCollection [
	nEWLINETokens := anOrderedCollection
]

{ #category : #generated }
PyFileInputNode >> statements [
	^ statements
]

{ #category : #generated }
PyFileInputNode >> statements: anOrderedCollection [
	self setParents: self statements to: nil.
	statements := anOrderedCollection.
	self setParents: self statements to: self
]
