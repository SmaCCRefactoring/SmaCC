Class {
	#name : #PyTestlistNode,
	#superclass : #PyRootNode,
	#instVars : [
		'tests',
		'commaTokens'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyTestlistNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitTestlist: self
]

{ #category : #generated }
PyTestlistNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
PyTestlistNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
PyTestlistNode >> compositeNodeVariables [
	^ #(#tests)
]

{ #category : #generated }
PyTestlistNode >> compositeTokenVariables [
	^ #(#commaTokens)
]

{ #category : #'generated-initialize-release' }
PyTestlistNode >> initialize [
	super initialize.
	tests := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
]

{ #category : #generated }
PyTestlistNode >> tests [
	^ tests
]

{ #category : #generated }
PyTestlistNode >> tests: anOrderedCollection [
	self setParents: self tests to: nil.
	tests := anOrderedCollection.
	self setParents: self tests to: self
]
