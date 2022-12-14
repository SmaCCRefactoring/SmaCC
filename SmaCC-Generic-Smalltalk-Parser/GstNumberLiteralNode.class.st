Class {
	#name : #GstNumberLiteralNode,
	#superclass : #GstLiteralNode,
	#instVars : [
		'value'
	],
	#category : 'SmaCC-Generic-Smalltalk-Parser'
}

{ #category : #generated }
GstNumberLiteralNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitNumberLiteral: self
]

{ #category : #generated }
GstNumberLiteralNode >> tokenVariables [
	^ #(#value)
]

{ #category : #generated }
GstNumberLiteralNode >> value [
	^ value
]

{ #category : #generated }
GstNumberLiteralNode >> value: aSmaCCToken [
	value := aSmaCCToken
]
