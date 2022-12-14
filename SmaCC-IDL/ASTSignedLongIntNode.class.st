Class {
	#name : #ASTSignedLongIntNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'longToken'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTSignedLongIntNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitSignedLongInt: self
]

{ #category : #generated }
ASTSignedLongIntNode >> longToken [
	^ longToken
]

{ #category : #generated }
ASTSignedLongIntNode >> longToken: aSmaCCToken [
	longToken := aSmaCCToken
]

{ #category : #generated }
ASTSignedLongIntNode >> tokenVariables [
	^ #(#longToken)
]
