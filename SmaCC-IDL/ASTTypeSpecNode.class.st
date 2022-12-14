Class {
	#name : #ASTTypeSpecNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'simpleTypeSpec',
		'constrTypeSpec'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTTypeSpecNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitTypeSpec: self
]

{ #category : #generated }
ASTTypeSpecNode >> constrTypeSpec [
	^ constrTypeSpec
]

{ #category : #generated }
ASTTypeSpecNode >> constrTypeSpec: anASTConstrTypeSpecNode [
	self constrTypeSpec notNil
		ifTrue: [ self constrTypeSpec parent: nil ].
	constrTypeSpec := anASTConstrTypeSpecNode.
	self constrTypeSpec notNil
		ifTrue: [ self constrTypeSpec parent: self ]
]

{ #category : #generated }
ASTTypeSpecNode >> nodeVariables [
	^ #(#simpleTypeSpec #constrTypeSpec)
]

{ #category : #generated }
ASTTypeSpecNode >> simpleTypeSpec [
	^ simpleTypeSpec
]

{ #category : #generated }
ASTTypeSpecNode >> simpleTypeSpec: anASTSimpleTypeSpecNode [
	self simpleTypeSpec notNil
		ifTrue: [ self simpleTypeSpec parent: nil ].
	simpleTypeSpec := anASTSimpleTypeSpecNode.
	self simpleTypeSpec notNil
		ifTrue: [ self simpleTypeSpec parent: self ]
]
