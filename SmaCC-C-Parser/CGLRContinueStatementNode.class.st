Class {
	#name : #CGLRContinueStatementNode,
	#superclass : #CGLRAbstractNode,
	#instVars : [
		'continueToken',
		'semicolonToken'
	],
	#category : 'SmaCC-C-Parser'
}

{ #category : #generated }
CGLRContinueStatementNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitContinueStatement: self
]

{ #category : #generated }
CGLRContinueStatementNode >> continueToken [
	^ continueToken
]

{ #category : #generated }
CGLRContinueStatementNode >> continueToken: aSmaCCToken [
	continueToken := aSmaCCToken
]

{ #category : #generated }
CGLRContinueStatementNode >> semicolonToken [
	^ semicolonToken
]

{ #category : #generated }
CGLRContinueStatementNode >> semicolonToken: aSmaCCToken [
	semicolonToken := aSmaCCToken
]

{ #category : #generated }
CGLRContinueStatementNode >> tokenVariables [
	^ #(#continueToken #semicolonToken)
]
