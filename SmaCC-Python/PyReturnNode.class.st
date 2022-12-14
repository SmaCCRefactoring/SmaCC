Class {
	#name : #PyReturnNode,
	#superclass : #PyRootNode,
	#instVars : [
		'returnToken',
		'tests',
		'commaTokens'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyReturnNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitReturn: self
]

{ #category : #generated }
PyReturnNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
PyReturnNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
PyReturnNode >> compositeNodeVariables [
	^ #(#tests)
]

{ #category : #generated }
PyReturnNode >> compositeTokenVariables [
	^ #(#commaTokens)
]

{ #category : #'generated-initialize-release' }
PyReturnNode >> initialize [
	super initialize.
	tests := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
]

{ #category : #generated }
PyReturnNode >> returnToken [
	^ returnToken
]

{ #category : #generated }
PyReturnNode >> returnToken: aSmaCCToken [
	returnToken := aSmaCCToken
]

{ #category : #generated }
PyReturnNode >> tests [
	^ tests
]

{ #category : #generated }
PyReturnNode >> tests: anOrderedCollection [
	self setParents: self tests to: nil.
	tests := anOrderedCollection.
	self setParents: self tests to: self
]

{ #category : #generated }
PyReturnNode >> tokenVariables [
	^ #(#returnToken)
]
