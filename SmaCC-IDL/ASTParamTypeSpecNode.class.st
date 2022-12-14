Class {
	#name : #ASTParamTypeSpecNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'baseTypeSpec',
		'stringType',
		'scopedName'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTParamTypeSpecNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitParamTypeSpec: self
]

{ #category : #generated }
ASTParamTypeSpecNode >> baseTypeSpec [
	^ baseTypeSpec
]

{ #category : #generated }
ASTParamTypeSpecNode >> baseTypeSpec: anASTBaseTypeSpecNode [
	self baseTypeSpec notNil
		ifTrue: [ self baseTypeSpec parent: nil ].
	baseTypeSpec := anASTBaseTypeSpecNode.
	self baseTypeSpec notNil
		ifTrue: [ self baseTypeSpec parent: self ]
]

{ #category : #generated }
ASTParamTypeSpecNode >> nodeVariables [
	^ #(#baseTypeSpec #stringType #scopedName)
]

{ #category : #generated }
ASTParamTypeSpecNode >> scopedName [
	^ scopedName
]

{ #category : #generated }
ASTParamTypeSpecNode >> scopedName: anASTScopedNameNode [
	self scopedName notNil
		ifTrue: [ self scopedName parent: nil ].
	scopedName := anASTScopedNameNode.
	self scopedName notNil
		ifTrue: [ self scopedName parent: self ]
]

{ #category : #generated }
ASTParamTypeSpecNode >> stringType [
	^ stringType
]

{ #category : #generated }
ASTParamTypeSpecNode >> stringType: anASTStringTypeNode [
	self stringType notNil
		ifTrue: [ self stringType parent: nil ].
	stringType := anASTStringTypeNode.
	self stringType notNil
		ifTrue: [ self stringType parent: self ]
]
