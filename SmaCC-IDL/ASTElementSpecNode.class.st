Class {
	#name : #ASTElementSpecNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'typeSpec',
		'declarator'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTElementSpecNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitElementSpec: self
]

{ #category : #generated }
ASTElementSpecNode >> declarator [
	^ declarator
]

{ #category : #generated }
ASTElementSpecNode >> declarator: anASTDeclaratorNode [
	self declarator notNil
		ifTrue: [ self declarator parent: nil ].
	declarator := anASTDeclaratorNode.
	self declarator notNil
		ifTrue: [ self declarator parent: self ]
]

{ #category : #generated }
ASTElementSpecNode >> nodeVariables [
	^ #(#typeSpec #declarator)
]

{ #category : #generated }
ASTElementSpecNode >> typeSpec [
	^ typeSpec
]

{ #category : #generated }
ASTElementSpecNode >> typeSpec: anASTTypeSpecNode [
	self typeSpec notNil
		ifTrue: [ self typeSpec parent: nil ].
	typeSpec := anASTTypeSpecNode.
	self typeSpec notNil
		ifTrue: [ self typeSpec parent: self ]
]
