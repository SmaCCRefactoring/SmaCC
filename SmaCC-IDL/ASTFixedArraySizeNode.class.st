Class {
	#name : #ASTFixedArraySizeNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'leftBracketToken',
		'positiveIntConst',
		'rightBracketToken'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTFixedArraySizeNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitFixedArraySize: self
]

{ #category : #generated }
ASTFixedArraySizeNode >> leftBracketToken [
	^ leftBracketToken
]

{ #category : #generated }
ASTFixedArraySizeNode >> leftBracketToken: aSmaCCToken [
	leftBracketToken := aSmaCCToken
]

{ #category : #generated }
ASTFixedArraySizeNode >> nodeVariables [
	^ #(#positiveIntConst)
]

{ #category : #generated }
ASTFixedArraySizeNode >> positiveIntConst [
	^ positiveIntConst
]

{ #category : #generated }
ASTFixedArraySizeNode >> positiveIntConst: anASTPositiveIntConstNode [
	self positiveIntConst notNil
		ifTrue: [ self positiveIntConst parent: nil ].
	positiveIntConst := anASTPositiveIntConstNode.
	self positiveIntConst notNil
		ifTrue: [ self positiveIntConst parent: self ]
]

{ #category : #generated }
ASTFixedArraySizeNode >> rightBracketToken [
	^ rightBracketToken
]

{ #category : #generated }
ASTFixedArraySizeNode >> rightBracketToken: aSmaCCToken [
	rightBracketToken := aSmaCCToken
]

{ #category : #generated }
ASTFixedArraySizeNode >> tokenVariables [
	^ #(#leftBracketToken #rightBracketToken)
]
