Class {
	#name : #CSBaseExpressionNode,
	#superclass : #CSExpressionNode,
	#instVars : [
		'baseToken'
	],
	#category : 'SmaCC-CSharp'
}

{ #category : #generated }
CSBaseExpressionNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitBaseExpression: self
]

{ #category : #generated }
CSBaseExpressionNode >> baseToken [
	^ baseToken
]

{ #category : #generated }
CSBaseExpressionNode >> baseToken: aSmaCCToken [
	baseToken := aSmaCCToken
]

{ #category : #generated }
CSBaseExpressionNode >> tokenVariables [
	^ #(#baseToken)
]
