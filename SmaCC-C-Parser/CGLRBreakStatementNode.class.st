Class {
	#name : #CGLRBreakStatementNode,
	#superclass : #CGLRAbstractNode,
	#instVars : [
		'breakToken',
		'semicolonToken'
	],
	#category : 'SmaCC-C-Parser'
}

{ #category : #generated }
CGLRBreakStatementNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitBreakStatement: self
]

{ #category : #generated }
CGLRBreakStatementNode >> breakToken [
	^ breakToken
]

{ #category : #generated }
CGLRBreakStatementNode >> breakToken: aSmaCCToken [
	breakToken := aSmaCCToken
]

{ #category : #generated }
CGLRBreakStatementNode >> semicolonToken [
	^ semicolonToken
]

{ #category : #generated }
CGLRBreakStatementNode >> semicolonToken: aSmaCCToken [
	semicolonToken := aSmaCCToken
]

{ #category : #generated }
CGLRBreakStatementNode >> tokenVariables [
	^ #(#breakToken #semicolonToken)
]
