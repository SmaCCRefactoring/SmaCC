Class {
	#name : #CSLiteralExpressionNode,
	#superclass : #CSExpressionNode,
	#instVars : [
		'token'
	],
	#category : 'SmaCC-CSharp'
}

{ #category : #generated }
CSLiteralExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitLiteralExpression: self
]

{ #category : #generated }
CSLiteralExpressionNode >> token [
	^ token
]

{ #category : #generated }
CSLiteralExpressionNode >> token: aSmaCCToken [
	token := aSmaCCToken
]

{ #category : #generated }
CSLiteralExpressionNode >> tokenVariables [
	^ #(#token)
]
