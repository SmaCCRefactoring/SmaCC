Class {
	#name : #ASTInterfaceBodyNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'export',
		'interfaceBody'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTInterfaceBodyNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitInterfaceBody: self
]

{ #category : #generated }
ASTInterfaceBodyNode >> export [
	^ export
]

{ #category : #generated }
ASTInterfaceBodyNode >> export: anASTExportNode [
	self export notNil
		ifTrue: [ self export parent: nil ].
	export := anASTExportNode.
	self export notNil
		ifTrue: [ self export parent: self ]
]

{ #category : #generated }
ASTInterfaceBodyNode >> interfaceBody [
	^ interfaceBody
]

{ #category : #generated }
ASTInterfaceBodyNode >> interfaceBody: anASTInterfaceBodyNode [
	self interfaceBody notNil
		ifTrue: [ self interfaceBody parent: nil ].
	interfaceBody := anASTInterfaceBodyNode.
	self interfaceBody notNil
		ifTrue: [ self interfaceBody parent: self ]
]

{ #category : #generated }
ASTInterfaceBodyNode >> nodeVariables [
	^ #(#export #interfaceBody)
]
