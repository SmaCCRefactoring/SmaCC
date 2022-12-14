Class {
	#name : #ASTConstExpNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'orExpr'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTConstExpNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitConstExp: self
]

{ #category : #generated }
ASTConstExpNode >> nodeVariables [
	^ #(#orExpr)
]

{ #category : #generated }
ASTConstExpNode >> orExpr [
	^ orExpr
]

{ #category : #generated }
ASTConstExpNode >> orExpr: anASTOrExprNode [
	self orExpr notNil
		ifTrue: [ self orExpr parent: nil ].
	orExpr := anASTOrExprNode.
	self orExpr notNil
		ifTrue: [ self orExpr parent: self ]
]
