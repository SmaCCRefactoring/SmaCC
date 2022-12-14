Class {
	#name : #ASTEnumTypeNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'enumToken',
		'id',
		'leftBraceToken',
		'enumerators',
		'rightBraceToken'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTEnumTypeNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitEnumType: self
]

{ #category : #generated }
ASTEnumTypeNode >> enumToken [
	^ enumToken
]

{ #category : #generated }
ASTEnumTypeNode >> enumToken: aSmaCCToken [
	enumToken := aSmaCCToken
]

{ #category : #generated }
ASTEnumTypeNode >> enumerators [
	^ enumerators
]

{ #category : #generated }
ASTEnumTypeNode >> enumerators: anASTEnumeratorsNode [
	self enumerators notNil
		ifTrue: [ self enumerators parent: nil ].
	enumerators := anASTEnumeratorsNode.
	self enumerators notNil
		ifTrue: [ self enumerators parent: self ]
]

{ #category : #generated }
ASTEnumTypeNode >> id [
	^ id
]

{ #category : #generated }
ASTEnumTypeNode >> id: aSmaCCToken [
	id := aSmaCCToken
]

{ #category : #generated }
ASTEnumTypeNode >> leftBraceToken [
	^ leftBraceToken
]

{ #category : #generated }
ASTEnumTypeNode >> leftBraceToken: aSmaCCToken [
	leftBraceToken := aSmaCCToken
]

{ #category : #generated }
ASTEnumTypeNode >> nodeVariables [
	^ #(#enumerators)
]

{ #category : #generated }
ASTEnumTypeNode >> rightBraceToken [
	^ rightBraceToken
]

{ #category : #generated }
ASTEnumTypeNode >> rightBraceToken: aSmaCCToken [
	rightBraceToken := aSmaCCToken
]

{ #category : #generated }
ASTEnumTypeNode >> tokenVariables [
	^ #(#enumToken #id #leftBraceToken #rightBraceToken)
]
