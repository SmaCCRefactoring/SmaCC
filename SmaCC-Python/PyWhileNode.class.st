Class {
	#name : #PyWhileNode,
	#superclass : #PyRootNode,
	#instVars : [
		'whileToken',
		'test',
		'colonToken',
		'else',
		'statements',
		'nEWLINEToken',
		'iNDENTToken',
		'dEDENTToken'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyWhileNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitWhile: self
]

{ #category : #generated }
PyWhileNode >> colonToken [
	^ colonToken
]

{ #category : #generated }
PyWhileNode >> colonToken: aSmaCCToken [
	colonToken := aSmaCCToken
]

{ #category : #generated }
PyWhileNode >> compositeNodeVariables [
	^ #(#statements)
]

{ #category : #generated }
PyWhileNode >> dEDENTToken [
	^ dEDENTToken
]

{ #category : #generated }
PyWhileNode >> dEDENTToken: aSmaCCToken [
	dEDENTToken := aSmaCCToken
]

{ #category : #generated }
PyWhileNode >> else [
	^ else
]

{ #category : #generated }
PyWhileNode >> else: aPyElseNode [
	self else notNil
		ifTrue: [ self else parent: nil ].
	else := aPyElseNode.
	self else notNil
		ifTrue: [ self else parent: self ]
]

{ #category : #generated }
PyWhileNode >> iNDENTToken [
	^ iNDENTToken
]

{ #category : #generated }
PyWhileNode >> iNDENTToken: aSmaCCToken [
	iNDENTToken := aSmaCCToken
]

{ #category : #'generated-initialize-release' }
PyWhileNode >> initialize [
	super initialize.
	statements := OrderedCollection new: 2.
]

{ #category : #generated }
PyWhileNode >> nEWLINEToken [
	^ nEWLINEToken
]

{ #category : #generated }
PyWhileNode >> nEWLINEToken: aSmaCCToken [
	nEWLINEToken := aSmaCCToken
]

{ #category : #generated }
PyWhileNode >> nodeVariables [
	^ #(#test #else)
]

{ #category : #generated }
PyWhileNode >> statements [
	^ statements
]

{ #category : #generated }
PyWhileNode >> statements: anOrderedCollection [
	self setParents: self statements to: nil.
	statements := anOrderedCollection.
	self setParents: self statements to: self
]

{ #category : #generated }
PyWhileNode >> test [
	^ test
]

{ #category : #generated }
PyWhileNode >> test: aPyRootNode [
	self test notNil
		ifTrue: [ self test parent: nil ].
	test := aPyRootNode.
	self test notNil
		ifTrue: [ self test parent: self ]
]

{ #category : #generated }
PyWhileNode >> tokenVariables [
	^ #(#whileToken #colonToken #nEWLINEToken #iNDENTToken #dEDENTToken)
]

{ #category : #generated }
PyWhileNode >> whileToken [
	^ whileToken
]

{ #category : #generated }
PyWhileNode >> whileToken: aSmaCCToken [
	whileToken := aSmaCCToken
]
