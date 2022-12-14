Class {
	#name : #ASTFixedArraySizesNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'fixedArraySize',
		'fixedArraySizes'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTFixedArraySizesNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitFixedArraySizes: self
]

{ #category : #generated }
ASTFixedArraySizesNode >> fixedArraySize [
	^ fixedArraySize
]

{ #category : #generated }
ASTFixedArraySizesNode >> fixedArraySize: anASTFixedArraySizeNode [
	self fixedArraySize notNil
		ifTrue: [ self fixedArraySize parent: nil ].
	fixedArraySize := anASTFixedArraySizeNode.
	self fixedArraySize notNil
		ifTrue: [ self fixedArraySize parent: self ]
]

{ #category : #generated }
ASTFixedArraySizesNode >> fixedArraySizes [
	^ fixedArraySizes
]

{ #category : #generated }
ASTFixedArraySizesNode >> fixedArraySizes: anASTFixedArraySizesNode [
	self fixedArraySizes notNil
		ifTrue: [ self fixedArraySizes parent: nil ].
	fixedArraySizes := anASTFixedArraySizesNode.
	self fixedArraySizes notNil
		ifTrue: [ self fixedArraySizes parent: self ]
]

{ #category : #generated }
ASTFixedArraySizesNode >> nodeVariables [
	^ #(#fixedArraySize #fixedArraySizes)
]
