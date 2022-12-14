Class {
	#name : #PyYieldNode,
	#superclass : #PyRootNode,
	#instVars : [
		'yieldToken',
		'tests',
		'commaTokens'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyYieldNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitYield: self
]

{ #category : #generated }
PyYieldNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
PyYieldNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
PyYieldNode >> compositeNodeVariables [
	^ #(#tests)
]

{ #category : #generated }
PyYieldNode >> compositeTokenVariables [
	^ #(#commaTokens)
]

{ #category : #'generated-initialize-release' }
PyYieldNode >> initialize [
	super initialize.
	tests := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
]

{ #category : #generated }
PyYieldNode >> tests [
	^ tests
]

{ #category : #generated }
PyYieldNode >> tests: anOrderedCollection [
	self setParents: self tests to: nil.
	tests := anOrderedCollection.
	self setParents: self tests to: self
]

{ #category : #generated }
PyYieldNode >> tokenVariables [
	^ #(#yieldToken)
]

{ #category : #generated }
PyYieldNode >> yieldToken [
	^ yieldToken
]

{ #category : #generated }
PyYieldNode >> yieldToken: aSmaCCToken [
	yieldToken := aSmaCCToken
]
