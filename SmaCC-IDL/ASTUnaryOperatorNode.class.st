Class {
	#name : #ASTUnaryOperatorNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'minusToken',
		'plusToken',
		'tildeToken'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTUnaryOperatorNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitUnaryOperator: self
]

{ #category : #generated }
ASTUnaryOperatorNode >> minusToken [
	^ minusToken
]

{ #category : #generated }
ASTUnaryOperatorNode >> minusToken: aSmaCCToken [
	minusToken := aSmaCCToken
]

{ #category : #generated }
ASTUnaryOperatorNode >> plusToken [
	^ plusToken
]

{ #category : #generated }
ASTUnaryOperatorNode >> plusToken: aSmaCCToken [
	plusToken := aSmaCCToken
]

{ #category : #generated }
ASTUnaryOperatorNode >> tildeToken [
	^ tildeToken
]

{ #category : #generated }
ASTUnaryOperatorNode >> tildeToken: aSmaCCToken [
	tildeToken := aSmaCCToken
]

{ #category : #generated }
ASTUnaryOperatorNode >> tokenVariables [
	^ #(#minusToken #plusToken #tildeToken)
]
