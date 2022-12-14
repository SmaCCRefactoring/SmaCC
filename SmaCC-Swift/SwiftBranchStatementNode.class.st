Class {
	#name : #SwiftBranchStatementNode,
	#superclass : #SwiftStatementNode,
	#instVars : [
		'semicolonToken'
	],
	#category : 'SmaCC-Swift'
}

{ #category : #generated }
SwiftBranchStatementNode >> acceptVisitor: aParseVisitor [
	^ aParseVisitor visitBranchStatement: self
]

{ #category : #generated }
SwiftBranchStatementNode >> semicolonToken [
	^ semicolonToken
]

{ #category : #generated }
SwiftBranchStatementNode >> semicolonToken: aSmaCCToken [
	semicolonToken := aSmaCCToken
]

{ #category : #generated }
SwiftBranchStatementNode >> tokenVariables [
	^ #(#semicolonToken)
]
