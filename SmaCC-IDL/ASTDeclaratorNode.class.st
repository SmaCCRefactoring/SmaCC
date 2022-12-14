Class {
	#name : #ASTDeclaratorNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'simpleDeclarator',
		'complexDeclarator'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTDeclaratorNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitDeclarator: self
]

{ #category : #generated }
ASTDeclaratorNode >> complexDeclarator [
	^ complexDeclarator
]

{ #category : #generated }
ASTDeclaratorNode >> complexDeclarator: anASTComplexDeclaratorNode [
	self complexDeclarator notNil
		ifTrue: [ self complexDeclarator parent: nil ].
	complexDeclarator := anASTComplexDeclaratorNode.
	self complexDeclarator notNil
		ifTrue: [ self complexDeclarator parent: self ]
]

{ #category : #generated }
ASTDeclaratorNode >> nodeVariables [
	^ #(#simpleDeclarator #complexDeclarator)
]

{ #category : #generated }
ASTDeclaratorNode >> simpleDeclarator [
	^ simpleDeclarator
]

{ #category : #generated }
ASTDeclaratorNode >> simpleDeclarator: anASTSimpleDeclaratorNode [
	self simpleDeclarator notNil
		ifTrue: [ self simpleDeclarator parent: nil ].
	simpleDeclarator := anASTSimpleDeclaratorNode.
	self simpleDeclarator notNil
		ifTrue: [ self simpleDeclarator parent: self ]
]
