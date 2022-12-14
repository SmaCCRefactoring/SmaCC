Class {
	#name : #PyContinueNode,
	#superclass : #PyRootNode,
	#instVars : [
		'continueToken'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyContinueNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitContinue: self
]

{ #category : #generated }
PyContinueNode >> continueToken [
	^ continueToken
]

{ #category : #generated }
PyContinueNode >> continueToken: aSmaCCToken [
	continueToken := aSmaCCToken
]

{ #category : #generated }
PyContinueNode >> tokenVariables [
	^ #(#continueToken)
]
