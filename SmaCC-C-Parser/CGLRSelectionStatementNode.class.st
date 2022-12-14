Class {
	#name : #CGLRSelectionStatementNode,
	#superclass : #CGLRAbstractNode,
	#instVars : [
		'then',
		'else',
		'ifToken',
		'leftParenToken',
		'rightParenToken',
		'elseToken',
		'if'
	],
	#category : 'SmaCC-C-Parser'
}

{ #category : #generated }
CGLRSelectionStatementNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitSelectionStatement: self
]

{ #category : #generated }
CGLRSelectionStatementNode >> else [
	^ else
]

{ #category : #generated }
CGLRSelectionStatementNode >> else: aCGLRAbstractNode [
	self else notNil
		ifTrue: [ self else parent: nil ].
	else := aCGLRAbstractNode.
	self else notNil
		ifTrue: [ self else parent: self ]
]

{ #category : #generated }
CGLRSelectionStatementNode >> elseToken [
	^ elseToken
]

{ #category : #generated }
CGLRSelectionStatementNode >> elseToken: aSmaCCToken [
	elseToken := aSmaCCToken
]

{ #category : #generated }
CGLRSelectionStatementNode >> if [
	^ if
]

{ #category : #generated }
CGLRSelectionStatementNode >> if: aCGLRExpressionNode [
	self if notNil
		ifTrue: [ self if parent: nil ].
	if := aCGLRExpressionNode.
	self if notNil
		ifTrue: [ self if parent: self ]
]

{ #category : #generated }
CGLRSelectionStatementNode >> ifToken [
	^ ifToken
]

{ #category : #generated }
CGLRSelectionStatementNode >> ifToken: aSmaCCToken [
	ifToken := aSmaCCToken
]

{ #category : #generated }
CGLRSelectionStatementNode >> leftParenToken [
	^ leftParenToken
]

{ #category : #generated }
CGLRSelectionStatementNode >> leftParenToken: aSmaCCToken [
	leftParenToken := aSmaCCToken
]

{ #category : #generated }
CGLRSelectionStatementNode >> nodeVariables [
	^ #(#if #then #else)
]

{ #category : #generated }
CGLRSelectionStatementNode >> rightParenToken [
	^ rightParenToken
]

{ #category : #generated }
CGLRSelectionStatementNode >> rightParenToken: aSmaCCToken [
	rightParenToken := aSmaCCToken
]

{ #category : #generated }
CGLRSelectionStatementNode >> then [
	^ then
]

{ #category : #generated }
CGLRSelectionStatementNode >> then: aCGLRAbstractNode [
	self then notNil
		ifTrue: [ self then parent: nil ].
	then := aCGLRAbstractNode.
	self then notNil
		ifTrue: [ self then parent: self ]
]

{ #category : #generated }
CGLRSelectionStatementNode >> tokenVariables [
	^ #(#ifToken #leftParenToken #rightParenToken #elseToken)
]
