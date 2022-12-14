Class {
	#name : #CGLRTypenameNode,
	#superclass : #CGLRAbstractNode,
	#instVars : [
		'symbol'
	],
	#category : 'SmaCC-C-Parser'
}

{ #category : #generated }
CGLRTypenameNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitTypename: self
]

{ #category : #generated }
CGLRTypenameNode >> symbol [
	^ symbol
]

{ #category : #generated }
CGLRTypenameNode >> symbol: aSmaCCToken [
	symbol := aSmaCCToken
]

{ #category : #generated }
CGLRTypenameNode >> tokenVariables [
	^ #(#symbol)
]
