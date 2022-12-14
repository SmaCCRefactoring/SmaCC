Class {
	#name : #CGLRStringLiteralNode,
	#superclass : #CGLRAbstractNode,
	#instVars : [
		'sTRING_LITERALToken'
	],
	#category : 'SmaCC-C-Parser'
}

{ #category : #generated }
CGLRStringLiteralNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitStringLiteral: self
]

{ #category : #generated }
CGLRStringLiteralNode >> sTRING_LITERALToken [
	^ sTRING_LITERALToken
]

{ #category : #generated }
CGLRStringLiteralNode >> sTRING_LITERALToken: aSmaCCToken [
	sTRING_LITERALToken := aSmaCCToken
]

{ #category : #generated }
CGLRStringLiteralNode >> tokenVariables [
	^ #(#sTRING_LITERALToken)
]
