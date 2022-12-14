Class {
	#name : #PyPrintNode,
	#superclass : #PyRootNode,
	#instVars : [
		'printToken',
		'greaterThanGreaterThanToken',
		'tests',
		'commaTokens'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyPrintNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitPrint: self
]

{ #category : #generated }
PyPrintNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
PyPrintNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
PyPrintNode >> compositeNodeVariables [
	^ #(#tests)
]

{ #category : #generated }
PyPrintNode >> compositeTokenVariables [
	^ #(#commaTokens)
]

{ #category : #generated }
PyPrintNode >> greaterThanGreaterThanToken [
	^ greaterThanGreaterThanToken
]

{ #category : #generated }
PyPrintNode >> greaterThanGreaterThanToken: aSmaCCToken [
	greaterThanGreaterThanToken := aSmaCCToken
]

{ #category : #'generated-initialize-release' }
PyPrintNode >> initialize [
	super initialize.
	tests := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
]

{ #category : #generated }
PyPrintNode >> printToken [
	^ printToken
]

{ #category : #generated }
PyPrintNode >> printToken: aSmaCCToken [
	printToken := aSmaCCToken
]

{ #category : #generated }
PyPrintNode >> tests [
	^ tests
]

{ #category : #generated }
PyPrintNode >> tests: anOrderedCollection [
	self setParents: self tests to: nil.
	tests := anOrderedCollection.
	self setParents: self tests to: self
]

{ #category : #generated }
PyPrintNode >> tokenVariables [
	^ #(#printToken #greaterThanGreaterThanToken)
]
