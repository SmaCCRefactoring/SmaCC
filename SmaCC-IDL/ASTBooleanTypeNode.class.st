Class {
	#name : #ASTBooleanTypeNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'booleanToken'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTBooleanTypeNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitBooleanType: self
]

{ #category : #generated }
ASTBooleanTypeNode >> booleanToken [
	^ booleanToken
]

{ #category : #generated }
ASTBooleanTypeNode >> booleanToken: aSmaCCToken [
	booleanToken := aSmaCCToken
]

{ #category : #generated }
ASTBooleanTypeNode >> tokenVariables [
	^ #(#booleanToken)
]
