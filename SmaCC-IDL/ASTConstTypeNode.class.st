Class {
	#name : #ASTConstTypeNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'integerType',
		'charType',
		'booleanType',
		'floatingPtType',
		'stringType',
		'scopedName'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTConstTypeNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitConstType: self
]

{ #category : #generated }
ASTConstTypeNode >> booleanType [
	^ booleanType
]

{ #category : #generated }
ASTConstTypeNode >> booleanType: anASTBooleanTypeNode [
	self booleanType notNil
		ifTrue: [ self booleanType parent: nil ].
	booleanType := anASTBooleanTypeNode.
	self booleanType notNil
		ifTrue: [ self booleanType parent: self ]
]

{ #category : #generated }
ASTConstTypeNode >> charType [
	^ charType
]

{ #category : #generated }
ASTConstTypeNode >> charType: anASTCharTypeNode [
	self charType notNil
		ifTrue: [ self charType parent: nil ].
	charType := anASTCharTypeNode.
	self charType notNil
		ifTrue: [ self charType parent: self ]
]

{ #category : #generated }
ASTConstTypeNode >> floatingPtType [
	^ floatingPtType
]

{ #category : #generated }
ASTConstTypeNode >> floatingPtType: anASTFloatingPtTypeNode [
	self floatingPtType notNil
		ifTrue: [ self floatingPtType parent: nil ].
	floatingPtType := anASTFloatingPtTypeNode.
	self floatingPtType notNil
		ifTrue: [ self floatingPtType parent: self ]
]

{ #category : #generated }
ASTConstTypeNode >> integerType [
	^ integerType
]

{ #category : #generated }
ASTConstTypeNode >> integerType: anASTIntegerTypeNode [
	self integerType notNil
		ifTrue: [ self integerType parent: nil ].
	integerType := anASTIntegerTypeNode.
	self integerType notNil
		ifTrue: [ self integerType parent: self ]
]

{ #category : #generated }
ASTConstTypeNode >> nodeVariables [
	^ #(#integerType #charType #booleanType #floatingPtType #stringType #scopedName)
]

{ #category : #generated }
ASTConstTypeNode >> scopedName [
	^ scopedName
]

{ #category : #generated }
ASTConstTypeNode >> scopedName: anASTScopedNameNode [
	self scopedName notNil
		ifTrue: [ self scopedName parent: nil ].
	scopedName := anASTScopedNameNode.
	self scopedName notNil
		ifTrue: [ self scopedName parent: self ]
]

{ #category : #generated }
ASTConstTypeNode >> stringType [
	^ stringType
]

{ #category : #generated }
ASTConstTypeNode >> stringType: anASTStringTypeNode [
	self stringType notNil
		ifTrue: [ self stringType parent: nil ].
	stringType := anASTStringTypeNode.
	self stringType notNil
		ifTrue: [ self stringType parent: self ]
]
