Class {
	#name : #ASTUnsignedIntNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'unsignedLongInt',
		'unsignedShortInt'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTUnsignedIntNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitUnsignedInt: self
]

{ #category : #generated }
ASTUnsignedIntNode >> nodeVariables [
	^ #(#unsignedLongInt #unsignedShortInt)
]

{ #category : #generated }
ASTUnsignedIntNode >> unsignedLongInt [
	^ unsignedLongInt
]

{ #category : #generated }
ASTUnsignedIntNode >> unsignedLongInt: anASTUnsignedLongIntNode [
	self unsignedLongInt notNil
		ifTrue: [ self unsignedLongInt parent: nil ].
	unsignedLongInt := anASTUnsignedLongIntNode.
	self unsignedLongInt notNil
		ifTrue: [ self unsignedLongInt parent: self ]
]

{ #category : #generated }
ASTUnsignedIntNode >> unsignedShortInt [
	^ unsignedShortInt
]

{ #category : #generated }
ASTUnsignedIntNode >> unsignedShortInt: anASTUnsignedShortIntNode [
	self unsignedShortInt notNil
		ifTrue: [ self unsignedShortInt parent: nil ].
	unsignedShortInt := anASTUnsignedShortIntNode.
	self unsignedShortInt notNil
		ifTrue: [ self unsignedShortInt parent: self ]
]
