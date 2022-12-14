Class {
	#name : #ASTAnyTypeNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'anyToken'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTAnyTypeNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitAnyType: self
]

{ #category : #generated }
ASTAnyTypeNode >> anyToken [
	^ anyToken
]

{ #category : #generated }
ASTAnyTypeNode >> anyToken: aSmaCCToken [
	anyToken := aSmaCCToken
]

{ #category : #generated }
ASTAnyTypeNode >> tokenVariables [
	^ #(#anyToken)
]
