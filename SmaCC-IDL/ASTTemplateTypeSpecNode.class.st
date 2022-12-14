Class {
	#name : #ASTTemplateTypeSpecNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'sequenceType',
		'stringType'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTTemplateTypeSpecNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitTemplateTypeSpec: self
]

{ #category : #generated }
ASTTemplateTypeSpecNode >> nodeVariables [
	^ #(#sequenceType #stringType)
]

{ #category : #generated }
ASTTemplateTypeSpecNode >> sequenceType [
	^ sequenceType
]

{ #category : #generated }
ASTTemplateTypeSpecNode >> sequenceType: anASTSequenceTypeNode [
	self sequenceType notNil
		ifTrue: [ self sequenceType parent: nil ].
	sequenceType := anASTSequenceTypeNode.
	self sequenceType notNil
		ifTrue: [ self sequenceType parent: self ]
]

{ #category : #generated }
ASTTemplateTypeSpecNode >> stringType [
	^ stringType
]

{ #category : #generated }
ASTTemplateTypeSpecNode >> stringType: anASTStringTypeNode [
	self stringType notNil
		ifTrue: [ self stringType parent: nil ].
	stringType := anASTStringTypeNode.
	self stringType notNil
		ifTrue: [ self stringType parent: self ]
]
