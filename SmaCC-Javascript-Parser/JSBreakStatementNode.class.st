Class {
	#name : #JSBreakStatementNode,
	#superclass : #JSStatementNode,
	#instVars : [
		'breakToken',
		'label',
		'semicolon'
	],
	#category : 'SmaCC-Javascript-Parser'
}

{ #category : #generated }
JSBreakStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitBreakStatement: self
]

{ #category : #generated }
JSBreakStatementNode >> breakToken [
	^ breakToken
]

{ #category : #generated }
JSBreakStatementNode >> breakToken: aSmaCCToken [
	breakToken := aSmaCCToken
]

{ #category : #generated }
JSBreakStatementNode >> ignoredTokenVariables [
	^ #(#semicolon)
]

{ #category : #generated }
JSBreakStatementNode >> label [
	^ label
]

{ #category : #generated }
JSBreakStatementNode >> label: aSmaCCToken [
	label := aSmaCCToken
]

{ #category : #generated }
JSBreakStatementNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
JSBreakStatementNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]

{ #category : #generated }
JSBreakStatementNode >> tokenVariables [
	^ #(#breakToken #label)
]
