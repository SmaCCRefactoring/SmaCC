Class {
	#name : #PyBackTickNode,
	#superclass : #PyRootNode,
	#instVars : [
		'_Tokens',
		'list'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyBackTickNode >> _Tokens [
	^ _Tokens
]

{ #category : #generated }
PyBackTickNode >> _Tokens: anOrderedCollection [
	_Tokens := anOrderedCollection
]

{ #category : #generated }
PyBackTickNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitBackTick: self
]

{ #category : #generated }
PyBackTickNode >> compositeTokenVariables [
	^ #(#_Tokens)
]

{ #category : #'generated-initialize-release' }
PyBackTickNode >> initialize [
	super initialize.
	_Tokens := OrderedCollection new: 2.
]

{ #category : #generated }
PyBackTickNode >> list [
	^ list
]

{ #category : #generated }
PyBackTickNode >> list: aPyRootNode [
	self list notNil
		ifTrue: [ self list parent: nil ].
	list := aPyRootNode.
	self list notNil
		ifTrue: [ self list parent: self ]
]

{ #category : #generated }
PyBackTickNode >> nodeVariables [
	^ #(#list)
]
