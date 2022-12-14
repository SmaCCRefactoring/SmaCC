Class {
	#name : #PyExceptNode,
	#superclass : #PyRootNode,
	#instVars : [
		'colonTokens',
		'nEWLINETokens',
		'iNDENTTokens',
		'dEDENTTokens',
		'exceptTokens',
		'excepts',
		'asTokens',
		'anothers',
		'commaTokens',
		'except2s',
		'suites'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyExceptNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitExcept: self
]

{ #category : #generated }
PyExceptNode >> anothers [
	^ anothers
]

{ #category : #generated }
PyExceptNode >> anothers: anOrderedCollection [
	self setParents: self anothers to: nil.
	anothers := anOrderedCollection.
	self setParents: self anothers to: self
]

{ #category : #generated }
PyExceptNode >> asTokens [
	^ asTokens
]

{ #category : #generated }
PyExceptNode >> asTokens: anOrderedCollection [
	asTokens := anOrderedCollection
]

{ #category : #generated }
PyExceptNode >> colonTokens [
	^ colonTokens
]

{ #category : #generated }
PyExceptNode >> colonTokens: anOrderedCollection [
	colonTokens := anOrderedCollection
]

{ #category : #generated }
PyExceptNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
PyExceptNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
PyExceptNode >> compositeNodeVariables [
	^ #(#suites #excepts #anothers #except2s)
]

{ #category : #generated }
PyExceptNode >> compositeTokenVariables [
	^ #(#colonTokens #nEWLINETokens #iNDENTTokens #dEDENTTokens #exceptTokens #asTokens #commaTokens)
]

{ #category : #generated }
PyExceptNode >> dEDENTTokens [
	^ dEDENTTokens
]

{ #category : #generated }
PyExceptNode >> dEDENTTokens: anOrderedCollection [
	dEDENTTokens := anOrderedCollection
]

{ #category : #generated }
PyExceptNode >> except2s [
	^ except2s
]

{ #category : #generated }
PyExceptNode >> except2s: anOrderedCollection [
	self setParents: self except2s to: nil.
	except2s := anOrderedCollection.
	self setParents: self except2s to: self
]

{ #category : #generated }
PyExceptNode >> exceptTokens [
	^ exceptTokens
]

{ #category : #generated }
PyExceptNode >> exceptTokens: anOrderedCollection [
	exceptTokens := anOrderedCollection
]

{ #category : #generated }
PyExceptNode >> excepts [
	^ excepts
]

{ #category : #generated }
PyExceptNode >> excepts: anOrderedCollection [
	self setParents: self excepts to: nil.
	excepts := anOrderedCollection.
	self setParents: self excepts to: self
]

{ #category : #generated }
PyExceptNode >> iNDENTTokens [
	^ iNDENTTokens
]

{ #category : #generated }
PyExceptNode >> iNDENTTokens: anOrderedCollection [
	iNDENTTokens := anOrderedCollection
]

{ #category : #'generated-initialize-release' }
PyExceptNode >> initialize [
	super initialize.
	colonTokens := OrderedCollection new: 2.
	suites := OrderedCollection new: 2.
	nEWLINETokens := OrderedCollection new: 2.
	iNDENTTokens := OrderedCollection new: 2.
	dEDENTTokens := OrderedCollection new: 2.
	exceptTokens := OrderedCollection new: 2.
	excepts := OrderedCollection new: 2.
	asTokens := OrderedCollection new: 2.
	anothers := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
	except2s := OrderedCollection new: 2.
]

{ #category : #generated }
PyExceptNode >> nEWLINETokens [
	^ nEWLINETokens
]

{ #category : #generated }
PyExceptNode >> nEWLINETokens: anOrderedCollection [
	nEWLINETokens := anOrderedCollection
]

{ #category : #generated }
PyExceptNode >> pluralVariablesMap [
	^ Dictionary new
		at: 'colonToken' put: 'colonTokens';
		at: 'suite' put: 'suites';
		at: 'nEWLINEToken' put: 'nEWLINETokens';
		at: 'iNDENTToken' put: 'iNDENTTokens';
		at: 'dEDENTToken' put: 'dEDENTTokens';
		at: 'exceptToken' put: 'exceptTokens';
		at: 'except' put: 'excepts';
		at: 'asToken' put: 'asTokens';
		at: 'another' put: 'anothers';
		at: 'commaToken' put: 'commaTokens';
		at: 'except2' put: 'except2s';
		yourself
]

{ #category : #generated }
PyExceptNode >> suites [
	^ suites
]

{ #category : #generated }
PyExceptNode >> suites: anOrderedCollection [
	self setParents: self suites to: nil.
	suites := anOrderedCollection.
	self setParents: self suites to: self
]
