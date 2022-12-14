Class {
	#name : #CSContinueStatementNode,
	#superclass : #CSStatementNode,
	#instVars : [
		'continueToken',
		'semicolonToken'
	],
	#category : 'SmaCC-CSharp'
}

{ #category : #generated }
CSContinueStatementNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitContinueStatement: self
]

{ #category : #generated }
CSContinueStatementNode >> continueToken [
	^ continueToken
]

{ #category : #generated }
CSContinueStatementNode >> continueToken: aSmaCCToken [
	continueToken := aSmaCCToken
]

{ #category : #generated }
CSContinueStatementNode >> ignoredTokenVariables [
	^ #(#semicolonToken)
]

{ #category : #generated }
CSContinueStatementNode >> semicolonToken [
	^ semicolonToken
]

{ #category : #generated }
CSContinueStatementNode >> semicolonToken: aSmaCCToken [
	semicolonToken := aSmaCCToken
]

{ #category : #generated }
CSContinueStatementNode >> tokenVariables [
	^ #(#continueToken)
]
