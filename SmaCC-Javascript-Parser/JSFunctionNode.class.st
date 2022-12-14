Class {
	#name : #JSFunctionNode,
	#superclass : #JSExpressionNode,
	#instVars : [
		'functionToken',
		'name',
		'arguments',
		'commas',
		'leftBrace',
		'statements',
		'rightBrace'
	],
	#category : 'SmaCC-Javascript-Parser'
}

{ #category : #generated }
JSFunctionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitFunction: self
]

{ #category : #generated }
JSFunctionNode >> arguments [
	^ arguments
]

{ #category : #generated }
JSFunctionNode >> arguments: anOrderedCollection [
	arguments := anOrderedCollection
]

{ #category : #generated }
JSFunctionNode >> commas [
	^ commas
]

{ #category : #generated }
JSFunctionNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
JSFunctionNode >> compositeNodeVariables [
	^ #(#statements)
]

{ #category : #generated }
JSFunctionNode >> compositeTokenVariables [
	^ #(#arguments)
]

{ #category : #generated }
JSFunctionNode >> functionToken [
	^ functionToken
]

{ #category : #generated }
JSFunctionNode >> functionToken: aSmaCCToken [
	functionToken := aSmaCCToken
]

{ #category : #generated }
JSFunctionNode >> ignoredCompositeTokenVariables [
	^ #(#commas #leftParens #rightParens)
]

{ #category : #generated }
JSFunctionNode >> ignoredTokenVariables [
	^ #(#leftBrace #rightBrace)
]

{ #category : #'generated-initialize-release' }
JSFunctionNode >> initialize [
	super initialize.
	arguments := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
	statements := OrderedCollection new: 2.
]

{ #category : #generated }
JSFunctionNode >> leftBrace [
	^ leftBrace
]

{ #category : #generated }
JSFunctionNode >> leftBrace: aSmaCCToken [
	leftBrace := aSmaCCToken
]

{ #category : #generated }
JSFunctionNode >> name [
	^ name
]

{ #category : #generated }
JSFunctionNode >> name: aSmaCCToken [
	name := aSmaCCToken
]

{ #category : #generated }
JSFunctionNode >> rightBrace [
	^ rightBrace
]

{ #category : #generated }
JSFunctionNode >> rightBrace: aSmaCCToken [
	rightBrace := aSmaCCToken
]

{ #category : #generated }
JSFunctionNode >> statements [
	^ statements
]

{ #category : #generated }
JSFunctionNode >> statements: anOrderedCollection [
	self setParents: self statements to: nil.
	statements := anOrderedCollection.
	self setParents: self statements to: self
]

{ #category : #generated }
JSFunctionNode >> tokenVariables [
	^ #(#functionToken #name)
]
