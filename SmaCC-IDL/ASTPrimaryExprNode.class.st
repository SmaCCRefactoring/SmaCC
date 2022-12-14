Class {
	#name : #ASTPrimaryExprNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'scopedName',
		'literal',
		'leftParenToken',
		'constExp',
		'rightParenToken'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTPrimaryExprNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitPrimaryExpr: self
]

{ #category : #generated }
ASTPrimaryExprNode >> constExp [
	^ constExp
]

{ #category : #generated }
ASTPrimaryExprNode >> constExp: anASTConstExpNode [
	self constExp notNil
		ifTrue: [ self constExp parent: nil ].
	constExp := anASTConstExpNode.
	self constExp notNil
		ifTrue: [ self constExp parent: self ]
]

{ #category : #generated }
ASTPrimaryExprNode >> leftParenToken [
	^ leftParenToken
]

{ #category : #generated }
ASTPrimaryExprNode >> leftParenToken: aSmaCCToken [
	leftParenToken := aSmaCCToken
]

{ #category : #generated }
ASTPrimaryExprNode >> literal [
	^ literal
]

{ #category : #generated }
ASTPrimaryExprNode >> literal: anASTLiteralNode [
	self literal notNil
		ifTrue: [ self literal parent: nil ].
	literal := anASTLiteralNode.
	self literal notNil
		ifTrue: [ self literal parent: self ]
]

{ #category : #generated }
ASTPrimaryExprNode >> nodeVariables [
	^ #(#scopedName #literal #constExp)
]

{ #category : #generated }
ASTPrimaryExprNode >> rightParenToken [
	^ rightParenToken
]

{ #category : #generated }
ASTPrimaryExprNode >> rightParenToken: aSmaCCToken [
	rightParenToken := aSmaCCToken
]

{ #category : #generated }
ASTPrimaryExprNode >> scopedName [
	^ scopedName
]

{ #category : #generated }
ASTPrimaryExprNode >> scopedName: anASTScopedNameNode [
	self scopedName notNil
		ifTrue: [ self scopedName parent: nil ].
	scopedName := anASTScopedNameNode.
	self scopedName notNil
		ifTrue: [ self scopedName parent: self ]
]

{ #category : #generated }
ASTPrimaryExprNode >> tokenVariables [
	^ #(#leftParenToken #rightParenToken)
]
