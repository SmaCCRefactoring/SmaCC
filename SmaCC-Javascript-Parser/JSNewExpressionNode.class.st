Class {
	#name : #JSNewExpressionNode,
	#superclass : #JSExpressionNode,
	#instVars : [
		'newToken',
		'expression',
		'left',
		'right',
		'arguments',
		'commas'
	],
	#category : 'SmaCC-Javascript-Parser'
}

{ #category : #generated }
JSNewExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitNewExpression: self
]

{ #category : #generated }
JSNewExpressionNode >> arguments [
	^ arguments
]

{ #category : #generated }
JSNewExpressionNode >> arguments: anOrderedCollection [
	self setParents: self arguments to: nil.
	arguments := anOrderedCollection.
	self setParents: self arguments to: self
]

{ #category : #generated }
JSNewExpressionNode >> commas [
	^ commas
]

{ #category : #generated }
JSNewExpressionNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
JSNewExpressionNode >> compositeNodeVariables [
	^ #(#arguments)
]

{ #category : #generated }
JSNewExpressionNode >> expression [
	^ expression
]

{ #category : #generated }
JSNewExpressionNode >> expression: aJSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aJSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
JSNewExpressionNode >> ignoredCompositeTokenVariables [
	^ #(#commas #leftParens #rightParens)
]

{ #category : #'generated-initialize-release' }
JSNewExpressionNode >> initialize [
	super initialize.
	arguments := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
JSNewExpressionNode >> left [
	^ left
]

{ #category : #generated }
JSNewExpressionNode >> left: aSmaCCToken [
	left := aSmaCCToken
]

{ #category : #generated }
JSNewExpressionNode >> newToken [
	^ newToken
]

{ #category : #generated }
JSNewExpressionNode >> newToken: aSmaCCToken [
	newToken := aSmaCCToken
]

{ #category : #generated }
JSNewExpressionNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
JSNewExpressionNode >> right [
	^ right
]

{ #category : #generated }
JSNewExpressionNode >> right: aSmaCCToken [
	right := aSmaCCToken
]

{ #category : #generated }
JSNewExpressionNode >> tokenVariables [
	^ #(#newToken #left #right)
]
