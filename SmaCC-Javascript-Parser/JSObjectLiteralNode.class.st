Class {
	#name : #JSObjectLiteralNode,
	#superclass : #JSExpressionNode,
	#instVars : [
		'leftBrace',
		'rightBrace',
		'assignments',
		'commas'
	],
	#category : 'SmaCC-Javascript-Parser'
}

{ #category : #generated }
JSObjectLiteralNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitObjectLiteral: self
]

{ #category : #generated }
JSObjectLiteralNode >> assignments [
	^ assignments
]

{ #category : #generated }
JSObjectLiteralNode >> assignments: anOrderedCollection [
	self setParents: self assignments to: nil.
	assignments := anOrderedCollection.
	self setParents: self assignments to: self
]

{ #category : #generated }
JSObjectLiteralNode >> commas [
	^ commas
]

{ #category : #generated }
JSObjectLiteralNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
JSObjectLiteralNode >> compositeNodeVariables [
	^ #(#assignments)
]

{ #category : #generated }
JSObjectLiteralNode >> ignoredCompositeTokenVariables [
	^ #(#commas #leftParens #rightParens)
]

{ #category : #generated }
JSObjectLiteralNode >> ignoredTokenVariables [
	^ #(#leftBrace #rightBrace)
]

{ #category : #'generated-initialize-release' }
JSObjectLiteralNode >> initialize [
	super initialize.
	assignments := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
JSObjectLiteralNode >> leftBrace [
	^ leftBrace
]

{ #category : #generated }
JSObjectLiteralNode >> leftBrace: aSmaCCToken [
	leftBrace := aSmaCCToken
]

{ #category : #generated }
JSObjectLiteralNode >> rightBrace [
	^ rightBrace
]

{ #category : #generated }
JSObjectLiteralNode >> rightBrace: aSmaCCToken [
	rightBrace := aSmaCCToken
]
