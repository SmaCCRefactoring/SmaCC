Class {
	#name : #ASTContextExprNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'contextToken',
		'leftParenToken',
		'stringLiterals',
		'rightParenToken'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTContextExprNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitContextExpr: self
]

{ #category : #generated }
ASTContextExprNode >> contextToken [
	^ contextToken
]

{ #category : #generated }
ASTContextExprNode >> contextToken: aSmaCCToken [
	contextToken := aSmaCCToken
]

{ #category : #generated }
ASTContextExprNode >> leftParenToken [
	^ leftParenToken
]

{ #category : #generated }
ASTContextExprNode >> leftParenToken: aSmaCCToken [
	leftParenToken := aSmaCCToken
]

{ #category : #generated }
ASTContextExprNode >> nodeVariables [
	^ #(#stringLiterals)
]

{ #category : #generated }
ASTContextExprNode >> rightParenToken [
	^ rightParenToken
]

{ #category : #generated }
ASTContextExprNode >> rightParenToken: aSmaCCToken [
	rightParenToken := aSmaCCToken
]

{ #category : #generated }
ASTContextExprNode >> stringLiterals [
	^ stringLiterals
]

{ #category : #generated }
ASTContextExprNode >> stringLiterals: anASTStringLiteralsNode [
	self stringLiterals notNil
		ifTrue: [ self stringLiterals parent: nil ].
	stringLiterals := anASTStringLiteralsNode.
	self stringLiterals notNil
		ifTrue: [ self stringLiterals parent: self ]
]

{ #category : #generated }
ASTContextExprNode >> tokenVariables [
	^ #(#contextToken #leftParenToken #rightParenToken)
]
