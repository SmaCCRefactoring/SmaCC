Class {
	#name : #PyWithNode,
	#superclass : #PyRootNode,
	#instVars : [
		'withToken',
		'commaTokens',
		'withItems',
		'colonToken',
		'statements',
		'nEWLINEToken',
		'iNDENTToken',
		'dEDENTToken'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyWithNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitWith: self
]

{ #category : #generated }
PyWithNode >> colonToken [
	^ colonToken
]

{ #category : #generated }
PyWithNode >> colonToken: aSmaCCToken [
	colonToken := aSmaCCToken
]

{ #category : #generated }
PyWithNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
PyWithNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
PyWithNode >> compositeNodeVariables [
	^ #(#withItems #statements)
]

{ #category : #generated }
PyWithNode >> compositeTokenVariables [
	^ #(#commaTokens)
]

{ #category : #generated }
PyWithNode >> dEDENTToken [
	^ dEDENTToken
]

{ #category : #generated }
PyWithNode >> dEDENTToken: aSmaCCToken [
	dEDENTToken := aSmaCCToken
]

{ #category : #generated }
PyWithNode >> iNDENTToken [
	^ iNDENTToken
]

{ #category : #generated }
PyWithNode >> iNDENTToken: aSmaCCToken [
	iNDENTToken := aSmaCCToken
]

{ #category : #'generated-initialize-release' }
PyWithNode >> initialize [
	super initialize.
	commaTokens := OrderedCollection new: 2.
	withItems := OrderedCollection new: 2.
	statements := OrderedCollection new: 2.
]

{ #category : #generated }
PyWithNode >> nEWLINEToken [
	^ nEWLINEToken
]

{ #category : #generated }
PyWithNode >> nEWLINEToken: aSmaCCToken [
	nEWLINEToken := aSmaCCToken
]

{ #category : #generated }
PyWithNode >> statements [
	^ statements
]

{ #category : #generated }
PyWithNode >> statements: anOrderedCollection [
	self setParents: self statements to: nil.
	statements := anOrderedCollection.
	self setParents: self statements to: self
]

{ #category : #generated }
PyWithNode >> tokenVariables [
	^ #(#withToken #colonToken #nEWLINEToken #iNDENTToken #dEDENTToken)
]

{ #category : #generated }
PyWithNode >> withItems [
	^ withItems
]

{ #category : #generated }
PyWithNode >> withItems: anOrderedCollection [
	self setParents: self withItems to: nil.
	withItems := anOrderedCollection.
	self setParents: self withItems to: self
]

{ #category : #generated }
PyWithNode >> withToken [
	^ withToken
]

{ #category : #generated }
PyWithNode >> withToken: aSmaCCToken [
	withToken := aSmaCCToken
]
