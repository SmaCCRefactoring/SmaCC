Class {
	#name : #CGLRInitDeclaratorNode,
	#superclass : #CGLRAbstractNode,
	#instVars : [
		'declarator',
		'initializer',
		'equalToken'
	],
	#category : 'SmaCC-C-Parser'
}

{ #category : #generated }
CGLRInitDeclaratorNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitInitDeclarator: self
]

{ #category : #generated }
CGLRInitDeclaratorNode >> declarator [
	^ declarator
]

{ #category : #generated }
CGLRInitDeclaratorNode >> declarator: aCGLRDeclaratorNode [
	self declarator notNil
		ifTrue: [ self declarator parent: nil ].
	declarator := aCGLRDeclaratorNode.
	self declarator notNil
		ifTrue: [ self declarator parent: self ]
]

{ #category : #generated }
CGLRInitDeclaratorNode >> equalToken [
	^ equalToken
]

{ #category : #generated }
CGLRInitDeclaratorNode >> equalToken: aSmaCCToken [
	equalToken := aSmaCCToken
]

{ #category : #generated }
CGLRInitDeclaratorNode >> initializer [
	^ initializer
]

{ #category : #generated }
CGLRInitDeclaratorNode >> initializer: aCGLRAbstractNode [
	self initializer notNil
		ifTrue: [ self initializer parent: nil ].
	initializer := aCGLRAbstractNode.
	self initializer notNil
		ifTrue: [ self initializer parent: self ]
]

{ #category : #generated }
CGLRInitDeclaratorNode >> nodeVariables [
	^ #(#declarator #initializer)
]

{ #category : #generated }
CGLRInitDeclaratorNode >> tokenVariables [
	^ #(#equalToken)
]
