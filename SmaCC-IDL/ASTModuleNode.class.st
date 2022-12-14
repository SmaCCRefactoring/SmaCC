Class {
	#name : #ASTModuleNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'moduleToken',
		'id',
		'leftBraceToken',
		'definitions',
		'rightBraceToken'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTModuleNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitModule: self
]

{ #category : #generated }
ASTModuleNode >> definitions [
	^ definitions
]

{ #category : #generated }
ASTModuleNode >> definitions: anASTDefinitionsNode [
	self definitions notNil
		ifTrue: [ self definitions parent: nil ].
	definitions := anASTDefinitionsNode.
	self definitions notNil
		ifTrue: [ self definitions parent: self ]
]

{ #category : #generated }
ASTModuleNode >> id [
	^ id
]

{ #category : #generated }
ASTModuleNode >> id: aSmaCCToken [
	id := aSmaCCToken
]

{ #category : #generated }
ASTModuleNode >> leftBraceToken [
	^ leftBraceToken
]

{ #category : #generated }
ASTModuleNode >> leftBraceToken: aSmaCCToken [
	leftBraceToken := aSmaCCToken
]

{ #category : #generated }
ASTModuleNode >> moduleToken [
	^ moduleToken
]

{ #category : #generated }
ASTModuleNode >> moduleToken: aSmaCCToken [
	moduleToken := aSmaCCToken
]

{ #category : #generated }
ASTModuleNode >> nodeVariables [
	^ #(#definitions)
]

{ #category : #generated }
ASTModuleNode >> rightBraceToken [
	^ rightBraceToken
]

{ #category : #generated }
ASTModuleNode >> rightBraceToken: aSmaCCToken [
	rightBraceToken := aSmaCCToken
]

{ #category : #generated }
ASTModuleNode >> tokenVariables [
	^ #(#moduleToken #id #leftBraceToken #rightBraceToken)
]
