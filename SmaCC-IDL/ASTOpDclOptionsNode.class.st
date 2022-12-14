Class {
	#name : #ASTOpDclOptionsNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'raisesExpr',
		'contextExpr'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTOpDclOptionsNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitOpDclOptions: self
]

{ #category : #generated }
ASTOpDclOptionsNode >> contextExpr [
	^ contextExpr
]

{ #category : #generated }
ASTOpDclOptionsNode >> contextExpr: anASTContextExprNode [
	self contextExpr notNil
		ifTrue: [ self contextExpr parent: nil ].
	contextExpr := anASTContextExprNode.
	self contextExpr notNil
		ifTrue: [ self contextExpr parent: self ]
]

{ #category : #generated }
ASTOpDclOptionsNode >> nodeVariables [
	^ #(#raisesExpr #contextExpr)
]

{ #category : #generated }
ASTOpDclOptionsNode >> raisesExpr [
	^ raisesExpr
]

{ #category : #generated }
ASTOpDclOptionsNode >> raisesExpr: anASTRaisesExprNode [
	self raisesExpr notNil
		ifTrue: [ self raisesExpr parent: nil ].
	raisesExpr := anASTRaisesExprNode.
	self raisesExpr notNil
		ifTrue: [ self raisesExpr parent: self ]
]
