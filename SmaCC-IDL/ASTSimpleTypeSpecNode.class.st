Class {
	#name : #ASTSimpleTypeSpecNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'baseTypeSpec',
		'templateTypeSpec',
		'scopedName'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTSimpleTypeSpecNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitSimpleTypeSpec: self
]

{ #category : #generated }
ASTSimpleTypeSpecNode >> baseTypeSpec [
	^ baseTypeSpec
]

{ #category : #generated }
ASTSimpleTypeSpecNode >> baseTypeSpec: anASTBaseTypeSpecNode [
	self baseTypeSpec notNil
		ifTrue: [ self baseTypeSpec parent: nil ].
	baseTypeSpec := anASTBaseTypeSpecNode.
	self baseTypeSpec notNil
		ifTrue: [ self baseTypeSpec parent: self ]
]

{ #category : #generated }
ASTSimpleTypeSpecNode >> nodeVariables [
	^ #(#baseTypeSpec #templateTypeSpec #scopedName)
]

{ #category : #generated }
ASTSimpleTypeSpecNode >> scopedName [
	^ scopedName
]

{ #category : #generated }
ASTSimpleTypeSpecNode >> scopedName: anASTScopedNameNode [
	self scopedName notNil
		ifTrue: [ self scopedName parent: nil ].
	scopedName := anASTScopedNameNode.
	self scopedName notNil
		ifTrue: [ self scopedName parent: self ]
]

{ #category : #generated }
ASTSimpleTypeSpecNode >> templateTypeSpec [
	^ templateTypeSpec
]

{ #category : #generated }
ASTSimpleTypeSpecNode >> templateTypeSpec: anASTTemplateTypeSpecNode [
	self templateTypeSpec notNil
		ifTrue: [ self templateTypeSpec parent: nil ].
	templateTypeSpec := anASTTemplateTypeSpecNode.
	self templateTypeSpec notNil
		ifTrue: [ self templateTypeSpec parent: self ]
]
