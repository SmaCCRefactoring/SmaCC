Class {
	#name : #ASTSimpleDeclaratorsNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'simpleDeclarator',
		'simpleDeclarators',
		'commaToken'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTSimpleDeclaratorsNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitSimpleDeclarators: self
]

{ #category : #generated }
ASTSimpleDeclaratorsNode >> commaToken [
	^ commaToken
]

{ #category : #generated }
ASTSimpleDeclaratorsNode >> commaToken: aSmaCCToken [
	commaToken := aSmaCCToken
]

{ #category : #generated }
ASTSimpleDeclaratorsNode >> nodeVariables [
	^ #(#simpleDeclarator #simpleDeclarators)
]

{ #category : #generated }
ASTSimpleDeclaratorsNode >> simpleDeclarator [
	^ simpleDeclarator
]

{ #category : #generated }
ASTSimpleDeclaratorsNode >> simpleDeclarator: anASTSimpleDeclaratorNode [
	self simpleDeclarator notNil
		ifTrue: [ self simpleDeclarator parent: nil ].
	simpleDeclarator := anASTSimpleDeclaratorNode.
	self simpleDeclarator notNil
		ifTrue: [ self simpleDeclarator parent: self ]
]

{ #category : #generated }
ASTSimpleDeclaratorsNode >> simpleDeclarators [
	^ simpleDeclarators
]

{ #category : #generated }
ASTSimpleDeclaratorsNode >> simpleDeclarators: anASTSimpleDeclaratorsNode [
	self simpleDeclarators notNil
		ifTrue: [ self simpleDeclarators parent: nil ].
	simpleDeclarators := anASTSimpleDeclaratorsNode.
	self simpleDeclarators notNil
		ifTrue: [ self simpleDeclarators parent: self ]
]

{ #category : #generated }
ASTSimpleDeclaratorsNode >> tokenVariables [
	^ #(#commaToken)
]
