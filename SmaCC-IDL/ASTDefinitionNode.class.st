Class {
	#name : #ASTDefinitionNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'typeDcl',
		'semicolonToken',
		'constDcl',
		'exceptDcl',
		'interface',
		'module'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTDefinitionNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitDefinition: self
]

{ #category : #generated }
ASTDefinitionNode >> constDcl [
	^ constDcl
]

{ #category : #generated }
ASTDefinitionNode >> constDcl: anASTConstDclNode [
	self constDcl notNil
		ifTrue: [ self constDcl parent: nil ].
	constDcl := anASTConstDclNode.
	self constDcl notNil
		ifTrue: [ self constDcl parent: self ]
]

{ #category : #generated }
ASTDefinitionNode >> exceptDcl [
	^ exceptDcl
]

{ #category : #generated }
ASTDefinitionNode >> exceptDcl: anASTExceptDclNode [
	self exceptDcl notNil
		ifTrue: [ self exceptDcl parent: nil ].
	exceptDcl := anASTExceptDclNode.
	self exceptDcl notNil
		ifTrue: [ self exceptDcl parent: self ]
]

{ #category : #generated }
ASTDefinitionNode >> interface [
	^ interface
]

{ #category : #generated }
ASTDefinitionNode >> interface: anASTInterfaceNode [
	self interface notNil
		ifTrue: [ self interface parent: nil ].
	interface := anASTInterfaceNode.
	self interface notNil
		ifTrue: [ self interface parent: self ]
]

{ #category : #generated }
ASTDefinitionNode >> module [
	^ module
]

{ #category : #generated }
ASTDefinitionNode >> module: anASTModuleNode [
	self module notNil
		ifTrue: [ self module parent: nil ].
	module := anASTModuleNode.
	self module notNil
		ifTrue: [ self module parent: self ]
]

{ #category : #generated }
ASTDefinitionNode >> nodeVariables [
	^ #(#typeDcl #constDcl #exceptDcl #interface #module)
]

{ #category : #generated }
ASTDefinitionNode >> semicolonToken [
	^ semicolonToken
]

{ #category : #generated }
ASTDefinitionNode >> semicolonToken: aSmaCCToken [
	semicolonToken := aSmaCCToken
]

{ #category : #generated }
ASTDefinitionNode >> tokenVariables [
	^ #(#semicolonToken)
]

{ #category : #generated }
ASTDefinitionNode >> typeDcl [
	^ typeDcl
]

{ #category : #generated }
ASTDefinitionNode >> typeDcl: anASTTypeDclNode [
	self typeDcl notNil
		ifTrue: [ self typeDcl parent: nil ].
	typeDcl := anASTTypeDclNode.
	self typeDcl notNil
		ifTrue: [ self typeDcl parent: self ]
]
