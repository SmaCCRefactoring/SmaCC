Class {
	#name : #PyDotsNode,
	#superclass : #PyRootNode,
	#instVars : [
		'periodTokens'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyDotsNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitDots: self
]

{ #category : #generated }
PyDotsNode >> compositeTokenVariables [
	^ #(#periodTokens)
]

{ #category : #'generated-initialize-release' }
PyDotsNode >> initialize [
	super initialize.
	periodTokens := OrderedCollection new: 2.
]

{ #category : #generated }
PyDotsNode >> periodTokens [
	^ periodTokens
]

{ #category : #generated }
PyDotsNode >> periodTokens: anOrderedCollection [
	periodTokens := anOrderedCollection
]
