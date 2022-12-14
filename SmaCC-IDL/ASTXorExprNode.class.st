Class {
	#name : #ASTXorExprNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'andExpr',
		'xorExpr',
		'upArrowToken'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTXorExprNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitXorExpr: self
]

{ #category : #generated }
ASTXorExprNode >> andExpr [
	^ andExpr
]

{ #category : #generated }
ASTXorExprNode >> andExpr: anASTAndExprNode [
	self andExpr notNil
		ifTrue: [ self andExpr parent: nil ].
	andExpr := anASTAndExprNode.
	self andExpr notNil
		ifTrue: [ self andExpr parent: self ]
]

{ #category : #generated }
ASTXorExprNode >> nodeVariables [
	^ #(#andExpr #xorExpr)
]

{ #category : #generated }
ASTXorExprNode >> tokenVariables [
	^ #(#upArrowToken)
]

{ #category : #generated }
ASTXorExprNode >> upArrowToken [
	^ upArrowToken
]

{ #category : #generated }
ASTXorExprNode >> upArrowToken: aSmaCCToken [
	upArrowToken := aSmaCCToken
]

{ #category : #generated }
ASTXorExprNode >> xorExpr [
	^ xorExpr
]

{ #category : #generated }
ASTXorExprNode >> xorExpr: anASTXorExprNode [
	self xorExpr notNil
		ifTrue: [ self xorExpr parent: nil ].
	xorExpr := anASTXorExprNode.
	self xorExpr notNil
		ifTrue: [ self xorExpr parent: self ]
]
