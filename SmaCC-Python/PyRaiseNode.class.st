Class {
	#name : #PyRaiseNode,
	#superclass : #PyRootNode,
	#instVars : [
		'raiseToken',
		'arg1',
		'commaTokens',
		'arg2',
		'arg3'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyRaiseNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitRaise: self
]

{ #category : #generated }
PyRaiseNode >> arg1 [
	^ arg1
]

{ #category : #generated }
PyRaiseNode >> arg1: aPyRootNode [
	self arg1 notNil
		ifTrue: [ self arg1 parent: nil ].
	arg1 := aPyRootNode.
	self arg1 notNil
		ifTrue: [ self arg1 parent: self ]
]

{ #category : #generated }
PyRaiseNode >> arg2 [
	^ arg2
]

{ #category : #generated }
PyRaiseNode >> arg2: aPyRootNode [
	self arg2 notNil
		ifTrue: [ self arg2 parent: nil ].
	arg2 := aPyRootNode.
	self arg2 notNil
		ifTrue: [ self arg2 parent: self ]
]

{ #category : #generated }
PyRaiseNode >> arg3 [
	^ arg3
]

{ #category : #generated }
PyRaiseNode >> arg3: aPyRootNode [
	self arg3 notNil
		ifTrue: [ self arg3 parent: nil ].
	arg3 := aPyRootNode.
	self arg3 notNil
		ifTrue: [ self arg3 parent: self ]
]

{ #category : #generated }
PyRaiseNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
PyRaiseNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
PyRaiseNode >> compositeTokenVariables [
	^ #(#commaTokens)
]

{ #category : #'generated-initialize-release' }
PyRaiseNode >> initialize [
	super initialize.
	commaTokens := OrderedCollection new: 2.
]

{ #category : #generated }
PyRaiseNode >> nodeVariables [
	^ #(#arg1 #arg2 #arg3)
]

{ #category : #generated }
PyRaiseNode >> raiseToken [
	^ raiseToken
]

{ #category : #generated }
PyRaiseNode >> raiseToken: aSmaCCToken [
	raiseToken := aSmaCCToken
]

{ #category : #generated }
PyRaiseNode >> tokenVariables [
	^ #(#raiseToken)
]
