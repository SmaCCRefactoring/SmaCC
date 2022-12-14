Class {
	#name : #ASTArrayDeclaratorNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'id',
		'fixedArraySizes'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTArrayDeclaratorNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitArrayDeclarator: self
]

{ #category : #generated }
ASTArrayDeclaratorNode >> fixedArraySizes [
	^ fixedArraySizes
]

{ #category : #generated }
ASTArrayDeclaratorNode >> fixedArraySizes: anASTFixedArraySizesNode [
	self fixedArraySizes notNil
		ifTrue: [ self fixedArraySizes parent: nil ].
	fixedArraySizes := anASTFixedArraySizesNode.
	self fixedArraySizes notNil
		ifTrue: [ self fixedArraySizes parent: self ]
]

{ #category : #generated }
ASTArrayDeclaratorNode >> id [
	^ id
]

{ #category : #generated }
ASTArrayDeclaratorNode >> id: aSmaCCToken [
	id := aSmaCCToken
]

{ #category : #generated }
ASTArrayDeclaratorNode >> nodeVariables [
	^ #(#fixedArraySizes)
]

{ #category : #generated }
ASTArrayDeclaratorNode >> tokenVariables [
	^ #(#id)
]
