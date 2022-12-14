Class {
	#name : #PyGlobalNode,
	#superclass : #PyRootNode,
	#instVars : [
		'globalToken',
		'commaTokens',
		'nameTokens'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyGlobalNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitGlobal: self
]

{ #category : #generated }
PyGlobalNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
PyGlobalNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
PyGlobalNode >> compositeTokenVariables [
	^ #(#commaTokens #nameTokens)
]

{ #category : #generated }
PyGlobalNode >> globalToken [
	^ globalToken
]

{ #category : #generated }
PyGlobalNode >> globalToken: aSmaCCToken [
	globalToken := aSmaCCToken
]

{ #category : #'generated-initialize-release' }
PyGlobalNode >> initialize [
	super initialize.
	commaTokens := OrderedCollection new: 2.
	nameTokens := OrderedCollection new: 2.
]

{ #category : #generated }
PyGlobalNode >> nameTokens [
	^ nameTokens
]

{ #category : #generated }
PyGlobalNode >> nameTokens: anOrderedCollection [
	nameTokens := anOrderedCollection
]

{ #category : #generated }
PyGlobalNode >> tokenVariables [
	^ #(#globalToken)
]
