Class {
	#name : #PyClassdefNode,
	#superclass : #PyRootNode,
	#instVars : [
		'classToken',
		'cname',
		'colonToken',
		'lparenToken',
		'tests',
		'rparenToken',
		'commaTokens',
		'statements',
		'nEWLINEToken',
		'iNDENTToken',
		'dEDENTToken'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyClassdefNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitClassdef: self
]

{ #category : #generated }
PyClassdefNode >> classToken [
	^ classToken
]

{ #category : #generated }
PyClassdefNode >> classToken: aSmaCCToken [
	classToken := aSmaCCToken
]

{ #category : #generated }
PyClassdefNode >> cname [
	^ cname
]

{ #category : #generated }
PyClassdefNode >> cname: aSmaCCToken [
	cname := aSmaCCToken
]

{ #category : #generated }
PyClassdefNode >> colonToken [
	^ colonToken
]

{ #category : #generated }
PyClassdefNode >> colonToken: aSmaCCToken [
	colonToken := aSmaCCToken
]

{ #category : #generated }
PyClassdefNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
PyClassdefNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
PyClassdefNode >> compositeNodeVariables [
	^ #(#statements #tests)
]

{ #category : #generated }
PyClassdefNode >> compositeTokenVariables [
	^ #(#commaTokens)
]

{ #category : #generated }
PyClassdefNode >> dEDENTToken [
	^ dEDENTToken
]

{ #category : #generated }
PyClassdefNode >> dEDENTToken: aSmaCCToken [
	dEDENTToken := aSmaCCToken
]

{ #category : #generated }
PyClassdefNode >> iNDENTToken [
	^ iNDENTToken
]

{ #category : #generated }
PyClassdefNode >> iNDENTToken: aSmaCCToken [
	iNDENTToken := aSmaCCToken
]

{ #category : #'generated-initialize-release' }
PyClassdefNode >> initialize [
	super initialize.
	statements := OrderedCollection new: 2.
	tests := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
]

{ #category : #generated }
PyClassdefNode >> lparenToken [
	^ lparenToken
]

{ #category : #generated }
PyClassdefNode >> lparenToken: aSmaCCToken [
	lparenToken := aSmaCCToken
]

{ #category : #generated }
PyClassdefNode >> nEWLINEToken [
	^ nEWLINEToken
]

{ #category : #generated }
PyClassdefNode >> nEWLINEToken: aSmaCCToken [
	nEWLINEToken := aSmaCCToken
]

{ #category : #generated }
PyClassdefNode >> rparenToken [
	^ rparenToken
]

{ #category : #generated }
PyClassdefNode >> rparenToken: aSmaCCToken [
	rparenToken := aSmaCCToken
]

{ #category : #generated }
PyClassdefNode >> statements [
	^ statements
]

{ #category : #generated }
PyClassdefNode >> statements: anOrderedCollection [
	self setParents: self statements to: nil.
	statements := anOrderedCollection.
	self setParents: self statements to: self
]

{ #category : #generated }
PyClassdefNode >> tests [
	^ tests
]

{ #category : #generated }
PyClassdefNode >> tests: anOrderedCollection [
	self setParents: self tests to: nil.
	tests := anOrderedCollection.
	self setParents: self tests to: self
]

{ #category : #generated }
PyClassdefNode >> tokenVariables [
	^ #(#classToken #cname #colonToken #nEWLINEToken #iNDENTToken #dEDENTToken #lparenToken #rparenToken)
]
