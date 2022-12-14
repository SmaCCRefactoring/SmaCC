Class {
	#name : #PyDelNode,
	#superclass : #PyRootNode,
	#instVars : [
		'delToken',
		'commaTokens',
		'exprs'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyDelNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitDel: self
]

{ #category : #generated }
PyDelNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
PyDelNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
PyDelNode >> compositeNodeVariables [
	^ #(#exprs)
]

{ #category : #generated }
PyDelNode >> compositeTokenVariables [
	^ #(#commaTokens)
]

{ #category : #generated }
PyDelNode >> delToken [
	^ delToken
]

{ #category : #generated }
PyDelNode >> delToken: aSmaCCToken [
	delToken := aSmaCCToken
]

{ #category : #generated }
PyDelNode >> exprs [
	^ exprs
]

{ #category : #generated }
PyDelNode >> exprs: anOrderedCollection [
	self setParents: self exprs to: nil.
	exprs := anOrderedCollection.
	self setParents: self exprs to: self
]

{ #category : #'generated-initialize-release' }
PyDelNode >> initialize [
	super initialize.
	exprs := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
]

{ #category : #generated }
PyDelNode >> tokenVariables [
	^ #(#delToken)
]
