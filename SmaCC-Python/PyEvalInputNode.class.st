Class {
	#name : #PyEvalInputNode,
	#superclass : #PyRootNode,
	#instVars : [
		'nEWLINETokens',
		'tests',
		'commaTokens'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyEvalInputNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitEvalInput: self
]

{ #category : #generated }
PyEvalInputNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
PyEvalInputNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
PyEvalInputNode >> compositeNodeVariables [
	^ #(#tests)
]

{ #category : #generated }
PyEvalInputNode >> compositeTokenVariables [
	^ #(#commaTokens #nEWLINETokens)
]

{ #category : #'generated-initialize-release' }
PyEvalInputNode >> initialize [
	super initialize.
	tests := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
	nEWLINETokens := OrderedCollection new: 2.
]

{ #category : #generated }
PyEvalInputNode >> nEWLINETokens [
	^ nEWLINETokens
]

{ #category : #generated }
PyEvalInputNode >> nEWLINETokens: anOrderedCollection [
	nEWLINETokens := anOrderedCollection
]

{ #category : #generated }
PyEvalInputNode >> tests [
	^ tests
]

{ #category : #generated }
PyEvalInputNode >> tests: anOrderedCollection [
	self setParents: self tests to: nil.
	tests := anOrderedCollection.
	self setParents: self tests to: self
]
