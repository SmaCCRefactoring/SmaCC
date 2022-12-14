Class {
	#name : #CGLRDeclaratorNode,
	#superclass : #CGLRAbstractNode,
	#instVars : [
		'pointers',
		'qualifiers',
		'direct'
	],
	#category : 'SmaCC-C-Parser'
}

{ #category : #generated }
CGLRDeclaratorNode >> acceptVisitor: anAbstractVisitor [
	^ anAbstractVisitor visitDeclarator: self
]

{ #category : #generated }
CGLRDeclaratorNode >> compositeTokenVariables [
	^ #(#pointers #qualifiers)
]

{ #category : #generated }
CGLRDeclaratorNode >> direct [
	^ direct
]

{ #category : #generated }
CGLRDeclaratorNode >> direct: aCGLRAbstractNode [
	self direct notNil
		ifTrue: [ self direct parent: nil ].
	direct := aCGLRAbstractNode.
	self direct notNil
		ifTrue: [ self direct parent: self ]
]

{ #category : #'generated-initialize-release' }
CGLRDeclaratorNode >> initialize [
	super initialize.
	pointers := OrderedCollection new: 2.
	qualifiers := OrderedCollection new: 2.
]

{ #category : #generated }
CGLRDeclaratorNode >> nodeVariables [
	^ #(#direct)
]

{ #category : #generated }
CGLRDeclaratorNode >> pointers [
	^ pointers
]

{ #category : #generated }
CGLRDeclaratorNode >> pointers: anOrderedCollection [
	pointers := anOrderedCollection
]

{ #category : #generated }
CGLRDeclaratorNode >> qualifiers [
	^ qualifiers
]

{ #category : #generated }
CGLRDeclaratorNode >> qualifiers: anOrderedCollection [
	qualifiers := anOrderedCollection
]
