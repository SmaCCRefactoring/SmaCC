Class {
	#name : #ASTForwardDclNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'interfaceToken',
		'id'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTForwardDclNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitForwardDcl: self
]

{ #category : #generated }
ASTForwardDclNode >> id [
	^ id
]

{ #category : #generated }
ASTForwardDclNode >> id: aSmaCCToken [
	id := aSmaCCToken
]

{ #category : #generated }
ASTForwardDclNode >> interfaceToken [
	^ interfaceToken
]

{ #category : #generated }
ASTForwardDclNode >> interfaceToken: aSmaCCToken [
	interfaceToken := aSmaCCToken
]

{ #category : #generated }
ASTForwardDclNode >> tokenVariables [
	^ #(#interfaceToken #id)
]
