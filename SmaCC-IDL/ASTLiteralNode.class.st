Class {
	#name : #ASTLiteralNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'iNTEGER_LITERALToken',
		'sTRING_LITERALToken',
		'cHARACTER_LITERALToken',
		'fLOATING_POINT_LITERALToken',
		'booleanLiteral'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTLiteralNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitLiteral: self
]

{ #category : #generated }
ASTLiteralNode >> booleanLiteral [
	^ booleanLiteral
]

{ #category : #generated }
ASTLiteralNode >> booleanLiteral: anASTBooleanLiteralNode [
	self booleanLiteral notNil
		ifTrue: [ self booleanLiteral parent: nil ].
	booleanLiteral := anASTBooleanLiteralNode.
	self booleanLiteral notNil
		ifTrue: [ self booleanLiteral parent: self ]
]

{ #category : #generated }
ASTLiteralNode >> cHARACTER_LITERALToken [
	^ cHARACTER_LITERALToken
]

{ #category : #generated }
ASTLiteralNode >> cHARACTER_LITERALToken: aSmaCCToken [
	cHARACTER_LITERALToken := aSmaCCToken
]

{ #category : #generated }
ASTLiteralNode >> fLOATING_POINT_LITERALToken [
	^ fLOATING_POINT_LITERALToken
]

{ #category : #generated }
ASTLiteralNode >> fLOATING_POINT_LITERALToken: aSmaCCToken [
	fLOATING_POINT_LITERALToken := aSmaCCToken
]

{ #category : #generated }
ASTLiteralNode >> iNTEGER_LITERALToken [
	^ iNTEGER_LITERALToken
]

{ #category : #generated }
ASTLiteralNode >> iNTEGER_LITERALToken: aSmaCCToken [
	iNTEGER_LITERALToken := aSmaCCToken
]

{ #category : #generated }
ASTLiteralNode >> nodeVariables [
	^ #(#booleanLiteral)
]

{ #category : #generated }
ASTLiteralNode >> sTRING_LITERALToken [
	^ sTRING_LITERALToken
]

{ #category : #generated }
ASTLiteralNode >> sTRING_LITERALToken: aSmaCCToken [
	sTRING_LITERALToken := aSmaCCToken
]

{ #category : #generated }
ASTLiteralNode >> tokenVariables [
	^ #(#iNTEGER_LITERALToken #sTRING_LITERALToken #cHARACTER_LITERALToken #fLOATING_POINT_LITERALToken)
]
