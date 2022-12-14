Class {
	#name : #ASTConstrTypeSpecNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'structType',
		'unionType',
		'enumType'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTConstrTypeSpecNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitConstrTypeSpec: self
]

{ #category : #generated }
ASTConstrTypeSpecNode >> enumType [
	^ enumType
]

{ #category : #generated }
ASTConstrTypeSpecNode >> enumType: anASTEnumTypeNode [
	self enumType notNil
		ifTrue: [ self enumType parent: nil ].
	enumType := anASTEnumTypeNode.
	self enumType notNil
		ifTrue: [ self enumType parent: self ]
]

{ #category : #generated }
ASTConstrTypeSpecNode >> nodeVariables [
	^ #(#structType #unionType #enumType)
]

{ #category : #generated }
ASTConstrTypeSpecNode >> structType [
	^ structType
]

{ #category : #generated }
ASTConstrTypeSpecNode >> structType: anASTStructTypeNode [
	self structType notNil
		ifTrue: [ self structType parent: nil ].
	structType := anASTStructTypeNode.
	self structType notNil
		ifTrue: [ self structType parent: self ]
]

{ #category : #generated }
ASTConstrTypeSpecNode >> unionType [
	^ unionType
]

{ #category : #generated }
ASTConstrTypeSpecNode >> unionType: anASTUnionTypeNode [
	self unionType notNil
		ifTrue: [ self unionType parent: nil ].
	unionType := anASTUnionTypeNode.
	self unionType notNil
		ifTrue: [ self unionType parent: self ]
]
