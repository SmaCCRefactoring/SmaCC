Class {
	#name : #PyStmtNode,
	#superclass : #PyRootNode,
	#instVars : [
		'simple',
		'compound'
	],
	#category : 'SmaCC-Python'
}

{ #category : #generated }
PyStmtNode >> acceptVisitor: aRootVisitor [
	^ aRootVisitor visitStmt: self
]

{ #category : #generated }
PyStmtNode >> compound [
	^ compound
]

{ #category : #generated }
PyStmtNode >> compound: aPyRootNode [
	self compound notNil
		ifTrue: [ self compound parent: nil ].
	compound := aPyRootNode.
	self compound notNil
		ifTrue: [ self compound parent: self ]
]

{ #category : #generated }
PyStmtNode >> nodeVariables [
	^ #(#simple #compound)
]

{ #category : #generated }
PyStmtNode >> simple [
	^ simple
]

{ #category : #generated }
PyStmtNode >> simple: aPySimpleStmtNode [
	self simple notNil
		ifTrue: [ self simple parent: nil ].
	simple := aPySimpleStmtNode.
	self simple notNil
		ifTrue: [ self simple parent: self ]
]
