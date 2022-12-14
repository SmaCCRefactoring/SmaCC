Class {
	#name : #ASTTypeDclNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'typedefToken',
		'typeDeclarator',
		'structType',
		'unionType',
		'enumType'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTTypeDclNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitTypeDcl: self
]

{ #category : #generated }
ASTTypeDclNode >> enumType [
	^ enumType
]

{ #category : #generated }
ASTTypeDclNode >> enumType: anASTEnumTypeNode [
	self enumType notNil
		ifTrue: [ self enumType parent: nil ].
	enumType := anASTEnumTypeNode.
	self enumType notNil
		ifTrue: [ self enumType parent: self ]
]

{ #category : #generated }
ASTTypeDclNode >> nodeVariables [
	^ #(#typeDeclarator #structType #unionType #enumType)
]

{ #category : #generated }
ASTTypeDclNode >> structType [
	^ structType
]

{ #category : #generated }
ASTTypeDclNode >> structType: anASTStructTypeNode [
	self structType notNil
		ifTrue: [ self structType parent: nil ].
	structType := anASTStructTypeNode.
	self structType notNil
		ifTrue: [ self structType parent: self ]
]

{ #category : #generated }
ASTTypeDclNode >> tokenVariables [
	^ #(#typedefToken)
]

{ #category : #generated }
ASTTypeDclNode >> typeDeclarator [
	^ typeDeclarator
]

{ #category : #generated }
ASTTypeDclNode >> typeDeclarator: anASTTypeDeclaratorNode [
	self typeDeclarator notNil
		ifTrue: [ self typeDeclarator parent: nil ].
	typeDeclarator := anASTTypeDeclaratorNode.
	self typeDeclarator notNil
		ifTrue: [ self typeDeclarator parent: self ]
]

{ #category : #generated }
ASTTypeDclNode >> typedefToken [
	^ typedefToken
]

{ #category : #generated }
ASTTypeDclNode >> typedefToken: aSmaCCToken [
	typedefToken := aSmaCCToken
]

{ #category : #generated }
ASTTypeDclNode >> unionType [
	^ unionType
]

{ #category : #generated }
ASTTypeDclNode >> unionType: anASTUnionTypeNode [
	self unionType notNil
		ifTrue: [ self unionType parent: nil ].
	unionType := anASTUnionTypeNode.
	self unionType notNil
		ifTrue: [ self unionType parent: self ]
]
