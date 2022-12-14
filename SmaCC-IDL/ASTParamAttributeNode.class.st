Class {
	#name : #ASTParamAttributeNode,
	#superclass : #ASTspecificationNode,
	#instVars : [
		'inToken',
		'outToken',
		'inoutToken'
	],
	#category : 'SmaCC-IDL'
}

{ #category : #generated }
ASTParamAttributeNode >> acceptVisitor: aspecificationVisitor [
	^ aspecificationVisitor visitParamAttribute: self
]

{ #category : #generated }
ASTParamAttributeNode >> inToken [
	^ inToken
]

{ #category : #generated }
ASTParamAttributeNode >> inToken: aSmaCCToken [
	inToken := aSmaCCToken
]

{ #category : #generated }
ASTParamAttributeNode >> inoutToken [
	^ inoutToken
]

{ #category : #generated }
ASTParamAttributeNode >> inoutToken: aSmaCCToken [
	inoutToken := aSmaCCToken
]

{ #category : #generated }
ASTParamAttributeNode >> outToken [
	^ outToken
]

{ #category : #generated }
ASTParamAttributeNode >> outToken: aSmaCCToken [
	outToken := aSmaCCToken
]

{ #category : #generated }
ASTParamAttributeNode >> tokenVariables [
	^ #(#inToken #outToken #inoutToken)
]
