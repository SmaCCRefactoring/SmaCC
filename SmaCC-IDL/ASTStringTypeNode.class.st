Class {
	#name : #ASTStringTypeNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'stringToken',
		'lessThanToken',
		'positiveIntConst',
		'greaterThanToken'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTStringTypeNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitStringType: self
]

{ #category : #generated }
ASTStringTypeNode >> greaterThanToken [
	^ greaterThanToken
]

{ #category : #generated }
ASTStringTypeNode >> greaterThanToken: aSmaCCToken [
	greaterThanToken := aSmaCCToken
]

{ #category : #generated }
ASTStringTypeNode >> lessThanToken [
	^ lessThanToken
]

{ #category : #generated }
ASTStringTypeNode >> lessThanToken: aSmaCCToken [
	lessThanToken := aSmaCCToken
]

{ #category : #generated }
ASTStringTypeNode >> nodeVariables [
	^ #(#positiveIntConst)
]

{ #category : #generated }
ASTStringTypeNode >> positiveIntConst [
	^ positiveIntConst
]

{ #category : #generated }
ASTStringTypeNode >> positiveIntConst: anASTPositiveIntConstNode [
	self positiveIntConst notNil
		ifTrue: [ self positiveIntConst parent: nil ].
	positiveIntConst := anASTPositiveIntConstNode.
	self positiveIntConst notNil
		ifTrue: [ self positiveIntConst parent: self ]
]

{ #category : #generated }
ASTStringTypeNode >> stringToken [
	^ stringToken
]

{ #category : #generated }
ASTStringTypeNode >> stringToken: aSmaCCToken [
	stringToken := aSmaCCToken
]

{ #category : #generated }
ASTStringTypeNode >> tokenVariables [
	^ #(#stringToken #lessThanToken #greaterThanToken)
]
