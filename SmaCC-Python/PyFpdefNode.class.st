Class {
	#name : #PyFpdefNode,
	#superclass : #PyRootNode,
	#instVars : [
		'commaTokens',
		'nameToken',
		'lparenToken',
		'fpdefs',
		'rparenToken'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyFpdefNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitFpdef: self
]

{ #category : #generated }
PyFpdefNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
PyFpdefNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
PyFpdefNode >> compositeNodeVariables [
	^ #(#fpdefs)
]

{ #category : #generated }
PyFpdefNode >> compositeTokenVariables [
	^ #(#commaTokens)
]

{ #category : #generated }
PyFpdefNode >> fpdefs [
	^ fpdefs
]

{ #category : #generated }
PyFpdefNode >> fpdefs: anOrderedCollection [
	self setParents: self fpdefs to: nil.
	fpdefs := anOrderedCollection.
	self setParents: self fpdefs to: self
]

{ #category : #'generated-initialize-release' }
PyFpdefNode >> initialize [
	super initialize.
	fpdefs := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
]

{ #category : #generated }
PyFpdefNode >> lparenToken [
	^ lparenToken
]

{ #category : #generated }
PyFpdefNode >> lparenToken: aSmaCCToken [
	lparenToken := aSmaCCToken
]

{ #category : #generated }
PyFpdefNode >> nameToken [
	^ nameToken
]

{ #category : #generated }
PyFpdefNode >> nameToken: aSmaCCToken [
	nameToken := aSmaCCToken
]

{ #category : #generated }
PyFpdefNode >> rparenToken [
	^ rparenToken
]

{ #category : #generated }
PyFpdefNode >> rparenToken: aSmaCCToken [
	rparenToken := aSmaCCToken
]

{ #category : #generated }
PyFpdefNode >> tokenVariables [
	^ #(#nameToken #lparenToken #rparenToken)
]
