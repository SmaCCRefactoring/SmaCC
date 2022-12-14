Class {
	#name : #ASTInterfaceHeaderNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'interfaceToken',
		'id',
		'inheritanceSpec'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTInterfaceHeaderNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitInterfaceHeader: self
]

{ #category : #generated }
ASTInterfaceHeaderNode >> id [
	^ id
]

{ #category : #generated }
ASTInterfaceHeaderNode >> id: aSmaCCToken [
	id := aSmaCCToken
]

{ #category : #generated }
ASTInterfaceHeaderNode >> inheritanceSpec [
	^ inheritanceSpec
]

{ #category : #generated }
ASTInterfaceHeaderNode >> inheritanceSpec: anASTInheritanceSpecNode [
	self inheritanceSpec notNil
		ifTrue: [ self inheritanceSpec parent: nil ].
	inheritanceSpec := anASTInheritanceSpecNode.
	self inheritanceSpec notNil
		ifTrue: [ self inheritanceSpec parent: self ]
]

{ #category : #generated }
ASTInterfaceHeaderNode >> interfaceToken [
	^ interfaceToken
]

{ #category : #generated }
ASTInterfaceHeaderNode >> interfaceToken: aSmaCCToken [
	interfaceToken := aSmaCCToken
]

{ #category : #generated }
ASTInterfaceHeaderNode >> nodeVariables [
	^ #(#inheritanceSpec)
]

{ #category : #generated }
ASTInterfaceHeaderNode >> tokenVariables [
	^ #(#interfaceToken #id)
]
