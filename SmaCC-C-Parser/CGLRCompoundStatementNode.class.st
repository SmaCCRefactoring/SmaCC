Class {
	#name : #CGLRCompoundStatementNode,
	#superclass : #CGLRAbstractNode,
	#instVars : [
		'declarations',
		'statements',
		'lEFT_BRACEToken',
		'rIGHT_BRACEToken'
	],
	#category : 'SmaCC-C-Parser'
}

{ #category : #generated }
CGLRCompoundStatementNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitCompoundStatement: self
]

{ #category : #generated }
CGLRCompoundStatementNode >> compositeNodeVariables [
	^ #(#statements #declarations)
]

{ #category : #generated }
CGLRCompoundStatementNode >> declarations [
	^ declarations
]

{ #category : #generated }
CGLRCompoundStatementNode >> declarations: anOrderedCollection [
	self setParents: self declarations to: nil.
	declarations := anOrderedCollection.
	self setParents: self declarations to: self
]

{ #category : #'generated-initialize-release' }
CGLRCompoundStatementNode >> initialize [
	super initialize.
	statements := OrderedCollection new: 2.
	declarations := OrderedCollection new: 2.
]

{ #category : #generated }
CGLRCompoundStatementNode >> lEFT_BRACEToken [
	^ lEFT_BRACEToken
]

{ #category : #generated }
CGLRCompoundStatementNode >> lEFT_BRACEToken: aSmaCCToken [
	lEFT_BRACEToken := aSmaCCToken
]

{ #category : #generated }
CGLRCompoundStatementNode >> rIGHT_BRACEToken [
	^ rIGHT_BRACEToken
]

{ #category : #generated }
CGLRCompoundStatementNode >> rIGHT_BRACEToken: aSmaCCToken [
	rIGHT_BRACEToken := aSmaCCToken
]

{ #category : #generated }
CGLRCompoundStatementNode >> statements [
	^ statements
]

{ #category : #generated }
CGLRCompoundStatementNode >> statements: anOrderedCollection [
	self setParents: self statements to: nil.
	statements := anOrderedCollection.
	self setParents: self statements to: self
]

{ #category : #generated }
CGLRCompoundStatementNode >> tokenVariables [
	^ #(#lEFT_BRACEToken #rIGHT_BRACEToken)
]
