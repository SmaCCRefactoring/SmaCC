Class {
	#name : #CGLRConstantNode,
	#superclass : #CGLRAbstractNode,
	#instVars : [
		'cONSTANTToken'
	],
	#category : 'SmaCC-C-Parser'
}

{ #category : #generated }
CGLRConstantNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitConstant: self
]

{ #category : #generated }
CGLRConstantNode >> cONSTANTToken [
	^ cONSTANTToken
]

{ #category : #generated }
CGLRConstantNode >> cONSTANTToken: aSmaCCToken [
	cONSTANTToken := aSmaCCToken
]

{ #category : #generated }
CGLRConstantNode >> tokenVariables [
	^ #(#cONSTANTToken)
]
