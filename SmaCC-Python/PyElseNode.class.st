Class {
	#name : #PyElseNode,
	#superclass : #PyRootNode,
	#instVars : [
		'elseToken',
		'colonToken',
		'statements',
		'nEWLINEToken',
		'iNDENTToken',
		'dEDENTToken'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyElseNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitElse: self
]

{ #category : #generated }
PyElseNode >> colonToken [
	^ colonToken
]

{ #category : #generated }
PyElseNode >> colonToken: aSmaCCToken [
	colonToken := aSmaCCToken
]

{ #category : #generated }
PyElseNode >> compositeNodeVariables [
	^ #(#statements)
]

{ #category : #generated }
PyElseNode >> dEDENTToken [
	^ dEDENTToken
]

{ #category : #generated }
PyElseNode >> dEDENTToken: aSmaCCToken [
	dEDENTToken := aSmaCCToken
]

{ #category : #generated }
PyElseNode >> elseToken [
	^ elseToken
]

{ #category : #generated }
PyElseNode >> elseToken: aSmaCCToken [
	elseToken := aSmaCCToken
]

{ #category : #generated }
PyElseNode >> iNDENTToken [
	^ iNDENTToken
]

{ #category : #generated }
PyElseNode >> iNDENTToken: aSmaCCToken [
	iNDENTToken := aSmaCCToken
]

{ #category : #'generated-initialize-release' }
PyElseNode >> initialize [
	super initialize.
	statements := OrderedCollection new: 2.
]

{ #category : #generated }
PyElseNode >> nEWLINEToken [
	^ nEWLINEToken
]

{ #category : #generated }
PyElseNode >> nEWLINEToken: aSmaCCToken [
	nEWLINEToken := aSmaCCToken
]

{ #category : #generated }
PyElseNode >> statements [
	^ statements
]

{ #category : #generated }
PyElseNode >> statements: anOrderedCollection [
	self setParents: self statements to: nil.
	statements := anOrderedCollection.
	self setParents: self statements to: self
]

{ #category : #generated }
PyElseNode >> tokenVariables [
	^ #(#elseToken #colonToken #nEWLINEToken #iNDENTToken #dEDENTToken)
]
