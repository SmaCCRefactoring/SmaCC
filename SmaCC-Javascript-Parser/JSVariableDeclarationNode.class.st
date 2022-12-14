Class {
	#name : #JSVariableDeclarationNode,
	#superclass : #JSProgramNode,
	#instVars : [
		'variable',
		'equalsToken',
		'value'
	],
	#category : 'SmaCC-Javascript-Parser'
}

{ #category : #generated }
JSVariableDeclarationNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitVariableDeclaration: self
]

{ #category : #generated }
JSVariableDeclarationNode >> equalsToken [
	^ equalsToken
]

{ #category : #generated }
JSVariableDeclarationNode >> equalsToken: aSmaCCToken [
	equalsToken := aSmaCCToken
]

{ #category : #generated }
JSVariableDeclarationNode >> nodeVariables [
	^ #(#value)
]

{ #category : #generated }
JSVariableDeclarationNode >> tokenVariables [
	^ #(#variable #equalsToken)
]

{ #category : #generated }
JSVariableDeclarationNode >> value [
	^ value
]

{ #category : #generated }
JSVariableDeclarationNode >> value: aJSExpressionNode [
	self value notNil
		ifTrue: [ self value parent: nil ].
	value := aJSExpressionNode.
	self value notNil
		ifTrue: [ self value parent: self ]
]

{ #category : #generated }
JSVariableDeclarationNode >> variable [
	^ variable
]

{ #category : #generated }
JSVariableDeclarationNode >> variable: aSmaCCToken [
	variable := aSmaCCToken
]
