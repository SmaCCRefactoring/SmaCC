Class {
	#name : #ASTMultExprNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'unaryExpr',
		'multExpr',
		'timesToken',
		'divideToken',
		'percentToken'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTMultExprNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitMultExpr: self
]

{ #category : #generated }
ASTMultExprNode >> divideToken [
	^ divideToken
]

{ #category : #generated }
ASTMultExprNode >> divideToken: aSmaCCToken [
	divideToken := aSmaCCToken
]

{ #category : #generated }
ASTMultExprNode >> multExpr [
	^ multExpr
]

{ #category : #generated }
ASTMultExprNode >> multExpr: anASTMultExprNode [
	self multExpr notNil
		ifTrue: [ self multExpr parent: nil ].
	multExpr := anASTMultExprNode.
	self multExpr notNil
		ifTrue: [ self multExpr parent: self ]
]

{ #category : #generated }
ASTMultExprNode >> nodeVariables [
	^ #(#unaryExpr #multExpr)
]

{ #category : #generated }
ASTMultExprNode >> percentToken [
	^ percentToken
]

{ #category : #generated }
ASTMultExprNode >> percentToken: aSmaCCToken [
	percentToken := aSmaCCToken
]

{ #category : #generated }
ASTMultExprNode >> timesToken [
	^ timesToken
]

{ #category : #generated }
ASTMultExprNode >> timesToken: aSmaCCToken [
	timesToken := aSmaCCToken
]

{ #category : #generated }
ASTMultExprNode >> tokenVariables [
	^ #(#timesToken #divideToken #percentToken)
]

{ #category : #generated }
ASTMultExprNode >> unaryExpr [
	^ unaryExpr
]

{ #category : #generated }
ASTMultExprNode >> unaryExpr: anASTUnaryExprNode [
	self unaryExpr notNil
		ifTrue: [ self unaryExpr parent: nil ].
	unaryExpr := anASTUnaryExprNode.
	self unaryExpr notNil
		ifTrue: [ self unaryExpr parent: self ]
]
