Class {
	#name : #ASTOrExprNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'xorExpr',
		'orExpr',
		'orToken'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTOrExprNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitOrExpr: self
]

{ #category : #generated }
ASTOrExprNode >> nodeVariables [
	^ #(#xorExpr #orExpr)
]

{ #category : #generated }
ASTOrExprNode >> orExpr [
	^ orExpr
]

{ #category : #generated }
ASTOrExprNode >> orExpr: anASTOrExprNode [
	self orExpr notNil
		ifTrue: [ self orExpr parent: nil ].
	orExpr := anASTOrExprNode.
	self orExpr notNil
		ifTrue: [ self orExpr parent: self ]
]

{ #category : #generated }
ASTOrExprNode >> orToken [
	^ orToken
]

{ #category : #generated }
ASTOrExprNode >> orToken: aSmaCCToken [
	orToken := aSmaCCToken
]

{ #category : #generated }
ASTOrExprNode >> tokenVariables [
	^ #(#orToken)
]

{ #category : #generated }
ASTOrExprNode >> xorExpr [
	^ xorExpr
]

{ #category : #generated }
ASTOrExprNode >> xorExpr: anASTXorExprNode [
	self xorExpr notNil
		ifTrue: [ self xorExpr parent: nil ].
	xorExpr := anASTXorExprNode.
	self xorExpr notNil
		ifTrue: [ self xorExpr parent: self ]
]
