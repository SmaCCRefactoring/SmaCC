Class {
	#name : #JavaEmptyStatementNode,
	#superclass : #JavaStatementNode,
	#instVars : [
		'semicolon'
	],
	#category : 'SmaCC-Java'
}

{ #category : #generated }
JavaEmptyStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitEmptyStatement: self
]

{ #category : #generated }
JavaEmptyStatementNode >> ignoredTokenVariables [
	^ #(#semicolon)
]

{ #category : #generated }
JavaEmptyStatementNode >> semicolon [
	^ semicolon
]

{ #category : #generated }
JavaEmptyStatementNode >> semicolon: aSmaCCToken [
	semicolon := aSmaCCToken
]
