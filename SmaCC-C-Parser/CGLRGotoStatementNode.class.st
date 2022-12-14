Class {
	#name : #CGLRGotoStatementNode,
	#superclass : #CGLRAbstractNode,
	#instVars : [
		'label',
		'gotoToken',
		'semicolonToken'
	],
	#category : 'SmaCC-C-Parser'
}

{ #category : #generated }
CGLRGotoStatementNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitGotoStatement: self
]

{ #category : #generated }
CGLRGotoStatementNode >> gotoToken [
	^ gotoToken
]

{ #category : #generated }
CGLRGotoStatementNode >> gotoToken: aSmaCCToken [
	gotoToken := aSmaCCToken
]

{ #category : #generated }
CGLRGotoStatementNode >> label [
	^ label
]

{ #category : #generated }
CGLRGotoStatementNode >> label: aCGLRIdentifierNode [
	self label notNil
		ifTrue: [ self label parent: nil ].
	label := aCGLRIdentifierNode.
	self label notNil
		ifTrue: [ self label parent: self ]
]

{ #category : #generated }
CGLRGotoStatementNode >> nodeVariables [
	^ #(#label)
]

{ #category : #generated }
CGLRGotoStatementNode >> semicolonToken [
	^ semicolonToken
]

{ #category : #generated }
CGLRGotoStatementNode >> semicolonToken: aSmaCCToken [
	semicolonToken := aSmaCCToken
]

{ #category : #generated }
CGLRGotoStatementNode >> tokenVariables [
	^ #(#gotoToken #semicolonToken)
]
