Class {
	#name : #JSCallExpressionNode,
	#superclass : #JSExpressionNode,
	#instVars : [
		'expression',
		'left',
		'right',
		'arguments',
		'commas'
	],
	#category : 'SmaCC-Javascript-Parser'
}

{ #category : #generated }
JSCallExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitCallExpression: self
]

{ #category : #generated }
JSCallExpressionNode >> arguments [
	^ arguments
]

{ #category : #generated }
JSCallExpressionNode >> arguments: anOrderedCollection [
	self setParents: self arguments to: nil.
	arguments := anOrderedCollection.
	self setParents: self arguments to: self
]

{ #category : #generated }
JSCallExpressionNode >> commas [
	^ commas
]

{ #category : #generated }
JSCallExpressionNode >> commas: anOrderedCollection [
	commas := anOrderedCollection
]

{ #category : #generated }
JSCallExpressionNode >> compositeNodeVariables [
	^ #(#arguments)
]

{ #category : #generated }
JSCallExpressionNode >> expression [
	^ expression
]

{ #category : #generated }
JSCallExpressionNode >> expression: aJSExpressionNode [
	self expression notNil
		ifTrue: [ self expression parent: nil ].
	expression := aJSExpressionNode.
	self expression notNil
		ifTrue: [ self expression parent: self ]
]

{ #category : #generated }
JSCallExpressionNode >> ignoredCompositeTokenVariables [
	^ #(#commas #leftParens #rightParens)
]

{ #category : #'generated-initialize-release' }
JSCallExpressionNode >> initialize [
	super initialize.
	arguments := OrderedCollection new: 2.
	commas := OrderedCollection new: 2.
]

{ #category : #generated }
JSCallExpressionNode >> left [
	^ left
]

{ #category : #generated }
JSCallExpressionNode >> left: aSmaCCToken [
	left := aSmaCCToken
]

{ #category : #generated }
JSCallExpressionNode >> nodeVariables [
	^ #(#expression)
]

{ #category : #generated }
JSCallExpressionNode >> right [
	^ right
]

{ #category : #generated }
JSCallExpressionNode >> right: aSmaCCToken [
	right := aSmaCCToken
]

{ #category : #generated }
JSCallExpressionNode >> tokenVariables [
	^ #(#left #right)
]
