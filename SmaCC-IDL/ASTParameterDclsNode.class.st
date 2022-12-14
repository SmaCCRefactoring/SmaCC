Class {
	#name : #ASTParameterDclsNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'leftParenToken',
		'paramDcls',
		'rightParenToken'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTParameterDclsNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitParameterDcls: self
]

{ #category : #generated }
ASTParameterDclsNode >> leftParenToken [
	^ leftParenToken
]

{ #category : #generated }
ASTParameterDclsNode >> leftParenToken: aSmaCCToken [
	leftParenToken := aSmaCCToken
]

{ #category : #generated }
ASTParameterDclsNode >> nodeVariables [
	^ #(#paramDcls)
]

{ #category : #generated }
ASTParameterDclsNode >> paramDcls [
	^ paramDcls
]

{ #category : #generated }
ASTParameterDclsNode >> paramDcls: anASTParamDclsNode [
	self paramDcls notNil
		ifTrue: [ self paramDcls parent: nil ].
	paramDcls := anASTParamDclsNode.
	self paramDcls notNil
		ifTrue: [ self paramDcls parent: self ]
]

{ #category : #generated }
ASTParameterDclsNode >> rightParenToken [
	^ rightParenToken
]

{ #category : #generated }
ASTParameterDclsNode >> rightParenToken: aSmaCCToken [
	rightParenToken := aSmaCCToken
]

{ #category : #generated }
ASTParameterDclsNode >> tokenVariables [
	^ #(#leftParenToken #rightParenToken)
]
