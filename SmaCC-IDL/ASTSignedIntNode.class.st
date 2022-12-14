Class {
	#name : #ASTSignedIntNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'signedLongInt',
		'signedShortInt'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTSignedIntNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitSignedInt: self
]

{ #category : #generated }
ASTSignedIntNode >> nodeVariables [
	^ #(#signedLongInt #signedShortInt)
]

{ #category : #generated }
ASTSignedIntNode >> signedLongInt [
	^ signedLongInt
]

{ #category : #generated }
ASTSignedIntNode >> signedLongInt: anASTSignedLongIntNode [
	self signedLongInt notNil
		ifTrue: [ self signedLongInt parent: nil ].
	signedLongInt := anASTSignedLongIntNode.
	self signedLongInt notNil
		ifTrue: [ self signedLongInt parent: self ]
]

{ #category : #generated }
ASTSignedIntNode >> signedShortInt [
	^ signedShortInt
]

{ #category : #generated }
ASTSignedIntNode >> signedShortInt: anASTSignedShortIntNode [
	self signedShortInt notNil
		ifTrue: [ self signedShortInt parent: nil ].
	signedShortInt := anASTSignedShortIntNode.
	self signedShortInt notNil
		ifTrue: [ self signedShortInt parent: self ]
]
