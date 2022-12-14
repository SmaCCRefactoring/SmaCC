Class {
	#name : #ASTOpDclNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'opTypeSpec',
		'id',
		'parameterDcls',
		'opDclOptions',
		'opAttribute'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTOpDclNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitOpDcl: self
]

{ #category : #generated }
ASTOpDclNode >> id [
	^ id
]

{ #category : #generated }
ASTOpDclNode >> id: aSmaCCToken [
	id := aSmaCCToken
]

{ #category : #generated }
ASTOpDclNode >> nodeVariables [
	^ #(#opTypeSpec #parameterDcls #opDclOptions #opAttribute)
]

{ #category : #generated }
ASTOpDclNode >> opAttribute [
	^ opAttribute
]

{ #category : #generated }
ASTOpDclNode >> opAttribute: anASTOpAttributeNode [
	self opAttribute notNil
		ifTrue: [ self opAttribute parent: nil ].
	opAttribute := anASTOpAttributeNode.
	self opAttribute notNil
		ifTrue: [ self opAttribute parent: self ]
]

{ #category : #generated }
ASTOpDclNode >> opDclOptions [
	^ opDclOptions
]

{ #category : #generated }
ASTOpDclNode >> opDclOptions: anASTOpDclOptionsNode [
	self opDclOptions notNil
		ifTrue: [ self opDclOptions parent: nil ].
	opDclOptions := anASTOpDclOptionsNode.
	self opDclOptions notNil
		ifTrue: [ self opDclOptions parent: self ]
]

{ #category : #generated }
ASTOpDclNode >> opTypeSpec [
	^ opTypeSpec
]

{ #category : #generated }
ASTOpDclNode >> opTypeSpec: anASTOpTypeSpecNode [
	self opTypeSpec notNil
		ifTrue: [ self opTypeSpec parent: nil ].
	opTypeSpec := anASTOpTypeSpecNode.
	self opTypeSpec notNil
		ifTrue: [ self opTypeSpec parent: self ]
]

{ #category : #generated }
ASTOpDclNode >> parameterDcls [
	^ parameterDcls
]

{ #category : #generated }
ASTOpDclNode >> parameterDcls: anASTParameterDclsNode [
	self parameterDcls notNil
		ifTrue: [ self parameterDcls parent: nil ].
	parameterDcls := anASTParameterDclsNode.
	self parameterDcls notNil
		ifTrue: [ self parameterDcls parent: self ]
]

{ #category : #generated }
ASTOpDclNode >> tokenVariables [
	^ #(#id)
]
