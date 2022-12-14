Class {
	#name : #CGLRFunctionPointerDeclaratorNode,
	#superclass : #CGLRAbstractNode,
	#instVars : [
		'declarator',
		'leftParenToken',
		'rightParenToken'
	],
	#category : 'SmaCC-C-Parser'
}

{ #category : #generated }
CGLRFunctionPointerDeclaratorNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitFunctionPointerDeclarator: self
]

{ #category : #generated }
CGLRFunctionPointerDeclaratorNode >> declarator [
	^ declarator
]

{ #category : #generated }
CGLRFunctionPointerDeclaratorNode >> declarator: aCGLRAbstractNode [
	self declarator notNil
		ifTrue: [ self declarator parent: nil ].
	declarator := aCGLRAbstractNode.
	self declarator notNil
		ifTrue: [ self declarator parent: self ]
]

{ #category : #generated }
CGLRFunctionPointerDeclaratorNode >> leftParenToken [
	^ leftParenToken
]

{ #category : #generated }
CGLRFunctionPointerDeclaratorNode >> leftParenToken: aSmaCCToken [
	leftParenToken := aSmaCCToken
]

{ #category : #generated }
CGLRFunctionPointerDeclaratorNode >> nodeVariables [
	^ #(#declarator)
]

{ #category : #generated }
CGLRFunctionPointerDeclaratorNode >> rightParenToken [
	^ rightParenToken
]

{ #category : #generated }
CGLRFunctionPointerDeclaratorNode >> rightParenToken: aSmaCCToken [
	rightParenToken := aSmaCCToken
]

{ #category : #generated }
CGLRFunctionPointerDeclaratorNode >> tokenVariables [
	^ #(#leftParenToken #rightParenToken)
]
