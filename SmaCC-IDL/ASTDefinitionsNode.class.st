Class {
	#name : #ASTDefinitionsNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'definition',
		'definitions'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTDefinitionsNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitDefinitions: self
]

{ #category : #generated }
ASTDefinitionsNode >> definition [
	^ definition
]

{ #category : #generated }
ASTDefinitionsNode >> definition: anASTDefinitionNode [
	self definition notNil
		ifTrue: [ self definition parent: nil ].
	definition := anASTDefinitionNode.
	self definition notNil
		ifTrue: [ self definition parent: self ]
]

{ #category : #generated }
ASTDefinitionsNode >> definitions [
	^ definitions
]

{ #category : #generated }
ASTDefinitionsNode >> definitions: anASTDefinitionsNode [
	self definitions notNil
		ifTrue: [ self definitions parent: nil ].
	definitions := anASTDefinitionsNode.
	self definitions notNil
		ifTrue: [ self definitions parent: self ]
]

{ #category : #generated }
ASTDefinitionsNode >> nodeVariables [
	^ #(#definition #definitions)
]
