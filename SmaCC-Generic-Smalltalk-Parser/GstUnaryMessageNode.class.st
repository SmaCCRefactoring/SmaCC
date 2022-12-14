Class {
	#name : #GstUnaryMessageNode,
	#superclass : #GstMessageNode,
	#instVars : [
		'selectorPart'
	],
	#category : 'SmaCC-Generic-Smalltalk-Parser'
}

{ #category : #generated }
GstUnaryMessageNode >> acceptVisitor: aProgramVisitor [
	^ aProgramVisitor visitUnaryMessage: self
]

{ #category : #generated }
GstUnaryMessageNode >> selectorPart [
	^ selectorPart
]

{ #category : #generated }
GstUnaryMessageNode >> selectorPart: aSmaCCToken [
	selectorPart := aSmaCCToken
]

{ #category : #accessing }
GstUnaryMessageNode >> symbol [
	^ selectorPart value asSymbol
]

{ #category : #generated }
GstUnaryMessageNode >> tokenVariables [
	^ #(#selectorPart)
]
