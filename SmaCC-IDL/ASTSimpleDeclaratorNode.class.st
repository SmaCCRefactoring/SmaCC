Class {
	#name : #ASTSimpleDeclaratorNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'id'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTSimpleDeclaratorNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitSimpleDeclarator: self
]

{ #category : #generated }
ASTSimpleDeclaratorNode >> id [
	^ id
]

{ #category : #generated }
ASTSimpleDeclaratorNode >> id: aSmaCCToken [
	id := aSmaCCToken
]

{ #category : #generated }
ASTSimpleDeclaratorNode >> tokenVariables [
	^ #(#id)
]
