Class {
	#name : #PyCompForNode,
	#superclass : #PyRootNode,
	#instVars : [
		'exprs',
		'commaTokens',
		'forToken',
		'inToken',
		'_in',
		'comp'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyCompForNode >> _in [
	^ _in
]

{ #category : #generated }
PyCompForNode >> _in: aPyRootNode [
	self _in notNil
		ifTrue: [ self _in parent: nil ].
	_in := aPyRootNode.
	self _in notNil
		ifTrue: [ self _in parent: self ]
]

{ #category : #generated }
PyCompForNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitCompFor: self
]

{ #category : #generated }
PyCompForNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
PyCompForNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
PyCompForNode >> comp [
	^ comp
]

{ #category : #generated }
PyCompForNode >> comp: aPyRootNode [
	self comp notNil
		ifTrue: [ self comp parent: nil ].
	comp := aPyRootNode.
	self comp notNil
		ifTrue: [ self comp parent: self ]
]

{ #category : #generated }
PyCompForNode >> compositeNodeVariables [
	^ #(#exprs)
]

{ #category : #generated }
PyCompForNode >> compositeTokenVariables [
	^ #(#commaTokens)
]

{ #category : #generated }
PyCompForNode >> exprs [
	^ exprs
]

{ #category : #generated }
PyCompForNode >> exprs: anOrderedCollection [
	self setParents: self exprs to: nil.
	exprs := anOrderedCollection.
	self setParents: self exprs to: self
]

{ #category : #generated }
PyCompForNode >> forToken [
	^ forToken
]

{ #category : #generated }
PyCompForNode >> forToken: aSmaCCToken [
	forToken := aSmaCCToken
]

{ #category : #generated }
PyCompForNode >> inToken [
	^ inToken
]

{ #category : #generated }
PyCompForNode >> inToken: aSmaCCToken [
	inToken := aSmaCCToken
]

{ #category : #'generated-initialize-release' }
PyCompForNode >> initialize [
	super initialize.
	exprs := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
]

{ #category : #generated }
PyCompForNode >> nodeVariables [
	^ #(#_in #comp)
]

{ #category : #generated }
PyCompForNode >> tokenVariables [
	^ #(#forToken #inToken)
]
