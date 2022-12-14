Class {
	#name : #CSSimpleTypeNode,
	#superclass : #CSTypeNode,
	#instVars : [
		'token'
	],
	#category : 'SmaCC-CSharp'
}

{ #category : #generated }
CSSimpleTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitSimpleType: self
]

{ #category : #generated }
CSSimpleTypeNode >> token [
	^ token
]

{ #category : #generated }
CSSimpleTypeNode >> token: aSmaCCToken [
	token := aSmaCCToken
]

{ #category : #generated }
CSSimpleTypeNode >> tokenVariables [
	^ #(#token)
]
