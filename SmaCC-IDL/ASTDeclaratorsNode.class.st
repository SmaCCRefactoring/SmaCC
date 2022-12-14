Class {
	#name : #ASTDeclaratorsNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'declarator',
		'declarators',
		'commaToken'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTDeclaratorsNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitDeclarators: self
]

{ #category : #generated }
ASTDeclaratorsNode >> commaToken [
	^ commaToken
]

{ #category : #generated }
ASTDeclaratorsNode >> commaToken: aSmaCCToken [
	commaToken := aSmaCCToken
]

{ #category : #generated }
ASTDeclaratorsNode >> declarator [
	^ declarator
]

{ #category : #generated }
ASTDeclaratorsNode >> declarator: anASTDeclaratorNode [
	self declarator notNil
		ifTrue: [ self declarator parent: nil ].
	declarator := anASTDeclaratorNode.
	self declarator notNil
		ifTrue: [ self declarator parent: self ]
]

{ #category : #generated }
ASTDeclaratorsNode >> declarators [
	^ declarators
]

{ #category : #generated }
ASTDeclaratorsNode >> declarators: anASTDeclaratorsNode [
	self declarators notNil
		ifTrue: [ self declarators parent: nil ].
	declarators := anASTDeclaratorsNode.
	self declarators notNil
		ifTrue: [ self declarators parent: self ]
]

{ #category : #generated }
ASTDeclaratorsNode >> nodeVariables [
	^ #(#declarator #declarators)
]

{ #category : #generated }
ASTDeclaratorsNode >> tokenVariables [
	^ #(#commaToken)
]
