Class {
	#name : #PyIfNode,
	#superclass : #PyRootNode,
	#instVars : [
		'ifToken',
		'if',
		'colonToken',
		'elsif',
		'else',
		'statements',
		'nEWLINEToken',
		'iNDENTToken',
		'dEDENTToken'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyIfNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitIf: self
]

{ #category : #generated }
PyIfNode >> colonToken [
	^ colonToken
]

{ #category : #generated }
PyIfNode >> colonToken: aSmaCCToken [
	colonToken := aSmaCCToken
]

{ #category : #generated }
PyIfNode >> compositeNodeVariables [
	^ #(#statements)
]

{ #category : #generated }
PyIfNode >> dEDENTToken [
	^ dEDENTToken
]

{ #category : #generated }
PyIfNode >> dEDENTToken: aSmaCCToken [
	dEDENTToken := aSmaCCToken
]

{ #category : #generated }
PyIfNode >> else [
	^ else
]

{ #category : #generated }
PyIfNode >> else: aPyElseNode [
	self else notNil
		ifTrue: [ self else parent: nil ].
	else := aPyElseNode.
	self else notNil
		ifTrue: [ self else parent: self ]
]

{ #category : #generated }
PyIfNode >> elsif [
	^ elsif
]

{ #category : #generated }
PyIfNode >> elsif: aPyElifNode [
	self elsif notNil
		ifTrue: [ self elsif parent: nil ].
	elsif := aPyElifNode.
	self elsif notNil
		ifTrue: [ self elsif parent: self ]
]

{ #category : #generated }
PyIfNode >> iNDENTToken [
	^ iNDENTToken
]

{ #category : #generated }
PyIfNode >> iNDENTToken: aSmaCCToken [
	iNDENTToken := aSmaCCToken
]

{ #category : #generated }
PyIfNode >> if [
	^ if
]

{ #category : #generated }
PyIfNode >> if: aPyRootNode [
	self if notNil
		ifTrue: [ self if parent: nil ].
	if := aPyRootNode.
	self if notNil
		ifTrue: [ self if parent: self ]
]

{ #category : #generated }
PyIfNode >> ifToken [
	^ ifToken
]

{ #category : #generated }
PyIfNode >> ifToken: aSmaCCToken [
	ifToken := aSmaCCToken
]

{ #category : #'generated-initialize-release' }
PyIfNode >> initialize [
	super initialize.
	statements := OrderedCollection new: 2.
]

{ #category : #generated }
PyIfNode >> nEWLINEToken [
	^ nEWLINEToken
]

{ #category : #generated }
PyIfNode >> nEWLINEToken: aSmaCCToken [
	nEWLINEToken := aSmaCCToken
]

{ #category : #generated }
PyIfNode >> nodeVariables [
	^ #(#if #elsif #else)
]

{ #category : #generated }
PyIfNode >> statements [
	^ statements
]

{ #category : #generated }
PyIfNode >> statements: anOrderedCollection [
	self setParents: self statements to: nil.
	statements := anOrderedCollection.
	self setParents: self statements to: self
]

{ #category : #generated }
PyIfNode >> tokenVariables [
	^ #(#ifToken #colonToken #nEWLINEToken #iNDENTToken #dEDENTToken)
]
