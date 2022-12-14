Class {
	#name : #PySuiteNode,
	#superclass : #PyRootNode,
	#instVars : [
		'nEWLINEToken',
		'iNDENTToken',
		'dEDENTToken',
		'suite'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PySuiteNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitSuite: self
]

{ #category : #generated }
PySuiteNode >> dEDENTToken [
	^ dEDENTToken
]

{ #category : #generated }
PySuiteNode >> dEDENTToken: aSmaCCToken [
	dEDENTToken := aSmaCCToken
]

{ #category : #generated }
PySuiteNode >> iNDENTToken [
	^ iNDENTToken
]

{ #category : #generated }
PySuiteNode >> iNDENTToken: aSmaCCToken [
	iNDENTToken := aSmaCCToken
]

{ #category : #generated }
PySuiteNode >> nEWLINEToken [
	^ nEWLINEToken
]

{ #category : #generated }
PySuiteNode >> nEWLINEToken: aSmaCCToken [
	nEWLINEToken := aSmaCCToken
]

{ #category : #generated }
PySuiteNode >> nodeVariables [
	^ #(#suite)
]

{ #category : #generated }
PySuiteNode >> suite [
	^ suite
]

{ #category : #generated }
PySuiteNode >> suite: aPyRootNode [
	self suite notNil
		ifTrue: [ self suite parent: nil ].
	suite := aPyRootNode.
	self suite notNil
		ifTrue: [ self suite parent: self ]
]

{ #category : #generated }
PySuiteNode >> tokenVariables [
	^ #(#nEWLINEToken #iNDENTToken #dEDENTToken)
]
