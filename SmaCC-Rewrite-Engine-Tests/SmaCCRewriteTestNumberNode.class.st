Class {
	#name : #SmaCCRewriteTestNumberNode,
	#superclass : #SmaCCRewriteTestExpressionNode,
	#instVars : [
		'number'
	],
	#category : 'SmaCC-Rewrite-Engine-Tests'
}

{ #category : #generated }
SmaCCRewriteTestNumberNode >> acceptVisitor: anExpressionVisitor [
	^ anExpressionVisitor visitNumber: self
]

{ #category : #generated }
SmaCCRewriteTestNumberNode >> number [
	^ number
]

{ #category : #generated }
SmaCCRewriteTestNumberNode >> number: aSmaCCToken [
	number := aSmaCCToken
]

{ #category : #generated }
SmaCCRewriteTestNumberNode >> tokenVariables [
	^ #(#number)
]
