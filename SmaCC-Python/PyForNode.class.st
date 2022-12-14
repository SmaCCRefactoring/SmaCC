Class {
	#name : #PyForNode,
	#superclass : #PyRootNode,
	#instVars : [
		'forToken',
		'commaTokens',
		'tests',
		'nEWLINEToken',
		'iNDENTToken',
		'dEDENTToken',
		'exprs',
		'inToken',
		'else',
		'statements',
		'colonToken'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyForNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitFor: self
]

{ #category : #generated }
PyForNode >> colonToken [
	^ colonToken
]

{ #category : #generated }
PyForNode >> colonToken: aSmaCCToken [
	colonToken := aSmaCCToken
]

{ #category : #generated }
PyForNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
PyForNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
PyForNode >> compositeNodeVariables [
	^ #(#exprs #tests #statements)
]

{ #category : #generated }
PyForNode >> compositeTokenVariables [
	^ #(#commaTokens)
]

{ #category : #generated }
PyForNode >> dEDENTToken [
	^ dEDENTToken
]

{ #category : #generated }
PyForNode >> dEDENTToken: aSmaCCToken [
	dEDENTToken := aSmaCCToken
]

{ #category : #generated }
PyForNode >> else [
	^ else
]

{ #category : #generated }
PyForNode >> else: aPyElseNode [
	self else notNil
		ifTrue: [ self else parent: nil ].
	else := aPyElseNode.
	self else notNil
		ifTrue: [ self else parent: self ]
]

{ #category : #generated }
PyForNode >> exprs [
	^ exprs
]

{ #category : #generated }
PyForNode >> exprs: anOrderedCollection [
	self setParents: self exprs to: nil.
	exprs := anOrderedCollection.
	self setParents: self exprs to: self
]

{ #category : #generated }
PyForNode >> forToken [
	^ forToken
]

{ #category : #generated }
PyForNode >> forToken: aSmaCCToken [
	forToken := aSmaCCToken
]

{ #category : #generated }
PyForNode >> iNDENTToken [
	^ iNDENTToken
]

{ #category : #generated }
PyForNode >> iNDENTToken: aSmaCCToken [
	iNDENTToken := aSmaCCToken
]

{ #category : #generated }
PyForNode >> inToken [
	^ inToken
]

{ #category : #generated }
PyForNode >> inToken: aSmaCCToken [
	inToken := aSmaCCToken
]

{ #category : #'generated-initialize-release' }
PyForNode >> initialize [
	super initialize.
	exprs := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
	tests := OrderedCollection new: 2.
	statements := OrderedCollection new: 2.
]

{ #category : #generated }
PyForNode >> nEWLINEToken [
	^ nEWLINEToken
]

{ #category : #generated }
PyForNode >> nEWLINEToken: aSmaCCToken [
	nEWLINEToken := aSmaCCToken
]

{ #category : #generated }
PyForNode >> nodeVariables [
	^ #(#else)
]

{ #category : #generated }
PyForNode >> statements [
	^ statements
]

{ #category : #generated }
PyForNode >> statements: anOrderedCollection [
	self setParents: self statements to: nil.
	statements := anOrderedCollection.
	self setParents: self statements to: self
]

{ #category : #generated }
PyForNode >> tests [
	^ tests
]

{ #category : #generated }
PyForNode >> tests: anOrderedCollection [
	self setParents: self tests to: nil.
	tests := anOrderedCollection.
	self setParents: self tests to: self
]

{ #category : #generated }
PyForNode >> tokenVariables [
	^ #(#forToken #inToken #colonToken #nEWLINEToken #iNDENTToken #dEDENTToken)
]
