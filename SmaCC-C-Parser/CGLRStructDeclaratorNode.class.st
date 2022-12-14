Class {
	#name : #CGLRStructDeclaratorNode,
	#superclass : #CGLRAbstractNode,
	#instVars : [
		'declarator',
		'_size',
		'colonToken'
	],
	#category : 'SmaCC-C-Parser'
}

{ #category : #generated }
CGLRStructDeclaratorNode >> _size [
	^ _size
]

{ #category : #generated }
CGLRStructDeclaratorNode >> _size: aCGLRAbstractNode [
	self _size notNil
		ifTrue: [ self _size parent: nil ].
	_size := aCGLRAbstractNode.
	self _size notNil
		ifTrue: [ self _size parent: self ]
]

{ #category : #generated }
CGLRStructDeclaratorNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitStructDeclarator: self
]

{ #category : #generated }
CGLRStructDeclaratorNode >> colonToken [
	^ colonToken
]

{ #category : #generated }
CGLRStructDeclaratorNode >> colonToken: aSmaCCToken [
	colonToken := aSmaCCToken
]

{ #category : #generated }
CGLRStructDeclaratorNode >> declarator [
	^ declarator
]

{ #category : #generated }
CGLRStructDeclaratorNode >> declarator: aCGLRDeclaratorNode [
	self declarator notNil
		ifTrue: [ self declarator parent: nil ].
	declarator := aCGLRDeclaratorNode.
	self declarator notNil
		ifTrue: [ self declarator parent: self ]
]

{ #category : #generated }
CGLRStructDeclaratorNode >> nodeVariables [
	^ #(#declarator #_size)
]

{ #category : #generated }
CGLRStructDeclaratorNode >> tokenVariables [
	^ #(#colonToken)
]
