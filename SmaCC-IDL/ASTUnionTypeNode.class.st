Class {
	#name : #ASTUnionTypeNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'unionToken',
		'id',
		'switchToken',
		'leftParenToken',
		'switchTypeSpec',
		'rightParenToken',
		'leftBraceToken',
		'switchBody',
		'rightBraceToken'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTUnionTypeNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitUnionType: self
]

{ #category : #generated }
ASTUnionTypeNode >> id [
	^ id
]

{ #category : #generated }
ASTUnionTypeNode >> id: aSmaCCToken [
	id := aSmaCCToken
]

{ #category : #generated }
ASTUnionTypeNode >> leftBraceToken [
	^ leftBraceToken
]

{ #category : #generated }
ASTUnionTypeNode >> leftBraceToken: aSmaCCToken [
	leftBraceToken := aSmaCCToken
]

{ #category : #generated }
ASTUnionTypeNode >> leftParenToken [
	^ leftParenToken
]

{ #category : #generated }
ASTUnionTypeNode >> leftParenToken: aSmaCCToken [
	leftParenToken := aSmaCCToken
]

{ #category : #generated }
ASTUnionTypeNode >> nodeVariables [
	^ #(#switchTypeSpec #switchBody)
]

{ #category : #generated }
ASTUnionTypeNode >> rightBraceToken [
	^ rightBraceToken
]

{ #category : #generated }
ASTUnionTypeNode >> rightBraceToken: aSmaCCToken [
	rightBraceToken := aSmaCCToken
]

{ #category : #generated }
ASTUnionTypeNode >> rightParenToken [
	^ rightParenToken
]

{ #category : #generated }
ASTUnionTypeNode >> rightParenToken: aSmaCCToken [
	rightParenToken := aSmaCCToken
]

{ #category : #generated }
ASTUnionTypeNode >> switchBody [
	^ switchBody
]

{ #category : #generated }
ASTUnionTypeNode >> switchBody: anASTSwitchBodyNode [
	self switchBody notNil
		ifTrue: [ self switchBody parent: nil ].
	switchBody := anASTSwitchBodyNode.
	self switchBody notNil
		ifTrue: [ self switchBody parent: self ]
]

{ #category : #generated }
ASTUnionTypeNode >> switchToken [
	^ switchToken
]

{ #category : #generated }
ASTUnionTypeNode >> switchToken: aSmaCCToken [
	switchToken := aSmaCCToken
]

{ #category : #generated }
ASTUnionTypeNode >> switchTypeSpec [
	^ switchTypeSpec
]

{ #category : #generated }
ASTUnionTypeNode >> switchTypeSpec: anASTSwitchTypeSpecNode [
	self switchTypeSpec notNil
		ifTrue: [ self switchTypeSpec parent: nil ].
	switchTypeSpec := anASTSwitchTypeSpecNode.
	self switchTypeSpec notNil
		ifTrue: [ self switchTypeSpec parent: self ]
]

{ #category : #generated }
ASTUnionTypeNode >> tokenVariables [
	^ #(#unionToken #id #switchToken #leftParenToken #rightParenToken #leftBraceToken #rightBraceToken)
]

{ #category : #generated }
ASTUnionTypeNode >> unionToken [
	^ unionToken
]

{ #category : #generated }
ASTUnionTypeNode >> unionToken: aSmaCCToken [
	unionToken := aSmaCCToken
]
