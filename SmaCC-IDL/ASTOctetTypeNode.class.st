Class {
	#name : #ASTOctetTypeNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'octetToken'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTOctetTypeNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitOctetType: self
]

{ #category : #generated }
ASTOctetTypeNode >> octetToken [
	^ octetToken
]

{ #category : #generated }
ASTOctetTypeNode >> octetToken: aSmaCCToken [
	octetToken := aSmaCCToken
]

{ #category : #generated }
ASTOctetTypeNode >> tokenVariables [
	^ #(#octetToken)
]
