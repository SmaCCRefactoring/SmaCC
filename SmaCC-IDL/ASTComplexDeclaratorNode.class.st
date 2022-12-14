Class {
	#name : #ASTComplexDeclaratorNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'arrayDeclarator'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTComplexDeclaratorNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitComplexDeclarator: self
]

{ #category : #generated }
ASTComplexDeclaratorNode >> arrayDeclarator [
	^ arrayDeclarator
]

{ #category : #generated }
ASTComplexDeclaratorNode >> arrayDeclarator: anASTArrayDeclaratorNode [
	self arrayDeclarator notNil
		ifTrue: [ self arrayDeclarator parent: nil ].
	arrayDeclarator := anASTArrayDeclaratorNode.
	self arrayDeclarator notNil
		ifTrue: [ self arrayDeclarator parent: self ]
]

{ #category : #generated }
ASTComplexDeclaratorNode >> nodeVariables [
	^ #(#arrayDeclarator)
]
