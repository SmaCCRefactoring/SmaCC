Class {
	#name : #ASTUnaryExprNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'unaryOperator',
		'primaryExpr'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTUnaryExprNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitUnaryExpr: self
]

{ #category : #generated }
ASTUnaryExprNode >> nodeVariables [
	^ #(#unaryOperator #primaryExpr)
]

{ #category : #generated }
ASTUnaryExprNode >> primaryExpr [
	^ primaryExpr
]

{ #category : #generated }
ASTUnaryExprNode >> primaryExpr: anASTPrimaryExprNode [
	self primaryExpr notNil
		ifTrue: [ self primaryExpr parent: nil ].
	primaryExpr := anASTPrimaryExprNode.
	self primaryExpr notNil
		ifTrue: [ self primaryExpr parent: self ]
]

{ #category : #generated }
ASTUnaryExprNode >> unaryOperator [
	^ unaryOperator
]

{ #category : #generated }
ASTUnaryExprNode >> unaryOperator: anASTUnaryOperatorNode [
	self unaryOperator notNil
		ifTrue: [ self unaryOperator parent: nil ].
	unaryOperator := anASTUnaryOperatorNode.
	self unaryOperator notNil
		ifTrue: [ self unaryOperator parent: self ]
]
