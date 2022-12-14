Class {
	#name : #ASTSignedShortIntNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'shortToken'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTSignedShortIntNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitSignedShortInt: self
]

{ #category : #generated }
ASTSignedShortIntNode >> shortToken [
	^ shortToken
]

{ #category : #generated }
ASTSignedShortIntNode >> shortToken: aSmaCCToken [
	shortToken := aSmaCCToken
]

{ #category : #generated }
ASTSignedShortIntNode >> tokenVariables [
	^ #(#shortToken)
]
