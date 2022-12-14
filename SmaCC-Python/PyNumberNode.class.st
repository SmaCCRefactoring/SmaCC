Class {
	#name : #PyNumberNode,
	#superclass : #PyRootNode,
	#instVars : [
		'numberToken'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyNumberNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitNumber: self
]

{ #category : #generated }
PyNumberNode >> numberToken [
	^ numberToken
]

{ #category : #generated }
PyNumberNode >> numberToken: aSmaCCToken [
	numberToken := aSmaCCToken
]

{ #category : #generated }
PyNumberNode >> tokenVariables [
	^ #(#numberToken)
]
