Class {
	#name : #ASTBooleanLiteralNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'tRUEToken',
		'fALSEToken'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTBooleanLiteralNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitBooleanLiteral: self
]

{ #category : #generated }
ASTBooleanLiteralNode >> fALSEToken [
	^ fALSEToken
]

{ #category : #generated }
ASTBooleanLiteralNode >> fALSEToken: aSmaCCToken [
	fALSEToken := aSmaCCToken
]

{ #category : #generated }
ASTBooleanLiteralNode >> tRUEToken [
	^ tRUEToken
]

{ #category : #generated }
ASTBooleanLiteralNode >> tRUEToken: aSmaCCToken [
	tRUEToken := aSmaCCToken
]

{ #category : #generated }
ASTBooleanLiteralNode >> tokenVariables [
	^ #(#tRUEToken #fALSEToken)
]
