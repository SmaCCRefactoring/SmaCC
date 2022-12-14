Class {
	#name : #ASTStringLiteralsNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'sTRING_LITERALToken',
		'stringLiterals',
		'commaToken'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTStringLiteralsNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitStringLiterals: self
]

{ #category : #generated }
ASTStringLiteralsNode >> commaToken [
	^ commaToken
]

{ #category : #generated }
ASTStringLiteralsNode >> commaToken: aSmaCCToken [
	commaToken := aSmaCCToken
]

{ #category : #generated }
ASTStringLiteralsNode >> nodeVariables [
	^ #(#stringLiterals)
]

{ #category : #generated }
ASTStringLiteralsNode >> sTRING_LITERALToken [
	^ sTRING_LITERALToken
]

{ #category : #generated }
ASTStringLiteralsNode >> sTRING_LITERALToken: aSmaCCToken [
	sTRING_LITERALToken := aSmaCCToken
]

{ #category : #generated }
ASTStringLiteralsNode >> stringLiterals [
	^ stringLiterals
]

{ #category : #generated }
ASTStringLiteralsNode >> stringLiterals: anASTStringLiteralsNode [
	self stringLiterals notNil
		ifTrue: [ self stringLiterals parent: nil ].
	stringLiterals := anASTStringLiteralsNode.
	self stringLiterals notNil
		ifTrue: [ self stringLiterals parent: self ]
]

{ #category : #generated }
ASTStringLiteralsNode >> tokenVariables [
	^ #(#sTRING_LITERALToken #commaToken)
]
