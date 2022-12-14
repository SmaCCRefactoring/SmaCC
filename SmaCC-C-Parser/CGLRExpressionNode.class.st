Class {
	#name : #CGLRExpressionNode,
	#superclass : #CGLRAbstractNode,
	#instVars : [
		'expressions',
		'commaTokens'
	],
	#category : 'SmaCC-C-Parser'
}

{ #category : #generated }
CGLRExpressionNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitExpression: self
]

{ #category : #generated }
CGLRExpressionNode >> commaTokens [
	^ commaTokens
]

{ #category : #generated }
CGLRExpressionNode >> commaTokens: anOrderedCollection [
	commaTokens := anOrderedCollection
]

{ #category : #generated }
CGLRExpressionNode >> compositeNodeVariables [
	^ #(#expressions)
]

{ #category : #generated }
CGLRExpressionNode >> compositeTokenVariables [
	^ #(#commaTokens)
]

{ #category : #generated }
CGLRExpressionNode >> expressions [
	^ expressions
]

{ #category : #generated }
CGLRExpressionNode >> expressions: anOrderedCollection [
	self setParents: self expressions to: nil.
	expressions := anOrderedCollection.
	self setParents: self expressions to: self
]

{ #category : #'generated-initialize-release' }
CGLRExpressionNode >> initialize [
	super initialize.
	expressions := OrderedCollection new: 2.
	commaTokens := OrderedCollection new: 2.
]
