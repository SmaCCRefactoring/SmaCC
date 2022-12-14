Class {
	#name : #PySymbolNode,
	#superclass : #PyRootNode,
	#instVars : [
		'nameToken'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PySymbolNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitSymbol: self
]

{ #category : #generated }
PySymbolNode >> nameToken [
	^ nameToken
]

{ #category : #generated }
PySymbolNode >> nameToken: aSmaCCToken [
	nameToken := aSmaCCToken
]

{ #category : #generated }
PySymbolNode >> tokenVariables [
	^ #(#nameToken)
]
