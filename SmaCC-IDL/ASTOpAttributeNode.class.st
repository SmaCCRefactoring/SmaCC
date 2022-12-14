Class {
	#name : #ASTOpAttributeNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'onewayToken'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTOpAttributeNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitOpAttribute: self
]

{ #category : #generated }
ASTOpAttributeNode >> onewayToken [
	^ onewayToken
]

{ #category : #generated }
ASTOpAttributeNode >> onewayToken: aSmaCCToken [
	onewayToken := aSmaCCToken
]

{ #category : #generated }
ASTOpAttributeNode >> tokenVariables [
	^ #(#onewayToken)
]
