Class {
	#name : #PyPassNode,
	#superclass : #PyRootNode,
	#instVars : [
		'passToken'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyPassNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitPass: self
]

{ #category : #generated }
PyPassNode >> passToken [
	^ passToken
]

{ #category : #generated }
PyPassNode >> passToken: aSmaCCToken [
	passToken := aSmaCCToken
]

{ #category : #generated }
PyPassNode >> tokenVariables [
	^ #(#passToken)
]
