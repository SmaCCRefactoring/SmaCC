Class {
	#name : #ASTEnumeratorNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'id'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTEnumeratorNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitEnumerator: self
]

{ #category : #generated }
ASTEnumeratorNode >> id [
	^ id
]

{ #category : #generated }
ASTEnumeratorNode >> id: aSmaCCToken [
	id := aSmaCCToken
]

{ #category : #generated }
ASTEnumeratorNode >> tokenVariables [
	^ #(#id)
]
