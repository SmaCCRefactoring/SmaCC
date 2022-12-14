Class {
	#name : #ASTUnsignedLongIntNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'unsignedToken',
		'longToken'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTUnsignedLongIntNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitUnsignedLongInt: self
]

{ #category : #generated }
ASTUnsignedLongIntNode >> longToken [
	^ longToken
]

{ #category : #generated }
ASTUnsignedLongIntNode >> longToken: aSmaCCToken [
	longToken := aSmaCCToken
]

{ #category : #generated }
ASTUnsignedLongIntNode >> tokenVariables [
	^ #(#unsignedToken #longToken)
]

{ #category : #generated }
ASTUnsignedLongIntNode >> unsignedToken [
	^ unsignedToken
]

{ #category : #generated }
ASTUnsignedLongIntNode >> unsignedToken: aSmaCCToken [
	unsignedToken := aSmaCCToken
]
