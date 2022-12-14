Class {
	#name : #PyFuncdefNode,
	#superclass : #PyRootNode,
	#instVars : [
		'defToken',
		'fname',
		'parameters',
		'colonToken',
		'statements',
		'nEWLINEToken',
		'iNDENTToken',
		'dEDENTToken'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyFuncdefNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitFuncdef: self
]

{ #category : #generated }
PyFuncdefNode >> colonToken [
	^ colonToken
]

{ #category : #generated }
PyFuncdefNode >> colonToken: aSmaCCToken [
	colonToken := aSmaCCToken
]

{ #category : #generated }
PyFuncdefNode >> compositeNodeVariables [
	^ #(#statements)
]

{ #category : #generated }
PyFuncdefNode >> dEDENTToken [
	^ dEDENTToken
]

{ #category : #generated }
PyFuncdefNode >> dEDENTToken: aSmaCCToken [
	dEDENTToken := aSmaCCToken
]

{ #category : #generated }
PyFuncdefNode >> defToken [
	^ defToken
]

{ #category : #generated }
PyFuncdefNode >> defToken: aSmaCCToken [
	defToken := aSmaCCToken
]

{ #category : #generated }
PyFuncdefNode >> fname [
	^ fname
]

{ #category : #generated }
PyFuncdefNode >> fname: aSmaCCToken [
	fname := aSmaCCToken
]

{ #category : #generated }
PyFuncdefNode >> iNDENTToken [
	^ iNDENTToken
]

{ #category : #generated }
PyFuncdefNode >> iNDENTToken: aSmaCCToken [
	iNDENTToken := aSmaCCToken
]

{ #category : #'generated-initialize-release' }
PyFuncdefNode >> initialize [
	super initialize.
	statements := OrderedCollection new: 2.
]

{ #category : #generated }
PyFuncdefNode >> nEWLINEToken [
	^ nEWLINEToken
]

{ #category : #generated }
PyFuncdefNode >> nEWLINEToken: aSmaCCToken [
	nEWLINEToken := aSmaCCToken
]

{ #category : #generated }
PyFuncdefNode >> nodeVariables [
	^ #(#parameters)
]

{ #category : #generated }
PyFuncdefNode >> parameters [
	^ parameters
]

{ #category : #generated }
PyFuncdefNode >> parameters: aPyVarArgListNode [
	self parameters notNil
		ifTrue: [ self parameters parent: nil ].
	parameters := aPyVarArgListNode.
	self parameters notNil
		ifTrue: [ self parameters parent: self ]
]

{ #category : #generated }
PyFuncdefNode >> statements [
	^ statements
]

{ #category : #generated }
PyFuncdefNode >> statements: anOrderedCollection [
	self setParents: self statements to: nil.
	statements := anOrderedCollection.
	self setParents: self statements to: self
]

{ #category : #generated }
PyFuncdefNode >> tokenVariables [
	^ #(#defToken #fname #colonToken #nEWLINEToken #iNDENTToken #dEDENTToken)
]
