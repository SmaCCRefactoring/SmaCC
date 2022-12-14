Class {
	#name : #ASTInterfaceNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'interfaceDcl',
		'forwardDcl'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTInterfaceNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitInterface: self
]

{ #category : #generated }
ASTInterfaceNode >> forwardDcl [
	^ forwardDcl
]

{ #category : #generated }
ASTInterfaceNode >> forwardDcl: anASTForwardDclNode [
	self forwardDcl notNil
		ifTrue: [ self forwardDcl parent: nil ].
	forwardDcl := anASTForwardDclNode.
	self forwardDcl notNil
		ifTrue: [ self forwardDcl parent: self ]
]

{ #category : #generated }
ASTInterfaceNode >> interfaceDcl [
	^ interfaceDcl
]

{ #category : #generated }
ASTInterfaceNode >> interfaceDcl: anASTInterfaceDclNode [
	self interfaceDcl notNil
		ifTrue: [ self interfaceDcl parent: nil ].
	interfaceDcl := anASTInterfaceDclNode.
	self interfaceDcl notNil
		ifTrue: [ self interfaceDcl parent: self ]
]

{ #category : #generated }
ASTInterfaceNode >> nodeVariables [
	^ #(#interfaceDcl #forwardDcl)
]
