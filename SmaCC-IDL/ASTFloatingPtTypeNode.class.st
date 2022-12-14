Class {
	#name : #ASTFloatingPtTypeNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'floatToken',
		'doubleToken'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTFloatingPtTypeNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitFloatingPtType: self
]

{ #category : #generated }
ASTFloatingPtTypeNode >> doubleToken [
	^ doubleToken
]

{ #category : #generated }
ASTFloatingPtTypeNode >> doubleToken: aSmaCCToken [
	doubleToken := aSmaCCToken
]

{ #category : #generated }
ASTFloatingPtTypeNode >> floatToken [
	^ floatToken
]

{ #category : #generated }
ASTFloatingPtTypeNode >> floatToken: aSmaCCToken [
	floatToken := aSmaCCToken
]

{ #category : #generated }
ASTFloatingPtTypeNode >> tokenVariables [
	^ #(#floatToken #doubleToken)
]
