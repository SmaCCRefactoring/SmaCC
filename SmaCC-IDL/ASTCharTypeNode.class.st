Class {
	#name : #ASTCharTypeNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'charToken'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTCharTypeNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitCharType: self
]

{ #category : #generated }
ASTCharTypeNode >> charToken [
	^ charToken
]

{ #category : #generated }
ASTCharTypeNode >> charToken: aSmaCCToken [
	charToken := aSmaCCToken
]

{ #category : #generated }
ASTCharTypeNode >> tokenVariables [
	^ #(#charToken)
]
