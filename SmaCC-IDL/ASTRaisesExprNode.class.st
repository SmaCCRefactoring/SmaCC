Class {
	#name : #ASTRaisesExprNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'raisesToken',
		'leftParenToken',
		'scopedNames',
		'rightParenToken'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTRaisesExprNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitRaisesExpr: self
]

{ #category : #generated }
ASTRaisesExprNode >> leftParenToken [
	^ leftParenToken
]

{ #category : #generated }
ASTRaisesExprNode >> leftParenToken: aSmaCCToken [
	leftParenToken := aSmaCCToken
]

{ #category : #generated }
ASTRaisesExprNode >> nodeVariables [
	^ #(#scopedNames)
]

{ #category : #generated }
ASTRaisesExprNode >> raisesToken [
	^ raisesToken
]

{ #category : #generated }
ASTRaisesExprNode >> raisesToken: aSmaCCToken [
	raisesToken := aSmaCCToken
]

{ #category : #generated }
ASTRaisesExprNode >> rightParenToken [
	^ rightParenToken
]

{ #category : #generated }
ASTRaisesExprNode >> rightParenToken: aSmaCCToken [
	rightParenToken := aSmaCCToken
]

{ #category : #generated }
ASTRaisesExprNode >> scopedNames [
	^ scopedNames
]

{ #category : #generated }
ASTRaisesExprNode >> scopedNames: anASTScopedNamesNode [
	self scopedNames notNil
		ifTrue: [ self scopedNames parent: nil ].
	scopedNames := anASTScopedNamesNode.
	self scopedNames notNil
		ifTrue: [ self scopedNames parent: self ]
]

{ #category : #generated }
ASTRaisesExprNode >> tokenVariables [
	^ #(#raisesToken #leftParenToken #rightParenToken)
]
