Class {
	#name : #CGLRSwitchStatementNode,
	#superclass : #CGLRAbstractNode,
	#instVars : [
		'statement',
		'switchToken',
		'leftParenToken',
		'rightParenToken',
		'if'
	],
	#category : 'SmaCC-C-Parser'
}

{ #category : #generated }
CGLRSwitchStatementNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitSwitchStatement: self
]

{ #category : #generated }
CGLRSwitchStatementNode >> if [
	^ if
]

{ #category : #generated }
CGLRSwitchStatementNode >> if: aCGLRExpressionNode [
	self if notNil
		ifTrue: [ self if parent: nil ].
	if := aCGLRExpressionNode.
	self if notNil
		ifTrue: [ self if parent: self ]
]

{ #category : #generated }
CGLRSwitchStatementNode >> leftParenToken [
	^ leftParenToken
]

{ #category : #generated }
CGLRSwitchStatementNode >> leftParenToken: aSmaCCToken [
	leftParenToken := aSmaCCToken
]

{ #category : #generated }
CGLRSwitchStatementNode >> nodeVariables [
	^ #(#if #statement)
]

{ #category : #generated }
CGLRSwitchStatementNode >> rightParenToken [
	^ rightParenToken
]

{ #category : #generated }
CGLRSwitchStatementNode >> rightParenToken: aSmaCCToken [
	rightParenToken := aSmaCCToken
]

{ #category : #generated }
CGLRSwitchStatementNode >> statement [
	^ statement
]

{ #category : #generated }
CGLRSwitchStatementNode >> statement: aCGLRAbstractNode [
	self statement notNil
		ifTrue: [ self statement parent: nil ].
	statement := aCGLRAbstractNode.
	self statement notNil
		ifTrue: [ self statement parent: self ]
]

{ #category : #generated }
CGLRSwitchStatementNode >> switchToken [
	^ switchToken
]

{ #category : #generated }
CGLRSwitchStatementNode >> switchToken: aSmaCCToken [
	switchToken := aSmaCCToken
]

{ #category : #generated }
CGLRSwitchStatementNode >> tokenVariables [
	^ #(#switchToken #leftParenToken #rightParenToken)
]
