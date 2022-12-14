Class {
	#name : #CGLRArrayNode,
	#superclass : #CGLRAbstractNode,
	#instVars : [
		'array',
		'lEFT_BLOCKToken',
		'rIGHT_BLOCKToken',
		'index'
	],
	#category : 'SmaCC-C-Parser'
}

{ #category : #generated }
CGLRArrayNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitArray: self
]

{ #category : #generated }
CGLRArrayNode >> array [
	^ array
]

{ #category : #generated }
CGLRArrayNode >> array: aCGLRAbstractNode [
	self array notNil
		ifTrue: [ self array parent: nil ].
	array := aCGLRAbstractNode.
	self array notNil
		ifTrue: [ self array parent: self ]
]

{ #category : #generated }
CGLRArrayNode >> index [
	^ index
]

{ #category : #generated }
CGLRArrayNode >> index: aCGLRExpressionNode [
	self index notNil
		ifTrue: [ self index parent: nil ].
	index := aCGLRExpressionNode.
	self index notNil
		ifTrue: [ self index parent: self ]
]

{ #category : #generated }
CGLRArrayNode >> lEFT_BLOCKToken [
	^ lEFT_BLOCKToken
]

{ #category : #generated }
CGLRArrayNode >> lEFT_BLOCKToken: aSmaCCToken [
	lEFT_BLOCKToken := aSmaCCToken
]

{ #category : #generated }
CGLRArrayNode >> nodeVariables [
	^ #(#array #index)
]

{ #category : #generated }
CGLRArrayNode >> rIGHT_BLOCKToken [
	^ rIGHT_BLOCKToken
]

{ #category : #generated }
CGLRArrayNode >> rIGHT_BLOCKToken: aSmaCCToken [
	rIGHT_BLOCKToken := aSmaCCToken
]

{ #category : #generated }
CGLRArrayNode >> tokenVariables [
	^ #(#lEFT_BLOCKToken #rIGHT_BLOCKToken)
]
