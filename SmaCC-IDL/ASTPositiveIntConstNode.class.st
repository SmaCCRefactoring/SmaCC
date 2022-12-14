Class {
	#name : #ASTPositiveIntConstNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'constExp'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTPositiveIntConstNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitPositiveIntConst: self
]

{ #category : #generated }
ASTPositiveIntConstNode >> constExp [
	^ constExp
]

{ #category : #generated }
ASTPositiveIntConstNode >> constExp: anASTConstExpNode [
	self constExp notNil
		ifTrue: [ self constExp parent: nil ].
	constExp := anASTConstExpNode.
	self constExp notNil
		ifTrue: [ self constExp parent: self ]
]

{ #category : #generated }
ASTPositiveIntConstNode >> nodeVariables [
	^ #(#constExp)
]
