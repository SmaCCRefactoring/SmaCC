Class {
	#name : #PyBreakNode,
	#superclass : #PyRootNode,
	#instVars : [
		'breakToken'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyBreakNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitBreak: self
]

{ #category : #generated }
PyBreakNode >> breakToken [
	^ breakToken
]

{ #category : #generated }
PyBreakNode >> breakToken: aSmaCCToken [
	breakToken := aSmaCCToken
]

{ #category : #generated }
PyBreakNode >> tokenVariables [
	^ #(#breakToken)
]
