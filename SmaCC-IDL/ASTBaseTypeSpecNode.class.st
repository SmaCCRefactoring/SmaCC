Class {
	#name : #ASTBaseTypeSpecNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'floatingPtType',
		'integerType',
		'charType',
		'booleanType',
		'octetType',
		'anyType'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTBaseTypeSpecNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitBaseTypeSpec: self
]

{ #category : #generated }
ASTBaseTypeSpecNode >> anyType [
	^ anyType
]

{ #category : #generated }
ASTBaseTypeSpecNode >> anyType: anASTAnyTypeNode [
	self anyType notNil
		ifTrue: [ self anyType parent: nil ].
	anyType := anASTAnyTypeNode.
	self anyType notNil
		ifTrue: [ self anyType parent: self ]
]

{ #category : #generated }
ASTBaseTypeSpecNode >> booleanType [
	^ booleanType
]

{ #category : #generated }
ASTBaseTypeSpecNode >> booleanType: anASTBooleanTypeNode [
	self booleanType notNil
		ifTrue: [ self booleanType parent: nil ].
	booleanType := anASTBooleanTypeNode.
	self booleanType notNil
		ifTrue: [ self booleanType parent: self ]
]

{ #category : #generated }
ASTBaseTypeSpecNode >> charType [
	^ charType
]

{ #category : #generated }
ASTBaseTypeSpecNode >> charType: anASTCharTypeNode [
	self charType notNil
		ifTrue: [ self charType parent: nil ].
	charType := anASTCharTypeNode.
	self charType notNil
		ifTrue: [ self charType parent: self ]
]

{ #category : #generated }
ASTBaseTypeSpecNode >> floatingPtType [
	^ floatingPtType
]

{ #category : #generated }
ASTBaseTypeSpecNode >> floatingPtType: anASTFloatingPtTypeNode [
	self floatingPtType notNil
		ifTrue: [ self floatingPtType parent: nil ].
	floatingPtType := anASTFloatingPtTypeNode.
	self floatingPtType notNil
		ifTrue: [ self floatingPtType parent: self ]
]

{ #category : #generated }
ASTBaseTypeSpecNode >> integerType [
	^ integerType
]

{ #category : #generated }
ASTBaseTypeSpecNode >> integerType: anASTIntegerTypeNode [
	self integerType notNil
		ifTrue: [ self integerType parent: nil ].
	integerType := anASTIntegerTypeNode.
	self integerType notNil
		ifTrue: [ self integerType parent: self ]
]

{ #category : #generated }
ASTBaseTypeSpecNode >> nodeVariables [
	^ #(#floatingPtType #integerType #charType #booleanType #octetType #anyType)
]

{ #category : #generated }
ASTBaseTypeSpecNode >> octetType [
	^ octetType
]

{ #category : #generated }
ASTBaseTypeSpecNode >> octetType: anASTOctetTypeNode [
	self octetType notNil
		ifTrue: [ self octetType parent: nil ].
	octetType := anASTOctetTypeNode.
	self octetType notNil
		ifTrue: [ self octetType parent: self ]
]
