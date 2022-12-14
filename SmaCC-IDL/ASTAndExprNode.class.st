Class {
	#name : #ASTAndExprNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'shiftExpr',
		'andExpr',
		'andToken'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTAndExprNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitAndExpr: self
]

{ #category : #generated }
ASTAndExprNode >> andExpr [
	^ andExpr
]

{ #category : #generated }
ASTAndExprNode >> andExpr: anASTAndExprNode [
	self andExpr notNil
		ifTrue: [ self andExpr parent: nil ].
	andExpr := anASTAndExprNode.
	self andExpr notNil
		ifTrue: [ self andExpr parent: self ]
]

{ #category : #generated }
ASTAndExprNode >> andToken [
	^ andToken
]

{ #category : #generated }
ASTAndExprNode >> andToken: aSmaCCToken [
	andToken := aSmaCCToken
]

{ #category : #generated }
ASTAndExprNode >> nodeVariables [
	^ #(#shiftExpr #andExpr)
]

{ #category : #generated }
ASTAndExprNode >> shiftExpr [
	^ shiftExpr
]

{ #category : #generated }
ASTAndExprNode >> shiftExpr: anASTShiftExprNode [
	self shiftExpr notNil
		ifTrue: [ self shiftExpr parent: nil ].
	shiftExpr := anASTShiftExprNode.
	self shiftExpr notNil
		ifTrue: [ self shiftExpr parent: self ]
]

{ #category : #generated }
ASTAndExprNode >> tokenVariables [
	^ #(#andToken)
]
