Class {
	#name : #ASTTypeDeclaratorNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'typeSpec',
		'declarators'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTTypeDeclaratorNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitTypeDeclarator: self
]

{ #category : #generated }
ASTTypeDeclaratorNode >> declarators [
	^ declarators
]

{ #category : #generated }
ASTTypeDeclaratorNode >> declarators: anASTDeclaratorsNode [
	self declarators notNil
		ifTrue: [ self declarators parent: nil ].
	declarators := anASTDeclaratorsNode.
	self declarators notNil
		ifTrue: [ self declarators parent: self ]
]

{ #category : #generated }
ASTTypeDeclaratorNode >> nodeVariables [
	^ #(#typeSpec #declarators)
]

{ #category : #generated }
ASTTypeDeclaratorNode >> typeSpec [
	^ typeSpec
]

{ #category : #generated }
ASTTypeDeclaratorNode >> typeSpec: anASTTypeSpecNode [
	self typeSpec notNil
		ifTrue: [ self typeSpec parent: nil ].
	typeSpec := anASTTypeSpecNode.
	self typeSpec notNil
		ifTrue: [ self typeSpec parent: self ]
]
