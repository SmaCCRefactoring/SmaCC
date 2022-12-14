Class {
	#name : #GstCharacterLiteralNode,
	#superclass : #GstLiteralNode,
	#instVars : [
		'value'
	],
	#category : 'SmaCC-Generic-Smalltalk-Parser'
}

{ #category : #generated }
GstCharacterLiteralNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitCharacterLiteral: self
]

{ #category : #generated }
GstCharacterLiteralNode >> tokenVariables [
	^ #(#value)
]

{ #category : #generated }
GstCharacterLiteralNode >> value [
	^ value
]

{ #category : #generated }
GstCharacterLiteralNode >> value: aSmaCCToken [
	value := aSmaCCToken
]
