Class {
	#name : #ASTParamDclsNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'paramDcl',
		'paramDcls',
		'commaToken'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTParamDclsNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitParamDcls: self
]

{ #category : #generated }
ASTParamDclsNode >> commaToken [
	^ commaToken
]

{ #category : #generated }
ASTParamDclsNode >> commaToken: aSmaCCToken [
	commaToken := aSmaCCToken
]

{ #category : #generated }
ASTParamDclsNode >> nodeVariables [
	^ #(#paramDcl #paramDcls)
]

{ #category : #generated }
ASTParamDclsNode >> paramDcl [
	^ paramDcl
]

{ #category : #generated }
ASTParamDclsNode >> paramDcl: anASTParamDclNode [
	self paramDcl notNil
		ifTrue: [ self paramDcl parent: nil ].
	paramDcl := anASTParamDclNode.
	self paramDcl notNil
		ifTrue: [ self paramDcl parent: self ]
]

{ #category : #generated }
ASTParamDclsNode >> paramDcls [
	^ paramDcls
]

{ #category : #generated }
ASTParamDclsNode >> paramDcls: anASTParamDclsNode [
	self paramDcls notNil
		ifTrue: [ self paramDcls parent: nil ].
	paramDcls := anASTParamDclsNode.
	self paramDcls notNil
		ifTrue: [ self paramDcls parent: self ]
]

{ #category : #generated }
ASTParamDclsNode >> tokenVariables [
	^ #(#commaToken)
]
