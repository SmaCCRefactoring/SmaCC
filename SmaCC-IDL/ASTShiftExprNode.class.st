Class {
	#name : #ASTShiftExprNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'addExpr',
		'shiftExpr',
		'greaterThanGreaterThanToken',
		'lessThanLessThanToken'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTShiftExprNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitShiftExpr: self
]

{ #category : #generated }
ASTShiftExprNode >> addExpr [
	^ addExpr
]

{ #category : #generated }
ASTShiftExprNode >> addExpr: anASTAddExprNode [
	self addExpr notNil
		ifTrue: [ self addExpr parent: nil ].
	addExpr := anASTAddExprNode.
	self addExpr notNil
		ifTrue: [ self addExpr parent: self ]
]

{ #category : #generated }
ASTShiftExprNode >> greaterThanGreaterThanToken [
	^ greaterThanGreaterThanToken
]

{ #category : #generated }
ASTShiftExprNode >> greaterThanGreaterThanToken: aSmaCCToken [
	greaterThanGreaterThanToken := aSmaCCToken
]

{ #category : #generated }
ASTShiftExprNode >> lessThanLessThanToken [
	^ lessThanLessThanToken
]

{ #category : #generated }
ASTShiftExprNode >> lessThanLessThanToken: aSmaCCToken [
	lessThanLessThanToken := aSmaCCToken
]

{ #category : #generated }
ASTShiftExprNode >> nodeVariables [
	^ #(#addExpr #shiftExpr)
]

{ #category : #generated }
ASTShiftExprNode >> shiftExpr [
	^ shiftExpr
]

{ #category : #generated }
ASTShiftExprNode >> shiftExpr: anASTShiftExprNode [
	self shiftExpr notNil
		ifTrue: [ self shiftExpr parent: nil ].
	shiftExpr := anASTShiftExprNode.
	self shiftExpr notNil
		ifTrue: [ self shiftExpr parent: self ]
]

{ #category : #generated }
ASTShiftExprNode >> tokenVariables [
	^ #(#greaterThanGreaterThanToken #lessThanLessThanToken)
]
