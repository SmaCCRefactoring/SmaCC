Class {
	#name : #CGLREnumeratorNode,
	#superclass : #CGLRAbstractNode,
	#instVars : [
		'symbol',
		'expr',
		'equalToken'
	],
	#category : 'SmaCC-C-Parser'
}

{ #category : #generated }
CGLREnumeratorNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitEnumerator: self
]

{ #category : #generated }
CGLREnumeratorNode >> equalToken [
	^ equalToken
]

{ #category : #generated }
CGLREnumeratorNode >> equalToken: aSmaCCToken [
	equalToken := aSmaCCToken
]

{ #category : #generated }
CGLREnumeratorNode >> expr [
	^ expr
]

{ #category : #generated }
CGLREnumeratorNode >> expr: aCGLRAbstractNode [
	self expr notNil
		ifTrue: [ self expr parent: nil ].
	expr := aCGLRAbstractNode.
	self expr notNil
		ifTrue: [ self expr parent: self ]
]

{ #category : #generated }
CGLREnumeratorNode >> nodeVariables [
	^ #(#symbol #expr)
]

{ #category : #generated }
CGLREnumeratorNode >> symbol [
	^ symbol
]

{ #category : #generated }
CGLREnumeratorNode >> symbol: aCGLRIdentifierNode [
	self symbol notNil
		ifTrue: [ self symbol parent: nil ].
	symbol := aCGLRIdentifierNode.
	self symbol notNil
		ifTrue: [ self symbol parent: self ]
]

{ #category : #generated }
CGLREnumeratorNode >> tokenVariables [
	^ #(#equalToken)
]
