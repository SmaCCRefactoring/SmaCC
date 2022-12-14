Class {
	#name : #ASTUnsignedShortIntNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'unsignedToken',
		'shortToken'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTUnsignedShortIntNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitUnsignedShortInt: self
]

{ #category : #generated }
ASTUnsignedShortIntNode >> shortToken [
	^ shortToken
]

{ #category : #generated }
ASTUnsignedShortIntNode >> shortToken: aSmaCCToken [
	shortToken := aSmaCCToken
]

{ #category : #generated }
ASTUnsignedShortIntNode >> tokenVariables [
	^ #(#unsignedToken #shortToken)
]

{ #category : #generated }
ASTUnsignedShortIntNode >> unsignedToken [
	^ unsignedToken
]

{ #category : #generated }
ASTUnsignedShortIntNode >> unsignedToken: aSmaCCToken [
	unsignedToken := aSmaCCToken
]
