Class {
	#name : #ASTParamDclNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'paramAttribute',
		'paramTypeSpec',
		'simpleDeclarator'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTParamDclNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitParamDcl: self
]

{ #category : #generated }
ASTParamDclNode >> nodeVariables [
	^ #(#paramAttribute #paramTypeSpec #simpleDeclarator)
]

{ #category : #generated }
ASTParamDclNode >> paramAttribute [
	^ paramAttribute
]

{ #category : #generated }
ASTParamDclNode >> paramAttribute: anASTParamAttributeNode [
	self paramAttribute notNil
		ifTrue: [ self paramAttribute parent: nil ].
	paramAttribute := anASTParamAttributeNode.
	self paramAttribute notNil
		ifTrue: [ self paramAttribute parent: self ]
]

{ #category : #generated }
ASTParamDclNode >> paramTypeSpec [
	^ paramTypeSpec
]

{ #category : #generated }
ASTParamDclNode >> paramTypeSpec: anASTParamTypeSpecNode [
	self paramTypeSpec notNil
		ifTrue: [ self paramTypeSpec parent: nil ].
	paramTypeSpec := anASTParamTypeSpecNode.
	self paramTypeSpec notNil
		ifTrue: [ self paramTypeSpec parent: self ]
]

{ #category : #generated }
ASTParamDclNode >> simpleDeclarator [
	^ simpleDeclarator
]

{ #category : #generated }
ASTParamDclNode >> simpleDeclarator: anASTSimpleDeclaratorNode [
	self simpleDeclarator notNil
		ifTrue: [ self simpleDeclarator parent: nil ].
	simpleDeclarator := anASTSimpleDeclaratorNode.
	self simpleDeclarator notNil
		ifTrue: [ self simpleDeclarator parent: self ]
]
