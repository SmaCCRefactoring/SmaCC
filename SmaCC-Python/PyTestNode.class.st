Class {
	#name : #PyTestNode,
	#superclass : #PyRootNode,
	#instVars : [
		'trailers',
		'one',
		'orToken',
		'two',
		'ifToken',
		'if',
		'elseToken',
		'else'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyTestNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitTest: self
]

{ #category : #generated }
PyTestNode >> else [
	^ else
]

{ #category : #generated }
PyTestNode >> else: aPyRootNode [
	self else notNil
		ifTrue: [ self else parent: nil ].
	else := aPyRootNode.
	self else notNil
		ifTrue: [ self else parent: self ]
]

{ #category : #generated }
PyTestNode >> elseToken [
	^ elseToken
]

{ #category : #generated }
PyTestNode >> elseToken: aSmaCCToken [
	elseToken := aSmaCCToken
]

{ #category : #generated }
PyTestNode >> if [
	^ if
]

{ #category : #generated }
PyTestNode >> if: aPyRootNode [
	self if notNil
		ifTrue: [ self if parent: nil ].
	if := aPyRootNode.
	self if notNil
		ifTrue: [ self if parent: self ]
]

{ #category : #generated }
PyTestNode >> ifToken [
	^ ifToken
]

{ #category : #generated }
PyTestNode >> ifToken: aSmaCCToken [
	ifToken := aSmaCCToken
]

{ #category : #'generated-initialize-release' }
PyTestNode >> initialize [
	super initialize.
	trailers := OrderedCollection new: 2.
]

{ #category : #generated }
PyTestNode >> nodeVariables [
	^ #(#one #two #if #else)
]

{ #category : #generated }
PyTestNode >> one [
	^ one
]

{ #category : #generated }
PyTestNode >> one: aPyRootNode [
	self one notNil
		ifTrue: [ self one parent: nil ].
	one := aPyRootNode.
	self one notNil
		ifTrue: [ self one parent: self ]
]

{ #category : #generated }
PyTestNode >> orToken [
	^ orToken
]

{ #category : #generated }
PyTestNode >> orToken: aSmaCCToken [
	orToken := aSmaCCToken
]

{ #category : #generated }
PyTestNode >> otherVariables [
	^ #(#trailers)
]

{ #category : #generated }
PyTestNode >> pluralVariablesMap [
	^ Dictionary new
		at: 'trailer' put: 'trailers';
		yourself
]

{ #category : #generated }
PyTestNode >> tokenVariables [
	^ #(#orToken #ifToken #elseToken)
]

{ #category : #generated }
PyTestNode >> trailers [
	^ trailers
]

{ #category : #generated }
PyTestNode >> trailers: anOrderedCollection [
	trailers := anOrderedCollection
]

{ #category : #generated }
PyTestNode >> two [
	^ two
]

{ #category : #generated }
PyTestNode >> two: aPyRootNode [
	self two notNil
		ifTrue: [ self two parent: nil ].
	two := aPyRootNode.
	self two notNil
		ifTrue: [ self two parent: self ]
]
