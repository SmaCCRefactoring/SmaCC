Class {
	#name : #CSVoidTypeNode,
	#superclass : #CSTypeNode,
	#instVars : [
		'voidToken'
	],
	#category : 'SmaCC-CSharp'
}

{ #category : #generated }
CSVoidTypeNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitVoidType: self
]

{ #category : #generated }
CSVoidTypeNode >> tokenVariables [
	^ #(#voidToken)
]

{ #category : #generated }
CSVoidTypeNode >> voidToken [
	^ voidToken
]

{ #category : #generated }
CSVoidTypeNode >> voidToken: aSmaCCToken [
	voidToken := aSmaCCToken
]
