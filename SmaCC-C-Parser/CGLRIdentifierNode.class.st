Class {
	#name : #CGLRIdentifierNode,
	#superclass : #CGLRAbstractNode,
	#instVars : [
		'symbol'
	],
	#category : 'SmaCC-C-Parser'
}

{ #category : #generated }
CGLRIdentifierNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitIdentifier: self
]

{ #category : #generated }
CGLRIdentifierNode >> symbol [
	^ symbol
]

{ #category : #generated }
CGLRIdentifierNode >> symbol: aSmaCCToken [
	symbol := aSmaCCToken
]

{ #category : #generated }
CGLRIdentifierNode >> tokenVariables [
	^ #(#symbol)
]
