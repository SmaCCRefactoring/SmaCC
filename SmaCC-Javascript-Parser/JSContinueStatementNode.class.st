Class {
	#name : #JSContinueStatementNode,
	#superclass : #JSStatementNode,
	#instVars : [
		'continueToken',
		'label',
		'semicolon'
	],
	#category : 'SmaCC-Javascript-Parser'
}

{ #category : #generated }
JSContinueStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitContinueStatement: self
]

{ #category : #generated }
JSContinueStatementNode >> continueToken [
	^ continueToken
]

{ #category : #generated }
JSContinueStatementNode >> continueToken: aSmaCCToken [
	continueToken := aSmaCCToken
]

{ #category : #generated }
JSContinueStatementNode >> ignoredTokenVariables [
	^ #(#semicolon)
]

{ #category : #generated }
JSContinueStatementNode >> label [
	^ label
]

{ #category : #generated }
JSContinueStatementNode >> label: aSmaCCToken [
	label := aSmaCCToken
]

{ #category : #generated }
JSContinueStatementNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
JSContinueStatementNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
JSContinueStatementNode >> tokenVariables [
	^ #(#continueToken #label)
]
