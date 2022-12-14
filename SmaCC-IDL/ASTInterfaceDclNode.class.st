Class {
	#name : #ASTInterfaceDclNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'interfaceHeader',
		'leftBraceToken',
		'interfaceBody',
		'rightBraceToken'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTInterfaceDclNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitInterfaceDcl: self
]

{ #category : #generated }
ASTInterfaceDclNode >> interfaceBody [
	^ interfaceBody
]

{ #category : #generated }
ASTInterfaceDclNode >> interfaceBody: anASTInterfaceBodyNode [
	self interfaceBody notNil
		ifTrue: [ self interfaceBody parent: nil ].
	interfaceBody := anASTInterfaceBodyNode.
	self interfaceBody notNil
		ifTrue: [ self interfaceBody parent: self ]
]

{ #category : #generated }
ASTInterfaceDclNode >> interfaceHeader [
	^ interfaceHeader
]

{ #category : #generated }
ASTInterfaceDclNode >> interfaceHeader: anASTInterfaceHeaderNode [
	self interfaceHeader notNil
		ifTrue: [ self interfaceHeader parent: nil ].
	interfaceHeader := anASTInterfaceHeaderNode.
	self interfaceHeader notNil
		ifTrue: [ self interfaceHeader parent: self ]
]

{ #category : #generated }
ASTInterfaceDclNode >> leftBraceToken [
	^ leftBraceToken
]

{ #category : #generated }
ASTInterfaceDclNode >> leftBraceToken: aSmaCCToken [
	leftBraceToken := aSmaCCToken
]

{ #category : #generated }
ASTInterfaceDclNode >> nodeVariables [
	^ #(#interfaceHeader #interfaceBody)
]

{ #category : #generated }
ASTInterfaceDclNode >> rightBraceToken [
	^ rightBraceToken
]

{ #category : #generated }
ASTInterfaceDclNode >> rightBraceToken: aSmaCCToken [
	rightBraceToken := aSmaCCToken
]

{ #category : #generated }
ASTInterfaceDclNode >> tokenVariables [
	^ #(#leftBraceToken #rightBraceToken)
]
