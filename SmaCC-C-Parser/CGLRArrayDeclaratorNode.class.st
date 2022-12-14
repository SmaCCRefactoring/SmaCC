Class {
	#name : #CGLRArrayDeclaratorNode,
	#superclass : #CGLRAbstractNode,
	#instVars : [
		'declarator',
		'_size',
		'lEFT_BLOCKToken',
		'rIGHT_BLOCKToken'
	],
	#category : 'SmaCC-C-Parser'
}

{ #category : #generated }
CGLRArrayDeclaratorNode >> _size [
	^ _size
]

{ #category : #generated }
CGLRArrayDeclaratorNode >> _size: aCGLRAbstractNode [
	self _size notNil
		ifTrue: [ self _size parent: nil ].
	_size := aCGLRAbstractNode.
	self _size notNil
		ifTrue: [ self _size parent: self ]
]

{ #category : #generated }
CGLRArrayDeclaratorNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitArrayDeclarator: self
]

{ #category : #generated }
CGLRArrayDeclaratorNode >> declarator [
	^ declarator
]

{ #category : #generated }
CGLRArrayDeclaratorNode >> declarator: aCGLRAbstractNode [
	self declarator notNil
		ifTrue: [ self declarator parent: nil ].
	declarator := aCGLRAbstractNode.
	self declarator notNil
		ifTrue: [ self declarator parent: self ]
]

{ #category : #generated }
CGLRArrayDeclaratorNode >> lEFT_BLOCKToken [
	^ lEFT_BLOCKToken
]

{ #category : #generated }
CGLRArrayDeclaratorNode >> lEFT_BLOCKToken: aSmaCCToken [
	lEFT_BLOCKToken := aSmaCCToken
]

{ #category : #generated }
CGLRArrayDeclaratorNode >> nodeVariables [
	^ #(#declarator #_size)
]

{ #category : #generated }
CGLRArrayDeclaratorNode >> rIGHT_BLOCKToken [
	^ rIGHT_BLOCKToken
]

{ #category : #generated }
CGLRArrayDeclaratorNode >> rIGHT_BLOCKToken: aSmaCCToken [
	rIGHT_BLOCKToken := aSmaCCToken
]

{ #category : #generated }
CGLRArrayDeclaratorNode >> tokenVariables [
	^ #(#lEFT_BLOCKToken #rIGHT_BLOCKToken)
]
