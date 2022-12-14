Class {
	#name : #ASTAddExprNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'multExpr',
		'addExpr',
		'plusToken',
		'minusToken'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTAddExprNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitAddExpr: self
]

{ #category : #generated }
ASTAddExprNode >> addExpr [
	^ addExpr
]

{ #category : #generated }
ASTAddExprNode >> addExpr: anASTAddExprNode [
	self addExpr notNil
		ifTrue: [ self addExpr parent: nil ].
	addExpr := anASTAddExprNode.
	self addExpr notNil
		ifTrue: [ self addExpr parent: self ]
]

{ #category : #generated }
ASTAddExprNode >> minusToken [
	^ minusToken
]

{ #category : #generated }
ASTAddExprNode >> minusToken: aSmaCCToken [
	minusToken := aSmaCCToken
]

{ #category : #generated }
ASTAddExprNode >> multExpr [
	^ multExpr
]

{ #category : #generated }
ASTAddExprNode >> multExpr: anASTMultExprNode [
	self multExpr notNil
		ifTrue: [ self multExpr parent: nil ].
	multExpr := anASTMultExprNode.
	self multExpr notNil
		ifTrue: [ self multExpr parent: self ]
]

{ #category : #generated }
ASTAddExprNode >> nodeVariables [
	^ #(#multExpr #addExpr)
]

{ #category : #generated }
ASTAddExprNode >> plusToken [
	^ plusToken
]

{ #category : #generated }
ASTAddExprNode >> plusToken: aSmaCCToken [
	plusToken := aSmaCCToken
]

{ #category : #generated }
ASTAddExprNode >> tokenVariables [
	^ #(#plusToken #minusToken)
]
