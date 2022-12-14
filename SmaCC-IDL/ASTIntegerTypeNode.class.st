Class {
	#name : #ASTIntegerTypeNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'signedInt',
		'unsignedInt'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTIntegerTypeNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitIntegerType: self
]

{ #category : #generated }
ASTIntegerTypeNode >> nodeVariables [
	^ #(#signedInt #unsignedInt)
]

{ #category : #generated }
ASTIntegerTypeNode >> signedInt [
	^ signedInt
]

{ #category : #generated }
ASTIntegerTypeNode >> signedInt: anASTSignedIntNode [
	self signedInt notNil
		ifTrue: [ self signedInt parent: nil ].
	signedInt := anASTSignedIntNode.
	self signedInt notNil
		ifTrue: [ self signedInt parent: self ]
]

{ #category : #generated }
ASTIntegerTypeNode >> unsignedInt [
	^ unsignedInt
]

{ #category : #generated }
ASTIntegerTypeNode >> unsignedInt: anASTUnsignedIntNode [
	self unsignedInt notNil
		ifTrue: [ self unsignedInt parent: nil ].
	unsignedInt := anASTUnsignedIntNode.
	self unsignedInt notNil
		ifTrue: [ self unsignedInt parent: self ]
]
