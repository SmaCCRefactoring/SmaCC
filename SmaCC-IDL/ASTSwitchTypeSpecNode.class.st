Class {
	#name : #ASTSwitchTypeSpecNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'integerType',
		'charType',
		'booleanType',
		'enumType',
		'scopedName'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTSwitchTypeSpecNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitSwitchTypeSpec: self
]

{ #category : #generated }
ASTSwitchTypeSpecNode >> booleanType [
	^ booleanType
]

{ #category : #generated }
ASTSwitchTypeSpecNode >> booleanType: anASTBooleanTypeNode [
	self booleanType notNil
		ifTrue: [ self booleanType parent: nil ].
	booleanType := anASTBooleanTypeNode.
	self booleanType notNil
		ifTrue: [ self booleanType parent: self ]
]

{ #category : #generated }
ASTSwitchTypeSpecNode >> charType [
	^ charType
]

{ #category : #generated }
ASTSwitchTypeSpecNode >> charType: anASTCharTypeNode [
	self charType notNil
		ifTrue: [ self charType parent: nil ].
	charType := anASTCharTypeNode.
	self charType notNil
		ifTrue: [ self charType parent: self ]
]

{ #category : #generated }
ASTSwitchTypeSpecNode >> enumType [
	^ enumType
]

{ #category : #generated }
ASTSwitchTypeSpecNode >> enumType: anASTEnumTypeNode [
	self enumType notNil
		ifTrue: [ self enumType parent: nil ].
	enumType := anASTEnumTypeNode.
	self enumType notNil
		ifTrue: [ self enumType parent: self ]
]

{ #category : #generated }
ASTSwitchTypeSpecNode >> integerType [
	^ integerType
]

{ #category : #generated }
ASTSwitchTypeSpecNode >> integerType: anASTIntegerTypeNode [
	self integerType notNil
		ifTrue: [ self integerType parent: nil ].
	integerType := anASTIntegerTypeNode.
	self integerType notNil
		ifTrue: [ self integerType parent: self ]
]

{ #category : #generated }
ASTSwitchTypeSpecNode >> nodeVariables [
	^ #(#integerType #charType #booleanType #enumType #scopedName)
]

{ #category : #generated }
ASTSwitchTypeSpecNode >> scopedName [
	^ scopedName
]

{ #category : #generated }
ASTSwitchTypeSpecNode >> scopedName: anASTScopedNameNode [
	self scopedName notNil
		ifTrue: [ self scopedName parent: nil ].
	scopedName := anASTScopedNameNode.
	self scopedName notNil
		ifTrue: [ self scopedName parent: self ]
]
